@interface FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions;
- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions;
- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions;
- (BOOL)adjustablePortraitLightingEffectStrengthSupported;
- (BOOL)captureTimePhotosCurationSupported;
- (BOOL)deepFusionSupported;
- (BOOL)deferredProcessingSupported;
- (BOOL)deviceHasFlash;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)gdcInDCProcessorSupported;
- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)learnedNRSupported;
- (BOOL)responsiveShutterEnabled;
- (BOOL)responsiveShutterSupported;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)sifrStillImageCaptureEnabledIfAvailable;
- (FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration)initWithCoder:(id)a3;
- (NSArray)enabledSemanticSegmentationMatteURNs;
- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled;
- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled;
- (NSArray)supportedSemanticSegmentationMatteURNs;
- (NSDictionary)baseZoomFactorsByPortType;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)rawColorCalibrationsByPortType;
- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType;
- (NSDictionary)sensorIDStringsByPortType;
- (float)gainMapMainImageDownscalingFactor;
- (float)ubInferenceMainImageDownscalingFactor;
- (int)dcProcessorVersion;
- (int)deepZoomVersion;
- (int)depthDataType;
- (int)deviceType;
- (int)greenGhostMitigationVersion;
- (int)maxLossyCompressionLevel;
- (int)pearlModuleType;
- (int)redEyeReductionVersion;
- (int)semanticDevelopmentVersion;
- (int)semanticRenderingVersion;
- (int)stillImageSinkPipelineProcessingMode;
- (unsigned)demosaicedRawPixelFormat;
- (unsigned)inferencePriority;
- (unsigned)pipelineStagePriority;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3;
- (void)setBaseZoomFactorsByPortType:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3;
- (void)setDcProcessorVersion:(int)a3;
- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3;
- (void)setDeepFusionSupported:(BOOL)a3;
- (void)setDeepZoomVersion:(int)a3;
- (void)setDeferredProcessingSupported:(BOOL)a3;
- (void)setDemosaicedRawPixelFormat:(unsigned int)a3;
- (void)setDepthDataType:(int)a3;
- (void)setDeviceHasFlash:(BOOL)a3;
- (void)setDeviceType:(int)a3;
- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setGainMapMainImageDownscalingFactor:(float)a3;
- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3;
- (void)setGdcInDCProcessorSupported:(BOOL)a3;
- (void)setGreenGhostMitigationVersion:(int)a3;
- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3;
- (void)setInferencePriority:(unsigned int)a3;
- (void)setLearnedNRSupported:(BOOL)a3;
- (void)setMaxLossyCompressionLevel:(int)a3;
- (void)setOutputStillImageDimensions:(id)a3;
- (void)setPearlModuleType:(int)a3;
- (void)setPipelineStagePriority:(unsigned int)a3;
- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3;
- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3;
- (void)setRawColorCalibrationsByPortType:(id)a3;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3;
- (void)setRawSensorDimensions:(id)a3;
- (void)setRedEyeReductionVersion:(int)a3;
- (void)setResponsiveShutterEnabled:(BOOL)a3;
- (void)setResponsiveShutterSupported:(BOOL)a3;
- (void)setSemanticDevelopmentVersion:(int)a3;
- (void)setSemanticRenderingVersion:(int)a3;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSensorIDStringsByPortType:(id)a3;
- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3;
- (void)setStillImageSinkPipelineProcessingMode:(int)a3;
- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3;
- (void)setUbInferenceMainImageDownscalingFactor:(float)a3;
@end

