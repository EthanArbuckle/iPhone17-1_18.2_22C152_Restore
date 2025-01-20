@interface QRCodeReaderViewController
- (AVCaptureDevice)cameraDevice;
- (AVCaptureDeviceInput)cameraInput;
- (AVCaptureSession)captureSession;
- (BOOL)flashState;
- (BOOL)prefersStatusBarHidden;
- (BOOL)setActiveCamera:(int64_t)a3;
- (BOOL)setFlash:(BOOL)a3;
- (CameraTargetView)overlayView;
- (NSTimer)timeoutTimer;
- (QRCodeReaderInputs)inputs;
- (QRCodeReaderViewController)init;
- (UIButton)cancelButton;
- (UIButton)flipButton;
- (UIView)previewView;
- (int64_t)cameraPosition;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancelTapped;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)cleanup;
- (void)finishWithStatusCode:(id)a3 metadata:(id)a4;
- (void)flashTapped;
- (void)flipTapped;
- (void)setCameraDevice:(id)a3;
- (void)setCameraInput:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCancelButton:(id)a3;
- (void)setCaptureSession:(id)a3;
- (void)setFlashState:(BOOL)a3;
- (void)setFlipButton:(id)a3;
- (void)setInputs:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setupCamera;
- (void)setupCodeRecognition;
- (void)setupUI;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)takePictureWithHandler:(id)a3;
- (void)timeout:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation QRCodeReaderViewController

- (QRCodeReaderViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)QRCodeReaderViewController;
  v2 = [(QRCodeReaderViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(QRCodeReaderViewController *)v2 setShouldShowPressHomeLabel:0];
  }
  return v3;
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  [(QRCodeReaderViewController *)self setupCamera];

  [(QRCodeReaderViewController *)self setupUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)QRCodeReaderViewController;
  [(QRCodeReaderViewController *)&v16 viewDidAppear:a3];
  v4 = [(QRCodeReaderViewController *)self captureSession];
  unsigned __int8 v5 = [v4 isRunning];

  if ((v5 & 1) == 0)
  {
    v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting up code recognition", v15, 2u);
    }

    [(QRCodeReaderViewController *)self setupCodeRecognition];
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting capture session", v15, 2u);
    }

    v8 = [(QRCodeReaderViewController *)self captureSession];
    [v8 startRunning];

    v9 = [(QRCodeReaderViewController *)self inputs];
    v10 = [v9 timeout];
    uint64_t v11 = (uint64_t)[v10 integerValue];

    if (v11 >= 1)
    {
      v12 = [(QRCodeReaderViewController *)self inputs];
      v13 = [v12 timeout];
      v14 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeout:", 0, 0, (double)(uint64_t)[v13 integerValue]);
      [(QRCodeReaderViewController *)self setTimeoutTimer:v14];
    }
  }
}

- (void)setupCamera
{
  id v3 = objc_alloc_init((Class)AVCaptureSession);
  [(QRCodeReaderViewController *)self setCaptureSession:v3];

  if ([(QRCodeReaderViewController *)self setActiveCamera:1]) {
    goto LABEL_5;
  }
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000084E0();
  }

  if ([(QRCodeReaderViewController *)self setActiveCamera:2])
  {
LABEL_5:
    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    v6 = [(QRCodeReaderViewController *)self captureSession];
    v7 = +[NSOperationQueue mainQueue];
    id v8 = [v5 addObserverForName:AVCaptureSessionRuntimeErrorNotification object:v6 queue:v7 usingBlock:&stru_10000C348];

    v9 = +[NSNotificationCenter defaultCenter];
    v10 = [(QRCodeReaderViewController *)self captureSession];
    uint64_t v11 = +[NSOperationQueue mainQueue];
    id v12 = [v9 addObserverForName:AVCaptureSessionDidStartRunningNotification object:v10 queue:v11 usingBlock:&stru_10000C368];

    v13 = +[NSNotificationCenter defaultCenter];
    v14 = [(QRCodeReaderViewController *)self captureSession];
    v15 = +[NSOperationQueue mainQueue];
    id v16 = [v13 addObserverForName:AVCaptureSessionDidStopRunningNotification object:v14 queue:v15 usingBlock:&stru_10000C388];

    v17 = +[NSNotificationCenter defaultCenter];
    v18 = [(QRCodeReaderViewController *)self captureSession];
    v19 = +[NSOperationQueue mainQueue];
    id v20 = [v17 addObserverForName:AVCaptureSessionWasInterruptedNotification object:v18 queue:v19 usingBlock:&stru_10000C3A8];

    v21 = +[NSNotificationCenter defaultCenter];
    v22 = [(QRCodeReaderViewController *)self captureSession];
    v23 = +[NSOperationQueue mainQueue];
    id v24 = [v21 addObserverForName:AVCaptureSessionInterruptionEndedNotification object:v22 queue:v23 usingBlock:&stru_10000C3C8];
  }
  else
  {
    v25 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000084AC();
    }

    [(QRCodeReaderViewController *)self finishWithStatusCode:&off_10000C558 metadata:0];
  }
}

