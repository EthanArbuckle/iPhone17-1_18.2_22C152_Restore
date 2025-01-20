@interface CameraSensorAnomalyViewController
- (AVCapturePhotoOutput)output;
- (AVCaptureSession)session;
- (BOOL)blueLightStatusActive;
- (BOOL)colorAdaptationStatus;
- (BOOL)drawingMode;
- (BOOL)prefersStatusBarHidden;
- (CBAdaptationClient)adaptationClient;
- (CBBlueLightClient)blueLightClient;
- (CBClient)client;
- (CGPoint)originPoint;
- (CGRect)rectangle;
- (CameraSensorAnomalyInputs)inputs;
- (CameraSensorAnomalyTestImageView)currentImageView;
- (CameraTargetView)overlayView;
- (Class)inputsClass;
- (NSMutableArray)allResults;
- (UIButton)continueButton;
- (UIButton)retakeButton;
- (UIButton)usePhotoButton;
- (UIPanGestureRecognizer)panGesture;
- (UIScrollView)imageScrollView;
- (UITapGestureRecognizer)tapGesture;
- (UIView)bottomBar;
- (UIView)previewView;
- (float)originalScreenBrightness;
- (id)findDevice:(id)a3;
- (id)photoCaptureCompletionHandler;
- (int64_t)currentTag;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)setupCameraPreview;
- (int64_t)setupSessionForDevice:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)addPanGesture;
- (void)addTapGesture;
- (void)addedRectangleView;
- (void)cancel;
- (void)cancelTapped;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)cleanUp;
- (void)continueButtonPressed:(id)a3;
- (void)disableAdaptationAndBlueLightReduction;
- (void)endTestWithStatusCode:(id)a3;
- (void)flashTapped;
- (void)flipTapped;
- (void)hideCameraView;
- (void)panOccurred:(id)a3;
- (void)parseResults;
- (void)removeDrawingModeViews;
- (void)removeResultWithTag:(int64_t)a3;
- (void)removeShape:(id)a3;
- (void)resetBrightness;
- (void)resetColorAdjustmentStates;
- (void)retakeButtonPressed:(id)a3;
- (void)saveAndMaximizeBrightness;
- (void)saveColorAdjustmentStates;
- (void)scrollViewDidZoom:(id)a3;
- (void)setAdaptationClient:(id)a3;
- (void)setAllResults:(id)a3;
- (void)setBlueLightClient:(id)a3;
- (void)setBlueLightStatusActive:(BOOL)a3;
- (void)setBottomBar:(id)a3;
- (void)setClient:(id)a3;
- (void)setColorAdaptationStatus:(BOOL)a3;
- (void)setContinueButton:(id)a3;
- (void)setCurrentImageView:(id)a3;
- (void)setCurrentTag:(int64_t)a3;
- (void)setDrawingMode:(BOOL)a3;
- (void)setImageScrollView:(id)a3;
- (void)setInputs:(id)a3;
- (void)setOriginPoint:(CGPoint)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setOutput:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPanGesture:(id)a3;
- (void)setPhotoCaptureCompletionHandler:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setRectangle:(CGRect)a3;
- (void)setRetakeButton:(id)a3;
- (void)setSession:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setUsePhotoButton:(id)a3;
- (void)setupCamera;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)showCameraView;
- (void)start;
- (void)takePictureWithHandler:(id)a3;
- (void)tapOccurred:(id)a3;
- (void)updateViewConstraints;
- (void)usePhotoButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation CameraSensorAnomalyViewController

- (void)viewDidLoad
{
  [(CameraSensorAnomalyViewController *)self setShouldShowPressHomeLabel:0];
  v3.receiver = self;
  v3.super_class = (Class)CameraSensorAnomalyViewController;
  [(CameraSensorAnomalyViewController *)&v3 viewDidLoad];
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[CameraSensorAnomalyViewController setInputs:](self, "setInputs:", a3, a4);
  [(CameraSensorAnomalyViewController *)self setCurrentTag:1];
  [(CameraSensorAnomalyViewController *)self setDrawingMode:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(CameraSensorAnomalyViewController *)self setAllResults:v5];

  v6 = [(CameraSensorAnomalyViewController *)self inputs];
  unsigned int v7 = [v6 disableAmbientLightAdaptation];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)CBClient);
    [(CameraSensorAnomalyViewController *)self setClient:v8];

    v9 = [(CameraSensorAnomalyViewController *)self client];
    v10 = [v9 blueLightClient];
    [(CameraSensorAnomalyViewController *)self setBlueLightClient:v10];

    v11 = [(CameraSensorAnomalyViewController *)self client];
    v12 = [v11 adaptationClient];
    [(CameraSensorAnomalyViewController *)self setAdaptationClient:v12];
  }
  v13 = +[DSTestAutomation sharedInstance];
  unsigned int v14 = [v13 testAutomationEnabled];

  if (v14)
  {
    v33[0] = @"predicates";
    CFStringRef v31 = @"identifier";
    v30 = [(CameraSensorAnomalyViewController *)self inputs];
    v29 = [v30 identifier];
    v32 = v29;
    v28 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v34[0] = v28;
    v33[1] = @"minimumSquareLength";
    v27 = [(CameraSensorAnomalyViewController *)self inputs];
    [v27 minimumSquareLength];
    v26 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v34[1] = v26;
    v33[2] = @"enableMaxBrightness";
    v25 = [(CameraSensorAnomalyViewController *)self inputs];
    v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 enableMaxBrightness]);
    v34[2] = v15;
    v33[3] = @"flashModeOn";
    v16 = [(CameraSensorAnomalyViewController *)self inputs];
    v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 flashModeOn]);
    v34[3] = v17;
    v33[4] = @"viewfinderInstruction";
    v18 = [(CameraSensorAnomalyViewController *)self inputs];
    v19 = [v18 viewfinderInstruction];
    v34[4] = v19;
    v33[5] = @"drawColor";
    v20 = [(CameraSensorAnomalyViewController *)self inputs];
    v21 = [v20 drawColor];
    v34[5] = v21;
    v33[6] = @"disableAmbientLightAdaptation";
    v22 = [(CameraSensorAnomalyViewController *)self inputs];
    v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 disableAmbientLightAdaptation]);
    v34[6] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:7];
    +[DSTestAutomation postConfiguration:v24];
  }
}

- (Class)inputsClass
{
  return (Class)_objc_opt_class(CameraSensorAnomalyInputs, a2);
}

