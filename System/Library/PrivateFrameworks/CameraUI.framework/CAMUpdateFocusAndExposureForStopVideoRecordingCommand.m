@interface CAMUpdateFocusAndExposureForStopVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMUpdateFocusAndExposureForStopVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentVideoDevice];
  if ([v4 focusMode] == 2
    && [v4 isSmoothAutoFocusSupported]
    && [v4 isSmoothAutoFocusEnabled])
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CAMUpdateFocusAndExposureForStopVideoRecordingCommand executeWithContext:](v5);
    }

    v6 = [[CAMFocusCommand alloc] initWithFocusMode:3 smooth:0];
    if (v6) {
      [(CAMCaptureCommand *)self addSubcommand:v6];
    }
  }
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Disabling smooth autofocus for stop video recording", v1, 2u);
}

@end