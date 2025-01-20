@interface FigCaptureVideoDataSinkPipelineConfiguration
- (BOOL)deskCamEnabled;
- (__n128)setClientAuditToken:(uint64_t)a1;
- (uint64_t)setFaceTrackingEnabled:(uint64_t)result;
- (uint64_t)setForcePixelTransfer:(uint64_t)result;
- (uint64_t)setMotionAttachmentsSource:(uint64_t)result;
- (uint64_t)setOfflineVISMotionDataEnabled:(uint64_t)result;
- (uint64_t)setOverheadCameraMode:(uint64_t)result;
- (uint64_t)setPocketDetectionEnabled:(uint64_t)result;
- (uint64_t)setSourceVideoTransform:(uint64_t)a3;
- (uint64_t)setVideoSTFEnabled:(uint64_t)result;
- (uint64_t)setVisOutputDimensions:(uint64_t)result;
- (uint64_t)sourceDeviceType;
- (void)dealloc;
- (void)setClientApplicationID:(void *)a1;
@end

@implementation FigCaptureVideoDataSinkPipelineConfiguration

- (uint64_t)sourceDeviceType
{
  if (result) {
    return *(unsigned int *)(result + 72);
  }
  return result;
}

- (uint64_t)setVisOutputDimensions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 76) = a2;
  }
  return result;
}

- (uint64_t)setVideoSTFEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 61) = a2;
  }
  return result;
}

- (uint64_t)setSourceVideoTransform:(uint64_t)a3
{
  if (result)
  {
    *(void *)(result + 8) = a2;
    *(void *)(result + 16) = a3;
  }
  return result;
}

- (uint64_t)setPocketDetectionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 129) = a2;
  }
  return result;
}

- (uint64_t)setOfflineVISMotionDataEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 37) = a2;
  }
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setForcePixelTransfer:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 60) = a2;
  }
  return result;
}

- (uint64_t)setFaceTrackingEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 36) = a2;
  }
  return result;
}

- (__n128)setClientAuditToken:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *(__n128 *)a2;
    long long v3 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 112) = v3;
  }
  return result;
}

- (void)setClientApplicationID:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 152);
  }
}

- (BOOL)deskCamEnabled
{
  if (result) {
    return *(unsigned char *)(result + 136) != 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkPipelineConfiguration;
  [(FigCaptureVideoDataSinkPipelineConfiguration *)&v3 dealloc];
}

- (uint64_t)setOverheadCameraMode:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 140) = a2;
  }
  return result;
}

@end