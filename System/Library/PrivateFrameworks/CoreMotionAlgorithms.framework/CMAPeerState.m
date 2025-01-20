@interface CMAPeerState
- (double)timestamp;
- (unsigned)motionState;
- (void)setMotionState:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CMAPeerState

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(unsigned int)a3
{
  self->_motionState = a3;
}

@end