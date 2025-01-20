@interface HMMDatedLogEvent
- (HMMDatedLogEvent)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)markEndTime;
@end

@implementation HMMDatedLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)endDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)markEndTime
{
  v5.receiver = self;
  v5.super_class = (Class)HMMDatedLogEvent;
  [(HMMLogEvent *)&v5 markEndTime];
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    HMMLogEventEndDateAfterStartDate(self->_startDate);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v3;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMMDatedLogEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMDatedLogEvent;
  v2 = [(HMMLogEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;
  }
  return v2;
}

@end