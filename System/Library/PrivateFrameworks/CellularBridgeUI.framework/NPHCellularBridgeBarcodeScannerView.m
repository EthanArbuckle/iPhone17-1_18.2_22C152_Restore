@interface NPHCellularBridgeBarcodeScannerView
- (AVCaptureVideoPreviewLayer)previewLayer;
- (BOOL)canUseCamera;
- (BOOL)isRunning;
- (NPHCellularBridgeBarcodeScannerCaptureDelegate)delegate;
- (NPHCellularBridgeBarcodeScannerView)initWithDelegate:(id)a3;
- (void)_changeCameraConfiguration;
- (void)autoExposeAtPoint:(CGPoint)a3;
- (void)autoFocusAtPoint:(CGPoint)a3;
- (void)dealloc;
- (void)handleRuntimeError:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setupCameraSession;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation NPHCellularBridgeBarcodeScannerView

- (NPHCellularBridgeBarcodeScannerView)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCellularBridgeBarcodeScannerView;
  result = -[NPHCellularBridgeBarcodeScannerView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (result) {
    result->_delegate = (NPHCellularBridgeBarcodeScannerCaptureDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_canUseCamera) {
    [(AVCaptureSession *)self->_captureSession removeObserver:self forKeyPath:@"running" context:@"NPHCaptureSessionRunningContext"];
  }
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  metadataQueue = self->_metadataQueue;
  self->_metadataQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)NPHCellularBridgeBarcodeScannerView;
  [(NPHCellularBridgeBarcodeScannerView *)&v5 dealloc];
}

- (void)handleRuntimeError:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 userInfo];
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "########### Capture failed because of runtime error (%@)", buf, 0xCu);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke;
  block[3] = &unk_264C53628;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke_2;
  v3[3] = &unk_264C53628;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke_3;
  v2[3] = &unk_264C53650;
  v2[4] = v4;
  return [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.25];
}

uint64_t __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __58__NPHCellularBridgeBarcodeScannerView_handleRuntimeError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 408);
  *(void *)(v2 + 408) = 0;

  [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperlayer];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"NPHCameraHitRuntimeError" object:0];
}

- (void)setupCameraSession
{
  captureSession = self->_captureSession;
  if (!captureSession)
  {
    id v4 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
    objc_super v5 = self->_captureSession;
    self->_captureSession = v4;

    captureSession = self->_captureSession;
  }
  [(AVCaptureSession *)captureSession beginConfiguration];
  uint64_t v6 = *MEMORY[0x263EF9758];
  if ([(AVCaptureSession *)self->_captureSession canSetSessionPreset:*MEMORY[0x263EF9758]])
  {
    [(AVCaptureSession *)self->_captureSession setSessionPreset:v6];
    v7 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9D48]];
    v8 = v7;
    if (v7)
    {
      if ([v7 position] != 2)
      {
        id v20 = 0;
        v12 = (AVCaptureDeviceInput *)[objc_alloc(MEMORY[0x263EFA5B8]) initWithDevice:v8 error:&v20];
        v9 = v20;
        deviceInput = self->_deviceInput;
        self->_deviceInput = v12;

        if (v9)
        {
          v14 = nph_general_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_235444000, v14, OS_LOG_TYPE_DEFAULT, "failed to get input device", buf, 2u);
          }
        }
        else
        {
          [(AVCaptureSession *)self->_captureSession addInput:self->_deviceInput];
          v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CellularBridgeUI.captureSession", 0);
          metadataQueue = self->_metadataQueue;
          self->_metadataQueue = v15;

          v9 = objc_alloc_init(MEMORY[0x263EFA5F0]);
          [(AVCaptureSession *)self->_captureSession addOutput:v9];
          [v9 setMetadataObjectTypes:&unk_26E899AC0];
          [v9 setMetadataObjectsDelegate:self->_delegate queue:self->_metadataQueue];
          v17 = (AVCaptureVideoPreviewLayer *)[objc_alloc(MEMORY[0x263EFA6B0]) initWithSession:self->_captureSession];
          previewLayer = self->_previewLayer;
          self->_previewLayer = v17;

          [(AVCaptureVideoPreviewLayer *)self->_previewLayer setVideoGravity:*MEMORY[0x263EF9C78]];
          v19 = [(NPHCellularBridgeBarcodeScannerView *)self layer];
          [v19 insertSublayer:self->_previewLayer atIndex:0];

          [(AVCaptureSession *)self->_captureSession commitConfiguration];
          [(AVCaptureSession *)self->_captureSession addObserver:self forKeyPath:@"running" options:1 context:@"NPHCaptureSessionRunningContext"];
          self->_canUseCamera = 1;
        }
        goto LABEL_19;
      }
      v9 = nph_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "could only get front camera";
