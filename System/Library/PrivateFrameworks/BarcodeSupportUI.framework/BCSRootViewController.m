@interface BCSRootViewController
- (BCSRootViewController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCapturingSteady;
- (BOOL)liveViewControllerTorchModeSupported:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (id)_bestCandidateVisualCode:(id)a3;
- (id)_bestCaptureDevice;
- (id)_bestCaptureFormatForDevice:(id)a3;
- (id)_imageFromLastVideoSample:(opaqueCMSampleBuffer *)a3 rect:(CGRect)a4;
- (id)_preferredInternalCamera;
- (unsigned)_desiredImageOrientation;
- (void)_clearResumeCapturingTimer;
- (void)_endSession;
- (void)_executeBlockWithLockedCameraDevice:(id)a3;
- (void)_pauseSessionIfNeeded;
- (void)_resetSessionWithCompletionHandler:(id)a3;
- (void)_restartSessionIfNeeded;
- (void)_startSession;
- (void)_startSessionConnectingPreviewLayer:(id)a3;
- (void)_updateCameraDevice;
- (void)_updateUserPreferredCameraIfNeeded;
- (void)_updateVideoRotationAngle;
- (void)_updateVideoRotationAngleIfNeeded;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)continueUserActivity:(id)a3;
- (void)createSessionIfNeededConnectingPreviewLayer:(id)a3 completion:(id)a4;
- (void)didLaunchFromControl:(id)a3;
- (void)disconnectPreviewLayerFromSession;
- (void)endSession;
- (void)executeBlockAsynchronouslyWithLockedCameraDevice:(id)a3;
- (void)executeBlockSynchronouslyWithLockedCameraDevice:(id)a3;
- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6;
- (void)liveViewController:(id)a3 didTapAtDevicePoint:(CGPoint)a4;
- (void)liveViewController:(id)a3 torchModeChangedTo:(BOOL)a4;
- (void)liveViewControllerDidResetCapture:(id)a3;
- (void)liveViewControllerWillPerformAction:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resumeCapturing;
- (void)setLiveZoomFactor:(double)a3;
- (void)subjectAreaDidChange:(id)a3;
- (void)suspendCapturing;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BCSRootViewController

- (BCSRootViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)BCSRootViewController;
  v2 = [(BCSRootViewController *)&v13 init];
  if (v2)
  {
    v3 = dispatch_get_global_queue(2, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeScanner.sessionQueue", 0, v3);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(BCSVisualCodeDetector);
    codeDetector = v2->_codeDetector;
    v2->_codeDetector = v6;

    if (shouldUseSystemPreferredCamera())
    {
      [(id)objc_opt_class() addObserver:v2 forKeyPath:@"systemPreferredCamera" options:4 context:observerContext];
    }
    else
    {
      v8 = v2->_captureQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__BCSRootViewController_init__block_invoke;
      block[3] = &unk_26524BD30;
      v12 = v2;
      dispatch_sync(v8, block);
    }
    v9 = v2;
  }

  return v2;
}

uint64_t __29__BCSRootViewController_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _bestCaptureDevice];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(v3 + 976);
  *(void *)(v3 + 976) = v2;

  [*(id *)(*(void *)(a1 + 32) + 976) addObserver:*(void *)(a1 + 32) forKeyPath:@"torchAvailable" options:0 context:observerContext];
  v5 = *(void **)(*(void *)(a1 + 32) + 976);

  return objc_msgSend(v5, "addObserver:forKeyPath:options:context:");
}

- (void)loadView
{
  v37[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v3 setAutoresizingMask:18];
  v22 = v3;
  [(BCSRootViewController *)self setView:v3];
  dispatch_queue_t v4 = [MEMORY[0x263F825C8] systemYellowColor];
  v5 = [(BCSRootViewController *)self view];
  [v5 setTintColor:v4];

  v6 = (AVCaptureVideoPreviewLayer *)objc_alloc_init(MEMORY[0x263EFA6B0]);
  previewLayer = self->_previewLayer;
  self->_previewLayer = v6;

  v8 = [[BCSLiveViewController alloc] initWithPreviewLayer:self->_previewLayer];
  liveViewController = self->_liveViewController;
  self->_liveViewController = v8;

  [(BCSLiveViewController *)self->_liveViewController setDelegate:self];
  [(BCSRootViewController *)self addChildViewController:self->_liveViewController];
  v33 = [(BCSLiveViewController *)self->_liveViewController view];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(BCSRootViewController *)self view];
  [v10 addSubview:v33];

  v23 = (void *)MEMORY[0x263F08938];
  v31 = [v33 topAnchor];
  v32 = [(BCSRootViewController *)self view];
  v30 = [v32 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v37[0] = v29;
  v27 = [v33 bottomAnchor];
  v28 = [(BCSRootViewController *)self view];
  v26 = [v28 bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v37[1] = v25;
  v24 = [v33 leftAnchor];
  v11 = [(BCSRootViewController *)self view];
  v12 = [v11 leftAnchor];
  objc_super v13 = [v24 constraintEqualToAnchor:v12];
  v37[2] = v13;
  v14 = [v33 rightAnchor];
  v15 = [(BCSRootViewController *)self view];
  v16 = [v15 rightAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v37[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  [v23 activateConstraints:v18];

  [(BCSLiveViewController *)self->_liveViewController didMoveToParentViewController:self];
  [(BCSRootViewController *)self createSessionIfNeededConnectingPreviewLayer:self->_previewLayer completion:0];
  self->_startTime = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  id v19 = objc_alloc(MEMORY[0x263EFA988]);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __33__BCSRootViewController_loadView__block_invoke;
  v34[3] = &unk_26524BFD0;
  objc_copyWeak(&v35, &location);
  v20 = (void *)[v19 initWithEventHandler:v34];
  v21 = [(BCSRootViewController *)self view];
  [v21 addInteraction:v20];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

void __33__BCSRootViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v4 phase] == 1) {
    WeakRetained[1048] = 1;
  }
}

- (void)viewDidLayoutSubviews
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  self->_statusBarOrientation = [v3 statusBarOrientation];

  uint64_t v4 = [(BCSRootViewController *)self _desiredImageOrientation];
  codeDetector = self->_codeDetector;

  [(BCSVisualCodeDetector *)codeDetector setImageOrientation:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_bestCaptureDevice
{
  if (!shouldUseSystemPreferredCamera())
  {
    v9 = [(BCSRootViewController *)self _preferredInternalCamera];
    goto LABEL_11;
  }
  id v3 = [MEMORY[0x263EFA598] systemPreferredCamera];
  uint64_t v4 = [v3 deviceType];
  v5 = v4;
  if (v4 == (void *)*MEMORY[0x263EF9648])
  {

    goto LABEL_7;
  }
  v6 = [v3 deviceType];
  v7 = (void *)*MEMORY[0x263EF9660];

  if (v6 == v7)
  {
LABEL_7:
    v10 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_248ACF000, v10, OS_LOG_TYPE_INFO, "Found ultra wide camera or triple camera from systemPreferredCamera, use preferred internal camera.", v12, 2u);
    }
    id v8 = [(BCSRootViewController *)self _preferredInternalCamera];
    goto LABEL_10;
  }
  id v8 = v3;
LABEL_10:
  v9 = v8;

LABEL_11:

  return v9;
}

