@interface CFXLiveCaptureViewController
+ (id)instantiate;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime_renderImageQ;
- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isCapturing;
- (BOOL)isCapturingPhoto_recordingQ;
- (BOOL)isCapturingVideo_recordingQ;
- (BOOL)livePlayerIsSaturated;
- (BOOL)useLocalCameraViewfinder;
- (CFXEffectComposition)composition;
- (CFXLiveCaptureViewController)initWithCoder:(id)a3;
- (CFXLiveCaptureViewControllerDelegate)delegate;
- (CFXRenderer)renderer_renderQ;
- (CFXThermalPolicyManager)thermalPolicyManager;
- (CGPoint)locationInCaptureViewForGestureRecognizer:(id)a3;
- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate;
- (JFXImageView)renderImageView;
- (JFXOrientationMonitor)orientationMonitor;
- (JFXVideoWriter)videoWriter;
- (JTImage)renderedImage;
- (JTImage)renderedImage_renderImageQ;
- (NSMutableArray)renderFrameCompletionBlocks;
- (OS_dispatch_queue)recordingQ;
- (OS_dispatch_queue)renderImageQ;
- (OS_dispatch_queue)renderQ;
- (UIColor)animojiBackgroundColor;
- (UIView)containerView;
- (UIView)debugControlsView;
- (UIView)uncroppedCameraViewfinderPlaceholderView;
- (UIView)uncroppedRenderImagePlaceHolderView;
- (int64_t)captureMode;
- (void)CFX_createUncroppedCameraPlaceholderViewIfNecessary;
- (void)CFX_executeRenderCallbacksQueuedBeforeTime:(id *)a3;
- (void)CFX_installGestures;
- (void)CFX_livePreviewDoubleTapped:(id)a3;
- (void)CFX_livePreviewPanned:(id)a3;
- (void)CFX_livePreviewPinched:(id)a3;
- (void)CFX_livePreviewRotated:(id)a3;
- (void)CFX_livePreviewTapped:(id)a3;
- (void)CFX_setAnimationEnabledForOverlays:(BOOL)a3;
- (void)CFX_setupVideoWriterWithAudio:(BOOL)a3 completion:(id)a4;
- (void)CFX_tearDownVideoWriter:(id)a3;
- (void)cancelVideoRecording;
- (void)capturePhotoWithFlashMode:(int64_t)a3 completion:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)executeAfterNextFrameIsRendered:(id)a3;
- (void)flushRenderer;
- (void)pauseRenderingCameraFrames;
- (void)processAudioSample:(opaqueCMSampleBuffer *)a3;
- (void)removeAllEffects:(id)a3;
- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4;
- (void)renderVideoFrame:(id)a3;
- (void)renderer:(id)a3 didPrepareToRenderFrameAtPresentationTime:(id *)a4;
- (void)renderer:(id)a3 didRenderFrame:(id)a4;
- (void)resumeRenderingCameraFrames;
- (void)setAnimojiBackgroundColor:(id)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setComposition:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentRenderPresentationTime_renderImageQ:(id *)a3;
- (void)setDebugControlsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsCapturingPhoto_recordingQ:(BOOL)a3;
- (void)setIsCapturingVideo_recordingQ:(BOOL)a3;
- (void)setOrientationMonitor:(id)a3;
- (void)setRecordingQ:(id)a3;
- (void)setRenderFrameCompletionBlocks:(id)a3;
- (void)setRenderImageQ:(id)a3;
- (void)setRenderImageView:(id)a3;
- (void)setRenderQ:(id)a3;
- (void)setRenderedImage_renderImageQ:(id)a3;
- (void)setRenderer_renderQ:(id)a3;
- (void)setThermalPolicyManager:(id)a3;
- (void)setTrackingLossDelegate:(id)a3;
- (void)setUncroppedRenderImagePlaceHolderView:(id)a3;
- (void)setUseLocalCameraViewfinder:(BOOL)a3;
- (void)setVideoWriter:(id)a3;
- (void)startButtonTouchUpInside:(id)a3;
- (void)startRenderingCameraFrames;
- (void)startVideoRecordingWithFlashMode:(int64_t)a3;
- (void)stopButtonTouchUpInside:(id)a3;
- (void)stopRenderingCameraFrames;
- (void)stopRenderingCameraFrames:(id)a3;
- (void)stopVideoRecording:(id)a3;
- (void)toggleDebugControlsView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDropCameraFrame;
@end

@implementation CFXLiveCaptureViewController

