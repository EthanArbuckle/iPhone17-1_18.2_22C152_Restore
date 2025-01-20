@interface CAMViewfinderStillImageCaptureTestHarness
- (BOOL)_allowOverlappingCaptures;
- (BOOL)_capturesOnTouchDown;
- (BOOL)_performWarmupCapture;
- (BOOL)_waitingOnWarmupCapture;
- (BOOL)executeAction;
- (BOOL)isStillDuringVideo;
- (BOOL)shouldAttemptAction;
- (CAMViewfinderActionIntervalometer)testIntervalometer;
- (CAMViewfinderStillImageCaptureTestHarness)initWithTestName:(id)a3 maxStillImageCount:(unint64_t)a4 expectedNumberOfCapturesPerRequest:(unint64_t)a5 viewfinderViewController:(id)a6 performingWarmupCapture:(BOOL)a7 forCaptureMode:(int64_t)a8 delayBetweenCaptures:(double)a9 capturesOnTouchDown:(BOOL)a10;
- (CAMViewfinderViewController)_viewfinderViewController;
- (NSCountedSet)_requestIDs;
- (NSString)_finalRequestPersistenceUUID;
- (double)_delayBetweenCaptures;
- (double)_lastCaptureCompletionTime;
- (id)didUpdateFinalThumbnailHandler;
- (int64_t)_mode;
- (unint64_t)_expectedNumberOfResponsesPerRequest;
- (unint64_t)_generatedRequestsCount;
- (unint64_t)_maxStillImageCount;
- (unint64_t)_receivedCallbackCount;
- (void)cancelTesting;
- (void)failedTestWithReason:(id)a3;
- (void)setDidUpdateFinalThumbnailHandler:(id)a3;
- (void)setStillDuringVideo:(BOOL)a3;
- (void)setTestIntervalometer:(id)a3;
- (void)set_capturesOnTouchDown:(BOOL)a3;
- (void)set_delayBetweenCaptures:(double)a3;
- (void)set_expectedNumberOfResponsesPerRequest:(unint64_t)a3;
- (void)set_finalRequestPersistenceUUID:(id)a3;
- (void)set_generatedRequestsCount:(unint64_t)a3;
- (void)set_lastCaptureCompletionTime:(double)a3;
- (void)set_maxStillImageCount:(unint64_t)a3;
- (void)set_mode:(int64_t)a3;
- (void)set_performWarmupCapture:(BOOL)a3;
- (void)set_receivedCallbackCount:(unint64_t)a3;
- (void)set_requestIDs:(id)a3;
- (void)set_viewfinderViewController:(id)a3;
- (void)set_waitingOnWarmupCapture:(BOOL)a3;
- (void)startTesting;
- (void)stopTesting;
- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteCapture:(id)a4 error:(id)a5;
- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteStillImageCapture:(id)a4 withResponse:(id)a5 error:(id)a6;
- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidStopCapturingStillImage:(id)a4;
- (void)viewfinderViewController:(id)a3 didUpdateImageWellWithRequest:(id)a4 response:(id)a5 error:(id)a6;
- (void)viewfinderViewController:(id)a3 willCaptureStillImageForRequest:(id)a4;
@end

@implementation CAMViewfinderStillImageCaptureTestHarness

- (CAMViewfinderStillImageCaptureTestHarness)initWithTestName:(id)a3 maxStillImageCount:(unint64_t)a4 expectedNumberOfCapturesPerRequest:(unint64_t)a5 viewfinderViewController:(id)a6 performingWarmupCapture:(BOOL)a7 forCaptureMode:(int64_t)a8 delayBetweenCaptures:(double)a9 capturesOnTouchDown:(BOOL)a10
{
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  v18 = [(CAMPerformanceTestHarness *)&v22 initWithTestName:a3];
  if (v18)
  {
    v19 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    requestIDs = v18->__requestIDs;
    v18->__requestIDs = v19;

    v18->__performWarmupCapture = a7;
    v18->__maxStillImageCount = a4;
    v18->__waitingOnWarmupCapture = a7;
    v18->__expectedNumberOfResponsesPerRequest = a5;
    v18->__delayBetweenCaptures = a9;
    objc_storeStrong((id *)&v18->__viewfinderViewController, a6);
    v18->__capturesOnTouchDown = a10;
  }

  return v18;
}

