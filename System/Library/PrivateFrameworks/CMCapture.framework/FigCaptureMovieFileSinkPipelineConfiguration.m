@interface FigCaptureMovieFileSinkPipelineConfiguration
- (BOOL)boxedMetadataPostVISEnabled;
- (BOOL)captureDeviceHasOverCaptureEnabled;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)trueVideoCaptureEnabled;
- (uint64_t)audioConnectionConfiguration;
- (uint64_t)cameraConfiguration;
- (uint64_t)setBoxedMetadataPostVISEnabled:(uint64_t)result;
- (uint64_t)setCaptureDeviceHasOverCaptureEnabled:(uint64_t)result;
- (uint64_t)setCinematicAudioEnabled:(uint64_t)result;
- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result;
- (uint64_t)setDepthOutputDimensions:(uint64_t)result;
- (uint64_t)setFrameReconstructionEnabled:(uint64_t)result;
- (uint64_t)setIspFastSwitchEnabled:(uint64_t)result;
- (uint64_t)setLightSourceMaskAndKeypointDescriptorDataEnabled:(uint64_t)result;
- (uint64_t)setLowResImageUsedByVideoEncoderEnabled:(uint64_t)result;
- (uint64_t)setMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setMaximumAllowedInFlightCompressedBytes:(uint64_t)result;
- (uint64_t)setMotionAttachmentsSource:(uint64_t)result;
- (uint64_t)setOfflineVISEnabled:(uint64_t)result;
- (uint64_t)setOverCaptureEnabled:(uint64_t)result;
- (uint64_t)setP3ToBT2020ConversionEnabled:(uint64_t)result;
- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result;
- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result;
- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result;
- (uint64_t)setSmartStyleRenderingMethod:(uint64_t)result;
- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result;
- (uint64_t)setTrueVideoCaptureEnabled:(uint64_t)result;
- (uint64_t)setVideoGreenGhostMitigationEnabled:(uint64_t)result;
- (uint64_t)setVideoSTFEnabled:(uint64_t)result;
- (uint64_t)setVideoSourceCaptureTransform:(uint64_t)a3;
- (uint64_t)setVideoStabilizationOverscanOverride:(uint64_t)result;
- (uint64_t)setVideoStabilizationStrength:(uint64_t)result;
- (uint64_t)setVideoStabilizationType:(uint64_t)result;
- (uint64_t)setVisOutputDimensions:(uint64_t)result;
- (uint64_t)setVitalityScoringEnabled:(uint64_t)result;
- (uint64_t)videoSourceCaptureTransform;
- (void)dealloc;
- (void)setAudioConnectionConfiguration:(void *)a1;
- (void)setCameraConfiguration:(void *)a1;
- (void)setCameraDebugInfoMetadataConnectionConfiguration:(void *)a1;
- (void)setClientApplicationID:(void *)a1;
- (void)setDepthDataConnectionConfiguration:(void *)a1;
- (void)setDetectedObjectMetadataConnectionConfigurations:(void *)a1;
- (void)setPortTypesWithGeometricDistortionCorrectionInVISEnabled:(void *)a1;
- (void)setSceneClassifierConnectionConfiguration:(void *)a1;
- (void)setStillImageConnectionConfiguration:(void *)a1;
- (void)setVideoConnectionConfiguration:(void *)a1;
- (void)setVisProcessingSemaphore:(void *)result;
@end

@implementation FigCaptureMovieFileSinkPipelineConfiguration

- (uint64_t)cameraConfiguration
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)setDepthDataConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 48);
  }
}

- (void)setCameraDebugInfoMetadataConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 32);
  }
}

- (uint64_t)setDepthDataDeliveryEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 193) = a2;
  }
  return result;
}

- (void)setDetectedObjectMetadataConnectionConfigurations:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 40);
  }
}

- (uint64_t)setVideoStabilizationType:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 104) = a2;
  }
  return result;
}