- (CFXLiveCaptureViewController)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CFXLiveCaptureViewController;
  v3 = [(CFXLiveCaptureViewController *)&v19 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v3->_useLocalCameraViewfinder = 1;
    uint64_t v5 = JFXCreateDispatchQueue(v3, @"rendererQ", 0);
    renderQ = v4->_renderQ;
    v4->_renderQ = (OS_dispatch_queue *)v5;

    uint64_t v7 = JFXCreateDispatchQueue(v4, @"recordingQ", 0);
    recordingQ = v4->_recordingQ;
    v4->_recordingQ = (OS_dispatch_queue *)v7;

    uint64_t v9 = JFXCreateDispatchQueue(v4, @"renderImageQ", 0);
    renderImageQ = v4->_renderImageQ;
    v4->_renderImageQ = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    composition = v4->_composition;
    v4->_composition = (CFXEffectComposition *)v11;

    uint64_t v13 = objc_opt_new();
    renderFrameCompletionBlocks = v4->_renderFrameCompletionBlocks;
    v4->_renderFrameCompletionBlocks = (NSMutableArray *)v13;

    CFTimeInterval v15 = CACurrentMediaTime();
    CMTimeMakeWithSeconds(&v18, v15, 1000000000);
    long long v16 = *(_OWORD *)&v18.value;
    v4->_currentRenderPresentationTime_renderImageQ.epoch = v18.epoch;
    *(_OWORD *)&v4->_currentRenderPresentationTime_renderImageQ.value = v16;
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CFXLiveCaptureViewController;
  [(CFXLiveCaptureViewController *)&v3 viewDidLoad];
  [(CFXLiveCaptureViewController *)self CFX_installGestures];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXLiveCaptureViewController;
  [(CFXLiveCaptureViewController *)&v5 viewWillAppear:a3];
  v4 = [(CFXLiveCaptureViewController *)self debugControlsView];
  [v4 removeFromSuperview];

  [(CFXLiveCaptureViewController *)self setDebugControlsView:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXLiveCaptureViewController;
  [(CFXLiveCaptureViewController *)&v4 viewWillDisappear:a3];
  if (!isStreamingMode([(CFXLiveCaptureViewController *)self captureMode])) {
    [(CFXLiveCaptureViewController *)self stopRenderingCameraFrames];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CFXLiveCaptureViewController;
  [(CFXLiveCaptureViewController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)livePlayerIsSaturated
{
  objc_super v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_super v3 = [(CFXLiveCaptureViewController *)self renderQ];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__CFXLiveCaptureViewController_livePlayerIsSaturated__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __53__CFXLiveCaptureViewController_livePlayerIsSaturated__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 livePlayerIsSaturated];
}

- (void)willDropCameraFrame
{
  objc_super v3 = [(CFXLiveCaptureViewController *)self renderQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CFXLiveCaptureViewController_willDropCameraFrame__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __51__CFXLiveCaptureViewController_willDropCameraFrame__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 willDropCameraFrame];
}

- (void)setUseLocalCameraViewfinder:(BOOL)a3
{
  if (self->_useLocalCameraViewfinder != a3)
  {
    BOOL v5 = !a3;
    uint64_t v6 = [(CFXLiveCaptureViewController *)self renderImageView];
    [v6 setHidden:v5];

    self->_useLocalCameraViewfinder = a3;
  }
}

- (UIView)uncroppedCameraViewfinderPlaceholderView
{
  [(CFXLiveCaptureViewController *)self CFX_createUncroppedCameraPlaceholderViewIfNecessary];
  objc_super v3 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];

  if (v3) {
    [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];
  }
  else {
  objc_super v4 = [(CFXLiveCaptureViewController *)self renderImageView];
  }
  return (UIView *)v4;
}

- (void)CFX_createUncroppedCameraPlaceholderViewIfNecessary
{
  id v28 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v28 userInterfaceIdiom])
  {
    int64_t v3 = [(CFXLiveCaptureViewController *)self captureMode];

    if (v3 == 1) {
      return;
    }
    objc_super v4 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F1CB60]);
      [(CFXLiveCaptureViewController *)self setUncroppedRenderImagePlaceHolderView:v5];

      uint64_t v6 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];
      [v6 setUserInteractionEnabled:0];

      uint64_t v7 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];
      [v7 setHidden:1];

      uint64_t v8 = [(CFXLiveCaptureViewController *)self view];
      char v9 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];
      [v8 insertSubview:v9 atIndex:0];
    }
    v10 = +[CFXMediaSettings sharedInstance];
    [v10 renderSize];
    double v12 = v11;
    double v14 = v13;

    CFTimeInterval v15 = [(CFXLiveCaptureViewController *)self renderImageView];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    if (v12 != *MEMORY[0x263F001B0] || v14 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      double v17 = CGRectFillRectToAspectInRect(v17, v19, v21, v23, 0.0, 0.0, v12, v14);
      double v19 = v25;
      double v21 = v26;
      double v23 = v27;
    }
    id v28 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];
    objc_msgSend(v28, "setFrame:", v17, v19, v21, v23);
  }
}

- (void)startButtonTouchUpInside:(id)a3
{
  id v3 = +[JFXVideoCameraController sharedInstance];
  [v3 startCameraSession:&__block_literal_global_5];
}

- (void)stopButtonTouchUpInside:(id)a3
{
  id v3 = +[JFXVideoCameraController sharedInstance];
  [v3 stopCameraSession:0];
}

- (void)toggleDebugControlsView:(id)a3
{
  objc_super v4 = [(CFXLiveCaptureViewController *)self debugControlsView];
  int v5 = [v4 isHidden];

  id v6 = [(CFXLiveCaptureViewController *)self debugControlsView];
  [v6 setHidden:v5 ^ 1u];
}

- (JTImage)renderedImage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  double v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = [(CFXLiveCaptureViewController *)self renderImageQ];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CFXLiveCaptureViewController_renderedImage__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (JTImage *)v4;
}

