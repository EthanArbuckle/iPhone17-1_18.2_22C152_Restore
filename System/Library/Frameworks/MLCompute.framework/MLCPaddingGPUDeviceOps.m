@interface MLCPaddingGPUDeviceOps
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (MLCPaddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (float)paddingValue;
- (id)paddingGradientAccumulateKernel;
- (int)paddingType;
- (void)setPaddingGradientAccumulateKernel:(id)a3;
- (void)setPaddingType:(int)a3;
- (void)setPaddingValue:(float)a3;
@end

@implementation MLCPaddingGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v7 gradientKernel:v6];

  return v8;
}

- (MLCPaddingGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MLCPaddingGPUDeviceOps;
  result = [(MLCGPUDeviceOps *)&v5 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  if (result)
  {
    result->_paddingType = 0;
    result->_paddingValue = 0.0;
  }
  return result;
}

- (int)paddingType
{
  return self->_paddingType;
}

- (void)setPaddingType:(int)a3
{
  self->_paddingType = a3;
}

- (float)paddingValue
{
  return self->_paddingValue;
}

- (void)setPaddingValue:(float)a3
{
  self->_paddingValue = a3;
}

- (id)paddingGradientAccumulateKernel
{
  return self->_paddingGradientAccumulateKernel;
}

- (void)setPaddingGradientAccumulateKernel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end