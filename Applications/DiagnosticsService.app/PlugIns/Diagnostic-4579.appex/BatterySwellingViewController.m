@interface BatterySwellingViewController
- (BOOL)checkIfCorrectOrientation:(int)a3;
- (BOOL)isCompleted;
- (BOOL)isFinishedFaceDownPixelMaps;
- (BOOL)isFinishedFaceUpPixelMaps;
- (BOOL)monitoringAngle;
- (BOOL)rowZeroAtBottom;
- (BOOL)setupHIDForceTouchImageRecognizer;
- (BOOL)touchAllowed;
- (BOOL)touchEventRecognized;
- (BatterySwellingInputs)inputs;
- (CADisplayLink)displayLink;
- (CMMotionManager)motionManager;
- (DAMotionDetector)motionDetectionMonitor;
- (NSArray)temperatureKeyArray;
- (NSArray)temperatureValueArray;
- (NSNumber)batteryTemp;
- (NSTimer)flipSetupTimer;
- (NSTimer)samplingSetupTimer;
- (NSTimer)samplingTimer;
- (UIImageView)flipInstructionImageView;
- (__MTDevice)builtInDevice;
- (id)instructionImageName;
- (id)mergeFrames:(signed __int16 *)a3;
- (int)downFrameNumber;
- (int)upFrameNumber;
- (int64_t)deviceOrientation;
- (signed)allocatePixelMaps;
- (signed)faceDownPixelMaps;
- (signed)faceUpPixelMaps;
- (unint64_t)supportedInterfaceOrientations;
- (void)checkAngle:(id)a3;
- (void)determineBatteryGasGaugeTemp;
- (void)deviceHasFlipped:(id)a3;
- (void)disableSensorMonitoring;
- (void)enableSensorMonitoring;
- (void)endTestWithStatusCode:(id)a3;
- (void)receivedExcessiveEventNotification:(id)a3;
- (void)sampleTimeout:(id)a3;
- (void)samplingFinished:(id)a3;
- (void)setBatteryTemp:(id)a3;
- (void)setBuiltInDevice:(__MTDevice *)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDownFrameNumber:(int)a3;
- (void)setFaceDownPixelMaps:(signed __int16 *)a3;
- (void)setFaceUpPixelMaps:(signed __int16 *)a3;
- (void)setFlipInstructionImageView:(id)a3;
- (void)setFlipSetupTimer:(id)a3;
- (void)setInputs:(id)a3;
- (void)setIsCompleted:(BOOL)a3;
- (void)setIsFinishedFaceDownPixelMaps:(BOOL)a3;
- (void)setIsFinishedFaceUpPixelMaps:(BOOL)a3;
- (void)setMonitoringAngle:(BOOL)a3;
- (void)setMotionDetectionMonitor:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setRowZeroAtBottom:(BOOL)a3;
- (void)setSamplingSetupTimer:(id)a3;
- (void)setSamplingTimer:(id)a3;
- (void)setTemperatureKeyArray:(id)a3;
- (void)setTemperatureValueArray:(id)a3;
- (void)setTouchAllowed:(BOOL)a3;
- (void)setTouchEventRecognized:(BOOL)a3;
- (void)setUpFrameNumber:(int)a3;
- (void)setupAngleMonitoring;
- (void)setupAngleMotionManager;
- (void)setupExcessiveMotionNotification;
- (void)setupForSamplingCompleted:(id)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)startExcessiveMotionMonitoring;
- (void)stopExcessiveMotionMonitoring;
- (void)teardown;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BatterySwellingViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[BatterySwellingViewController setInputs:](self, "setInputs:", a3, a4);
  [(BatterySwellingViewController *)self setFaceUpPixelMaps:0];
  [(BatterySwellingViewController *)self setFaceDownPixelMaps:0];
  [(BatterySwellingViewController *)self setIsFinishedFaceDownPixelMaps:0];
  [(BatterySwellingViewController *)self setIsFinishedFaceUpPixelMaps:0];
  [(BatterySwellingViewController *)self setIsCompleted:0];
  [(BatterySwellingViewController *)self setUpFrameNumber:0];

  [(BatterySwellingViewController *)self setDownFrameNumber:0];
}

