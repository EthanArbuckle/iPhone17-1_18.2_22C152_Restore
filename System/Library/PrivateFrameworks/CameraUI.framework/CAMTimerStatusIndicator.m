@interface CAMTimerStatusIndicator
- (BOOL)canShowValue;
- (id)imageNameForCurrentState;
- (id)valueText;
- (int64_t)timerDuration;
- (void)setTimerDuration:(int64_t)a3;
@end

@implementation CAMTimerStatusIndicator

- (void)setTimerDuration:(int64_t)a3
{
  if (self->_timerDuration != a3)
  {
    self->_timerDuration = a3;
    if (a3) {
      [(CAMControlStatusIndicator *)self setNeedsUpdateValueText];
    }
  }
}

- (BOOL)canShowValue
{
  return 1;
}

- (id)valueText
{
  unint64_t v2 = [(CAMTimerStatusIndicator *)self timerDuration] - 1;
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_209C7B6C0[v2];
  }
  v4 = [(id)objc_opt_class() integerFormatter];
  v5 = [NSNumber numberWithUnsignedInteger:v3];
  v6 = [v4 stringFromNumber:v5];

  v7 = CAMLocalizedFrameworkString(@"TIMER_DURATION_TEXT", 0);
  v8 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v6 validFormatSpecifiers error];

  return v8;
}

- (id)imageNameForCurrentState
{
  return @"timer";
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

@end