uint64_t __45__CFXLiveCaptureViewController_renderedImage__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "renderedImage_renderImageQ");
  return MEMORY[0x270F9A758]();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3810000000;
  double v11 = &unk_234D77F97;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  int v5 = [(CFXLiveCaptureViewController *)self renderImageQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CFXLiveCaptureViewController_currentRenderPresentationTime__block_invoke;
  block[3] = &unk_264C09EE8;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync(v5, block);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v9 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

double __61__CFXLiveCaptureViewController_currentRenderPresentationTime__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "currentRenderPresentationTime_renderImageQ");
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v5;
  *(_OWORD *)(v3 + 32) = v5;
  *(void *)(v3 + 48) = v6;
  return result;
}

- (void)renderer:(id)a3 didPrepareToRenderFrameAtPresentationTime:(id *)a4
{
  uint64_t v6 = [(CFXLiveCaptureViewController *)self renderImageQ];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CFXLiveCaptureViewController_renderer_didPrepareToRenderFrameAtPresentationTime___block_invoke;
  v7[3] = &unk_264C0A300;
  v7[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  dispatch_sync(v6, v7);
}

uint64_t __83__CFXLiveCaptureViewController_renderer_didPrepareToRenderFrameAtPresentationTime___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRenderPresentationTime_renderImageQ:", &v2);
}

- (void)renderer:(id)a3 didRenderFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(CFXLiveCaptureViewController *)self delegate];
  [v8 liveCaptureViewController:self didRenderFrame:v7];

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke;
  v27[3] = &unk_264C0A328;
  objc_copyWeak(&v28, &location);
  uint64_t v9 = (JTImage *)MEMORY[0x237DD15A0](v27);
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  if (v7) {
    [v7 timestamp];
  }
  if ([(CFXLiveCaptureViewController *)self useLocalCameraViewfinder])
  {
    objc_msgSend(MEMORY[0x263F61268], "imageWithCVPixelBuffer:", objc_msgSend(v7, "pixelBuffer"));
    uint64_t v10 = (JTImage *)objc_claimAutoreleasedReturnValue();
    double v11 = [[JTImage alloc] initWithPVImage:v10];
    uint64_t v12 = [(CFXLiveCaptureViewController *)self renderImageQ];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_2;
    block[3] = &unk_264C09F10;
    block[4] = self;
    v24 = v11;
    uint64_t v13 = v11;
    dispatch_sync(v12, block);

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_3;
    v19[3] = &unk_264C0A350;
    v19[4] = self;
    double v20 = v9;
    long long v21 = v25;
    uint64_t v22 = v26;
    uint64_t v14 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_4;
    v15[3] = &unk_264C0A378;
    double v16 = v9;
    long long v17 = v25;
    uint64_t v18 = v26;
    uint64_t v10 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v15);
    uint64_t v13 = v16;
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  objc_msgSend(WeakRetained, "CFX_executeRenderCallbacksQueuedBeforeTime:", &v4);
}

uint64_t __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRenderedImage_renderImageQ:", *(void *)(a1 + 40));
}

void __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_3(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) renderedImage];
  uint64_t v3 = [*(id *)(a1 + 32) renderImageView];
  [v3 setJtImage:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void (**)(uint64_t, long long *, uint64_t))(v4 + 16);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  v5(v4, &v7, v6);
}

uint64_t __56__CFXLiveCaptureViewController_renderer_didRenderFrame___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(uint64_t (**)(uint64_t, long long *))(v1 + 16);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return v2(v1, &v4);
}

- (void)renderVideoFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CFXLiveCaptureViewController *)self recordingQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke;
  block[3] = &unk_264C09F10;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  long long v7 = [[CFXFrame alloc] initWithFrameSet:v6];
  uint64_t v8 = [(CFXLiveCaptureViewController *)self renderQ];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke_2;
  v10[3] = &unk_264C09F10;
  v10[4] = self;
  double v11 = v7;
  uint64_t v9 = v7;
  dispatch_async(v8, v10);
}

void __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ"))
  {
    id v2 = [*(id *)(a1 + 32) videoWriter];
    [v2 writeCameraFrameSet:*(void *)(a1 + 40)];
  }
}

void __49__CFXLiveCaptureViewController_renderVideoFrame___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) composition];
  [v4 renderFrame:v2 effectComposition:v3];
}

- (void)processAudioSample:(opaqueCMSampleBuffer *)a3
{
  CFRetain(a3);
  uint64_t v5 = [(CFXLiveCaptureViewController *)self recordingQ];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CFXLiveCaptureViewController_processAudioSample___block_invoke;
  v6[3] = &unk_264C0A3A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __51__CFXLiveCaptureViewController_processAudioSample___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ"))
  {
    uint64_t v2 = [*(id *)(a1 + 32) videoWriter];
    [v2 writeAudioBuffer:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  CFRelease(v3);
}

+ (id)instantiate
{
  uint64_t v2 = [MEMORY[0x263F086E0] jfxBundle];
  uint64_t v3 = [MEMORY[0x263F1C9E8] storyboardWithName:@"CFXLiveCapture" bundle:v2];
  id v4 = [v3 instantiateViewControllerWithIdentifier:@"CFXLiveCaptureViewController"];

  return v4;
}

- (UIColor)animojiBackgroundColor
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  double v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = [(CFXLiveCaptureViewController *)self renderQ];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CFXLiveCaptureViewController_animojiBackgroundColor__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UIColor *)v4;
}