- (void)setupAngleMotionManager
{
  id v3 = objc_alloc_init((Class)CMMotionManager);
  [(BatterySwellingViewController *)self setMotionManager:v3];

  v4 = [(BatterySwellingViewController *)self motionManager];
  [v4 setShowsDeviceMovementDisplay:1];

  v5 = [(BatterySwellingViewController *)self motionManager];
  [v5 setDeviceMotionUpdateInterval:0.00999999978];

  id v6 = [(BatterySwellingViewController *)self motionManager];
  [v6 startDeviceMotionUpdatesUsingReferenceFrame:1];
}

- (BOOL)setupHIDForceTouchImageRecognizer
{
  Default = (__MTDevice *)MTDeviceCreateDefault();
  unsigned int ParserType = MTDeviceGetParserType();
  int IsBuiltIn = MTDeviceIsBuiltIn();
  if (MTDeviceGetDeviceID())
  {
    uint64_t v6 = -12;
  }
  else if (MTDeviceGetSensorSurfaceDimensions())
  {
    uint64_t v6 = -13;
  }
  else if (MTDeviceGetTransportMethod())
  {
    uint64_t v6 = -14;
  }
  else
  {
    if (ParserType < 0x3E8) {
      int v7 = IsBuiltIn;
    }
    else {
      int v7 = 0;
    }
    if (v7 == 1)
    {
      if (MTDeviceSetReport())
      {
        uint64_t v6 = -15;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -16;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -17;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -18;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -19;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -20;
      }
      else if (MTDeviceSetReport())
      {
        uint64_t v6 = -21;
      }
      else if (MTDeviceStart())
      {
        uint64_t v6 = -5;
      }
      else
      {
        uint64_t MultitouchRunLoopSource = MTDeviceCreateMultitouchRunLoopSource();
        if (MultitouchRunLoopSource)
        {
          v11 = (__CFRunLoopSource *)MultitouchRunLoopSource;
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v11, kCFRunLoopCommonModes);
          CFRelease(v11);
          self->_builtInDevice = Default;
          CFRetain(Default);
          return 1;
        }
        uint64_t v6 = -24;
      }
    }
    else
    {
      uint64_t v6 = -6;
    }
  }
  v8 = +[NSNumber numberWithInteger:v6];
  [(BatterySwellingViewController *)self endTestWithStatusCode:v8];

  return 0;
}

- (signed)allocatePixelMaps
{
  id v3 = [(BatterySwellingViewController *)self inputs];
  signed int v4 = [v3 pixelMapWidth];
  v5 = [(BatterySwellingViewController *)self inputs];
  uint64_t v6 = v4 * (uint64_t)(int)[v5 pixelMapHeight];
  int v7 = [(BatterySwellingViewController *)self inputs];
  v8 = (char *)malloc_type_malloc(2 * v6 * (int)[v7 numFramesToRecord], 0x94046790uLL);

  v9 = [(BatterySwellingViewController *)self inputs];
  v10 = (signed __int16 **)malloc_type_malloc(8 * (int)[v9 numFramesToRecord], 0x10040436913F5uLL);

  v11 = [(BatterySwellingViewController *)self inputs];
  LODWORD(v7) = [v11 numFramesToRecord];

  if ((int)v7 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      v13 = [(BatterySwellingViewController *)self inputs];
      int v14 = [v13 pixelMapWidth] * v12;
      v15 = [(BatterySwellingViewController *)self inputs];
      v10[v12] = (signed __int16 *)&v8[2 * v14 * [v15 pixelMapHeight]];

      ++v12;
      v16 = [(BatterySwellingViewController *)self inputs];
      LODWORD(v15) = [v16 numFramesToRecord];
    }
    while (v12 < (int)v15);
  }
  return v10;
}