- (void)startTesting
{
  if ([(CAMViewfinderStillImageCaptureTestHarness *)self isStillDuringVideo])
  {
    v3 = +[CAMCaptureCapabilities capabilities];
    if ((objc_msgSend(v3, "isStillDuringVideoSupportedForMode:", -[CAMViewfinderStillImageCaptureTestHarness _mode](self, "_mode")) & 1) == 0)-[CAMViewfinderStillImageCaptureTestHarness failedTestWithReason:](self, "failedTestWithReason:", @"Stills during video is not supported for this device and mode"); {
  }
    }
  v4 = [(CAMViewfinderStillImageCaptureTestHarness *)self testIntervalometer];
  if ([(CAMViewfinderStillImageCaptureTestHarness *)self _performWarmupCapture])
  {
    [v4 manuallyGenerateRequest];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
    [(CAMPerformanceTestHarness *)&v5 startTesting];
    [v4 startGeneratingRequests];
  }
}

- (void)stopTesting
{
  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    self->_testIntervalometer = 0;
  }
  v4 = [(CAMViewfinderStillImageCaptureTestHarness *)self _requestIDs];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(CAMViewfinderStillImageCaptureTestHarness *)self failedTestWithReason:@"Ended test before receiving all responses"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  [(CAMPerformanceTestHarness *)&v6 stopTesting];
}

- (void)cancelTesting
{
  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    [(CAMViewfinderActionIntervalometer *)testIntervalometer stopAttemptingActions];
    v4 = self->_testIntervalometer;
    self->_testIntervalometer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  [(CAMPerformanceTestHarness *)&v5 stopTesting];
}

- (void)failedTestWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderStillImageCaptureTestHarness;
  [(CAMPerformanceTestHarness *)&v6 failedTestWithReason:v4];
}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidStopCapturingStillImage:(id)a4
{
  self->__lastCaptureCompletionTime = CFAbsoluteTimeGetCurrent();
}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteStillImageCapture:(id)a4 withResponse:(id)a5 error:(id)a6
{
  id v13 = a6;
  id v8 = [a4 persistenceUUID];
  if (v13)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Capture failed with error: %@", v13];
    [(CAMViewfinderStillImageCaptureTestHarness *)self failedTestWithReason:v9];
  }
  v10 = [(CAMViewfinderStillImageCaptureTestHarness *)self _requestIDs];
  [v10 removeObject:v8];

  if ([(CAMViewfinderStillImageCaptureTestHarness *)self _performWarmupCapture])
  {
    v11 = [(CAMViewfinderStillImageCaptureTestHarness *)self _requestIDs];
    uint64_t v12 = [v11 countForObject:v8];

    if (!v12)
    {
      [(CAMViewfinderStillImageCaptureTestHarness *)self set_performWarmupCapture:0];
      [(CAMViewfinderStillImageCaptureTestHarness *)self set_waitingOnWarmupCapture:0];
      [(CAMViewfinderStillImageCaptureTestHarness *)self startTesting];
    }
  }
}

- (void)viewfinderViewController:(id)a3 didReceiveStillImageRequestDidCompleteCapture:(id)a4 error:(id)a5
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __122__CAMViewfinderStillImageCaptureTestHarness_viewfinderViewController_didReceiveStillImageRequestDidCompleteCapture_error___block_invoke;
  v9[3] = &unk_263FA0408;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __122__CAMViewfinderStillImageCaptureTestHarness_viewfinderViewController_didReceiveStillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) persistenceUUID];
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 40) _finalRequestPersistenceUUID];
    uint64_t v5 = [*(id *)(a1 + 40) _generatedRequestsCount];
    uint64_t v6 = [*(id *)(a1 + 40) _maxStillImageCount];
    *(_DWORD *)buf = 138544130;
    id v13 = v2;
    __int16 v14 = 2114;
    v15 = v4;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "CAMViewfinderStillImageCaptureTestHarness didReceiveStillImageRequestDidCompleteCapture, persistenceUUID:%{public}@, finalRequestPersistenceUUID:%{public}@, generatedRequestsCount:%ld, _maxStillImageCount:%ld", buf, 0x2Au);
  }
  dispatch_time_t v7 = [NSString stringWithFormat:@"Did not receive correct number of callbacks for %@", v2];
  id v8 = [*(id *)(a1 + 40) _requestIDs];
  uint64_t v9 = [v8 countForObject:v2];

  if (v9) {
    [*(id *)(a1 + 40) failedTestWithReason:v7];
  }
  id v10 = [*(id *)(a1 + 40) _finalRequestPersistenceUUID];
  int v11 = [v2 isEqualToString:v10];

  if (v11) {
    [*(id *)(a1 + 40) stopTesting];
  }
}