void __54__CFXLiveCaptureViewController_animojiBackgroundColor__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 animojiBackgroundColor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setAnimojiBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXLiveCaptureViewController *)self renderQ];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CFXLiveCaptureViewController_setAnimojiBackgroundColor___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__CFXLiveCaptureViewController_setAnimojiBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setAnimojiBackgroundColor:v1];
}

- (void)setTrackingLossDelegate:(id)a3
{
}

- (void)executeAfterNextFrameIsRendered:(id)a3
{
  memset(&v13, 0, sizeof(v13));
  id v4 = a3;
  id v5 = +[CFXMediaSettings sharedInstance];
  CMTimeMake(&v13, 1, [v5 frameRate]);

  memset(&v12, 0, sizeof(v12));
  [(CFXLiveCaptureViewController *)self currentRenderPresentationTime];
  memset(&v11, 0, sizeof(v11));
  CMTime lhs = v12;
  CMTime v9 = v13;
  CMTimeAdd(&v11, &lhs, &v9);
  id v6 = [CFXNextRenderedFrameCallback alloc];
  CMTime lhs = v11;
  uint64_t v7 = [(CFXNextRenderedFrameCallback *)v6 initWithBlock:v4 sendAfterRenderTime:&lhs];

  id v8 = [(CFXLiveCaptureViewController *)self renderFrameCompletionBlocks];
  [v8 addObject:v7];
}

- (void)startRenderingCameraFrames
{
  [(CFXLiveCaptureViewController *)self loadViewIfNeeded];
  uint64_t v3 = [(CFXLiveCaptureViewController *)self renderQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CFXLiveCaptureViewController_startRenderingCameraFrames__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__CFXLiveCaptureViewController_startRenderingCameraFrames__block_invoke(uint64_t a1)
{
  id v2 = -[CFXRenderer initWithDelegate:captureMode:]([CFXRenderer alloc], "initWithDelegate:captureMode:", *(void *)(a1 + 32), [*(id *)(a1 + 32) captureMode]);
  objc_msgSend(*(id *)(a1 + 32), "setRenderer_renderQ:", v2);

  uint64_t v3 = [*(id *)(a1 + 32) trackingLossDelegate];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  [v4 setTrackingLossDelegate:v3];

  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  CMTime v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  id v15 = [v5 stringWithFormat:@"%@/%@", v7, v10];

  CMTime v11 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  CMTime v12 = [v11 fpsCalc];
  [v12 setName:v15];

  CMTime v13 = +[JFXVideoCameraController sharedInstance];
  [v13 addVideoRenderDelegate:*(void *)(a1 + 32)];

  uint64_t v14 = +[JFXVideoCameraController sharedInstance];
  [v14 addAudioRenderDelegate:*(void *)(a1 + 32)];
}

- (void)stopRenderingCameraFrames
{
}

- (void)stopRenderingCameraFrames:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXLiveCaptureViewController *)self renderQ];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CFXLiveCaptureViewController_stopRenderingCameraFrames___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__CFXLiveCaptureViewController_stopRenderingCameraFrames___block_invoke(uint64_t a1)
{
  id v2 = +[JFXVideoCameraController sharedInstance];
  [v2 removeVideoRenderDelegate:*(void *)(a1 + 32) async:0];

  uint64_t v3 = +[JFXVideoCameraController sharedInstance];
  [v3 removeAudioRenderDelegate:*(void *)(a1 + 32) async:0];

  objc_msgSend(*(id *)(a1 + 32), "setRenderer_renderQ:", 0);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)pauseRenderingCameraFrames
{
  uint64_t v3 = [(CFXLiveCaptureViewController *)self renderQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CFXLiveCaptureViewController_pauseRenderingCameraFrames__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__CFXLiveCaptureViewController_pauseRenderingCameraFrames__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 pause];
}

- (void)resumeRenderingCameraFrames
{
  uint64_t v3 = [(CFXLiveCaptureViewController *)self renderQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CFXLiveCaptureViewController_resumeRenderingCameraFrames__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__CFXLiveCaptureViewController_resumeRenderingCameraFrames__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 resume];
}

- (void)flushRenderer
{
  uint64_t v3 = [(CFXLiveCaptureViewController *)self renderQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CFXLiveCaptureViewController_flushRenderer__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __45__CFXLiveCaptureViewController_flushRenderer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 flush];
}

- (void)removeAllEffectsOfType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke;
  v17[3] = &unk_264C0A3F0;
  id v8 = v7;
  id v18 = v8;
  CMTime v9 = (void (**)(void))MEMORY[0x237DD15A0](v17);
  uint64_t v10 = [(CFXLiveCaptureViewController *)self composition];
  char v11 = [v10 hasEffectOfType:v6];

  if (v11)
  {
    CMTime v12 = [(CFXLiveCaptureViewController *)self composition];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_2;
    v13[3] = &unk_264C0A418;
    id v14 = v6;
    id v15 = self;
    double v16 = v9;
    [v12 removeAllEffectsOfType:v14 completion:v13];
  }
  else
  {
    v9[2](v9);
  }
}