- (void)start
{
  [(BatterySwellingViewController *)self setMonitoringAngle:0];
  [(BatterySwellingViewController *)self setupAngleMotionManager];
  if ([(BatterySwellingViewController *)self setupHIDForceTouchImageRecognizer])
  {
    [(BatterySwellingViewController *)self setFaceUpPixelMaps:[(BatterySwellingViewController *)self allocatePixelMaps]];
    [(BatterySwellingViewController *)self setFaceDownPixelMaps:[(BatterySwellingViewController *)self allocatePixelMaps]];
    if ([(BatterySwellingViewController *)self faceUpPixelMaps]
      && [(BatterySwellingViewController *)self faceDownPixelMaps])
    {
      [(BatterySwellingViewController *)self setDeviceOrientation:5];
      [(BatterySwellingViewController *)self setupView];
      [(BatterySwellingViewController *)self setupExcessiveMotionNotification];
      [(BatterySwellingViewController *)self determineBatteryGasGaugeTemp];
      [(BatterySwellingViewController *)self enableSensorMonitoring];
    }
    else
    {
      [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C7B0];
    }
  }
}

- (void)setupView
{
  id v3 = +[UIColor whiteColor];
  signed int v4 = [(BatterySwellingViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UIImageView);
  uint64_t v6 = [(BatterySwellingViewController *)self view];
  [v6 bounds];
  id v7 = [v5 initWithFrame:];
  [(BatterySwellingViewController *)self setFlipInstructionImageView:v7];

  id v13 = [(BatterySwellingViewController *)self instructionImageName];
  if (v13)
  {
    v8 = [(BatterySwellingViewController *)self instructionImageName];
    v9 = [(BatterySwellingViewController *)self flipInstructionImageView];
    [v9 setImage:v8];

    v10 = [(BatterySwellingViewController *)self flipInstructionImageView];
    [v10 setAlpha:0.0];

    v11 = [(BatterySwellingViewController *)self view];
    uint64_t v12 = [(BatterySwellingViewController *)self flipInstructionImageView];
    [v11 addSubview:v12];
  }
  else
  {
    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C7C8];
  }
}

- (void)setupExcessiveMotionNotification
{
  id v3 = [[DAMotionDetector alloc] initWithThreshold:&off_10000C7E0];
  [(BatterySwellingViewController *)self setMotionDetectionMonitor:v3];

  id v4 = [(BatterySwellingViewController *)self motionDetectionMonitor];
  [v4 start];
}

- (void)determineBatteryGasGaugeTemp
{
  id v5 = objc_alloc_init(MultiTouchHelper);
  id v3 = [(MultiTouchHelper *)v5 temperatureData];
  id v4 = [v3 objectForKeyedSubscript:@"TG0B"];
  [(BatterySwellingViewController *)self setBatteryTemp:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BatterySwellingViewController;
  [(BatterySwellingViewController *)&v7 viewDidAppear:a3];
  if ([(BatterySwellingViewController *)self checkIfCorrectOrientation:5])
  {
    [(BatterySwellingViewController *)self setupAngleMonitoring];
    id v4 = [(BatterySwellingViewController *)self inputs];
    [v4 samplingSetupTimeout];
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "setupForSamplingCompleted:", 0, 0);
    [(BatterySwellingViewController *)self setSamplingSetupTimer:v5];
  }
  else
  {
    uint64_t v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007FF4();
    }

    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C7F8];
  }
}

- (id)instructionImageName
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  objc_super v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  v10 = +[NSMutableString string];
  [v10 appendString:@"down-"];
  v11 = +[NSNumber numberWithDouble:v4 * v9];
  uint64_t v12 = +[NSNumber numberWithDouble:v6 * v9];
  [v10 appendFormat:@"%@-%@.png", v11, v12];

  id v13 = +[UIImage imageNamed:v10];

  return v13;
}

- (void)enableSensorMonitoring
{
  [(BatterySwellingViewController *)self setMonitoringAngle:1];
  [(BatterySwellingViewController *)self startExcessiveMotionMonitoring];

  [(BatterySwellingViewController *)self setTouchAllowed:0];
}

- (void)disableSensorMonitoring
{
  if ([(BatterySwellingViewController *)self monitoringAngle])
  {
    [(BatterySwellingViewController *)self setMonitoringAngle:0];
    [(BatterySwellingViewController *)self builtInDevice];
    if ((MTUnregisterImageCallback() & 1) == 0) {
      [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C810];
    }
    [(BatterySwellingViewController *)self stopExcessiveMotionMonitoring];
    [(BatterySwellingViewController *)self setTouchAllowed:1];
  }
}

