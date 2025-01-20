@interface BKUIPearlVideoCaptureSession
- (AVCaptureVideoPreviewLayer)previewLayer;
- (BKUIPearlVideoCaptureSession)init;
- (BKUIVideoCaptureSesssionDelegate)delegate;
- (BOOL)_synchronizedCaptureSessionInterrupted;
- (double)additionalPreviewScalingAllowedByCameraFormat;
- (id)_frontCamera;
- (void)_captureSessionInterrupted:(id)a3;
- (void)_captureSessionStarted:(id)a3;
- (void)_captureSessionStopped:(id)a3;
- (void)_setupCaptureStack;
- (void)_stopSessionAndTearDown;
- (void)dealloc;
- (void)endCapture;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setPreviewLayer:(id)a3;
- (void)startCapture;
- (void)supportMultitaskingCameraAccess;
@end

@implementation BKUIPearlVideoCaptureSession

- (BKUIPearlVideoCaptureSession)init
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlVideoCaptureSession;
  v3 = [(BKUIPearlVideoCaptureSession *)&v8 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.biometrickitui.pearlVideoCaptureSessionQueue", v4);
    captureQueue = v3->_captureQueue;
    v3->_captureQueue = (OS_dispatch_queue *)v5;

    v3->_additionalPreviewScalingAllowedByCameraFormat = 1.0;
    [(BKUIPearlVideoCaptureSession *)v3 _setupCaptureStack];
  }
  return v3;
}

- (void)dealloc
{
  [(BKUIPearlVideoCaptureSession *)self _stopSessionAndTearDown];
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlVideoCaptureSession;
  [(BKUIPearlVideoCaptureSession *)&v3 dealloc];
}

- (id)_frontCamera
{
  v8[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_captureQueue);
  v2 = (void *)MEMORY[0x1E4F16448];
  v8[0] = *MEMORY[0x1E4F15830];
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v4 = [v2 discoverySessionWithDeviceTypes:v3 mediaType:*MEMORY[0x1E4F15C18] position:2];

  dispatch_queue_t v5 = [v4 devices];
  v6 = [v5 firstObject];

  return v6;
}

- (void)endCapture
{
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__BKUIPearlVideoCaptureSession_endCapture__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __42__BKUIPearlVideoCaptureSession_endCapture__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSessionAndTearDown];
}

- (void)startCapture
{
  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BKUIPearlVideoCaptureSession_startCapture__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(captureQueue, block);
}

uint64_t __44__BKUIPearlVideoCaptureSession_startCapture__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) isRunning];
  if ((result & 1) == 0)
  {
    objc_super v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "+++++++++ BKUIPearl: Starting Capture Session", v4, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"running" options:1 context:@"PSCaptureSessionActiveContext"];
    return [*(id *)(*(void *)(a1 + 32) + 8) startRunning];
  }
  return result;
}

- (void)_stopSessionAndTearDown
{
  if (self->_captureSession)
  {
    objc_super v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "--------- BKUIPearl: Stopping Capture Session", v9, 2u);
    }

    captureSession = self->_captureSession;
    dispatch_queue_t v5 = self->_deviceInput;
    v6 = captureSession;
    [(AVCaptureSession *)v6 removeInput:v5];
    [(AVCaptureSession *)v6 stopRunning];
    [(AVCaptureSession *)self->_captureSession removeObserver:self forKeyPath:@"running" context:@"PSCaptureSessionActiveContext"];
    v7 = self->_captureSession;
    self->_captureSession = 0;

    deviceInput = self->_deviceInput;
    self->_deviceInput = 0;
  }
}

