@interface THAButtonEvent
- (THAButton)button;
- (double)timestamp;
- (id)serialize;
- (unint64_t)state;
- (void)setButton:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation THAButtonEvent

- (void).cxx_destruct
{
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setButton:(id)a3
{
}

- (THAButton)button
{
  return self->_button;
}

- (id)serialize
{
  return 0;
}

@end