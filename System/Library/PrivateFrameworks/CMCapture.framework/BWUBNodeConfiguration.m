@interface BWUBNodeConfiguration
- (BOOL)alwaysAllowModifyingInputBuffers;
- (BOOL)deepFusionSupportEnabled;
- (BOOL)deepFusionSyntheticsInNRSupportEnabled;
- (BOOL)deepFusionWaitForPreprocessingToFinish;
- (BOOL)demosaicedRawEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)digitalFlashSupportEnabled;
- (BOOL)fusionSupportEnabled;
- (BOOL)generateLiDARDepth;
- (BOOL)inputIs10Bit;
- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions;
- (BOOL)outputPoolBackPressureEnabled;
- (BOOL)redEyeReductionEnabled;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)shouldComputeDisparityWhenCalibrationFails;
- (double)gainMapMainImageDownscalingFactor;
- (double)inferenceMainImageDownscalingFactor;
- (uint64_t)deepZoomVersion;
- (uint64_t)demosaicedRawPixelFormat;
- (uint64_t)disparityOutputDimensions;
- (uint64_t)geometricDistortionCorrectionExpandedImageDimensions;
- (uint64_t)greenGhostMitigationVersion;
- (uint64_t)horizontalSensorBinningFactor;
- (uint64_t)intelligentDistortionCorrectionVersion;
- (uint64_t)jasperSensorConfiguration;
- (uint64_t)learnedNRMode;
- (uint64_t)maxDeepFusionOutputCount;
- (uint64_t)maxNumberOfBurstCapturesAllowedInFlight;
- (uint64_t)minimumOutputBufferCount;
- (uint64_t)outputBufferCount;
- (uint64_t)outputDimensions;
- (uint64_t)personSemanticsVersion;
- (uint64_t)portTypesWithDepthSegmentationPortraitParameters;
- (uint64_t)portTypesWithGeometricDistortionCorrectionEnabled;
- (uint64_t)portTypesWithIntelligentDistortionCorrectionEnabled;
- (uint64_t)providedInferenceAttachedMediaByMode;
- (uint64_t)rawColorCalibrationsByPortType;
- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType;
- (uint64_t)referenceFrameSelectionDelegate;
- (uint64_t)retainedBufferCount;
- (uint64_t)semanticDevelopmentVersion;
- (uint64_t)semanticRenderingVersion;
- (uint64_t)sensorConfigurationsByPortType;
- (uint64_t)setAlwaysAllowModifyingInputBuffers:(uint64_t)result;
- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result;
- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result;
- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result;
- (uint64_t)setDeepZoomVersion:(uint64_t)result;
- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result;
- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result;
- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result;
- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result;
- (uint64_t)setDisparityOutputDimensions:(uint64_t)result;
- (uint64_t)setFusionSupportEnabled:(uint64_t)result;
- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result;
- (uint64_t)setGenerateLiDARDepth:(uint64_t)result;
- (uint64_t)setGeometricDistortionCorrectionExpandedImageDimensions:(uint64_t)result;
- (uint64_t)setGreenGhostMitigationVersion:(uint64_t)result;
- (uint64_t)setHorizontalSensorBinningFactor:(uint64_t)result;
- (uint64_t)setInferenceMainImageDownscalingFactor:(uint64_t)result;
- (uint64_t)setInputIs10Bit:(uint64_t)result;
- (uint64_t)setIntelligentDistortionCorrectionAppliesFinalDimensions:(uint64_t)result;
- (uint64_t)setIntelligentDistortionCorrectionVersion:(uint64_t)result;
- (uint64_t)setLearnedNRMode:(uint64_t)result;
- (uint64_t)setMaxDeepFusionOutputCount:(uint64_t)result;
- (uint64_t)setMaxNumberOfBurstCapturesAllowedInFlight:(uint64_t)result;
- (uint64_t)setMinimumOutputBufferCount:(uint64_t)result;
- (uint64_t)setOutputBufferCount:(uint64_t)result;
- (uint64_t)setOutputDimensions:(uint64_t)result;
- (uint64_t)setOutputPoolBackPressureEnabled:(uint64_t)result;
- (uint64_t)setPersonSemanticsVersion:(uint64_t)result;
- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result;
- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result;
- (uint64_t)setRetainedBufferCount:(uint64_t)result;
- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result;
- (uint64_t)setSemanticRenderingVersion:(uint64_t)result;
- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result;
- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result;
- (uint64_t)setStillImageFusionScheme:(uint64_t)result;
- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result;
- (uint64_t)stillImageFusionScheme;
- (uint64_t)verticalSensorBinningFactor;
- (void)dealloc;
- (void)setJasperSensorConfiguration:(void *)a1;
- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1;
- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1;
- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1;
- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1;
- (void)setRawColorCalibrationsByPortType:(void *)a1;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1;
- (void)setSensorConfigurationsByPortType:(void *)a1;
@end