void __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
}

void __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];
  int v3 = [v2 isEqualToString:@"Animoji"];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) renderQ];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_3;
    v7[3] = &unk_264C0A3C8;
    id v5 = *(void **)(a1 + 48);
    v7[4] = *(void *)(a1 + 40);
    id v8 = v5;
    dispatch_async(v4, v7);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

uint64_t __66__CFXLiveCaptureViewController_removeAllEffectsOfType_completion___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  int v3 = [v2 animojiRenderer];
  [v3 clear];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)removeAllEffects:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke;
  v11[3] = &unk_264C0A3F0;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x237DD15A0](v11);
  id v7 = [(CFXLiveCaptureViewController *)self composition];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_2;
  v9[3] = &unk_264C0A3C8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 removeAllEffects:v9];
}

void __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
}

void __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_2(uint64_t a1)
{
  id v2 = +[JFXVideoCameraController sharedInstance];
  [v2 clear];

  int v3 = [*(id *)(a1 + 32) renderQ];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_3;
  v5[3] = &unk_264C0A3C8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __49__CFXLiveCaptureViewController_removeAllEffects___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  int v3 = [v2 animojiRenderer];
  [v3 clear];

  id v4 = objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  [v4 resetMetadataValidation];

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (BOOL)isCapturing
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(CFXLiveCaptureViewController *)self recordingQ];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__CFXLiveCaptureViewController_isCapturing__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__CFXLiveCaptureViewController_isCapturing__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isCapturingVideo_recordingQ")) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCapturingPhoto_recordingQ");
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)startVideoRecordingWithFlashMode:(int64_t)a3
{
  id v4 = [(CFXLiveCaptureViewController *)self thermalPolicyManager];
  [v4 setRecordingPolicy:1];

  [(CFXLiveCaptureViewController *)self CFX_setupVideoWriterWithAudio:1 completion:0];
  [(CFXLiveCaptureViewController *)self CFX_setAnimationEnabledForOverlays:1];
}

- (void)stopVideoRecording:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self CFX_setAnimationEnabledForOverlays:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__CFXLiveCaptureViewController_stopVideoRecording___block_invoke;
  v6[3] = &unk_264C0A440;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CFXLiveCaptureViewController *)self CFX_tearDownVideoWriter:v6];
}

void __51__CFXLiveCaptureViewController_stopVideoRecording___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) thermalPolicyManager];
  [v6 setRecordingPolicy:0];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)cancelVideoRecording
{
}

- (void)capturePhotoWithFlashMode:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CFXLiveCaptureViewController *)self recordingQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(v7, block);

  id v8 = +[JFXVideoCameraController sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_2;
  v10[3] = &unk_264C0A530;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 capturePhotoWithFlash:a3 completion:v10];
}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsCapturingPhoto_recordingQ:", 1);
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_3;
  v34[3] = &unk_264C0A490;
  id v10 = *(id *)(a1 + 40);
  v34[4] = *(void *)(a1 + 32);
  id v35 = v10;
  uint64_t v11 = MEMORY[0x237DD15A0](v34);
  id v12 = (void (**)(void, void, void, void))v11;
  if (v9)
  {
    (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
  }
  else
  {
    CMTime v13 = [v8 metadataDict];
    id v14 = [v13 objectForKeyedSubscript:@"PVFrameSetMetadataARMetadataKey"];

    if (v14)
    {
      id v15 = [*(id *)(a1 + 32) composition];
      double v16 = [v15 jtEffectsForType:7];

      if ([v16 count])
      {
        uint64_t v28 = 0;
        v29 = &v28;
        uint64_t v30 = 0x3032000000;
        v31 = __Block_byref_object_copy__3;
        v32 = __Block_byref_object_dispose__3;
        id v33 = 0;
        long long v17 = [*(id *)(a1 + 32) renderQ];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_6;
        block[3] = &unk_264C0A4B8;
        uint64_t v18 = *(void *)(a1 + 32);
        double v27 = &v28;
        block[4] = v18;
        id v19 = v14;
        id v26 = v19;
        dispatch_sync(v17, block);

        [v19 setAnimojiPhysicsBlendShapes:v29[5]];
        _Block_object_dispose(&v28, 8);
      }
      double v20 = *(void **)(a1 + 32);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_7;
      v21[3] = &unk_264C0A508;
      v21[4] = v20;
      id v22 = v8;
      v24 = v12;
      id v23 = v7;
      objc_msgSend(v20, "CFX_setupVideoWriterWithAudio:completion:", 0, v21);
    }
    else
    {
      ((void (**)(void, id, void, void))v12)[2](v12, v7, 0, 0);
    }
  }
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_4;
  block[3] = &unk_264C0A468;
  id v10 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v11;
  id v22 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v15 = [*(id *)(a1 + 32) recordingQ];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_5;
  v16[3] = &unk_264C09FA8;
  v16[4] = *(void *)(a1 + 32);
  dispatch_async(v15, v16);
}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v2 = *(void **)(a1 + 56);
  return [v2 stopRenderingCameraFrames];
}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsCapturingPhoto_recordingQ:", 0);
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "renderer_renderQ");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v9 animojiRenderer];
  int v3 = [*(id *)(a1 + 40) arFrame];
  int64_t v4 = +[JFXOrientationMonitor interfaceOrientation];
  id v5 = [MEMORY[0x263F1C550] clearColor];
  uint64_t v6 = [v2 preRecordedBlendShapesForFrame:v3 captureOrientation:4 interfaceOrientation:v4 backgroundColor:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", 0);
  id v2 = [*(id *)(a1 + 32) videoWriter];
  [v2 writeCameraFrameSet:*(void *)(a1 + 40)];

  int v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_8;
  v4[3] = &unk_264C0A4E0;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "CFX_tearDownVideoWriter:", v4);
}