- (void)setupCodeRecognition
{
  id v6 = objc_alloc_init((Class)AVCaptureMetadataOutput);
  id v3 = [(QRCodeReaderViewController *)self captureSession];
  [v3 addOutput:v6];

  [v6 setMetadataObjectsDelegate:self queue:&_dispatch_main_q];
  v4 = [(QRCodeReaderViewController *)self inputs];
  unsigned __int8 v5 = [v4 codeTypes];
  [v6 setMetadataObjectTypes:v5];
}

- (void)setupUI
{
  id v3 = +[UIColor blackColor];
  v4 = [(QRCodeReaderViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UIView);
  id v6 = [(QRCodeReaderViewController *)self view];
  [v6 bounds];
  id v7 = [v5 initWithFrame:];
  [(QRCodeReaderViewController *)self setPreviewView:v7];

  id v8 = objc_alloc((Class)AVCaptureVideoPreviewLayer);
  v9 = [(QRCodeReaderViewController *)self captureSession];
  id v10 = [v8 initWithSession:v9];

  if (v10)
  {
    [v10 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    uint64_t v11 = [v10 connection];
    [v11 setVideoRotationAngle:90.0];

    id v12 = [(QRCodeReaderViewController *)self previewView];
    [v12 bounds];
    [v10 setFrame:];

    v13 = [CameraTargetView alloc];
    v14 = [(QRCodeReaderViewController *)self previewView];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [(QRCodeReaderViewController *)self inputs];
    id v24 = [v23 viewfinderInstruction];
    v25 = -[CameraTargetView initWithFrame:instructionText:presentationOptions:](v13, "initWithFrame:instructionText:presentationOptions:", v24, 12, v16, v18, v20, v22);
    [(QRCodeReaderViewController *)self setOverlayView:v25];

    v26 = [(QRCodeReaderViewController *)self overlayView];
    [v26 setDelegate:self];

    v27 = [(QRCodeReaderViewController *)self previewView];
    v28 = [v27 layer];
    [v28 addSublayer:v10];

    v29 = [(QRCodeReaderViewController *)self previewView];
    v30 = [(QRCodeReaderViewController *)self overlayView];
    [v29 addSubview:v30];

    v31 = [(QRCodeReaderViewController *)self view];
    v32 = [(QRCodeReaderViewController *)self previewView];
    [v31 addSubview:v32];
  }
  else
  {
    v33 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100008580();
    }

    [(QRCodeReaderViewController *)self finishWithStatusCode:&off_10000C570 metadata:0];
  }
}

- (void)cleanup
{
  id v3 = [(QRCodeReaderViewController *)self timeoutTimer];

  if (v3)
  {
    v4 = [(QRCodeReaderViewController *)self timeoutTimer];
    [v4 invalidate];
  }
  uint64_t v5 = [(QRCodeReaderViewController *)self cameraDevice];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(QRCodeReaderViewController *)self cameraDevice];
    unsigned int v8 = [v7 isTorchActive];

    if (v8) {
      [(QRCodeReaderViewController *)self setFlash:0];
    }
  }
  uint64_t v9 = [(QRCodeReaderViewController *)self captureSession];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [(QRCodeReaderViewController *)self captureSession];
    unsigned int v12 = [v11 isRunning];

    if (v12)
    {
      v13 = [(QRCodeReaderViewController *)self captureSession];
      [v13 stopRunning];

      [(QRCodeReaderViewController *)self setCaptureSession:0];
    }
  }
}

- (void)finishWithStatusCode:(id)a3 metadata:(id)a4
{
  id v9 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = [(QRCodeReaderViewController *)self result];
    [v7 setData:v6];
  }
  [(QRCodeReaderViewController *)self cleanup];
  unsigned int v8 = [(QRCodeReaderViewController *)self result];
  [v8 setStatusCode:v9];

  [(QRCodeReaderViewController *)self setFinished:1];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v5 = a4;
  id v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v31 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "captureOutput called for %ld objects", buf, 0xCu);
  }

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          double v15 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            double v16 = [v14 stringValue];
            *(_DWORD *)buf = 138412290;
            id v31 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Decoded QR Code: %@", buf, 0xCu);
          }
          double v17 = [v14 stringValue];
          [v7 addObject:v17];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  if ([v7 count]
    && ([(QRCodeReaderViewController *)self isFinished] & 1) == 0)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    v27[0] = @"camera";
    int64_t v19 = [(QRCodeReaderViewController *)self cameraPosition];
    CFStringRef v20 = @"back";
    if (v19 == 2) {
      CFStringRef v20 = @"front";
    }
    v27[1] = @"qrCodes";
    v28[0] = v20;
    v28[1] = v7;
    double v21 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v18 addEntriesFromDictionary:v21];

    [(QRCodeReaderViewController *)self finishWithStatusCode:&off_10000C588 metadata:v18];
  }
}

