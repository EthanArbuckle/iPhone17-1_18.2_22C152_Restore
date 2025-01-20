@interface SASSpeechRecognized
- (id)ad_endTime;
- (id)ad_leadingSilence;
- (id)ad_speechEndTime;
- (id)ad_trailingSilence;
- (id)description;
@end

@implementation SASSpeechRecognized

- (id)ad_endTime
{
  v2 = [(SASSpeechRecognized *)self recognition];
  v3 = [v2 phrases];
  v4 = [v3 lastObject];
  v5 = [v4 interpretations];
  v6 = [v5 firstObject];
  v7 = [v6 tokens];
  v8 = [v7 lastObject];
  v9 = [v8 endTime];

  return v9;
}

- (id)ad_trailingSilence
{
  v3 = [(SASSpeechRecognized *)self ad_endTime];
  [v3 doubleValue];
  double v5 = v4;
  v6 = [(SASSpeechRecognized *)self ad_speechEndTime];
  [v6 doubleValue];
  v8 = +[NSNumber numberWithDouble:v5 - v7];

  return v8;
}

- (id)ad_speechEndTime
{
  v2 = [(SASSpeechRecognized *)self recognition];
  v3 = [v2 phrases];
  double v4 = [v3 lastObject];
  double v5 = [v4 interpretations];
  v6 = [v5 firstObject];
  double v7 = [v6 tokens];
  v8 = [v7 lastObject];
  v9 = [v8 silenceStartTime];

  return v9;
}

- (id)ad_leadingSilence
{
  v2 = [(SASSpeechRecognized *)self recognition];
  v3 = [v2 phrases];
  double v4 = [v3 firstObject];
  double v5 = [v4 interpretations];
  v6 = [v5 firstObject];
  double v7 = [v6 tokens];
  v8 = [v7 firstObject];
  v9 = [v8 startTime];

  return v9;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)SASSpeechRecognized;
  double v4 = [(SASSpeechRecognized *)&v8 description];
  double v5 = [(SASSpeechRecognized *)self af_bestTextInterpretation];
  id v6 = [v3 initWithFormat:@"%@ Recognition Text: \"%@\"", v4, v5];

  return v6;
}

@end