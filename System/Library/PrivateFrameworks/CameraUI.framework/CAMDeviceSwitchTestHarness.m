@interface CAMDeviceSwitchTestHarness
- (BOOL)isTestingAnimation;
- (CAMDeviceSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 devicePosition:(int64_t)a5 testingAnimation:(BOOL)a6 startingCaptureMode:(int64_t)a7 testExtensionSeconds:(double)a8;
- (CAMViewfinderViewController)viewfinderViewController;
- (double)testExtensionSeconds;
- (int64_t)desiredDevicePosition;
- (int64_t)startingCaptureMode;
- (void)_internalStopTesting;
- (void)ensureCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4 thenPerform:(id)a5;
- (void)handleDidOpenViewfinderForReason:(int64_t)a3;
- (void)startTesting;
@end

@implementation CAMDeviceSwitchTestHarness

- (CAMDeviceSwitchTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 devicePosition:(int64_t)a5 testingAnimation:(BOOL)a6 startingCaptureMode:(int64_t)a7 testExtensionSeconds:(double)a8
{
  id v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMDeviceSwitchTestHarness;
  v16 = [(CAMModeAndDeviceConfigurationTestHarness *)&v20 initWithTestName:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_viewfinderViewController, a4);
    v17->_desiredDevicePosition = a5;
    v17->_testingAnimation = a6;
    v17->_startingCaptureMode = a7;
    v17->_testExtensionSeconds = a8;
    v18 = v17;
  }

  return v17;
}

- (void)startTesting
{
  BOOL v3 = [(CAMDeviceSwitchTestHarness *)self isTestingAnimation];
  int64_t v4 = [(CAMDeviceSwitchTestHarness *)self desiredDevicePosition];
  int64_t v5 = [(CAMDeviceSwitchTestHarness *)self startingCaptureMode];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke;
  v6[3] = &unk_263FA3500;
  v6[4] = self;
  v6[5] = v4;
  v6[6] = v5;
  BOOL v7 = v3;
  [(CAMDeviceSwitchTestHarness *)self ensureCaptureDevicePosition:v4 == 0 mode:v5 thenPerform:v6];
}

void __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_2;
  v3[3] = &unk_263FA3500;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
}

uint64_t __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)CAMDeviceSwitchTestHarness;
  objc_msgSendSuper2(&v8, sel_startTesting);
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_3;
  v6[3] = &unk_263FA02A8;
  char v7 = *(unsigned char *)(a1 + 56);
  v6[4] = v2;
  return [v2 ensureCaptureDevicePosition:v3 mode:v4 thenPerform:v6];
}

uint64_t __42__CAMDeviceSwitchTestHarness_startTesting__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _internalStopTesting];
  }
  return result;
}

- (void)handleDidOpenViewfinderForReason:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMDeviceSwitchTestHarness;
  [(CAMModeAndDeviceConfigurationTestHarness *)&v6 handleDidOpenViewfinderForReason:a3];
  BOOL v4 = [(CAMPerformanceTestHarness *)self isRunningTest];
  BOOL v5 = [(CAMDeviceSwitchTestHarness *)self isTestingAnimation];
  if (v4 && v5) {
    [(CAMDeviceSwitchTestHarness *)self _internalStopTesting];
  }
}

- (void)_internalStopTesting
{
  [(CAMDeviceSwitchTestHarness *)self testExtensionSeconds];
  if (v3 <= 0.0)
  {
    [(CAMModeAndDeviceConfigurationTestHarness *)self stopTesting];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CAMDeviceSwitchTestHarness__internalStopTesting__block_invoke;
    block[3] = &unk_263FA0208;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __50__CAMDeviceSwitchTestHarness__internalStopTesting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTesting];
}

- (void)ensureCaptureDevicePosition:(int64_t)a3 mode:(int64_t)a4 thenPerform:(id)a5
{
  v12 = (void (**)(void))a5;
  objc_super v8 = [(CAMDeviceSwitchTestHarness *)self viewfinderViewController];
  uint64_t v9 = [v8 _configuredMode];
  uint64_t v10 = [v8 _configuredDevice];
  if ((unint64_t)(v10 - 1) > 0xA) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_209C7AA28[v10 - 1];
  }
  if (v9 == a4 && v11 == a3)
  {
    v12[2](v12);
  }
  else
  {
    [(CAMModeAndDeviceConfigurationTestHarness *)self registerHandler:v12 forChangeToMode:a4 devicePosition:a3];
    [v8 changeToMode:a4 device:a3 == 1 animated:1];
  }
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (int64_t)desiredDevicePosition
{
  return self->_desiredDevicePosition;
}

- (int64_t)startingCaptureMode
{
  return self->_startingCaptureMode;
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