- (void)start
{
  objc_super v3 = +[UIColor blackColor];
  v4 = [(CameraSensorAnomalyViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(CameraSensorAnomalyViewController *)self inputs];
  LODWORD(v4) = [v5 enableMaxBrightness];

  if (v4) {
    [(CameraSensorAnomalyViewController *)self saveAndMaximizeBrightness];
  }
  v6 = [(CameraSensorAnomalyViewController *)self inputs];
  unsigned int v7 = [v6 disableAmbientLightAdaptation];

  if (v7)
  {
    [(CameraSensorAnomalyViewController *)self saveColorAdjustmentStates];
    [(CameraSensorAnomalyViewController *)self disableAdaptationAndBlueLightReduction];
  }

  [(CameraSensorAnomalyViewController *)self setupCamera];
}

- (void)cancel
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002B40;
  block[3] = &unk_100010348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanUp
{
  [(CameraSensorAnomalyViewController *)self resetBrightness];
  objc_super v3 = [(CameraSensorAnomalyViewController *)self inputs];
  unsigned int v4 = [v3 disableAmbientLightAdaptation];

  if (v4) {
    [(CameraSensorAnomalyViewController *)self resetColorAdjustmentStates];
  }
  id v5 = [(CameraSensorAnomalyViewController *)self session];

  if (v5)
  {
    v6 = [(CameraSensorAnomalyViewController *)self session];
    unsigned int v7 = [v6 isRunning];

    if (v7)
    {
      id v8 = [(CameraSensorAnomalyViewController *)self session];
      [v8 stopRunning];

      v9 = +[DSTestAutomation sharedInstance];
      unsigned int v10 = [v9 testAutomationEnabled];

      if (v10)
      {
        v11 = +[NSNotificationCenter defaultCenter];
        v12 = [(CameraSensorAnomalyViewController *)self session];
        [v11 removeObserver:self name:AVCaptureSessionDidStartRunningNotification object:v12];
      }
      [(CameraSensorAnomalyViewController *)self setSession:0];
    }
  }
}

- (void)setupCamera
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = [(CameraSensorAnomalyViewController *)self inputs];
    unsigned int v4 = [v3 identifier];
    int v30 = 138412290;
    CFStringRef v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "self.inputs.identifier: %@", (uint8_t *)&v30, 0xCu);
  }
  id v5 = [(CameraSensorAnomalyViewController *)self inputs];
  v6 = [v5 identifier];
  unsigned int v7 = [(CameraSensorAnomalyViewController *)self findDevice:v6];

  if (!v7)
  {
    int64_t v8 = -3;
LABEL_8:
    v29 = +[NSNumber numberWithInteger:v8];
    [(CameraSensorAnomalyViewController *)self endTestWithStatusCode:v29];
    goto LABEL_9;
  }
  int64_t v8 = [(CameraSensorAnomalyViewController *)self setupSessionForDevice:v7];
  if (v8) {
    goto LABEL_8;
  }
  int64_t v8 = [(CameraSensorAnomalyViewController *)self setupCameraPreview];
  if (v8) {
    goto LABEL_8;
  }
  v9 = +[NSNotificationCenter defaultCenter];
  unsigned int v10 = [(CameraSensorAnomalyViewController *)self session];
  v11 = +[NSOperationQueue mainQueue];
  id v12 = [v9 addObserverForName:AVCaptureSessionRuntimeErrorNotification object:v10 queue:v11 usingBlock:&stru_100010388];

  v13 = +[NSNotificationCenter defaultCenter];
  unsigned int v14 = [(CameraSensorAnomalyViewController *)self session];
  v15 = +[NSOperationQueue mainQueue];
  id v16 = [v13 addObserverForName:AVCaptureSessionDidStartRunningNotification object:v14 queue:v15 usingBlock:&stru_1000103A8];

  v17 = +[NSNotificationCenter defaultCenter];
  v18 = [(CameraSensorAnomalyViewController *)self session];
  v19 = +[NSOperationQueue mainQueue];
  id v20 = [v17 addObserverForName:AVCaptureSessionDidStopRunningNotification object:v18 queue:v19 usingBlock:&stru_1000103C8];

  v21 = +[NSNotificationCenter defaultCenter];
  v22 = [(CameraSensorAnomalyViewController *)self session];
  v23 = +[NSOperationQueue mainQueue];
  id v24 = [v21 addObserverForName:AVCaptureSessionWasInterruptedNotification object:v22 queue:v23 usingBlock:&stru_1000103E8];

  v25 = +[NSNotificationCenter defaultCenter];
  v26 = [(CameraSensorAnomalyViewController *)self session];
  v27 = +[NSOperationQueue mainQueue];
  id v28 = [v25 addObserverForName:AVCaptureSessionInterruptionEndedNotification object:v26 queue:v27 usingBlock:&stru_100010408];

  [(CameraSensorAnomalyViewController *)self showCameraView];
  v29 = [(CameraSensorAnomalyViewController *)self session];
  [v29 startRunning];
LABEL_9:
}