- (void)viewfinderViewController:(id)a3 willCaptureStillImageForRequest:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a4, "persistenceUUID", a3);
  [(CAMViewfinderStillImageCaptureTestHarness *)self set_generatedRequestsCount:[(CAMViewfinderStillImageCaptureTestHarness *)self _generatedRequestsCount] + 1];
  uint64_t v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    int v11 = v5;
    __int16 v12 = 2048;
    unint64_t v13 = [(CAMViewfinderStillImageCaptureTestHarness *)self _generatedRequestsCount];
    __int16 v14 = 2048;
    unint64_t v15 = [(CAMViewfinderStillImageCaptureTestHarness *)self _maxStillImageCount];
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "CAMViewfinderStillImageCaptureTestHarness willCaptureStillImageForRequest, persistenceUUID:%{public}@, generatedRequestsCount:%ld, _maxStillImageCount:%ld", (uint8_t *)&v10, 0x20u);
  }

  unint64_t v7 = [(CAMViewfinderStillImageCaptureTestHarness *)self _generatedRequestsCount];
  if (v7 == [(CAMViewfinderStillImageCaptureTestHarness *)self _maxStillImageCount]) {
    [(CAMViewfinderStillImageCaptureTestHarness *)self set_finalRequestPersistenceUUID:v5];
  }
  if ([(CAMViewfinderStillImageCaptureTestHarness *)self _expectedNumberOfResponsesPerRequest])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(CAMViewfinderStillImageCaptureTestHarness *)self _requestIDs];
      [v9 addObject:v5];

      ++v8;
    }
    while ([(CAMViewfinderStillImageCaptureTestHarness *)self _expectedNumberOfResponsesPerRequest] > v8);
  }
}

- (void)viewfinderViewController:(id)a3 didUpdateImageWellWithRequest:(id)a4 response:(id)a5 error:(id)a6
{
  uint64_t v9 = [(CAMViewfinderStillImageCaptureTestHarness *)self testIntervalometer];
  uint64_t v7 = [v9 successfullActionCount];
  if (v7 == [(CAMViewfinderStillImageCaptureTestHarness *)self _maxStillImageCount])
  {
    unint64_t v8 = [(CAMViewfinderStillImageCaptureTestHarness *)self didUpdateFinalThumbnailHandler];

    if (!v8) {
      return;
    }
    uint64_t v9 = [(CAMViewfinderStillImageCaptureTestHarness *)self didUpdateFinalThumbnailHandler];
    v9[2]();
  }
}

- (BOOL)_allowOverlappingCaptures
{
  [(CAMViewfinderStillImageCaptureTestHarness *)self _delayBetweenCaptures];
  return v2 <= 0.0;
}

- (BOOL)shouldAttemptAction
{
  v3 = [(CAMViewfinderStillImageCaptureTestHarness *)self _viewfinderViewController];
  char v4 = [v3 isCapturingPhoto];

  BOOL result = [(CAMViewfinderStillImageCaptureTestHarness *)self _allowOverlappingCaptures];
  if (!result && (v4 & 1) == 0)
  {
    [(CAMViewfinderStillImageCaptureTestHarness *)self _lastCaptureCompletionTime];
    if (v6 == 0.0)
    {
      return 1;
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(CAMViewfinderStillImageCaptureTestHarness *)self _lastCaptureCompletionTime];
      double v9 = Current - v8;
      [(CAMViewfinderStillImageCaptureTestHarness *)self _delayBetweenCaptures];
      return v9 >= v10;
    }
  }
  return result;
}

