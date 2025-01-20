@interface ADDisparityToDepthFitResult
- (ADDisparityToDepthFitResult)initWithDisparityToDepthMultiplier:(float)a3 disparityToDepthOffset:(float)a4;
- (float)disparityToDepthMultiplier;
- (float)disparityToDepthOffset;
@end

@implementation ADDisparityToDepthFitResult

- (float)disparityToDepthOffset
{
  return self->_disparityToDepthOffset;
}

- (float)disparityToDepthMultiplier
{
  return self->_disparityToDepthMultiplier;
}

- (ADDisparityToDepthFitResult)initWithDisparityToDepthMultiplier:(float)a3 disparityToDepthOffset:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ADDisparityToDepthFitResult;
  result = [(ADDisparityToDepthFitResult *)&v7 init];
  if (result)
  {
    result->_disparityToDepthMultiplier = a3;
    result->_disparityToDepthOffset = a4;
  }
  return result;
}

@end