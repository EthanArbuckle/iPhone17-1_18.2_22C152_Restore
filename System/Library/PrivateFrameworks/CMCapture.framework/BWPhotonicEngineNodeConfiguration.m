@interface BWPhotonicEngineNodeConfiguration
- (BOOL)alwaysAllowModifyingInputBuffers;
- (BOOL)cmiResourceEnabled;
- (BOOL)constantColorClippingRecoveryEnabled;
- (BOOL)constantColorSaturationBoostEnabled;
- (BOOL)continuousZoomWithDepthSupported;
- (BOOL)dcProcessingWithDepthSupported;
- (BOOL)deepFusionSupportEnabled;
- (BOOL)deepFusionSyntheticsInNRSupportEnabled;
- (BOOL)deepFusionWaitForPreprocessingToFinish;
- (BOOL)demosaicedRawEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)digitalFlashSupportEnabled;
- (BOOL)fusionSupportEnabled;
- (BOOL)generateInferencesForSemanticProcessingIfNeeded;
- (BOOL)inputIs10Bit;
- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions;
- (BOOL)outputPoolBackPressureEnabled;
- (BOOL)quadraProcessingSupportEnabled;
- (BOOL)redEyeReductionEnabled;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)shouldComputeDisparityWhenCalibrationFails;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)softISPSupportEnabled;
- (BOOL)ultraHighResolutionProcessingEnabled;
- (BOOL)zoomingDisparityAllowed;
- (double)gainMapMainImageDownscalingFactor;
- (double)inferenceMainImageDownscalingFactor;
- (double)sensorCenterOffset;
- (uint64_t)constantColorVersion;
- (uint64_t)deepZoomMode;
- (uint64_t)deepZoomVersion;
- (uint64_t)demosaicedRawPixelFormat;
- (uint64_t)dimensionsByQSubResolutionFlavorByPortType;
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
- (uint64_t)portTypesWithRawNightModeEnabled;
- (uint64_t)providedInferenceAttachedMediaByMode;
- (uint64_t)rawColorCalibrationsByPortType;
- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType;
- (uint64_t)rawSensorDimensions;
- (uint64_t)referenceFrameSelectionDelegate;
- (uint64_t)retainedBufferCount;
- (uint64_t)semanticDevelopmentVersion;
- (uint64_t)semanticRenderingVersion;
- (uint64_t)sensorConfigurationsByPortType;
- (uint64_t)sensorRawPixelFormat;
- (uint64_t)setAlwaysAllowModifyingInputBuffers:(uint64_t)result;
- (uint64_t)setCmiResourceEnabled:(uint64_t)result;
- (uint64_t)setConstantColorClippingRecoveryEnabled:(uint64_t)result;
- (uint64_t)setConstantColorSaturationBoostEnabled:(uint64_t)result;
- (uint64_t)setConstantColorVersion:(uint64_t)result;
- (uint64_t)setContinuousZoomWithDepthSupported:(uint64_t)result;
- (uint64_t)setDcProcessingWithDepthSupported:(uint64_t)result;
- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result;
- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result;
- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result;
- (uint64_t)setDeepZoomMode:(uint64_t)result;
- (uint64_t)setDeepZoomVersion:(uint64_t)result;
- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result;
- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result;
- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result;
- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result;
- (uint64_t)setFusionSupportEnabled:(uint64_t)result;
- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result;
- (uint64_t)setGenerateInferencesForSemanticProcessingIfNeeded:(uint64_t)result;
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
- (uint64_t)setQuadraProcessingSupportEnabled:(uint64_t)result;
- (uint64_t)setRawSensorDimensions:(uint64_t)result;
- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result;
- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result;
- (uint64_t)setRetainedBufferCount:(uint64_t)result;
- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result;
- (uint64_t)setSemanticRenderingVersion:(uint64_t)result;
- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result;
- (uint64_t)setSensorCenterOffset:(double)a3;
- (uint64_t)setSensorRawPixelFormat:(uint64_t)result;
- (uint64_t)setSfhrMode:(uint64_t)result;
- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result;
- (uint64_t)setSmartStyleLinearThumbnailDimensions:(uint64_t)result;
- (uint64_t)setSmartStyleRenderingVersion:(uint64_t)result;
- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result;
- (uint64_t)setSmartStyleStyledThumbnailDimensions:(uint64_t)result;
- (uint64_t)setSoftISPSupportEnabled:(uint64_t)result;
- (uint64_t)setStandardFormatDimensions:(uint64_t)result;
- (uint64_t)setStillImageFusionScheme:(uint64_t)result;
- (uint64_t)setStillImageGDCSourceMode:(uint64_t)result;
- (uint64_t)setSwfrVersion:(uint64_t)result;
- (uint64_t)setUltraHighResolutionProcessingEnabled:(uint64_t)result;
- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result;
- (uint64_t)setZoomingDisparityAllowed:(uint64_t)result;
- (uint64_t)sfhrMode;
- (uint64_t)smartStyleLinearThumbnailDimensions;
- (uint64_t)smartStyleRenderingVersion;
- (uint64_t)smartStyleStyledThumbnailDimensions;
- (uint64_t)standardFormatDimensions;
- (uint64_t)stillImageFusionScheme;
- (uint64_t)stillImageGDCSourceMode;
- (uint64_t)swfrVersion;
- (uint64_t)verticalSensorBinningFactor;
- (void)dealloc;
- (void)setDimensionsByQSubResolutionFlavorByPortType:(void *)a1;
- (void)setJasperSensorConfiguration:(void *)a1;
- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1;
- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1;
- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1;
- (void)setPortTypesWithRawNightModeEnabled:(void *)a1;
- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1;
- (void)setRawColorCalibrationsByPortType:(void *)a1;
- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1;
- (void)setSensorConfigurationsByPortType:(void *)a1;
@end

