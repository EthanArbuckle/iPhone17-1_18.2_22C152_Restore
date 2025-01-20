@interface ADDisparityToDepthFitEstimatorParameters
- (ADDisparityToDepthFitEstimatorParameters)init;
- (BOOL)constantSlope;
- (BOOL)errorCalculationOnDisparity;
- (BOOL)smoothing;
- (double)minInlinersRatio;
- (double)threshold;
- (float)maxDepth;
- (float)minDepth;
- (float)retainedWorldPointsConfidenceThreshold;
- (float)smoothingWeight;
- (unint64_t)retainedWorldPointsCapacity;
- (unsigned)iterations;
- (unsigned)seed;
- (void)setConstantSlope:(BOOL)a3;
- (void)setErrorCalculationOnDisparity:(BOOL)a3;
- (void)setIterations:(unsigned int)a3;
- (void)setMaxDepth:(float)a3;
- (void)setMinDepth:(float)a3;
- (void)setMinInlinersRatio:(double)a3;
- (void)setRetainedWorldPointsCapacity:(unint64_t)a3;
- (void)setRetainedWorldPointsConfidenceThreshold:(float)a3;
- (void)setSeed:(unsigned int)a3;
- (void)setSmoothing:(BOOL)a3;
- (void)setSmoothingWeight:(float)a3;
- (void)setThreshold:(double)a3;
@end

@implementation ADDisparityToDepthFitEstimatorParameters

- (void)setRetainedWorldPointsConfidenceThreshold:(float)a3
{
  self->_retainedWorldPointsConfidenceThreshold = a3;
}

- (float)retainedWorldPointsConfidenceThreshold
{
  return self->_retainedWorldPointsConfidenceThreshold;
}

- (void)setRetainedWorldPointsCapacity:(unint64_t)a3
{
  self->_retainedWorldPointsCapacity = a3;
}

- (unint64_t)retainedWorldPointsCapacity
{
  return self->_retainedWorldPointsCapacity;
}

- (void)setErrorCalculationOnDisparity:(BOOL)a3
{
  self->_errorCalculationOnDisparity = a3;
}

- (BOOL)errorCalculationOnDisparity
{
  return self->_errorCalculationOnDisparity;
}

- (void)setSeed:(unsigned int)a3
{
  self->_seed = a3;
}

- (unsigned)seed
{
  return self->_seed;
}

- (void)setSmoothingWeight:(float)a3
{
  self->_smoothingWeight = a3;
}

- (float)smoothingWeight
{
  return self->_smoothingWeight;
}

- (void)setSmoothing:(BOOL)a3
{
  self->_smoothing = a3;
}

- (BOOL)smoothing
{
  return self->_smoothing;
}

- (void)setMaxDepth:(float)a3
{
  self->_maxDepth = a3;
}

- (float)maxDepth
{
  return self->_maxDepth;
}

- (void)setMinDepth:(float)a3
{
  self->_minDepth = a3;
}

- (float)minDepth
{
  return self->_minDepth;
}

- (void)setConstantSlope:(BOOL)a3
{
  self->_constantSlope = a3;
}

- (BOOL)constantSlope
{
  return self->_constantSlope;
}

- (void)setMinInlinersRatio:(double)a3
{
  self->_minInlinersRatio = a3;
}

- (double)minInlinersRatio
{
  return self->_minInlinersRatio;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setIterations:(unsigned int)a3
{
  self->_iterations = a3;
}

- (unsigned)iterations
{
  return self->_iterations;
}

- (ADDisparityToDepthFitEstimatorParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADDisparityToDepthFitEstimatorParameters;
  result = [(ADDisparityToDepthFitEstimatorParameters *)&v3 init];
  if (result)
  {
    result->_iterations = 100;
    *(_OWORD *)&result->_threshold = xmmword_215FC45D0;
    result->_constantSlope = 1;
    *(void *)&result->_minDepth = 0x40E000003F000000;
    *(_WORD *)&result->_smoothing = 0;
    result->_smoothingWeight = 0.7;
    *(void *)&result->_seed = 0x3DCCCCCD0000002ALL;
    result->_retainedWorldPointsCapacity = 900;
  }
  return result;
}

@end