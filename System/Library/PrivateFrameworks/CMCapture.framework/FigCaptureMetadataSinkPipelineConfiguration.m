@interface FigCaptureMetadataSinkPipelineConfiguration
- (BOOL)compressed8BitInputEnabled;
- (uint64_t)setBoxedMetadataEnabled:(uint64_t)result;
- (uint64_t)setCompressed8BitInputEnabled:(uint64_t)result;
- (uint64_t)setDeferredPrepareEnabled:(uint64_t)result;
- (uint64_t)setInputRotationRelativeToSource:(uint64_t)result;
- (uint64_t)setMotionAttachmentsSource:(uint64_t)result;
- (uint64_t)setMrcLowPowerModeEnabled:(uint64_t)result;
- (uint64_t)setPreviewEnabled:(uint64_t)result;
- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result;
- (uint64_t)setUseSceneClassifierToGateMetadataDetection:(uint64_t)result;
- (uint64_t)setVitalityScoringEnabled:(uint64_t)result;
- (void)dealloc;
@end

@implementation FigCaptureMetadataSinkPipelineConfiguration

- (uint64_t)setVitalityScoringEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setCompressed8BitInputEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 49) = a2;
  }
  return result;
}

- (uint64_t)setUseSceneClassifierToGateMetadataDetection:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 33) = a2;
  }
  return result;
}

- (uint64_t)setSmartCameraPipelineVersion:(uint64_t)result
{
  if (result)
  {
    *(_DWORD *)(result + 34) = a2;
    *(_WORD *)(result + 38) = WORD2(a2);
  }
  return result;
}

- (uint64_t)setPreviewEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 42) = a2;
  }
  return result;
}

- (uint64_t)setMotionAttachmentsSource:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 44) = a2;
  }
  return result;
}

- (uint64_t)setDeferredPrepareEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 41) = a2;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMetadataSinkPipelineConfiguration;
  [(FigCaptureMetadataSinkPipelineConfiguration *)&v3 dealloc];
}

- (uint64_t)setBoxedMetadataEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 48) = a2;
  }
  return result;
}

- (BOOL)compressed8BitInputEnabled
{
  if (result) {
    return *(unsigned char *)(result + 49) != 0;
  }
  return result;
}

- (uint64_t)setMrcLowPowerModeEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setInputRotationRelativeToSource:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 64) = a2;
  }
  return result;
}

@end