@implementation BWUBNodeConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWUBNodeConfiguration;
  [(BWStillImageNodeConfiguration *)&v3 dealloc];
}

- (uint64_t)stillImageFusionScheme
{
  if (result) {
    return *(unsigned int *)(result + 104);
  }
  return result;
}

- (uint64_t)setStillImageFusionScheme:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 104) = a2;
  }
  return result;
}

- (uint64_t)sensorConfigurationsByPortType
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (void)setSensorConfigurationsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 112);
  }
}

- (uint64_t)jasperSensorConfiguration
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (void)setJasperSensorConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 128);
  }
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  if (result) {
    return *(unsigned char *)(result + 136) != 0;
  }
  return result;
}

- (uint64_t)setAlwaysAllowModifyingInputBuffers:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 136) = a2;
  }
  return result;
}

- (BOOL)inputIs10Bit
{
  if (result) {
    return *(unsigned char *)(result + 137) != 0;
  }
  return result;
}

- (uint64_t)setInputIs10Bit:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 137) = a2;
  }
  return result;
}

- (uint64_t)retainedBufferCount
{
  if (result) {
    return *(unsigned int *)(result + 140);
  }
  return result;
}

- (uint64_t)setRetainedBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 140) = a2;
  }
  return result;
}

- (uint64_t)outputBufferCount
{
  if (result) {
    return *(unsigned int *)(result + 144);
  }
  return result;
}

- (uint64_t)setOutputBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 144) = a2;
  }
  return result;
}

- (uint64_t)minimumOutputBufferCount
{
  if (result) {
    return *(unsigned int *)(result + 148);
  }
  return result;
}

- (uint64_t)setMinimumOutputBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 148) = a2;
  }
  return result;
}

- (uint64_t)maxNumberOfBurstCapturesAllowedInFlight
{
  if (result) {
    return *(unsigned int *)(result + 152);
  }
  return result;
}

- (uint64_t)setMaxNumberOfBurstCapturesAllowedInFlight:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 152) = a2;
  }
  return result;
}

- (BOOL)outputPoolBackPressureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 156) != 0;
  }
  return result;
}

- (uint64_t)setOutputPoolBackPressureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 156) = a2;
  }
  return result;
}

- (uint64_t)referenceFrameSelectionDelegate
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result
{
  if (result) {
    *(void *)(result + 160) = a2;
  }
  return result;
}

- (BOOL)fusionSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 168) != 0;
  }
  return result;
}

- (uint64_t)setFusionSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 168) = a2;
  }
  return result;
}

- (BOOL)digitalFlashSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 169) != 0;
  }
  return result;
}

- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 169) = a2;
  }
  return result;
}

- (BOOL)deepFusionSyntheticsInNRSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 170) != 0;
  }
  return result;
}

- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 170) = a2;
  }
  return result;
}

- (BOOL)deepFusionWaitForPreprocessingToFinish
{
  if (result) {
    return *(unsigned char *)(result + 171) != 0;
  }
  return result;
}

- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 171) = a2;
  }
  return result;
}

- (BOOL)deepFusionSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 172) != 0;
  }
  return result;
}

- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 172) = a2;
  }
  return result;
}

- (uint64_t)maxDeepFusionOutputCount
{
  if (result) {
    return *(unsigned int *)(result + 176);
  }
  return result;
}

- (uint64_t)setMaxDeepFusionOutputCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 176) = a2;
  }
  return result;
}

- (uint64_t)learnedNRMode
{
  if (result) {
    return *(unsigned int *)(result + 180);
  }
  return result;
}

- (uint64_t)setLearnedNRMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 180) = a2;
  }
  return result;
}

- (uint64_t)deepZoomVersion
{
  if (result) {
    return *(unsigned int *)(result + 184);
  }
  return result;
}

- (uint64_t)setDeepZoomVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 184) = a2;
  }
  return result;
}

- (double)gainMapMainImageDownscalingFactor
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 188);
  return result;
}

- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 188) = a2;
  }
  return result;
}

- (double)inferenceMainImageDownscalingFactor
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 192);
  return result;
}

- (uint64_t)setInferenceMainImageDownscalingFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 192) = a2;
  }
  return result;
}

