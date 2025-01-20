@interface TIDebugValue
- (float)defaultValue;
- (float)stepSize;
- (float)sweepMax;
- (float)sweepMin;
- (float)sweepValue;
- (void)setDefaultValue:(float)a3;
- (void)setStepSize:(float)a3;
- (void)setSweepMax:(float)a3;
- (void)setSweepMin:(float)a3;
- (void)setSweepValue:(float)a3;
@end

@implementation TIDebugValue

- (float)defaultValue
{
  return self->defaultValue;
}

- (void)setDefaultValue:(float)a3
{
  self->defaultValue = a3;
}

- (float)sweepValue
{
  return self->sweepValue;
}

- (void)setSweepValue:(float)a3
{
  self->sweepValue = a3;
}

- (float)sweepMin
{
  return self->sweepMin;
}

- (void)setSweepMin:(float)a3
{
  self->sweepMin = a3;
}

- (float)sweepMax
{
  return self->sweepMax;
}

- (void)setSweepMax:(float)a3
{
  self->sweepMax = a3;
}

- (float)stepSize
{
  return self->stepSize;
}

- (void)setStepSize:(float)a3
{
  self->stepSize = a3;
}

@end