- (id)_preferredInternalCamera
{
  v37[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFA5A8];
  id v3 = (void *)*MEMORY[0x263EF9620];
  uint64_t v4 = *MEMORY[0x263EF9670];
  v37[0] = *MEMORY[0x263EF9620];
  v37[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  v6 = [v2 discoverySessionWithDeviceTypes:v5 mediaType:*MEMORY[0x263EF9D48] position:1];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v28 = v6;
  id obj = [v6 devices];
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  int v30 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(obj);
      }
      objc_super v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v14 = [(BCSRootViewController *)self _bestCaptureFormatForDevice:v13];
      unint64_t v15 = [v14 highResolutionStillImageDimensions];

      if (!v10)
      {
        id v10 = v13;
        unint64_t v9 = HIDWORD(v15);
        int v30 = v15;
        continue;
      }
      uint64_t v16 = [v13 deviceType];
      if ((void *)v16 == v3)
      {
        v18 = v10;
      }
      else
      {
        v17 = (void *)v16;
        v18 = v10;
        [v10 deviceType];
        unint64_t v19 = v9;
        uint64_t v20 = v8;
        v22 = uint64_t v21 = v11;

        BOOL v23 = v22 == v3;
        uint64_t v11 = v21;
        uint64_t v8 = v20;
        unint64_t v9 = v19;
        if (v23)
        {
          id v10 = v18;
          continue;
        }
      }
      v24 = [v13 deviceType];
      if (v24 == v3)
      {
        id v10 = v18;
        v26 = [v18 deviceType];

        if (v26 != v3)
        {
          id v25 = v13;

          unint64_t v9 = HIDWORD(v15);
          goto LABEL_21;
        }
      }
      else
      {

        id v10 = v18;
      }
      if (([v10 hasTorch] & 1) == 0 && objc_msgSend(v13, "hasTorch")
        || (int)v15 * HIDWORD(v15) > (unint64_t)(v30 * (uint64_t)(int)v9))
      {
        id v25 = v13;

        unint64_t v9 = HIDWORD(v15);
LABEL_21:
        int v30 = v15;
        id v10 = v25;
        continue;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v8);
LABEL_26:

  return v10;
}

- (void)_updateCameraDevice
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(BCSRootViewController *)self _bestCaptureDevice];
  uint64_t v4 = v3;
  p_cameraDevice = &self->_cameraDevice;
  if (self->_cameraDevice != v3)
  {
    uint64_t v6 = [(AVCaptureDevice *)v3 position];
    uint64_t v7 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6 == 2)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v15 = v4;
        _os_log_impl(&dword_248ACF000, v7, OS_LOG_TYPE_INFO, "Ignoring front-facing camera: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v15 = v4;
        _os_log_impl(&dword_248ACF000, v7, OS_LOG_TYPE_INFO, "Updating cameraDevice to system preferred: %{private}@", buf, 0xCu);
      }
      [(AVCaptureDeviceRotationCoordinator *)self->_videoRotationCoordinator removeObserver:self forKeyPath:@"videoRotationAngleForHorizonLevelPreview"];
      [(AVCaptureDevice *)*p_cameraDevice removeObserver:self forKeyPath:@"torchAvailable"];
      [(AVCaptureDevice *)*p_cameraDevice removeObserver:self forKeyPath:@"torchActive"];
      unint64_t v9 = [(AVCaptureDevice *)v4 deviceType];
      id v10 = (void *)*MEMORY[0x263EF9688];

      if (v9 == v10) {
        [(BCSRootViewController *)self _endSession];
      }
      objc_storeStrong((id *)&self->_cameraDevice, v4);
      [(AVCaptureDevice *)*p_cameraDevice addObserver:self forKeyPath:@"torchAvailable" options:4 context:observerContext];
      [(AVCaptureDevice *)*p_cameraDevice addObserver:self forKeyPath:@"torchActive" options:4 context:observerContext];
      uint64_t v11 = (AVCaptureDeviceRotationCoordinator *)[objc_alloc(MEMORY[0x263EFA5D0]) initWithDevice:*p_cameraDevice previewLayer:self->_previewLayer];
      videoRotationCoordinator = self->_videoRotationCoordinator;
      self->_videoRotationCoordinator = v11;

      [(AVCaptureDeviceRotationCoordinator *)self->_videoRotationCoordinator addObserver:self forKeyPath:@"videoRotationAngleForHorizonLevelPreview" options:4 context:observerContext];
      [(BCSRootViewController *)self _startSessionConnectingPreviewLayer:self->_previewLayer];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__BCSRootViewController__updateCameraDevice__block_invoke;
      block[3] = &unk_26524BD30;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __44__BCSRootViewController__updateCameraDevice__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) cameraDeviceDidChange];
}

