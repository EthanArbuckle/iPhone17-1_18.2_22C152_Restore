@interface CAMPauseVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPauseVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [a3 currentMovieFileOutput];
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 outputFileURL];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "pauseRecording: url=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  [v3 pauseRecording];
}

@end