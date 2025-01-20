@interface CDZQRScanningViewController
- (AVCaptureDevice)captureDevice;
- (AVCaptureSession)avSession;
- (AVCaptureVideoPreviewLayer)previewLayer;
- (CDZQRScanningViewController)init;
- (CDZQRScanningViewController)initWithMetadataObjectTypes:(id)a3;
- (NSArray)metadataObjectTypes;
- (NSString)lastCapturedString;
- (UIButton)torchButton;
- (UILabel)cameraUnavailableLabel;
- (id)cancelBlock;
- (id)errorBlock;
- (id)resultBlock;
- (void)cancelItemSelected:(id)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)dealloc;
- (void)handleFocusTap:(id)a3;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionRuntimeError:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setAvSession:(id)a3;
- (void)setCameraUnavailableLabel:(id)a3;
- (void)setCancelBlock:(id)a3;
- (void)setCaptureDevice:(id)a3;
- (void)setErrorBlock:(id)a3;
- (void)setLastCapturedString:(id)a3;
- (void)setMetadataObjectTypes:(id)a3;
- (void)setPreviewLayer:(id)a3;
- (void)setResultBlock:(id)a3;
- (void)setTorchButton:(id)a3;
- (void)toggleTorch:(id)a3;
- (void)turnTorchOff;
- (void)turnTorchOn;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CDZQRScanningViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCapturedString, 0);
  objc_destroyWeak((id *)&self->_cameraUnavailableLabel);
  objc_storeStrong((id *)&self->_torchButton, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_avSession, 0);
  objc_storeStrong((id *)&self->_metadataObjectTypes, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)setLastCapturedString:(id)a3
{
}

- (NSString)lastCapturedString
{
  return self->_lastCapturedString;
}

- (void)setCameraUnavailableLabel:(id)a3
{
}

- (UILabel)cameraUnavailableLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraUnavailableLabel);
  return (UILabel *)WeakRetained;
}

- (void)setTorchButton:(id)a3
{
}

- (UIButton)torchButton
{
  return self->_torchButton;
}

- (void)setPreviewLayer:(id)a3
{
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setCaptureDevice:(id)a3
{
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (AVCaptureSession)avSession
{
  return self->_avSession;
}

- (void)setMetadataObjectTypes:(id)a3
{
}

- (NSArray)metadataObjectTypes
{
  return self->_metadataObjectTypes;
}

- (void)setCancelBlock:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setErrorBlock:(id)a3
{
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setResultBlock:(id)a3
{
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)sessionInterruptionEnded:(id)a3
{
  v4 = [(CDZQRScanningViewController *)self cameraUnavailableLabel];
  char v5 = [v4 isHidden];

  if ((v5 & 1) == 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke;
    v7[3] = &unk_264900E20;
    v7[4] = self;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke_2;
    v6[3] = &unk_264900E48;
    v6[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:0.25];
  }
}

void __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cameraUnavailableLabel];
  [v2 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) previewLayer];
  LODWORD(v3) = 1.0;
  [v4 setOpacity:v3];
}

void __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cameraUnavailableLabel];
  [v1 setHidden:1];
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  char v5 = [v4 userInfo];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v6 = (void *)getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr;
  uint64_t v21 = getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr;
  if (!getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr)
  {
    v16[5] = MEMORY[0x263EF8330];
    v16[6] = 3221225472;
    v16[7] = __getAVCaptureSessionInterruptionReasonKeySymbolLoc_block_invoke;
    v16[8] = &unk_264900EF8;
    v17 = &v18;
    v7 = AVFoundationLibrary_5399();
    v19[3] = (uint64_t)dlsym(v7, "AVCaptureSessionInterruptionReasonKey");
    getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr = *(void *)(v17[1] + 24);
    v6 = (void *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v6)
  {
    v8 = [v5 objectForKeyedSubscript:*v6];
    uint64_t v9 = [v8 integerValue];

    if (v9 == 4) {
      v10 = @"Camera Unavailable in Multitasking";
    }
    else {
      v10 = @"Camera Unavailable";
    }
    v11 = [(CDZQRScanningViewController *)self cameraUnavailableLabel];
    [v11 setText:v10];

    v12 = [(CDZQRScanningViewController *)self cameraUnavailableLabel];
    [v12 setAlpha:0.0];

    v13 = [(CDZQRScanningViewController *)self cameraUnavailableLabel];
    [v13 setHidden:0];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__CDZQRScanningViewController_sessionWasInterrupted___block_invoke;
    v16[3] = &unk_264900E20;
    v16[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v16 animations:0.25];
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = [NSString stringWithUTF8String:"NSString *getAVCaptureSessionInterruptionReasonKey(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"CDZQRScanningViewController.m", 39, @"%s", dlerror());

    __break(1u);
  }
}

void __53__CDZQRScanningViewController_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cameraUnavailableLabel];
  [v2 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) previewLayer];
  LODWORD(v3) = 0.5;
  [v4 setOpacity:v3];
}