uint64_t __69__CFXLiveCaptureViewController_capturePhotoWithFlashMode_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a3, 0);
}

- (void)CFX_setupVideoWriterWithAudio:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3;
  v32[4] = __Block_byref_object_dispose__3;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3;
  v30[4] = __Block_byref_object_dispose__3;
  id v31 = 0;
  dispatch_group_enter(v7);
  id v8 = +[JFXVideoCameraController sharedInstance];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke;
  v26[3] = &unk_264C0A558;
  uint64_t v28 = v32;
  v29 = v30;
  id v9 = v7;
  double v27 = v9;
  [v8 videoAndAudioOutputSettings:v26];

  dispatch_group_enter(v9);
  id v10 = +[JFXVideoCameraController sharedInstance];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_2;
  v24[3] = &unk_264C09FA8;
  uint64_t v11 = v9;
  long long v25 = v11;
  [v10 enableRecordingMovieMode:1 completion:v24];

  id v23 = 0;
  id v12 = +[JFXMediaURLManager videoRecordingFolderURL:&v23];
  id v13 = v23;
  id v14 = [(CFXLiveCaptureViewController *)self recordingQ];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_3;
  block[3] = &unk_264C0A580;
  void block[4] = self;
  id v18 = v12;
  BOOL v22 = a3;
  id v20 = v32;
  uint64_t v21 = v30;
  id v19 = v6;
  id v15 = v6;
  id v16 = v12;
  dispatch_group_notify(v11, v14, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_2(uint64_t a1)
{
}

void __73__CFXLiveCaptureViewController_CFX_setupVideoWriterWithAudio_completion___block_invoke_3(uint64_t a1)
{
  v39[2] = *MEMORY[0x263EF8340];
  id v2 = [JFXVideoWriter alloc];
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  int64_t v4 = [(JFXVideoWriter *)v2 initWithFolderURL:*(void *)(a1 + 40) videoOutputSettings:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) audioOutputSettings:v3 audioFormatHint:0];
  [*(id *)(a1 + 32) setVideoWriter:v4];

  id v5 = [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_msgSend(v5, "jfx_hasDepthCapableCamera"))
  {
    id v6 = +[JFXVideoCameraController sharedInstance];
    int v7 = [v6 depthEnabled];

    if (!v7) {
      goto LABEL_8;
    }
    id v8 = +[JFXVideoCameraController sharedInstance];
    uint64_t v9 = [v8 depthDimensions];
    id v10 = [*(id *)(a1 + 32) videoWriter];
    [v10 setDepthDimensions:v9];

    id v5 = [*(id *)(a1 + 32) videoWriter];
    [v5 setStoreDepthDataAsVideoTrack:1];
  }

LABEL_8:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  id v11 = +[JFXVideoCameraController sharedInstance];
  uint64_t v12 = [v11 cameraPosition];
  id v13 = +[JFXVideoCameraController sharedInstance];
  +[JFXRotationTransforms transformFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "transformFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", v12, [v13 captureVideoOrientation], +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));

  id v14 = [*(id *)(a1 + 32) composition];
  id v15 = [v14 jtEffectsForType:7];

  if ([v15 count])
  {
    id v16 = [v15 firstObject];
    v38[0] = @"JFXAnimojiEffectDataRepresentationKey";
    long long v17 = [v16 dataRepresentation];
    v39[0] = v17;
    v38[1] = @"JFXAnimojiEffectAvatarVersionNumberKey";
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "avatarVersionNumber"));
    v39[1] = v18;
    id v19 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

    id v32 = 0;
    id v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v32];
    id v21 = v32;
    BOOL v22 = [*(id *)(a1 + 32) videoWriter];
    [v22 setAnimojiMetadata:v20];
  }
  id v23 = [*(id *)(a1 + 32) videoWriter];
  id v31 = 0;
  *(_OWORD *)buf = v33;
  *(_OWORD *)&buf[16] = v34;
  long long v37 = v35;
  int v24 = [v23 startWriterWithVideoTransform:buf error:&v31];
  id v25 = v31;

  if (!v24 || v25)
  {
    id v26 = JFXLog_writer();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (*(unsigned char *)(a1 + 72)) {
        uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      else {
        uint64_t v30 = 0;
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v30;
      _os_log_debug_impl(&dword_234C41000, v26, OS_LOG_TYPE_DEBUG, "error starting video writer: %@\n\tvideo settings: %@\n\taudio settings: %@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) setVideoWriter:0];
  }
  double v27 = [*(id *)(a1 + 32) videoWriter];
  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", v27 != 0);

  uint64_t v28 = *(void *)(a1 + 48);
  if (v28) {
    (*(void (**)(void))(v28 + 16))();
  }
}

- (void)CFX_tearDownVideoWriter:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXLiveCaptureViewController *)self recordingQ];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) videoWriter];
  [*(id *)(a1 + 32) setVideoWriter:0];
  objc_msgSend(*(id *)(a1 + 32), "setIsCapturingVideo_recordingQ:", 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_2;
  v3[3] = &unk_264C0A5D0;
  id v4 = *(id *)(a1 + 40);
  [v2 finishWritingWithCompletionHandler:v3];
}

