import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

//I have changed compileSdkVersion 28 in build.grdle file

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //NOTES:
//First I was having one class inhrit from statelesswidget
//stateLessWidget: can't rerun the build() function when its properties changed
//so we changed the class to state, and made a new class inhiret from StatefulWidget
//StatefulWidget: can re run the build() function
//we connected the 2 classes by state<statfulWidgetClass> , and by calling createState() in statfulWidget class
//till now we did not tell flutter to re render the page
// so, we put the code which we want to re render into setState() function (something like ajax)
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      },
    ];

     return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>) //here I itrate for the list of answers and map it is a var a to put it in the text of button
                .map((a) {
              return Answer(_answerQuestion, a);
            }).toList()
          ],
        ),
      ),
    );
  }
}
