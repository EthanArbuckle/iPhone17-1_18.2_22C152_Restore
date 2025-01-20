@interface BWMattingInferenceConfiguration
- (BOOL)refinedDepthDeliveryEnabled;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)sdofRenderingTuningParameters;
- (float)mainImageDownscalingFactor;
- (void)dealloc;
- (void)setMainImageDownscalingFactor:(float)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setRefinedDepthDeliveryEnabled:(BOOL)a3;
- (void)setSdofRenderingTuningParameters:(id)a3;
@end

@implementation BWMattingInferenceConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (BOOL)refinedDepthDeliveryEnabled
{
  return self->_refinedDepthDeliveryEnabled;
}

- (void)setRefinedDepthDeliveryEnabled:(BOOL)a3
{
  self->_refinedDepthDeliveryEnabled = a3;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)sdofRenderingTuningParameters
{
  return self->_sdofRenderingTuningParameters;
}

- (void)setSdofRenderingTuningParameters:(id)a3
{
}

@end