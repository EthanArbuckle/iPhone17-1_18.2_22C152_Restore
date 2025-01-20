@interface HMMDatedHomeLogEvent
- (HMMDatedHomeLogEvent)initWithHomeUUID:(id)a3;
- (HMMDatedHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)markEndTime;
@end

@implementation HMMDatedHomeLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (HMMDatedHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMMDatedHomeLogEvent;
  v4 = [(HMMHomeLogEvent *)&v8 initWithStartTime:a4 homeUUID:a3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v4->_startDate;
    v4->_startDate = (NSDate *)v5;
  }
  return v4;
}

- (void)markEndTime
{
  v5.receiver = self;
  v5.super_class = (Class)HMMDatedHomeLogEvent;
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

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)endDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMMDatedHomeLogEvent)initWithHomeUUID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMMDatedHomeLogEvent;
  v3 = [(HMMHomeLogEvent *)&v7 initWithHomeUUID:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v3->_startDate;
    v3->_startDate = (NSDate *)v4;
  }
  return v3;
}

@end