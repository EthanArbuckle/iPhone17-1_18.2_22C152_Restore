@interface HKMedicationDayInCycleResult
- (BOOL)isInPauseInterval;
- (HKMedicationDayInCycleResult)initWithDaysIntoCycle:(int64_t)a3 isInPauseInterval:(BOOL)a4;
- (int64_t)daysIntoCycle;
@end

@implementation HKMedicationDayInCycleResult

- (HKMedicationDayInCycleResult)initWithDaysIntoCycle:(int64_t)a3 isInPauseInterval:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicationDayInCycleResult;
  result = [(HKMedicationDayInCycleResult *)&v7 init];
  if (result)
  {
    result->_daysIntoCycle = a3;
    result->_isInPauseInterval = a4;
  }
  return result;
}

- (int64_t)daysIntoCycle
{
  return self->_daysIntoCycle;
}

- (BOOL)isInPauseInterval
{
  return self->_isInPauseInterval;
}

@end