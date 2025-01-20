@interface NTKSnowglobeCrownHandler
- (double)currentRotation;
- (double)idleVelocity;
- (double)inputRotation;
- (void)setCurrentRotation:(double)a3;
- (void)setIdleVelocity:(double)a3;
- (void)setInputRotation:(double)a3;
- (void)step:(double)a3;
@end

@implementation NTKSnowglobeCrownHandler

- (void)step:(double)a3
{
  double v3 = self->_idleOffset + self->_idleVelocity * a3;
  double v4 = v3 + self->_inputRotation;
  self->_idleOffset = v3;
  self->_currentRotation = v4;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(double)a3
{
  self->_currentRotation = a3;
}

- (double)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(double)a3
{
  self->_inputRotation = a3;
}

- (double)idleVelocity
{
  return self->_idleVelocity;
}

- (void)setIdleVelocity:(double)a3
{
  self->_idleVelocity = a3;
}

@end