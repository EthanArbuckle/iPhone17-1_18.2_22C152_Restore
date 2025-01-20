@interface SNSpeechEmotionResult
- (id)sr_dictionaryRepresentation;
@end

@implementation SNSpeechEmotionResult

- (id)sr_dictionaryRepresentation
{
  [(SNSpeechEmotionResult *)self confidence];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(SNSpeechEmotionResult *)self confidence];
  double v5 = v4;
  [(SNSpeechEmotionResult *)self confidence];
  if (self) {
    [(SNSpeechEmotionResult *)self timeRange];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CFStringRef v6 = @"inf";
  if (fabs(v5) != INFINITY) {
    CFStringRef v6 = (const __CFString *)v3;
  }
  CFStringRef v7 = v6;
  CFStringRef v8 = CMTimeRangeCopyDescription(kCFAllocatorDefault, &v11);
  v12[0] = @"mood";
  [(SNSpeechEmotionResult *)self mood];
  v13[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[1] = @"valence";
  [(SNSpeechEmotionResult *)self valence];
  v13[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[2] = @"arousal";
  [(SNSpeechEmotionResult *)self arousal];
  v13[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[3] = @"dominance";
  [(SNSpeechEmotionResult *)self dominance];
  v13[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[4] = v7;
  v12[4] = @"confidence";
  v12[5] = @"timeRange";
  v13[5] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
  CFRelease(v8);
  return v9;
}

@end