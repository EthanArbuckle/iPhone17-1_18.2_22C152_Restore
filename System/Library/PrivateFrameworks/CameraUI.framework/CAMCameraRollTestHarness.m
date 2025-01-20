@interface CAMCameraRollTestHarness
- (BOOL)awaitPreload;
- (BOOL)isTestingAnimation;
- (BOOL)testingWarmPresentation;
- (CAMCameraRollTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 testingAnimation:(BOOL)a5 testingWarmPresentation:(BOOL)a6 awaitPreload:(BOOL)a7 settlingDelay:(double)a8;
- (CAMViewfinderViewController)viewfinderViewController;
- (double)settlingDelay;
- (void)_dismissCameraRollImmediately;
- (void)_handlePUDisplayLinkStarted:(id)a3;
- (void)_presentCameraRollAnimated;
- (void)startTesting;
- (void)stopTesting;
@end

@implementation CAMCameraRollTestHarness

- (CAMCameraRollTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 testingAnimation:(BOOL)a5 testingWarmPresentation:(BOOL)a6 awaitPreload:(BOOL)a7 settlingDelay:(double)a8
{
  id v15 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMCameraRollTestHarness;
  v16 = [(CAMPerformanceTestHarness *)&v20 initWithTestName:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_viewfinderViewController, a4);
    v17->_awaitPreload = a7;
    v17->_settlingDelay = a8;
    v17->_testingWarmPresentation = a6;
    v17->_testingAnimation = a5;
    v18 = v17;
  }

  return v17;
}

- (void)startTesting
{
  BOOL v3 = [(CAMCameraRollTestHarness *)self isTestingAnimation];
  BOOL v4 = [(CAMCameraRollTestHarness *)self awaitPreload];
  BOOL v5 = [(CAMCameraRollTestHarness *)self testingWarmPresentation];
  [(CAMCameraRollTestHarness *)self settlingDelay];
  double v7 = v6;
  v8 = [(CAMCameraRollTestHarness *)self viewfinderViewController];
  [v8 setCameraRollControllerTestDelegate:self];

  if (v5)
  {
    [(CAMCameraRollTestHarness *)self _presentCameraRollAnimated];
    [(CAMCameraRollTestHarness *)self _dismissCameraRollImmediately];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke;
  aBlock[3] = &unk_263FA02A8;
  aBlock[4] = self;
  BOOL v22 = v3;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v10 = v9;
  if (v7 > 0.0)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_3;
    v18[3] = &unk_263FA08C0;
    double v20 = v7;
    id v19 = v9;
    v10 = (void (**)(void))_Block_copy(v18);
  }
  if (v4)
  {
    v11 = [MEMORY[0x263F82438] sharedApplication];
    v12 = [v11 delegate];

    v13 = [v12 cameraRollController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_4;
    v15[3] = &unk_263FA08E8;
    id v16 = v13;
    id v17 = v10;
    id v14 = v13;
    v10 = (void (**)(void))_Block_copy(v15);
  }
  v10[2](v10);
}

void __40__CAMCameraRollTestHarness_startTesting__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)CAMCameraRollTestHarness;
  objc_msgSendSuper2(&v5, sel_startTesting);
  [*(id *)(a1 + 32) _presentCameraRollAnimated];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 addObserver:*(void *)(a1 + 32) selector:sel__handlePUDisplayLinkStarted_ name:*MEMORY[0x263F5E4C8] object:0];
  }
  else
  {
    BOOL v3 = (void *)*MEMORY[0x263F83300];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __40__CAMCameraRollTestHarness_startTesting__block_invoke_2;
    v4[3] = &unk_263FA0208;
    v4[4] = *(void *)(a1 + 32);
    [v3 installCACommitCompletionBlock:v4];
  }
}

uint64_t __40__CAMCameraRollTestHarness_startTesting__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTesting];
}

void __40__CAMCameraRollTestHarness_startTesting__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = MEMORY[0x263EF83A0];
  dispatch_after(v2, v4, v3);
}

uint64_t __40__CAMCameraRollTestHarness_startTesting__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ppt_awaitPreload:", *(void *)(a1 + 40));
}

- (void)stopTesting
{
  v4.receiver = self;
  v4.super_class = (Class)CAMCameraRollTestHarness;
  [(CAMPerformanceTestHarness *)&v4 stopTesting];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(CAMCameraRollTestHarness *)self _dismissCameraRollImmediately];
}

- (void)_handlePUDisplayLinkStarted:(id)a3
{
  objc_super v4 = [(CAMCameraRollTestHarness *)self viewfinderViewController];
  objc_super v5 = [v4 presentedViewController];
  if (objc_opt_respondsToSelector())
  {
    id v6 = v5;
    double v7 = (void *)*MEMORY[0x263F83300];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke;
    v11[3] = &unk_263FA0208;
    v11[4] = self;
    [v7 installCACommitCompletionBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_2;
    v9[3] = &unk_263FA0408;
    v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    objc_msgSend(v8, "ppt_installTransitionAnimationCompletionHandler:", v9);
  }
}

uint64_t __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSubtestWithName:@"animation"];
}

void __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) stopSubtestWithName:@"animation"];
  dispatch_time_t v2 = [*(id *)(a1 + 40) topViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_3;
  v3[3] = &unk_263FA0430;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout:handler:", v3, 30.0);
}

uint64_t __56__CAMCameraRollTestHarness__handlePUDisplayLinkStarted___block_invoke_3(uint64_t a1, char a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    [v3 stopSubtestWithName:@"TimeToSharp"];
    BOOL v3 = *(void **)(a1 + 32);
  }
  return [v3 stopTesting];
}

- (void)_presentCameraRollAnimated
{
  id v3 = [(CAMCameraRollTestHarness *)self viewfinderViewController];
  [(CAMPerformanceTestHarness *)self startSubtestWithName:@"TimeToSharp" withMetrics:&unk_26BDDF8D8];
  [v3 simulateImageWellTap];
}

- (void)_dismissCameraRollImmediately
{
  id v2 = [(CAMCameraRollTestHarness *)self viewfinderViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)awaitPreload
{
  return self->_awaitPreload;
}

- (double)settlingDelay
{
  return self->_settlingDelay;
}

- (BOOL)testingWarmPresentation
{
  return self->_testingWarmPresentation;
}

- (BOOL)isTestingAnimation
{
  return self->_testingAnimation;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (void).cxx_destruct
{
}

@end