- (void)_setupCaptureStack
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_super v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack", buf, 2u);
  }

  v4 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E4F16498]);
  captureSession = self->_captureSession;
  self->_captureSession = v4;

  [(BKUIPearlVideoCaptureSession *)self supportMultitaskingCameraAccess];
  v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "_setupCaptureStack: PreviewLayer will be setup", buf, 2u);
  }

  v7 = (AVCaptureVideoPreviewLayer *)[objc_alloc(MEMORY[0x1E4F164C8]) initWithSession:self->_captureSession];
  previewLayer = self->_previewLayer;
  self->_previewLayer = v7;

  v9 = [(BKUIPearlVideoCaptureSession *)self previewLayer];
  [v9 setVideoGravity:*MEMORY[0x1E4F15AF8]];

  v10 = [(BKUIPearlVideoCaptureSession *)self previewLayer];
  [v10 setOpacity:0.0];

  v11 = _BKUILoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "_setupCaptureStack: PreviewLayer did setup", buf, 2u);
  }

  captureQueue = self->_captureQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(captureQueue, block);
  v13 = _BKUILoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack finished sync work", buf, 2u);
  }
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setup Capture Stack async work", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) beginConfiguration];
  uint64_t v3 = *MEMORY[0x1E4F159B0];
  if (![*(id *)(*(void *)(a1 + 32) + 8) canSetSessionPreset:*MEMORY[0x1E4F159B0]])
  {
    v12 = _BKUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_4(v12);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    v4 = *(void **)(v13 + 8);
    *(void *)(v13 + 8) = 0;
    goto LABEL_72;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setSessionPreset:v3];
  v4 = [*(id *)(a1 + 32) _frontCamera];
  if (!v4)
  {
    v14 = _BKUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_1(v14);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    id v6 = *(id *)(v15 + 8);
    *(void *)(v15 + 8) = 0;
    goto LABEL_71;
  }
  id v48 = 0;
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F16450]) initWithDevice:v4 error:&v48];
  id v6 = v48;
  uint64_t v7 = *(void *)(a1 + 32);
  objc_super v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;

  if (v6)
  {
    v9 = _BKUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_3((uint64_t)v6, v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = 0;

    goto LABEL_71;
  }
  [*(id *)(*(void *)(a1 + 32) + 8) addInput:*(void *)(*(void *)(a1 + 32) + 16)];
  v16 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_70;
  }
  int v18 = 0;
  uint64_t v19 = MGGetProductType();
  uint64_t v20 = v19;
  if (v19 <= 2619317133)
  {
    if (v19 != 555503454)
    {
      uint64_t v21 = 2487868872;
      goto LABEL_21;
    }
LABEL_22:
    v22 = [*(id *)(a1 + 32) previewLayer];
    v23 = [v22 connection];

    if ([v23 isVideoOrientationSupported])
    {
      [v23 setVideoOrientation:3];
      v24 = _BKUILoggingFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v51 = v20;
        _os_log_impl(&dword_1E4B6C000, v24, OS_LOG_TYPE_DEFAULT, "Capture orientation: Set to LandscapeRight for model: %ld", buf, 0xCu);
      }
    }
    else
    {
      v24 = _BKUILoggingFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_2(v20, v24);
      }
    }

    int v18 = 1;
    goto LABEL_28;
  }
  if (v19 == 3241053352) {
    goto LABEL_22;
  }
  uint64_t v21 = 2619317134;
LABEL_21:
  if (v19 == v21) {
    goto LABEL_22;
  }
LABEL_28:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = [v4 formats];
  id v26 = (id)[v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v26) {
    goto LABEL_65;
  }
  int v41 = v18;
  v42 = v4;
  uint64_t v27 = *(void *)v45;
LABEL_30:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v45 != v27) {
      objc_enumerationMutation(v25);
    }
    v29 = *(void **)(*((void *)&v44 + 1) + 8 * v28);
    v30 = (const opaqueCMFormatDescription *)[v29 formatDescription];
    if (MGGetProductType() == 2023824667
      || MGGetProductType() == 3101941570
      || MGGetProductType() == 1868379043
      || MGGetProductType() == 1373516433
      || MGGetProductType() == 746003606
      || MGGetProductType() == 1834147427
      || MGGetProductType() == 3054476161
      || MGGetProductType() == 2628394914
      || MGGetProductType() == 3228373941
      || MGGetProductType() == 1625227434
      || MGGetProductType() == 3361025853
      || ((MGGetProductType() != 2089455188) & ~v41) == 0)
    {
      if (CMFormatDescriptionGetMediaType(v30) != 1986618469 || ![v29 isVideoBinned]) {
        goto LABEL_49;
      }
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v30);
      uint64_t v32 = 0x2D000000500;
    }
    else
    {
      if (CMFormatDescriptionGetMediaType(v30) != 1986618469 || CMFormatDescriptionGetMediaSubType(v30) != 875704438) {
        goto LABEL_49;
      }
      CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v30);
      uint64_t v32 = 0x438000005A0;
    }
    if (Dimensions == v32) {
      break;
    }
LABEL_49:
    if (v26 == (id)++v28)
    {
      uint64_t v33 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
      id v26 = (id)v33;
      if (!v33)
      {
        v4 = v42;
        goto LABEL_65;
      }
      goto LABEL_30;
    }
  }
  id v26 = v29;

  if (v26)
  {
    v34 = _BKUILoggingFacility();
    v4 = v42;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = (uint64_t)v26;
      _os_log_impl(&dword_1E4B6C000, v34, OS_LOG_TYPE_DEFAULT, "will switch active camera format to %@", buf, 0xCu);
    }

    id v43 = 0;
    int v35 = [v42 lockForConfiguration:&v43];
    id v25 = v43;
    if (v35)
    {
      [v42 setActiveFormat:v26];
      [v42 unlockForConfiguration];
      *(void *)(*(void *)(a1 + 32) + 64) = 0x3FF5555555555555;
    }
    if (v25)
    {
      v36 = _BKUILoggingFacility();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = (uint64_t)v25;
        _os_log_impl(&dword_1E4B6C000, v36, OS_LOG_TYPE_DEFAULT, "lockForConfiguration error %@", buf, 0xCu);
      }
    }