- (void)_updateUserPreferredCameraIfNeeded
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFA598] userPreferredCamera];
  uint64_t v4 = v3;
  if (v3 && [v3 position] != 1)
  {
    v5 = [(BCSRootViewController *)self _preferredInternalCamera];
    uint64_t v6 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543362;
      BOOL v8 = v5;
      _os_log_impl(&dword_248ACF000, v6, OS_LOG_TYPE_INFO, "Updating userPreferredCamera to %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [MEMORY[0x263EFA598] setUserPreferredCamera:v5];
  }
}

- (void)_updateVideoRotationAngleIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_needsUpdateVideoRotationAngle)
  {
    [(BCSRootViewController *)self _updateVideoRotationAngle];
  }
}

- (void)_updateVideoRotationAngle
{
  self->_needsUpdateVideoRotationAngle = 0;
  [(BCSLiveViewController *)self->_liveViewController compensateForVideoRotationAngleInLiveView:self->_videoRotationAngle];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if ((void *)observerContext == a6)
  {
    captureQueue = self->_captureQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_26524BF80;
    id v15 = v11;
    uint64_t v16 = self;
    id v17 = v10;
    dispatch_async(captureQueue, block);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BCSRootViewController;
    [(BCSRootViewController *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

void __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    [*(id *)(a1 + 40) _updateUserPreferredCameraIfNeeded];
    BOOL v8 = *(void **)(a1 + 40);
    [v8 _updateCameraDevice];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(void *)(a1 + 32) == *(void *)(v3 + 1080))
    {
      *(unsigned char *)(v3 + 1088) = 1;
      [*(id *)(*(void *)(a1 + 40) + 1080) videoRotationAngleForHorizonLevelPreview];
      *(double *)(*(void *)(a1 + 40) + 1096) = v9 * 3.14159265 / 180.0;
      dispatch_time_t v10 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      block[3] = &unk_26524BD30;
      void block[4] = *(void *)(a1 + 40);
      dispatch_after(v10, MEMORY[0x263EF83A0], block);
    }
    else
    {
      char v4 = [*(id *)(v3 + 976) isTorchAvailable];
      char v5 = [*(id *)(*(void *)(a1 + 40) + 976) isTorchActive];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v11[3] = &unk_26524BFF8;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 40);
      id v12 = v6;
      uint64_t v13 = v7;
      char v14 = v4;
      char v15 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v11);
    }
  }
}

uint64_t __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVideoRotationAngleIfNeeded];
}

uint64_t __72__BCSRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"torchAvailable"])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 1008);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    return [v2 torchAvailabilityChangedTo:v3];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"torchActive"];
    if (result)
    {
      char v5 = *(void **)(*(void *)(a1 + 40) + 1008);
      uint64_t v6 = *(unsigned __int8 *)(a1 + 49);
      return [v5 torchActivenessChangedTo:v6];
    }
  }
  return result;
}

- (id)_bestCaptureFormatForDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = a3;
  uint64_t v3 = [v18 formats];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = (const opaqueCMFormatDescription *)[v10 formatDescription];
        if (CMFormatDescriptionGetMediaSubType(v11) == 875704422)
        {
          unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v11);
          int32_t v13 = Dimensions;
          unint64_t v14 = HIDWORD(Dimensions);
          if (v6)
          {
            unint64_t v15 = HIDWORD(Dimensions) * (int)Dimensions;
            if (v15 > v7)
            {
              id v16 = v10;

              id v6 = v16;
              unint64_t v7 = v15;
            }
          }
          else
          {
            id v6 = v10;
            unint64_t v7 = (int)v14 * v13;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)disconnectPreviewLayerFromSession
{
}