- (void)startExcessiveMotionMonitoring
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"receivedExcessiveEventNotification:" name:@"MotionDetectedNotification" object:0];
}

- (void)stopExcessiveMotionMonitoring
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)checkAngle:(id)a3
{
  double v4 = [(BatterySwellingViewController *)self motionManager];
  double v5 = [v4 deviceMotion];
  double v6 = [v5 attitude];

  if (v6) {
    [v6 rotationMatrix:0, 0, 0, 0];
  }
  double v7 = acos(-0.0);
  if ([(BatterySwellingViewController *)self monitoringAngle])
  {
    double v8 = v7 * 180.0 / 3.14159265;
    unsigned int v9 = [(BatterySwellingViewController *)self checkIfCorrectOrientation:5];
    v10 = [(BatterySwellingViewController *)self inputs];
    int v11 = [v10 angleTolerance];
    if (v9)
    {
      double v12 = (double)(180 - v11);

      if (v8 < v12)
      {
        id v13 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
    }
    else
    {
      double v14 = (double)v11;

      if (v8 > v14)
      {
        id v13 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_10:
        }
          sub_100008028();
LABEL_11:

        [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C828];
      }
    }
  }
}

- (BOOL)checkIfCorrectOrientation:(int)a3
{
  double v4 = [(BatterySwellingViewController *)self motionManager];
  double v5 = [v4 deviceMotion];
  double v6 = [v5 attitude];

  if (v6) {
    [v6 rotationMatrix:0, 0, 0, 0];
  }
  long double v7 = acos(-0.0) + -1.57079633;
  double v8 = fabs(v7 * 180.0 / 3.14159265);
  uint64_t v9 = 6;
  if (v7 > 0.0) {
    uint64_t v9 = 5;
  }
  BOOL v11 = v8 > 40.0 && v9 == a3;

  return v11;
}

- (void)setupAngleMonitoring
{
  id v3 = [(BatterySwellingViewController *)self displayLink];

  if (!v3)
  {
    double v4 = +[CADisplayLink displayLinkWithTarget:self selector:"checkAngle:"];
    [(BatterySwellingViewController *)self setDisplayLink:v4];

    id v6 = [(BatterySwellingViewController *)self displayLink];
    double v5 = +[NSRunLoop currentRunLoop];
    [v6 addToRunLoop:v5 forMode:NSRunLoopCommonModes];
  }
}

- (void)receivedExcessiveEventNotification:(id)a3
{
  double v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000805C();
  }

  [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C840];
}

- (void)setupForSamplingCompleted:(id)a3
{
  [(BatterySwellingViewController *)self builtInDevice];
  if ((MTRegisterImageCallbackWithRefcon() & 1) == 0) {
    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C858];
  }
  id v5 = [(BatterySwellingViewController *)self inputs];
  [v5 samplingTimeout];
  double v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "sampleTimeout:", 0, 0);
  [(BatterySwellingViewController *)self setSamplingTimer:v4];
}

- (void)sampleTimeout:(id)a3
{
}

- (void)samplingFinished:(id)a3
{
  double v4 = [(BatterySwellingViewController *)self samplingTimer];
  [v4 invalidate];

  [(BatterySwellingViewController *)self setSamplingTimer:0];
  [(BatterySwellingViewController *)self disableSensorMonitoring];
  if ([(BatterySwellingViewController *)self checkIfCorrectOrientation:5])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006B18;
    v7[3] = &unk_10000C390;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:0.25];
    id v5 = [(BatterySwellingViewController *)self inputs];
    [v5 flipSetupTimeout];
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "deviceHasFlipped:", 0, 0);
    [(BatterySwellingViewController *)self setFlipSetupTimer:v6];
  }
  else
  {
    [(BatterySwellingViewController *)self setIsCompleted:1];
    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C888];
  }
}

