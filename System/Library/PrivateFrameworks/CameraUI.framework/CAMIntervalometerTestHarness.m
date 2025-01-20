@interface CAMIntervalometerTestHarness
- (BOOL)_allowOverlappingCaptures;
- (BOOL)_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:(id)a3 failureReason:(id *)a4;
- (BOOL)_hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:(id *)a3;
- (BOOL)_shouldDelayBeforeCapturing;
- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4;
- (CAMCaptureRequestIntervalometer)testIntervalometer;
- (CAMIntervalometerTestHarness)initWithTestName:(id)a3 expectedNumberOfCapturesPerRequest:(unint64_t)a4 captureController:(id)a5 performingWarmupCapture:(BOOL)a6 forCaptureMode:(int64_t)a7 delayBetweenCaptures:(double)a8;
- (void)failedTestWithReason:(id)a3;
- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4;
- (void)setTestIntervalometer:(id)a3;
- (void)startTesting;
- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4;
- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5;
- (void)stillImageRequestDidStopCapturingStillImage:(id)a3;
- (void)stopTesting;
@end

@implementation CAMIntervalometerTestHarness

- (CAMIntervalometerTestHarness)initWithTestName:(id)a3 expectedNumberOfCapturesPerRequest:(unint64_t)a4 captureController:(id)a5 performingWarmupCapture:(BOOL)a6 forCaptureMode:(int64_t)a7 delayBetweenCaptures:(double)a8
{
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CAMIntervalometerTestHarness;
  v16 = [(CAMPerformanceTestHarness *)&v21 initWithTestName:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_captureController, a5);
    v17->_mode = a7;
    v17->_expectedNumberOfResponsesPerRequest = a4;
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    numberOfResponsesForRequest = v17->_numberOfResponsesForRequest;
    v17->_numberOfResponsesForRequest = (NSMutableDictionary *)v18;

    v17->_performWarmupCapture = a6;
    v17->_delayBetweenCaptures = a8;
    v17->_lastCaptureCompletionTime = 0.0;
  }

  return v17;
}

- (void)startTesting
{
  if (self->_performWarmupCapture)
  {
    id v3 = [(CAMIntervalometerTestHarness *)self testIntervalometer];
    [v3 manuallyGenerateRequest];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CAMIntervalometerTestHarness;
    [(CAMPerformanceTestHarness *)&v4 startTesting];
    [(CAMCaptureRequestIntervalometer *)self->_testIntervalometer startGeneratingRequests];
  }
}

- (void)stopTesting
{
  testIntervalometer = self->_testIntervalometer;
  if (testIntervalometer)
  {
    self->_testIntervalometer = 0;
  }
  id v7 = 0;
  BOOL v4 = [(CAMIntervalometerTestHarness *)self _hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:&v7];
  id v5 = v7;
  if (!v4) {
    [(CAMIntervalometerTestHarness *)self failedTestWithReason:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMIntervalometerTestHarness;
  [(CAMPerformanceTestHarness *)&v6 stopTesting];
}

- (void)failedTestWithReason:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)CAMIntervalometerTestHarness;
  [(CAMPerformanceTestHarness *)&v6 failedTestWithReason:v4];
}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  self->_lastCaptureCompletionTime = CFAbsoluteTimeGetCurrent();
}

- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v11 = a5;
  id v7 = [a3 persistenceUUID];
  if (v11)
  {
    id v8 = [NSString stringWithFormat:@"Capture failed with error: %@", v11];
    [(CAMIntervalometerTestHarness *)self failedTestWithReason:v8];
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_numberOfResponsesForRequest objectForKeyedSubscript:v7];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  [(NSMutableDictionary *)self->_numberOfResponsesForRequest setObject:v10 forKeyedSubscript:v7];

  if (self->_performWarmupCapture
    && [(CAMIntervalometerTestHarness *)self _hasReceivedExpectedNumberOfResponsesForPersistenceUUID:v7 failureReason:0])
  {
    self->_performWarmupCapture = 0;
    self->_waitingOnWarmupCapture = 0;
    [(CAMIntervalometerTestHarness *)self startTesting];
  }
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v5 = a3;
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CAMIntervalometerTestHarness_stillImageRequestDidCompleteCapture_error___block_invoke;
  v8[3] = &unk_263FA0408;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
}

void __74__CAMIntervalometerTestHarness_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) persistenceUUID];
  id v8 = 0;
  char v4 = [v2 _hasReceivedExpectedNumberOfResponsesForPersistenceUUID:v3 failureReason:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) failedTestWithReason:v5];
  }
  dispatch_time_t v6 = [*(id *)(a1 + 40) persistenceUUID];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 64)];

  if (v7) {
    [*(id *)(a1 + 32) stopTesting];
  }
}

