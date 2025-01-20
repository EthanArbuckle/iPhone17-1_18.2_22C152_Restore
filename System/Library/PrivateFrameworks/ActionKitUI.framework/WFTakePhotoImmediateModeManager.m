@interface WFTakePhotoImmediateModeManager
- (AVCapturePhotoOutput)output;
- (AVCaptureSession)session;
- (WFTakePhotoImmediateModeDelegate)delegate;
- (WFTakePhotoImmediateModeManager)initWithCameraPosition:(int64_t)a3 delegate:(id)a4;
- (id)captureSessionWithDevice:(id)a3 output:(id)a4 error:(id *)a5;
- (id)configuredCaptureDeviceWithError:(id *)a3;
- (int64_t)position;
- (void)cameraIsReady:(id)a3;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setOutput:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)startSessionWithError:(id *)a3;
- (void)stop;
- (void)takePhotoWithError:(id *)a3;
@end

@implementation WFTakePhotoImmediateModeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setOutput:(id)a3
{
}

- (AVCapturePhotoOutput)output
{
  return self->_output;
}

- (void)setSession:(id)a3
{
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setDelegate:(id)a3
{
}

- (WFTakePhotoImmediateModeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTakePhotoImmediateModeDelegate *)WeakRetained;
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  v8 = [(WFTakePhotoImmediateModeManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(WFTakePhotoImmediateModeManager *)self delegate];
    [v10 manager:self didFinishWithPhoto:v11 error:v7];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF9700] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFTakePhotoImmediateModeManager;
  [(WFTakePhotoImmediateModeManager *)&v4 dealloc];
}

- (void)cameraIsReady:(id)a3
{
  objc_super v4 = [(WFTakePhotoImmediateModeManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFTakePhotoImmediateModeManager *)self delegate];
    [v6 managerDidBecomeReady:self];
  }
}

- (id)captureSessionWithDevice:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v10 = (void *)getAVCaptureSessionClass_softClass;
  uint64_t v31 = getAVCaptureSessionClass_softClass;
  if (!getAVCaptureSessionClass_softClass)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getAVCaptureSessionClass_block_invoke;
    v26 = &unk_264900EF8;
    v27 = &v28;
    __getAVCaptureSessionClass_block_invoke((uint64_t)&v23);
    v10 = (void *)v29[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v28, 8);
  v12 = objc_opt_new();
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  v13 = (void *)getAVCaptureSessionPresetPhotoSymbolLoc_ptr;
  uint64_t v31 = getAVCaptureSessionPresetPhotoSymbolLoc_ptr;
  if (!getAVCaptureSessionPresetPhotoSymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __getAVCaptureSessionPresetPhotoSymbolLoc_block_invoke;
    v26 = &unk_264900EF8;
    v27 = &v28;
    v14 = AVFoundationLibrary_2413();
    v15 = dlsym(v14, "AVCaptureSessionPresetPhoto");
    *(void *)(v27[1] + 24) = v15;
    getAVCaptureSessionPresetPhotoSymbolLoc_ptr = *(void *)(v27[1] + 24);
    v13 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (v13)
  {
    [v12 setSessionPreset:*v13];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v16 = (void *)getAVCaptureDeviceInputClass_softClass;
    uint64_t v31 = getAVCaptureDeviceInputClass_softClass;
    if (!getAVCaptureDeviceInputClass_softClass)
    {
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __getAVCaptureDeviceInputClass_block_invoke;
      v26 = &unk_264900EF8;
      v27 = &v28;
      __getAVCaptureDeviceInputClass_block_invoke((uint64_t)&v23);
      v16 = (void *)v29[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v28, 8);
    v18 = [v17 deviceInputWithDevice:v8 error:a5];
    if (v18)
    {
      [v12 addInput:v18];
      [v12 addOutput:v9];
      [(WFTakePhotoImmediateModeManager *)self setSession:v12];
      id v19 = v12;
    }
    else
    {
      id v19 = 0;
    }

    return v19;
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSString stringWithUTF8String:"AVCaptureSessionPreset getAVCaptureSessionPresetPhoto(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"WFTakePhotoImmediateModeManager.m", 24, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)configuredCaptureDeviceWithError:(id *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v5 = (id *)getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  uint64_t v47 = getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_block_invoke;
    v42 = &unk_264900EF8;
    v43 = &v44;
    id v6 = AVFoundationLibrary_2413();
    v45[3] = (uint64_t)dlsym(v6, "AVCaptureDeviceTypeBuiltInDualCamera");
    getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = *(void *)(v43[1] + 24);
    char v5 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v5)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    v34 = [NSString stringWithUTF8String:"AVCaptureDeviceType getAVCaptureDeviceTypeBuiltInDualCamera(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"WFTakePhotoImmediateModeManager.m", 20, @"%s", dlerror());

    goto LABEL_29;
  }
  id v7 = *v5;
  id v52 = v7;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  id v8 = (id *)getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  uint64_t v47 = getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_block_invoke;
    v42 = &unk_264900EF8;
    v43 = &v44;
    id v9 = AVFoundationLibrary_2413();
    v45[3] = (uint64_t)dlsym(v9, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
    getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = *(void *)(v43[1] + 24);
    id v8 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v8)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    v36 = [NSString stringWithUTF8String:"AVCaptureDeviceType getAVCaptureDeviceTypeBuiltInWideAngleCamera(void)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"WFTakePhotoImmediateModeManager.m", 21, @"%s", dlerror());

    goto LABEL_29;
  }
  id v53 = *v8;
  v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = v53;
  v12 = [v10 arrayWithObjects:&v52 count:2];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v13 = (void *)getAVCaptureDeviceDiscoverySessionClass_softClass;
  uint64_t v47 = getAVCaptureDeviceDiscoverySessionClass_softClass;
  if (!getAVCaptureDeviceDiscoverySessionClass_softClass)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getAVCaptureDeviceDiscoverySessionClass_block_invoke;
    v42 = &unk_264900EF8;
    v43 = &v44;
    __getAVCaptureDeviceDiscoverySessionClass_block_invoke((uint64_t)&v39);
    v13 = (void *)v45[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v44, 8);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v15 = (id *)getAVMediaTypeVideoSymbolLoc_ptr;
  uint64_t v47 = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    uint64_t v39 = MEMORY[0x263EF8330];
    uint64_t v40 = 3221225472;
    v41 = __getAVMediaTypeVideoSymbolLoc_block_invoke;
    v42 = &unk_264900EF8;
    v43 = &v44;
    v16 = AVFoundationLibrary_2413();
    id v17 = dlsym(v16, "AVMediaTypeVideo");
    *(void *)(v43[1] + 24) = v17;
    getAVMediaTypeVideoSymbolLoc_ptr = *(void *)(v43[1] + 24);
    v15 = (id *)v45[3];
  }
  _Block_object_dispose(&v44, 8);
  if (!v15)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    v38 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"WFTakePhotoImmediateModeManager.m", 22, @"%s", dlerror());