- (BOOL)prefersStatusBarHidden
{
  uint64_t v2 = [(BCSRootViewController *)self presentedViewController];
  uint64_t v3 = v2;
  BOOL v4 = 1;
  if (v2)
  {
    if (([v2 isBeingDismissed] & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

- (void)endSession
{
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BCSRootViewController_endSession__block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __35__BCSRootViewController_endSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endSession];
}

- (void)_endSession
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(BCSRootViewController *)self disconnectPreviewLayerFromSession];
  if ([(AVCaptureSession *)self->_currentSession isRunning])
  {
    [(AVCaptureSession *)self->_currentSession stopRunning];
    [(BCSVisualCodeDetector *)self->_codeDetector endSession];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(AVCaptureSession *)self->_currentSession inputs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AVCaptureSession *)self->_currentSession removeInput:*(void *)(*((void *)&v20 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(AVCaptureSession *)self->_currentSession outputs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [(AVCaptureSession *)self->_currentSession removeOutput:*(void *)(*((void *)&v16 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  currentSession = self->_currentSession;
  self->_currentSession = 0;

  videoRotationCoordinator = self->_videoRotationCoordinator;
  self->_videoRotationCoordinator = 0;

  unint64_t v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 removeObserver:self name:*MEMORY[0x263EF9618] object:0];
}

- (void)_startSessionConnectingPreviewLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "start capturing", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke;
  v7[3] = &unk_26524BE90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BCSRootViewController *)self executeBlockSynchronouslyWithLockedCameraDevice:v7];
}

void __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 984);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFA638]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 984);
    *(void *)(v4 + 984) = v3;

    [*(id *)(a1 + 40) setSession:*(void *)(*(void *)(a1 + 32) + 984)];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 984);
  }
  [v2 beginConfiguration];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 984) inputs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*(void *)(a1 + 32) + 984) removeInput:*(void *)(*((void *)&v45 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v8);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 984) outputs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*(void *)(a1 + 32) + 984) removeOutput:*(void *)(*((void *)&v41 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v13);
  }

  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 976);
  id v40 = 0;
  long long v17 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v16 error:&v40];
  id v18 = v40;
  long long v19 = *(void **)(*(void *)(a1 + 32) + 984);
  if (v18
    || (v20 = [v19 canAddInput:v17], long long v19 = *(void **)(*(void *)(a1 + 32) + 984), (v20 & 1) == 0))
  {
    [v19 commitConfiguration];
    [*(id *)(a1 + 32) endSession];
  }
  else
  {
    [v19 addInput:v17];
    id v21 = objc_alloc_init(MEMORY[0x263EFA6A0]);
    uint64_t v49 = *MEMORY[0x263F04180];
    v50 = &unk_26FCC64B0;
    long long v22 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [v21 setVideoSettings:v22];

    [v21 setSampleBufferDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 1000)];
    char v23 = [*(id *)(*(void *)(a1 + 32) + 984) canAddOutput:v21];
    uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 984);
    if (v23)
    {
      [v24 addOutput:v21];
      id v25 = [v21 connectionWithMediaType:*MEMORY[0x263EF9D48]];
      if ([v25 isCameraIntrinsicMatrixDeliverySupported])
      {
        [v25 setCameraIntrinsicMatrixDeliveryEnabled:1];
      }
      else
      {
        uint64_t v26 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_248ACF000, v26, OS_LOG_TYPE_INFO, "Camera intrinsic matrix delivery not supported", buf, 2u);
        }
      }
      if ([*(id *)(*(void *)(a1 + 32) + 976) isExposureModeSupported:2]) {
        [*(id *)(*(void *)(a1 + 32) + 976) setExposureMode:2];
      }
      if ([*(id *)(*(void *)(a1 + 32) + 976) isWhiteBalanceModeSupported:2]) {
        [*(id *)(*(void *)(a1 + 32) + 976) setWhiteBalanceMode:2];
      }
      [*(id *)(*(void *)(a1 + 32) + 976) setVideoZoomFactor:1.0];
      if ([*(id *)(*(void *)(a1 + 32) + 984) supportsControls])
      {
        [*(id *)(*(void *)(a1 + 32) + 984) setControlsDelegate:*(void *)(*(void *)(a1 + 32) + 1008) queue:*(void *)(*(void *)(a1 + 32) + 1000)];
        v27 = (void *)[objc_alloc(MEMORY[0x263EFA698]) initWithDevice:*(void *)(*(void *)(a1 + 32) + 976)];
        if ([*(id *)(*(void *)(a1 + 32) + 984) canAddControl:v27]) {
          [*(id *)(*(void *)(a1 + 32) + 984) addControl:v27];
        }
      }
      uint64_t v28 = *MEMORY[0x263EF9748];
      if ([*(id *)(*(void *)(a1 + 32) + 984) canSetSessionPreset:*MEMORY[0x263EF9748]])uint64_t v29 = v28; {
      else
      }
        uint64_t v29 = *MEMORY[0x263EF9758];
      [*(id *)(*(void *)(a1 + 32) + 984) setSessionPreset:v29];
      if (shouldUseSystemPreferredCamera())
      {
        int v30 = [*(id *)(*(void *)(a1 + 32) + 992) connection];
        [v30 setVideoRotationAngle:0.0];

        v31 = [*(id *)(*(void *)(a1 + 32) + 992) connection];
        int v32 = [v31 isVideoMirroringSupported];

        if (v32)
        {
          long long v33 = [*(id *)(*(void *)(a1 + 32) + 992) connection];
          [v33 setAutomaticallyAdjustsVideoMirroring:0];

          long long v34 = [*(id *)(*(void *)(a1 + 32) + 992) connection];
          [v34 setVideoMirrored:0];
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 984) commitConfiguration];
      [*(id *)(*(void *)(a1 + 32) + 984) startRunning];
      [*(id *)(*(void *)(a1 + 32) + 1080) videoRotationAngleForHorizonLevelPreview];
      *(double *)(*(void *)(a1 + 32) + 1096) = v35 * 3.14159265 / 180.0;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke_40;
      block[3] = &unk_26524BD30;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
      [*(id *)(*(void *)(a1 + 32) + 1064) startSession];
      v36 = [MEMORY[0x263F08A00] defaultCenter];
      [v36 addObserver:*(void *)(a1 + 32) selector:sel_subjectAreaDidChange_ name:*MEMORY[0x263EF9618] object:*(void *)(*(void *)(a1 + 32) + 976)];

      v37 = [MEMORY[0x263F08A00] defaultCenter];
      [v37 addObserver:*(void *)(a1 + 32) selector:sel_didLaunchFromControl_ name:*MEMORY[0x263F29B68] object:0];
    }
    else
    {
      [v24 commitConfiguration];
      [*(id *)(a1 + 32) endSession];
    }
  }
}

uint64_t __61__BCSRootViewController__startSessionConnectingPreviewLayer___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVideoRotationAngle];
}

