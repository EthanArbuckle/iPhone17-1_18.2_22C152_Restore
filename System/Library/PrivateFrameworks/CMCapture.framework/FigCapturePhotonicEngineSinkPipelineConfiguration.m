@interface FigCapturePhotonicEngineSinkPipelineConfiguration
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions;
- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions;
- ($2825F4736939C4A6D3AD43837233062D)downgradedDeepFusionEnhancedResolutionDimensions;
- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions;
- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)smartStyleLinearThumbnailDimensions;
- ($2825F4736939C4A6D3AD43837233062D)smartStyleStyledThumbnailDimensions;
- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions;
- (BOOL)adjustablePortraitLightingEffectStrengthSupported;
- (BOOL)captureTimePhotosCurationSupported;
- (BOOL)constantColorClippingRecoveryEnabled;
- (BOOL)constantColorSaturationBoostEnabled;
- (BOOL)continuousZoomWithDepthSupported;
- (BOOL)dcProcessingWithDepthSupported;
- (BOOL)deepFusionSupported;
- (BOOL)deferredProcessingSupported;
- (BOOL)depthWithDeepFusionSupported;
- (BOOL)deviceHasFlash;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)gdcInDCProcessorSupported;
- (BOOL)generateInferencesForSemanticProcessingIfNeeded;
- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)learnedNRSupported;
- (BOOL)quadraProcessingSupportEnabled;
- (BOOL)responsiveShutterEnabled;
- (BOOL)responsiveShutterSupported;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)sifrStillImageCaptureEnabledIfAvailable;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)softISPSupported;
- (BOOL)ultraHighResolutionProcessingEnabled;
- (CGPoint)sensorCenterOffset;
- (FigCapturePhotonicEngineSinkPipelineConfiguration)initWithCoder:(id)a3;
- (NSArray)enabledSemanticSegmentationMatteURNs;
- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled;
- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled;
- (NSArray)portTypesWithRawNightModeEnabled;
- (NSArray)supportedSemanticSegmentationMatteURNs;
- (NSDictionary)baseZoomFactorsByPortType;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType;
- (NSDictionary)moduleCalibrationByPortType;
- (NSDictionary)rawColorCalibrationsByPortType;
- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType;
- (NSDictionary)sensorIDStringsByPortType;
- (float)gainMapMainImageDownscalingFactor;
- (float)ubInferenceMainImageDownscalingFactor;
- (int)constantColorVersion;
- (int)dcProcessorVersion;
- (int)deepZoomMode;
- (int)deepZoomVersion;
- (int)depthDataType;
- (int)devicePosition;
- (int)deviceType;
- (int)greenGhostMitigationVersion;
- (int)maxLossyCompressionLevel;
- (int)pearlModuleType;
- (int)redEyeReductionVersion;
- (int)semanticDevelopmentVersion;
- (int)semanticRenderingVersion;
- (int)smartStyleRenderingVersion;
- (int)stillImageGDCSourceMode;
- (int)stillImageSinkPipelineProcessingMode;
- (int)swfrVersion;
- (unsigned)demosaicedRawPixelFormat;
- (unsigned)inferencePriority;
- (unsigned)pipelineStagePriority;
- (unsigned)sensorRawPixelFormat;
- (unsigned)sfhrMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3;
- (void)setBaseZoomFactorsByPortType:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3;
- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3;
- (void)setConstantColorConfidenceMapDimensions:(id)a3;
- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3;
- (void)setConstantColorVersion:(int)a3;
- (void)setContinuousZoomWithDepthSupported:(BOOL)a3;
- (void)setDcProcessingWithDepthSupported:(BOOL)a3;
- (void)setDcProcessorVersion:(int)a3;
- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3;
- (void)setDeepFusionSupported:(BOOL)a3;
- (void)setDeepZoomMode:(int)a3;
- (void)setDeepZoomVersion:(int)a3;
- (void)setDeferredProcessingSupported:(BOOL)a3;
- (void)setDemosaicedRawPixelFormat:(unsigned int)a3;
- (void)setDepthDataType:(int)a3;
- (void)setDepthWithDeepFusionSupported:(BOOL)a3;
- (void)setDeviceHasFlash:(BOOL)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDeviceType:(int)a3;
- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3;
- (void)setDowngradedDeepFusionEnhancedResolutionDimensions:(id)a3;
- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setGainMapMainImageDownscalingFactor:(float)a3;
- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3;
- (void)setGdcInDCProcessorSupported:(BOOL)a3;
- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3;
- (void)setGreenGhostMitigationVersion:(int)a3;
- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3;
- (void)setInferencePriority:(unsigned int)a3;
- (void)setLearnedNRSupported:(BOOL)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setModuleCalibrationByPortType:(id)a3;
- (void)setOutputStillImageDimensions:(id)a3;
- (void)setPearlModuleType:(int)a3;
- (void)setPipelineStagePriority:(unsigned int)a3;
- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3;
- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3;
- (void)setPortTypesWithRawNightModeEnabled:(id)a3;
- (void)setQuadraProcessingSupportEnabled:(BOOL)a3;
- (void)setRawColorCalibrationsByPortType:(id)a3;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3;
- (void)setRawSensorDimensions:(id)a3;
- (void)setRedEyeReductionVersion:(int)a3;
- (void)setResponsiveShutterEnabled:(BOOL)a3;
- (void)setResponsiveShutterSupported:(BOOL)a3;
- (void)setSemanticDevelopmentVersion:(int)a3;
- (void)setSemanticRenderingVersion:(int)a3;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSensorCenterOffset:(CGPoint)a3;
- (void)setSensorIDStringsByPortType:(id)a3;
- (void)setSensorRawPixelFormat:(unsigned int)a3;
- (void)setSfhrMode:(unsigned int)a3;
- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3;
- (void)setSmartStyleLinearThumbnailDimensions:(id)a3;
- (void)setSmartStyleRenderingVersion:(int)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setSmartStyleStyledThumbnailDimensions:(id)a3;
- (void)setSoftISPSupported:(BOOL)a3;
- (void)setStereoPhotoOutputDimensions:(id)a3;
- (void)setStillImageGDCSourceMode:(int)a3;
- (void)setStillImageSinkPipelineProcessingMode:(int)a3;
- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3;
- (void)setSwfrVersion:(int)a3;
- (void)setUbInferenceMainImageDownscalingFactor:(float)a3;
- (void)setUltraHighResolutionProcessingEnabled:(BOOL)a3;
@end