- (void)sessionRuntimeError:(id)a3
{
  id v4 = a3;
  char v5 = [v4 userInfo];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  v6 = (void *)getAVCaptureSessionErrorKeySymbolLoc_ptr;
  uint64_t v16 = getAVCaptureSessionErrorKeySymbolLoc_ptr;
  if (!getAVCaptureSessionErrorKeySymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_5399();
    v14[3] = (uint64_t)dlsym(v7, "AVCaptureSessionErrorKey");
    getAVCaptureSessionErrorKeySymbolLoc_ptr = v14[3];
    v6 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v6)
  {
    v8 = [v5 objectForKeyedSubscript:*v6];

    uint64_t v9 = [(CDZQRScanningViewController *)self errorBlock];

    if (v9)
    {
      v10 = [(CDZQRScanningViewController *)self errorBlock];
      ((void (**)(void, void *))v10)[2](v10, v8);
    }
  }
  else
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    v12 = [NSString stringWithUTF8String:"NSString *getAVCaptureSessionErrorKey(void)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"CDZQRScanningViewController.m", 38, @"%s", dlerror());

    __break(1u);
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
      v11 = [(CDZQRScanningViewController *)self metadataObjectTypes];
      v12 = [v10 type];
      char v13 = [v11 containsObject:v12];

      if (v13) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = (id)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v7 = v10;
    v14 = [v7 stringValue];

    if (v14)
    {
      uint64_t v16 = [(CDZQRScanningViewController *)self lastCapturedString];
      char v17 = [v16 isEqualToString:v14];

      if ((v17 & 1) == 0)
      {
        [(CDZQRScanningViewController *)self setLastCapturedString:v14];
        uint64_t v18 = [(CDZQRScanningViewController *)self avSession];
        [v18 stopRunning];

        v19 = [(CDZQRScanningViewController *)self resultBlock];

        if (v19)
        {
          uint64_t v15 = [(CDZQRScanningViewController *)self resultBlock];
          ((void (**)(void, id))v15)[2](v15, v7);
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
    uint64_t v15 = (void (**)(void, void))v6;
LABEL_14:
  }
}

- (void)turnTorchOff
{
  id v7 = [(CDZQRScanningViewController *)self captureDevice];
  if ([v7 hasTorch])
  {
    double v3 = [(CDZQRScanningViewController *)self captureDevice];
    if ([v3 isTorchModeSupported:0])
    {
      id v4 = [(CDZQRScanningViewController *)self captureDevice];
      int v5 = [v4 lockForConfiguration:0];

      if (!v5) {
        return;
      }
      id v6 = [(CDZQRScanningViewController *)self captureDevice];
      [v6 setTorchMode:0];

      id v7 = [(CDZQRScanningViewController *)self captureDevice];
      [v7 unlockForConfiguration];
    }
    else
    {
    }
  }
}

- (void)turnTorchOn
{
  id v9 = [(CDZQRScanningViewController *)self captureDevice];
  if (![v9 hasTorch]) {
    goto LABEL_8;
  }
  double v3 = [(CDZQRScanningViewController *)self captureDevice];
  if (([v3 isTorchAvailable] & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  id v4 = [(CDZQRScanningViewController *)self captureDevice];
  if (([v4 isTorchModeSupported:1] & 1) == 0)
  {

    goto LABEL_7;
  }
  int v5 = [(CDZQRScanningViewController *)self captureDevice];
  int v6 = [v5 lockForConfiguration:0];

  if (!v6) {
    return;
  }
  id v7 = [(CDZQRScanningViewController *)self captureDevice];
  LODWORD(v8) = 0.25;
  [v7 setTorchModeOnWithLevel:0 error:v8];

  id v9 = [(CDZQRScanningViewController *)self captureDevice];
  [v9 unlockForConfiguration];
LABEL_8:
}

- (void)handleFocusTap:(id)a3
{
  id v4 = a3;
  int v5 = [(CDZQRScanningViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(CDZQRScanningViewController *)self previewLayer];
  objc_msgSend(v10, "captureDevicePointOfInterestForPoint:", v7, v9);
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(CDZQRScanningViewController *)self captureDevice];
  id v18 = 0;
  LODWORD(v5) = [v15 lockForConfiguration:&v18];
  id v16 = v18;
  char v17 = v16;
  if (v5)
  {
    if ([v15 isFocusPointOfInterestSupported]
      && [v15 isFocusModeSupported:1])
    {
      [v15 setFocusMode:1];
      objc_msgSend(v15, "setFocusPointOfInterest:", v12, v14);
    }
    if ([v15 isExposurePointOfInterestSupported]
      && [v15 isExposureModeSupported:1])
    {
      [v15 setExposureMode:1];
      objc_msgSend(v15, "setExposurePointOfInterest:", v12, v14);
    }
    [v15 unlockForConfiguration];
  }
  else
  {
    NSLog(&cfstr_CaptureDeviceC.isa, v16);
  }
}

- (void)toggleTorch:(id)a3
{
  id v4 = [(CDZQRScanningViewController *)self captureDevice];
  int v5 = [v4 isTorchActive];

  if (v5)
  {
    [(CDZQRScanningViewController *)self turnTorchOff];
    double v6 = [(CDZQRScanningViewController *)self torchButton];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    [(CDZQRScanningViewController *)self turnTorchOn];
    double v6 = [(CDZQRScanningViewController *)self torchButton];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  [v6 setSelected:v7];
}

- (void)cancelItemSelected:(id)a3
{
  id v4 = [(CDZQRScanningViewController *)self avSession];
  [v4 stopRunning];

  int v5 = [(CDZQRScanningViewController *)self cancelBlock];

  if (v5)
  {
    double v6 = [(CDZQRScanningViewController *)self cancelBlock];
    v6[2]();
  }
}

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CDZQRScanningViewController;
  [(CDZQRScanningViewController *)&v23 viewDidLayoutSubviews];
  double v3 = [(CDZQRScanningViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(CDZQRScanningViewController *)self previewLayer];
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double MidX = CGRectGetMidX(v24);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  double MidY = CGRectGetMidY(v25);
  uint64_t v15 = [(CDZQRScanningViewController *)self previewLayer];
  objc_msgSend(v15, "setPosition:", MidX, MidY);

  id v16 = [(CDZQRScanningViewController *)self previewLayer];
  char v17 = [v16 connection];
  int v18 = [v17 isVideoOrientationSupported];

  if (v18)
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F82438], "performSelector:", sel_sharedApplication), "statusBarOrientation");
    if ((unint64_t)(v19 - 2) >= 3) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    long long v21 = [(CDZQRScanningViewController *)self previewLayer];
    long long v22 = [v21 connection];
    [v22 setVideoOrientation:v20];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDZQRScanningViewController;
  [(CDZQRScanningViewController *)&v6 viewDidDisappear:a3];
  double v4 = [(CDZQRScanningViewController *)self previewLayer];
  [v4 removeFromSuperlayer];

  [(CDZQRScanningViewController *)self setPreviewLayer:0];
  double v5 = [(CDZQRScanningViewController *)self avSession];
  [v5 stopRunning];

  [(CDZQRScanningViewController *)self setAvSession:0];
  [(CDZQRScanningViewController *)self setCaptureDevice:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v43.receiver = self;
  v43.super_class = (Class)CDZQRScanningViewController;
  [(CDZQRScanningViewController *)&v43 viewWillAppear:a3];
  double v4 = [(CDZQRScanningViewController *)self cancelBlock];

  if (v4)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelItemSelected_];
    objc_super v6 = [(CDZQRScanningViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:v5];
  }
  else
  {
    double v5 = [(CDZQRScanningViewController *)self navigationItem];
    [v5 setLeftBarButtonItem:0];
  }

  [(CDZQRScanningViewController *)self setLastCapturedString:0];
  uint64_t v7 = [(CDZQRScanningViewController *)self cancelBlock];
  if (v7)
  {
    double v8 = (void *)v7;
    double v9 = [(CDZQRScanningViewController *)self errorBlock];

    if (!v9)
    {
      objc_initWeak(&location, self);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke;
      v41[3] = &unk_264900DF8;
      objc_copyWeak(&v42, &location);
      [(CDZQRScanningViewController *)self setErrorBlock:v41];
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  double v10 = (void *)getAVCaptureSessionClass_softClass_5417;
  uint64_t v52 = getAVCaptureSessionClass_softClass_5417;
  if (!getAVCaptureSessionClass_softClass_5417)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    v46 = __getAVCaptureSessionClass_block_invoke_5418;
    v47 = &unk_264900EF8;
    v48 = &v49;
    __getAVCaptureSessionClass_block_invoke_5418((uint64_t)&location);
    double v10 = (void *)v50[3];
  }
  double v11 = v10;
  _Block_object_dispose(&v49, 8);
  id v12 = objc_alloc_init(v11);
  [(CDZQRScanningViewController *)self setAvSession:v12];

  double v13 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_264900E20;
  block[4] = self;
  dispatch_async(v13, block);

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  double v14 = (void *)getAVCaptureVideoPreviewLayerClass_softClass;
  uint64_t v52 = getAVCaptureVideoPreviewLayerClass_softClass;
  if (!getAVCaptureVideoPreviewLayerClass_softClass)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    v46 = __getAVCaptureVideoPreviewLayerClass_block_invoke;
    v47 = &unk_264900EF8;
    v48 = &v49;
    __getAVCaptureVideoPreviewLayerClass_block_invoke((uint64_t)&location);
    double v14 = (void *)v50[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v49, 8);
  id v16 = [(CDZQRScanningViewController *)self avSession];
  char v17 = [v15 layerWithSession:v16];
  [(CDZQRScanningViewController *)self setPreviewLayer:v17];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  int v18 = (id *)getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
  uint64_t v52 = getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
  if (!getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr)
  {
    id location = (id)MEMORY[0x263EF8330];
    uint64_t v45 = 3221225472;
    v46 = __getAVLayerVideoGravityResizeAspectFillSymbolLoc_block_invoke;
    v47 = &unk_264900EF8;
    v48 = &v49;
    uint64_t v19 = AVFoundationLibrary_5399();
    uint64_t v20 = dlsym(v19, "AVLayerVideoGravityResizeAspectFill");
    *(void *)(v48[1] + 24) = v20;
    getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = *(void *)(v48[1] + 24);
    int v18 = (id *)v50[3];
  }
  _Block_object_dispose(&v49, 8);
  if (v18)
  {
    id v21 = *v18;
    long long v22 = [(CDZQRScanningViewController *)self previewLayer];
    [v22 setVideoGravity:v21];

    objc_super v23 = [(CDZQRScanningViewController *)self view];
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v32 = [(CDZQRScanningViewController *)self previewLayer];
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    v33 = [(CDZQRScanningViewController *)self view];
    v34 = [v33 layer];
    v35 = [(CDZQRScanningViewController *)self previewLayer];
    [v34 insertSublayer:v35 atIndex:0];

    v36 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleFocusTap_];
    v37 = [(CDZQRScanningViewController *)self view];
    [v37 addGestureRecognizer:v36];
  }
  else
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    v39 = [NSString stringWithUTF8String:"AVLayerVideoGravity getAVLayerVideoGravityResizeAspectFill(void)"];
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"CDZQRScanningViewController.m", 37, @"%s", dlerror());

    __break(1u);
  }
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained cancelBlock];

  if (v1)
  {
    v2 = [WeakRetained avSession];
    [v2 stopRunning];

    double v3 = [WeakRetained cancelBlock];
    v3[2]();
  }
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2050000000;
  v2 = (void *)getAVCaptureDeviceClass_softClass;
  uint64_t v58 = getAVCaptureDeviceClass_softClass;
  if (!getAVCaptureDeviceClass_softClass)
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = __getAVCaptureDeviceClass_block_invoke;
    v53 = &unk_264900EF8;
    v54 = &v55;
    __getAVCaptureDeviceClass_block_invoke((uint64_t)&v50);
    v2 = (void *)v56[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v55, 8);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  double v4 = (id *)getAVMediaTypeVideoSymbolLoc_ptr_5424;
  uint64_t v58 = getAVMediaTypeVideoSymbolLoc_ptr_5424;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_5424)
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = __getAVMediaTypeVideoSymbolLoc_block_invoke_5425;
    v53 = &unk_264900EF8;
    v54 = &v55;
    double v5 = AVFoundationLibrary_5399();
    objc_super v6 = dlsym(v5, "AVMediaTypeVideo");
    *(void *)(v54[1] + 24) = v6;
    getAVMediaTypeVideoSymbolLoc_ptr_5424 = *(void *)(v54[1] + 24);
    double v4 = (id *)v56[3];
  }
  _Block_object_dispose(&v55, 8);
  if (!v4)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    v39 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"CDZQRScanningViewController.m", 36, @"%s", dlerror());

    __break(1u);
  }
  id v7 = *v4;
  double v8 = [v3 defaultDeviceWithMediaType:v7];
  [*(id *)(a1 + 32) setCaptureDevice:v8];

  double v9 = [*(id *)(a1 + 32) captureDevice];
  if ([v9 isLowLightBoostSupported])
  {
    double v10 = [*(id *)(a1 + 32) captureDevice];
    int v11 = [v10 lockForConfiguration:0];

    if (!v11) {
      goto LABEL_10;
    }
    id v12 = [*(id *)(a1 + 32) captureDevice];
    [v12 setAutomaticallyEnablesLowLightBoostWhenAvailable:1];

    double v9 = [*(id *)(a1 + 32) captureDevice];
    [v9 unlockForConfiguration];
  }