LABEL_13:
        _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      }
    }
    else
    {
      v9 = nph_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "failed to get camera";
        goto LABEL_13;
      }
    }
LABEL_19:

    return;
  }
  v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "failed to set session preset", buf, 2u);
  }

  [(AVCaptureSession *)self->_captureSession commitConfiguration];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NPHCellularBridgeBarcodeScannerView;
  [(NPHCellularBridgeBarcodeScannerView *)&v4 layoutSubviews];
  v3 = [(AVCaptureVideoPreviewLayer *)self->_previewLayer superlayer];
  [v3 bounds];
  -[AVCaptureVideoPreviewLayer setFrame:](self->_previewLayer, "setFrame:");
}

- (void)startRunning
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleRuntimeError_ name:*MEMORY[0x263EF9798] object:0];

  if (self->_canUseCamera)
  {
    [(NPHCellularBridgeBarcodeScannerView *)self _changeCameraConfiguration];
    captureSession = self->_captureSession;
    [(AVCaptureSession *)captureSession startRunning];
  }
}

- (void)stopRunning
{
  if (self->_canUseCamera) {
    [(AVCaptureSession *)self->_captureSession stopRunning];
  }
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF9798] object:0];
}

- (BOOL)isRunning
{
  return [(AVCaptureSession *)self->_captureSession isRunning];
}

- (void)autoFocusAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(AVCaptureDeviceInput *)self->_deviceInput device];
  if ([v6 isFocusPointOfInterestSupported]
    && [v6 isFocusModeSupported:1])
  {
    -[AVCaptureVideoPreviewLayer captureDevicePointOfInterestForPoint:](self->_previewLayer, "captureDevicePointOfInterestForPoint:", x, y);
    double v8 = v7;
    double v10 = v9;
    uint64_t v13 = 0;
    if ([v6 lockForConfiguration:&v13])
    {
      objc_msgSend(v6, "setFocusPointOfInterest:", v8, v10);
      [v6 setFocusMode:1];
      [v6 unlockForConfiguration];
    }
    else
    {
      v11 = nph_general_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "failed to focus at point", v12, 2u);
      }
    }
  }
}

- (void)autoExposeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(AVCaptureDeviceInput *)self->_deviceInput device];
  if ([v6 isFocusPointOfInterestSupported]
    && [v6 isExposureModeSupported:2])
  {
    -[AVCaptureVideoPreviewLayer captureDevicePointOfInterestForPoint:](self->_previewLayer, "captureDevicePointOfInterestForPoint:", x, y);
    double v8 = v7;
    double v10 = v9;
    uint64_t v13 = 0;
    if ([v6 lockForConfiguration:&v13])
    {
      objc_msgSend(v6, "setExposurePointOfInterest:", v8, v10);
      [v6 setExposureMode:2];
      [v6 unlockForConfiguration];
    }
    else
    {
      v11 = nph_general_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_235444000, v11, OS_LOG_TYPE_DEFAULT, "failed to expose at point", v12, 2u);
      }
    }
  }
}

- (void)_changeCameraConfiguration
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v3 = [(AVCaptureDeviceInput *)self->_deviceInput device];
  id v5 = 0;
  [v3 lockForConfiguration:&v5];
  id v4 = v5;
  if ([v3 isFocusModeSupported:2])
  {
    objc_msgSend(v3, "setFocusPointOfInterest:", 0.5, 0.5);
    [v3 setFocusMode:2];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 isAutoFocusRangeRestrictionSupported])
  {
    [v3 setAutoFocusRangeRestriction:1];
  }
  if ([v3 isWhiteBalanceModeSupported:2]) {
    [v3 setWhiteBalanceMode:2];
  }
  if ([v3 isExposureModeSupported:2])
  {
    objc_msgSend(v3, "setExposurePointOfInterest:", 0.5, 0.5);
    [v3 setExposureMode:2];
  }
  [v3 unlockForConfiguration];
  [MEMORY[0x263F158F8] commit];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"NPHCaptureSessionRunningContext")
  {
    if [a3 isEqual:@"running"] && (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      v12 = [v10 objectForKey:*MEMORY[0x263F081B8]];
      -[NPHCellularBridgeBarcodeScannerCaptureDelegate captureSession:isRunning:](delegate, "captureSession:isRunning:", self, [v12 BOOLValue]);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NPHCellularBridgeBarcodeScannerView;
    [(NPHCellularBridgeBarcodeScannerView *)&v13 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (BOOL)canUseCamera
{
  return self->_canUseCamera;
}

- (NPHCellularBridgeBarcodeScannerCaptureDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NPHCellularBridgeBarcodeScannerCaptureDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end