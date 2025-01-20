@interface VNImageBlurScoreRequestConfiguration
- (VNImageBlurScoreRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)blurDeterminationMethod;
- (unint64_t)maximumIntermediateSideLength;
- (void)setBlurDeterminationMethod:(unint64_t)a3;
- (void)setMaximumIntermediateSideLength:(unint64_t)a3;
@end

@implementation VNImageBlurScoreRequestConfiguration

- (void)setBlurDeterminationMethod:(unint64_t)a3
{
  self->_blurDeterminationMethod = a3;
}

- (unint64_t)blurDeterminationMethod
{
  return self->_blurDeterminationMethod;
}

- (void)setMaximumIntermediateSideLength:(unint64_t)a3
{
  self->_maximumIntermediateSideLength = a3;
}

- (unint64_t)maximumIntermediateSideLength
{
  return self->_maximumIntermediateSideLength;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageBlurScoreRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setMaximumIntermediateSideLength:self->_maximumIntermediateSideLength];
    [v5 setBlurDeterminationMethod:self->_blurDeterminationMethod];
  }
  return v5;
}

- (VNImageBlurScoreRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNImageBlurScoreRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_maximumIntermediateSideLength = 1024;
    result->_blurDeterminationMethod = 0;
  }
  return result;
}

@end