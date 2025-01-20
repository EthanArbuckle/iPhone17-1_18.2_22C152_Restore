@interface CAMStopVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStopVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 currentVideoDevice];
  [v4 videoZoomFactor];
  double v6 = v5;

  [v3 registerVideoEndZoomFactor:v6];
  v7 = [v3 currentMovieFileOutput];

  v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 outputFileURL];
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "stopRecording: url=%{public}@", (uint8_t *)&v10, 0xCu);
  }
  [v7 stopRecording];
}

@end