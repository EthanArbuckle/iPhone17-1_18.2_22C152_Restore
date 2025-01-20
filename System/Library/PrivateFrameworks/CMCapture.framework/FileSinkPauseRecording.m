@interface FileSinkPauseRecording
@end

@implementation FileSinkPauseRecording

uint64_t __captureSession_FileSinkPauseRecording_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v12 = v1;
    LODWORD(v11) = 0;
    FigDebugAssert3();
  }
  *(unsigned char *)(DerivedStorage + 816) = 1;
  uint64_t v4 = objc_msgSend(*(id *)(DerivedStorage + 664), "movieFileSinkPipelineWithSinkID:", v2, v11, v12);
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = (void *)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v4);
    BOOL v7 = -[FigCaptureMovieFileSinkPipeline videoCompressorNodes](v5) != 0;
    if (v6)
    {
LABEL_5:
      [v6 pauseRecording];
      uint64_t v8 = [*(id *)(DerivedStorage + 664) cameraSourcePipelineWithSourceID:-[FigCaptureMovieFileSinkPipeline videoSourceID](v5)];
      uint64_t result = [(id)-[FigCaptureCameraSourcePipeline captureDevice](v8) setFrameSkippingWhenNotRecordingEnabled:1];
      if (v7)
      {
        uint64_t result = [(id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5) autoImageControlMode];
        if (result == 2)
        {
          v10 = (void *)-[FigCaptureMovieFileSinkPipeline captureDevice](v5);
          return [v10 setAutoImageControlMode:1];
        }
      }
      return result;
    }
  }
  else
  {
    v6 = (void *)-[FigCaptureAudioFileSinkPipeline fileCoordinatorNode]([*(id *)(DerivedStorage + 664) audioFileSinkPipelineWithSinkID:v2]);
    BOOL v7 = 0;
    if (v6) {
      goto LABEL_5;
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

@end