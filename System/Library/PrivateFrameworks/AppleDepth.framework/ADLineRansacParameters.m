@interface ADLineRansacParameters
- (ADLineRansacParameters)init;
- (BOOL)constantSlope;
- (BOOL)errorByY;
- (float)minInlinersRatio;
- (float)threshold;
- (int)maxIterations;
- (unsigned)seed;
- (void)setConstantSlope:(BOOL)a3;
- (void)setErrorByY:(BOOL)a3;
- (void)setMaxIterations:(int)a3;
- (void)setMinInlinersRatio:(float)a3;
- (void)setSeed:(unsigned int)a3;
- (void)setThreshold:(float)a3;
@end

@implementation ADLineRansacParameters

- (void)setErrorByY:(BOOL)a3
{
  self->_errorByY = a3;
}

- (BOOL)errorByY
{
  return self->_errorByY;
}

- (void)setSeed:(unsigned int)a3
{
  self->_seed = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setMinInlinersRatio:(float)a3
{
  self->_minInlinersRatio = a3;
}

- (float)minInlinersRatio
{
  return self->_minInlinersRatio;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setMaxIterations:(int)a3
{
  self->_maxIterations = a3;
}

- (int)maxIterations
{
  return self->_maxIterations;
}

- (void)setConstantSlope:(BOOL)a3
{
  self->_constantSlope = a3;
}

- (BOOL)constantSlope
{
  return self->_constantSlope;
}

- (ADLineRansacParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADLineRansacParameters;
  result = [(ADLineRansacParameters *)&v3 init];
  if (result)
  {
    result->_seed = 42;
    result->_maxIterations = 100;
    *(void *)&result->_threshold = 0x3F00000000000000;
    *(_WORD *)&result->_constantSlope = 0;
  }
  return result;
}

@end