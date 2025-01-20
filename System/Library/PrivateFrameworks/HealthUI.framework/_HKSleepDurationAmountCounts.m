@interface _HKSleepDurationAmountCounts
- (int64_t)daysWithSleepData;
- (int64_t)totalDays;
- (void)setDaysWithSleepData:(int64_t)a3;
- (void)setTotalDays:(int64_t)a3;
@end

@implementation _HKSleepDurationAmountCounts

- (int64_t)daysWithSleepData
{
  return self->_daysWithSleepData;
}

- (void)setDaysWithSleepData:(int64_t)a3
{
  self->_daysWithSleepData = a3;
}

- (int64_t)totalDays
{
  return self->_totalDays;
}

- (void)setTotalDays:(int64_t)a3
{
  self->_totalDays = a3;
}

@end