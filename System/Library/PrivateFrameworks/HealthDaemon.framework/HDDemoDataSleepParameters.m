@interface HDDemoDataSleepParameters
- (double)bedtime;
- (double)wakeUpTime;
- (int64_t)bedtimeGoalHour;
- (int64_t)wakeUpTimeGoalHour;
- (void)setBedtime:(double)a3;
- (void)setBedtimeGoalHour:(int64_t)a3;
- (void)setWakeUpTime:(double)a3;
- (void)setWakeUpTimeGoalHour:(int64_t)a3;
@end

@implementation HDDemoDataSleepParameters

- (double)bedtime
{
  return self->_bedtime;
}

- (void)setBedtime:(double)a3
{
  self->_bedtime = a3;
}

- (int64_t)bedtimeGoalHour
{
  return self->_bedtimeGoalHour;
}

- (void)setBedtimeGoalHour:(int64_t)a3
{
  self->_bedtimeGoalHour = a3;
}

- (double)wakeUpTime
{
  return self->_wakeUpTime;
}

- (void)setWakeUpTime:(double)a3
{
  self->_wakeUpTime = a3;
}

- (int64_t)wakeUpTimeGoalHour
{
  return self->_wakeUpTimeGoalHour;
}

- (void)setWakeUpTimeGoalHour:(int64_t)a3
{
  self->_wakeUpTimeGoalHour = a3;
}

@end