- (void)deviceHasFlipped:(id)a3
{
  if ([(BatterySwellingViewController *)self checkIfCorrectOrientation:5])
  {
    double v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100008090();
    }

    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C8A0];
  }
  else
  {
    [(BatterySwellingViewController *)self setDeviceOrientation:6];
    [(BatterySwellingViewController *)self enableSensorMonitoring];
    id v5 = [(BatterySwellingViewController *)self flipInstructionImageView];
    [v5 setAlpha:0.0];

    id v7 = [(BatterySwellingViewController *)self inputs];
    [v7 samplingSetupTimeout];
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "setupForSamplingCompleted:", 0, 0);
    [(BatterySwellingViewController *)self setSamplingSetupTimer:v6];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(BatterySwellingViewController *)self touchAllowed])
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000080C4();
    }

    [(BatterySwellingViewController *)self endTestWithStatusCode:&off_10000C8B8];
  }
}

- (id)mergeFrames:(signed __int16 *)a3
{
  id v5 = &CFArrayGetCount_ptr;
  id v6 = [(BatterySwellingViewController *)self inputs];
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (int)[v6 pixelMapHeight]);

  unsigned int v8 = [(BatterySwellingViewController *)self rowZeroAtBottom];
  uint64_t v9 = [(BatterySwellingViewController *)self inputs];
  int v10 = [v9 pixelMapHeight];
  if (v8)
  {

    if (v10 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        double v12 = [(BatterySwellingViewController *)self inputs];
        id v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (int)[v12 pixelMapWidth]);
        [v7 addObject:v13];

        double v14 = [(BatterySwellingViewController *)self inputs];
        LODWORD(v12) = [v14 pixelMapWidth];

        if ((int)v12 >= 1)
        {
          int v15 = 0;
          do
          {
            v16 = [(BatterySwellingViewController *)self inputs];
            int v17 = [v16 numFramesToRecord];

            if (v17 < 1)
            {
              double v19 = 0.0;
            }
            else
            {
              uint64_t v18 = 0;
              double v19 = 0.0;
              do
              {
                v20 = a3[v18];
                v21 = [(BatterySwellingViewController *)self inputs];
                double v19 = v19 + (double)v20[(int)(v15 + [v21 pixelMapWidth] * v11)];

                ++v18;
                v22 = [(BatterySwellingViewController *)self inputs];
                LODWORD(v20) = [v22 numFramesToRecord];
              }
              while (v18 < (int)v20);
            }
            v23 = [v7 objectAtIndexedSubscript:v11];
            v24 = [(BatterySwellingViewController *)self inputs];
            v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 / (double)(int)[v24 numFramesToRecord]);
            [v23 addObject:v25];

            ++v15;
            v26 = [(BatterySwellingViewController *)self inputs];
            LODWORD(v25) = [v26 pixelMapWidth];
          }
          while (v15 < (int)v25);
        }
        ++v11;
        v27 = [(BatterySwellingViewController *)self inputs];
        signed int v28 = [v27 pixelMapHeight];
      }
      while (v11 < v28);
    }
  }
  else
  {

    if (v10 >= 1)
    {
      do
      {
        v29 = v5[81];
        v30 = [(BatterySwellingViewController *)self inputs];
        v31 = [v29 arrayWithCapacity:[v30 pixelMapWidth]];
        [v7 addObject:v31];

        v32 = [(BatterySwellingViewController *)self inputs];
        LODWORD(v30) = [v32 pixelMapWidth];

        if ((int)v30 >= 1)
        {
          int v33 = 0;
          do
          {
            v34 = [(BatterySwellingViewController *)self inputs];
            int v35 = [v34 numFramesToRecord];

            if (v35 < 1)
            {
              double v37 = 0.0;
            }
            else
            {
              uint64_t v36 = 0;
              double v37 = 0.0;
              do
              {
                v38 = a3[v36];
                v39 = [(BatterySwellingViewController *)self inputs];
                double v37 = v37 + (double)v38[v33 + [v39 pixelMapWidth] * (v10 - 1)];

                ++v36;
                v40 = [(BatterySwellingViewController *)self inputs];
                LODWORD(v38) = [v40 numFramesToRecord];
              }
              while (v36 < (int)v38);
            }
            v41 = [(BatterySwellingViewController *)self inputs];
            v42 = objc_msgSend(v7, "objectAtIndexedSubscript:", (int)(objc_msgSend(v41, "pixelMapHeight") - v10));
            v43 = [(BatterySwellingViewController *)self inputs];
            v44 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37 / (double)(int)[v43 numFramesToRecord]);
            [v42 addObject:v44];

            ++v33;
            v45 = [(BatterySwellingViewController *)self inputs];
            LODWORD(v42) = [v45 pixelMapWidth];
          }
          while (v33 < (int)v42);
        }
        BOOL v46 = v10-- <= 1;
        id v5 = &CFArrayGetCount_ptr;
      }
      while (!v46);
    }
  }

  return v7;
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  id v5 = [(BatterySwellingViewController *)self result];
  [v5 setStatusCode:v4];

  if ([(BatterySwellingViewController *)self isCompleted])
  {
    v14[0] = @"faceUpPixelMap";
    id v6 = [(BatterySwellingViewController *)self mergeFrames:[(BatterySwellingViewController *)self faceUpPixelMaps]];
    v15[0] = v6;
    v14[1] = @"faceDownPixelMap";
    id v7 = [(BatterySwellingViewController *)self mergeFrames:[(BatterySwellingViewController *)self faceDownPixelMaps]];
    v15[1] = v7;
    v14[2] = @"batteryTemperature";
    unsigned int v8 = [(BatterySwellingViewController *)self batteryTemp];
    uint64_t v9 = numberOrNull(v8);
    v15[2] = v9;
    int v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
    uint64_t v11 = [(BatterySwellingViewController *)self result];
    [v11 setData:v10];

    double v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100008170(self, v12);
    }

    id v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000080F8((uint64_t)v4, v13);
    }
  }
  [(BatterySwellingViewController *)self setFinished:1];
}

