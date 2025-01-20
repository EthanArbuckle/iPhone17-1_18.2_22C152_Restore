@interface BWDeferredProcessorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)ultraHighResolutionSensorRawDimensions;
- (float)inferenceMainImageDownscalingFactor;
- (void)setInferenceMainImageDownscalingFactor:(float)a3;
- (void)setUltraHighResolutionSensorRawDimensions:(id)a3;
@end

@implementation BWDeferredProcessorControllerConfiguration

- (void)setUltraHighResolutionSensorRawDimensions:(id)a3
{
  self->_ultraHighResolutionSensorRawDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setInferenceMainImageDownscalingFactor:(float)a3
{
  self->_inferenceMainImageDownscalingFactor = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)ultraHighResolutionSensorRawDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_ultraHighResolutionSensorRawDimensions;
}

- (float)inferenceMainImageDownscalingFactor
{
  return self->_inferenceMainImageDownscalingFactor;
}

@end