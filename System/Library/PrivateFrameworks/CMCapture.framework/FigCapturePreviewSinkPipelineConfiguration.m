@interface FigCapturePreviewSinkPipelineConfiguration
- (__n128)setClientAuditToken:(uint64_t)a1;
- (uint64_t)setClientIsCameraOrDerivative:(uint64_t)result;
- (uint64_t)setCoreMediaFaceTrackingEnabled:(uint64_t)result;
- (uint64_t)setDeferredPrepareEnabled:(uint64_t)result;
- (uint64_t)setIspFastSwitchEnabled:(uint64_t)result;
- (uint64_t)setMaxLossyCompressionLevel:(uint64_t)result;
- (uint64_t)setOverCaptureEnabled:(uint64_t)result;
- (uint64_t)setParallelGraphRebuildEnabled:(uint64_t)result;
- (uint64_t)setPocketDetectionEnabled:(uint64_t)result;
- (uint64_t)setPreallocatePreviewStitcherOutputBufferPool:(uint64_t)result;
- (uint64_t)setPreviewStabilizationEnabled:(uint64_t)result;
- (uint64_t)setRebuildingGraphForTrueVideoTransition:(uint64_t)result;
- (uint64_t)setRemoteVideoPreview:(uint64_t)result;
- (uint64_t)setSceneClassifierPipelineVersion:(uint64_t)result;
- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result;
- (uint64_t)setSmartStyleRenderingMethod:(uint64_t)result;
- (uint64_t)setSourceColorSpaceProperties:(uint64_t)result;
- (uint64_t)setSourceIsBravoDevice:(uint64_t)result;
- (uint64_t)setSourcePixelFormatIsFullRange:(uint64_t)result;
- (uint64_t)setTrueVideoCaptureAdditionalZoomFactor:(uint64_t)result;
- (uint64_t)setVideoStabilizationOverscan:(uint64_t)result;
- (uint64_t)setVitalityScoringEnabled:(uint64_t)result;
- (uint64_t)setZoomPIPMinimumUIZoomFactor:(uint64_t)result;
- (void)dealloc;
- (void)setStillImageConnectionConfiguration:(void *)a1;
@end

@implementation FigCapturePreviewSinkPipelineConfiguration

- (void)setStillImageConnectionConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 56);
  }
}

- (uint64_t)setSourceColorSpaceProperties:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 72) = a2;
  }
  return result;
}

- (uint64_t)setZoomPIPMinimumUIZoomFactor:(uint64_t)result
{
  if (result) {
    *(float *)(result + 160) = a2;
  }
  return result;
}

- (uint64_t)setVitalityScoringEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 112) = a2;
  }
  return result;
}

- (uint64_t)setVideoStabilizationOverscan:(uint64_t)result
{
  if (result) {
    *(double *)(result + 120) = a2;
  }
  return result;
}

- (uint64_t)setTrueVideoCaptureAdditionalZoomFactor:(uint64_t)result
{
  if (result) {
    *(double *)(result + 136) = a2;
  }
  return result;
}

- (uint64_t)setSourcePixelFormatIsFullRange:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 76) = a2;
  }
  return result;
}

- (uint64_t)setSourceIsBravoDevice:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 77) = a2;
  }
  return result;
}

- (uint64_t)setSmartStyleRenderingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 171) = a2;
  }
  return result;
}

- (uint64_t)setSceneClassifierPipelineVersion:(uint64_t)result
{
  if (result)
  {
    *(_DWORD *)(result + 64) = a2;
    *(_WORD *)(result + 68) = WORD2(a2);
  }
  return result;
}

- (uint64_t)setRemoteVideoPreview:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 114) = a2;
  }
  return result;
}

- (uint64_t)setRebuildingGraphForTrueVideoTransition:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 174) = a2;
  }
  return result;
}

- (uint64_t)setPreviewStabilizationEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 169) = a2;
  }
  return result;
}

- (uint64_t)setPreallocatePreviewStitcherOutputBufferPool:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 168) = a2;
  }
  return result;
}

- (uint64_t)setPocketDetectionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 170) = a2;
  }
  return result;
}

- (uint64_t)setParallelGraphRebuildEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 172) = a2;
  }
  return result;
}

- (uint64_t)setOverCaptureEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 115) = a2;
  }
  return result;
}

- (uint64_t)setMaxLossyCompressionLevel:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 152) = a2;
  }
  return result;
}

- (uint64_t)setIspFastSwitchEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 173) = a2;
  }
  return result;
}

- (uint64_t)setDeferredPrepareEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 113) = a2;
  }
  return result;
}

- (uint64_t)setClientIsCameraOrDerivative:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 78) = a2;
  }
  return result;
}

- (__n128)setClientAuditToken:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *(__n128 *)a2;
    long long v3 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 96) = v3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePreviewSinkPipelineConfiguration;
  [(FigCapturePreviewSinkPipelineConfiguration *)&v3 dealloc];
}

- (uint64_t)setSmartStyleRenderingMethod:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 188) = a2;
  }
  return result;
}

- (uint64_t)setCoreMediaFaceTrackingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 184) = a2;
  }
  return result;
}

@end