- (void)teardown
{
  [(BatterySwellingViewController *)self disableSensorMonitoring];
  id v3 = [(BatterySwellingViewController *)self flipSetupTimer];

  if (v3)
  {
    id v4 = [(BatterySwellingViewController *)self flipSetupTimer];
    [v4 invalidate];

    [(BatterySwellingViewController *)self setFlipSetupTimer:0];
  }
  id v5 = [(BatterySwellingViewController *)self samplingTimer];

  if (v5)
  {
    id v6 = [(BatterySwellingViewController *)self samplingTimer];
    [v6 invalidate];

    [(BatterySwellingViewController *)self setSamplingTimer:0];
  }
  id v7 = [(BatterySwellingViewController *)self samplingSetupTimer];

  if (v7)
  {
    unsigned int v8 = [(BatterySwellingViewController *)self samplingSetupTimer];
    [v8 invalidate];

    [(BatterySwellingViewController *)self setSamplingSetupTimer:0];
  }
  uint64_t v9 = [(BatterySwellingViewController *)self displayLink];

  if (v9)
  {
    int v10 = [(BatterySwellingViewController *)self displayLink];
    [v10 invalidate];

    [(BatterySwellingViewController *)self setDisplayLink:0];
  }
  uint64_t v11 = [(BatterySwellingViewController *)self motionDetectionMonitor];

  if (v11)
  {
    double v12 = [(BatterySwellingViewController *)self motionDetectionMonitor];
    [v12 stop];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 removeObserver:self];

    [(BatterySwellingViewController *)self setMotionDetectionMonitor:0];
  }
  if ([(BatterySwellingViewController *)self builtInDevice])
  {
    [(BatterySwellingViewController *)self builtInDevice];
    if (MTDeviceIsRunning())
    {
      [(BatterySwellingViewController *)self builtInDevice];
      MTDeviceStop();
    }
    CFRelease([(BatterySwellingViewController *)self builtInDevice]);
  }
  if ([(BatterySwellingViewController *)self faceDownPixelMaps])
  {
    free(*(void **)[(BatterySwellingViewController *)self faceDownPixelMaps]);
    free([(BatterySwellingViewController *)self faceDownPixelMaps]);
    [(BatterySwellingViewController *)self setFaceDownPixelMaps:0];
  }
  if ([(BatterySwellingViewController *)self faceUpPixelMaps])
  {
    free(*(void **)[(BatterySwellingViewController *)self faceUpPixelMaps]);
    free([(BatterySwellingViewController *)self faceUpPixelMaps]);
    [(BatterySwellingViewController *)self setFaceUpPixelMaps:0];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)touchEventRecognized
{
  return self->_touchEventRecognized;
}

