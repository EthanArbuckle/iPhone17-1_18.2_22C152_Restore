@interface CAMResumeVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMResumeVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [a3 currentMovieFileOutput];
  if ([v3 isRecordingPaused])
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __53__CAMResumeVideoRecordingCommand_executeWithContext___block_invoke;
    v15 = &unk_263FA04E0;
    double v17 = Current;
    os_log_t v6 = v4;
    os_log_t v16 = v6;
    AudioServicesPlaySystemSoundWithCompletion(0x45Du, &v12);
    dispatch_time_t v7 = dispatch_time(0, 1200000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      double v8 = CFAbsoluteTimeGetCurrent();
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = v8 - Current;
        _os_log_error_impl(&dword_2099F8000, v9, OS_LOG_TYPE_ERROR, "resumeRecording: timed out while waiting for system sound (after %.3f seconds)", buf, 0xCu);
      }
    }
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "outputFileURL", v12, v13, v14, v15);
      double v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      double v19 = v11;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "resumeRecording: url=%{public}@", buf, 0xCu);
    }
    [v3 resumeRecording];
  }
  else
  {
    os_log_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring request to resume capturing video because we weren't paused.", buf, 2u);
    }
  }
}

intptr_t __53__CAMResumeVideoRecordingCommand_executeWithContext___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v2 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v2 > 0.1)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      double v6 = v2;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Resume video recording sound took %.3f seconds", (uint8_t *)&v5, 0xCu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end