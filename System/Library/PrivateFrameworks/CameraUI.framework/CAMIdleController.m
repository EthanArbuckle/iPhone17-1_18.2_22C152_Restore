@interface CAMIdleController
- (BOOL)_isIdleTimerIndefinitelyDisabled;
- (BOOL)isUpdatingIdleTimer;
- (CAMIdleController)init;
- (NSTimer)_enableIdleTimer;
- (void)_delayIdleTimerByTimeInterval:(double)a3;
- (void)_delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:(double)a3;
- (void)_immediatelyEnableApplicationIdleTimer;
- (void)_indefinitelyDisableApplicationIdleTimer;
- (void)_setEnableIdleTimer:(id)a3;
- (void)_setUpdatingIdleTimer:(BOOL)a3;
- (void)_teardownEnableIdleTimer;
- (void)dealloc;
- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4;
- (void)startUpdatingIdleTimer;
- (void)stillImageRequestDidStopCapturingStillImage:(id)a3;
- (void)stillImageRequestsDidStopCapturingCTMVideo;
- (void)stopUpdatingIdleTimer;
- (void)timelapseRequestDidStopCapturing;
- (void)updateForVideoPaused;
- (void)videoRequestDidStopCapturing:(id)a3;
@end

@implementation CAMIdleController

- (CAMIdleController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMIdleController;
  v2 = [(CAMIdleController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_updatingIdleTimer = 0;
    enableIdleTimer = v2->_enableIdleTimer;
    v2->_enableIdleTimer = 0;

    v5 = v3;
  }

  return v3;
}

- (void)startUpdatingIdleTimer
{
  [(CAMIdleController *)self _setUpdatingIdleTimer:1];
  [(CAMIdleController *)self _delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:300.0];
}

- (void)_setUpdatingIdleTimer:(BOOL)a3
{
  self->_updatingIdleTimer = a3;
}

- (void)_delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:(double)a3
{
  if (![(CAMIdleController *)self _isIdleTimerIndefinitelyDisabled])
  {
    [(CAMIdleController *)self _delayIdleTimerByTimeInterval:a3];
  }
}

- (BOOL)_isIdleTimerIndefinitelyDisabled
{
  v2 = [(CAMIdleController *)self _enableIdleTimer];
  v3 = [MEMORY[0x263F82438] sharedApplication];
  char v4 = [v3 isIdleTimerDisabled];

  if (v2) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4;
  }

  return v5;
}

- (NSTimer)_enableIdleTimer
{
  return self->_enableIdleTimer;
}

- (void)_delayIdleTimerByTimeInterval:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(CAMIdleController *)self isUpdatingIdleTimer])
  {
    BOOL v5 = [MEMORY[0x263F82438] sharedApplication];
    [v5 setIdleTimerDisabled:1];

    v6 = [(CAMIdleController *)self _enableIdleTimer];
    [v6 invalidate];
    objc_super v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__immediatelyEnableApplicationIdleTimer selector:0 userInfo:0 repeats:a3];
    [(CAMIdleController *)self _setEnableIdleTimer:v7];
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      double v10 = a3;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Delaying application idle timer by %f seconds", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)isUpdatingIdleTimer
{
  return self->_updatingIdleTimer;
}

- (void)_setEnableIdleTimer:(id)a3
{
}

- (void)dealloc
{
  [(CAMIdleController *)self _immediatelyEnableApplicationIdleTimer];
  v3.receiver = self;
  v3.super_class = (Class)CAMIdleController;
  [(CAMIdleController *)&v3 dealloc];
}

- (void)stopUpdatingIdleTimer
{
  [(CAMIdleController *)self _immediatelyEnableApplicationIdleTimer];
  [(CAMIdleController *)self _setUpdatingIdleTimer:0];
}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  char v4 = [a3 textAnalysisIdentifier];
  if (v4) {
    double v5 = 30.0;
  }
  else {
    double v5 = 300.0;
  }

  [(CAMIdleController *)self _delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:v5];
}

- (void)videoRequestDidStopCapturing:(id)a3
{
}

- (void)updateForVideoPaused
{
}

- (void)stillImageRequestsDidStopCapturingCTMVideo
{
}

- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4
{
}

- (void)timelapseRequestDidStopCapturing
{
}

- (void)_teardownEnableIdleTimer
{
  objc_super v3 = [(CAMIdleController *)self _enableIdleTimer];
  [v3 invalidate];

  [(CAMIdleController *)self _setEnableIdleTimer:0];
}

- (void)_immediatelyEnableApplicationIdleTimer
{
  if ([(CAMIdleController *)self isUpdatingIdleTimer])
  {
    [(CAMIdleController *)self _teardownEnableIdleTimer];
    objc_super v3 = [MEMORY[0x263F82438] sharedApplication];
    [v3 setIdleTimerDisabled:0];

    char v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Immediately enabling application idle timer", v5, 2u);
    }
  }
}

- (void)_indefinitelyDisableApplicationIdleTimer
{
  if ([(CAMIdleController *)self isUpdatingIdleTimer])
  {
    [(CAMIdleController *)self _teardownEnableIdleTimer];
    objc_super v3 = [MEMORY[0x263F82438] sharedApplication];
    [v3 setIdleTimerDisabled:1];

    char v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Disabling application idle timer indefinitely", v5, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end