@implementation BWPhotonicEngineNodeConfiguration

- (uint64_t)jasperSensorConfiguration
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (uint64_t)standardFormatDimensions
{
  if (result) {
    return *(void *)(result + 328);
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

- (uint64_t)demosaicedRawPixelFormat
{
  if (result) {
    return *(unsigned int *)(result + 404);
  }
  return result;
}

- (uint64_t)rawSensorDimensions
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

- (uint64_t)portTypesWithRawNightModeEnabled
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

- (BOOL)fusionSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 220) != 0;
  }
  return result;
}

- (BOOL)digitalFlashSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 221) != 0;
  }
  return result;
}

- (BOOL)depthDataDeliveryEnabled
{
  if (result) {
    return *(unsigned char *)(result + 388) != 0;
  }
  return result;
}

- (uint64_t)dimensionsByQSubResolutionFlavorByPortType
{
  if (result) {
    return *(void *)(result + 200);
  }
  return result;
}

- (uint64_t)learnedNRMode
{
  if (result) {
    return *(unsigned int *)(result + 240);
  }
  return result;
}

- (BOOL)softISPSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 168) != 0;
  }
  return result;
}

- (uint64_t)sfhrMode
{
  if (result) {
    return *(unsigned int *)(result + 216);
  }
  return result;
}

- (BOOL)quadraProcessingSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 169) != 0;
  }
  return result;
}

- (uint64_t)portTypesWithGeometricDistortionCorrectionEnabled
{
  if (result) {
    return *(void *)(result + 344);
  }
  return result;
}

- (BOOL)cmiResourceEnabled
{
  if (result) {
    return *(unsigned char *)(result + 424) != 0;
  }
  return result;
}

- (uint64_t)verticalSensorBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 380);
  }
  return result;
}

- (uint64_t)horizontalSensorBinningFactor
{
  if (result) {
    return *(unsigned int *)(result + 376);
  }
  return result;
}

