@interface MLCResizeGPUDeviceOps
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (BOOL)alignCorners;
- (BOOL)isSpecialCasedNearestForwardKernel;
- (MLCResizeGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (float)scaleFactorX;
- (float)scaleFactorY;
- (void)setAlignCorners:(BOOL)a3;
- (void)setIsSpecialCasedNearestForwardKernel:(BOOL)a3;
- (void)setScaleFactorX:(float)a3;
- (void)setScaleFactorY:(float)a3;
@end

@implementation MLCResizeGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v7 gradientKernel:v6];

  return v8;
}

- (MLCResizeGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MLCResizeGPUDeviceOps;
  result = [(MLCGPUDeviceOps *)&v5 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  if (result)
  {
    result->_scaleFactorX = 0.0;
    result->_scaleFactorY = 0.0;
  }
  return result;
}

- (float)scaleFactorX
{
  return self->_scaleFactorX;
}

- (void)setScaleFactorX:(float)a3
{
  self->_scaleFactorX = a3;
}

- (float)scaleFactorY
{
  return self->_scaleFactorY;
}

- (void)setScaleFactorY:(float)a3
{
  self->_scaleFactorY = a3;
}

- (BOOL)alignCorners
{
  return self->_alignCorners;
}

- (void)setAlignCorners:(BOOL)a3
{
  self->_alignCorners = a3;
}

- (BOOL)isSpecialCasedNearestForwardKernel
{
  return self->_isSpecialCasedNearestForwardKernel;
}

- (void)setIsSpecialCasedNearestForwardKernel:(BOOL)a3
{
  self->_isSpecialCasedNearestForwardKernel = a3;
}

@end