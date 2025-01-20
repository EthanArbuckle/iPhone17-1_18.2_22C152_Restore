@interface CKVideoRecorder
- (AVCaptureDeviceInput)audioInput;
- (AVCaptureDeviceInput)frontVideoInput;
- (AVCaptureDeviceInput)rearVideoInput;
- (AVCaptureMovieFileOutput)videoOutput;
- (AVCaptureSession)session;
- (AVCaptureStillImageOutput)stillImageOutput;
- (AVCaptureVideoPreviewLayer)captureVideoPreviewLayer;
- (BOOL)canceled;
- (BOOL)startVideoCapture;
- (CKVideoRecorder)init;
- (CKVideoRecorderDelegate)delegate;
- (NSURL)outputFileURL;
- (id)_cameraWithPosition:(int64_t)a3;
- (id)_configureFrontVideoInput;
- (id)_configureRearVideoInput;
- (id)audioDevice;
- (id)frontFacingCamera;
- (id)rearFacingCamera;
- (int64_t)cameraDevice;
- (void)cancel;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)loadView;
- (void)setAudioInput:(id)a3;
- (void)setCameraDevice:(int64_t)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCaptureVideoPreviewLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrontVideoInput:(id)a3;
- (void)setOutputFileURL:(id)a3;
- (void)setRearVideoInput:(id)a3;
- (void)setSession:(id)a3;
- (void)setStillImageOutput:(id)a3;
- (void)setVideoOutput:(id)a3;
- (void)setupCamera:(id)a3;
- (void)stopVideoCapture;
- (void)takePicture;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKVideoRecorder

- (CKVideoRecorder)init
{
  v18.receiver = self;
  v18.super_class = (Class)CKVideoRecorder;
  v2 = [(CKVideoRecorder *)&v18 init];
  v3 = v2;
  if (v2)
  {
    [(CKVideoRecorder *)v2 setCanceled:0];
    dispatch_queue_t v4 = dispatch_queue_create("CKVideoMessageSessionQueue", 0);
    avCaptureSessionDispatchQueue = v3->_avCaptureSessionDispatchQueue;
    v3->_avCaptureSessionDispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F16498]);
    [(CKVideoRecorder *)v3 setSession:v6];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F164C8]) initWithSession:v6];
    [v7 setVideoGravity:*MEMORY[0x1E4F15AF8]];
    [(CKVideoRecorder *)v3 setCaptureVideoPreviewLayer:v7];
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v9 = [v8 objectForKey:@"kCKVideoMessagingCameraDevice"];

    if (v9) {
      uint64_t v10 = [v9 integerValue];
    }
    else {
      uint64_t v10 = 1;
    }
    if (v10 >= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    v3->_currentDevice = v11;
    v12 = v3->_avCaptureSessionDispatchQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __23__CKVideoRecorder_init__block_invoke;
    v15[3] = &unk_1E5620AF8;
    id v16 = v6;
    v17 = v3;
    id v13 = v6;
    dispatch_async(v12, v15);
  }
  return v3;
}

void __23__CKVideoRecorder_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSessionPreset:*MEMORY[0x1E4F159C0]];
  v2 = *(void **)(a1 + 40);
  if (v2[122] == 1) {
    [v2 _configureFrontVideoInput];
  }
  else {
  id v12 = [v2 _configureRearVideoInput];
  }
  v3 = [*(id *)(a1 + 40) session];
  int v4 = [v3 canAddInput:v12];

  if (v4)
  {
    v5 = [*(id *)(a1 + 40) session];
    [v5 addInput:v12];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F16468]);
  v7 = [v6 connectionWithMediaType:*MEMORY[0x1E4F15C18]];
  if ([v7 isVideoOrientationSupported]) {
    [v7 setVideoOrientation:1];
  }
  if ([v7 isVideoStabilizationSupported]) {
    [v7 setEnablesVideoStabilizationWhenAvailable:1];
  }
  if ([*(id *)(a1 + 32) canAddOutput:v6]) {
    [*(id *)(a1 + 32) addOutput:v6];
  }
  [*(id *)(a1 + 40) setVideoOutput:v6];
  id v8 = objc_alloc_init(MEMORY[0x1E4F164A0]);
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", *MEMORY[0x1E4F16218], *MEMORY[0x1E4F16220], 0);
  [v8 setOutputSettings:v10];
  if ([*(id *)(a1 + 32) canAddOutput:v8]) {
    [*(id *)(a1 + 32) addOutput:v8];
  }
  [*(id *)(a1 + 40) setStillImageOutput:v8];
  uint64_t v11 = [*(id *)(a1 + 40) session];
  [v11 startRunning];
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)CKVideoRecorder;
  [(CKVideoRecorder *)&v15 loadView];
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CKVideoRecorder *)self captureVideoPreviewLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  id v13 = [(CKVideoRecorder *)self view];
  v14 = [v13 layer];
  [v14 insertSublayer:v12 atIndex:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CKVideoRecorder_viewWillAppear___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(avCaptureSessionDispatchQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)CKVideoRecorder;
  [(CKVideoRecorder *)&v6 viewWillAppear:v3];
}

