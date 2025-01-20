@interface BWDeepFusionProcessorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)maxInputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)maxOutputDimensions;
- (BOOL)cmiResourceEnabled;
- (BOOL)delayPrepareAndCacheBuffers;
- (BOOL)quadraSupportEnabled;
- (NSDictionary)rawColorCalibrationsByPortType;
- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType;
- (float)gainMapMainImageDownscalingFactor;
- (int)semanticRenderingVersion;
- (int)stillImageFusionScheme;
- (void)dealloc;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setDelayPrepareAndCacheBuffers:(BOOL)a3;
- (void)setGainMapMainImageDownscalingFactor:(float)a3;
- (void)setMaxInputDimensions:(id)a3;
- (void)setMaxOutputDimensions:(id)a3;
- (void)setQuadraSupportEnabled:(BOOL)a3;
- (void)setRawColorCalibrationsByPortType:(id)a3;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3;
- (void)setSemanticRenderingVersion:(int)a3;
- (void)setStillImageFusionScheme:(int)a3;
@end

@implementation BWDeepFusionProcessorControllerConfiguration

- (int)stillImageFusionScheme
{
  return self->_stillImageFusionScheme;
}

- (void)setStillImageFusionScheme:(int)a3
{
  self->_stillImageFusionScheme = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
}

- (void)setQuadraSupportEnabled:(BOOL)a3
{
  self->_quadraSupportEnabled = a3;
}

- (void)setMaxOutputDimensions:(id)a3
{
  self->_maxOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setMaxInputDimensions:(id)a3
{
  self->_maxInputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (void)setDelayPrepareAndCacheBuffers:(BOOL)a3
{
  self->_delayPrepareAndCacheBuffers = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)maxOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxOutputDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)maxInputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxInputDimensions;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeepFusionProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (BOOL)quadraSupportEnabled
{
  return self->_quadraSupportEnabled;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (BOOL)delayPrepareAndCacheBuffers
{
  return self->_delayPrepareAndCacheBuffers;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

@end