- (id)findDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Front"])
  {
    unsigned int v4 = (id *)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
    uint64_t v5 = 2;
  }
  else
  {
    if ([v3 isEqualToString:@"Rear"])
    {
      unsigned int v4 = (id *)&AVCaptureDeviceTypeBuiltInWideAngleCamera;
    }
    else if ([v3 isEqualToString:@"RearTelephoto"])
    {
      unsigned int v4 = (id *)&AVCaptureDeviceTypeBuiltInTelephotoCamera;
    }
    else if ([v3 isEqualToString:@"RearSuperWide"])
    {
      unsigned int v4 = (id *)&AVCaptureDeviceTypeBuiltInUltraWideCamera;
    }
    else
    {
      if (![v3 isEqualToString:@"RearSynced"])
      {
        unsigned int v7 = 0;
        goto LABEL_18;
      }
      unsigned int v4 = (id *)&AVCaptureDeviceTypeBuiltInDualCamera;
    }
    uint64_t v5 = 1;
  }
  id v6 = *v4;
  unsigned int v7 = v6;
  if (v6)
  {
    id v27 = v6;
    int64_t v8 = +[NSArray arrayWithObjects:&v27 count:1];
    v9 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v8 mediaType:AVMediaTypeVideo position:v5];

    unsigned int v10 = [v9 devices];
    id v11 = [v10 count];

    if (v11)
    {
      id v12 = [v9 devices];
      v13 = [v12 firstObject];

      if (v13)
      {
        unsigned int v14 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [v13 deviceType];
          int v23 = 138412546;
          id v24 = v13;
          __int16 v25 = 2112;
          v26 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requested device found: %@, %@", (uint8_t *)&v23, 0x16u);
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
LABEL_18:
  unsigned int v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000093A4((uint64_t)v3, v14, v16, v17, v18, v19, v20, v21);
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (int64_t)setupSessionForDevice:(id)a3
{
  id v32 = 0;
  unsigned int v4 = +[AVCaptureDeviceInput deviceInputWithDevice:a3 error:&v32];
  id v5 = v32;
  if (v4)
  {
    id v6 = objc_alloc_init((Class)AVCapturePhotoOutput);
    [(CameraSensorAnomalyViewController *)self setOutput:v6];

    unsigned int v7 = [(CameraSensorAnomalyViewController *)self output];
    [v7 setLivePhotoCaptureEnabled:0];

    id v8 = objc_alloc_init((Class)AVCaptureSession);
    [(CameraSensorAnomalyViewController *)self setSession:v8];

    v9 = [(CameraSensorAnomalyViewController *)self session];
    [v9 setSessionPreset:AVCaptureSessionPresetPhoto];

    unsigned int v10 = [(CameraSensorAnomalyViewController *)self session];
    if ([v10 canAddInput:v4])
    {
      id v11 = [(CameraSensorAnomalyViewController *)self session];
      id v12 = [(CameraSensorAnomalyViewController *)self output];
      unsigned int v13 = [v11 canAddOutput:v12];

      if (v13)
      {
        unsigned int v14 = [(CameraSensorAnomalyViewController *)self session];
        [v14 addInput:v4];

        v15 = [(CameraSensorAnomalyViewController *)self session];
        uint64_t v16 = [(CameraSensorAnomalyViewController *)self output];
        [v15 addOutput:v16];

        int64_t v17 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000947C(v15, v24, v25, v26, v27, v28, v29, v30);
    }
    int64_t v17 = -5;
  }
  else
  {
    v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100009410((uint64_t)v5, v15, v18, v19, v20, v21, v22, v23);
    }
    int64_t v17 = -4;
  }
LABEL_12:

  return v17;
}

- (int64_t)setupCameraPreview
{
  id v3 = objc_alloc((Class)UIView);
  unsigned int v4 = [(CameraSensorAnomalyViewController *)self view];
  [v4 bounds];
  id v5 = [v3 initWithFrame:];
  [(CameraSensorAnomalyViewController *)self setPreviewView:v5];

  id v6 = [(CameraSensorAnomalyViewController *)self session];
  unsigned int v7 = +[AVCaptureVideoPreviewLayer layerWithSession:v6];

  if (v7)
  {
    [v7 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    id v8 = [v7 connection];
    [v8 setVideoRotationAngle:90.0];

    v9 = [(CameraSensorAnomalyViewController *)self previewView];
    [v9 bounds];
    [v7 setFrame:];

    unsigned int v10 = [CameraTargetView alloc];
    id v11 = [(CameraSensorAnomalyViewController *)self previewView];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = +[UIColor orangeColor];
    uint64_t v21 = [(CameraSensorAnomalyViewController *)self inputs];
    uint64_t v22 = [v21 viewfinderInstruction];
    uint64_t v23 = -[CameraTargetView initWithFrame:color:thickness:instructionText:presentationOptions:](v10, "initWithFrame:color:thickness:instructionText:presentationOptions:", v20, v22, 3, v13, v15, v17, v19, 2.0);
    [(CameraSensorAnomalyViewController *)self setOverlayView:v23];

    uint64_t v24 = [(CameraSensorAnomalyViewController *)self overlayView];
    [v24 setUserInteractionEnabled:1];

    uint64_t v25 = [(CameraSensorAnomalyViewController *)self overlayView];
    [v25 setDelegate:self];

    uint64_t v26 = [(CameraSensorAnomalyViewController *)self previewView];
    uint64_t v27 = [v26 layer];
    [v27 addSublayer:v7];

    uint64_t v28 = [(CameraSensorAnomalyViewController *)self previewView];
    uint64_t v29 = [(CameraSensorAnomalyViewController *)self overlayView];
    [v28 addSubview:v29];

    int64_t v30 = 0;
  }
  else
  {
    CFStringRef v31 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000094B4(v31, v32, v33, v34, v35, v36, v37, v38);
    }

    int64_t v30 = -6;
  }

  return v30;
}

- (void)showCameraView
{
  id v3 = [(CameraSensorAnomalyViewController *)self view];
  unsigned int v4 = [(CameraSensorAnomalyViewController *)self previewView];
  [v3 addSubview:v4];

  id v5 = +[DSTestAutomation sharedInstance];
  LODWORD(v3) = [v5 testAutomationEnabled];

  if (v3)
  {
    +[DSTestAutomation postInteractiveTestEvent:@"ViewDidChange" info:&off_100010B18];
  }
}

- (void)hideCameraView
{
  id v2 = [(CameraSensorAnomalyViewController *)self previewView];
  [v2 removeFromSuperview];
}

- (void)addPanGesture
{
  id v3 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"panOccurred:"];
  [(CameraSensorAnomalyViewController *)self setPanGesture:v3];

  unsigned int v4 = [(CameraSensorAnomalyViewController *)self panGesture];
  [v4 setMaximumNumberOfTouches:1];

  id v5 = [(CameraSensorAnomalyViewController *)self panGesture];
  [v5 setMinimumNumberOfTouches:1];

  id v6 = [(CameraSensorAnomalyViewController *)self panGesture];
  [v6 setDelegate:self];

  id v9 = [(CameraSensorAnomalyViewController *)self currentImageView];
  unsigned int v7 = [v9 drawableView];
  id v8 = [(CameraSensorAnomalyViewController *)self panGesture];
  [v7 addGestureRecognizer:v8];
}

- (void)addTapGesture
{
  id v3 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tapOccurred:"];
  [(CameraSensorAnomalyViewController *)self setTapGesture:v3];

  unsigned int v4 = [(CameraSensorAnomalyViewController *)self tapGesture];
  [v4 setDelegate:self];

  id v7 = [(CameraSensorAnomalyViewController *)self currentImageView];
  id v5 = [v7 drawableView];
  id v6 = [(CameraSensorAnomalyViewController *)self tapGesture];
  [v5 addGestureRecognizer:v6];
}

- (void)panOccurred:(id)a3
{
  id v54 = a3;
  if ([v54 state] == (id)1)
  {
    id v5 = [(CameraSensorAnomalyViewController *)self currentImageView];
    id v6 = [v5 drawableView];
    [v54 locationInView:v6];
    -[CameraSensorAnomalyViewController setOriginPoint:](self, "setOriginPoint:");
  }
  id v7 = [v54 state];
  id v8 = [(CameraSensorAnomalyViewController *)self currentImageView];
  id v9 = [v8 drawableView];
  unsigned int v10 = v9;
  if (v7 == (id)3)
  {
    [v9 endDrawing];

    [(CameraSensorAnomalyViewController *)self addedRectangleView];
  }
  else
  {
    [v54 locationInView:v9];
    double v12 = v11;
    double v14 = v13;

    double v15 = [(CameraSensorAnomalyViewController *)self currentImageView];
    double v16 = [v15 drawableView];
    [v16 bounds];
    v56.x = v12;
    v56.y = v14;
    BOOL v17 = CGRectContainsPoint(v57, v56);

    if (v17)
    {
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v19 = vabdd_f64(v18, v12);
      uint64_t v20 = [(CameraSensorAnomalyViewController *)self inputs];
      [v20 minimumSquareLength];
      double v22 = v21;
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v24 = v23;
      if (v19 >= v22)
      {
        int v28 = 0;
        if (v23 >= v12) {
          double v26 = v12;
        }
        else {
          double v26 = v23;
        }
      }
      else
      {
        [(CameraSensorAnomalyViewController *)self originPoint];
        double v26 = v25;
        if (v12 >= v24)
        {
          int v28 = 0;
        }
        else
        {
          double v16 = [(CameraSensorAnomalyViewController *)self inputs];
          [v16 minimumSquareLength];
          double v26 = v26 - v27;
          int v28 = 1;
        }
      }
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v30 = vabdd_f64(v29, v14);
      CFStringRef v31 = [(CameraSensorAnomalyViewController *)self inputs];
      [v31 minimumSquareLength];
      double v33 = v32;
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v35 = v34;
      if (v30 >= v33)
      {
        int v39 = 0;
        if (v34 >= v14) {
          double v37 = v14;
        }
        else {
          double v37 = v34;
        }
      }
      else
      {
        [(CameraSensorAnomalyViewController *)self originPoint];
        double v37 = v36;
        if (v14 >= v35)
        {
          int v39 = 0;
        }
        else
        {
          id v3 = [(CameraSensorAnomalyViewController *)self inputs];
          [v3 minimumSquareLength];
          double v37 = v37 - v38;
          int v39 = 1;
        }
      }
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v41 = vabdd_f64(v40, v12);
      v42 = [(CameraSensorAnomalyViewController *)self inputs];
      [v42 minimumSquareLength];
      float v44 = v43;

      if (v41 >= v44) {
        double v45 = v41;
      }
      else {
        double v45 = v44;
      }
      [(CameraSensorAnomalyViewController *)self originPoint];
      double v47 = vabdd_f64(v46, v14);
      v48 = [(CameraSensorAnomalyViewController *)self inputs];
      [v48 minimumSquareLength];
      float v50 = v49;

      if (v47 >= v50) {
        double v51 = v47;
      }
      else {
        double v51 = v50;
      }
      -[CameraSensorAnomalyViewController setRectangle:](self, "setRectangle:", v26, v37, v45, v51);
      if (v39) {

      }
      if (v28) {
      v52 = [(CameraSensorAnomalyViewController *)self currentImageView];
      }
      v53 = [v52 drawableView];
      [(CameraSensorAnomalyViewController *)self rectangle];
      [v53 updateDrawing:];
    }
  }
}

- (void)tapOccurred:(id)a3
{
  id v4 = a3;
  id v5 = [(CameraSensorAnomalyViewController *)self currentImageView];
  id v6 = [v5 drawableView];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  -[CameraSensorAnomalyViewController setOriginPoint:](self, "setOriginPoint:", v8, v10);
  [(CameraSensorAnomalyViewController *)self originPoint];
  double v12 = v11;
  double v13 = [(CameraSensorAnomalyViewController *)self inputs];
  [v13 minimumSquareLength];
  double v15 = v12 - (float)(v14 * 0.5);
  [(CameraSensorAnomalyViewController *)self originPoint];
  double v17 = v16;
  double v18 = [(CameraSensorAnomalyViewController *)self inputs];
  [v18 minimumSquareLength];
  double v20 = v17 - (float)(v19 * 0.5);
  float v21 = [(CameraSensorAnomalyViewController *)self inputs];
  [v21 minimumSquareLength];
  double v23 = v22;
  double v24 = [(CameraSensorAnomalyViewController *)self inputs];
  [v24 minimumSquareLength];
  -[CameraSensorAnomalyViewController setRectangle:](self, "setRectangle:", v15, v20, v23, v25);

  [(CameraSensorAnomalyViewController *)self addedRectangleView];
}

- (void)removeShape:(id)a3
{
  id v4 = [a3 view];
  id v5 = [(CameraSensorAnomalyViewController *)self inputs];
  id v6 = [v5 drawColor];
  [v4 setBackgroundColor:v6];

  double v7 = +[NSBundle mainBundle];
  double v8 = [v7 localizedStringForKey:@"REMOVE_ITEM" value:&stru_1000106F0 table:0];
  double v9 = +[UIAlertController alertControllerWithTitle:v8 message:0 preferredStyle:1];

  double v10 = +[NSBundle mainBundle];
  double v11 = [v10 localizedStringForKey:@"REMOVE" value:&stru_1000106F0 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000449C;
  v20[3] = &unk_100010430;
  id v12 = v4;
  id v21 = v12;
  float v22 = self;
  double v13 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v20];
  [v9 addAction:v13];

  float v14 = +[NSBundle mainBundle];
  double v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1000106F0 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000044E4;
  v18[3] = &unk_100010458;
  id v19 = v12;
  id v16 = v12;
  double v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v18];
  [v9 addAction:v17];

  [(CameraSensorAnomalyViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)addedRectangleView
{
  [(CameraSensorAnomalyViewController *)self rectangle];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CameraSensorAnomalyViewController *)self inputs];
  id v12 = [v11 drawColor];
  double v13 = +[UIColor clearColor];
  float v14 = +[DSShapeView rectangleWithFrame:borderColor:fillColor:](DSShapeView, "rectangleWithFrame:borderColor:fillColor:", v12, v13, v4, v6, v8, v10);

  [v14 setTag:[self currentTag]];
  [(CameraSensorAnomalyViewController *)self setCurrentTag:(char *)[(CameraSensorAnomalyViewController *)self currentTag] + 1];
  id v15 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"removeShape:"];
  [v14 addGestureRecognizer:v15];

  id v16 = [(CameraSensorAnomalyViewController *)self currentImageView];
  double v17 = [v16 drawableView];
  [v17 addSubview:v14];

  double v18 = [(CameraSensorAnomalyViewController *)self currentImageView];
  id v19 = [v18 drawableView];
  [v14 frame];
  double v21 = v20;
  double v23 = v22;
  double v24 = [(CameraSensorAnomalyViewController *)self view];
  [v19 convertPoint:v24 toView:v21];
  double v26 = v25;
  double v28 = v27;

  v43[0] = @"xPos";
  v42 = [(CameraSensorAnomalyViewController *)self imageScrollView];
  [v42 zoomScale];
  double v30 = +[NSNumber numberWithDouble:v26 / v29];
  v44[0] = v30;
  v43[1] = @"yPos";
  CFStringRef v31 = [(CameraSensorAnomalyViewController *)self imageScrollView];
  [v31 zoomScale];
  double v33 = +[NSNumber numberWithDouble:v28 / v32];
  v44[1] = v33;
  v43[2] = @"width";
  [v14 frame];
  double v35 = +[NSNumber numberWithDouble:v34];
  v44[2] = v35;
  v43[3] = @"height";
  [v14 frame];
  double v37 = +[NSNumber numberWithDouble:v36];
  v44[3] = v37;
  v43[4] = @"tag";
  float v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 tag]);
  v44[4] = v38;
  v43[5] = @"brightness";
  BKSDisplayBrightnessGetCurrent();
  int v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v44[5] = v39;
  double v40 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:6];

  double v41 = [(CameraSensorAnomalyViewController *)self allResults];
  [v41 addObject:v40];
}