void __34__CKVideoRecorder_viewWillAppear___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) session];
  [v8 beginConfiguration];
  id v2 = objc_alloc(MEMORY[0x1E4F16450]);
  BOOL v3 = [*(id *)(a1 + 32) audioDevice];
  double v4 = (void *)[v2 initWithDevice:v3 error:0];

  if ([v8 canAddInput:v4]) {
    [v8 addInput:v4];
  }
  [*(id *)(a1 + 32) setAudioInput:v4];
  double v5 = *(void **)(a1 + 32);
  if (v5[122] == 1) {
    id v6 = (id)[v5 _configureRearVideoInput];
  }
  else {
    id v7 = (id)[v5 _configureFrontVideoInput];
  }
  [v8 commitConfiguration];
}

- (void)cancel
{
  [(CKVideoRecorder *)self setCanceled:1];
  avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CKVideoRecorder_cancel__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(avCaptureSessionDispatchQueue, block);
  double v4 = [(CKVideoRecorder *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKVideoRecorder *)self delegate];
    [v6 ckVideoRecorderRecordingCanceled:self];
  }
}

void __25__CKVideoRecorder_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) session];
  [v1 stopRunning];
}

- (void)stopVideoCapture
{
  id v2 = [(CKVideoRecorder *)self videoOutput];
  [v2 stopRecording];
}

- (BOOL)startVideoCapture
{
  BOOL v3 = CKAttachmentTmpFileURL(@"VideoMessage.mov");
  double v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v3 URLByDeletingLastPathComponent];
  id v15 = 0;
  char v6 = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v7 = v15;

  if ((v6 & 1) == 0 && _IMWillLog())
  {
    id v13 = [v3 URLByDeletingLastPathComponent];
    id v14 = v7;
    _IMAlwaysLog();
  }
  -[CKVideoRecorder setOutputFileURL:](self, "setOutputFileURL:", v3, v13, v14);
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v9 = [(CKVideoRecorder *)self outputFileURL];
  [v8 removeItemAtURL:v9 error:0];

  double v10 = [(CKVideoRecorder *)self videoOutput];
  double v11 = [(CKVideoRecorder *)self outputFileURL];
  [v10 startRecordingToOutputFileURL:v11 recordingDelegate:self];

  return 1;
}

- (void)takePicture
{
  if (![(CKVideoRecorder *)self canceled])
  {
    BOOL v3 = [(CKVideoRecorder *)self stillImageOutput];
    double v4 = [v3 connectionWithMediaType:*MEMORY[0x1E4F15C18]];

    char v5 = [(CKVideoRecorder *)self stillImageOutput];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__CKVideoRecorder_takePicture__block_invoke;
    v6[3] = &unk_1E5625968;
    v6[4] = self;
    [v5 captureStillImageAsynchronouslyFromConnection:v4 completionHandler:v6];
  }
}

void __30__CKVideoRecorder_takePicture__block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) canceled] & 1) == 0)
  {
    [*(id *)(a1 + 32) cancel];
    if (a2)
    {
      id v7 = [MEMORY[0x1E4F164A0] jpegStillImageNSDataRepresentation:a2];
      double v4 = [*(id *)(a1 + 32) delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        char v6 = [*(id *)(a1 + 32) delegate];
        [v6 ckVideoRecorder:*(void *)(a1 + 32) imageDataCaptured:v7 error:0];
      }
    }
  }
}

- (void)dealloc
{
  [(AVCaptureVideoPreviewLayer *)self->_captureVideoPreviewLayer setSession:0];
  [(CKVideoRecorder *)self removeFromParentViewController];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v4 = [(CKVideoRecorder *)self outputFileURL];
  [v3 removeItemAtURL:v4 error:0];

  v5.receiver = self;
  v5.super_class = (Class)CKVideoRecorder;
  [(CKVideoRecorder *)&v5 dealloc];
}