@implementation FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v17, sel_initWithCoder_);
  if (v4)
  {
    v4->_stillImageSinkPipelineProcessingMode = [a3 decodeInt32ForKey:@"stillImageSinkPipelineProcessingMode"];
    v4->_pipelineStagePriority = [a3 decodeInt32ForKey:@"pipelineStagePriority"];
    v4->_inferencePriority = [a3 decodeInt32ForKey:@"inferencePriority"];
    v4->_deviceType = [a3 decodeInt32ForKey:@"deviceType"];
    v4->_rawSensorDimensions.height = [a3 decodeInt32ForKey:@"rawSensorDimensionsHeight"];
    v4->_rawSensorDimensions.width = [a3 decodeInt32ForKey:@"rawSensorDimensionsWidth"];
    v4->_outputStillImageDimensions.width = [a3 decodeInt32ForKey:@"outputStillImageDimensionsWidth"];
    v4->_outputStillImageDimensions.height = [a3 decodeInt32ForKey:@"outputStillImageDimensionsHeight"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v4->_sensorIDStringsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 2)), @"sensorIDStringsByPortType");
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v4->_baseZoomFactorsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 3)), @"baseZoomFactorsByPortType");
    v4->_redEyeReductionVersion = [a3 decodeInt32ForKey:@"redEyeReductionVersion"];
    v4->_semanticRenderingVersion = [a3 decodeInt32ForKey:@"semanticRenderingVersion"];
    v4->_semanticDevelopmentVersion = [a3 decodeInt32ForKey:@"semanticDevelopmentVersion"];
    v4->_semanticStyleRenderingEnabled = [a3 decodeBoolForKey:@"semanticStyleRenderingEnabled"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v4->_portTypesWithGeometricDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 2)), @"portTypesWithGeometricDistortionCorrectionEnabled");
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v4->_portTypesWithIntelligentDistortionCorrectionEnabled = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 2)), @"portTypesWithIntelligentDistortionCorrectionEnabled");
    v4->_dcProcessorVersion = [a3 decodeInt32ForKey:@"dcProcessorVersion"];
    v4->_gdcInDCProcessorSupported = [a3 decodeBoolForKey:@"gdcInDCProcessorSupported"];
    v4->_gdcInDCProcessorOutputCropDimensions.width = [a3 decodeInt32ForKey:@"gdcInDCProcessorOutputCropDimensionsWidth"];
    v4->_gdcInDCProcessorOutputCropDimensions.height = [a3 decodeInt32ForKey:@"gdcInDCProcessorOutputCropDimensionsHeight"];
    v4->_greenGhostMitigationVersion = [a3 decodeInt32ForKey:@"greenGhostMitigationVersion"];
    v4->_deepZoomVersion = [a3 decodeInt32ForKey:@"deepZoomVersion"];
    v4->_demosaicedRawPixelFormat = [a3 decodeInt32ForKey:@"demosaicedRawPixelFormat"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    v4->_rawColorCalibrationsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 4)), @"rawColorCalibrationsByPortType");
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v4->_rawLensShadingCorrectionCoefficientsByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 4)), @"rawLensShadingCorrectionCoefficientsByPortType");
    v4->_deferredProcessingSupported = [a3 decodeBoolForKey:@"deferredProcessingSupported"];
    v4->_adjustablePortraitLightingEffectStrengthSupported = [a3 decodeBoolForKey:@"adjustablePortraitLightingEffectStrengthSupported"];
    v4->_deepFusionSupported = [a3 decodeBoolForKey:@"deepFusionSupported"];
    v4->_deepFusionEnhancedResolutionDimensions.width = [a3 decodeInt32ForKey:@"deepFusionEnhancedResolutionDimensionsWidth"];
    v4->_deepFusionEnhancedResolutionDimensions.height = [a3 decodeInt32ForKey:@"deepFusionEnhancedResolutionDimensionsHeight"];
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
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v4->_enabledSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 5)), @"enabledSemanticSegmentationMatteURNs");
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v4->_supportedSemanticSegmentationMatteURNs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 5)), @"supportedSemanticSegmentationMatteURNs");
    v4->_maxLossyCompressionLevel = [a3 decodeInt32ForKey:@"maxLossyCompressionLevel"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v4->_cameraInfoByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 5)), @"cameraInfoByPortType");
    v4->_highQualityPhotoCaptureForVideoFormatEnabled = [a3 decodeBoolForKey:@"highQualityPhotoCaptureForVideoFormatEnabled"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  [a3 encodeInt32:self->_stillImageSinkPipelineProcessingMode forKey:@"stillImageSinkPipelineProcessingMode"];
  [a3 encodeInt32:self->_pipelineStagePriority forKey:@"pipelineStagePriority"];
  [a3 encodeInt32:self->_inferencePriority forKey:@"inferencePriority"];
  [a3 encodeInt32:self->_deviceType forKey:@"deviceType"];
  [a3 encodeInt32:self->_rawSensorDimensions.height forKey:@"rawSensorDimensionsHeight"];
  [a3 encodeInt32:self->_rawSensorDimensions.width forKey:@"rawSensorDimensionsWidth"];
  [a3 encodeInt32:self->_outputStillImageDimensions.width forKey:@"outputStillImageDimensionsWidth"];
  [a3 encodeInt32:self->_outputStillImageDimensions.height forKey:@"outputStillImageDimensionsHeight"];
  [a3 encodeObject:self->_sensorIDStringsByPortType forKey:@"sensorIDStringsByPortType"];
  [a3 encodeObject:self->_baseZoomFactorsByPortType forKey:@"baseZoomFactorsByPortType"];
  [a3 encodeInt32:self->_redEyeReductionVersion forKey:@"redEyeReductionVersion"];
  [a3 encodeInt32:self->_semanticRenderingVersion forKey:@"semanticRenderingVersion"];
  [a3 encodeInt32:self->_semanticDevelopmentVersion forKey:@"semanticDevelopmentVersion"];
  [a3 encodeBool:self->_semanticStyleRenderingEnabled forKey:@"semanticStyleRenderingEnabled"];
  [a3 encodeObject:self->_portTypesWithGeometricDistortionCorrectionEnabled forKey:@"portTypesWithGeometricDistortionCorrectionEnabled"];
  [a3 encodeObject:self->_portTypesWithIntelligentDistortionCorrectionEnabled forKey:@"portTypesWithIntelligentDistortionCorrectionEnabled"];
  [a3 encodeInt32:self->_dcProcessorVersion forKey:@"dcProcessorVersion"];
  [a3 encodeBool:self->_gdcInDCProcessorSupported forKey:@"gdcInDCProcessorSupported"];
  [a3 encodeInt32:self->_gdcInDCProcessorOutputCropDimensions.width forKey:@"gdcInDCProcessorOutputCropDimensionsWidth"];
  [a3 encodeInt32:self->_gdcInDCProcessorOutputCropDimensions.height forKey:@"gdcInDCProcessorOutputCropDimensionsHeight"];
  [a3 encodeInt32:self->_greenGhostMitigationVersion forKey:@"greenGhostMitigationVersion"];
  [a3 encodeInt32:self->_deepZoomVersion forKey:@"deepZoomVersion"];
  [a3 encodeInt32:self->_demosaicedRawPixelFormat forKey:@"demosaicedRawPixelFormat"];
  [a3 encodeObject:self->_rawColorCalibrationsByPortType forKey:@"rawColorCalibrationsByPortType"];
  [a3 encodeObject:self->_rawLensShadingCorrectionCoefficientsByPortType forKey:@"rawLensShadingCorrectionCoefficientsByPortType"];
  [a3 encodeBool:self->_deferredProcessingSupported forKey:@"deferredProcessingSupported"];
  [a3 encodeBool:self->_adjustablePortraitLightingEffectStrengthSupported forKey:@"adjustablePortraitLightingEffectStrengthSupported"];
  [a3 encodeBool:self->_deepFusionSupported forKey:@"deepFusionSupported"];
  [a3 encodeInt32:self->_deepFusionEnhancedResolutionDimensions.width forKey:@"deepFusionEnhancedResolutionDimensionsWidth"];
  [a3 encodeInt32:self->_deepFusionEnhancedResolutionDimensions.height forKey:@"deepFusionEnhancedResolutionDimensionsHeight"];
  [a3 encodeBool:self->_learnedNRSupported forKey:@"learnedNRSupported"];
  [a3 encodeBool:self->_responsiveShutterSupported forKey:@"responsiveShutterSupported"];
  [a3 encodeBool:self->_responsiveShutterEnabled forKey:@"responsiveShutterEnabled"];
  [a3 encodeBool:self->_fastCapturePrioritizationEnabled forKey:@"fastCapturePrioritizationEnabled"];
  [a3 encodeBool:self->_captureTimePhotosCurationSupported forKey:@"captureTimePhotosCurationSupported"];
  [a3 encodeInt32:self->_depthDataType forKey:@"depthDataType"];
  [a3 encodeInt32:self->_pearlModuleType forKey:@"pearlModuleType"];
  [a3 encodeBool:self->_sifrStillImageCaptureEnabledIfAvailable forKey:@"sifrStillImageCaptureEnabledIfAvailable"];
  *(float *)&double v5 = self->_gainMapMainImageDownscalingFactor;
  [a3 encodeFloat:@"gainMapMainImageDownscalingFactor" forKey:v5];
  *(float *)&double v6 = self->_ubInferenceMainImageDownscalingFactor;
  [a3 encodeFloat:@"ubInferenceMainImageDownscalingFactor" forKey:v6];
  [a3 encodeObject:self->_enabledSemanticSegmentationMatteURNs forKey:@"enabledSemanticSegmentationMatteURNs"];
  [a3 encodeObject:self->_supportedSemanticSegmentationMatteURNs forKey:@"supportedSemanticSegmentationMatteURNs"];
  [a3 encodeInt32:self->_maxLossyCompressionLevel forKey:@"maxLossyCompressionLevel"];
  [a3 encodeObject:self->_cameraInfoByPortType forKey:@"cameraInfoByPortType"];
  [a3 encodeBool:self->_highQualityPhotoCaptureForVideoFormatEnabled forKey:@"highQualityPhotoCaptureForVideoFormatEnabled"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  uint64_t v58 = v6;
  uint64_t v59 = v5;
  uint64_t v60 = v3;
  uint64_t v61 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  v57.receiver = self;
  v57.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  unsigned int v9 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v57 isEqual:a3];
  if (v9)
  {
    int v10 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self stillImageSinkPipelineProcessingMode];
    if (v10 != [a3 stillImageSinkPipelineProcessingMode]) {
      goto LABEL_21;
    }
    unsigned int v11 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self pipelineStagePriority];
    if (v11 != [a3 pipelineStagePriority]) {
      goto LABEL_21;
    }
    unsigned int v12 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self inferencePriority];
    if (v12 != [a3 inferencePriority]) {
      goto LABEL_21;
    }
    int v13 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self deviceType];
    if (v13 != [a3 deviceType]) {
      goto LABEL_21;
    }
    unsigned int v9 = FigCaptureVideoDimensionsAreEqual(-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawSensorDimensions](self, "rawSensorDimensions"), [a3 rawSensorDimensions]);
    if (v9)
    {
      int v14 = (int)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self rawSensorDimensions];
      if (v14 != [a3 rawSensorDimensions]) {
        goto LABEL_21;
      }
      unint64_t v15 = (unint64_t)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self rawSensorDimensions] >> 32;
      if (v15 != (unint64_t)[a3 rawSensorDimensions] >> 32) {
        goto LABEL_21;
      }
      int v16 = (int)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self outputStillImageDimensions];
      if (v16 != [a3 outputStillImageDimensions]) {
        goto LABEL_21;
      }
      unint64_t v17 = (unint64_t)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self outputStillImageDimensions] >> 32;
      if (v17 != (unint64_t)[a3 outputStillImageDimensions] >> 32) {
        goto LABEL_21;
      }
      v18 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self sensorIDStringsByPortType];
      if (v18 == (NSDictionary *)[a3 sensorIDStringsByPortType]
        || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration sensorIDStringsByPortType](self, "sensorIDStringsByPortType"), "isEqual:", [a3 sensorIDStringsByPortType])) != 0)
      {
        v19 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self baseZoomFactorsByPortType];
        if (v19 == (NSDictionary *)[a3 baseZoomFactorsByPortType]
          || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration baseZoomFactorsByPortType](self, "baseZoomFactorsByPortType"), "isEqual:", [a3 baseZoomFactorsByPortType])) != 0)
        {
          int v20 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self redEyeReductionVersion];
          if (v20 != [a3 redEyeReductionVersion]) {
            goto LABEL_21;
          }
          int v21 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self semanticRenderingVersion];
          if (v21 != [a3 semanticRenderingVersion]) {
            goto LABEL_21;
          }
          int v22 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self semanticDevelopmentVersion];
          if (v22 != [a3 semanticDevelopmentVersion]) {
            goto LABEL_21;
          }
          int v23 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self semanticStyleRenderingEnabled];
          if (v23 != [a3 semanticStyleRenderingEnabled]) {
            goto LABEL_21;
          }
          v24 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self portTypesWithGeometricDistortionCorrectionEnabled];
          if (v24 == (NSArray *)[a3 portTypesWithGeometricDistortionCorrectionEnabled]
            || (unsigned int v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self, "portTypesWithGeometricDistortionCorrectionEnabled"), "isEqual:", [a3 portTypesWithGeometricDistortionCorrectionEnabled])) != 0)
          {
            v25 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self portTypesWithIntelligentDistortionCorrectionEnabled];
            if (v25 == (NSArray *)[a3 portTypesWithIntelligentDistortionCorrectionEnabled]
              || (unsigned int v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](self, "portTypesWithIntelligentDistortionCorrectionEnabled"), "isEqual:", [a3 portTypesWithIntelligentDistortionCorrectionEnabled])) != 0)
            {
              int v26 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self dcProcessorVersion];
              if (v26 != [a3 dcProcessorVersion]) {
                goto LABEL_21;
              }
              int v27 = (int)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self gdcInDCProcessorOutputCropDimensions];
              if (v27 != [a3 gdcInDCProcessorOutputCropDimensions]) {
                goto LABEL_21;
              }
              unint64_t v28 = (unint64_t)[(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self gdcInDCProcessorOutputCropDimensions] >> 32;
              if (v28 != (unint64_t)[a3 gdcInDCProcessorOutputCropDimensions] >> 32) {
                goto LABEL_21;
              }
              int v29 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self greenGhostMitigationVersion];
              if (v29 != [a3 greenGhostMitigationVersion]) {
                goto LABEL_21;
              }
              int v30 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self deepZoomVersion];
              if (v30 != [a3 deepZoomVersion]) {
                goto LABEL_21;
              }
              unsigned int v31 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self demosaicedRawPixelFormat];
              if (v31 != [a3 demosaicedRawPixelFormat]) {
                goto LABEL_21;
              }
              v32 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self rawColorCalibrationsByPortType];
              if (v32 == (NSDictionary *)[a3 rawColorCalibrationsByPortType]
                || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawColorCalibrationsByPortType](self, "rawColorCalibrationsByPortType"), "isEqual:", [a3 rawColorCalibrationsByPortType])) != 0)
              {
                v33 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self rawLensShadingCorrectionCoefficientsByPortType];
                if (v33 == (NSDictionary *)[a3 rawLensShadingCorrectionCoefficientsByPortType]
                  || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration rawLensShadingCorrectionCoefficientsByPortType](self, "rawLensShadingCorrectionCoefficientsByPortType"), "isEqual:", [a3 rawLensShadingCorrectionCoefficientsByPortType])) != 0)
                {
                  int v34 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self deferredProcessingSupported];
                  if (v34 != [a3 deferredProcessingSupported]) {
                    goto LABEL_21;
                  }
                  int v35 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self adjustablePortraitLightingEffectStrengthSupported];
                  if (v35 != [a3 adjustablePortraitLightingEffectStrengthSupported]) {
                    goto LABEL_21;
                  }
                  int v36 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self deepFusionSupported];
                  if (v36 != [a3 deepFusionSupported]) {
                    goto LABEL_21;
                  }
                  unsigned int v9 = FigCaptureVideoDimensionsAreEqual(-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration deepFusionEnhancedResolutionDimensions](self, "deepFusionEnhancedResolutionDimensions"), [a3 deepFusionEnhancedResolutionDimensions]);
                  if (!v9) {
                    return v9;
                  }
                  int v37 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self learnedNRSupported];
                  if (v37 != [a3 learnedNRSupported]) {
                    goto LABEL_21;
                  }
                  int v38 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self responsiveShutterSupported];
                  if (v38 != [a3 responsiveShutterSupported]) {
                    goto LABEL_21;
                  }
                  int v39 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self responsiveShutterEnabled];
                  if (v39 != [a3 responsiveShutterEnabled]) {
                    goto LABEL_21;
                  }
                  int v40 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self fastCapturePrioritizationEnabled];
                  if (v40 != [a3 fastCapturePrioritizationEnabled]) {
                    goto LABEL_21;
                  }
                  int v41 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self captureTimePhotosCurationSupported];
                  if (v41 != [a3 captureTimePhotosCurationSupported]) {
                    goto LABEL_21;
                  }
                  int v42 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self depthDataType];
                  if (v42 != [a3 depthDataType]) {
                    goto LABEL_21;
                  }
                  int v43 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self pearlModuleType];
                  if (v43 != [a3 pearlModuleType]) {
                    goto LABEL_21;
                  }
                  int v44 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self sifrStillImageCaptureEnabledIfAvailable];
                  if (v44 != [a3 sifrStillImageCaptureEnabledIfAvailable]) {
                    goto LABEL_21;
                  }
                  [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self gainMapMainImageDownscalingFactor];
                  float v46 = v45;
                  [a3 gainMapMainImageDownscalingFactor];
                  if (v46 != v47) {
                    goto LABEL_21;
                  }
                  [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self ubInferenceMainImageDownscalingFactor];
                  float v49 = v48;
                  [a3 ubInferenceMainImageDownscalingFactor];
                  if (v49 != v50) {
                    goto LABEL_21;
                  }
                  v51 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self enabledSemanticSegmentationMatteURNs];
                  if (v51 == (NSArray *)[a3 enabledSemanticSegmentationMatteURNs]
                    || (unsigned int v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"), "isEqual:", [a3 enabledSemanticSegmentationMatteURNs])) != 0)
                  {
                    v52 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self supportedSemanticSegmentationMatteURNs];
                    if (v52 == (NSArray *)[a3 supportedSemanticSegmentationMatteURNs]
                      || (unsigned int v9 = -[NSArray isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration supportedSemanticSegmentationMatteURNs](self, "supportedSemanticSegmentationMatteURNs"), "isEqual:", [a3 supportedSemanticSegmentationMatteURNs])) != 0)
                    {
                      int v53 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self maxLossyCompressionLevel];
                      if (v53 == [a3 maxLossyCompressionLevel])
                      {
                        v54 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self cameraInfoByPortType];
                        if (v54 == (NSDictionary *)[a3 cameraInfoByPortType]
                          || (unsigned int v9 = -[NSDictionary isEqual:](-[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration cameraInfoByPortType](self, "cameraInfoByPortType"), "isEqual:", [a3 cameraInfoByPortType])) != 0)
                        {
                          BOOL v55 = [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)self highQualityPhotoCaptureForVideoFormatEnabled];
                          LOBYTE(v9) = v55 ^ [a3 highQualityPhotoCaptureForVideoFormatEnabled] ^ 1;
                        }
                        return v9;
                      }
