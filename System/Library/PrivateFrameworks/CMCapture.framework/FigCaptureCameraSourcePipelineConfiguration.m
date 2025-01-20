@interface FigCaptureCameraSourcePipelineConfiguration
- (BOOL)RGBIRStereoFusionEnabled;
- (BOOL)configureForSIFRStillImageCaptureIfAvailable;
- (BOOL)midFrameSynchronizationEnabled;
- (BOOL)smartStyleLearningEnabled;
- (BOOL)softISPEnabled;
- (BOOL)stereoVideoCaptureEnabled;
- (__n128)setMaxExposureDurationClientOverride:(uint64_t)a1;
- (__n128)setMaxExposureDurationFrameworkOverride:(uint64_t)a1;
- (uint64_t)cameraConfiguration;
- (uint64_t)depthType;
- (uint64_t)setActionCameraEnabled:(uint64_t)result;
- (uint64_t)setAdditionalVISOverscanWhenRecording:(uint64_t)result;
- (uint64_t)setAudioMixWithOthersEnabled:(uint64_t)result;
- (uint64_t)setAutoImageControlMode:(uint64_t)result;
- (uint64_t)setCaptureDimensionsForFSDNetSecondary:(uint64_t)result;
- (uint64_t)setClientIsCameraOrDerivative:(uint64_t)result;
- (uint64_t)setClientIsVOIP:(uint64_t)result;
- (uint64_t)setClockSynchronizationEnabled:(uint64_t)result;
- (uint64_t)setConfigureForDepthDataDeliverySupport:(uint64_t)result;
- (uint64_t)setConfigureForDigitalFlashSupport:(uint64_t)result;
- (uint64_t)setConfigureForSIFRStillImageCaptureIfAvailable:(uint64_t)result;
- (uint64_t)setConfigureForSoftISPSupport:(uint64_t)result;
- (uint64_t)setConfigureForSpatialOverCaptureSupport:(uint64_t)result;
- (uint64_t)setConfigureForStereoPhotoCaptureSupport:(uint64_t)result;
- (uint64_t)setConfigureForZeroShutterLagSupport:(uint64_t)result;
- (uint64_t)setContinuityCameraClientDeviceClass:(uint64_t)result;
- (uint64_t)setContinuityCameraIsWired:(uint64_t)result;
- (uint64_t)setCoreMediaFaceTrackingEnabled:(uint64_t)result;
- (uint64_t)setDeferredTimeOfFlightNodePrepareEnabled:(uint64_t)result;
- (uint64_t)setDepthConversionEnabled:(uint64_t)result;
- (uint64_t)setDepthDimensionsOverride:(uint64_t)result;
- (uint64_t)setDepthOutputEnabled:(uint64_t)result;
- (uint64_t)setDepthType:(uint64_t)result;
- (uint64_t)setEnableStillImageSensorOverscanIfAvailable:(uint64_t)result;
- (uint64_t)setForceCNRDisabled:(uint64_t)result;
- (uint64_t)setGraphContainsMultipleVideoSources:(uint64_t)result;
- (uint64_t)setIspFaceTrackingEnabled:(uint64_t)result;
- (uint64_t)setIspFaceTrackingFailureFieldOfViewModifier:(uint64_t)result;
- (uint64_t)setIspFaceTrackingNetworkFailureThresholdMultiplier:(uint64_t)result;
- (uint64_t)setIspFaceTrackingNumTrackedFaces:(uint64_t)result;
- (uint64_t)setIspFaceTrackingUseRecognition:(uint64_t)result;
- (uint64_t)setLumaHistogramsEnabled:(uint64_t)result;
- (uint64_t)setMaxContinuousZoomFactorForDepthDataDelivery:(uint64_t)result;
- (uint64_t)setMidFrameSynchronizationEnabled:(uint64_t)result;
- (uint64_t)setMotionAttachmentsSource:(uint64_t)result;
- (uint64_t)setMovieFileMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setOverCapturePercentage:(uint64_t)result;
- (uint64_t)setPostColorProcessingThumbnailEnabled:(uint64_t)result;
- (uint64_t)setPreLTMThumbnailEnabled:(uint64_t)result;
- (uint64_t)setPreviewMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setRGBIRStereoFusionEnabled:(uint64_t)result;
- (uint64_t)setRGBIRStereoFusionFixedDepthThresholdMM:(uint64_t)result;
- (uint64_t)setRGBIRStereoFusionFixedDepthValueMM:(uint64_t)result;
- (uint64_t)setRGBIRStereoFusionMaxDepthThresholdMM:(uint64_t)result;
- (uint64_t)setRGBIRStereoFusionMinDepthThresholdMM:(uint64_t)result;
- (uint64_t)setRebuildingGraphForTrueVideoTransition:(uint64_t)result;
- (uint64_t)setSensorRawStillImageOutputsEnabledIfAvailable:(uint64_t)result;
- (uint64_t)setSmartStyleLearningEnabled:(uint64_t)result;
- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result;
- (uint64_t)setSoftISPEnabled:(uint64_t)result;
- (uint64_t)setStereoVideoCaptureEnabled:(uint64_t)result;
- (uint64_t)setStillImageFocusPixelDataRetainedBufferCount:(uint64_t)result;
- (uint64_t)setStillImageMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setStillImageOutputRetainedBufferCountOverride:(uint64_t)result;
- (uint64_t)setStillImageOutputSushiRawAttachmentOptionEnabled:(uint64_t)result;
- (uint64_t)setStillImageSashimiRawRetainedBufferCount:(uint64_t)result;
- (uint64_t)setStreamingCameraCalibrationDataDeliveryEnabled:(uint64_t)result;
- (uint64_t)setStreamingForegroundSegmentationEnabled:(uint64_t)result;
- (uint64_t)setStrictDepthModePreferred:(uint64_t)result;
- (uint64_t)setStructuredLightAFAssistEnabled:(uint64_t)result;
- (uint64_t)setSuppressVideoEffects:(uint64_t)result;
- (uint64_t)setTargetFrameRateWhenNotRecording:(uint64_t)result;
- (uint64_t)setTemporalNoiseReductionStrengthHighEnabled:(uint64_t)result;
- (uint64_t)setVideoDataMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setVideoHDRImageStatisticsEnabled:(uint64_t)result;
- (uint64_t)setVideoSTFMetadataEnabled:(uint64_t)result;
- (uint64_t)setZeroShutterLagEnabled:(uint64_t)result;
- (uint64_t)setZoomPIPMinimumUIZoomFactor:(uint64_t)result;
- (uint64_t)setZoomPIPSingleStreamModeEnabled:(uint64_t)result;
- (uint64_t)setZoomPIPSlaveStreamingFrameRate:(uint64_t)result;
- (void)dealloc;
- (void)setCameraConfiguration:(void *)a1;
- (void)setDepthDataConnectionConfiguration:(void *)a1;
- (void)setMetadataObjectConnectionConfigurations:(void *)a1;
- (void)setMovieFileDetectedObjectMetadataConnectionConfigurations:(void *)a1;
- (void)setPointCloudDataConnectionConfigurations:(void *)a1;
- (void)setPreferredMasterPortType:(void *)a1;
- (void)setPreviewDerivedConnectionConfigurations:(void *)a1;
- (void)setSmartStyle:(void *)a1;
- (void)setStillImageConnectionConfiguration:(void *)a1;
- (void)setVideoCaptureConnectionConfigurations:(void *)a1;
- (void)setVideoPreviewSinkConnectionConfiguration:(void *)a1;
- (void)setVisionDataConnectionConfigurations:(void *)a1;
@end

