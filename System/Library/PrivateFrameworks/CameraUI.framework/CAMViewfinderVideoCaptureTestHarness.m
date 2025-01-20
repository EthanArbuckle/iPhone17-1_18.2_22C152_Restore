@interface CAMViewfinderVideoCaptureTestHarness
- (BOOL)_captureCTMVideo;
- (CAMViewfinderVideoCaptureTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 videoDurationInSeconds:(double)a5 initialDelayInSeconds:(double)a6 captureCTMVideo:(BOOL)a7;
- (CAMViewfinderViewController)_viewfinderViewController;
- (double)_initialDelayInSeconds;
- (double)_videoDurationInSeconds;
- (id)endVideoHandler;
- (id)startVideoHandler;
- (void)_endCaptureWithError:(id)a3;
- (void)_startCapture;
- (void)setEndVideoHandler:(id)a3;
- (void)setStartVideoHandler:(id)a3;
- (void)set_viewfinderViewController:(id)a3;
- (void)startTesting;
- (void)stillImageRequestsWillRequestCTMVideoCaptureEndForViewfinderViewController:(id)a3;
- (void)viewfinderViewController:(id)a3 didReceiveVideoRequestDidCompleteCapture:(id)a4 withResponse:(id)a5 error:(id)a6;
@end

@implementation CAMViewfinderVideoCaptureTestHarness

- (CAMViewfinderVideoCaptureTestHarness)initWithTestName:(id)a3 viewfinderViewController:(id)a4 videoDurationInSeconds:(double)a5 initialDelayInSeconds:(double)a6 captureCTMVideo:(BOOL)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CAMViewfinderVideoCaptureTestHarness;
  v14 = [(CAMPerformanceTestHarness *)&v17 initWithTestName:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->__viewfinderViewController, a4);
    v15->__videoDurationInSeconds = a5;
    v15->__initialDelayInSeconds = a6;
    v15->__captureCTMVideo = a7;
  }

  return v15;
}

- (void)startTesting
{
  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderVideoCaptureTestHarness;
  [(CAMPerformanceTestHarness *)&v6 startTesting];
  [(CAMViewfinderVideoCaptureTestHarness *)self _initialDelayInSeconds];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CAMViewfinderVideoCaptureTestHarness_startTesting__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __52__CAMViewfinderVideoCaptureTestHarness_startTesting__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _viewfinderViewController];
  if ([*(id *)(a1 + 32) _captureCTMVideo])
  {
    [*(id *)(a1 + 32) _videoDurationInSeconds];
    double v3 = v2;
  }
  else
  {
    double v3 = 0.2;
  }
  char v4 = objc_msgSend(v6, "pressShutterButtonWithTouchUpDelay:shutterBehavior:", objc_msgSend(*(id *)(a1 + 32), "_captureCTMVideo"), v3);
  v5 = *(void **)(a1 + 32);
  if (v4) {
    [v5 startSubtestWithName:@"TimeToStartRecording" withMetrics:&unk_26BDDF950];
  }
  else {
    [v5 failedTestWithReason:@"Unable to start video recording"];
  }
}

- (void)viewfinderViewController:(id)a3 didReceiveVideoRequestDidCompleteCapture:(id)a4 withResponse:(id)a5 error:(id)a6
{
}

- (void)stillImageRequestsWillRequestCTMVideoCaptureEndForViewfinderViewController:(id)a3
{
}

- (void)_startCapture
{
  double v3 = [(CAMViewfinderVideoCaptureTestHarness *)self _viewfinderViewController];
  [(CAMPerformanceTestHarness *)self stopSubtestWithName:@"TimeToStartRecording"];
  char v4 = [(CAMViewfinderVideoCaptureTestHarness *)self startVideoHandler];

  if (v4)
  {
    v5 = [(CAMViewfinderVideoCaptureTestHarness *)self startVideoHandler];
    v5[2]();
  }
  if (![(CAMViewfinderVideoCaptureTestHarness *)self _captureCTMVideo])
  {
    [(CAMViewfinderVideoCaptureTestHarness *)self _videoDurationInSeconds];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__CAMViewfinderVideoCaptureTestHarness__startCapture__block_invoke;
    v8[3] = &unk_263FA0408;
    id v9 = v3;
    v10 = self;
    dispatch_after(v7, MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __53__CAMViewfinderVideoCaptureTestHarness__startCapture__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) pressShutterButtonWithTouchUpDelay:0.2];
  if ((result & 1) == 0)
  {
    double v3 = *(void **)(a1 + 40);
    return [v3 failedTestWithReason:@"Unable to end video recording"];
  }
  return result;
}

- (void)_endCaptureWithError:(id)a3
{
  id v9 = a3;
  char v4 = [(CAMViewfinderVideoCaptureTestHarness *)self endVideoHandler];

  if (v4)
  {
    v5 = [(CAMViewfinderVideoCaptureTestHarness *)self endVideoHandler];
    v5[2]();
  }
  if (v9)
  {
    double v6 = NSString;
    dispatch_time_t v7 = [v9 localizedDescription];
    v8 = [v6 stringWithFormat:@"Error from videoRequestDidCompleteCapture: %@", v7];
    [(CAMPerformanceTestHarness *)self failedTestWithReason:v8];
  }
  else
  {
    [(CAMPerformanceTestHarness *)self stopTesting];
  }
}

- (id)startVideoHandler
{
  return self->_startVideoHandler;
}

- (void)setStartVideoHandler:(id)a3
{
}

- (id)endVideoHandler
{
  return self->_endVideoHandler;
}

- (void)setEndVideoHandler:(id)a3
{
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void)set_viewfinderViewController:(id)a3
{
}

- (double)_videoDurationInSeconds
{
  return self->__videoDurationInSeconds;
}

- (double)_initialDelayInSeconds
{
  return self->__initialDelayInSeconds;
}

- (BOOL)_captureCTMVideo
{
  return self->__captureCTMVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong(&self->_endVideoHandler, 0);
  objc_storeStrong(&self->_startVideoHandler, 0);
}

@end