- (void)removeDrawingModeViews
{
  double v3 = [(CameraSensorAnomalyViewController *)self imageScrollView];
  [v3 removeFromSuperview];

  id v4 = [(CameraSensorAnomalyViewController *)self bottomBar];
  [v4 removeFromSuperview];
}

- (void)retakeButtonPressed:(id)a3
{
  [(CameraSensorAnomalyViewController *)self removeDrawingModeViews];
  [(CameraSensorAnomalyViewController *)self setDrawingMode:0];

  [(CameraSensorAnomalyViewController *)self showCameraView];
}

- (void)usePhotoButtonPressed:(id)a3
{
  id v4 = [(CameraSensorAnomalyViewController *)self retakeButton];
  [v4 setHidden:1];

  double v5 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
  [v5 setHidden:1];

  double v6 = [(CameraSensorAnomalyViewController *)self continueButton];
  [v6 setHidden:0];

  double v7 = [(CameraSensorAnomalyViewController *)self currentImageView];
  [v7 setUserInteractionEnabled:1];

  double v8 = [(CameraSensorAnomalyViewController *)self imageScrollView];
  [v8 setMaximumZoomScale:3.0];

  [(CameraSensorAnomalyViewController *)self addPanGesture];
  [(CameraSensorAnomalyViewController *)self addTapGesture];
  double v9 = +[DSTestAutomation sharedInstance];
  LODWORD(v8) = [v9 testAutomationEnabled];

  if (v8)
  {
    +[DSTestAutomation postInteractiveTestEvent:@"ViewDidChange" info:&off_100010B40];
  }
}