@implementation FigCaptureCameraSourcePipelineConfiguration

- (BOOL)stereoVideoCaptureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 346) != 0;
  }
  return result;
}

- (BOOL)smartStyleLearningEnabled
{
  if (result) {
    return *(unsigned char *)(result + 320) != 0;
  }
  return result;
}

- (uint64_t)setActionCameraEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setIspFaceTrackingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 118) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForSpatialOverCaptureSupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 152) = a2;
  }
  return result;
}

- (void)setCameraConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 184);
  }
}

- (uint64_t)setAutoImageControlMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 180) = a2;
  }
  return result;
}

- (BOOL)softISPEnabled
{
  if (result) {
    return *(unsigned char *)(result + 145) != 0;
  }
  return result;
}

- (void)setVisionDataConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 232);
  }
}

- (uint64_t)setVideoSTFMetadataEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 272) = a2;
  }
  return result;
}

- (void)setVideoPreviewSinkConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 192);
  }
}

- (uint64_t)setVideoHDRImageStatisticsEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 266) = a2;
  }
  return result;
}

- (uint64_t)setVideoDataMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 280) = a2;
  }
  return result;
}

- (void)setVideoCaptureConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 208);
  }
}

- (uint64_t)setTemporalNoiseReductionStrengthHighEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 349) = a2;
  }
  return result;
}

