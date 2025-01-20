@interface BWNRFProcessorControllerConfiguration
- (BOOL)alwaysAllowModifyingInputBuffers;
- (BOOL)cmiResourceEnabled;
- (BOOL)deepFusionEnabled;
- (BOOL)deepFusionWaitForProcessingToFinish;
- (BOOL)demosaicedRawEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)fusionEnabled;
- (BOOL)lowLightFusionEnabled;
- (BOOL)quadraSupportEnabled;
- (BOOL)rawNightModeEnabled;
- (BOOL)swfrEnabled;
- (BWVideoFormat)deepFusionInputFormat;
- (BWVideoFormat)inputFormat;
- (BWVideoFormat)learnedNRInputFormat;
- (BWVideoFormat)outputFormat;
- (BWVideoFormat)rawNightModeInputFormat;
- (NSDictionary)dimensionsByQSubResolutionFlavor;
- (NSDictionary)rawColorCalibrationsByPortType;
- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType;
- (float)gainMapMainImageDownscalingFactor;
- (int)greenGhostMitigationVersion;
- (int)semanticRenderingVersion;
- (unsigned)demosaicedRawPixelFormat;
- (unsigned)figThreadPriority;
- (unsigned)learnedNRMode;
- (void)dealloc;
- (void)setAlwaysAllowModifyingInputBuffers:(BOOL)a3;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setDeepFusionEnabled:(BOOL)a3;
- (void)setDeepFusionInputFormat:(id)a3;
- (void)setDeepFusionWaitForProcessingToFinish:(BOOL)a3;
- (void)setDemosaicedRawEnabled:(BOOL)a3;
- (void)setDemosaicedRawPixelFormat:(unsigned int)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDimensionsByQSubResolutionFlavor:(id)a3;
- (void)setFigThreadPriority:(unsigned int)a3;
- (void)setFusionEnabled:(BOOL)a3;
- (void)setGainMapMainImageDownscalingFactor:(float)a3;
- (void)setGreenGhostMitigationVersion:(int)a3;
- (void)setInputFormat:(id)a3;
- (void)setLearnedNRInputFormat:(id)a3;
- (void)setLearnedNRMode:(unsigned int)a3;
- (void)setLowLightFusionEnabled:(BOOL)a3;
- (void)setOutputFormat:(id)a3;
- (void)setQuadraSupportEnabled:(BOOL)a3;
- (void)setRawColorCalibrationsByPortType:(id)a3;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3;
- (void)setRawNightModeEnabled:(BOOL)a3;
- (void)setRawNightModeInputFormat:(id)a3;
- (void)setSemanticRenderingVersion:(int)a3;
- (void)setSwfrEnabled:(BOOL)a3;
@end

@implementation BWNRFProcessorControllerConfiguration

- (void)setSwfrEnabled:(BOOL)a3
{
  self->_swfrEnabled = a3;
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

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

- (void)setDemosaicedRawEnabled:(BOOL)a3
{
  self->_demosaicedRawEnabled = a3;
}

- (void)setDeepFusionWaitForProcessingToFinish:(BOOL)a3
{
  self->_deepFusionWaitForProcessingToFinish = a3;
}

- (void)setDeepFusionEnabled:(BOOL)a3
{
  self->_deepFusionEnabled = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- (void)setAlwaysAllowModifyingInputBuffers:(BOOL)a3
{
  self->_alwaysAllowModifyingInputBuffers = a3;
}

- (void)setRawNightModeEnabled:(BOOL)a3
{
  self->_rawNightModeEnabled = a3;
}

- (void)setLowLightFusionEnabled:(BOOL)a3
{
  self->_lowLightFusionEnabled = a3;
}

- (void)setOutputFormat:(id)a3
{
}

- (BOOL)demosaicedRawEnabled
{
  return self->_demosaicedRawEnabled;
}

- (void)setInputFormat:(id)a3
{
}

- (void)setDeepFusionInputFormat:(id)a3
{
}

- (BOOL)rawNightModeEnabled
{
  return self->_rawNightModeEnabled;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (void)setDimensionsByQSubResolutionFlavor:(id)a3
{
}

- (BOOL)lowLightFusionEnabled
{
  return self->_lowLightFusionEnabled;
}

- (unsigned)learnedNRMode
{
  return self->_learnedNRMode;
}

- (BOOL)fusionEnabled
{
  return self->_fusionEnabled;
}

- (BOOL)deepFusionEnabled
{
  return self->_deepFusionEnabled;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNRFProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (NSDictionary)dimensionsByQSubResolutionFlavor
{
  return self->_dimensionsByQSubResolutionFlavor;
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

- (BWVideoFormat)rawNightModeInputFormat
{
  return self->_rawNightModeInputFormat;
}

- (void)setRawNightModeInputFormat:(id)a3
{
}

- (BWVideoFormat)deepFusionInputFormat
{
  return self->_deepFusionInputFormat;
}

- (BOOL)deepFusionWaitForProcessingToFinish
{
  return self->_deepFusionWaitForProcessingToFinish;
}

- (BOOL)swfrEnabled
{
  return self->_swfrEnabled;
}

- (void)setLearnedNRMode:(unsigned int)a3
{
  self->_learnedNRMode = a3;
}

- (BWVideoFormat)learnedNRInputFormat
{
  return self->_learnedNRInputFormat;
}

- (void)setLearnedNRInputFormat:(id)a3
{
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  return self->_alwaysAllowModifyingInputBuffers;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

@end