@interface IrisStillImageSinkCaptureImage
@end

@implementation IrisStillImageSinkCaptureImage

uint64_t __captureSession_IrisStillImageSinkCaptureImage_block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(CMBaseObjectGetDerivedStorage() + 664), "stillImageSinkPipelineSessionStorageWithSinkID:", *(void *)(a1 + 32)), "cameraSourcePipeline");
  [(id)-[FigCaptureCameraSourcePipeline captureDevice](v2) nonDestructiveCropSize];
  objc_msgSend(*(id *)(a1 + 40), "setNonDestructiveCropSize:");
  cs_updateSmartStyleSupport(*(void *)(a1 + 48), *(void **)(a1 + 40), (void *)[*(id *)(a1 + 40) movieRecordingSettings]);
  uint64_t result = captureSession_captureStillImageNow(*(const void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40));
  if (!result)
  {
    v5 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    return cs_IrisStillImageSinkPrepareMovieRecording(v4, v6, v5);
  }
  return result;
}

@end