- (void)subjectAreaDidChange:(id)a3
{
}

- (void)didLaunchFromControl:(id)a3
{
}

- (void)_executeBlockWithLockedCameraDevice:(id)a3
{
  cameraDevice = self->_cameraDevice;
  id v7 = 0;
  uint64_t v5 = (void (**)(id, BOOL))a3;
  [(AVCaptureDevice *)cameraDevice lockForConfiguration:&v7];
  id v6 = v7;
  v5[2](v5, v6 == 0);

  [(AVCaptureDevice *)self->_cameraDevice unlockForConfiguration];
}

- (void)executeBlockAsynchronouslyWithLockedCameraDevice:(id)a3
{
  id v4 = a3;
  captureQueue = self->_captureQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__BCSRootViewController_executeBlockAsynchronouslyWithLockedCameraDevice___block_invoke;
  v7[3] = &unk_26524C020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureQueue, v7);
}

uint64_t __74__BCSRootViewController_executeBlockAsynchronouslyWithLockedCameraDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeBlockWithLockedCameraDevice:*(void *)(a1 + 40)];
}

- (void)executeBlockSynchronouslyWithLockedCameraDevice:(id)a3
{
  captureQueue = self->_captureQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(captureQueue);
  [(BCSRootViewController *)self _executeBlockWithLockedCameraDevice:v5];
}

- (void)createSessionIfNeededConnectingPreviewLayer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__BCSRootViewController_createSessionIfNeededConnectingPreviewLayer_completion___block_invoke;
  block[3] = &unk_26524C048;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(captureQueue, block);
}

uint64_t __80__BCSRootViewController_createSessionIfNeededConnectingPreviewLayer_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  if (v2[123])
  {
    if (v3)
    {
      id v4 = [(id)a1[5] session];
      id v5 = *(void **)(a1[4] + 984);

      if (v4 != v5) {
        [(id)a1[5] setSession:*(void *)(a1[4] + 984)];
      }
    }
  }
  else
  {
    [v2 _startSessionConnectingPreviewLayer:v3];
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)setLiveZoomFactor:(double)a3
{
  captureQueue = self->_captureQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__BCSRootViewController_setLiveZoomFactor___block_invoke;
  v4[3] = &unk_26524C098;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(captureQueue, v4);
}

uint64_t __43__BCSRootViewController_setLiveZoomFactor___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) isRunning];
  if (result)
  {
    double v3 = *(double *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 976) videoZoomFactor];
    double v5 = v3 * v4;
    id v6 = [*(id *)(*(void *)(a1 + 32) + 976) activeFormat];
    [v6 videoMaxZoomFactor];
    double v8 = v7;

    if (v5 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v5;
    }
    id v10 = *(void **)(a1 + 32);
    v11[1] = 3221225472;
    v11[0] = MEMORY[0x263EF8330];
    v11[2] = __43__BCSRootViewController_setLiveZoomFactor___block_invoke_2;
    v11[3] = &unk_26524C070;
    void v11[4] = v10;
    v11[5] = fmax(v9, 1.0);
    return [v10 executeBlockSynchronouslyWithLockedCameraDevice:v11];
  }
  return result;
}

uint64_t __43__BCSRootViewController_setLiveZoomFactor___block_invoke_2(uint64_t result, int a2, double a3, double a4)
{
  if (a2)
  {
    LODWORD(a4) = 1157234688;
    return [*(id *)(*(void *)(result + 32) + 976) rampToVideoZoomFactor:*(double *)(result + 40) withRate:a4];
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)BCSRootViewController;
  id v7 = a4;
  -[BCSRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(BCSLiveViewController *)self->_liveViewController rotationAnimationWillStart];
  v8[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_26524C0C0;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_26524C0C0;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  int v2 = shouldUseSystemPreferredCamera();
  double v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _updateVideoRotationAngle];
  }
  else
  {
    double v4 = (void *)v3[126];
    id v9 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v5 = [v9 statusBarOrientation];
    id v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 _referenceBounds];
    objc_msgSend(v4, "compensateForInterfaceOrientationInLiveView:referenceSize:", v5, v7, v8);
  }
}

uint64_t __76__BCSRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) rotationAnimationDidFinish];
}

- (void)_startSession
{
  double v3 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "restart capturing", buf, 2u);
  }
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BCSRootViewController__startSession__block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(captureQueue, block);
}

void __38__BCSRootViewController__startSession__block_invoke(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 1024) = CFAbsoluteTimeGetCurrent();
  [*(id *)(*(void *)(a1 + 32) + 984) startRunning];
  [*(id *)(*(void *)(a1 + 32) + 1064) startSession];
  int v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl(&dword_248ACF000, v2, OS_LOG_TYPE_INFO, "liveViewControllerDidResetCapture - startRunning.", v3, 2u);
  }
}

- (void)_pauseSessionIfNeeded
{
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BCSRootViewController__pauseSessionIfNeeded__block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(captureQueue, block);
}

void __46__BCSRootViewController__pauseSessionIfNeeded__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 984) isRunning])
  {
    [*(id *)(*(void *)(a1 + 32) + 984) stopRunning];
    [*(id *)(*(void *)(a1 + 32) + 1064) endSession];
    int v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v3 = 0;
      _os_log_impl(&dword_248ACF000, v2, OS_LOG_TYPE_INFO, "_pauseSessionIfNeeded - stopRunning.", v3, 2u);
    }
  }
}

- (void)_resetSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  objc_super v10 = __60__BCSRootViewController__resetSessionWithCompletionHandler___block_invoke;
  uint64_t v11 = &unk_26524C020;
  id v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void (**)(void))_Block_copy(&v8);
  double v7 = [(BCSRootViewController *)self presentedViewController];

  if (v7) {
    [(BCSRootViewController *)self dismissViewControllerAnimated:0 completion:v6];
  }
  else {
    v6[2](v6);
  }
}

