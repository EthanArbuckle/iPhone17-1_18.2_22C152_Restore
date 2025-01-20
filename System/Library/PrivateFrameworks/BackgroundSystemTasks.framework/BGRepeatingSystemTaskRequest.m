@interface BGRepeatingSystemTaskRequest
- (BGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3;
- (double)interval;
- (double)minDurationBetweenInstances;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInterval:(double)a3;
- (void)setMinDurationBetweenInstances:(double)a3;
@end

@implementation BGRepeatingSystemTaskRequest

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (double)interval
{
  return self->_interval;
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (BGRepeatingSystemTaskRequest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BGRepeatingSystemTaskRequest;
  return [(BGSystemTaskRequest *)&v4 initWithIdentifier:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BGRepeatingSystemTaskRequest;
  id v4 = [(BGSystemTaskRequest *)&v6 copyWithZone:a3];
  [(BGRepeatingSystemTaskRequest *)self interval];
  objc_msgSend(v4, "setInterval:");
  [(BGRepeatingSystemTaskRequest *)self minDurationBetweenInstances];
  objc_msgSend(v4, "setMinDurationBetweenInstances:");
  return v4;
}

@end