- (void)continueButtonPressed:(id)a3
{
  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"CAMERA_SENSOR_ANOMALY_TOOL_COMPLETE_TITLE" value:&stru_1000106F0 table:0];
  double v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"CAMERA_SENSOR_ANOMALY_TOOL_COMPLETE_MESSAGE" value:&stru_1000106F0 table:0];
  double v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"GO_BACK" value:&stru_1000106F0 table:0];
  double v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v8 addAction:v11];

  id v12 = +[NSBundle mainBundle];
  double v13 = [v12 localizedStringForKey:@"DONE" value:&stru_1000106F0 table:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004C8C;
  v15[3] = &unk_100010458;
  v15[4] = self;
  float v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];
  [v8 addAction:v14];

  [(CameraSensorAnomalyViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  [(CameraSensorAnomalyViewController *)self cleanUp];
  double v5 = [(CameraSensorAnomalyViewController *)self result];
  [v5 setStatusCode:v4];

  [(CameraSensorAnomalyViewController *)self parseResults];

  [(CameraSensorAnomalyViewController *)self setFinished:1];
}

- (void)parseResults
{
  double v3 = [(CameraSensorAnomalyViewController *)self result];
  id v4 = [v3 statusCode];
  unsigned int v5 = [v4 isEqualToNumber:&off_100010BC0];

  if (v5)
  {
    double v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000094EC(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = [(CameraSensorAnomalyViewController *)self result];
    [v14 setData:&__NSDictionary0__struct];
  }
  else
  {
    id v15 = objc_alloc((Class)NSMutableArray);
    id v16 = [(CameraSensorAnomalyViewController *)self allResults];
    id v14 = [v15 initWithCapacity:[v16 count]];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v17 = [(CameraSensorAnomalyViewController *)self allResults];
    id v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        double v21 = 0;
        do
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v21) mutableCopy];
          [v22 removeObjectForKey:@"tag"];
          [v14 addObject:v22];

          double v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v19);
    }

    id v23 = [v14 copy];
    [(CameraSensorAnomalyViewController *)self setAllResults:v23];

    v37[0] = @"displayResX";
    double v24 = +[UIScreen mainScreen];
    [v24 bounds];
    double v26 = +[NSNumber numberWithDouble:v25];
    v38[0] = v26;
    v37[1] = @"displayResY";
    double v27 = +[UIScreen mainScreen];
    [v27 bounds];
    double v29 = +[NSNumber numberWithDouble:v28];
    v38[1] = v29;
    v37[2] = @"anomaliesDetected";
    double v30 = [(CameraSensorAnomalyViewController *)self allResults];
    v38[2] = v30;
    CFStringRef v31 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    double v32 = [(CameraSensorAnomalyViewController *)self result];
    [v32 setData:v31];
  }
}

- (void)removeResultWithTag:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v5 = [(CameraSensorAnomalyViewController *)self allResults];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"tag"];
        id v12 = [v11 integerValue];

        if (v12 == (id)a3)
        {
          uint64_t v13 = [(CameraSensorAnomalyViewController *)self allResults];
          [v13 removeObject:v10];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)saveColorAdjustmentStates
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  double v3 = [(CameraSensorAnomalyViewController *)self blueLightClient];
  [v3 getBlueLightStatus:v5];

  [(CameraSensorAnomalyViewController *)self setBlueLightStatusActive:LOBYTE(v5[0])];
  id v4 = [(CameraSensorAnomalyViewController *)self adaptationClient];
  -[CameraSensorAnomalyViewController setColorAdaptationStatus:](self, "setColorAdaptationStatus:", [v4 getEnabled]);
}

- (void)resetColorAdjustmentStates
{
  double v3 = [(CameraSensorAnomalyViewController *)self blueLightClient];
  [v3 setActive:[self blueLightStatusActive]];

  id v4 = [(CameraSensorAnomalyViewController *)self adaptationClient];
  [v4 setEnabled:[self colorAdaptationStatus]];
}

- (void)disableAdaptationAndBlueLightReduction
{
  double v3 = [(CameraSensorAnomalyViewController *)self blueLightClient];
  [v3 setActive:0];

  id v4 = [(CameraSensorAnomalyViewController *)self adaptationClient];
  [v4 setEnabled:0];
}

- (void)saveAndMaximizeBrightness
{
  BKSDisplayBrightnessGetCurrent();
  -[CameraSensorAnomalyViewController setOriginalScreenBrightness:](self, "setOriginalScreenBrightness:");
  id v3 = +[UIScreen mainScreen];
  [v3 setBrightness:1.0];
}

- (void)resetBrightness
{
  id v3 = [(CameraSensorAnomalyViewController *)self inputs];
  unsigned int v4 = [v3 enableMaxBrightness];

  if (v4)
  {
    id v6 = +[UIScreen mainScreen];
    [(CameraSensorAnomalyViewController *)self originalScreenBrightness];
    [v6 setBrightness:v5];
  }
}

- (void)flipTapped
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "flip tapped call on QRCodeReaderViewController", v3, 2u);
  }
}

- (void)flashTapped
{
  id v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "flash tapped call on QRCodeReaderViewController", v3, 2u);
  }
}

- (void)cancelTapped
{
}

