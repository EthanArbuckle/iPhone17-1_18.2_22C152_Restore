@interface HKStateMachinePendingEvent
- (NSDate)date;
- (NSError)error;
- (id)completion;
- (int64_t)event;
- (void)setCompletion:(id)a3;
- (void)setDate:(id)a3;
- (void)setError:(id)a3;
- (void)setEvent:(int64_t)a3;
@end

@implementation HKStateMachinePendingEvent

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end