@implementation FigCapturePhotonicEngineSinkPipelineConfiguration

- (BOOL)deepFusionSupported
{
  return self->_deepFusionSupported;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- (BOOL)softISPSupported
{
  return self->_softISPSupported;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (int)stillImageSinkPipelineProcessingMode
{
  return self->_stillImageSinkPipelineProcessingMode;
}

- (int)constantColorVersion
{
  return self->_constantColorVersion;
}

- (unsigned)pipelineStagePriority
{
  return self->_pipelineStagePriority;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (BOOL)sifrStillImageCaptureEnabledIfAvailable
{
  return self->_sifrStillImageCaptureEnabledIfAvailable;
}

- (NSDictionary)sensorIDStringsByPortType
{
  return self->_sensorIDStringsByPortType;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setModuleCalibrationByPortType:(id)a3
{
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
}

- (void)setUbInferenceMainImageDownscalingFactor:(float)a3
{
  self->_ubInferenceMainImageDownscalingFactor = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_sensorRawPixelFormat = a3;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setQuadraProcessingSupportEnabled:(BOOL)a3
{
  self->_quadraProcessingSupportEnabled = a3;
}

- (void)setPipelineStagePriority:(unsigned int)a3
{
  self->_pipelineStagePriority = a3;
}

- (void)setInferencePriority:(unsigned int)a3
{
  self->_inferencePriority = a3;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_deepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)gdcInDCProcessorSupported
{
  return self->_gdcInDCProcessorSupported;
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setSensorIDStringsByPortType:(id)a3
{
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void)setUltraHighResolutionProcessingEnabled:(BOOL)a3
{
  self->_ultraHighResolutionProcessingEnabled = a3;
}

- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3
{
  self->_sifrStillImageCaptureEnabledIfAvailable = a3;
}

- (void)setSwfrVersion:(int)a3
{
  self->_swfrVersion = a3;
}

- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3
{
}

- (void)setStillImageSinkPipelineProcessingMode:(int)a3
{
  self->_stillImageSinkPipelineProcessingMode = a3;
}

- (void)setStillImageGDCSourceMode:(int)a3
{
  self->_stillImageGDCSourceMode = a3;
}

- (void)setSoftISPSupported:(BOOL)a3
{
  self->_softISPSupported = a3;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (void)setSfhrMode:(unsigned int)a3
{
  self->_sfhrMode = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (void)setResponsiveShutterSupported:(BOOL)a3
{
  self->_responsiveShutterSupported = a3;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
}

- (void)setRedEyeReductionVersion:(int)a3
{
  self->_redEyeReductionVersion = a3;
}

- (void)setPortTypesWithRawNightModeEnabled:(id)a3
{
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  self->_maxLossyCompressionLevel = a3;
}

- (void)setLearnedNRSupported:(BOOL)a3
{
  self->_learnedNRSupported = a3;
}

- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3
{
  self->_highQualityPhotoCaptureForVideoFormatEnabled = a3;
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3
{
  self->_generateInferencesForSemanticProcessingIfNeeded = a3;
}

- (void)setGdcInDCProcessorSupported:(BOOL)a3
{
  self->_gdcInDCProcessorSupported = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- (void)setDepthWithDeepFusionSupported:(BOOL)a3
{
  self->_depthWithDeepFusionSupported = a3;
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (void)setDeferredProcessingSupported:(BOOL)a3
{
  self->_deferredProcessingSupported = a3;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

- (void)setDeepZoomMode:(int)a3
{
  self->_deepZoomMode = a3;
}

- (void)setDeepFusionSupported:(BOOL)a3
{
  self->_deepFusionSupported = a3;
}

- (void)setDcProcessorVersion:(int)a3
{
  self->_dcProcessorVersion = a3;
}

- (void)setDcProcessingWithDepthSupported:(BOOL)a3
{
  self->_dcProcessingWithDepthSupported = a3;
}

- (void)setContinuousZoomWithDepthSupported:(BOOL)a3
{
  self->_continuousZoomWithDepthSupported = a3;
}

- (void)setConstantColorVersion:(int)a3
{
  self->_constantColorVersion = a3;
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  self->_constantColorSaturationBoostEnabled = a3;
}

- (void)setConstantColorConfidenceMapDimensions:(id)a3
{
  self->_constantColorConfidenceMapDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  self->_constantColorClippingRecoveryEnabled = a3;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
}

- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3
{
  self->_adjustablePortraitLightingEffectStrengthSupported = a3;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (NSArray)supportedSemanticSegmentationMatteURNs
{
  return self->_supportedSemanticSegmentationMatteURNs;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleStyledThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleStyledThumbnailDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleLinearThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleLinearThumbnailDimensions;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType
{
  return self->_dimensionsByQSubResolutionFlavorByPortType;
}

- (BOOL)continuousZoomWithDepthSupported
{
  return self->_continuousZoomWithDepthSupported;
}

- (int)swfrVersion
{
  return self->_swfrVersion;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (BOOL)ultraHighResolutionProcessingEnabled
{
  return self->_ultraHighResolutionProcessingEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (float)ubInferenceMainImageDownscalingFactor
{
  return self->_ubInferenceMainImageDownscalingFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- (unsigned)sfhrMode
{
  return self->_sfhrMode;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  return self->_generateInferencesForSemanticProcessingIfNeeded;
}

- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deepFusionEnhancedResolutionDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_constantColorConfidenceMapDimensions;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (int)stillImageGDCSourceMode
{
  return self->_stillImageGDCSourceMode;
}

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- (CGPoint)sensorCenterOffset
{
  double x = self->_sensorCenterOffset.x;
  double y = self->_sensorCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (int)redEyeReductionVersion
{
  return self->_redEyeReductionVersion;
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (BOOL)quadraProcessingSupportEnabled
{
  return self->_quadraProcessingSupportEnabled;
}

- (NSArray)portTypesWithRawNightModeEnabled
{
  return self->_portTypesWithRawNightModeEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputStillImageDimensions;
}

- (NSDictionary)moduleCalibrationByPortType
{
  return self->_moduleCalibrationByPortType;
}

- (BOOL)learnedNRSupported
{
  return self->_learnedNRSupported;
}

- (unsigned)inferencePriority
{
  return self->_inferencePriority;
}

- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled
{
  return self->_highQualityPhotoCaptureForVideoFormatEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_gdcInDCProcessorOutputCropDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)downgradedDeepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_downgradedDeepFusionEnhancedResolutionDimensions;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (BOOL)depthWithDeepFusionSupported
{
  return self->_depthWithDeepFusionSupported;
}

- (BOOL)deferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (int)deepZoomMode
{
  return self->_deepZoomMode;
}

- (BOOL)constantColorSaturationBoostEnabled
{
  return self->_constantColorSaturationBoostEnabled;
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  return self->_constantColorClippingRecoveryEnabled;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (int)dcProcessorVersion
{
  return self->_dcProcessorVersion;
}

- (BOOL)dcProcessingWithDepthSupported
{
  return self->_dcProcessingWithDepthSupported;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v3 dealloc];
}

- (void)setSmartStyleStyledThumbnailDimensions:(id)a3
{
  self->_smartStyleStyledThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setSmartStyleLinearThumbnailDimensions:(id)a3
{
  self->_smartStyleLinearThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCapturePhotonicEngineSinkPipelineConfiguration)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v20, sel_initWithCoder_);
  if (v4)
  {
    v4->_stillImageSinkPipelineProcessingMode = [a3 decodeInt32ForKey:@"stillImageSinkPipelineProcessingMode"];
    v4->_pipelineStagePrioritdouble y = [a3 decodeInt32ForKey:@"pipelineStagePriority"];
    v4->_inferencePrioritdouble y = [a3 decodeInt32ForKey:@"inferencePriority"];
    v4->_deviceType = [a3 decodeInt32ForKey:@"deviceType"];
    v4->_devicePosition = [a3 decodeInt32ForKey:@"devicePosition"];
    v4->_rawSensorDimensions.height = [a3 decodeInt32ForKey:@"rawSensorDimensionsHeight"];
    v4->_rawSensorDimensions.width = [a3 decodeInt32ForKey:@"rawSensorDimensionsWidth"];
    v4->_sensorCenterOffset.double x = (double)(int)[a3 decodeInt32ForKey:@"sensorCenterOffsetX"];
    v4->_sensorCenterOffset.double y = (double)(int)[a3 decodeInt32ForKey:@"sensorCenterOffsetY"];
    v4->_outputStillImageDimensions.width = [a3 decodeInt32ForKey:@"outputStillImageDimensionsWidth"];
    v4->_outputStillImageDimensions.height = [a3 decodeInt32ForKey:@"outputStillImageDimensionsHeight"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v4->_sensorIDStringsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 2)), @"sensorIDStringsByPortType");
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    v4->_baseZoomFactorsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 3)), @"baseZoomFactorsByPortType");
    v4->_swfrVersion = [a3 decodeInt32ForKey:@"swfrVersion"];
    v4->_redEyeReductionVersion = [a3 decodeInt32ForKey:@"redEyeReductionVersion"];
    v4->_semanticRenderingVersion = [a3 decodeInt32ForKey:@"semanticRenderingVersion"];
    v4->_semanticDevelopmentVersion = [a3 decodeInt32ForKey:@"semanticDevelopmentVersion"];
    v4->_semanticStyleRenderingEnabled = [a3 decodeBoolForKey:@"semanticStyleRenderingEnabled"];
    v4->_smartStyleRenderingVersion = [a3 decodeInt32ForKey:@"smartStyleRenderingVersion"];
    v4->_smartStyleReversibilityEnabled = [a3 decodeBoolForKey:@"smartStyleReversibilityEnabled"];
    v4->_smartStyleLinearThumbnailDimensions.width = [a3 decodeInt32ForKey:@"smartStyleLinearThumbnailWidth"];
    v4->_smartStyleLinearThumbnailDimensions.height = [a3 decodeInt32ForKey:@"smartStyleLinearThumbnailHeight"];
    v4->_smartStyleStyledThumbnailDimensions.width = [a3 decodeInt32ForKey:@"smartStyleStyledThumbnailWidth"];
    v4->_smartStyleStyledThumbnailDimensions.height = [a3 decodeInt32ForKey:@"smartStyleStyledThumbnailHeight"];
    v4->_constantColorVersion = [a3 decodeInt32ForKey:@"constantColorVersion"];
    v4->_constantColorConfidenceMapDimensions.width = [a3 decodeInt32ForKey:@"constantColorConfidenceMapDimensionsWidth"];
    v4->_constantColorConfidenceMapDimensions.height = [a3 decodeInt32ForKey:@"constantColorConfidenceMapDimensionsHeight"];
    v4->_constantColorClippingRecoveryEnabled = [a3 decodeBoolForKey:@"constantColorClippingRecoveryEnabled"];
    v4->_constantColorSaturationBoostEnabled = [a3 decodeBoolForKey:@"constantColorSaturationBoostEnabled"];
    v4->_generateInferencesForSemanticProcessingIfNeeded = [a3 decodeBoolForKey:@"generateInferencesForSemanticProcessingIfNeeded"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v4->_portTypesWithGeometricDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2)), @"portTypesWithGeometricDistortionCorrectionEnabled");
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v4->_portTypesWithIntelligentDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 2)), @"portTypesWithIntelligentDistortionCorrectionEnabled");
    v4->_dcProcessorVersion = [a3 decodeInt32ForKey:@"dcProcessorVersion"];
    v4->_gdcInDCProcessorSupported = [a3 decodeBoolForKey:@"gdcInDCProcessorSupported"];
    v4->_gdcInDCProcessorOutputCropDimensions.width = [a3 decodeInt32ForKey:@"gdcInDCProcessorOutputCropDimensionsWidth"];
    v4->_gdcInDCProcessorOutputCropDimensions.height = [a3 decodeInt32ForKey:@"gdcInDCProcessorOutputCropDimensionsHeight"];
    v4->_dcProcessingWithDepthSupported = [a3 decodeBoolForKey:@"dcProcessingWithDepthSupported"];
    v4->_stillImageGDCSourceMode = [a3 decodeInt32ForKey:@"stillImageGDCSourceMode"];
    v4->_greenGhostMitigationVersion = [a3 decodeInt32ForKey:@"greenGhostMitigationVersion"];
    v4->_deepZoomVersion = [a3 decodeInt32ForKey:@"deepZoomVersion"];
    v4->_deepZoomMode = [a3 decodeInt32ForKey:@"deepZoomMode"];
    v4->_demosaicedRawPixelFormat = [a3 decodeInt32ForKey:@"demosaicedRawPixelFormat"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v4->_rawColorCalibrationsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 4)), @"rawColorCalibrationsByPortType");
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v27[3] = objc_opt_class();
    v4->_rawLensShadingCorrectionCoefficientsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 4)), @"rawLensShadingCorrectionCoefficientsByPortType");
    v4->_deferredProcessingSupported = [a3 decodeBoolForKey:@"deferredProcessingSupported"];
    v4->_continuousZoomWithDepthSupported = [a3 decodeBoolForKey:@"continuousZoomWithDepthSupported"];
    v4->_adjustablePortraitLightingEffectStrengthSupported = [a3 decodeBoolForKey:@"adjustablePortraitLightingEffectStrengthSupported"];
    v4->_deepFusionSupported = [a3 decodeBoolForKey:@"deepFusionSupported"];
    v4->_depthWithDeepFusionSupported = [a3 decodeBoolForKey:@"depthWithDeepFusionSupported"];
    v4->_deepFusionEnhancedResolutionDimensions.width = [a3 decodeInt32ForKey:@"deepFusionEnhancedResolutionDimensionsWidth"];
    v4->_deepFusionEnhancedResolutionDimensions.height = [a3 decodeInt32ForKey:@"DeepFusionEnhancedResolutionDimensionsHeight"];
    v4->_downgradedDeepFusionEnhancedResolutionDimensions.width = [a3 decodeInt32ForKey:@"wasDeepFusionEnhancedResolutionDimensionsWidth"];
    v4->_downgradedDeepFusionEnhancedResolutionDimensions.height = [a3 decodeInt32ForKey:@"wasDeepFusionEnhancedResolutionDimensionsHeight"];
    v4->_learnedNRSupported = [a3 decodeBoolForKey:@"learnedNRSupported"];
    v4->_responsiveShutterSupported = [a3 decodeBoolForKey:@"responsiveShutterSupported"];
    v4->_responsiveShutterEnabled = [a3 decodeBoolForKey:@"responsiveShutterEnabled"];
    v4->_fastCapturePrioritizationEnabled = [a3 decodeBoolForKey:@"fastCapturePrioritizationEnabled"];
    v4->_captureTimePhotosCurationSupported = [a3 decodeBoolForKey:@"captureTimePhotosCurationSupported"];
    v4->_depthDataType = [a3 decodeInt32ForKey:@"depthDataType"];
    v4->_pearlModuleType = [a3 decodeInt32ForKey:@"pearlModuleType"];
    v4->_sifrStillImageCaptureEnabledIfAvailable = [a3 decodeBoolForKey:@"sifrStillImageCaptureEnabledIfAvailable"];
    [a3 decodeFloatForKey:@"gainMapMainImageDownscalingFactor"];
    v4->_gainMapMainImageDownscalingFactor = v11;
    [a3 decodeFloatForKey:@"ubInferenceMainImageDownscalingFactor"];
    v4->_ubInferenceMainImageDownscalingFactor = v12;
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    v26[3] = objc_opt_class();
    v26[4] = objc_opt_class();
    v4->_enabledSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 5)), @"enabledSemanticSegmentationMatteURNs");
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    v4->_supportedSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 5)), @"supportedSemanticSegmentationMatteURNs");
    v4->_maxLossyCompressionLevel = [a3 decodeInt32ForKey:@"maxLossyCompressionLevel"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 5)), @"cameraInfoByPortType");
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v4->_moduleCalibrationByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v23, 1)), @"moduleCalibrationByPortType");
    v4->_highQualityPhotoCaptureForVideoFormatEnabled = [a3 decodeBoolForKey:@"highQualityPhotoCaptureForVideoFormatEnabled"];
    v4->_softISPSupported = [a3 decodeBoolForKey:@"softISPSupported"];
    v4->_sensorRawPixelFormat = [a3 decodeInt32ForKey:@"sensorRawPixelFormat"];
    v4->_quadraProcessingSupportEnabled = [a3 decodeBoolForKey:@"quadraProcessingSupportEnabled"];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v4->_dimensionsByQSubResolutionFlavorByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 3)), @"dimensionsByQSubResolutionFlavorByPortType");
    v4->_ultraHighResolutionProcessingEnabled = [a3 decodeBoolForKey:@"ultraHighResolutionProcessingEnabled"];
    v4->_sfhrMode = [a3 decodeInt32ForKey:@"sfhrMode"];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v4->_portTypesWithRawNightModeEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v18, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 2)), @"portTypesWithRawNightModeEnabled");
    v4->_stereoPhotoOutputDimensions.width = [a3 decodeInt32ForKey:@"stereoPhotoOutputDimensionsWidth"];
    v4->_stereoPhotoOutputDimensions.height = [a3 decodeInt32ForKey:@"stereoPhotoOutputDimensionsHeight"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = self;
  v7.receiver = self;
  v7.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeInt32:v4->_stillImageSinkPipelineProcessingMode forKey:@"stillImageSinkPipelineProcessingMode"];
  [a3 encodeInt32:v4->_pipelineStagePriority forKey:@"pipelineStagePriority"];
  [a3 encodeInt32:v4->_inferencePriority forKey:@"inferencePriority"];
  [a3 encodeInt32:v4->_deviceType forKey:@"deviceType"];
  [a3 encodeInt32:v4->_devicePosition forKey:@"devicePosition"];
  [a3 encodeInt32:v4->_rawSensorDimensions.height forKey:@"rawSensorDimensionsHeight"];
  [a3 encodeInt32:v4->_rawSensorDimensions.width forKey:@"rawSensorDimensionsWidth"];
  [a3 encodeInt32:(int)v4->_sensorCenterOffset.x forKey:@"sensorCenterOffsetX"];
  [a3 encodeInt32:(int)v4->_sensorCenterOffset.y forKey:@"sensorCenterOffsetY"];
  [a3 encodeInt32:v4->_outputStillImageDimensions.width forKey:@"outputStillImageDimensionsWidth"];
  [a3 encodeInt32:v4->_outputStillImageDimensions.height forKey:@"outputStillImageDimensionsHeight"];
  [a3 encodeObject:v4->_sensorIDStringsByPortType forKey:@"sensorIDStringsByPortType"];
  [a3 encodeObject:v4->_baseZoomFactorsByPortType forKey:@"baseZoomFactorsByPortType"];
  [a3 encodeInt32:v4->_swfrVersion forKey:@"swfrVersion"];
  [a3 encodeInt32:v4->_redEyeReductionVersion forKey:@"redEyeReductionVersion"];
  [a3 encodeInt32:v4->_semanticRenderingVersion forKey:@"semanticRenderingVersion"];
  [a3 encodeInt32:v4->_semanticDevelopmentVersion forKey:@"semanticDevelopmentVersion"];
  [a3 encodeBool:v4->_semanticStyleRenderingEnabled forKey:@"semanticStyleRenderingEnabled"];
  [a3 encodeInt32:v4->_smartStyleRenderingVersion forKey:@"smartStyleRenderingVersion"];
  [a3 encodeBool:v4->_smartStyleReversibilityEnabled forKey:@"smartStyleReversibilityEnabled"];
  [a3 encodeInt32:v4->_smartStyleLinearThumbnailDimensions.width forKey:@"smartStyleLinearThumbnailWidth"];
  [a3 encodeInt32:v4->_smartStyleLinearThumbnailDimensions.height forKey:@"smartStyleLinearThumbnailHeight"];
  [a3 encodeInt32:v4->_smartStyleStyledThumbnailDimensions.width forKey:@"smartStyleStyledThumbnailWidth"];
  [a3 encodeInt32:v4->_smartStyleStyledThumbnailDimensions.height forKey:@"smartStyleStyledThumbnailHeight"];
  [a3 encodeInt32:v4->_constantColorVersion forKey:@"constantColorVersion"];
  [a3 encodeInt32:v4->_constantColorConfidenceMapDimensions.width forKey:@"constantColorConfidenceMapDimensionsWidth"];
  [a3 encodeInt32:v4->_constantColorConfidenceMapDimensions.height forKey:@"constantColorConfidenceMapDimensionsHeight"];
  [a3 encodeBool:v4->_constantColorClippingRecoveryEnabled forKey:@"constantColorClippingRecoveryEnabled"];
  [a3 encodeBool:v4->_constantColorSaturationBoostEnabled forKey:@"constantColorSaturationBoostEnabled"];
  [a3 encodeBool:v4->_generateInferencesForSemanticProcessingIfNeeded forKey:@"generateInferencesForSemanticProcessingIfNeeded"];
  [a3 encodeObject:v4->_portTypesWithGeometricDistortionCorrectionEnabled forKey:@"portTypesWithGeometricDistortionCorrectionEnabled"];
  [a3 encodeObject:v4->_portTypesWithIntelligentDistortionCorrectionEnabled forKey:@"portTypesWithIntelligentDistortionCorrectionEnabled"];
  [a3 encodeInt32:v4->_dcProcessorVersion forKey:@"dcProcessorVersion"];
  [a3 encodeBool:v4->_gdcInDCProcessorSupported forKey:@"gdcInDCProcessorSupported"];
  [a3 encodeInt32:v4->_gdcInDCProcessorOutputCropDimensions.width forKey:@"gdcInDCProcessorOutputCropDimensionsWidth"];
  [a3 encodeInt32:v4->_gdcInDCProcessorOutputCropDimensions.height forKey:@"gdcInDCProcessorOutputCropDimensionsHeight"];
  [a3 encodeBool:v4->_dcProcessingWithDepthSupported forKey:@"dcProcessingWithDepthSupported"];
  [a3 encodeInt32:v4->_stillImageGDCSourceMode forKey:@"stillImageGDCSourceMode"];
  [a3 encodeInt32:v4->_greenGhostMitigationVersion forKey:@"greenGhostMitigationVersion"];
  [a3 encodeInt32:v4->_deepZoomVersion forKey:@"deepZoomVersion"];
  [a3 encodeInt32:v4->_deepZoomMode forKey:@"deepZoomMode"];
  [a3 encodeInt32:v4->_demosaicedRawPixelFormat forKey:@"demosaicedRawPixelFormat"];
  [a3 encodeObject:v4->_rawColorCalibrationsByPortType forKey:@"rawColorCalibrationsByPortType"];
  [a3 encodeObject:v4->_rawLensShadingCorrectionCoefficientsByPortType forKey:@"rawLensShadingCorrectionCoefficientsByPortType"];
  [a3 encodeBool:v4->_deferredProcessingSupported forKey:@"deferredProcessingSupported"];
  [a3 encodeBool:v4->_continuousZoomWithDepthSupported forKey:@"continuousZoomWithDepthSupported"];
  [a3 encodeBool:v4->_adjustablePortraitLightingEffectStrengthSupported forKey:@"adjustablePortraitLightingEffectStrengthSupported"];
  [a3 encodeBool:v4->_deepFusionSupported forKey:@"deepFusionSupported"];
  [a3 encodeBool:v4->_depthWithDeepFusionSupported forKey:@"depthWithDeepFusionSupported"];
  [a3 encodeInt32:v4->_deepFusionEnhancedResolutionDimensions.width forKey:@"deepFusionEnhancedResolutionDimensionsWidth"];
  [a3 encodeInt32:v4->_deepFusionEnhancedResolutionDimensions.height forKey:@"DeepFusionEnhancedResolutionDimensionsHeight"];
  [a3 encodeInt32:v4->_downgradedDeepFusionEnhancedResolutionDimensions.width forKey:@"wasDeepFusionEnhancedResolutionDimensionsWidth"];
  [a3 encodeInt32:v4->_downgradedDeepFusionEnhancedResolutionDimensions.height forKey:@"wasDeepFusionEnhancedResolutionDimensionsHeight"];
  [a3 encodeBool:v4->_learnedNRSupported forKey:@"learnedNRSupported"];
  [a3 encodeBool:v4->_responsiveShutterSupported forKey:@"responsiveShutterSupported"];
  [a3 encodeBool:v4->_responsiveShutterEnabled forKey:@"responsiveShutterEnabled"];
  [a3 encodeBool:v4->_fastCapturePrioritizationEnabled forKey:@"fastCapturePrioritizationEnabled"];
  [a3 encodeBool:v4->_captureTimePhotosCurationSupported forKey:@"captureTimePhotosCurationSupported"];
  [a3 encodeInt32:v4->_depthDataType forKey:@"depthDataType"];
  [a3 encodeInt32:v4->_pearlModuleType forKey:@"pearlModuleType"];
  [a3 encodeBool:v4->_sifrStillImageCaptureEnabledIfAvailable forKey:@"sifrStillImageCaptureEnabledIfAvailable"];
  *(float *)&double v5 = v4->_gainMapMainImageDownscalingFactor;
  [a3 encodeFloat:@"gainMapMainImageDownscalingFactor" forKey:v5];
  *(float *)&double v6 = v4->_ubInferenceMainImageDownscalingFactor;
  [a3 encodeFloat:@"ubInferenceMainImageDownscalingFactor" forKey:v6];
  [a3 encodeObject:v4->_enabledSemanticSegmentationMatteURNs forKey:@"enabledSemanticSegmentationMatteURNs"];
  [a3 encodeObject:v4->_supportedSemanticSegmentationMatteURNs forKey:@"supportedSemanticSegmentationMatteURNs"];
  [a3 encodeInt32:v4->_maxLossyCompressionLevel forKey:@"maxLossyCompressionLevel"];
  [a3 encodeObject:v4->_cameraInfoByPortType forKey:@"cameraInfoByPortType"];
  [a3 encodeObject:v4->_moduleCalibrationByPortType forKey:@"moduleCalibrationByPortType"];
  [a3 encodeBool:v4->_highQualityPhotoCaptureForVideoFormatEnabled forKey:@"highQualityPhotoCaptureForVideoFormatEnabled"];
  [a3 encodeBool:v4->_softISPSupported forKey:@"softISPSupported"];
  [a3 encodeInt32:v4->_sensorRawPixelFormat forKey:@"sensorRawPixelFormat"];
  [a3 encodeBool:v4->_quadraProcessingSupportEnabled forKey:@"quadraProcessingSupportEnabled"];
  [a3 encodeObject:v4->_dimensionsByQSubResolutionFlavorByPortType forKey:@"dimensionsByQSubResolutionFlavorByPortType"];
  [a3 encodeBool:v4->_ultraHighResolutionProcessingEnabled forKey:@"ultraHighResolutionProcessingEnabled"];
  [a3 encodeInt32:v4->_sfhrMode forKey:@"sfhrMode"];
  [a3 encodeObject:v4->_portTypesWithRawNightModeEnabled forKey:@"portTypesWithRawNightModeEnabled"];
  v4 = (FigCapturePhotonicEngineSinkPipelineConfiguration *)((char *)v4 + 408);
  [a3 encodeInt32:LODWORD(v4->super.super.isa) forKey:@"stereoPhotoOutputDimensionsWidth"];
  [a3 encodeInt32:HIDWORD(v4->super.super.isa) forKey:@"stereoPhotoOutputDimensionsHeight"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  uint64_t v91 = v6;
  uint64_t v92 = v5;
  uint64_t v93 = v3;
  uint64_t v94 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  v90.receiver = self;
  v90.super_class = (Class)FigCapturePhotonicEngineSinkPipelineConfiguration;
  unsigned int v9 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v90 isEqual:a3];
  if (v9)
  {
    int v10 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self stillImageSinkPipelineProcessingMode];
    if (v10 != [a3 stillImageSinkPipelineProcessingMode]) {
      goto LABEL_37;
    }
    unsigned int v11 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self pipelineStagePriority];
    if (v11 != [a3 pipelineStagePriority]) {
      goto LABEL_37;
    }
    unsigned int v12 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self inferencePriority];
    if (v12 != [a3 inferencePriority]) {
      goto LABEL_37;
    }
    int v13 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self deviceType];
    if (v13 != [a3 deviceType]) {
      goto LABEL_37;
    }
    int v14 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self devicePosition];
    if (v14 != [a3 devicePosition]) {
      goto LABEL_37;
    }
    unsigned int v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions"), [a3 rawSensorDimensions]);
    if (v9)
    {
      int v15 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self rawSensorDimensions];
      if (v15 != [a3 rawSensorDimensions]) {
        goto LABEL_37;
      }
      unint64_t v16 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self rawSensorDimensions] >> 32;
      if (v16 != (unint64_t)[a3 rawSensorDimensions] >> 32) {
        goto LABEL_37;
      }
      [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sensorCenterOffset];
      double v18 = v17;
      [a3 sensorCenterOffset];
      if (v18 != v19) {
        goto LABEL_37;
      }
      [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sensorCenterOffset];
      double v21 = v20;
      [a3 sensorCenterOffset];
      if (v21 != v22) {
        goto LABEL_37;
      }
      int v23 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self outputStillImageDimensions];
      if (v23 != [a3 outputStillImageDimensions]) {
        goto LABEL_37;
      }
      unint64_t v24 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self outputStillImageDimensions] >> 32;
      if (v24 != (unint64_t)[a3 outputStillImageDimensions] >> 32) {
        goto LABEL_37;
      }
      v25 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sensorIDStringsByPortType];
      if (v25 == (NSDictionary *)[a3 sensorIDStringsByPortType]
        || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType"), "isEqual:", [a3 sensorIDStringsByPortType])) != 0)
      {
        v26 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self baseZoomFactorsByPortType];
        if (v26 == (NSDictionary *)[a3 baseZoomFactorsByPortType]
          || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType"), "isEqual:", [a3 baseZoomFactorsByPortType])) != 0)
        {
          int v27 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self swfrVersion];
          if (v27 != [a3 swfrVersion]) {
            goto LABEL_37;
          }
          int v28 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self redEyeReductionVersion];
          if (v28 != [a3 redEyeReductionVersion]) {
            goto LABEL_37;
          }
          int v29 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self semanticRenderingVersion];
          if (v29 != [a3 semanticRenderingVersion]) {
            goto LABEL_37;
          }
          int v30 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self semanticDevelopmentVersion];
          if (v30 != [a3 semanticDevelopmentVersion]) {
            goto LABEL_37;
          }
          int v31 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self semanticStyleRenderingEnabled];
          if (v31 != [a3 semanticStyleRenderingEnabled]) {
            goto LABEL_37;
          }
          int v32 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleRenderingVersion];
          if (v32 != [a3 smartStyleRenderingVersion]) {
            goto LABEL_37;
          }
          int v33 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleReversibilityEnabled];
          if (v33 != [a3 smartStyleReversibilityEnabled]) {
            goto LABEL_37;
          }
          int v34 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleLinearThumbnailDimensions];
          if (v34 != [a3 smartStyleLinearThumbnailDimensions]) {
            goto LABEL_37;
          }
          unint64_t v35 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleLinearThumbnailDimensions] >> 32;
          if (v35 != (unint64_t)[a3 smartStyleLinearThumbnailDimensions] >> 32) {
            goto LABEL_37;
          }
          int v36 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleStyledThumbnailDimensions];
          if (v36 != [a3 smartStyleStyledThumbnailDimensions]) {
            goto LABEL_37;
          }
          unint64_t v37 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self smartStyleStyledThumbnailDimensions] >> 32;
          if (v37 != (unint64_t)[a3 smartStyleStyledThumbnailDimensions] >> 32) {
            goto LABEL_37;
          }
          int v38 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self constantColorVersion];
          if (v38 != [a3 constantColorVersion]) {
            goto LABEL_37;
          }
          int v39 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self constantColorConfidenceMapDimensions];
          if (v39 != [a3 constantColorConfidenceMapDimensions]) {
            goto LABEL_37;
          }
          unint64_t v40 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self constantColorConfidenceMapDimensions] >> 32;
          if (v40 != (unint64_t)[a3 constantColorConfidenceMapDimensions] >> 32) {
            goto LABEL_37;
          }
          int v41 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self constantColorClippingRecoveryEnabled];
          if (v41 != [a3 constantColorClippingRecoveryEnabled]) {
            goto LABEL_37;
          }
          int v42 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self constantColorSaturationBoostEnabled];
          if (v42 != [a3 constantColorSaturationBoostEnabled]) {
            goto LABEL_37;
          }
          int v43 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self generateInferencesForSemanticProcessingIfNeeded];
          if (v43 != [a3 generateInferencesForSemanticProcessingIfNeeded]) {
            goto LABEL_37;
          }
          v44 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self portTypesWithGeometricDistortionCorrectionEnabled];
          if (v44 == (NSArray *)[a3 portTypesWithGeometricDistortionCorrectionEnabled]
            || (unsigned int v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled"), "isEqual:", [a3 portTypesWithGeometricDistortionCorrectionEnabled])) != 0)
          {
            v45 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self portTypesWithIntelligentDistortionCorrectionEnabled];
            if (v45 == (NSArray *)[a3 portTypesWithIntelligentDistortionCorrectionEnabled]
              || (unsigned int v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled"), "isEqual:", [a3 portTypesWithIntelligentDistortionCorrectionEnabled])) != 0)
            {
              int v46 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self dcProcessorVersion];
              if (v46 != [a3 dcProcessorVersion]) {
                goto LABEL_37;
              }
              int v47 = (int)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self gdcInDCProcessorOutputCropDimensions];
              if (v47 != [a3 gdcInDCProcessorOutputCropDimensions]) {
                goto LABEL_37;
              }
              unint64_t v48 = (unint64_t)[(FigCapturePhotonicEngineSinkPipelineConfiguration *)self gdcInDCProcessorOutputCropDimensions] >> 32;
              if (v48 != (unint64_t)[a3 gdcInDCProcessorOutputCropDimensions] >> 32) {
                goto LABEL_37;
              }
              int v49 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self dcProcessingWithDepthSupported];
              if (v49 != [a3 dcProcessingWithDepthSupported]) {
                goto LABEL_37;
              }
              int v50 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self stillImageGDCSourceMode];
              if (v50 != [a3 stillImageGDCSourceMode]) {
                goto LABEL_37;
              }
              int v51 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self greenGhostMitigationVersion];
              if (v51 != [a3 greenGhostMitigationVersion]) {
                goto LABEL_37;
              }
              int v52 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self deepZoomVersion];
              if (v52 != [a3 deepZoomVersion]) {
                goto LABEL_37;
              }
              int v53 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self deepZoomMode];
              if (v53 != [a3 deepZoomMode]) {
                goto LABEL_37;
              }
              unsigned int v54 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self demosaicedRawPixelFormat];
              if (v54 != [a3 demosaicedRawPixelFormat]) {
                goto LABEL_37;
              }
              v55 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self rawColorCalibrationsByPortType];
              if (v55 == (NSDictionary *)[a3 rawColorCalibrationsByPortType]
                || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType"), "isEqual:", [a3 rawColorCalibrationsByPortType])) != 0)
              {
                v56 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self rawLensShadingCorrectionCoefficientsByPortType];
                if (v56 == (NSDictionary *)[a3 rawLensShadingCorrectionCoefficientsByPortType]
                  || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType"), "isEqual:", [a3 rawLensShadingCorrectionCoefficientsByPortType])) != 0)
                {
                  int v57 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self deferredProcessingSupported];
                  if (v57 != [a3 deferredProcessingSupported]) {
                    goto LABEL_37;
                  }
                  int v58 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self continuousZoomWithDepthSupported];
                  if (v58 != [a3 continuousZoomWithDepthSupported]) {
                    goto LABEL_37;
                  }
                  int v59 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self adjustablePortraitLightingEffectStrengthSupported];
                  if (v59 != [a3 adjustablePortraitLightingEffectStrengthSupported]) {
                    goto LABEL_37;
                  }
                  int v60 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self deepFusionSupported];
                  if (v60 != [a3 deepFusionSupported]) {
                    goto LABEL_37;
                  }
                  int v61 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self depthWithDeepFusionSupported];
                  if (v61 != [a3 depthWithDeepFusionSupported]) {
                    goto LABEL_37;
                  }
                  unsigned int v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration deepFusionEnhancedResolutionDimensions](self, "deepFusionEnhancedResolutionDimensions"), [a3 deepFusionEnhancedResolutionDimensions]);
                  if (!v9) {
                    return v9;
                  }
                  unsigned int v9 = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration downgradedDeepFusionEnhancedResolutionDimensions](self, "downgradedDeepFusionEnhancedResolutionDimensions"), [a3 downgradedDeepFusionEnhancedResolutionDimensions]);
                  if (!v9) {
                    return v9;
                  }
                  int v62 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self learnedNRSupported];
                  if (v62 != [a3 learnedNRSupported]) {
                    goto LABEL_37;
                  }
                  int v63 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self responsiveShutterSupported];
                  if (v63 != [a3 responsiveShutterSupported]) {
                    goto LABEL_37;
                  }
                  int v64 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self responsiveShutterEnabled];
                  if (v64 != [a3 responsiveShutterEnabled]) {
                    goto LABEL_37;
                  }
                  int v65 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self fastCapturePrioritizationEnabled];
                  if (v65 != [a3 fastCapturePrioritizationEnabled]) {
                    goto LABEL_37;
                  }
                  int v66 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self captureTimePhotosCurationSupported];
                  if (v66 != [a3 captureTimePhotosCurationSupported]) {
                    goto LABEL_37;
                  }
                  int v67 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self depthDataType];
                  if (v67 != [a3 depthDataType]) {
                    goto LABEL_37;
                  }
                  int v68 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self pearlModuleType];
                  if (v68 != [a3 pearlModuleType]) {
                    goto LABEL_37;
                  }
                  int v69 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sifrStillImageCaptureEnabledIfAvailable];
                  if (v69 != [a3 sifrStillImageCaptureEnabledIfAvailable]) {
                    goto LABEL_37;
                  }
                  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self gainMapMainImageDownscalingFactor];
                  float v71 = v70;
                  [a3 gainMapMainImageDownscalingFactor];
                  if (v71 != v72) {
                    goto LABEL_37;
                  }
                  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self ubInferenceMainImageDownscalingFactor];
                  float v74 = v73;
                  [a3 ubInferenceMainImageDownscalingFactor];
                  if (v74 != v75) {
                    goto LABEL_37;
                  }
                  v76 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self enabledSemanticSegmentationMatteURNs];
                  if (v76 == (NSArray *)[a3 enabledSemanticSegmentationMatteURNs]
                    || (unsigned int v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"), "isEqual:", [a3 enabledSemanticSegmentationMatteURNs])) != 0)
                  {
                    v77 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self supportedSemanticSegmentationMatteURNs];
                    if (v77 == (NSArray *)[a3 supportedSemanticSegmentationMatteURNs]
                      || (unsigned int v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs"), "isEqual:", [a3 supportedSemanticSegmentationMatteURNs])) != 0)
                    {
                      int v78 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self maxLossyCompressionLevel];
                      if (v78 != [a3 maxLossyCompressionLevel]) {
                        goto LABEL_37;
                      }
                      v79 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self cameraInfoByPortType];
                      if (v79 == (NSDictionary *)[a3 cameraInfoByPortType]
                        || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType"), "isEqual:", [a3 cameraInfoByPortType])) != 0)
                      {
                        v80 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self moduleCalibrationByPortType];
                        if (v80 == (NSDictionary *)[a3 moduleCalibrationByPortType]
                          || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration moduleCalibrationByPortType](self, "moduleCalibrationByPortType"), "isEqual:", [a3 moduleCalibrationByPortType])) != 0)
                        {
                          int v81 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self highQualityPhotoCaptureForVideoFormatEnabled];
                          if (v81 == [a3 highQualityPhotoCaptureForVideoFormatEnabled])
                          {
                            int v82 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self softISPSupported];
                            if (v82 == [a3 softISPSupported])
                            {
                              unsigned int v83 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sensorRawPixelFormat];
                              if (v83 == [a3 sensorRawPixelFormat])
                              {
                                int v84 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self quadraProcessingSupportEnabled];
                                if (v84 == [a3 quadraProcessingSupportEnabled])
                                {
                                  v85 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self dimensionsByQSubResolutionFlavorByPortType];
                                  if (v85 != (NSDictionary *)[a3 dimensionsByQSubResolutionFlavorByPortType])
                                  {
                                    unsigned int v9 = -[NSDictionary isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", [a3 dimensionsByQSubResolutionFlavorByPortType]);
                                    if (!v9) {
                                      return v9;
                                    }
                                  }
                                  int v86 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self ultraHighResolutionProcessingEnabled];
                                  if (v86 == [a3 ultraHighResolutionProcessingEnabled])
                                  {
                                    unsigned int v87 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self sfhrMode];
                                    if (v87 == [a3 sfhrMode])
                                    {
                                      v88 = [(FigCapturePhotonicEngineSinkPipelineConfiguration *)self portTypesWithRawNightModeEnabled];
                                      if (v88 == (NSArray *)[a3 portTypesWithRawNightModeEnabled]
                                        || (unsigned int v9 = -[NSArray isEqual:](-[FigCapturePhotonicEngineSinkPipelineConfiguration portTypesWithRawNightModeEnabled](self, "portTypesWithRawNightModeEnabled"), "isEqual:", [a3 portTypesWithRawNightModeEnabled])) != 0)
                                      {
                                        LOBYTE(v9) = FigCaptureVideoDimensionsAreEqual(-[FigCapturePhotonicEngineSinkPipelineConfiguration stereoPhotoOutputDimensions](self, "stereoPhotoOutputDimensions"), [a3 stereoPhotoOutputDimensions]);
                                      }
                                      return v9;
                                    }
                                  }
                                }
                              }
                            }
                          }
LABEL_37:
                          LOBYTE(v9) = 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v9;
}

- (void)setOutputStillImageDimensions:(id)a3
{
  self->_outputStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3
{
  self->_gdcInDCProcessorOutputCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
}

- (BOOL)adjustablePortraitLightingEffectStrengthSupported
{
  return self->_adjustablePortraitLightingEffectStrengthSupported;
}

- (void)setDowngradedDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_downgradedDeepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end