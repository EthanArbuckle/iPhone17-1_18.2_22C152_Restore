@interface AVScrubberVelocity
- (double)timestamp;
- (double)velocity;
- (void)setTimestamp:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation AVScrubberVelocity

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end