- (uint64_t)setSuppressVideoEffects:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 301) = a2;
  }
  return result;
}

- (uint64_t)setStructuredLightAFAssistEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 348) = a2;
  }
  return result;
}

- (uint64_t)setStillImageOutputRetainedBufferCountOverride:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 172) = a2;
  }
  return result;
}

- (uint64_t)setStillImageMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 288) = a2;
  }
  return result;
}

- (void)setStillImageConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 216);
  }
}

- (uint64_t)setStereoVideoCaptureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 346) = a2;
  }
  return result;
}

- (uint64_t)setSoftISPEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 145) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 321) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleLearningEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 320) = a2;
  }
  return result;
}

- (void)setSmartStyle:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 328);
  }
}

- (uint64_t)setSensorRawStillImageOutputsEnabledIfAvailable:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 146) = a2;
  }
  return result;
}

- (uint64_t)setRebuildingGraphForTrueVideoTransition:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 336) = a2;
  }
  return result;
}

- (uint64_t)setPreviewMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 276) = a2;
  }
  return result;
}

- (void)setPreviewDerivedConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 200);
  }
}

- (void)setPreferredMasterPortType:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 312);
  }
}

- (void)setPointCloudDataConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 256);
  }
}

- (uint64_t)setMovieFileMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 284) = a2;
  }
  return result;
}

- (void)setMovieFileDetectedObjectMetadataConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 248);
  }
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

- (void)setMetadataObjectConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 240);
  }
}

- (__n128)setMaxExposureDurationClientOverride:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *a2;
    *(void *)(a1 + 84) = a2[1].n128_u64[0];
    *(__n128 *)(a1 + 68) = result;
  }
  return result;
}

- (uint64_t)setMaxContinuousZoomFactorForDepthDataDelivery:(uint64_t)result
{
  if (result) {
    *(float *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setLumaHistogramsEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 293) = a2;
  }
  return result;
}

- (uint64_t)setGraphContainsMultipleVideoSources:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 347) = a2;
  }
  return result;
}

- (uint64_t)setForceCNRDisabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 116) = a2;
  }
  return result;
}

- (uint64_t)setEnableStillImageSensorOverscanIfAvailable:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 147) = a2;
  }
  return result;
}

- (uint64_t)setDepthType:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 28) = a2;
  }
  return result;
}

- (void)setDepthDataConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 224);
  }
}

- (uint64_t)setDepthConversionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 158) = a2;
  }
  return result;
}

- (uint64_t)setDeferredTimeOfFlightNodePrepareEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 265) = a2;
  }
  return result;
}

- (uint64_t)setCoreMediaFaceTrackingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 117) = a2;
  }
  return result;
}

- (uint64_t)setContinuityCameraIsWired:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 294) = a2;
  }
  return result;
}

- (uint64_t)setContinuityCameraClientDeviceClass:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 296) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForStereoPhotoCaptureSupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 156) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForSoftISPSupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 154) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForDigitalFlashSupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 153) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForDepthDataDeliverySupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 155) = a2;
  }
  return result;
}

- (uint64_t)setClockSynchronizationEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 157) = a2;
  }
  return result;
}

- (uint64_t)setClientIsVOIP:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 300) = a2;
  }
  return result;
}

- (uint64_t)setClientIsCameraOrDerivative:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 264) = a2;
  }
  return result;
}

- (uint64_t)setAudioMixWithOthersEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 350) = a2;
  }
  return result;
}

- (uint64_t)setAdditionalVISOverscanWhenRecording:(uint64_t)result
{
  if (result) {
    *(float *)(result + 268) = a2;
  }
  return result;
}

- (BOOL)RGBIRStereoFusionEnabled
{
  if (result) {
    return *(unsigned char *)(result + 64) != 0;
  }
  return result;
}

- (uint64_t)setRGBIRStereoFusionFixedDepthThresholdMM:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setZoomPIPSlaveStreamingFrameRate:(uint64_t)result
{
  if (result) {
    *(float *)(result + 308) = a2;
  }
  return result;
}