- (BOOL)executeAction
{
  BOOL v3 = [(CAMViewfinderStillImageCaptureTestHarness *)self isStillDuringVideo];
  char v4 = [(CAMViewfinderStillImageCaptureTestHarness *)self _viewfinderViewController];
  uint64_t v5 = v4;
  if (v3) {
    char v6 = [v4 takeStillDuringVideoWithTouchUpDelay:0.1];
  }
  else {
    char v6 = [v4 pressShutterButtonWithTouchUpDelay:0.1];
  }
  BOOL v7 = v6;

  return v7;
}

- (CAMViewfinderActionIntervalometer)testIntervalometer
{
  return self->_testIntervalometer;
}

- (void)setTestIntervalometer:(id)a3
{
}

- (id)didUpdateFinalThumbnailHandler
{
  return self->_didUpdateFinalThumbnailHandler;
}

- (void)setDidUpdateFinalThumbnailHandler:(id)a3
{
}

- (BOOL)isStillDuringVideo
{
  return self->_stillDuringVideo;
}

- (void)setStillDuringVideo:(BOOL)a3
{
  self->_stillDuringVideo = a3;
}

- (BOOL)_performWarmupCapture
{
  return self->__performWarmupCapture;
}

- (void)set_performWarmupCapture:(BOOL)a3
{
  self->__performWarmupCapture = a3;
}

- (BOOL)_waitingOnWarmupCapture
{
  return self->__waitingOnWarmupCapture;
}

- (void)set_waitingOnWarmupCapture:(BOOL)a3
{
  self->__waitingOnWarmupCapture = a3;
}

- (NSString)_finalRequestPersistenceUUID
{
  return self->__finalRequestPersistenceUUID;
}

- (void)set_finalRequestPersistenceUUID:(id)a3
{
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void)set_mode:(int64_t)a3
{
  self->__mode = a3;
}

- (NSCountedSet)_requestIDs
{
  return self->__requestIDs;
}

- (void)set_requestIDs:(id)a3
{
}

- (unint64_t)_receivedCallbackCount
{
  return self->__receivedCallbackCount;
}

- (void)set_receivedCallbackCount:(unint64_t)a3
{
  self->__receivedCallbackCount = a3;
}

- (unint64_t)_expectedNumberOfResponsesPerRequest
{
  return self->__expectedNumberOfResponsesPerRequest;
}

- (void)set_expectedNumberOfResponsesPerRequest:(unint64_t)a3
{
  self->__expectedNumberOfResponsesPerRequest = a3;
}

- (double)_delayBetweenCaptures
{
  return self->__delayBetweenCaptures;
}

- (void)set_delayBetweenCaptures:(double)a3
{
  self->__delayBetweenCaptures = a3;
}

- (double)_lastCaptureCompletionTime
{
  return self->__lastCaptureCompletionTime;
}

- (void)set_lastCaptureCompletionTime:(double)a3
{
  self->__lastCaptureCompletionTime = a3;
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void)set_viewfinderViewController:(id)a3
{
}

- (BOOL)_capturesOnTouchDown
{
  return self->__capturesOnTouchDown;
}

- (void)set_capturesOnTouchDown:(BOOL)a3
{
  self->__capturesOnTouchDown = a3;
}

- (unint64_t)_maxStillImageCount
{
  return self->__maxStillImageCount;
}

- (void)set_maxStillImageCount:(unint64_t)a3
{
  self->__maxStillImageCount = a3;
}

- (unint64_t)_generatedRequestsCount
{
  return self->__generatedRequestsCount;
}

- (void)set_generatedRequestsCount:(unint64_t)a3
{
  self->__generatedRequestsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__requestIDs, 0);
  objc_storeStrong((id *)&self->__finalRequestPersistenceUUID, 0);
  objc_storeStrong(&self->_didUpdateFinalThumbnailHandler, 0);
  objc_storeStrong((id *)&self->_testIntervalometer, 0);
}

@end