void __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = +[JFXVideoCameraController sharedInstance];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_3;
  v11[3] = &unk_264C0A5A8;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 enableRecordingMovieMode:0 completion:v11];
}

uint64_t __56__CFXLiveCaptureViewController_CFX_tearDownVideoWriter___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)CFX_installGestures
{
  id v12 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_CFX_livePreviewTapped_];
  [v12 setDelegate:self];
  [v12 setNumberOfTapsRequired:1];
  uint64_t v3 = [(CFXLiveCaptureViewController *)self containerView];
  [v3 addGestureRecognizer:v12];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel_CFX_livePreviewPanned_];
  [v4 setDelegate:self];
  [v4 setMinimumNumberOfTouches:1];
  id v5 = [(CFXLiveCaptureViewController *)self containerView];
  [v5 addGestureRecognizer:v4];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C860]) initWithTarget:self action:sel_CFX_livePreviewPinched_];
  [v6 setDelegate:self];
  [v6 setScale:1.0];
  int v7 = [(CFXLiveCaptureViewController *)self containerView];
  [v7 addGestureRecognizer:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F1C900]) initWithTarget:self action:sel_CFX_livePreviewRotated_];
  [v8 setDelegate:self];
  id v9 = [(CFXLiveCaptureViewController *)self containerView];
  [v9 addGestureRecognizer:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_CFX_livePreviewDoubleTapped_];
  [v10 setDelegate:self];
  [v10 setNumberOfTapsRequired:2];
  id v11 = [(CFXLiveCaptureViewController *)self containerView];
  [v11 addGestureRecognizer:v10];
}

- (CGPoint)locationInCaptureViewForGestureRecognizer:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self CFX_createUncroppedCameraPlaceholderViewIfNecessary];
  id v5 = [(CFXLiveCaptureViewController *)self renderImageView];
  id v6 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];

  if (v6)
  {
    uint64_t v7 = [(CFXLiveCaptureViewController *)self uncroppedRenderImagePlaceHolderView];

    id v5 = (void *)v7;
  }
  [v4 locationInView:v5];
  double v9 = v8;
  double v11 = v10;
  [v5 bounds];
  double v13 = v12;
  double v15 = v14;
  +[JFXMediaSettings renderSize];
  double v18 = CGPointConvertToNormalizedCoordinateSpace(2uLL, 0, v9, v11, v13, v15, v16, v17);
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)normalizedMinimumHitTestArea
{
  +[JFXMediaSettings renderSize];
  double v3 = 44.0 / v2;
  double v5 = 44.0 / v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

- (void)CFX_livePreviewTapped:(id)a3
{
  [(CFXLiveCaptureViewController *)self locationInCaptureViewForGestureRecognizer:a3];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(CFXLiveCaptureViewController *)self delegate];
  objc_msgSend(v8, "liveCaptureViewController:livePreviewTappedAtNormalizedPoint:", self, v5, v7);
}

- (void)CFX_livePreviewPanned:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self locationInCaptureViewForGestureRecognizer:v4];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CFXLiveCaptureViewController *)self delegate];
  objc_msgSend(v9, "liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:", self, v4, v6, v8);
}

- (void)CFX_livePreviewPinched:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self locationInCaptureViewForGestureRecognizer:v4];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CFXLiveCaptureViewController *)self delegate];
  objc_msgSend(v9, "liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);
}

- (void)CFX_livePreviewRotated:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self locationInCaptureViewForGestureRecognizer:v4];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CFXLiveCaptureViewController *)self delegate];
  objc_msgSend(v9, "liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);
}

- (void)CFX_livePreviewDoubleTapped:(id)a3
{
  id v4 = a3;
  [(CFXLiveCaptureViewController *)self locationInCaptureViewForGestureRecognizer:v4];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CFXLiveCaptureViewController *)self delegate];
  objc_msgSend(v9, "liveCaptureViewController:livePreviewDoubleTappedAtNormalizedCenterPoint:gesture:", self, v4, v6, v8);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
  }
  char v9 = isKindOfClass & v8;

  return v9 & 1;
}