LABEL_10:
  double v13 = [*(id *)(a1 + 32) avSession];
  [v13 beginConfiguration];

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2050000000;
  double v14 = (void *)getAVCaptureDeviceInputClass_softClass_5428;
  uint64_t v58 = getAVCaptureDeviceInputClass_softClass_5428;
  if (!getAVCaptureDeviceInputClass_softClass_5428)
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    uint64_t v52 = __getAVCaptureDeviceInputClass_block_invoke_5429;
    v53 = &unk_264900EF8;
    v54 = &v55;
    __getAVCaptureDeviceInputClass_block_invoke_5429((uint64_t)&v50);
    double v14 = (void *)v56[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v55, 8);
  id v16 = [*(id *)(a1 + 32) captureDevice];
  id v49 = 0;
  char v17 = [v15 deviceInputWithDevice:v16 error:&v49];
  id v40 = v49;

  if (v17)
  {
    int v18 = [*(id *)(a1 + 32) avSession];
    [v18 addInput:v17];

    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2050000000;
    uint64_t v19 = (void *)getAVCaptureMetadataOutputClass_softClass;
    uint64_t v58 = getAVCaptureMetadataOutputClass_softClass;
    if (!getAVCaptureMetadataOutputClass_softClass)
    {
      uint64_t v50 = MEMORY[0x263EF8330];
      uint64_t v51 = 3221225472;
      uint64_t v52 = __getAVCaptureMetadataOutputClass_block_invoke;
      v53 = &unk_264900EF8;
      v54 = &v55;
      __getAVCaptureMetadataOutputClass_block_invoke((uint64_t)&v50);
      uint64_t v19 = (void *)v56[3];
    }
    uint64_t v20 = v19;
    _Block_object_dispose(&v55, 8);
    id v21 = objc_alloc_init(v20);
    long long v22 = [*(id *)(a1 + 32) avSession];
    [v22 addOutput:v21];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    objc_super v23 = [*(id *)(a1 + 32) metadataObjectTypes];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          double v28 = [v21 availableMetadataObjectTypes];
          char v29 = [v28 containsObject:v27];

          if ((v29 & 1) == 0)
          {
            v35 = [*(id *)(a1 + 32) errorBlock];

            if (v35)
            {
              v42[0] = MEMORY[0x263EF8330];
              v42[1] = 3221225472;
              v42[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_4;
              v42[3] = &unk_264900E88;
              v42[4] = *(void *)(a1 + 32);
              v42[5] = v27;
              dispatch_async(MEMORY[0x263EF83A0], v42);
            }

            goto LABEL_27;
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    double v31 = *(void **)(a1 + 32);
    double v30 = (id *)(a1 + 32);
    v32 = [v31 metadataObjectTypes];
    [v21 setMetadataObjectTypes:v32];

    [v21 setMetadataObjectsDelegate:*v30 queue:MEMORY[0x263EF83A0]];
    v33 = [*v30 avSession];
    [v33 commitConfiguration];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_5;
    block[3] = &unk_264900E20;
    block[4] = *v30;
    v34 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_27:
  }
  else
  {
    NSLog(&cfstr_Qrscanningview.isa, v40);
    v36 = [*(id *)(a1 + 32) avSession];
    [v36 commitConfiguration];

    v37 = [*(id *)(a1 + 32) errorBlock];

    if (v37)
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_3;
      v47[3] = &unk_264900E88;
      v47[4] = *(void *)(a1 + 32);
      id v48 = v40;
      dispatch_async(MEMORY[0x263EF83A0], v47);
    }
  }
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avSession];
  [v2 stopRunning];

  id v3 = [*(id *)(a1 + 32) errorBlock];
  v3[2](v3, *(void *)(a1 + 40));
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_4(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) avSession];
  [v2 stopRunning];

  id v3 = [*(id *)(a1 + 32) errorBlock];
  double v4 = (void *)MEMORY[0x263F087E8];
  double v5 = [NSString stringWithFormat:@"Unable to scan object of type %@", *(void *)(a1 + 40), *MEMORY[0x263F08320]];
  v9[0] = v5;
  objc_super v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v4 errorWithDomain:@"com.cdzombak.qrscanningviewcontroller" code:1 userInfo:v6];
  ((void (**)(void, void *))v3)[2](v3, v7);
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) previewLayer];
  id v3 = [v2 connection];
  int v4 = [v3 isVideoOrientationSupported];

  if (v4)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F82438], "performSelector:", sel_sharedApplication), "statusBarOrientation");
    if ((unint64_t)(v5 - 2) >= 3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    id v7 = [*(id *)(a1 + 32) previewLayer];
    uint64_t v8 = [v7 connection];
    [v8 setVideoOrientation:v6];
  }
  id v9 = [*(id *)(a1 + 32) avSession];
  [v9 startRunning];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CDZQRScanningViewController;
  [(CDZQRScanningViewController *)&v5 viewDidLoad];
  id v3 = [MEMORY[0x263F825C8] blackColor];
  int v4 = [(CDZQRScanningViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (CDZQRScanningViewController)init
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v3 = (id *)getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5436;
  uint64_t v15 = getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5436;
  if (!getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5436)
  {
    int v4 = AVFoundationLibrary_5399();
    v13[3] = (uint64_t)dlsym(v4, "AVMetadataObjectTypeQRCode");
    getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5436 = v13[3];
    id v3 = (id *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
  {
    double v10 = [MEMORY[0x263F08690] currentHandler];
    int v11 = [NSString stringWithUTF8String:"AVMetadataObjectType getAVMetadataObjectTypeQRCode(void)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"CDZQRScanningViewController.m", 35, @"%s", dlerror());

    __break(1u);
  }
  v16[0] = *v3;
  objc_super v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = v16[0];
  id v7 = [v5 arrayWithObjects:v16 count:1];

  uint64_t v8 = [(CDZQRScanningViewController *)self initWithMetadataObjectTypes:v7];
  return v8;
}

- (void)setAvSession:(id)a3
{
  id v18 = a3;
  p_avSession = &self->_avSession;
  if (self->_avSession)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    id v7 = getAVCaptureSessionRuntimeErrorNotification();
    [v6 removeObserver:self name:v7 object:*p_avSession];

    uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
    id v9 = getAVCaptureSessionWasInterruptedNotification();
    [v8 removeObserver:self name:v9 object:*p_avSession];

    double v10 = [MEMORY[0x263F08A00] defaultCenter];
    int v11 = getAVCaptureSessionInterruptionEndedNotification();
    [v10 removeObserver:self name:v11 object:*p_avSession];
  }
  objc_storeStrong((id *)&self->_avSession, a3);
  if (*p_avSession)
  {
    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    double v13 = getAVCaptureSessionRuntimeErrorNotification();
    [v12 addObserver:self selector:sel_sessionRuntimeError_ name:v13 object:*p_avSession];

    uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = getAVCaptureSessionWasInterruptedNotification();
    [v14 addObserver:self selector:sel_sessionWasInterrupted_ name:v15 object:*p_avSession];

    id v16 = [MEMORY[0x263F08A00] defaultCenter];
    char v17 = getAVCaptureSessionInterruptionEndedNotification();
    [v16 addObserver:self selector:sel_sessionInterruptionEnded_ name:v17 object:*p_avSession];
  }
}

- (void)dealloc
{
  [(CDZQRScanningViewController *)self setAvSession:0];
  v3.receiver = self;
  v3.super_class = (Class)CDZQRScanningViewController;
  [(CDZQRScanningViewController *)&v3 dealloc];
}

- (CDZQRScanningViewController)initWithMetadataObjectTypes:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CDZQRScanningViewController;
  objc_super v5 = [(CDZQRScanningViewController *)&v36 init];
  id v6 = v5;
  if (v5)
  {
    [(CDZQRScanningViewController *)v5 setMetadataObjectTypes:v4];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Scan QR Code" value:&stru_26DF570D0 table:0];
    [(CDZQRScanningViewController *)v6 setTitle:v8];

    id v9 = [MEMORY[0x263F827E8] systemImageNamed:@"bolt.fill"];
    [v9 size];
    CGFloat height = v37.height;
    v37.width = 18.0;
    UIGraphicsBeginImageContextWithOptions(v37, 0, 0.0);
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.width = 18.0;
    v38.size.CGFloat height = height;
    double MidX = CGRectGetMidX(v38);
    [v9 size];
    double v13 = MidX - v12 * 0.5;
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.width = 18.0;
    v39.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v39);
    [v9 size];
    objc_msgSend(v9, "drawAtPoint:", v13, MidY - v15 * 0.5);
    id v16 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    char v17 = [MEMORY[0x263F824E8] buttonWithType:1];
    [(UIButton *)v17 setImage:v16 forState:0];
    [(UIButton *)v17 addTarget:v6 action:sel_toggleTorch_ forControlEvents:64];
    [v16 size];
    double v19 = v18;
    [v16 size];
    -[UIButton setFrame:](v17, "setFrame:", 0.0, 0.0, v19, v20);
    id v21 = WFLocalizedString(@"Flash");
    [(UIButton *)v17 setAccessibilityLabel:v21];

    torchButton = v6->_torchButton;
    v6->_torchButton = v17;
    objc_super v23 = v17;

    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v23];
    uint64_t v25 = [(CDZQRScanningViewController *)v6 navigationItem];
    [v25 setRightBarButtonItem:v24];

    id v26 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v26 setHidden:1];
    [v26 setTextAlignment:1];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v27 = [MEMORY[0x263F825C8] whiteColor];
    [v26 setTextColor:v27];

    double v28 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v26 setFont:v28];

    objc_storeWeak((id *)&v6->_cameraUnavailableLabel, v26);
    char v29 = [(CDZQRScanningViewController *)v6 view];
    [v29 addSubview:v26];

    double v30 = _NSDictionaryOfVariableBindings(&cfstr_Unavailablelab.isa, v26, 0);
    double v31 = objc_opt_new();
    v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[unavailableLabel]|" options:0 metrics:0 views:v30];
    [v31 addObjectsFromArray:v32];

    v33 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[unavailableLabel]|" options:0 metrics:0 views:v30];
    [v31 addObjectsFromArray:v33];

    [MEMORY[0x263F08938] activateConstraints:v31];
    v34 = v6;
  }
  return v6;
}

@end