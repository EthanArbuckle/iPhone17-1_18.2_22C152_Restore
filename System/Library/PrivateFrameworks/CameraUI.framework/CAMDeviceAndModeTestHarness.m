@interface CAMDeviceAndModeTestHarness
- (CAMDeviceAndModeTestHarness)initWithTestName:(id)a3 devicePosition:(int64_t)a4 captureMode:(int64_t)a5 viewFinderViewControl:(id)a6;
- (CAMViewfinderViewController)_viewController;
- (int64_t)_desiredMode;
- (int64_t)_desiredPosition;
- (void)startTesting;
@end

@implementation CAMDeviceAndModeTestHarness

- (CAMDeviceAndModeTestHarness)initWithTestName:(id)a3 devicePosition:(int64_t)a4 captureMode:(int64_t)a5 viewFinderViewControl:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CAMDeviceAndModeTestHarness;
  v12 = [(CAMModeAndDeviceConfigurationTestHarness *)&v16 initWithTestName:a3];
  v13 = v12;
  if (v12)
  {
    v12->__desiredPosition = a4;
    v12->__desiredMode = a5;
    objc_storeStrong((id *)&v12->__viewController, a6);
    v14 = v13;
  }

  return v13;
}

- (void)startTesting
{
  v12.receiver = self;
  v12.super_class = (Class)CAMDeviceAndModeTestHarness;
  [(CAMModeAndDeviceConfigurationTestHarness *)&v12 startTesting];
  v3 = [(CAMDeviceAndModeTestHarness *)self _viewController];
  uint64_t v4 = [v3 currentCaptureMode];
  unint64_t v5 = [v3 currentCaptureDevice] - 1;
  if (v5 > 0xA) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_209C79990[v5];
  }
  int64_t v7 = [(CAMDeviceAndModeTestHarness *)self _desiredMode];
  int64_t v8 = [(CAMDeviceAndModeTestHarness *)self _desiredPosition];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CAMDeviceAndModeTestHarness_startTesting__block_invoke;
  aBlock[3] = &unk_263FA0208;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (v7 == v4 && v8 == v6)
  {
    (*((void (**)(void *))v9 + 2))(v9);
  }
  else
  {
    [(CAMModeAndDeviceConfigurationTestHarness *)self registerHandler:v9 forChangeToMode:v7 devicePosition:v8];
    [v3 changeToMode:v7 device:v8 == 1];
  }
}

uint64_t __43__CAMDeviceAndModeTestHarness_startTesting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTesting];
}

- (int64_t)_desiredPosition
{
  return self->__desiredPosition;
}

- (int64_t)_desiredMode
{
  return self->__desiredMode;
}

- (CAMViewfinderViewController)_viewController
{
  return self->__viewController;
}

- (void).cxx_destruct
{
}

@end