- (void)takePictureWithHandler:(id)a3
{
  [(CameraSensorAnomalyViewController *)self setPhotoCaptureCompletionHandler:a3];
  id v6 = +[AVCapturePhotoSettings photoSettings];
  unsigned int v4 = [(CameraSensorAnomalyViewController *)self inputs];
  [v6 setFlashMode:[v4 flashModeOn]];

  float v5 = [(CameraSensorAnomalyViewController *)self output];
  [v5 capturePhotoWithSettings:v6 delegate:self];
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(CameraSensorAnomalyViewController *)self hideCameraView];
  uint64_t v9 = [(CameraSensorAnomalyViewController *)self photoCaptureCompletionHandler];

  if (v9)
  {
    uint64_t v10 = [(CameraSensorAnomalyViewController *)self photoCaptureCompletionHandler];
    v10[2]();

    [(CameraSensorAnomalyViewController *)self setPhotoCaptureCompletionHandler:0];
  }
  uint64_t v11 = [CameraSensorAnomalyTestImageView alloc];
  id v12 = [(CameraSensorAnomalyViewController *)self view];
  [v12 frame];
  uint64_t v13 = -[CameraSensorAnomalyTestImageView initWithFrame:](v11, "initWithFrame:");
  [(CameraSensorAnomalyViewController *)self setCurrentImageView:v13];

  uint64_t v14 = [v8 fileDataRepresentation];

  v189 = (void *)v14;
  if (v14
    && (+[UIScreen mainScreen],
        long long v15 = objc_claimAutoreleasedReturnValue(),
        [v15 scale],
        +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v14),
        long long v16 = objc_claimAutoreleasedReturnValue(),
        v15,
        v16))
  {
    id v188 = v7;
    [(CameraSensorAnomalyViewController *)self setDrawingMode:1];
    long long v17 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v17 setImage:v16];

    id v18 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v18 bounds];
    double v20 = v19;
    double v21 = [(CameraSensorAnomalyViewController *)self currentImageView];
    id v22 = [v21 image];
    [v22 size];
    float v24 = v20 / v23;

    double v25 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v25 bounds];
    double v27 = v26;
    double v28 = [(CameraSensorAnomalyViewController *)self currentImageView];
    double v29 = [v28 image];
    [v29 size];
    float v31 = v27 / v30;

    if (v24 < v31) {
      float v31 = v24;
    }
    double v32 = [(CameraSensorAnomalyViewController *)self currentImageView];
    long long v33 = [v32 image];
    [v33 size];
    double v34 = v31;
    float v36 = v35 * v34;

    double v37 = [(CameraSensorAnomalyViewController *)self currentImageView];
    float v38 = [v37 image];
    [v38 size];
    *(float *)&double v34 = v39 * v34;

    double v40 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v40 frame];
    double v41 = *(float *)&v34;
    double v43 = (v42 - v41) * 0.5;

    float v44 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v44 setFrame:0.0, v43, v36, v41];

    double v45 = [DADrawableView alloc];
    double v46 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v46 frame];
    double v48 = v47;
    float v49 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v49 frame];
    double v51 = v50;
    v52 = +[UIColor clearColor];
    v53 = [(CameraSensorAnomalyViewController *)self inputs];
    id v54 = [v53 drawColor];
    v55 = -[DADrawableView initWithFrame:rectangleFillColor:rectangleEdgeColor:](v45, "initWithFrame:rectangleFillColor:rectangleEdgeColor:", v52, v54, 0.0, 0.0, v48, v51);
    CGPoint v56 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v56 setDrawableView:v55];

    CGRect v57 = [(CameraSensorAnomalyViewController *)self currentImageView];
    v58 = [(CameraSensorAnomalyViewController *)self currentImageView];
    v59 = [v58 drawableView];
    [v57 addSubview:v59];

    id v60 = objc_alloc((Class)UIScrollView);
    v61 = [(CameraSensorAnomalyViewController *)self view];
    [v61 frame];
    double v63 = v62;
    v64 = [(CameraSensorAnomalyViewController *)self view];
    [v64 frame];
    id v66 = [v60 initWithFrame:0.0, 0.0, v63, v65 - 85.0];
    [(CameraSensorAnomalyViewController *)self setImageScrollView:v66];

    v67 = [(CameraSensorAnomalyViewController *)self currentImageView];
    v68 = [v67 drawableView];
    [v68 frame];
    double v70 = v69;
    double v72 = v71;
    v73 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v73 setContentSize:v70, v72];

    v74 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v74 setShowsHorizontalScrollIndicator:0];

    v75 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v75 setShowsVerticalScrollIndicator:0];

    v76 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v76 setScrollsToTop:0];

    v77 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v77 setDelegate:self];

    v78 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v78 setBouncesZoom:1];

    v79 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v79 setDecelerationRate:UIScrollViewDecelerationRateFast];

    v80 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    v81 = [v80 panGestureRecognizer];
    [v81 setMinimumNumberOfTouches:2];

    v82 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    v83 = [(CameraSensorAnomalyViewController *)self currentImageView];
    [v82 addSubview:v83];

    id v84 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(CameraSensorAnomalyViewController *)self setBottomBar:v84];

    v85 = [(CameraSensorAnomalyViewController *)self bottomBar];
    [v85 setOpaque:0];

    v86 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    v87 = [(CameraSensorAnomalyViewController *)self bottomBar];
    [v87 setBackgroundColor:v86];

    v88 = [(CameraSensorAnomalyViewController *)self bottomBar];
    [v88 setTranslatesAutoresizingMaskIntoConstraints:0];

    v89 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    v90 = +[UIFont fontWithDescriptor:v89 size:18.0];

    v91 = +[UIButton buttonWithType:1];
    [(CameraSensorAnomalyViewController *)self setRetakeButton:v91];

    v92 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v92 setOpaque:0];

    v93 = +[UIColor clearColor];
    v94 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v94 setBackgroundColor:v93];

    v95 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v96 = [v95 titleLabel];
    [v96 setContentMode:7];

    v97 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v98 = [v97 titleLabel];
    [v98 setTextAlignment:1];

    v99 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v100 = [v99 titleLabel];
    [v100 setLineBreakMode:4];

    v101 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v102 = [v101 titleLabel];
    [v102 setFont:v90];

    v103 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v104 = [v103 titleLabel];
    [v104 setNumberOfLines:1];

    v105 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v106 = +[NSBundle mainBundle];
    v107 = [v106 localizedStringForKey:@"RETAKE" value:&stru_1000106F0 table:0];
    [v105 setTitle:v107 forState:0];

    v108 = [(CameraSensorAnomalyViewController *)self retakeButton];
    v109 = +[UIColor whiteColor];
    [v108 setTitleColor:v109 forState:0];

    v110 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v110 sizeToFit];

    v111 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v111 addTarget:self action:"retakeButtonPressed:" forControlEvents:64];

    v112 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v112 setTranslatesAutoresizingMaskIntoConstraints:0];

    v113 = +[UIButton buttonWithType:1];
    [(CameraSensorAnomalyViewController *)self setUsePhotoButton:v113];

    v114 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v114 setOpaque:0];

    v115 = +[UIColor clearColor];
    v116 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v116 setBackgroundColor:v115];

    v117 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v118 = [v117 titleLabel];
    [v118 setContentMode:7];

    v119 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v120 = [v119 titleLabel];
    [v120 setTextAlignment:1];

    v121 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v122 = [v121 titleLabel];
    [v122 setLineBreakMode:4];

    v123 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v124 = [v123 titleLabel];
    [v124 setFont:v90];

    v125 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v126 = [v125 titleLabel];
    [v126 setNumberOfLines:1];

    v127 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v128 = +[NSBundle mainBundle];
    v129 = [v128 localizedStringForKey:@"USE_PHOTO" value:&stru_1000106F0 table:0];
    [v127 setTitle:v129 forState:0];

    v130 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v131 = +[UIColor whiteColor];
    [v130 setTitleColor:v131 forState:0];

    v132 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v132 sizeToFit];

    v133 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v133 addTarget:self action:"usePhotoButtonPressed:" forControlEvents:64];

    v134 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v134 setTranslatesAutoresizingMaskIntoConstraints:0];

    v135 = +[UIButton buttonWithType:1];
    [(CameraSensorAnomalyViewController *)self setContinueButton:v135];

    v136 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v136 setOpaque:0];

    v137 = +[UIColor clearColor];
    v138 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v138 setBackgroundColor:v137];

    v139 = [(CameraSensorAnomalyViewController *)self continueButton];
    v140 = [v139 titleLabel];
    [v140 setContentMode:7];

    v141 = [(CameraSensorAnomalyViewController *)self continueButton];
    v142 = [v141 titleLabel];
    [v142 setTextAlignment:1];

    v143 = [(CameraSensorAnomalyViewController *)self continueButton];
    v144 = [v143 titleLabel];
    [v144 setLineBreakMode:4];

    v145 = [(CameraSensorAnomalyViewController *)self continueButton];
    v146 = [v145 titleLabel];
    [v146 setFont:v90];

    v147 = [(CameraSensorAnomalyViewController *)self continueButton];
    v148 = [v147 titleLabel];
    [v148 setNumberOfLines:1];

    v149 = [(CameraSensorAnomalyViewController *)self continueButton];
    v150 = +[NSBundle mainBundle];
    v151 = [v150 localizedStringForKey:@"CONTINUE" value:&stru_1000106F0 table:0];
    [v149 setTitle:v151 forState:0];

    v152 = [(CameraSensorAnomalyViewController *)self continueButton];
    v153 = +[UIColor whiteColor];
    [v152 setTitleColor:v153 forState:0];

    v154 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v154 sizeToFit];

    v155 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v155 addTarget:self action:"continueButtonPressed:" forControlEvents:64];

    v156 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v156 setTranslatesAutoresizingMaskIntoConstraints:0];

    v157 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v157 setHidden:1];

    v158 = [(CameraSensorAnomalyViewController *)self view];
    [v158 setNeedsUpdateConstraints];

    v159 = [(CameraSensorAnomalyViewController *)self bottomBar];
    v160 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v159 addSubview:v160];

    v161 = [(CameraSensorAnomalyViewController *)self bottomBar];
    v162 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v161 addSubview:v162];

    v163 = [(CameraSensorAnomalyViewController *)self bottomBar];
    v164 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v163 addSubview:v164];

    v165 = [(CameraSensorAnomalyViewController *)self view];
    v166 = [(CameraSensorAnomalyViewController *)self imageScrollView];
    [v165 addSubview:v166];

    v167 = [(CameraSensorAnomalyViewController *)self view];
    v168 = [(CameraSensorAnomalyViewController *)self bottomBar];
    [v167 addSubview:v168];

    v169 = +[DSTestAutomation sharedInstance];
    LODWORD(v168) = [v169 testAutomationEnabled];

    if (v168) {
      +[DSTestAutomation postInteractiveTestEvent:@"ViewDidChange" info:&off_100010B68];
    }

    v170 = v188;
  }
  else
  {
    v171 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
      sub_100009524((uint64_t)v7, v171, v172, v173, v174, v175, v176, v177);
    }

    v170 = v7;
    v178 = +[NSBundle mainBundle];
    v179 = [v178 localizedStringForKey:@"UIIMPC_ERROR_TITLE" value:&stru_1000106F0 table:0];
    v180 = +[NSBundle mainBundle];
    v181 = [v180 localizedStringForKey:@"UIIMPC_ERROR_MESSAGE" value:&stru_1000106F0 table:0];
    long long v16 = +[UIAlertController alertControllerWithTitle:v179 message:v181 preferredStyle:1];

    v182 = +[NSBundle mainBundle];
    v183 = [v182 localizedStringForKey:@"CANCEL" value:&stru_1000106F0 table:0];
    v191[0] = _NSConcreteStackBlock;
    v191[1] = 3221225472;
    v191[2] = sub_1000066C8;
    v191[3] = &unk_100010458;
    v191[4] = self;
    v184 = +[UIAlertAction actionWithTitle:v183 style:0 handler:v191];
    [v16 addAction:v184];

    v185 = +[NSBundle mainBundle];
    v186 = [v185 localizedStringForKey:@"TRY_AGAIN" value:&stru_1000106F0 table:0];
    v190[0] = _NSConcreteStackBlock;
    v190[1] = 3221225472;
    v190[2] = sub_1000066D8;
    v190[3] = &unk_100010458;
    v190[4] = self;
    v187 = +[UIAlertAction actionWithTitle:v186 style:0 handler:v190];
    [v16 addAction:v187];

    [(CameraSensorAnomalyViewController *)self presentViewController:v16 animated:1 completion:0];
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(CameraSensorAnomalyViewController *)self currentImageView];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  if (v10 >= v5) {
    double v13 = 0.0;
  }
  else {
    double v13 = (v5 - v10) * 0.5;
  }
  if (v12 >= v7) {
    double v14 = 0.0;
  }
  else {
    double v14 = (v7 - v12) * 0.5;
  }
  id v15 = [(CameraSensorAnomalyViewController *)self currentImageView];
  [v15 setFrame:v13, v14, v10, v12];
}

