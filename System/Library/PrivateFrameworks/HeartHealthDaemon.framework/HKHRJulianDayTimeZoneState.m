@interface HKHRJulianDayTimeZoneState
- (HKHRJulianDayTimeZoneState)init;
- (NSDate)lastSampleDate;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setLastSampleDate:(id)a3;
@end

@implementation HKHRJulianDayTimeZoneState

- (HKHRJulianDayTimeZoneState)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKHRJulianDayTimeZoneState;
  v2 = [(HKHRJulianDayTimeZoneState *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_count = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastSampleDate = v3->_lastSampleDate;
    v3->_lastSampleDate = (NSDate *)v4;
  }
  return v3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)lastSampleDate
{
  return self->_lastSampleDate;
}

- (void)setLastSampleDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end