void __60__BCSRootViewController__resetSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263EF8330];
  uint64_t v4 = 3221225472;
  id v5 = __60__BCSRootViewController__resetSessionWithCompletionHandler___block_invoke_2;
  id v6 = &unk_26524C020;
  int v2 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v2;
  dispatch_async(MEMORY[0x263EF83A0], &v3);
  objc_msgSend(*(id *)(a1 + 32), "createSessionIfNeededConnectingPreviewLayer:completion:", *(void *)(*(void *)(a1 + 32) + 992), 0, v3, v4, v5, v6, v7);
}

uint64_t __60__BCSRootViewController__resetSessionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) resetUIAndStartCapturing:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_restartSessionIfNeeded
{
  previewLayer = self->_previewLayer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__BCSRootViewController__restartSessionIfNeeded__block_invoke;
  v3[3] = &unk_26524C0E8;
  v3[4] = self;
  [(BCSRootViewController *)self createSessionIfNeededConnectingPreviewLayer:previewLayer completion:v3];
}

void __48__BCSRootViewController__restartSessionIfNeeded__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 984) isRunning])
  {
    int v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248ACF000, v2, OS_LOG_TYPE_INFO, "_restartSessionIfNeeded - isRunning.", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__BCSRootViewController__restartSessionIfNeeded__block_invoke_50;
    block[3] = &unk_26524BD30;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __48__BCSRootViewController__restartSessionIfNeeded__block_invoke_50(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) resetUIAndStartCapturing:1];
}

- (void)_clearResumeCapturingTimer
{
  [(NSTimer *)self->_resumeCapturingTimer invalidate];
  resumeCapturingTimer = self->_resumeCapturingTimer;
  self->_resumeCapturingTimer = 0;
}

- (void)suspendCapturing
{
  id v4 = [(BCSLiveViewController *)self->_liveViewController actionCoordinator];
  if ([v4 deviceIsBeingUnlocked])
  {
  }
  else
  {
    BOOL deviceIsBeingUnlocked = self->_deviceIsBeingUnlocked;

    if (!deviceIsBeingUnlocked)
    {
      [(BCSRootViewController *)self _clearResumeCapturingTimer];
      [(BCSRootViewController *)self _pauseSessionIfNeeded];
    }
  }
}

- (void)resumeCapturing
{
  uint64_t v3 = [(BCSLiveViewController *)self->_liveViewController actionCoordinator];
  if ([v3 deviceIsBeingUnlocked])
  {

LABEL_4:
    self->_BOOL deviceIsBeingUnlocked = 0;
    return;
  }
  BOOL deviceIsBeingUnlocked = self->_deviceIsBeingUnlocked;

  if (deviceIsBeingUnlocked) {
    goto LABEL_4;
  }
  [(BCSRootViewController *)self _clearResumeCapturingTimer];
  if (self->_applicationWasInBackground)
  {
    self->_applicationWasInBackground = 0;
  }
  else
  {
    id v5 = [(BCSRootViewController *)self presentedViewController];

    if (v5)
    {
      id v6 = [(BCSRootViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        [(BCSRootViewController *)self _startSession];
      }
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __40__BCSRootViewController_resumeCapturing__block_invoke;
      v10[3] = &unk_26524C110;
      v10[4] = self;
      id v8 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v10 block:0.1];
      resumeCapturingTimer = self->_resumeCapturingTimer;
      self->_resumeCapturingTimer = v8;
    }
  }
}

uint64_t __40__BCSRootViewController_resumeCapturing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartSessionIfNeeded];
}

- (void)applicationWillEnterForeground
{
  id v4 = [(BCSLiveViewController *)self->_liveViewController actionCoordinator];
  if ([v4 deviceIsBeingUnlocked])
  {
  }
  else
  {
    BOOL deviceIsBeingUnlocked = self->_deviceIsBeingUnlocked;

    if (!deviceIsBeingUnlocked && self->_applicationWasInBackground)
    {
      [(BCSRootViewController *)self _restartSessionIfNeeded];
    }
  }
}

- (void)applicationDidEnterBackground
{
  id v10 = [(BCSLiveViewController *)self->_liveViewController actionCoordinator];
  if ([v10 deviceIsBeingUnlocked])
  {
  }
  else
  {
    BOOL deviceIsBeingUnlocked = self->_deviceIsBeingUnlocked;

    if (!deviceIsBeingUnlocked)
    {
      id v4 = [(BCSRootViewController *)self presentedViewController];

      if (!v4)
      {
        [(BCSRootViewController *)self _clearResumeCapturingTimer];
        [(BCSLiveViewController *)self->_liveViewController resetUIAndStartCapturing:0];
        id v5 = [MEMORY[0x263F82438] sharedApplication];
        uint64_t v17 = 0;
        id v18 = &v17;
        uint64_t v19 = 0x2020000000;
        uint64_t v20 = 0;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __54__BCSRootViewController_applicationDidEnterBackground__block_invoke;
        v14[3] = &unk_26524C138;
        id v6 = v5;
        id v15 = v6;
        uint64_t v16 = &v17;
        uint64_t v7 = [v6 beginBackgroundTaskWithName:@"com.apple.BarcodeScanner.BackgroundTask" expirationHandler:v14];
        v18[3] = v7;
        captureQueue = self->_captureQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __54__BCSRootViewController_applicationDidEnterBackground__block_invoke_2;
        block[3] = &unk_26524C160;
        void block[4] = self;
        id v12 = v6;
        id v13 = &v17;
        id v9 = v6;
        dispatch_async(captureQueue, block);
        self->_applicationWasInBackground = 1;

        _Block_object_dispose(&v17, 8);
      }
    }
  }
}