- (double)sensorCenterOffset
{
  if (a1) {
    return *(double *)(a1 + 184);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)portTypesWithIntelligentDistortionCorrectionEnabled
{
  if (result) {
    return *(void *)(result + 360);
  }
  return result;
}

- (uint64_t)semanticRenderingVersion
{
  if (result) {
    return *(unsigned int *)(result + 280);
  }
  return result;
}

- (uint64_t)providedInferenceAttachedMediaByMode
{
  if (result) {
    return *(void *)(result + 264);
  }
  return result;
}

- (uint64_t)smartStyleRenderingVersion
{
  if (result) {
    return *(unsigned int *)(result + 296);
  }
  return result;
}

- (BOOL)redEyeReductionEnabled
{
  if (result) {
    return *(unsigned char *)(result + 276) != 0;
  }
  return result;
}

- (uint64_t)swfrVersion
{
  if (result) {
    return *(unsigned int *)(result + 272);
  }
  return result;
}

- (uint64_t)deepZoomVersion
{
  if (result) {
    return *(unsigned int *)(result + 244);
  }
  return result;
}

- (BOOL)deepFusionSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 234) != 0;
  }
  return result;
}

- (uint64_t)constantColorVersion
{
  if (result) {
    return *(unsigned int *)(result + 320);
  }
  return result;
}

- (uint64_t)stillImageFusionScheme
{
  if (result) {
    return *(unsigned int *)(result + 104);
  }
  return result;
}

- (uint64_t)sensorRawPixelFormat
{
  if (result) {
    return *(unsigned int *)(result + 172);
  }
  return result;
}

- (uint64_t)semanticDevelopmentVersion
{
  if (result) {
    return *(unsigned int *)(result + 284);
  }
  return result;
}

- (uint64_t)rawLensShadingCorrectionCoefficientsByPortType
{
  if (result) {
    return *(void *)(result + 416);
  }
  return result;
}

- (uint64_t)rawColorCalibrationsByPortType
{
  if (result) {
    return *(void *)(result + 408);
  }
  return result;
}

- (uint64_t)personSemanticsVersion
{
  if (result) {
    return *(unsigned int *)(result + 288);
  }
  return result;
}

- (uint64_t)greenGhostMitigationVersion
{
  if (result) {
    return *(unsigned int *)(result + 384);
  }
  return result;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  if (result) {
    return *(unsigned char *)(result + 326) != 0;
  }
  return result;
}

- (BOOL)demosaicedRawEnabled
{
  if (result) {
    return *(unsigned char *)(result + 403) != 0;
  }
  return result;
}

- (BOOL)deepFusionWaitForPreprocessingToFinish
{
  if (result) {
    return *(unsigned char *)(result + 233) != 0;
  }
  return result;
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  if (result) {
    return *(unsigned char *)(result + 324) != 0;
  }
  return result;
}

- (BOOL)alwaysAllowModifyingInputBuffers
{
  if (result) {
    return *(unsigned char *)(result + 136) != 0;
  }
  return result;
}

- (BOOL)zoomingDisparityAllowed
{
  if (result) {
    return *(unsigned char *)(result + 401) != 0;
  }
  return result;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  if (result) {
    return *(unsigned char *)(result + 402) != 0;
  }
  return result;
}

- (uint64_t)portTypesWithDepthSegmentationPortraitParameters
{
  if (result) {
    return *(void *)(result + 392);
  }
  return result;
}

- (uint64_t)intelligentDistortionCorrectionVersion
{
  if (result) {
    return *(unsigned int *)(result + 368);
  }
  return result;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  if (result) {
    return *(unsigned char *)(result + 372) != 0;
  }
  return result;
}

- (uint64_t)geometricDistortionCorrectionExpandedImageDimensions
{
  if (result) {
    return *(void *)(result + 352);
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

- (BOOL)outputPoolBackPressureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 156) != 0;
  }
  return result;
}

- (double)gainMapMainImageDownscalingFactor
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 252);
  return result;
}