- (BOOL)_allowOverlappingCaptures
{
  return self->_delayBetweenCaptures <= 0.0;
}

- (BOOL)_shouldDelayBeforeCapturing
{
  if ([(CAMIntervalometerTestHarness *)self _allowOverlappingCaptures]) {
    return 0;
  }
  if ([(CUCaptureController *)self->_captureController isCapturingStillImage]) {
    return 1;
  }
  return self->_lastCaptureCompletionTime != 0.0
      && CFAbsoluteTimeGetCurrent() - self->_lastCaptureCompletionTime < self->_delayBetweenCaptures;
}

- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = self->_captureController;
  if (!self->_waitingOnWarmupCapture
    && ![(CAMIntervalometerTestHarness *)self _shouldDelayBeforeCapturing]
    && ([(CUCaptureController *)v6 isCaptureAvailable]
     || ![(CAMIntervalometerTestHarness *)self _allowOverlappingCaptures]))
  {
    id v9 = (void *)[v5 mutableCopy];
    v10 = +[CAMCaptureCapabilities capabilities];
    int v11 = [v10 isCTMVideoCaptureSupportedForMode:self->_mode];

    if (v11)
    {
      [v9 setUserInitiationTime:mach_absolute_time()];
      [v9 setCtmCaptureType:1];
      id v23 = 0;
      BOOL v12 = [(CUCaptureController *)v6 initiateCTMCaptureWithSettings:v9 error:&v23];
      id v13 = v23;
      id v14 = v13;
      if (!v12) {
        goto LABEL_21;
      }
      id v22 = v13;
      BOOL v15 = [(CUCaptureController *)v6 commitCTMCaptureWithRequest:v9 error:&v22];
      id v16 = v22;

      id v14 = v16;
    }
    else
    {
      id v21 = 0;
      BOOL v15 = [(CUCaptureController *)v6 captureStillImageWithRequest:v9 error:&v21];
      id v14 = v21;
    }
    if (v14) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v15;
    }
    BOOL performWarmupCapture = self->_performWarmupCapture;
    if (self->_performWarmupCapture && v17)
    {
      id v14 = 0;
      self->_waitingOnWarmupCapture = 1;
      BOOL performWarmupCapture = self->_performWarmupCapture;
    }
    if (performWarmupCapture) {
      BOOL v17 = 0;
    }
    if (v17)
    {
      numberOfResponsesForRequest = self->_numberOfResponsesForRequest;
      v20 = [v5 persistenceUUID];
      [(NSMutableDictionary *)numberOfResponsesForRequest setObject:&unk_26BDDEC40 forKeyedSubscript:v20];

      BOOL v7 = 1;
LABEL_22:

      goto LABEL_4;
    }
LABEL_21:
    BOOL v7 = 0;
    goto LABEL_22;
  }
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4
{
  objc_msgSend(a4, "persistenceUUID", a3);
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  finalRequestPersistenceUUID = self->_finalRequestPersistenceUUID;
  self->_finalRequestPersistenceUUID = v5;
  MEMORY[0x270F9A758](v5, finalRequestPersistenceUUID);
}

- (BOOL)_hasReceivedExpectedNumberOfResponsesForPersistenceUUID:(id)a3 failureReason:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(NSMutableDictionary *)self->_numberOfResponsesForRequest objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];
  uint64_t v9 = v8;
  unint64_t expectedNumberOfResponsesPerRequest = self->_expectedNumberOfResponsesPerRequest;
  if (a4 && v8 != expectedNumberOfResponsesPerRequest)
  {
    *a4 = [NSString stringWithFormat:@"Did not receive the expected number of reponses for the given test (%lu instead of %lu for persistenceUUID %@)", v8, expectedNumberOfResponsesPerRequest, v6];
  }

  return v9 == expectedNumberOfResponsesPerRequest;
}

- (BOOL)_hasReceivedExpectedNumberOfResponsesForRequestsWithFailureReason:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_numberOfResponsesForRequest allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![(CAMIntervalometerTestHarness *)self _hasReceivedExpectedNumberOfResponsesForPersistenceUUID:*(void *)(*((void *)&v12 + 1) + 8 * i) failureReason:a3])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (CAMCaptureRequestIntervalometer)testIntervalometer
{
  return self->_testIntervalometer;
}

- (void)setTestIntervalometer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testIntervalometer, 0);
  objc_storeStrong((id *)&self->_numberOfResponsesForRequest, 0);
  objc_storeStrong((id *)&self->_finalRequestPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
}

@end