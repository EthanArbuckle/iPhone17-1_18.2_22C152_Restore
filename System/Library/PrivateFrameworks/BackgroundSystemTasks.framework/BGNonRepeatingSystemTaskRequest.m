@interface BGNonRepeatingSystemTaskRequest
- (BGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3;
- (double)scheduleAfter;
- (double)trySchedulingBefore;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setScheduleAfter:(double)a3;
- (void)setTrySchedulingBefore:(double)a3;
@end

@implementation BGNonRepeatingSystemTaskRequest

- (BGNonRepeatingSystemTaskRequest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BGNonRepeatingSystemTaskRequest;
  return [(BGSystemTaskRequest *)&v4 initWithIdentifier:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BGNonRepeatingSystemTaskRequest;
  id v4 = [(BGSystemTaskRequest *)&v6 copyWithZone:a3];
  [(BGNonRepeatingSystemTaskRequest *)self scheduleAfter];
  objc_msgSend(v4, "setScheduleAfter:");
  [(BGNonRepeatingSystemTaskRequest *)self trySchedulingBefore];
  objc_msgSend(v4, "setTrySchedulingBefore:");
  return v4;
}

- (double)scheduleAfter
{
  return self->_scheduleAfter;
}

- (void)setScheduleAfter:(double)a3
{
  self->_scheduleAfter = a3;
}

- (double)trySchedulingBefore
{
  return self->_trySchedulingBefore;
}

- (void)setTrySchedulingBefore:(double)a3
{
  self->_trySchedulingBefore = a3;
}

@end