- (uint64_t)setZoomPIPSingleStreamModeEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 302) = a2;
  }
  return result;
}

- (uint64_t)setZoomPIPMinimumUIZoomFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 304) = a2;
  }
  return result;
}

- (uint64_t)setRGBIRStereoFusionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 64) = a2;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCameraSourcePipelineConfiguration;
  [(FigCaptureCameraSourcePipelineConfiguration *)&v3 dealloc];
}

- (uint64_t)setRGBIRStereoFusionMaxDepthThresholdMM:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 52) = a2;
  }
  return result;
}

- (uint64_t)setIspFaceTrackingUseRecognition:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 128) = a2;
  }
  return result;
}

- (uint64_t)setStillImageSashimiRawRetainedBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 164) = a2;
  }
  return result;
}

- (uint64_t)setRGBIRStereoFusionMinDepthThresholdMM:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)depthType
{
  if (result) {
    return *(unsigned int *)(result + 28);
  }
  return result;
}

- (uint64_t)setStrictDepthModePreferred:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 44) = a2;
  }
  return result;
}

- (uint64_t)setRGBIRStereoFusionFixedDepthValueMM:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 60) = a2;
  }
  return result;
}

- (uint64_t)setDepthDimensionsOverride:(uint64_t)result
{
  if (result) {
    *(void *)(result + 36) = a2;
  }
  return result;
}

- (__n128)setMaxExposureDurationFrameworkOverride:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *a2;
    *(void *)(a1 + 108) = a2[1].n128_u64[0];
    *(__n128 *)(a1 + 92) = result;
  }
  return result;
}

- (uint64_t)setIspFaceTrackingNumTrackedFaces:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 120) = a2;
  }
  return result;
}

- (uint64_t)setIspFaceTrackingNetworkFailureThresholdMultiplier:(uint64_t)result
{
  if (result) {
    *(float *)(result + 124) = a2;
  }
  return result;
}

- (uint64_t)setIspFaceTrackingFailureFieldOfViewModifier:(uint64_t)result
{
  if (result) {
    *(float *)(result + 132) = a2;
  }
  return result;
}

- (uint64_t)setZeroShutterLagEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 142) = a2;
  }
  return result;
}

- (uint64_t)setConfigureForZeroShutterLagSupport:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 143) = a2;
  }
  return result;
}

- (BOOL)configureForSIFRStillImageCaptureIfAvailable
{
  if (result) {
    return *(unsigned char *)(result + 144) != 0;
  }
  return result;
}

- (uint64_t)setConfigureForSIFRStillImageCaptureIfAvailable:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 144) = a2;
  }
  return result;
}

- (uint64_t)setOverCapturePercentage:(uint64_t)result
{
  if (result) {
    *(float *)(result + 148) = a2;
  }
  return result;
}

- (BOOL)midFrameSynchronizationEnabled
{
  if (result) {
    return *(unsigned char *)(result + 159) != 0;
  }
  return result;
}

- (uint64_t)setMidFrameSynchronizationEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 159) = a2;
  }
  return result;
}

- (uint64_t)setStillImageFocusPixelDataRetainedBufferCount:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 160) = a2;
  }
  return result;
}

- (uint64_t)setStillImageOutputSushiRawAttachmentOptionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 176) = a2;
  }
  return result;
}

- (uint64_t)setStreamingForegroundSegmentationEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 177) = a2;
  }
  return result;
}

- (uint64_t)setStreamingCameraCalibrationDataDeliveryEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 178) = a2;
  }
  return result;
}

- (uint64_t)cameraConfiguration
{
  if (result) {
    return *(void *)(result + 184);
  }
  return result;
}

- (uint64_t)setDepthOutputEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 292) = a2;
  }
  return result;
}

- (uint64_t)setTargetFrameRateWhenNotRecording:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 340) = a2;
  }
  return result;
}

- (uint64_t)setPreLTMThumbnailEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 344) = a2;
  }
  return result;
}

- (uint64_t)setPostColorProcessingThumbnailEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 345) = a2;
  }
  return result;
}

- (uint64_t)setCaptureDimensionsForFSDNetSecondary:(uint64_t)result
{
  if (result) {
    *(void *)(result + 352) = a2;
  }
  return result;
}

@end