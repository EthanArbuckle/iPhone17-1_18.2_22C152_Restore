@interface CAMModeSwitchTestHarness
- (BOOL)isTestingAnimation;
- (CAMModeSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 mode:(int64_t)a5 testingAnimation:(BOOL)a6 testExtensionSeconds:(double)a7;
- (CAMViewfinderViewController)viewfinderViewController;
- (double)testExtensionSeconds;
- (int64_t)desiredMode;
- (void)_ensureCaptureMode:(int64_t)a3 thenPerform:(id)a4;
- (void)_internalStopTesting;
- (void)_startTestingAfterModeSwitchIsTestingAnimation:(BOOL)a3;
- (void)handleDidOpenViewfinderForReason:(int64_t)a3;
- (void)startTesting;
@end

@implementation CAMModeSwitchTestHarness

- (CAMModeSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 mode:(int64_t)a5 testingAnimation:(BOOL)a6 testExtensionSeconds:(double)a7
{
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CAMModeSwitchTestHarness;
  v14 = [(CAMModeAndDeviceConfigurationTestHarness *)&v18 initWithTestName:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewfinderViewController, a4);
    v15->_desiredMode = a5;
    v15->_testingAnimation = a6;
    v15->_testExtensionSeconds = a7;
    v16 = v15;
  }

  return v15;
}

- (void)startTesting
{
  BOOL v3 = [(CAMModeSwitchTestHarness *)self isTestingAnimation];
  BOOL v4 = [(CAMModeSwitchTestHarness *)self desiredMode] == 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__CAMModeSwitchTestHarness_startTesting__block_invoke;
  v5[3] = &unk_263FA1138;
  objc_copyWeak(&v6, &location);
  BOOL v7 = v3;
  [(CAMModeSwitchTestHarness *)self _ensureCaptureMode:v4 thenPerform:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__CAMModeSwitchTestHarness_startTesting__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__CAMModeSwitchTestHarness_startTesting__block_invoke_2;
  v3[3] = &unk_263FA1138;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __40__CAMModeSwitchTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startTestingAfterModeSwitchIsTestingAnimation:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_startTestingAfterModeSwitchIsTestingAnimation:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMModeSwitchTestHarness;
  [(CAMModeAndDeviceConfigurationTestHarness *)&v10 startTesting];
  objc_initWeak(&location, self);
  int64_t desiredMode = self->_desiredMode;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __75__CAMModeSwitchTestHarness__startTestingAfterModeSwitchIsTestingAnimation___block_invoke;
  v6[3] = &unk_263FA1138;
  BOOL v8 = a3;
  objc_copyWeak(&v7, &location);
  [(CAMModeSwitchTestHarness *)self _ensureCaptureMode:desiredMode thenPerform:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __75__CAMModeSwitchTestHarness__startTestingAfterModeSwitchIsTestingAnimation___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _internalStopTesting];
  }
}

- (void)_internalStopTesting
{
  [(CAMModeSwitchTestHarness *)self testExtensionSeconds];
  if (v3 <= 0.0)
  {
    [(CAMModeAndDeviceConfigurationTestHarness *)self stopTesting];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__CAMModeSwitchTestHarness__internalStopTesting__block_invoke;
    block[3] = &unk_263FA0208;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __48__CAMModeSwitchTestHarness__internalStopTesting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTesting];
}

- (void)handleDidOpenViewfinderForReason:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMModeSwitchTestHarness;
  [(CAMModeAndDeviceConfigurationTestHarness *)&v6 handleDidOpenViewfinderForReason:a3];
  BOOL v4 = [(CAMPerformanceTestHarness *)self isRunningTest];
  BOOL v5 = [(CAMModeSwitchTestHarness *)self isTestingAnimation];
  if (v4 && v5) {
    [(CAMModeSwitchTestHarness *)self _internalStopTesting];
  }
}

- (void)_ensureCaptureMode:(int64_t)a3 thenPerform:(id)a4
{
  v11 = (void (**)(void))a4;
  objc_super v6 = [(CAMModeSwitchTestHarness *)self viewfinderViewController];
  uint64_t v7 = [v6 _configuredMode];
  uint64_t v8 = [v6 _configuredDevice];
  if ((unint64_t)(v8 - 8) >= 4 && v8 != 1 && v7 == a3)
  {
    v11[2]();
  }
  else
  {
    [(CAMModeAndDeviceConfigurationTestHarness *)self registerHandler:v11 forChangeToMode:a3 devicePosition:0];
    [(CAMModeAndDeviceConfigurationTestHarness *)self registerHandler:v11 forChangeToMode:a3 devicePosition:1];
    [v6 changeToMode:a3 device:0 animated:1];
  }
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (int64_t)desiredMode
{
  return self->_desiredMode;
}

- (BOOL)isTestingAnimation
{
  return self->_testingAnimation;
}

- (double)testExtensionSeconds
{
  return self->_testExtensionSeconds;
}

- (void).cxx_destruct
{
}

@end