- (uint64_t)retainedBufferCount
{
  if (result) {
    return *(unsigned int *)(result + 140);
  }
  return result;
}

- (BOOL)semanticStyleRenderingEnabled
{
  if (result) {
    return *(unsigned char *)(result + 292) != 0;
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

- (uint64_t)outputDimensions
{
  if (result) {
    return *(void *)(result + 336);
  }
  return result;
}

- (uint64_t)setVerticalSensorBinningFactor:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 380) = a2;
  }
  return result;
}

- (uint64_t)setUltraHighResolutionProcessingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 208) = a2;
  }
  return result;
}

- (uint64_t)setSwfrVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 272) = a2;
  }
  return result;
}

- (uint64_t)setStillImageGDCSourceMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 212) = a2;
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

- (uint64_t)setStandardFormatDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 328) = a2;
  }
  return result;
}

- (uint64_t)setSoftISPSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 168) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleStyledThumbnailDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 312) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 300) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleRenderingVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 296) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleLinearThumbnailDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 304) = a2;
  }
  return result;
}

- (uint64_t)setSfhrMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 216) = a2;
  }
  return result;
}

- (uint64_t)setSensorRawPixelFormat:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 172) = a2;
  }
  return result;
}

- (void)setSensorConfigurationsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 112);
  }
}

- (uint64_t)setSensorCenterOffset:(double)a3
{
  if (result)
  {
    *(double *)(result + 184) = a2;
    *(double *)(result + 192) = a3;
  }
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 292) = a2;
  }
  return result;
}

- (uint64_t)setSemanticRenderingVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 280) = a2;
  }
  return result;
}

- (uint64_t)setSemanticDevelopmentVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 284) = a2;
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

- (uint64_t)setReferenceFrameSelectionDelegate:(uint64_t)result
{
  if (result) {
    *(void *)(result + 160) = a2;
  }
  return result;
}

- (uint64_t)setRedEyeReductionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 276) = a2;
  }
  return result;
}

- (uint64_t)setRawSensorDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 176) = a2;
  }
  return result;
}

- (void)setRawLensShadingCorrectionCoefficientsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 416);
  }
}

- (void)setRawColorCalibrationsByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 408);
  }
}

- (uint64_t)setQuadraProcessingSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 169) = a2;
  }
  return result;
}

- (void)setProvidedInferenceAttachedMediaByMode:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 264);
  }
}

- (void)setPortTypesWithRawNightModeEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 224);
  }
}

- (uint64_t)setPersonSemanticsVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 288) = a2;
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

- (uint64_t)setOutputBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 144) = a2;
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

- (uint64_t)setMaxNumberOfBurstCapturesAllowedInFlight:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 152) = a2;
  }
  return result;
}

- (uint64_t)setMaxDeepFusionOutputCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 236) = a2;
  }
  return result;
}

- (uint64_t)setLearnedNRMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 240) = a2;
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

- (uint64_t)setInferenceMainImageDownscalingFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 256) = a2;
  }
  return result;
}

- (uint64_t)setHorizontalSensorBinningFactor:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 376) = a2;
  }
  return result;
}

- (uint64_t)setGreenGhostMitigationVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 384) = a2;
  }
  return result;
}

- (uint64_t)setGenerateInferencesForSemanticProcessingIfNeeded:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 326) = a2;
  }
  return result;
}

- (uint64_t)setGainMapMainImageDownscalingFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 252) = a2;
  }
  return result;
}

- (uint64_t)setFusionSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 220) = a2;
  }
  return result;
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 200);
  }
}

- (uint64_t)setDigitalFlashSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 221) = a2;
  }
  return result;
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 388) = a2;
  }
  return result;
}

- (uint64_t)setDemosaicedRawEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 403) = a2;
  }
  return result;
}

- (uint64_t)setDeepZoomVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 244) = a2;
  }
  return result;
}