- (id)_cameraWithPosition:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F16440] devicesWithMediaType:*MEMORY[0x1E4F15C18]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "position", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)audioDevice
{
  id v2 = [MEMORY[0x1E4F16440] devicesWithMediaType:*MEMORY[0x1E4F15BA8]];
  if ([v2 count])
  {
    BOOL v3 = [v2 objectAtIndex:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)frontFacingCamera
{
  frontFacingCamera = self->_frontFacingCamera;
  if (!frontFacingCamera)
  {
    id v4 = [(CKVideoRecorder *)self _cameraWithPosition:2];
    uint64_t v5 = self->_frontFacingCamera;
    self->_frontFacingCamera = v4;

    [(CKVideoRecorder *)self setupCamera:self->_frontFacingCamera];
    frontFacingCamera = self->_frontFacingCamera;
  }

  return frontFacingCamera;
}

- (id)rearFacingCamera
{
  rearFacingCamera = self->_rearFacingCamera;
  if (!rearFacingCamera)
  {
    id v4 = [(CKVideoRecorder *)self _cameraWithPosition:1];
    uint64_t v5 = self->_rearFacingCamera;
    self->_rearFacingCamera = v4;

    [(CKVideoRecorder *)self setupCamera:self->_rearFacingCamera];
    rearFacingCamera = self->_rearFacingCamera;
  }

  return rearFacingCamera;
}

- (int64_t)cameraDevice
{
  return self->_currentDevice;
}

- (id)_configureFrontVideoInput
{
  id v3 = objc_alloc(MEMORY[0x1E4F16450]);
  id v4 = [(CKVideoRecorder *)self frontFacingCamera];
  uint64_t v5 = (void *)[v3 initWithDevice:v4 error:0];

  [(CKVideoRecorder *)self setFrontVideoInput:v5];

  return v5;
}

- (id)_configureRearVideoInput
{
  id v3 = objc_alloc(MEMORY[0x1E4F16450]);
  id v4 = [(CKVideoRecorder *)self rearFacingCamera];
  uint64_t v5 = (void *)[v3 initWithDevice:v4 error:0];

  [(CKVideoRecorder *)self setRearVideoInput:v5];

  return v5;
}

- (void)setCameraDevice:(int64_t)a3
{
  if (![(CKVideoRecorder *)self canceled] && self->_currentDevice != a3)
  {
    avCaptureSessionDispatchQueue = self->_avCaptureSessionDispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__CKVideoRecorder_setCameraDevice___block_invoke;
    v6[3] = &unk_1E5622950;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_async(avCaptureSessionDispatchQueue, v6);
    self->_currentDevice = a3;
  }
}

void __35__CKVideoRecorder_setCameraDevice___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) session];
  [v2 beginConfiguration];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) session];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v6 = [v5 rearVideoInput];
    [v4 removeInput:v6];

    uint64_t v7 = [*(id *)(a1 + 32) session];
    id v8 = [*(id *)(a1 + 32) frontVideoInput];
    int v9 = [v7 canAddInput:v8];

    if (!v9) {
      goto LABEL_7;
    }
    id v10 = [*(id *)(a1 + 32) session];
    uint64_t v11 = [*(id *)(a1 + 32) frontVideoInput];
  }
  else
  {
    long long v12 = [v5 frontVideoInput];
    [v4 removeInput:v12];

    long long v13 = [*(id *)(a1 + 32) session];
    long long v14 = [*(id *)(a1 + 32) rearVideoInput];
    int v15 = [v13 canAddInput:v14];

    if (!v15) {
      goto LABEL_7;
    }
    id v10 = [*(id *)(a1 + 32) session];
    uint64_t v11 = [*(id *)(a1 + 32) rearVideoInput];
  }
  id v16 = (void *)v11;
  [v10 addInput:v11];

LABEL_7:
  id v17 = [*(id *)(a1 + 32) session];
  [v17 commitConfiguration];
}

- (void)setupCamera:(id)a3
{
  id v3 = a3;
  if ([v3 hasFlash] && objc_msgSend(v3, "lockForConfiguration:", 0))
  {
    if ([v3 isFlashModeSupported:2]) {
      [v3 setFlashMode:2];
    }
    [v3 unlockForConfiguration];
  }
  if ([v3 hasTorch] && objc_msgSend(v3, "lockForConfiguration:", 0))
  {
    if ([v3 isTorchModeSupported:2]) {
      [v3 setTorchMode:2];
    }
    [v3 unlockForConfiguration];
  }
  if ([v3 isFocusModeSupported:2]
    && [v3 lockForConfiguration:0])
  {
    [v3 setFocusMode:2];
    [v3 unlockForConfiguration];
  }
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v12 = a4;
  id v8 = a6;
  if (![(CKVideoRecorder *)self canceled])
  {
    int v9 = [(CKVideoRecorder *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(CKVideoRecorder *)self delegate];
      [v11 ckVideoRecorder:self videoCaptured:v12 error:v8];
    }
  }
}

- (AVCaptureVideoPreviewLayer)captureVideoPreviewLayer
{
  return self->_captureVideoPreviewLayer;
}

- (void)setCaptureVideoPreviewLayer:(id)a3
{
}

- (CKVideoRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKVideoRecorderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AVCaptureDeviceInput)rearVideoInput
{
  return self->_rearVideoInput;
}

- (void)setRearVideoInput:(id)a3
{
}

- (AVCaptureDeviceInput)frontVideoInput
{
  return self->_frontVideoInput;
}

- (void)setFrontVideoInput:(id)a3
{
}

- (AVCaptureDeviceInput)audioInput
{
  return self->_audioInput;
}

- (void)setAudioInput:(id)a3
{
}

- (AVCaptureMovieFileOutput)videoOutput
{
  return self->_videoOutput;
}

- (void)setVideoOutput:(id)a3
{
}

- (AVCaptureStillImageOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (void)setStillImageOutput:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_frontVideoInput, 0);
  objc_storeStrong((id *)&self->_rearVideoInput, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->_avCaptureSessionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_rearFacingCamera, 0);

  objc_storeStrong((id *)&self->_frontFacingCamera, 0);
}

@end