uint64_t __54__BCSRootViewController_applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __54__BCSRootViewController_applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 984) isRunning])
  {
    [*(id *)(*(void *)(a1 + 32) + 984) stopRunning];
    int v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_248ACF000, v2, OS_LOG_TYPE_INFO, "applicationDidEnterBackground - stopRunning.", v4, 2u);
    }
  }
  return [*(id *)(a1 + 40) endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (void)continueUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"detectedCode"];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v17 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v17];
    id v8 = v17;
    if (v8)
    {
      id v9 = v8;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSRootViewController continueUserActivity:].cold.4(v9);
      }
    }
    else
    {
      id v10 = [v4 userInfo];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"detectedImage"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = 0;
        id v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v16];
        id v9 = v16;
        if (v9)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[BCSRootViewController continueUserActivity:](v9);
          }
        }
        else
        {
          [(BCSRootViewController *)self _clearResumeCapturingTimer];
          +[BCSSecureCaptureSession beginDelayingAppearance];
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __46__BCSRootViewController_continueUserActivity___block_invoke;
          v13[3] = &unk_26524BF80;
          v13[4] = self;
          id v14 = v7;
          id v15 = v12;
          [(BCSRootViewController *)self _resetSessionWithCompletionHandler:v13];
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BCSRootViewController continueUserActivity:]();
        }
        id v9 = 0;
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[BCSRootViewController continueUserActivity:]();
  }
}

uint64_t __46__BCSRootViewController_continueUserActivity___block_invoke(void *a1)
{
  *(unsigned char *)(a1[4] + 1016) = 1;
  *(unsigned char *)(a1[4] + 1050) = 1;
  [*(id *)(a1[4] + 1008) didCaptureVisualCode:a1[5] image:a1[6] shouldAnimate:0];

  return +[BCSSecureCaptureSession endDelayingAppearance];
}

- (unsigned)_desiredImageOrientation
{
  if (shouldUseSystemPreferredCamera())
  {
    uint64_t v3 = [(AVCaptureDevice *)self->_cameraDevice deviceType];
    id v4 = (void *)*MEMORY[0x263EF9688];

    if (v3 == v4) {
      return 1;
    }
  }
  unint64_t v5 = self->_statusBarOrientation - 2;
  if (v5 > 2) {
    return 6;
  }
  else {
    return dword_248AEDB30[v5];
  }
}

- (void)focusWithMode:(int64_t)a3 exposeWithMode:(int64_t)a4 atDevicePoint:(CGPoint)a5 monitorSubjectAreaChange:(BOOL)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __93__BCSRootViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke;
  v6[3] = &unk_26524C188;
  v6[4] = self;
  v6[5] = a3;
  CGPoint v7 = a5;
  int64_t v8 = a4;
  BOOL v9 = a6;
  [(BCSRootViewController *)self executeBlockAsynchronouslyWithLockedCameraDevice:v6];
}

uint64_t __93__BCSRootViewController_focusWithMode_exposeWithMode_atDevicePoint_monitorSubjectAreaChange___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if ([*(id *)(*(void *)(result + 32) + 976) isFocusPointOfInterestSupported]
      && [*(id *)(*(void *)(v2 + 32) + 976) isFocusModeSupported:*(void *)(v2 + 40)])
    {
      objc_msgSend(*(id *)(*(void *)(v2 + 32) + 976), "setFocusPointOfInterest:", *(double *)(v2 + 48), *(double *)(v2 + 56));
      [*(id *)(*(void *)(v2 + 32) + 976) setFocusMode:*(void *)(v2 + 40)];
    }
    if ([*(id *)(*(void *)(v2 + 32) + 976) isExposurePointOfInterestSupported]
      && [*(id *)(*(void *)(v2 + 32) + 976) isExposureModeSupported:*(void *)(v2 + 64)])
    {
      objc_msgSend(*(id *)(*(void *)(v2 + 32) + 976), "setExposurePointOfInterest:", *(double *)(v2 + 48), *(double *)(v2 + 56));
      [*(id *)(*(void *)(v2 + 32) + 976) setExposureMode:*(void *)(v2 + 64)];
    }
    uint64_t v3 = *(unsigned __int8 *)(v2 + 72);
    id v4 = *(void **)(*(void *)(v2 + 32) + 976);
    return [v4 setSubjectAreaChangeMonitoringEnabled:v3];
  }
  return result;
}

- (BOOL)_isCapturingSteady
{
  if ([(AVCaptureDevice *)self->_cameraDevice isAdjustingExposure]) {
    return 0;
  }
  else {
    return ![(AVCaptureDevice *)self->_cameraDevice isAdjustingFocus];
  }
}

- (id)_bestCandidateVisualCode:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    unint64_t v5 = [v4 firstObject];
    int64_t v6 = 1;
  }
  else if ([v4 count] == 2)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__BCSRootViewController__bestCandidateVisualCode___block_invoke;
    v9[3] = &unk_26524C1B0;
    v9[4] = v14;
    void v9[5] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];
    unint64_t v5 = [v4 objectAtIndex:v11[3]];
    [v5 boundingBox];
    if (CGRectGetWidth(v16) >= 0.05)
    {
      int64_t v6 = 1;
    }
    else
    {

      unint64_t v5 = 0;
      int64_t v6 = 2;
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    unint64_t v5 = 0;
    int64_t v6 = 2 * ((unint64_t)[v4 count] > 2);
  }
  if (self->_lastAvailability != v6)
  {
    self->_lastAvailability = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__BCSRootViewController__bestCandidateVisualCode___block_invoke_2;
    v8[3] = &unk_26524C098;
    v8[4] = self;
    void v8[5] = v6;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }

  return v5;
}

