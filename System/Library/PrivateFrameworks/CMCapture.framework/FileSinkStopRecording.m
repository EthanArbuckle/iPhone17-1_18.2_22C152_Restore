@interface FileSinkStopRecording
@end

@implementation FileSinkStopRecording

uint64_t __captureSession_FileSinkStopRecording_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t result = _FigIsCurrentDispatchQueue();
  if (!result) {
    uint64_t result = FigDebugAssert3();
  }
  if (!*(unsigned char *)DerivedStorage)
  {
    uint64_t v4 = [*(id *)(DerivedStorage + 664) movieFileSinkPipelineWithSinkID:v1];
    uint64_t v5 = v4;
    if (v4) {
      uint64_t v6 = -[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v4);
    }
    else {
      uint64_t v6 = -[FigCaptureAudioFileSinkPipeline fileCoordinatorNode]([*(id *)(DerivedStorage + 664) audioFileSinkPipelineWithSinkID:v1]);
    }
    v7 = (void *)v6;
    if ([(id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5) temporalNoiseReductionBand0StrengthModulation])objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5), "setTemporalNoiseReductionBand0StrengthModulation:", 0); {
    if (v7)
    }
    {
      uint64_t v8 = [*(id *)(DerivedStorage + 664) cameraSourcePipelineWithSourceID:-[FigCaptureMovieFileSinkPipeline videoSourceID](v5)];
      [v7 stopRecordingWithErrorCode:0 setupToAllowWaitingForRecordingToStop:-[FigCaptureCameraSourcePipeline trueVideoCaptureEnabled](v8)];
      v9 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](v8);
      return [v9 setFrameSkippingWhenNotRecordingEnabled:1];
    }
    else
    {
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

@end