- (void)setTouchEventRecognized:(BOOL)a3
{
  self->_touchEventRecognized = a3;
}

- (signed)faceUpPixelMaps
{
  return self->_faceUpPixelMaps;
}

- (void)setFaceUpPixelMaps:(signed __int16 *)a3
{
  self->_faceUpPixelMaps = a3;
}

- (signed)faceDownPixelMaps
{
  return self->_faceDownPixelMaps;
}

- (void)setFaceDownPixelMaps:(signed __int16 *)a3
{
  self->_faceDownPixelMaps = a3;
}

- (BOOL)rowZeroAtBottom
{
  return self->_rowZeroAtBottom;
}

- (void)setRowZeroAtBottom:(BOOL)a3
{
  self->_rowZeroAtBottom = a3;
}

- (int)upFrameNumber
{
  return self->_upFrameNumber;
}

- (void)setUpFrameNumber:(int)a3
{
  self->_upFrameNumber = a3;
}

- (int)downFrameNumber
{
  return self->_downFrameNumber;
}

- (void)setDownFrameNumber:(int)a3
{
  self->_downFrameNumber = a3;
}

- (BOOL)isFinishedFaceUpPixelMaps
{
  return self->_isFinishedFaceUpPixelMaps;
}

- (void)setIsFinishedFaceUpPixelMaps:(BOOL)a3
{
  self->_isFinishedFaceUpPixelMaps = a3;
}

- (BOOL)isFinishedFaceDownPixelMaps
{
  return self->_isFinishedFaceDownPixelMaps;
}

- (void)setIsFinishedFaceDownPixelMaps:(BOOL)a3
{
  self->_isFinishedFaceDownPixelMaps = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (DAMotionDetector)motionDetectionMonitor
{
  return self->_motionDetectionMonitor;
}

- (void)setMotionDetectionMonitor:(id)a3
{
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (UIImageView)flipInstructionImageView
{
  return self->_flipInstructionImageView;
}

- (void)setFlipInstructionImageView:(id)a3
{
}

- (NSNumber)batteryTemp
{
  return self->_batteryTemp;
}

- (void)setBatteryTemp:(id)a3
{
}

- (NSArray)temperatureKeyArray
{
  return self->_temperatureKeyArray;
}

- (void)setTemperatureKeyArray:(id)a3
{
}

- (NSArray)temperatureValueArray
{
  return self->_temperatureValueArray;
}

- (void)setTemperatureValueArray:(id)a3
{
}

- (BOOL)monitoringAngle
{
  return self->_monitoringAngle;
}

- (void)setMonitoringAngle:(BOOL)a3
{
  self->_monitoringAngle = a3;
}

- (__MTDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(__MTDevice *)a3
{
  self->_builtInDevice = a3;
}

- (BOOL)touchAllowed
{
  return self->_touchAllowed;
}

- (void)setTouchAllowed:(BOOL)a3
{
  self->_touchAllowed = a3;
}

- (BOOL)isCompleted
{
  return self->_isCompleted;
}

- (void)setIsCompleted:(BOOL)a3
{
  self->_isCompleted = a3;
}

- (BatterySwellingInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSTimer)samplingSetupTimer
{
  return self->_samplingSetupTimer;
}

- (void)setSamplingSetupTimer:(id)a3
{
}

- (NSTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
}

- (NSTimer)flipSetupTimer
{
  return self->_flipSetupTimer;
}

- (void)setFlipSetupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flipSetupTimer, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_samplingSetupTimer, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_temperatureValueArray, 0);
  objc_storeStrong((id *)&self->_temperatureKeyArray, 0);
  objc_storeStrong((id *)&self->_batteryTemp, 0);
  objc_storeStrong((id *)&self->_flipInstructionImageView, 0);
  objc_storeStrong((id *)&self->_motionDetectionMonitor, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end