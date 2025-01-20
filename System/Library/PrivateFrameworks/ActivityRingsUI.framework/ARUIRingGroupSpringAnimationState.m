@interface ARUIRingGroupSpringAnimationState
- (double)friction;
- (double)tension;
- (void)setFriction:(double)a3;
- (void)setTension:(double)a3;
@end

@implementation ARUIRingGroupSpringAnimationState

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

@end