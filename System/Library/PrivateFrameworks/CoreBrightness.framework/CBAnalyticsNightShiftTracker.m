@interface CBAnalyticsNightShiftTracker
- (BOOL)isStarted;
- (CBAnalyticsNightShiftTracker)init;
- (void)start:(BOOL)a3;
- (void)stop:(int)a3 isEnabled:(BOOL)a4;
- (void)update:(int)a3 isEnabled:(BOOL)a4;
@end

@implementation CBAnalyticsNightShiftTracker

- (CBAnalyticsNightShiftTracker)init
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBAnalyticsNightShiftTracker;
  v5 = [(CBAnalyticsNightShiftTracker *)&v3 init];
  if (v5) {
    v5->_modeChangeTimestamp = NAN;
  }
  return v5;
}

- (void)start:(BOOL)a3
{
  BOOL v3 = a3;
  self->_modeChangeTimestamp = CFAbsoluteTimeGetCurrent();
  self->_isEnabled = v3;
}

- (BOOL)isStarted
{
  return 1;
}

- (void)stop:(int)a3 isEnabled:(BOOL)a4
{
  self->_modeChangeTimestamp = NAN;
}

- (void)update:(int)a3 isEnabled:(BOOL)a4
{
  v9 = self;
  SEL v8 = a2;
  int v7 = a3;
  BOOL v6 = a4;
  context = (void *)MEMORY[0x1BA9ECAE0]();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double modeChangeTimestamp = v9->_modeChangeTimestamp;
  v9->_double modeChangeTimestamp = Current;
  +[CBAnalytics send:withBlock:](CBAnalytics, "send:withBlock:", @".NightShift.Usage");
  v9->_isEnabled = v6;
}

uint64_t __49__CBAnalyticsNightShiftTracker_update_isEnabled___block_invoke(uint64_t a1)
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"mode";
  v4[0] = [NSNumber numberWithInteger:*(unsigned int *)(a1 + 48)];
  v3[1] = @"time";
  v4[1] = [NSNumber numberWithDouble:*(double *)(a1 + 40) * 1000.0];
  v3[2] = @"enabled";
  v4[2] = [NSNumber numberWithBool:*(unsigned char *)(*(void *)(a1 + 32) + 16) & 1];
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
}

@end