- (uint64_t)providedInferenceAttachedMediaByMode
{
  if (result) {
    return *(void *)(result + 200);
  }
  return result;
}

- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 200);
  }
}

- (BOOL)redEyeReductionEnabled
{
  if (result) {
    return *(unsigned char *)(result + 208) != 0;
  }
  return result;
}

- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 208) = a2;
  }
  return result;
}

- (uint64_t)semanticRenderingVersion
{
  if (result) {
    return *(unsigned int *)(result + 212);
  }
  return result;
}

- (uint64_t)setSemanticRenderingVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 212) = a2;
  }
  return result;
}

- (uint64_t)semanticDevelopmentVersion
{
  if (result) {
    return *(unsigned int *)(result + 216);
  }
  return result;
}

- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 216) = a2;
  }
  return result;
}

- (uint64_t)personSemanticsVersion
{
  if (result) {
    return *(unsigned int *)(result + 220);
  }
  return result;
}

- (uint64_t)setPersonSemanticsVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 220) = a2;
  }
  return result;
}

- (BOOL)semanticStyleRenderingEnabled
{
  if (result) {
    return *(unsigned char *)(result + 224) != 0;
  }
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 224) = a2;
  }
  return result;
}

- (uint64_t)outputDimensions
{
  if (result) {
    return *(void *)(result + 228);
  }
  return result;
}

- (uint64_t)setOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 228) = a2;
  }
  return result;
}

- (uint64_t)portTypesWithGeometricDistortionCorrectionEnabled
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 240);
  }
}

- (uint64_t)geometricDistortionCorrectionExpandedImageDimensions
{
  if (result) {
    return *(void *)(result + 248);
  }
  return result;
}

- (uint64_t)setGeometricDistortionCorrectionExpandedImageDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 248) = a2;
  }
  return result;
}

- (uint64_t)portTypesWithIntelligentDistortionCorrectionEnabled
{
  if (result) {
    return *(void *)(result + 256);
  }
  return result;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 256);
  }
}

- (uint64_t)intelligentDistortionCorrectionVersion
{
  if (result) {
    return *(unsigned int *)(result + 264);
  }
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 264) = a2;
  }
  return result;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  if (result) {
    return *(unsigned char *)(result + 268) != 0;
  }
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionAppliesFinalDimensions:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 268) = a2;
  }
  return result;
}

- (uint64_t)horizontalSensorBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 272);
  }
  return result;
}

- (uint64_t)setHorizontalSensorBinningFactor:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 272) = a2;
  }
  return result;
}

- (uint64_t)verticalSensorBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 276);
  }
  return result;
}

- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 276) = a2;
  }
  return result;
}

- (uint64_t)greenGhostMitigationVersion
{
  if (result) {
    return *(unsigned int *)(result + 280);
  }
  return result;
}

- (uint64_t)setGreenGhostMitigationVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 280) = a2;
  }
  return result;
}

- (BOOL)depthDataDeliveryEnabled
{
  if (result) {
    return *(unsigned char *)(result + 284) != 0;
  }
  return result;
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 284) = a2;
  }
  return result;
}

- (uint64_t)portTypesWithDepthSegmentationPortraitParameters
{
  if (result) {
    return *(void *)(result + 288);
  }
  return result;
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 288);
  }
}

- (uint64_t)disparityOutputDimensions
{
  if (result) {
    return *(void *)(result + 296);
  }
  return result;
}

- (uint64_t)setDisparityOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 296) = a2;
  }
  return result;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  if (result) {
    return *(unsigned char *)(result + 304) != 0;
  }
  return result;
}

- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 304) = a2;
  }
  return result;
}

- (BOOL)demosaicedRawEnabled
{
  if (result) {
    return *(unsigned char *)(result + 305) != 0;
  }
  return result;
}

- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 305) = a2;
  }
  return result;
}

- (uint64_t)demosaicedRawPixelFormat
{
  if (result) {
    return *(unsigned int *)(result + 308);
  }
  return result;
}

- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 308) = a2;
  }
  return result;
}

- (uint64_t)rawColorCalibrationsByPortType
{
  if (result) {
    return *(void *)(result + 312);
  }
  return result;
}

- (void)setRawColorCalibrationsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 312);
  }
}

- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType
{
  if (result) {
    return *(void *)(result + 320);
  }
  return result;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 320);
  }
}

- (BOOL)generateLiDARDepth
{
  if (result) {
    return *(unsigned char *)(result + 328) != 0;
  }
  return result;
}

- (uint64_t)setGenerateLiDARDepth:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 328) = a2;
  }
  return result;
}

@end