@interface VisionDataSinkTriggerBurst
@end

@implementation VisionDataSinkTriggerBurst

uint64_t __captureSession_VisionDataSinkTriggerBurst_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v7 = v1;
    LODWORD(v6) = 0;
    FigDebugAssert3();
  }
  uint64_t v4 = objc_msgSend(*(id *)(DerivedStorage + 664), "visionDataSinkPipelineWithSinkID:", v2, v6, v7);
  if (v4)
  {
    return -[FigCaptureVisionDataSinkPipeline triggerVisionDataBurst](v4);
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

@end