- (void)CFX_setAnimationEnabledForOverlays:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = [(CFXLiveCaptureViewController *)self composition];
  id v5 = [v4 jtEffectsForType:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = MEMORY[0x263F010E0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v12 enablePresentationState:!v3];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = 0u;
        double v13 = [v12 renderEffect];
        double v14 = v13;
        if (v13)
        {
          [v13 effectRange];
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v21 = 0u;
        }

        if (v3)
        {
          long long v21 = CFXEffectPreviewStartAtNextRenderTime;
          uint64_t v15 = 0;
        }
        else
        {
          long long v21 = *(_OWORD *)v10;
          uint64_t v15 = *(void *)(v10 + 16);
        }
        *(void *)&long long v22 = v15;
        long long v18 = v21;
        long long v19 = v22;
        long long v20 = v23;
        double v16 = [v12 renderEffect];
        v17[0] = v18;
        v17[1] = v19;
        v17[2] = v20;
        [v16 setEffectRange:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)CFX_executeRenderCallbacksQueuedBeforeTime:(id *)a3
{
  id v5 = objc_opt_new();
  id v6 = [(CFXLiveCaptureViewController *)self renderFrameCompletionBlocks];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  double v11 = __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke;
  double v12 = &unk_264C0A5F8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3;
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:&v9];

  uint64_t v8 = [(CFXLiveCaptureViewController *)self renderFrameCompletionBlocks];
  [v8 removeObjectsInArray:v7];

  [v7 enumerateObjectsUsingBlock:&__block_literal_global_89];
}

void __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  memset(&v7, 0, sizeof(v7));
  if (v3) {
    [v3 sendAfterRenderTime];
  }
  CMTime time1 = *(CMTime *)(a1 + 40);
  CMTime v5 = v7;
  if (CMTimeCompare(&time1, &v5) >= 1) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __75__CFXLiveCaptureViewController_CFX_executeRenderCallbacksQueuedBeforeTime___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = [a2 block];
  v2[2]();
}

- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingLossDelegate);
  return (JFXAnimojiTrackingLossDelegate *)WeakRetained;
}

- (CFXLiveCaptureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXLiveCaptureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CFXEffectComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (BOOL)useLocalCameraViewfinder
{
  return self->_useLocalCameraViewfinder;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (CFXThermalPolicyManager)thermalPolicyManager
{
  return self->_thermalPolicyManager;
}

- (void)setThermalPolicyManager:(id)a3
{
}

- (JFXImageView)renderImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderImageView);
  return (JFXImageView *)WeakRetained;
}

- (void)setRenderImageView:(id)a3
{
}

- (UIView)debugControlsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugControlsView);
  return (UIView *)WeakRetained;
}

- (void)setDebugControlsView:(id)a3
{
}

- (UIView)uncroppedRenderImagePlaceHolderView
{
  return self->_uncroppedRenderImagePlaceHolderView;
}

- (void)setUncroppedRenderImagePlaceHolderView:(id)a3
{
}

- (OS_dispatch_queue)renderQ
{
  return self->_renderQ;
}

- (void)setRenderQ:(id)a3
{
}

- (CFXRenderer)renderer_renderQ
{
  return self->_renderer_renderQ;
}

- (void)setRenderer_renderQ:(id)a3
{
}

- (OS_dispatch_queue)recordingQ
{
  return self->_recordingQ;
}

- (void)setRecordingQ:(id)a3
{
}

- (OS_dispatch_queue)renderImageQ
{
  return self->_renderImageQ;
}

- (void)setRenderImageQ:(id)a3
{
}

- (JTImage)renderedImage_renderImageQ
{
  return self->_renderedImage_renderImageQ;
}

- (void)setRenderedImage_renderImageQ:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderPresentationTime_renderImageQ
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1120);
  return self;
}

- (void)setCurrentRenderPresentationTime_renderImageQ:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_currentRenderPresentationTime_renderImageQ.value = *(_OWORD *)&a3->var0;
  self->_currentRenderPresentationTime_renderImageQ.epoch = var3;
}

- (BOOL)isCapturingVideo_recordingQ
{
  return self->_isCapturingVideo_recordingQ;
}

- (void)setIsCapturingVideo_recordingQ:(BOOL)a3
{
  self->_isCapturingVideo_recordingQ = a3;
}

- (BOOL)isCapturingPhoto_recordingQ
{
  return self->_isCapturingPhoto_recordingQ;
}

- (void)setIsCapturingPhoto_recordingQ:(BOOL)a3
{
  self->_isCapturingPhoto_recordingQ = a3;
}

- (JFXVideoWriter)videoWriter
{
  return self->_videoWriter;
}

- (void)setVideoWriter:(id)a3
{
}

- (NSMutableArray)renderFrameCompletionBlocks
{
  return self->_renderFrameCompletionBlocks;
}

- (void)setRenderFrameCompletionBlocks:(id)a3
{
}

- (JFXOrientationMonitor)orientationMonitor
{
  return self->_orientationMonitor;
}

- (void)setOrientationMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationMonitor, 0);
  objc_storeStrong((id *)&self->_renderFrameCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_videoWriter, 0);
  objc_storeStrong((id *)&self->_renderedImage_renderImageQ, 0);
  objc_storeStrong((id *)&self->_renderImageQ, 0);
  objc_storeStrong((id *)&self->_recordingQ, 0);
  objc_storeStrong((id *)&self->_renderer_renderQ, 0);
  objc_storeStrong((id *)&self->_renderQ, 0);
  objc_storeStrong((id *)&self->_uncroppedRenderImagePlaceHolderView, 0);
  objc_destroyWeak((id *)&self->_debugControlsView);
  objc_destroyWeak((id *)&self->_renderImageView);
  objc_storeStrong((id *)&self->_thermalPolicyManager, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_trackingLossDelegate);
}

@end