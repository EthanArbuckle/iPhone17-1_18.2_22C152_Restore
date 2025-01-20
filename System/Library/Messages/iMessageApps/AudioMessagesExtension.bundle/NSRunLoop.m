@interface NSRunLoop
- (BOOL)rc_runUntilNextDisplayLinkEventWithTimeout:(double)a3;
@end

@implementation NSRunLoop

- (BOOL)rc_runUntilNextDisplayLinkEventWithTimeout:(double)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_24924;
  v10[3] = &unk_6D8A0;
  v10[4] = &v11;
  id v5 = +[CADisplayLink rc_displayWithFramesPerSecond:0 handlerBlock:v10];
  [v5 addToRunLoop:self forMode:NSRunLoopCommonModes];
  double Current = CFAbsoluteTimeGetCurrent();
  do
  {
    [(NSRunLoop *)self runUntilDate:+[NSDate dateWithTimeIntervalSinceNow:0.05]];
    if (*((unsigned char *)v12 + 24)) {
      break;
    }
    double v7 = CFAbsoluteTimeGetCurrent();
  }
  while (a3 < 0.0 || v7 - Current <= a3);
  [v5 invalidate];

  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

@end