- (void)updateViewConstraints
{
  v73.receiver = self;
  v73.super_class = (Class)CameraSensorAnomalyViewController;
  [(CameraSensorAnomalyViewController *)&v73 updateViewConstraints];
  if ([(CameraSensorAnomalyViewController *)self drawingMode])
  {
    id v3 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v4 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v5 = [(CameraSensorAnomalyViewController *)self view];
    [v5 frame];
    double v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v6];
    [v3 addConstraint:v7];

    id v8 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v9 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v10 = +[NSLayoutConstraint constraintWithItem:v9 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:85.0];
    [v8 addConstraint:v10];

    double v11 = [(CameraSensorAnomalyViewController *)self view];
    double v12 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v13 = [(CameraSensorAnomalyViewController *)self view];
    double v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v14];

    id v15 = [(CameraSensorAnomalyViewController *)self view];
    long long v16 = [(CameraSensorAnomalyViewController *)self bottomBar];
    long long v17 = [(CameraSensorAnomalyViewController *)self view];
    id v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:4 relatedBy:0 toItem:v17 attribute:4 multiplier:1.0 constant:0.0];
    [v15 addConstraint:v18];

    double v19 = [(CameraSensorAnomalyViewController *)self retakeButton];
    double v20 = [(CameraSensorAnomalyViewController *)self retakeButton];
    double v21 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v21 frame];
    double v23 = +[NSLayoutConstraint constraintWithItem:v20 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v22];
    [v19 addConstraint:v23];

    float v24 = [(CameraSensorAnomalyViewController *)self retakeButton];
    double v25 = [(CameraSensorAnomalyViewController *)self retakeButton];
    double v26 = [(CameraSensorAnomalyViewController *)self retakeButton];
    [v26 frame];
    double v28 = +[NSLayoutConstraint constraintWithItem:v25 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v27];
    [v24 addConstraint:v28];

    double v29 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v30 = [(CameraSensorAnomalyViewController *)self retakeButton];
    float v31 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v32 = +[NSLayoutConstraint constraintWithItem:v30 attribute:5 relatedBy:0 toItem:v31 attribute:5 multiplier:1.0 constant:15.0];
    [v29 addConstraint:v32];

    long long v33 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v34 = [(CameraSensorAnomalyViewController *)self retakeButton];
    double v35 = [(CameraSensorAnomalyViewController *)self bottomBar];
    float v36 = +[NSLayoutConstraint constraintWithItem:v34 attribute:10 relatedBy:0 toItem:v35 attribute:10 multiplier:1.0 constant:0.0];
    [v33 addConstraint:v36];

    double v37 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    float v38 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    double v39 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v39 frame];
    double v41 = +[NSLayoutConstraint constraintWithItem:v38 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v40];
    [v37 addConstraint:v41];

    double v42 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    double v43 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    float v44 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    [v44 frame];
    double v46 = +[NSLayoutConstraint constraintWithItem:v43 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v45];
    [v42 addConstraint:v46];

    double v47 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v48 = [(CameraSensorAnomalyViewController *)self bottomBar];
    float v49 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    double v50 = +[NSLayoutConstraint constraintWithItem:v48 attribute:6 relatedBy:0 toItem:v49 attribute:6 multiplier:1.0 constant:15.0];
    [v47 addConstraint:v50];

    double v51 = [(CameraSensorAnomalyViewController *)self bottomBar];
    v52 = [(CameraSensorAnomalyViewController *)self usePhotoButton];
    v53 = [(CameraSensorAnomalyViewController *)self retakeButton];
    id v54 = +[NSLayoutConstraint constraintWithItem:v52 attribute:10 relatedBy:0 toItem:v53 attribute:10 multiplier:1.0 constant:0.0];
    [v51 addConstraint:v54];

    v55 = [(CameraSensorAnomalyViewController *)self continueButton];
    CGPoint v56 = [(CameraSensorAnomalyViewController *)self continueButton];
    CGRect v57 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v57 frame];
    v59 = +[NSLayoutConstraint constraintWithItem:v56 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v58];
    [v55 addConstraint:v59];

    id v60 = [(CameraSensorAnomalyViewController *)self continueButton];
    v61 = [(CameraSensorAnomalyViewController *)self continueButton];
    double v62 = [(CameraSensorAnomalyViewController *)self continueButton];
    [v62 frame];
    v64 = +[NSLayoutConstraint constraintWithItem:v61 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v63];
    [v60 addConstraint:v64];

    double v65 = [(CameraSensorAnomalyViewController *)self bottomBar];
    id v66 = [(CameraSensorAnomalyViewController *)self continueButton];
    v67 = [(CameraSensorAnomalyViewController *)self bottomBar];
    v68 = +[NSLayoutConstraint constraintWithItem:v66 attribute:9 relatedBy:0 toItem:v67 attribute:9 multiplier:1.0 constant:0.0];
    [v65 addConstraint:v68];

    double v69 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v70 = [(CameraSensorAnomalyViewController *)self continueButton];
    double v71 = [(CameraSensorAnomalyViewController *)self bottomBar];
    double v72 = +[NSLayoutConstraint constraintWithItem:v70 attribute:10 relatedBy:0 toItem:v71 attribute:10 multiplier:1.0 constant:0.0];
    [v69 addConstraint:v72];
  }
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