LABEL_21:
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
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration;
  [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v3 dealloc];
}

- (int)stillImageSinkPipelineProcessingMode
{
  return self->_stillImageSinkPipelineProcessingMode;
}

- (void)setStillImageSinkPipelineProcessingMode:(int)a3
{
  self->_stillImageSinkPipelineProcessingMode = a3;
}

- (unsigned)pipelineStagePriority
{
  return self->_pipelineStagePriority;
}

- (void)setPipelineStagePriority:(unsigned int)a3
{
  self->_pipelineStagePriority = a3;
}

- (unsigned)inferencePriority
{
  return self->_inferencePriority;
}

- (void)setInferencePriority:(unsigned int)a3
{
  self->_inferencePriority = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (BOOL)deviceHasFlash
{
  return self->_deviceHasFlash;
}

- (void)setDeviceHasFlash:(BOOL)a3
{
  self->_deviceHasFlash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)outputStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputStillImageDimensions;
}

- (void)setOutputStillImageDimensions:(id)a3
{
  self->_outputStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (NSDictionary)sensorIDStringsByPortType
{
  return self->_sensorIDStringsByPortType;
}

- (void)setSensorIDStringsByPortType:(id)a3
{
}

- (NSDictionary)baseZoomFactorsByPortType
{
  return self->_baseZoomFactorsByPortType;
}

- (void)setBaseZoomFactorsByPortType:(id)a3
{
}

- (int)redEyeReductionVersion
{
  return self->_redEyeReductionVersion;
}

- (void)setRedEyeReductionVersion:(int)a3
{
  self->_redEyeReductionVersion = a3;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (int)dcProcessorVersion
{
  return self->_dcProcessorVersion;
}

- (void)setDcProcessorVersion:(int)a3
{
  self->_dcProcessorVersion = a3;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
}

- (BOOL)gdcInDCProcessorSupported
{
  return self->_gdcInDCProcessorSupported;
}

- (void)setGdcInDCProcessorSupported:(BOOL)a3
{
  self->_gdcInDCProcessorSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)gdcInDCProcessorOutputCropDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_gdcInDCProcessorOutputCropDimensions;
}

- (void)setGdcInDCProcessorOutputCropDimensions:(id)a3
{
  self->_gdcInDCProcessorOutputCropDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (int)greenGhostMitigationVersion
{
  return self->_greenGhostMitigationVersion;
}

- (void)setGreenGhostMitigationVersion:(int)a3
{
  self->_greenGhostMitigationVersion = a3;
}

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

- (unsigned)demosaicedRawPixelFormat
{
  return self->_demosaicedRawPixelFormat;
}

- (void)setDemosaicedRawPixelFormat:(unsigned int)a3
{
  self->_demosaicedRawPixelFormat = a3;
}

- (NSDictionary)rawColorCalibrationsByPortType
{
  return self->_rawColorCalibrationsByPortType;
}

- (void)setRawColorCalibrationsByPortType:(id)a3
{
}

- (NSDictionary)rawLensShadingCorrectionCoefficientsByPortType
{
  return self->_rawLensShadingCorrectionCoefficientsByPortType;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(id)a3
{
}

- (BOOL)deferredProcessingSupported
{
  return self->_deferredProcessingSupported;
}

- (void)setDeferredProcessingSupported:(BOOL)a3
{
  self->_deferredProcessingSupported = a3;
}

- (BOOL)adjustablePortraitLightingEffectStrengthSupported
{
  return self->_adjustablePortraitLightingEffectStrengthSupported;
}

- (void)setAdjustablePortraitLightingEffectStrengthSupported:(BOOL)a3
{
  self->_adjustablePortraitLightingEffectStrengthSupported = a3;
}

- (BOOL)deepFusionSupported
{
  return self->_deepFusionSupported;
}

- (void)setDeepFusionSupported:(BOOL)a3
{
  self->_deepFusionSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)deepFusionEnhancedResolutionDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_deepFusionEnhancedResolutionDimensions;
}

- (void)setDeepFusionEnhancedResolutionDimensions:(id)a3
{
  self->_deepFusionEnhancedResolutionDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)learnedNRSupported
{
  return self->_learnedNRSupported;
}

- (void)setLearnedNRSupported:(BOOL)a3
{
  self->_learnedNRSupported = a3;
}

- (BOOL)responsiveShutterSupported
{
  return self->_responsiveShutterSupported;
}

- (void)setResponsiveShutterSupported:(BOOL)a3
{
  self->_responsiveShutterSupported = a3;
}

- (BOOL)responsiveShutterEnabled
{
  return self->_responsiveShutterEnabled;
}

- (void)setResponsiveShutterEnabled:(BOOL)a3
{
  self->_responsiveShutterEnabled = a3;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_fastCapturePrioritizationEnabled;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_fastCapturePrioritizationEnabled = a3;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (BOOL)sifrStillImageCaptureEnabledIfAvailable
{
  return self->_sifrStillImageCaptureEnabledIfAvailable;
}

- (void)setSifrStillImageCaptureEnabledIfAvailable:(BOOL)a3
{
  self->_sifrStillImageCaptureEnabledIfAvailable = a3;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (BOOL)highQualityPhotoCaptureForVideoFormatEnabled
{
  return self->_highQualityPhotoCaptureForVideoFormatEnabled;
}

- (void)setHighQualityPhotoCaptureForVideoFormatEnabled:(BOOL)a3
{
  self->_highQualityPhotoCaptureForVideoFormatEnabled = a3;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (float)ubInferenceMainImageDownscalingFactor
{
  return self->_ubInferenceMainImageDownscalingFactor;
}

- (void)setUbInferenceMainImageDownscalingFactor:(float)a3
{
  self->_ubInferenceMainImageDownscalingFactor = a3;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
}

- (NSArray)supportedSemanticSegmentationMatteURNs
{
  return self->_supportedSemanticSegmentationMatteURNs;
}

- (void)setSupportedSemanticSegmentationMatteURNs:(id)a3
{
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  self->_maxLossyCompressionLevel = a3;
}

@end