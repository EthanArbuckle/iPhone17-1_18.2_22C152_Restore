@interface PADPose
- (double)pitch;
- (double)roll;
- (double)yaw;
- (void)setPitch:(double)a3;
- (void)setRoll:(double)a3;
- (void)setYaw:(double)a3;
@end

@implementation PADPose

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

@end