LABEL_65:
  }
  else
  {
    v4 = v42;
  }
  v37 = _BKUILoggingFacility();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [v4 activeFormat];
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = (uint64_t)v38;
    _os_log_impl(&dword_1E4B6C000, v37, OS_LOG_TYPE_DEFAULT, "active camera format %@", buf, 0xCu);
  }
LABEL_70:
  [*(id *)(*(void *)(a1 + 32) + 8) commitConfiguration];
  v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v39 addObserver:*(void *)(a1 + 32) selector:sel__captureSessionStarted_ name:*MEMORY[0x1E4F15988] object:0];

  v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v40 addObserver:*(void *)(a1 + 32) selector:sel__captureSessionStopped_ name:*MEMORY[0x1E4F15990] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__captureSessionInterrupted_ name:*MEMORY[0x1E4F159D0] object:0];
LABEL_71:

LABEL_72:
}

- (void)supportMultitaskingCameraAccess
{
  if ([(AVCaptureSession *)self->_captureSession isMultitaskingCameraAccessSupported])
  {
    [(AVCaptureSession *)self->_captureSession setMultitaskingCameraAccessEnabled:1];
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      v4 = "_setupCaptureStack: Supporting Multitasking Camera Access";
      uint64_t v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else
  {
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v6 = 0;
      v4 = "_setupCaptureStack: Not supporting Multitasking Camera Access";
      uint64_t v5 = (uint8_t *)&v6;
      goto LABEL_6;
    }
  }
}

- (void)_captureSessionStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int16 v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Capture session started", v7, 2u);
  }

  v5->_captureSessionInterrupted = 0;
  objc_sync_exit(v5);
}

- (void)_captureSessionStopped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int16 v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Capture session stopped", v7, 2u);
  }

  v5->_captureSessionInterrupted = 0;
  objc_sync_exit(v5);
}

- (void)_captureSessionInterrupted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  __int16 v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Capture session interrupted", v7, 2u);
  }

  v5->_captureSessionInterrupted = 1;
  objc_sync_exit(v5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"PSCaptureSessionActiveContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"running", a4, a5))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_super v8 = WeakRetained;
      if (WeakRetained)
      {
        if ([WeakRetained expectsRunningVideoCaptureSession:self])
        {
          if (![(AVCaptureSession *)self->_captureSession isRunning]
            && ![(BKUIPearlVideoCaptureSession *)self _synchronizedCaptureSessionInterrupted])
          {
            unint64_t captureSessionRestarts = self->_captureSessionRestarts;
            if (captureSessionRestarts <= 4)
            {
              self->_unint64_t captureSessionRestarts = captureSessionRestarts + 1;
              uint64_t v10 = _BKUILoggingFacility();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "Capture session suddenly stopped running. mediaserverd crash?", buf, 2u);
              }

              captureQueue = self->_captureQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __79__BKUIPearlVideoCaptureSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
              block[3] = &unk_1E6EA20C0;
              block[4] = self;
              dispatch_async(captureQueue, block);
            }
          }
        }
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BKUIPearlVideoCaptureSession;
    -[BKUIPearlVideoCaptureSession observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __79__BKUIPearlVideoCaptureSession_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) startRunning];
}

- (BOOL)_synchronizedCaptureSessionInterrupted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL captureSessionInterrupted = v2->_captureSessionInterrupted;
  objc_sync_exit(v2);

  return captureSessionInterrupted;
}

- (BKUIVideoCaptureSesssionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIVideoCaptureSesssionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
}

- (double)additionalPreviewScalingAllowedByCameraFormat
{
  return self->_additionalPreviewScalingAllowedByCameraFormat;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_FAULT, "BKUIPearl: Failed to get camera", v1, 2u);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "Capture orientation: Failed to set to LandscapeRight for model: %ld - video orientation unsupported", (uint8_t *)&v2, 0xCu);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_FAULT, "BKUIPearl: Failed to get input device, %@", (uint8_t *)&v2, 0xCu);
}

void __50__BKUIPearlVideoCaptureSession__setupCaptureStack__block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_FAULT, "BKUIPearl: Failed to set session preset", v1, 2u);
}

@end