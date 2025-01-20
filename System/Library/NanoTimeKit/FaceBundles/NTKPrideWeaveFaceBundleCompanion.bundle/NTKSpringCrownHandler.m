@interface NTKSpringCrownHandler
- (NTKSpringCrownHandler)init;
- (NTKSpringCrownHandler)initWithConfig:(id *)a3;
- (double)currentPosition;
- (double)currentRotation;
- (double)inputPosition;
- (double)inputRotation;
- (double)inputStaticRotationalVelocity;
- (void)setCurrentPosition:(double)a3;
- (void)setCurrentRotation:(double)a3;
- (void)setInputPosition:(double)a3;
- (void)setInputRotation:(double)a3;
- (void)setInputStaticRotationalVelocity:(double)a3;
- (void)stepSystem:(double)a3;
@end

@implementation NTKSpringCrownHandler

- (NTKSpringCrownHandler)initWithConfig:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSpringCrownHandler;
  result = [(NTKSpringCrownHandler *)&v5 init];
  if (result)
  {
    result->_k = a3->var0;
    result->_c = a3->var1;
    result->_m = a3->var2;
    result->_ke = a3->var3;
    result->_kr = a3->var4;
  }
  return result;
}

- (NTKSpringCrownHandler)init
{
  v3[0] = xmmword_1DCD0;
  v3[1] = xmmword_1DCE0;
  uint64_t v4 = 0x3FEFAE147AE147AELL;
  return [(NTKSpringCrownHandler *)self initWithConfig:v3];
}

- (void)stepSystem:(double)a3
{
  double currentPosition = self->_currentPosition;
  double v6 = -((currentPosition - self->_inputPosition) * self->_k);
  if (currentPosition >= 1.0)
  {
    double v7 = -(pow(20.0, currentPosition + -1.0) + -1.0);
    goto LABEL_5;
  }
  if (currentPosition <= -1.0)
  {
    double v7 = pow(20.0, fabs(currentPosition + 1.0)) + -1.0;
LABEL_5:
    double v6 = v6 + v7 * self->_ke;
  }
  double currentRotationOffset = self->_currentRotationOffset;
  double inputRotation = self->_inputRotation;
  double v10 = (1.0 - self->_kr) * self->_inputStaticRotationalVelocity + self->_kr * self->_currentRotationalVelocity;
  double v11 = self->_currentVelocity + (v6 - self->_currentVelocity * self->_c) / self->_m * a3;
  self->_double currentPosition = currentPosition + v11 * a3;
  self->_currentVelocity = v11;
  double v12 = currentRotationOffset + a3 * v10;
  self->_double currentRotationOffset = v12;
  self->_currentRotationalVelocity = v10;
  self->_currentRotation = v12 + inputRotation;
}

- (double)inputPosition
{
  return self->_inputPosition;
}

- (void)setInputPosition:(double)a3
{
  self->_inputPosition = a3;
}

- (double)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(double)a3
{
  self->_double currentPosition = a3;
}

- (double)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(double)a3
{
  self->_double inputRotation = a3;
}

- (double)inputStaticRotationalVelocity
{
  return self->_inputStaticRotationalVelocity;
}

- (void)setInputStaticRotationalVelocity:(double)a3
{
  self->_inputStaticRotationalVelocity = a3;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(double)a3
{
  self->_currentRotation = a3;
}

@end