- (BOOL)smartStyleRenderingEnabled
{
  if (result) {
    return *(unsigned char *)(result + 195) != 0;
  }
  return result;
}

- (uint64_t)setVitalityScoringEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 136) = a2;
  }
  return result;
}

- (uint64_t)setVisOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 96) = a2;
  }
  return result;
}

- (uint64_t)setVideoStabilizationStrength:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 168) = a2;
  }
  return result;
}

- (uint64_t)setVideoSourceCaptureTransform:(uint64_t)a3
{
  if (result)
  {
    *(void *)(result + 80) = a2;
    *(void *)(result + 88) = a3;
  }
  return result;
}

- (uint64_t)setSmartStyleReversibilityEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 196) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleRenderingMethod:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 200) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 195) = a2;
  }
  return result;
}

- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result
{
  if (result)
  {
    *(_DWORD *)(result + 116) = a2;
    *(_WORD *)(result + 120) = WORD2(a2);
  }
  return result;
}

- (uint64_t)setSemanticStyleRenderingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 140) = a2;
  }
  return result;
}

- (void)setSceneClassifierConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 72);
  }
}

- (void)setPortTypesWithGeometricDistortionCorrectionInVISEnabled:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 128);
  }
}

- (uint64_t)setOfflineVISEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 122) = a2;
  }
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 112) = a2;
  }
  return result;
}

- (uint64_t)setMaximumAllowedInFlightCompressedBytes:(uint64_t)result
{
  if (result) {
    *(void *)(result + 184) = a2;
  }
  return result;
}

- (uint64_t)setMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 144) = a2;
  }
  return result;
}

- (uint64_t)setFrameReconstructionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 139) = a2;
  }
  return result;
}

- (void)setClientApplicationID:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 176);
  }
}

- (uint64_t)setBoxedMetadataPostVISEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 108) = a2;
  }
  return result;
}

- (uint64_t)audioConnectionConfiguration
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setCameraConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 8);
  }
}

- (void)setVideoConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 16);
  }
}

- (void)setAudioConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 24);
  }
}

- (uint64_t)setVideoSTFEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 148) = a2;
  }
  return result;
}

- (uint64_t)setLightSourceMaskAndKeypointDescriptorDataEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 192) = a2;
  }
  return result;
}

- (uint64_t)setCinematicAudioEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 160) = a2;
  }
  return result;
}

- (uint64_t)setVideoStabilizationOverscanOverride:(uint64_t)result
{
  if (result) {
    *(float *)(result + 164) = a2;
  }
  return result;
}

- (uint64_t)setVideoGreenGhostMitigationEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 149) = a2;
  }
  return result;
}

- (uint64_t)setTrueVideoCaptureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 151) = a2;
  }
  return result;
}

- (uint64_t)setLowResImageUsedByVideoEncoderEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 194) = a2;
  }
  return result;
}

- (uint64_t)setIspFastSwitchEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 150) = a2;
  }
  return result;
}

- (uint64_t)setCaptureDeviceHasOverCaptureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 137) = a2;
  }
  return result;
}

- (uint64_t)setOverCaptureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 138) = a2;
  }
  return result;
}

- (void)setStillImageConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 64);
  }
}

- (BOOL)captureDeviceHasOverCaptureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 137) != 0;
  }
  return result;
}

- (uint64_t)videoSourceCaptureTransform
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)setP3ToBT2020ConversionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 141) = a2;
  }
  return result;
}

- (BOOL)boxedMetadataPostVISEnabled
{
  if (result) {
    return *(unsigned char *)(result + 108) != 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkPipelineConfiguration;
  [(FigCaptureMovieFileSinkPipelineConfiguration *)&v3 dealloc];
}

- (void)setVisProcessingSemaphore:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    v4 = (void *)result[19];
    if (v4 != a2)
    {

      result = a2;
      v3[19] = result;
    }
  }
  return result;
}

- (uint64_t)setDepthOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (BOOL)trueVideoCaptureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 151) != 0;
  }
  return result;
}

@end