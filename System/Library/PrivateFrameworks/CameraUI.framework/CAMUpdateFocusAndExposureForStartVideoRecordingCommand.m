@interface CAMUpdateFocusAndExposureForStartVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMUpdateFocusAndExposureForStartVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentVideoDevice];
  v5 = [v4 activeFormat];
  if ([v5 autoFocusSystem] == 2)
  {
    if ([v4 focusMode] != 2) {
      goto LABEL_12;
    }
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CAMUpdateFocusAndExposureForStartVideoRecordingCommand executeWithContext:](v6);
    }

    v7 = [[CAMFocusCommand alloc] initWithFocusMode:3 smooth:1];
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CAMUpdateFocusAndExposureForStartVideoRecordingCommand executeWithContext:](v8);
    }

    v7 = [[CAMFocusCommand alloc] initWithFocusMode:0];
  }
  v9 = v7;
  if (v7) {
    [(CAMCaptureCommand *)self addSubcommand:v7];
  }

LABEL_12:
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Enabling smooth autofocus for start video recording (phase detect focus)", v1, 2u);
}

- (void)executeWithContext:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Locking focus for start video recording (contrast based focus)", v1, 2u);
}

@end