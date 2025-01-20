@interface HMMLogEvent
- (BOOL)confirmSubmission;
- (BOOL)isSubmitted;
- (BOOL)shouldSubmit;
- (HMMLogEvent)init;
- (HMMLogEvent)initWithStartTime:(double)a3;
- (NSError)error;
- (double)duration;
- (double)endTime;
- (double)startTime;
- (int64_t)durationMilliseconds;
- (void)markEndTime;
- (void)setError:(id)a3;
@end

@implementation HMMLogEvent

- (void).cxx_destruct
{
}

- (HMMLogEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMMLogEvent;
  v2 = [(HMMLogEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_submitted = 0;
    +[HMMLogEvent currentTime];
    v3->_startTime = v4;
  }
  return v3;
}

- (void)markEndTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_endTime == 0.0)
  {
    +[HMMLogEvent currentTime];
    self->_endTime = v4;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)confirmSubmission
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = !self->_submitted;
  self->_submitted = 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setError:(id)a3
{
}

- (HMMLogEvent)initWithStartTime:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMMLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result)
  {
    result->_submitted = 0;
    result->_startTime = a3;
  }
  return result;
}

- (double)startTime
{
  return self->_startTime;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)durationMilliseconds
{
  [(HMMLogEvent *)self duration];
  return (uint64_t)(v2 * 1000.0);
}

- (double)duration
{
  [(HMMLogEvent *)self endTime];
  double v4 = v3;
  [(HMMLogEvent *)self startTime];
  return v4 - v5;
}

- (double)endTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double endTime = self->_endTime;
  os_unfair_lock_unlock(p_lock);
  return endTime;
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (BOOL)isSubmitted
{
  double v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_submitted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

@end