- (CameraSensorAnomalyInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (id)photoCaptureCompletionHandler
{
  return self->_photoCaptureCompletionHandler;
}

- (void)setPhotoCaptureCompletionHandler:(id)a3
{
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (BOOL)drawingMode
{
  return self->_drawingMode;
}

- (void)setDrawingMode:(BOOL)a3
{
  self->_drawingMode = a3;
}

- (int64_t)currentTag
{
  return self->_currentTag;
}

- (void)setCurrentTag:(int64_t)a3
{
  self->_currentTag = a3;
}

- (CGRect)rectangle
{
  double x = self->_rectangle.origin.x;
  double y = self->_rectangle.origin.y;
  double width = self->_rectangle.size.width;
  double height = self->_rectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGPoint)originPoint
{
  double x = self->_originPoint.x;
  double y = self->_originPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginPoint:(CGPoint)a3
{
  self->_originPoint = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AVCapturePhotoOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (CameraTargetView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIScrollView)imageScrollView
{
  return self->_imageScrollView;
}

- (void)setImageScrollView:(id)a3
{
}

- (UIView)bottomBar
{
  return self->_bottomBar;
}

- (void)setBottomBar:(id)a3
{
}

- (UIButton)retakeButton
{
  return self->_retakeButton;
}

- (void)setRetakeButton:(id)a3
{
}

- (UIButton)usePhotoButton
{
  return self->_usePhotoButton;
}

- (void)setUsePhotoButton:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (CameraSensorAnomalyTestImageView)currentImageView
{
  return self->_currentImageView;
}

- (void)setCurrentImageView:(id)a3
{
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (CBClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (CBBlueLightClient)blueLightClient
{
  return self->_blueLightClient;
}

- (void)setBlueLightClient:(id)a3
{
}

- (CBAdaptationClient)adaptationClient
{
  return self->_adaptationClient;
}

- (void)setAdaptationClient:(id)a3
{
}

- (BOOL)blueLightStatusActive
{
  return self->_blueLightStatusActive;
}

- (void)setBlueLightStatusActive:(BOOL)a3
{
  self->_blueLightStatusActive = a3;
}

- (BOOL)colorAdaptationStatus
{
  return self->_colorAdaptationStatus;
}

- (void)setColorAdaptationStatus:(BOOL)a3
{
  self->_colorAdaptationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationClient, 0);
  objc_storeStrong((id *)&self->_blueLightClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_currentImageView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_usePhotoButton, 0);
  objc_storeStrong((id *)&self->_retakeButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_imageScrollView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong(&self->_photoCaptureCompletionHandler, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end