uint64_t __50__BCSRootViewController__bestCandidateVisualCode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 boundingBox];
  uint64_t result = _bcs_pointToRectDistance();
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 < *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

uint64_t __50__BCSRootViewController__bestCandidateVisualCode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) updateQRCodeAvailability:*(void *)(a1 + 40)];
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!self->_hasCapturedCode
    && (self->_shouldScanFaster || [(BCSRootViewController *)self _isCapturingSteady])
    && CMSampleBufferGetNumSamples(a4) == 1
    && CMSampleBufferIsValid(a4)
    && CMSampleBufferDataIsReady(a4))
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    codeDetector = self->_codeDetector;
    char v15 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    v11[3] = &unk_26524C1D8;
    void v11[4] = self;
    v11[5] = &v12;
    void v11[6] = a4;
    [(BCSVisualCodeDetector *)codeDetector detectCodeFromBuffer:a4 completion:v11];
    if (*((unsigned char *)v13 + 24)) {
      [(BCSVisualCodeDetector *)self->_codeDetector resetCache];
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _bestCandidateVisualCode:a2];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 1016) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 1048) = 0;
    unint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_imageFromLastVideoSample:rect:", v4, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2;
    block[3] = &unk_26524BF80;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __76__BCSRootViewController_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 1008) didCaptureVisualCode:a1[5] image:a1[6] shouldAnimate:1];
}

- (void)liveViewControllerWillPerformAction:(id)a3
{
  uint64_t v4 = BCS_LOG_CHANNEL_PREFIXBarcodeScanner();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248ACF000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "scanningToAction", "end capturing enableTelemetry=YES ", buf, 2u);
  }
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__BCSRootViewController_liveViewControllerWillPerformAction___block_invoke;
  block[3] = &unk_26524BD30;
  void block[4] = self;
  dispatch_async(captureQueue, block);
}

void __61__BCSRootViewController_liveViewControllerWillPerformAction___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) stopRunning];
  [*(id *)(*(void *)(a1 + 32) + 1064) endSession];
  uint64_t v2 = BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_248ACF000, v2, OS_LOG_TYPE_INFO, "liveViewControllerWillPerformAction - stopRunning.", v3, 2u);
  }
}

- (void)liveViewControllerDidResetCapture:(id)a3
{
  self->_hasCapturedCode = 0;
  self->_shouldScanFaster = 0;
  self->_lastAvailability = 0;
  [(BCSRootViewController *)self _startSession];
}

- (BOOL)liveViewControllerTorchModeSupported:(id)a3
{
  BOOL v4 = [(AVCaptureDevice *)self->_cameraDevice hasTorch];
  if (v4)
  {
    cameraDevice = self->_cameraDevice;
    LOBYTE(v4) = [(AVCaptureDevice *)cameraDevice isTorchModeSupported:1];
  }
  return v4;
}

- (void)liveViewController:(id)a3 torchModeChangedTo:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke;
  v4[3] = &unk_26524C200;
  BOOL v5 = a4;
  v4[4] = self;
  [(BCSRootViewController *)self _executeBlockWithLockedCameraDevice:v4];
}

void __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 976);
    if (v3)
    {
      id v7 = 0;
      LODWORD(a3) = 1.0;
      [v4 setTorchModeOnWithLevel:&v7 error:a3];
      id v5 = v7;
      if (v5)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke_cold_1(v5);
        }
      }
    }
    else
    {
      [v4 setTorchMode:0];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSRootViewController: unable to gain exclusive ownership of the device to adjust the torch", v6, 2u);
  }
}

- (id)_imageFromLastVideoSample:(opaqueCMSampleBuffer *)a3 rect:(CGRect)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    id v6 = (void *)MEMORY[0x263F00650];
    uint64_t v7 = *MEMORY[0x263F008D8];
    v17[0] = MEMORY[0x263EFFA88];
    uint64_t v8 = *MEMORY[0x263F00908];
    v16[0] = v7;
    v16[1] = v8;
    uint64_t v14 = *MEMORY[0x263F0F4C8];
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BCSRootViewController _desiredImageOrientation](self, "_desiredImageOrientation"));
    char v15 = v9;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[1] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v12 = [v6 imageWithCVPixelBuffer:ImageBuffer options:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)liveViewController:(id)a3 didTapAtDevicePoint:(CGPoint)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoRotationCoordinator, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_codeDetector, 0);
  objc_storeStrong((id *)&self->_resumeCapturingTimer, 0);
  objc_storeStrong((id *)&self->_liveViewController, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);

  objc_storeStrong((id *)&self->_cameraDevice, 0);
}

- (void)continueUserActivity:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSRootViewController: UserActivity doesn't contain detectedCode", v0, 2u);
}

- (void)continueUserActivity:(void *)a1 .cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSRootViewController: could not decode detectedImage from UserActivity: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)continueUserActivity:.cold.3()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_248ACF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSRootViewController: UserActivity doesn't contain detectedImage", v0, 2u);
}

- (void)continueUserActivity:(void *)a1 .cold.4(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSRootViewController: could not decode detectedCode from UserActivity: %{public}@", v3, v4, v5, v6, 2u);
}

void __63__BCSRootViewController_liveViewController_torchModeChangedTo___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  OUTLINED_FUNCTION_0(&dword_248ACF000, &_os_log_internal, v2, "BCSRootViewController: failed to set torch mode on %{public}@", v3, v4, v5, v6, 2u);
}

@end