- (void)timeout:(id)a3
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)cancelTapped
{
  id v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancel button tapped.", v4, 2u);
  }

  [(QRCodeReaderViewController *)self finishWithStatusCode:&off_10000C5B8 metadata:0];
}

- (void)flashTapped
{
  id v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flash button tapped.", v5, 2u);
  }

  [(QRCodeReaderViewController *)self setFlashState:[(QRCodeReaderViewController *)self flashState] ^ 1];
  if ([(QRCodeReaderViewController *)self setFlash:[(QRCodeReaderViewController *)self flashState]])
  {
    v4 = [(QRCodeReaderViewController *)self overlayView];
    [v4 setFlashState:[self flashState]];
  }
}

- (BOOL)setFlash:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QRCodeReaderViewController *)self cameraDevice];

  if (!v5)
  {
    id v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No camera device set. Not changing torch state.", buf, 2u);
    }
    goto LABEL_13;
  }
  id v6 = [(QRCodeReaderViewController *)self cameraDevice];
  if (([v6 isTorchModeSupported:1] & 1) == 0)
  {

    id v9 = 0;
    goto LABEL_10;
  }
  id v7 = [(QRCodeReaderViewController *)self cameraDevice];
  id v17 = 0;
  unsigned int v8 = [v7 lockForConfiguration:&v17];
  id v9 = v17;

  if (!v8)
  {
LABEL_10:
    double v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000085B4(v3, (uint64_t)v9, v15);
    }

LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  id v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting torch state to %d", buf, 8u);
  }

  uint64_t v11 = [(QRCodeReaderViewController *)self flashState];
  unsigned int v12 = [(QRCodeReaderViewController *)self cameraDevice];
  [v12 setTorchMode:v11];

  v13 = [(QRCodeReaderViewController *)self cameraDevice];
  [v13 unlockForConfiguration];

  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (void)flipTapped
{
  BOOL v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Flip button tapped.", (uint8_t *)&v10, 2u);
  }

  int64_t v4 = [(QRCodeReaderViewController *)self cameraPosition];
  if ((id)[(QRCodeReaderViewController *)self cameraPosition] == (id)1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  unsigned int v6 = [(QRCodeReaderViewController *)self setActiveCamera:v5];
  id v7 = DiagnosticLogHandleForCategory();
  unsigned int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully set camera position to %ld", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100008674();
    }

    if (![(QRCodeReaderViewController *)self setActiveCamera:v4])
    {
      id v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100008640();
      }

      [(QRCodeReaderViewController *)self finishWithStatusCode:&off_10000C5D0 metadata:0];
    }
  }
}

- (void)takePictureWithHandler:(id)a3
{
  BOOL v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "take picture call on QRCodeReaderViewController", v4, 2u);
  }
}

- (BOOL)setActiveCamera:(int64_t)a3
{
  [(QRCodeReaderViewController *)self setFlash:0];
  uint64_t v5 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:a3];
  if (v5)
  {
    id v30 = 0;
    id v6 = [objc_alloc((Class)AVCaptureDeviceInput) initWithDevice:v5 error:&v30];
    id v7 = v30;
    BOOL v8 = v6 != 0;
    if (v6)
    {
      id v9 = [(QRCodeReaderViewController *)self captureSession];
      [v9 beginConfiguration];

      int v10 = [(QRCodeReaderViewController *)self cameraInput];

      if (v10)
      {
        uint64_t v11 = [(QRCodeReaderViewController *)self captureSession];
        unsigned int v12 = [(QRCodeReaderViewController *)self cameraInput];
        [v11 removeInput:v12];
      }
      v13 = [(QRCodeReaderViewController *)self captureSession];
      [v13 addInput:v6];

      BOOL v14 = [(QRCodeReaderViewController *)self captureSession];
      [v14 commitConfiguration];

      [(QRCodeReaderViewController *)self setCameraDevice:v5];
      [(QRCodeReaderViewController *)self setCameraInput:v6];
      [(QRCodeReaderViewController *)self setCameraPosition:a3];
      double v15 = [(QRCodeReaderViewController *)self overlayView];
      [v15 setFlashUIEnabled:a3 == 1];

      double v16 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v32 = a3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Successfully set active camera to position %ld", buf, 0xCu);
      }
    }
    else
    {
      double v16 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100008714(a3, v16, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000086A8(a3, v7, v17, v18, v19, v20, v21, v22);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (QRCodeReaderInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (AVCaptureDevice)cameraDevice
{
  return (AVCaptureDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCameraDevice:(id)a3
{
}

- (AVCaptureDeviceInput)cameraInput
{
  return (AVCaptureDeviceInput *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCameraInput:(id)a3
{
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (CameraTargetView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (BOOL)flashState
{
  return self->_flashState;
}

- (void)setFlashState:(BOOL)a3
{
  self->_flashState = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_cameraInput, 0);
  objc_storeStrong((id *)&self->_cameraDevice, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end