- (uint64_t)setDeepZoomMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 248) = a2;
  }
  return result;
}

- (uint64_t)setDeepFusionWaitForPreprocessingToFinish:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 233) = a2;
  }
  return result;
}

- (uint64_t)setDeepFusionSyntheticsInNRSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 232) = a2;
  }
  return result;
}

- (uint64_t)setDeepFusionSupportEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 234) = a2;
  }
  return result;
}

- (uint64_t)setContinuousZoomWithDepthSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 400) = a2;
  }
  return result;
}

- (uint64_t)setConstantColorVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 320) = a2;
  }
  return result;
}

- (uint64_t)setConstantColorSaturationBoostEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 325) = a2;
  }
  return result;
}

- (uint64_t)setConstantColorClippingRecoveryEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 324) = a2;
  }
  return result;
}

- (uint64_t)setCmiResourceEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 424) = a2;
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

- (uint64_t)setZoomingDisparityAllowed:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 401) = a2;
  }
  return result;
}

- (uint64_t)setShouldComputeDisparityWhenCalibrationFails:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 402) = a2;
  }
  return result;
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 360);
  }
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 344);
  }
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 392);
  }
}

- (void)setJasperSensorConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 128);
  }
}

- (uint64_t)setIntelligentDistortionCorrectionVersion:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 368) = a2;
  }
  return result;
}

- (uint64_t)setIntelligentDistortionCorrectionAppliesFinalDimensions:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 372) = a2;
  }
  return result;
}

- (uint64_t)setGeometricDistortionCorrectionExpandedImageDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 352) = a2;
  }
  return result;
}

- (uint64_t)setDcProcessingWithDepthSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 373) = a2;
  }
  return result;
}

- (BOOL)ultraHighResolutionProcessingEnabled
{
  if (result) {
    return *(unsigned char *)(result + 208) != 0;
  }
  return result;
}

- (uint64_t)maxDeepFusionOutputCount
{
  if (result) {
    return *(unsigned int *)(result + 236);
  }
  return result;
}

- (double)inferenceMainImageDownscalingFactor
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 256);
  return result;
}

- (uint64_t)deepZoomMode
{
  if (result) {
    return *(unsigned int *)(result + 248);
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNodeConfiguration;
  [(BWStillImageNodeConfiguration *)&v3 dealloc];
}

- (uint64_t)minimumOutputBufferCount
{
  if (result) {
    return *(unsigned int *)(result + 148);
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

- (uint64_t)referenceFrameSelectionDelegate
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

- (uint64_t)stillImageGDCSourceMode
{
  if (result) {
    return *(unsigned int *)(result + 212);
  }
  return result;
}

- (BOOL)deepFusionSyntheticsInNRSupportEnabled
{
  if (result) {
    return *(unsigned char *)(result + 232) != 0;
  }
  return result;
}

- (BOOL)smartStyleReversibilityEnabled
{
  if (result) {
    return *(unsigned char *)(result + 300) != 0;
  }
  return result;
}

- (uint64_t)smartStyleLinearThumbnailDimensions
{
  if (result) {
    return *(void *)(result + 304);
  }
  return result;
}

- (uint64_t)smartStyleStyledThumbnailDimensions
{
  if (result) {
    return *(void *)(result + 312);
  }
  return result;
}

- (BOOL)constantColorSaturationBoostEnabled
{
  if (result) {
    return *(unsigned char *)(result + 325) != 0;
  }
  return result;
}

- (uint64_t)setOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 336) = a2;
  }
  return result;
}

- (BOOL)dcProcessingWithDepthSupported
{
  if (result) {
    return *(unsigned char *)(result + 373) != 0;
  }
  return result;
}

- (BOOL)continuousZoomWithDepthSupported
{
  if (result) {
    return *(unsigned char *)(result + 400) != 0;
  }
  return result;
}

- (uint64_t)setDemosaicedRawPixelFormat:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 404) = a2;
  }
  return result;
}

@end