LABEL_29:
    __break(1u);
  }
  id v18 = *v15;
  id v19 = objc_msgSend(v14, "discoverySessionWithDeviceTypes:mediaType:position:", v12, v18, -[WFTakePhotoImmediateModeManager position](self, "position"));

  v20 = [v19 devices];
  v21 = [v20 firstObject];

  if (!v21)
  {
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = getAVFoundationErrorDomain();
    uint64_t v50 = *MEMORY[0x263F08320];
    v25 = WFLocalizedString(@"No suitable camera was detected on this device.");
    v51 = v25;
    v26 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    *a3 = [v23 errorWithDomain:v24 code:-11814 userInfo:v26];

LABEL_18:
    id v31 = 0;
    goto LABEL_23;
  }
  if (![v21 lockForConfiguration:0])
  {
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = getAVFoundationErrorDomain();
    uint64_t v48 = *MEMORY[0x263F08320];
    v29 = WFLocalizedString(@"The camera is already in use.");
    v49 = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    *a3 = [v27 errorWithDomain:v28 code:-11817 userInfo:v30];

    goto LABEL_18;
  }
  if ([v21 isFocusModeSupported:2])
  {
    uint64_t v22 = 2;
LABEL_21:
    [v21 setFocusMode:v22];
    goto LABEL_22;
  }
  if ([v21 isFocusModeSupported:1])
  {
    uint64_t v22 = 1;
    goto LABEL_21;
  }
LABEL_22:
  [v21 unlockForConfiguration];
  id v31 = v21;
LABEL_23:

  return v31;
}

- (void)stop
{
  v3 = [(WFTakePhotoImmediateModeManager *)self session];
  [v3 stopRunning];

  [(WFTakePhotoImmediateModeManager *)self setSession:0];
  [(WFTakePhotoImmediateModeManager *)self setOutput:0];
}

- (void)takePhotoWithError:(id *)a3
{
  objc_super v4 = [(WFTakePhotoImmediateModeManager *)self output];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  char v5 = (void *)getAVCapturePhotoSettingsClass_softClass;
  uint64_t v12 = getAVCapturePhotoSettingsClass_softClass;
  if (!getAVCapturePhotoSettingsClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getAVCapturePhotoSettingsClass_block_invoke;
    v8[3] = &unk_264900EF8;
    v8[4] = &v9;
    __getAVCapturePhotoSettingsClass_block_invoke((uint64_t)v8);
    char v5 = (void *)v10[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  id v7 = [v6 photoSettings];
  [v4 capturePhotoWithSettings:v7 delegate:self];
}

- (void)startSessionWithError:(id *)a3
{
  char v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_cameraIsReady_ name:*MEMORY[0x263EF9700] object:0];

  id v6 = [(WFTakePhotoImmediateModeManager *)self configuredCaptureDeviceWithError:a3];
  if (!*a3)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v7 = (void *)getAVCapturePhotoOutputClass_softClass;
    uint64_t v16 = getAVCapturePhotoOutputClass_softClass;
    if (!getAVCapturePhotoOutputClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getAVCapturePhotoOutputClass_block_invoke;
      v12[3] = &unk_264900EF8;
      v12[4] = &v13;
      __getAVCapturePhotoOutputClass_block_invoke((uint64_t)v12);
      id v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    uint64_t v9 = objc_opt_new();
    [(WFTakePhotoImmediateModeManager *)self setOutput:v9];
    v10 = [(WFTakePhotoImmediateModeManager *)self captureSessionWithDevice:v6 output:v9 error:a3];
    [(WFTakePhotoImmediateModeManager *)self setSession:v10];

    uint64_t v11 = [(WFTakePhotoImmediateModeManager *)self session];
    [v11 startRunning];
  }
}

- (WFTakePhotoImmediateModeManager)initWithCameraPosition:(int64_t)a3 delegate:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFTakePhotoImmediateModeManager.m", 56, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFTakePhotoImmediateModeManager;
  id v8 = [(WFTakePhotoImmediateModeManager *)&v14 init];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 2 * (a3 == 1);
    if (!a3) {
      uint64_t v10 = 1;
    }
    v8->_position = v10;
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v11 = v9;
  }

  return v9;
}

@end