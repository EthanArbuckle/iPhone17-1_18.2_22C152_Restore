@interface InteractiveAccelerometerViewController
- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4;
- (BOOL)debuggingEnabled;
- (BOOL)determineTestingOrientation;
- (BOOL)isDebuggingEnabled;
- (BOOL)isLeveled;
- (BOOL)orientationMissed;
- (BOOL)prefersStatusBarHidden;
- (BOOL)samplingRawData;
- (CADisplayLink)displayLink;
- (CALayer)leftLevelTic;
- (CALayer)levelBottom;
- (CALayer)rightLevelTic;
- (CAShapeLayer)bottomInnerCircle;
- (CAShapeLayer)bottomOuterCircle;
- (CAShapeLayer)topInnerCircle;
- (CAShapeLayer)topOuterCircle;
- (CMMotionManager)manager;
- (InteractiveAccelerometerInputs)inputs;
- (NSDate)startDate;
- (NSDictionary)averagedRawData;
- (NSDictionary)notStationaryData;
- (NSDictionary)stationaryData;
- (NSMutableArray)allResults;
- (NSMutableArray)copiedMotionManagerData;
- (NSMutableArray)copiedRawComponentData;
- (NSMutableArray)motionManagerData;
- (NSMutableArray)rawComponentData;
- (NSTimer)timeoutTimer;
- (UIFontDescriptor)fontDescriptor;
- (UILabel)degreesLabel;
- (UIView)bubbleContainer;
- (UIView)filterContainer;
- (UIView)levelContainer;
- (UIView)levelHoldContainer;
- (UIView)ticContainer;
- (double)average:(id)a3 key:(id)a4 size:(unint64_t)a5;
- (double)currentRotation;
- (double)currentShift;
- (double)degreesShift;
- (double)lastLevelChange;
- (double)previousRotation;
- (double)previousShift;
- (int)didCompleteSuccessfully;
- (int)orientationsIndex;
- (int64_t)framesLevel;
- (int64_t)lastDisplayDegrees;
- (int64_t)orientation;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)previousOrientation;
- (int64_t)rotationOrientation;
- (int64_t)testingOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateOffsetLabel:(double)a3;
- (void)addNotStationaryData;
- (void)addStationaryData;
- (void)checkForNextOrientation;
- (void)checkWithinOffset;
- (void)cleanUp;
- (void)didReceiveMemoryWarning;
- (void)endTestWithStatusCode:(id)a3;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)heldOrientationStationary;
- (void)notStationaryTimedOut;
- (void)setAllResults:(id)a3;
- (void)setAveragedRawData:(id)a3;
- (void)setBottomInnerCircle:(id)a3;
- (void)setBottomOuterCircle:(id)a3;
- (void)setBubbleContainer:(id)a3;
- (void)setCopiedMotionManagerData:(id)a3;
- (void)setCopiedRawComponentData:(id)a3;
- (void)setCurrentRotation:(double)a3;
- (void)setCurrentShift:(double)a3;
- (void)setDebuggingEnabled:(BOOL)a3;
- (void)setDegreesLabel:(id)a3;
- (void)setDegreesShift:(double)a3;
- (void)setDidCompleteSuccessfully:(int)a3;
- (void)setDisplayLink:(id)a3;
- (void)setFilterContainer:(id)a3;
- (void)setFontDescriptor:(id)a3;
- (void)setFramesLevel:(int64_t)a3;
- (void)setInputs:(id)a3;
- (void)setIsLeveled:(BOOL)a3;
- (void)setLastDisplayDegrees:(int64_t)a3;
- (void)setLastLevelChange:(double)a3;
- (void)setLeftLevelTic:(id)a3;
- (void)setLevelBottom:(id)a3;
- (void)setLevelContainer:(id)a3;
- (void)setLevelHoldContainer:(id)a3;
- (void)setManager:(id)a3;
- (void)setMotionManagerData:(id)a3;
- (void)setNotStationaryData:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientationMissed:(BOOL)a3;
- (void)setOrientationsIndex:(int)a3;
- (void)setPreviousOrientation:(int64_t)a3;
- (void)setPreviousRotation:(double)a3;
- (void)setPreviousShift:(double)a3;
- (void)setRawComponentData:(id)a3;
- (void)setRightLevelTic:(id)a3;
- (void)setRotationOrientation:(int64_t)a3;
- (void)setSamplingRawData:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStationaryData:(id)a3;
- (void)setTestingOrientation:(int64_t)a3;
- (void)setTicContainer:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTopInnerCircle:(id)a3;
- (void)setTopOuterCircle:(id)a3;
- (void)setZeroRangeAndDegreesShiftRange;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)startAnimations;
- (void)stopAnimations;
- (void)updateColors;
- (void)updateDisplay:(id)a3;
- (void)updateTicsForOrientation:(int64_t)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation InteractiveAccelerometerViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[InteractiveAccelerometerViewController setInputs:](self, "setInputs:", a3, a4);
  [(InteractiveAccelerometerViewController *)self setTestingOrientation:0];
  [(InteractiveAccelerometerViewController *)self setOrientationsIndex:0];
  [(InteractiveAccelerometerViewController *)self setOrientationMissed:0];
  [(InteractiveAccelerometerViewController *)self setSamplingRawData:0];
  id v5 = objc_alloc_init((Class)NSDictionary);
  [(InteractiveAccelerometerViewController *)self setAveragedRawData:v5];

  id v6 = objc_alloc_init((Class)NSDictionary);
  [(InteractiveAccelerometerViewController *)self setNotStationaryData:v6];

  id v7 = objc_alloc_init((Class)NSDictionary);
  [(InteractiveAccelerometerViewController *)self setStationaryData:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  [(InteractiveAccelerometerViewController *)self setMotionManagerData:v8];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  [(InteractiveAccelerometerViewController *)self setRawComponentData:v9];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  [(InteractiveAccelerometerViewController *)self setCopiedRawComponentData:v10];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  [(InteractiveAccelerometerViewController *)self setCopiedMotionManagerData:v11];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  [(InteractiveAccelerometerViewController *)self setAllResults:v12];

  [(InteractiveAccelerometerViewController *)self setZeroRangeAndDegreesShiftRange];
  id v13 = objc_alloc_init((Class)CMMotionManager);
  [(InteractiveAccelerometerViewController *)self setManager:v13];

  v14 = [(InteractiveAccelerometerViewController *)self manager];
  [v14 setShowsDeviceMovementDisplay:1];

  v15 = [(InteractiveAccelerometerViewController *)self manager];
  [v15 setDeviceMotionUpdateInterval:0.00999999978];

  v16 = [(InteractiveAccelerometerViewController *)self manager];
  [v16 startDeviceMotionUpdatesUsingReferenceFrame:1];

  [(InteractiveAccelerometerViewController *)self setOrientation:1];
  [(InteractiveAccelerometerViewController *)self setPreviousOrientation:1];
  [(InteractiveAccelerometerViewController *)self setLastLevelChange:1.79769313e308];
  [(InteractiveAccelerometerViewController *)self setLastDisplayDegrees:0x7FFFFFFFFFFFFFFFLL];
  [(InteractiveAccelerometerViewController *)self setPreviousRotation:1.79769313e308];
  [(InteractiveAccelerometerViewController *)self setPreviousShift:1.79769313e308];
  v17 = +[UIScreen mainScreen];
  [v17 bounds];
  double v19 = v18;
  long long v46 = xmmword_10000CE98;
  int v47 = -798153473;
  int v20 = MGIsDeviceOfType();
  double v21 = 0.850000024;
  if (!v20) {
    double v21 = 1.0;
  }
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x68u, v21 * round(v19 * 81.0 / 320.0), 0);

  v23 = [(__CTFont *)UIFontForLanguage fontDescriptor];
  CFRelease(UIFontForLanguage);
  UIFontDescriptorAttributeName v44 = UIFontDescriptorFeatureSettingsAttribute;
  v41[0] = UIFontFeatureTypeIdentifierKey;
  v41[1] = UIFontFeatureSelectorIdentifierKey;
  v42[0] = &off_100010BF0;
  v42[1] = &off_100010C08;
  v24 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  v43[0] = v24;
  v39[0] = UIFontFeatureTypeIdentifierKey;
  v39[1] = UIFontFeatureSelectorIdentifierKey;
  v40[0] = &off_100010C20;
  v40[1] = &off_100010C38;
  v25 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  v43[1] = v25;
  v26 = +[NSArray arrayWithObjects:v43 count:2];
  v45 = v26;
  v27 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v28 = [v23 fontDescriptorByAddingAttributes:v27];

  [(InteractiveAccelerometerViewController *)self setFontDescriptor:v28];
  v29 = +[DSTestAutomation sharedInstance];
  LODWORD(v25) = [v29 testAutomationEnabled];

  if (v25)
  {
    v30 = [(InteractiveAccelerometerViewController *)self inputs];
    v31 = [v30 parameters];
    v38[0] = v31;
    v37[1] = @"predicates";
    v32 = [(InteractiveAccelerometerViewController *)self inputs];
    v33 = [v32 predicates];
    v38[1] = v33;
    v37[2] = @"specifications";
    v34 = [(InteractiveAccelerometerViewController *)self inputs];
    v35 = [v34 specifications];
    v38[2] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    +[DSTestAutomation postConfiguration:v36];
  }
}

- (void)start
{
  [(InteractiveAccelerometerViewController *)self setDebuggingEnabled:[(InteractiveAccelerometerViewController *)self isDebuggingEnabled]];
  v3 = +[DAHIDEventMonitor sharedInstance];
  [v3 setDelegate:self];

  v4 = [(InteractiveAccelerometerViewController *)self inputs];
  BOOL v5 = [v4 componentSensor] != 0;

  id v6 = +[DAHIDEventMonitor sharedInstance];
  id v7 = +[NSNumber numberWithUnsignedInteger:v5];
  id v8 = +[NSSet setWithObject:v7];
  unsigned __int8 v9 = [v6 startMonitoringWithHIDEvents:v8];

  if (v9)
  {
    id v10 = +[DAHIDEventMonitor sharedInstance];
    id v11 = [(InteractiveAccelerometerViewController *)self inputs];
    unsigned int v12 = objc_msgSend(v10, "serviceClientSetPropertyValue:forKey:forHIDEvent:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v11, "outputDataRate")), @"ReportInterval", v5);

    if (v12)
    {
      if ([(InteractiveAccelerometerViewController *)self determineTestingOrientation])
      {
        [(InteractiveAccelerometerViewController *)self setupView];
        [(InteractiveAccelerometerViewController *)self startAnimations];
        id v13 = +[NSDate date];
        [(InteractiveAccelerometerViewController *)self setStartDate:v13];

        v14 = +[DSTestAutomation sharedInstance];
        unsigned int v15 = [v14 testAutomationEnabled];

        if (v15)
        {
          v16 = [(InteractiveAccelerometerViewController *)self inputs];
          if ([v16 componentSensor]) {
            CFStringRef v17 = @"ListenForGyroPosition";
          }
          else {
            CFStringRef v17 = @"ListenForAccelerometerPosition";
          }
          CFStringRef v23 = @"deviceOrientation";
          double v18 = +[NSNumber numberWithInteger:[(InteractiveAccelerometerViewController *)self testingOrientation]];
          v24 = v18;
          double v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          +[DSTestAutomation postInteractiveTestEvent:v17 info:v19];
        }
        int v20 = [(InteractiveAccelerometerViewController *)self inputs];
        [v20 notStationaryTimeout];
        double v21 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "notStationaryTimedOut", 0, 0);
        [(InteractiveAccelerometerViewController *)self setTimeoutTimer:v21];

        return;
      }
      v22 = &off_100010C68;
    }
    else
    {
      v22 = &off_100010C80;
    }
  }
  else
  {
    v22 = &off_100010C50;
  }

  [(InteractiveAccelerometerViewController *)self endTestWithStatusCode:v22];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)InteractiveAccelerometerViewController;
  [(InteractiveAccelerometerViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setZeroRangeAndDegreesShiftRange
{
  v3 = [(InteractiveAccelerometerViewController *)self inputs];
  v4 = [v3 componentOrientationSpecifications];
  BOOL v5 = [(InteractiveAccelerometerViewController *)self inputs];
  id v6 = [v5 orientationsParameter];
  id v7 = [v6 objectAtIndexedSubscript:[self orientationsIndex]];
  id v14 = [v4 objectForKeyedSubscript:v7];

  [v14 zeroRangeThreshold];
  double v9 = v8;
  id v10 = [(InteractiveAccelerometerViewController *)self inputs];
  [v10 setZeroRange:v9];

  [v14 degreesShiftRangeThreshold];
  double v12 = v11;
  id v13 = [(InteractiveAccelerometerViewController *)self inputs];
  [v13 setDegreesShiftRange:v12];
}

- (void)viewWillLayoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)InteractiveAccelerometerViewController;
  [(InteractiveAccelerometerViewController *)&v58 viewWillLayoutSubviews];
  v3 = [(InteractiveAccelerometerViewController *)self view];
  [v3 center];
  double v5 = v4;
  double v7 = v6;
  float v8 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  [v8 setCenter:v5, v7];

  double v9 = [(InteractiveAccelerometerViewController *)self view];
  [v9 center];
  double v11 = v10;
  double v13 = v12;
  id v14 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v14 setPosition:v11, v13];

  unsigned int v15 = [(InteractiveAccelerometerViewController *)self view];
  [v15 center];
  double v17 = v16;
  double v19 = v18;
  int v20 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v20 setPosition:v17, v19];

  double v21 = [(InteractiveAccelerometerViewController *)self view];
  [v21 center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v26 setPosition:v23, v25];

  v27 = [(InteractiveAccelerometerViewController *)self view];
  [v27 center];
  double v29 = v28;
  double v31 = v30;
  v32 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v32 setPosition:v29, v31];

  v33 = [(InteractiveAccelerometerViewController *)self view];
  [v33 bounds];
  CGFloat v35 = v34;
  double v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;

  v59.origin.x = v35;
  v59.origin.y = v37;
  v59.size.width = v39;
  v59.size.height = v41;
  double MidX = CGRectGetMidX(v59);
  v60.origin.x = v35;
  v60.origin.y = v37;
  v60.size.width = v39;
  v60.size.height = v41;
  double v43 = MidX - CGRectGetWidth(v60) * 0.5;
  UIFontDescriptorAttributeName v44 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v44 bounds];
  double v45 = v43 + CGRectGetWidth(v61) * 0.5;
  v62.origin.x = v35;
  v62.origin.y = v37;
  v62.size.width = v39;
  v62.size.height = v41;
  double MidY = CGRectGetMidY(v62);
  int v47 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v47 setPosition:v45 MidY];

  v63.origin.x = v35;
  v63.origin.y = v37;
  v63.size.width = v39;
  v63.size.height = v41;
  double v48 = CGRectGetMidX(v63);
  v64.origin.x = v35;
  v64.origin.y = v37;
  v64.size.width = v39;
  v64.size.height = v41;
  double v49 = v48 + CGRectGetWidth(v64) * 0.5;
  v50 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v50 bounds];
  double v51 = v49 - CGRectGetWidth(v65) * 0.5;
  v66.origin.x = v35;
  v66.origin.y = v37;
  v66.size.width = v39;
  v66.size.height = v41;
  double v52 = CGRectGetMidY(v66);
  v53 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v53 setPosition:v51, v52];

  v67.origin.x = v35;
  v67.origin.y = v37;
  v67.size.width = v39;
  v67.size.height = v41;
  CGFloat v54 = v37 + CGRectGetHeight(v67) * 0.5;
  v68.origin.x = v35;
  v68.origin.y = v54;
  v68.size.width = v39;
  v68.size.height = v41;
  double v55 = CGRectGetMidX(v68);
  v69.origin.x = v35;
  v69.origin.y = v54;
  v69.size.width = v39;
  v69.size.height = v41;
  double MinY = CGRectGetMinY(v69);
  v57 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v57 setPosition:v55 MinY];
}

- (void)setupView
{
  v3 = [(InteractiveAccelerometerViewController *)self view];
  [v3 setClipsToBounds:1];

  double v4 = +[UIColor whiteColor];
  double v5 = [(InteractiveAccelerometerViewController *)self view];
  [v5 setBackgroundColor:v4];

  double v6 = [(InteractiveAccelerometerViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  [(InteractiveAccelerometerViewController *)self setFilterContainer:v15];

  double v16 = +[UIColor clearColor];
  double v17 = [(InteractiveAccelerometerViewController *)self filterContainer];
  [v17 setBackgroundColor:v16];

  double v18 = [(InteractiveAccelerometerViewController *)self filterContainer];
  [v18 setClipsToBounds:1];

  double v19 = [(InteractiveAccelerometerViewController *)self filterContainer];
  [v19 setAutoresizingMask:18];

  id v20 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  [(InteractiveAccelerometerViewController *)self setLevelContainer:v20];

  double v21 = +[UIColor clearColor];
  double v22 = [(InteractiveAccelerometerViewController *)self levelContainer];
  [v22 setBackgroundColor:v21];

  double v23 = [(InteractiveAccelerometerViewController *)self levelContainer];
  [v23 setAutoresizingMask:18];

  id v24 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  [(InteractiveAccelerometerViewController *)self setLevelHoldContainer:v24];

  double v25 = +[UIColor clearColor];
  v26 = [(InteractiveAccelerometerViewController *)self levelHoldContainer];
  [v26 setBackgroundColor:v25];

  v27 = [(InteractiveAccelerometerViewController *)self levelHoldContainer];
  [v27 setAutoresizingMask:18];

  id v28 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  [(InteractiveAccelerometerViewController *)self setBubbleContainer:v28];

  double v29 = +[UIColor clearColor];
  double v30 = [(InteractiveAccelerometerViewController *)self bubbleContainer];
  [v30 setBackgroundColor:v29];

  double v31 = [(InteractiveAccelerometerViewController *)self bubbleContainer];
  [v31 setAutoresizingMask:18];

  id v32 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  [(InteractiveAccelerometerViewController *)self setTicContainer:v32];

  v33 = +[UIColor clearColor];
  double v34 = [(InteractiveAccelerometerViewController *)self ticContainer];
  [v34 setBackgroundColor:v33];

  CGFloat v35 = [(InteractiveAccelerometerViewController *)self ticContainer];
  [v35 setAutoresizingMask:18];

  uint64_t v208 = kCAFilterXor;
  double v36 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  double v37 = [(InteractiveAccelerometerViewController *)self ticContainer];
  double v38 = [v37 layer];
  [v38 setCompositingFilter:v36];

  v209.origin.x = v8;
  v209.origin.y = v10;
  v209.size.width = v12;
  v209.size.height = v14;
  CGFloat v39 = v10 + CGRectGetHeight(v209) * 0.5;
  v210.origin.x = v8;
  v210.origin.y = v39;
  v210.size.width = v12;
  v210.size.height = v14;
  double Width = CGRectGetWidth(v210);
  v211.origin.x = v8;
  v211.origin.y = v39;
  v211.size.width = v12;
  v211.size.height = v14;
  CGFloat Height = CGRectGetHeight(v211);
  CGFloat v42 = Height + Height;
  v212.origin.x = v8;
  v212.origin.y = v39;
  v212.size.width = v12;
  v212.size.height = v14;
  double v43 = v12 - (-CGRectGetWidth(v212) - Width);
  UIFontDescriptorAttributeName v44 = +[CALayer layer];
  [(InteractiveAccelerometerViewController *)self setLevelBottom:v44];

  double v45 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v45 setAnchorPoint:0.5, 0.0];

  long long v46 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v46 setFrame:CGRectMake(v8 - Width, v39 + 0.0, v43, v14 - (0.0 - v42))];

  id v47 = +[UIColor blackColor];
  id v48 = [v47 CGColor];
  double v49 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v49 setBackgroundColor:v48];

  v50 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v50 setAllowsEdgeAntialiasing:1];

  double v51 = [(InteractiveAccelerometerViewController *)self levelContainer];
  double v52 = [v51 layer];
  v53 = [(InteractiveAccelerometerViewController *)self levelBottom];
  [v52 addSublayer:v53];

  CGFloat v54 = [(InteractiveAccelerometerViewController *)self filterContainer];
  double v55 = [(InteractiveAccelerometerViewController *)self levelContainer];
  [v54 addSubview:v55];

  v56 = [(InteractiveAccelerometerViewController *)self levelContainer];
  v57 = [(InteractiveAccelerometerViewController *)self levelHoldContainer];
  [v56 addSubview:v57];

  objc_super v58 = +[CAShapeLayer layer];
  [(InteractiveAccelerometerViewController *)self setTopOuterCircle:v58];

  CGRect v59 = [(InteractiveAccelerometerViewController *)self view];
  [v59 frame];
  double v61 = v60;
  if (MGIsDeviceOfType()) {
    double v62 = 0.850000024;
  }
  else {
    double v62 = 1.0;
  }
  double v63 = v62 * round(v61 * 200.0 / 320.0);
  CGRect v64 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v64 setFrame:0.0, 0.0, v63, v63];

  CGRect v65 = [(InteractiveAccelerometerViewController *)self view];
  [v65 frame];
  double v67 = v66;
  if (MGIsDeviceOfType()) {
    double v68 = 0.850000024;
  }
  else {
    double v68 = 1.0;
  }
  double v69 = v68 * round(v67 * 200.0 / 320.0);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v69, v69);
  id v70 = objc_claimAutoreleasedReturnValue();
  id v71 = [v70 CGPath];
  v72 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v72 setPath:v71];

  id v73 = +[UIColor blackColor];
  id v74 = [v73 CGColor];
  v75 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v75 setFillColor:v74];

  v76 = +[CAFilter filterWithType:v208];
  v77 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v77 setCompositingFilter:v76];

  v78 = +[CAShapeLayer layer];
  [(InteractiveAccelerometerViewController *)self setTopInnerCircle:v78];

  v79 = [(InteractiveAccelerometerViewController *)self view];
  [v79 frame];
  double v81 = v80;
  if (MGIsDeviceOfType()) {
    double v82 = 0.850000024;
  }
  else {
    double v82 = 1.0;
  }
  double v83 = v82 * round(v81 * 195.0 / 320.0);
  v84 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v84 setFrame:0.0, 0.0, v83, v83];

  v85 = [(InteractiveAccelerometerViewController *)self view];
  [v85 frame];
  double v87 = v86;
  if (MGIsDeviceOfType()) {
    double v88 = 0.850000024;
  }
  else {
    double v88 = 1.0;
  }
  double v89 = v88 * round(v87 * 195.0 / 320.0);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v89, v89);
  id v90 = objc_claimAutoreleasedReturnValue();
  id v91 = [v90 CGPath];
  v92 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v92 setPath:v91];

  id v93 = +[UIColor blackColor];
  id v94 = [v93 CGColor];
  v95 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v95 setFillColor:v94];

  v96 = +[CAFilter filterWithType:v208];
  v97 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v97 setCompositingFilter:v96];

  v98 = +[CAShapeLayer layer];
  [(InteractiveAccelerometerViewController *)self setBottomOuterCircle:v98];

  v99 = [(InteractiveAccelerometerViewController *)self view];
  [v99 frame];
  double v101 = v100;
  if (MGIsDeviceOfType()) {
    double v102 = 0.850000024;
  }
  else {
    double v102 = 1.0;
  }
  double v103 = v102 * round(v101 * 200.0 / 320.0);
  v104 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v104 setFrame:0.0, 0.0, v103, v103];

  v105 = [(InteractiveAccelerometerViewController *)self view];
  [v105 frame];
  double v107 = v106;
  if (MGIsDeviceOfType()) {
    double v108 = 0.850000024;
  }
  else {
    double v108 = 1.0;
  }
  double v109 = v108 * round(v107 * 200.0 / 320.0);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v109, v109);
  id v110 = objc_claimAutoreleasedReturnValue();
  id v111 = [v110 CGPath];
  v112 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v112 setPath:v111];

  id v113 = +[UIColor blackColor];
  id v114 = [v113 CGColor];
  v115 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v115 setFillColor:v114];

  v116 = +[CAFilter filterWithType:v208];
  v117 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v117 setCompositingFilter:v116];

  v118 = +[CAShapeLayer layer];
  [(InteractiveAccelerometerViewController *)self setBottomInnerCircle:v118];

  v119 = [(InteractiveAccelerometerViewController *)self view];
  [v119 frame];
  double v121 = v120;
  if (MGIsDeviceOfType()) {
    double v122 = 0.850000024;
  }
  else {
    double v122 = 1.0;
  }
  double v123 = v122 * round(v121 * 195.0 / 320.0);
  v124 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v124 setFrame:0.0, 0.0, v123, v123];

  v125 = [(InteractiveAccelerometerViewController *)self view];
  [v125 frame];
  double v127 = v126;
  if (MGIsDeviceOfType()) {
    double v128 = 0.850000024;
  }
  else {
    double v128 = 1.0;
  }
  double v129 = v128 * round(v127 * 195.0 / 320.0);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v129, v129);
  id v130 = objc_claimAutoreleasedReturnValue();
  id v131 = [v130 CGPath];
  v132 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v132 setPath:v131];

  id v133 = +[UIColor blackColor];
  id v134 = [v133 CGColor];
  v135 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v135 setFillColor:v134];

  v136 = +[CAFilter filterWithType:v208];
  v137 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v137 setCompositingFilter:v136];

  v138 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v139 = [v138 layer];
  v140 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
  [v139 addSublayer:v140];

  v141 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v142 = [v141 layer];
  v143 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
  [v142 addSublayer:v143];

  v144 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v145 = [v144 layer];
  v146 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
  [v145 addSublayer:v146];

  v147 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v148 = [v147 layer];
  v149 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
  [v148 addSublayer:v149];

  id v150 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 100.0, 100.0];
  [(InteractiveAccelerometerViewController *)self setDegreesLabel:v150];

  v151 = [(InteractiveAccelerometerViewController *)self fontDescriptor];
  v152 = [(InteractiveAccelerometerViewController *)self view];
  [v152 frame];
  double v154 = v153;
  if (MGIsDeviceOfType()) {
    double v155 = 0.850000024;
  }
  else {
    double v155 = 1.0;
  }
  v156 = +[UIFont fontWithDescriptor:v151 size:v155 * round(v154 * 81.0 / 320.0)];
  v157 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  [v157 setFont:v156];

  v158 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  [v158 sizeToFit];

  v159 = +[UIColor blackColor];
  v160 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  [v160 setTextColor:v159];

  v161 = +[CAFilter filterWithType:v208];
  v162 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  v163 = [v162 layer];
  [v163 setCompositingFilter:v161];

  v164 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v165 = [(InteractiveAccelerometerViewController *)self degreesLabel];
  [v164 addSubview:v165];

  v166 = +[CALayer layer];
  [(InteractiveAccelerometerViewController *)self setRightLevelTic:v166];

  v167 = [(InteractiveAccelerometerViewController *)self view];
  [v167 frame];
  double v169 = v168;
  if (MGIsDeviceOfType()) {
    double v170 = 0.850000024;
  }
  else {
    double v170 = 1.0;
  }
  double v171 = v170 * round(v169 * 40.5 / 320.0);
  v172 = [(InteractiveAccelerometerViewController *)self view];
  [v172 frame];
  double v174 = v173;
  if (MGIsDeviceOfType()) {
    double v175 = 0.850000024;
  }
  else {
    double v175 = 1.0;
  }
  double v176 = v175 * round(v174 * 1.5 / 320.0);
  v177 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v177 setFrame:0.0, 0.0, v171, v176];

  id v178 = +[UIColor blackColor];
  id v179 = [v178 CGColor];
  v180 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v180 setBackgroundColor:v179];

  v181 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v181 setAllowsEdgeAntialiasing:1];

  v182 = [(InteractiveAccelerometerViewController *)self ticContainer];
  v183 = [v182 layer];
  v184 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
  [v183 addSublayer:v184];

  v185 = +[CALayer layer];
  [(InteractiveAccelerometerViewController *)self setLeftLevelTic:v185];

  v186 = [(InteractiveAccelerometerViewController *)self view];
  [v186 frame];
  double v188 = v187;
  if (MGIsDeviceOfType()) {
    double v189 = 0.850000024;
  }
  else {
    double v189 = 1.0;
  }
  double v190 = v189 * round(v188 * 40.5 / 320.0);
  v191 = [(InteractiveAccelerometerViewController *)self view];
  [v191 frame];
  double v193 = v192;
  if (MGIsDeviceOfType()) {
    double v194 = 0.850000024;
  }
  else {
    double v194 = 1.0;
  }
  double v195 = v194 * round(v193 * 1.5 / 320.0);
  v196 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v196 setFrame:0.0, 0.0, v190, v195];

  id v197 = +[UIColor blackColor];
  id v198 = [v197 CGColor];
  v199 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v199 setBackgroundColor:v198];

  v200 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v200 setAllowsEdgeAntialiasing:1];

  v201 = [(InteractiveAccelerometerViewController *)self ticContainer];
  v202 = [v201 layer];
  v203 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  [v202 addSublayer:v203];

  v204 = [(InteractiveAccelerometerViewController *)self filterContainer];
  v205 = [(InteractiveAccelerometerViewController *)self ticContainer];
  [v204 addSubview:v205];

  v206 = [(InteractiveAccelerometerViewController *)self view];
  v207 = [(InteractiveAccelerometerViewController *)self filterContainer];
  [v206 addSubview:v207];
}

- (BOOL)isDebuggingEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"Test4154Debugging", @"com.apple.Diagnostics", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)startAnimations
{
  BOOL v3 = [(InteractiveAccelerometerViewController *)self displayLink];

  if (!v3)
  {
    double v4 = +[CADisplayLink displayLinkWithTarget:self selector:"updateDisplay:"];
    [(InteractiveAccelerometerViewController *)self setDisplayLink:v4];

    id v6 = [(InteractiveAccelerometerViewController *)self displayLink];
    double v5 = +[NSRunLoop currentRunLoop];
    [v6 addToRunLoop:v5 forMode:NSRunLoopCommonModes];
  }
}

- (void)stopAnimations
{
  BOOL v3 = [(InteractiveAccelerometerViewController *)self displayLink];

  if (v3)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (BOOL)determineTestingOrientation
{
  BOOL v3 = [(InteractiveAccelerometerViewController *)self inputs];
  double v4 = [v3 orientationsParameter];
  double v5 = [v4 objectAtIndexedSubscript:[self orientationsIndex]];
  unsigned __int8 v6 = [v5 isEqualToString:@"portrait"];

  if (v6)
  {
    uint64_t v7 = 1;
LABEL_13:
    [(InteractiveAccelerometerViewController *)self setTestingOrientation:v7];
    return 1;
  }
  double v8 = [(InteractiveAccelerometerViewController *)self inputs];
  double v9 = [v8 orientationsParameter];
  double v10 = [v9 objectAtIndexedSubscript:-[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")];
  unsigned __int8 v11 = [v10 isEqualToString:@"portraitUpsideDown"];

  if (v11)
  {
    uint64_t v7 = 2;
    goto LABEL_13;
  }
  double v12 = [(InteractiveAccelerometerViewController *)self inputs];
  double v13 = [v12 orientationsParameter];
  double v14 = [v13 objectAtIndexedSubscript:-[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")];
  unsigned __int8 v15 = [v14 isEqualToString:@"landscapeLeft"];

  if (v15)
  {
    uint64_t v7 = 3;
    goto LABEL_13;
  }
  double v16 = [(InteractiveAccelerometerViewController *)self inputs];
  double v17 = [v16 orientationsParameter];
  double v18 = [v17 objectAtIndexedSubscript:-[InteractiveAccelerometerViewController orientationsIndex](self, "orientationsIndex")];
  unsigned __int8 v19 = [v18 isEqualToString:@"landscapeRight"];

  if (v19)
  {
    uint64_t v7 = 4;
    goto LABEL_13;
  }
  id v20 = [(InteractiveAccelerometerViewController *)self inputs];
  double v21 = [v20 orientationsParameter];
  double v22 = [v21 objectAtIndexedSubscript:[self orientationsIndex]];
  unsigned __int8 v23 = [v22 isEqualToString:@"faceUp"];

  if (v23)
  {
    uint64_t v7 = 5;
    goto LABEL_13;
  }
  id v24 = [(InteractiveAccelerometerViewController *)self inputs];
  double v25 = [v24 orientationsParameter];
  v26 = [v25 objectAtIndexedSubscript:[self orientationsIndex]];
  unsigned int v27 = [v26 isEqualToString:@"faceDown"];

  if (v27)
  {
    uint64_t v7 = 6;
    goto LABEL_13;
  }
  return 0;
}

- (void)addNotStationaryData
{
  BOOL v3 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  objc_sync_enter(v3);
  double v4 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  id v5 = [v4 copy];

  unsigned __int8 v6 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  [v6 removeAllObjects];

  objc_sync_exit(v3);
  if ([(InteractiveAccelerometerViewController *)self debuggingEnabled])
  {
    v11[0] = @"rawData";
    v11[1] = @"calibratedData";
    v12[0] = v5;
    uint64_t v7 = [(InteractiveAccelerometerViewController *)self motionManagerData];
    id v8 = [v7 copy];
    v12[1] = v8;
    double v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(InteractiveAccelerometerViewController *)self setNotStationaryData:v9];
  }
  double v10 = [(InteractiveAccelerometerViewController *)self motionManagerData];
  [v10 removeAllObjects];
}

- (void)addStationaryData
{
  BOOL v3 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  objc_sync_enter(v3);
  double v4 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  id v5 = [v4 copy];
  [(InteractiveAccelerometerViewController *)self setCopiedRawComponentData:v5];

  unsigned __int8 v6 = [(InteractiveAccelerometerViewController *)self rawComponentData];
  [v6 removeAllObjects];

  objc_sync_exit(v3);
  uint64_t v7 = [(InteractiveAccelerometerViewController *)self motionManagerData];
  id v8 = [v7 copy];
  [(InteractiveAccelerometerViewController *)self setCopiedMotionManagerData:v8];

  if ([(InteractiveAccelerometerViewController *)self debuggingEnabled])
  {
    v13[0] = @"rawData";
    double v9 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
    v13[1] = @"calibratedData";
    v14[0] = v9;
    double v10 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
    v14[1] = v10;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(InteractiveAccelerometerViewController *)self setStationaryData:v11];
  }
  double v12 = [(InteractiveAccelerometerViewController *)self motionManagerData];
  [v12 removeAllObjects];
}

- (void)checkWithinOffset
{
  signed int v3 = [(InteractiveAccelerometerViewController *)self orientationsIndex];
  double v4 = [(InteractiveAccelerometerViewController *)self inputs];
  id v5 = [v4 orientationsParameter];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= v3)
  {
    double v9 = 0;
  }
  else
  {
    uint64_t v7 = [(InteractiveAccelerometerViewController *)self inputs];
    id v8 = [v7 orientationsParameter];
    double v9 = [v8 objectAtIndexedSubscript:[self orientationsIndex]];

    if (v9)
    {
      double v10 = [(InteractiveAccelerometerViewController *)self inputs];
      unsigned __int8 v11 = [v10 componentOrientationSpecifications];
      double v12 = [v11 objectForKeyedSubscript:v9];

      if (v12)
      {
        double v13 = [(InteractiveAccelerometerViewController *)self inputs];
        id v14 = [v13 componentSensor];

        if (v14)
        {
          unsigned __int8 v15 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
          double v16 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v15, @"x", [v16 count]);
          double v17 = numberOrNullForDouble();

          double v18 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
          unsigned __int8 v19 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v18, @"y", [v19 count]);
          id v20 = numberOrNullForDouble();

          double v21 = [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
          [(InteractiveAccelerometerViewController *)self copiedMotionManagerData];
        }
        else
        {
          double v22 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
          unsigned __int8 v23 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v22, @"x", [v23 count]);
          double v17 = numberOrNullForDouble();

          id v24 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
          double v25 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
          -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v24, @"y", [v25 count]);
          id v20 = numberOrNullForDouble();

          double v21 = [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
          [(InteractiveAccelerometerViewController *)self copiedRawComponentData];
        v26 = };
        -[InteractiveAccelerometerViewController average:key:size:](self, "average:key:size:", v21, @"z", [v26 count]);
        unsigned int v27 = numberOrNullForDouble();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v28 = self;
          uint64_t v29 = 4294967286;
        }
        else
        {
          [v17 doubleValue];
          double v32 = v31;
          [v12 upperBoundOffsetThresholdX];
          if (v32 <= v33)
          {
            [v17 doubleValue];
            double v35 = v34;
            [v12 lowerBoundOffsetThresholdX];
            if (v35 >= v36)
            {
              [v20 doubleValue];
              double v38 = v37;
              [v12 upperBoundOffsetThresholdY];
              if (v38 <= v39)
              {
                [v20 doubleValue];
                double v41 = v40;
                [v12 lowerBoundOffsetThresholdY];
                if (v41 >= v42)
                {
                  [v27 doubleValue];
                  double v44 = v43;
                  [v12 upperBoundOffsetThresholdZ];
                  if (v44 <= v45)
                  {
                    [v27 doubleValue];
                    double v47 = v46;
                    [v12 lowerBoundOffsetThresholdZ];
                    if (v47 >= v48)
                    {
                      [(InteractiveAccelerometerViewController *)self setDidCompleteSuccessfully:0];
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
          }
          id v28 = self;
          uint64_t v29 = 4294967288;
        }
        [(InteractiveAccelerometerViewController *)v28 setDidCompleteSuccessfully:v29];
        [(InteractiveAccelerometerViewController *)self setOrientationMissed:1];
LABEL_15:
        v49[0] = @"x";
        v49[1] = @"y";
        v50[0] = v17;
        v50[1] = v20;
        v49[2] = @"z";
        v50[2] = v27;
        double v30 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
        [(InteractiveAccelerometerViewController *)self setAveragedRawData:v30];

        goto LABEL_8;
      }
    }
  }
  [(InteractiveAccelerometerViewController *)self endTestWithStatusCode:&off_100010C98];
LABEL_8:
}

- (void)cleanUp
{
  signed int v3 = [(InteractiveAccelerometerViewController *)self timeoutTimer];

  if (v3)
  {
    double v4 = [(InteractiveAccelerometerViewController *)self timeoutTimer];
    [v4 invalidate];

    [(InteractiveAccelerometerViewController *)self setTimeoutTimer:0];
  }
  id v5 = +[DAHIDEventMonitor sharedInstance];
  [v5 stopMonitoring];

  [(InteractiveAccelerometerViewController *)self stopAnimations];
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  [(InteractiveAccelerometerViewController *)self cleanUp];
  id v5 = [(InteractiveAccelerometerViewController *)self result];
  [v5 setStatusCode:v4];

  id v6 = [(InteractiveAccelerometerViewController *)self result];
  uint64_t v7 = [v6 statusCode];
  if ([v7 isEqualToNumber:&off_100010CB0]) {
    goto LABEL_8;
  }
  id v8 = [(InteractiveAccelerometerViewController *)self result];
  double v9 = [v8 statusCode];
  if ([v9 isEqualToNumber:&off_100010CC8])
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  double v10 = [(InteractiveAccelerometerViewController *)self result];
  unsigned __int8 v11 = [v10 statusCode];
  if ([v11 isEqualToNumber:&off_100010CE0])
  {
LABEL_6:

    goto LABEL_7;
  }
  double v12 = [(InteractiveAccelerometerViewController *)self result];
  double v13 = [v12 statusCode];
  if ([v13 isEqualToNumber:&off_100010CF8])
  {

    goto LABEL_6;
  }
  unsigned __int8 v19 = [(InteractiveAccelerometerViewController *)self result];
  double v16 = [v19 statusCode];
  unsigned __int8 v20 = [v16 isEqualToNumber:&off_100010C98];

  if ((v20 & 1) == 0)
  {
    CFStringRef v21 = @"orientations";
    unsigned __int8 v15 = [(InteractiveAccelerometerViewController *)self allResults];
    double v22 = v15;
    double v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    double v18 = [(InteractiveAccelerometerViewController *)self result];
    [v18 setData:v17];

    goto LABEL_12;
  }
LABEL_9:
  id v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100009BB8(v14);
  }

  unsigned __int8 v15 = [(InteractiveAccelerometerViewController *)self result];
  [v15 setData:&__NSDictionary0__struct];
LABEL_12:

  [(InteractiveAccelerometerViewController *)self setFinished:1];
}

- (void)notStationaryTimedOut
{
  [(InteractiveAccelerometerViewController *)self addNotStationaryData];
  [(InteractiveAccelerometerViewController *)self setDidCompleteSuccessfully:4294967291];
  [(InteractiveAccelerometerViewController *)self setOrientationMissed:1];

  [(InteractiveAccelerometerViewController *)self checkForNextOrientation];
}

- (void)heldOrientationStationary
{
  [(InteractiveAccelerometerViewController *)self addNotStationaryData];
  signed int v3 = [(InteractiveAccelerometerViewController *)self timeoutTimer];

  if (v3)
  {
    id v4 = [(InteractiveAccelerometerViewController *)self timeoutTimer];
    [v4 invalidate];

    [(InteractiveAccelerometerViewController *)self setSamplingRawData:1];
    id v6 = [(InteractiveAccelerometerViewController *)self inputs];
    [v6 secondsToRunOrientation];
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "checkForNextOrientation", 0, 0);
    [(InteractiveAccelerometerViewController *)self setTimeoutTimer:v5];
  }
}

- (void)checkForNextOrientation
{
  if ([(InteractiveAccelerometerViewController *)self samplingRawData])
  {
    [(InteractiveAccelerometerViewController *)self setSamplingRawData:0];
    [(InteractiveAccelerometerViewController *)self addStationaryData];
    [(InteractiveAccelerometerViewController *)self checkWithinOffset];
  }
  unsigned int v3 = [(InteractiveAccelerometerViewController *)self debuggingEnabled];
  id v4 = [(InteractiveAccelerometerViewController *)self allResults];
  if (v3)
  {
    v32[0] = @"orientation";
    id v5 = [(InteractiveAccelerometerViewController *)self inputs];
    id v6 = [v5 orientationsParameter];
    uint64_t v7 = [v6 objectAtIndexedSubscript:[self orientationsIndex]];
    v33[0] = v7;
    v32[1] = @"didCompleteSuccessfully";
    id v8 = +[NSNumber numberWithInt:[(InteractiveAccelerometerViewController *)self didCompleteSuccessfully]];
    v33[1] = v8;
    v32[2] = @"averagedRawData";
    double v9 = [(InteractiveAccelerometerViewController *)self averagedRawData];
    v33[2] = v9;
    v32[3] = @"notStationaryData";
    double v10 = [(InteractiveAccelerometerViewController *)self notStationaryData];
    v33[3] = v10;
    v32[4] = @"stationaryData";
    unsigned __int8 v11 = [(InteractiveAccelerometerViewController *)self stationaryData];
    v33[4] = v11;
    double v12 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
    [v4 addObject:v12];
  }
  else
  {
    v30[0] = @"orientation";
    id v5 = [(InteractiveAccelerometerViewController *)self inputs];
    id v6 = [v5 orientationsParameter];
    uint64_t v7 = [v6 objectAtIndexedSubscript:[self orientationsIndex]];
    v31[0] = v7;
    v30[1] = @"didCompleteSuccessfully";
    id v8 = +[NSNumber numberWithInt:[(InteractiveAccelerometerViewController *)self didCompleteSuccessfully]];
    v31[1] = v8;
    v30[2] = @"averagedRawData";
    double v9 = [(InteractiveAccelerometerViewController *)self averagedRawData];
    v31[2] = v9;
    double v10 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    [v4 addObject:v10];
  }

  [(InteractiveAccelerometerViewController *)self setOrientationsIndex:[(InteractiveAccelerometerViewController *)self orientationsIndex] + 1];
  signed int v13 = [(InteractiveAccelerometerViewController *)self orientationsIndex];
  id v14 = [(InteractiveAccelerometerViewController *)self inputs];
  unsigned __int8 v15 = [v14 orientationsParameter];
  id v16 = [v15 count];

  if ((unint64_t)v16 <= v13)
  {
    if ([(InteractiveAccelerometerViewController *)self orientationMissed]) {
      unsigned int v27 = &off_100010D10;
    }
    else {
      unsigned int v27 = &off_100010D28;
    }
    goto LABEL_20;
  }
  if (![(InteractiveAccelerometerViewController *)self determineTestingOrientation])
  {
    unsigned int v27 = &off_100010C68;
LABEL_20:
    [(InteractiveAccelerometerViewController *)self endTestWithStatusCode:v27];
    return;
  }
  [(InteractiveAccelerometerViewController *)self setZeroRangeAndDegreesShiftRange];
  double v17 = +[NSDictionary dictionary];
  [(InteractiveAccelerometerViewController *)self setAveragedRawData:v17];

  if ([(InteractiveAccelerometerViewController *)self debuggingEnabled])
  {
    double v18 = +[NSDictionary dictionary];
    [(InteractiveAccelerometerViewController *)self setNotStationaryData:v18];

    unsigned __int8 v19 = +[NSDictionary dictionary];
    [(InteractiveAccelerometerViewController *)self setStationaryData:v19];
  }
  unsigned __int8 v20 = +[NSDate date];
  [(InteractiveAccelerometerViewController *)self setStartDate:v20];

  CFStringRef v21 = +[DSTestAutomation sharedInstance];
  unsigned int v22 = [v21 testAutomationEnabled];

  if (v22)
  {
    unsigned __int8 v23 = [(InteractiveAccelerometerViewController *)self inputs];
    if ([v23 componentSensor]) {
      CFStringRef v24 = @"ListenForGyroPosition";
    }
    else {
      CFStringRef v24 = @"ListenForAccelerometerPosition";
    }
    double v25 = +[NSNumber numberWithInteger:[(InteractiveAccelerometerViewController *)self testingOrientation]];
    uint64_t v29 = v25;
    v26 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    +[DSTestAutomation postInteractiveTestEvent:v24 info:v26];
  }
  [(InteractiveAccelerometerViewController *)self updateColors];
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetType() == 13)
  {
    IOHIDEventGetFloatValue();
    float v5 = v4;
    IOHIDEventGetFloatValue();
    float v7 = v6;
    IOHIDEventGetFloatValue();
    float v9 = v8;
    double v10 = [(InteractiveAccelerometerViewController *)self rawComponentData];
    objc_sync_enter(v10);
    unsigned __int8 v11 = [(InteractiveAccelerometerViewController *)self rawComponentData];
    v36[0] = @"x";
    *(float *)&double v12 = v5;
    signed int v13 = +[NSNumber numberWithFloat:v12];
    v37[0] = v13;
    v36[1] = @"y";
    *(float *)&double v14 = v7;
    unsigned __int8 v15 = +[NSNumber numberWithFloat:v14];
    v37[1] = v15;
    v36[2] = @"z";
    *(float *)&double v16 = v9;
    double v17 = +[NSNumber numberWithFloat:v16];
    v37[2] = v17;
    double v18 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    [v11 addObject:v18];

    objc_sync_exit(v10);
  }
  if (IOHIDEventGetType() == 20)
  {
    IOHIDEventGetFloatValue();
    double v20 = v19;
    IOHIDEventGetFloatValue();
    double v22 = v21;
    IOHIDEventGetFloatValue();
    float v23 = v20;
    *(float *)&double v20 = v24;
    double v25 = [(InteractiveAccelerometerViewController *)self rawComponentData];
    objc_sync_enter(v25);
    v26 = [(InteractiveAccelerometerViewController *)self rawComponentData];
    v34[0] = @"x";
    *(float *)&double v27 = v23;
    uint64_t v28 = +[NSNumber numberWithFloat:v27];
    v35[0] = v28;
    v34[1] = @"y";
    *(float *)&double v22 = v22;
    LODWORD(v29) = LODWORD(v22);
    double v30 = +[NSNumber numberWithFloat:v29];
    v35[1] = v30;
    v34[2] = @"z";
    LODWORD(v31) = LODWORD(v20);
    double v32 = +[NSNumber numberWithFloat:v31];
    v35[2] = v32;
    float v33 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    [v26 addObject:v33];

    objc_sync_exit(v25);
  }
}

- (void)updateDisplay:(id)a3
{
  double v4 = [(CMMotionManager *)self->_manager deviceMotion];
  float v5 = [v4 attitude];

  double v70 = 0.0;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  if (v5)
  {
    [v5 rotationMatrix];
    double v6 = *(double *)&v67;
    double v7 = *((double *)&v68 + 1);
    double v8 = v70;
  }
  else
  {
    double v8 = 0.0;
    double v7 = 0.0;
    double v6 = 0.0;
  }
  double v9 = -v8;
  double v10 = [(InteractiveAccelerometerViewController *)self inputs];
  id v11 = [v10 componentSensor];

  if (v11 == (id)1)
  {
    double v12 = [(InteractiveAccelerometerViewController *)self manager];
    signed int v13 = [v12 deviceMotion];
    [v13 rotationRate];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    double v20 = [(InteractiveAccelerometerViewController *)self motionManagerData];
    v71[0] = @"x";
    double v21 = +[NSNumber numberWithDouble:v15];
    v72[0] = v21;
    v71[1] = @"y";
    double v22 = +[NSNumber numberWithDouble:v17];
    v72[1] = v22;
    v71[2] = @"z";
    float v23 = +[NSNumber numberWithDouble:v19];
    v72[2] = v23;
    double v24 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
    [v20 addObject:v24];
  }
  double v25 = v7 * v7 + v6 * v6;
  double v26 = sqrt(v25);
  double v27 = 0.0;
  if (v25 <= 0.0) {
    double v28 = 0.0;
  }
  else {
    double v28 = v26;
  }
  double v29 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  double v30 = atan2(-v6, v7);
  CGFloat v31 = -1.57079633;
  double v32 = acos(v9) + -1.57079633;
  unsigned int v33 = [(InteractiveAccelerometerViewController *)self _updateForRotation:v30 shiftAngle:v32];
  if (v28 <= 0.100000001)
  {
    int64_t v36 = [(InteractiveAccelerometerViewController *)self rotationOrientation];
    if ((unint64_t)(v36 - 2) <= 2) {
      double v27 = dbl_10000CEB0[v36 - 2];
    }
    double v37 = v27 - v30;
    if (v27 - v30 <= 3.14159265)
    {
      if (v37 < -3.14159265) {
        double v27 = v30 + v37 + 6.28318531;
      }
    }
    else
    {
      double v27 = v30 - (6.28318531 - v37);
    }
    double v38 = 1.0;
    if (v28 >= 0.0250000004) {
      double v38 = (v28 + -0.0250000004) / -0.0750000011 + 1.0;
    }
    double v30 = v30 + v38 * (v27 - v30);
    CGFloat v31 = v27;
  }
  else
  {
    double v34 = v30 * 180.0 / 3.14159265;
    double v35 = fabs(v34);
    if (v35 >= 45.0)
    {
      if (v35 <= 135.0)
      {
        if (v34 <= 45.0 || v34 >= 135.0)
        {
          [(InteractiveAccelerometerViewController *)self setRotationOrientation:4];
        }
        else
        {
          [(InteractiveAccelerometerViewController *)self setRotationOrientation:3];
          CGFloat v31 = 1.57079633;
        }
      }
      else
      {
        [(InteractiveAccelerometerViewController *)self setRotationOrientation:2];
        CGFloat v31 = -3.14159265;
      }
    }
    else
    {
      [(InteractiveAccelerometerViewController *)self setRotationOrientation:1];
      CGFloat v31 = 0.0;
    }
  }
  [(InteractiveAccelerometerViewController *)self previousShift];
  if (vabdd_f64(v32, v39) > 0.0000999999975
    || ([(InteractiveAccelerometerViewController *)self previousRotation],
        vabdd_f64(v30, v40) > 0.0000999999975))
  {
    unsigned int v33 = 1;
  }
  double v41 = v32 / 1.57079633;
  if ([(InteractiveAccelerometerViewController *)self framesLevel] >= 1)
  {
    double v42 = (double)[(InteractiveAccelerometerViewController *)self framesLevel] / 30.0;
    if ((id)[(InteractiveAccelerometerViewController *)self orientation] == (id)6)
    {
      double v41 = v41 * (1.0 - v42) - v42;
    }
    else if ((id)[(InteractiveAccelerometerViewController *)self orientation] == (id)5)
    {
      double v41 = v42 + v41 * (1.0 - v42);
    }
  }
  if (v33)
  {
    double v43 = [(InteractiveAccelerometerViewController *)self view];
    [v43 bounds];
    CGFloat v44 = CGRectGetHeight(v73) * 1.29999995;

    *(float *)&double v45 = v28;
    [v29 _solveForInput:v45];
    CGFloat v47 = v44 * (v46 * 0.399999976 + 0.600000024);
    memset(&v65, 0, sizeof(v65));
    CATransform3DMakeRotation(&v65, v30, 0.0, 0.0, -1.0);
    memset(&v64, 0, sizeof(v64));
    CATransform3D v63 = v65;
    CATransform3DTranslate(&v64, &v63, 0.0, -(v44 * v41), 0.0);
    memset(&v63, 0, sizeof(v63));
    CATransform3D v62 = v65;
    CATransform3DTranslate(&v63, &v62, 0.0, -(v47 * (v41 + -1.0)), 0.0);
    memset(&v62, 0, sizeof(v62));
    CATransform3D v61 = v65;
    CATransform3DTranslate(&v62, &v61, 0.0, (v41 + -1.0) * v47, 0.0);
    memset(&v61, 0, sizeof(v61));
    double v48 = v41 + 1.0;
    CATransform3D v60 = v65;
    CATransform3DTranslate(&v61, &v60, 0.0, -(v47 * v48), 0.0);
    memset(&v60, 0, sizeof(v60));
    CATransform3D v59 = v65;
    CATransform3DTranslate(&v60, &v59, 0.0, v48 * v47, 0.0);
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    double v49 = [(InteractiveAccelerometerViewController *)self levelBottom];
    CATransform3D v59 = v64;
    [v49 setTransform:&v59];

    v50 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    double v51 = [v50 layer];
    CATransform3D v59 = v65;
    [v51 setTransform:&v59];

    double v52 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
    CATransform3D v59 = v63;
    [v52 setTransform:&v59];

    v53 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
    CATransform3D v59 = v62;
    [v53 setTransform:&v59];

    CGFloat v54 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
    CATransform3D v59 = v61;
    [v54 setTransform:&v59];

    double v55 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
    CATransform3D v59 = v60;
    [v55 setTransform:&v59];

    v56 = [(InteractiveAccelerometerViewController *)self ticContainer];
    v57 = [v56 layer];
    CATransform3DMakeRotation(&v58, v31, 0.0, 0.0, 1.0);
    [v57 setTransform:&v58];

    +[CATransaction commit];
  }
  [(InteractiveAccelerometerViewController *)self setPreviousShift:v32];
  [(InteractiveAccelerometerViewController *)self setPreviousRotation:v30];
}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  [(InteractiveAccelerometerViewController *)self setCurrentShift:a4];
  [(InteractiveAccelerometerViewController *)self setCurrentRotation:a3];
  double v7 = a3 * 180.0 / 3.14159265;
  [(InteractiveAccelerometerViewController *)self setDegreesShift:a4 * 180.0 / 3.14159265];
  [(InteractiveAccelerometerViewController *)self degreesShift];
  if (fabs(v8) <= 40.0)
  {
    double v10 = fabs(v7);
    if (v10 >= 20.0)
    {
      if (v10 <= 160.0)
      {
        if (v7 <= 70.0 || v7 >= 110.0)
        {
          if (v7 >= -70.0 || v7 <= -110.0) {
            int64_t v9 = [(InteractiveAccelerometerViewController *)self orientation];
          }
          else {
            int64_t v9 = 4;
          }
        }
        else
        {
          int64_t v9 = 3;
        }
      }
      else
      {
        int64_t v9 = 2;
      }
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else if (a4 <= 0.0)
  {
    int64_t v9 = 6;
  }
  else
  {
    int64_t v9 = 5;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  int64_t v11 = [(InteractiveAccelerometerViewController *)self orientation];
  BOOL v12 = v9 != v11;
  if (v9 != v11)
  {
    signed int v13 = [(InteractiveAccelerometerViewController *)self traitCollection];
    id v14 = [v13 verticalSizeClass];

    if (v14 == (id)2)
    {
      [(InteractiveAccelerometerViewController *)self setPreviousOrientation:v9];
      [(InteractiveAccelerometerViewController *)self updateTicsForOrientation:v9];
    }
    else
    {
      double v15 = [(InteractiveAccelerometerViewController *)self traitCollection];
      id v16 = [v15 verticalSizeClass];

      if (v16 == (id)1) {
        [(InteractiveAccelerometerViewController *)self setPreviousOrientation:v9];
      }
    }
    [(InteractiveAccelerometerViewController *)self updateTicsForOrientation:v9];
  }
  [(InteractiveAccelerometerViewController *)self setOrientation:v9];
  switch(v9)
  {
    case 1:
      goto LABEL_58;
    case 2:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265) {
          a3 = a3 + 6.28318531;
        }
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      double v18 = a3 + -3.14159265;
      if (a3 + -3.14159265 <= 3.14159265)
      {
        if (v18 >= -3.14159265)
        {
LABEL_48:
          double v24 = a3 * 180.0 / 3.14159265;
          double v25 = -180.0;
          goto LABEL_57;
        }
        double v19 = 6.28318531;
      }
      else
      {
        double v19 = -6.28318531;
      }
      a3 = v18 + v19 + 3.14159265;
      goto LABEL_48;
    case 3:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265) {
          a3 = a3 + 6.28318531;
        }
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      double v20 = a3 + -1.57079633;
      if (a3 + -1.57079633 <= 3.14159265)
      {
        if (v20 >= -3.14159265) {
          goto LABEL_52;
        }
        double v21 = 6.28318531;
      }
      else
      {
        double v21 = -6.28318531;
      }
      a3 = v20 + v21 + 1.57079633;
LABEL_52:
      double v24 = a3 * 180.0 / 3.14159265;
      double v25 = -90.0;
      goto LABEL_57;
    case 4:
      if (a3 <= 3.14159265)
      {
        if (a3 < -3.14159265) {
          a3 = a3 + 6.28318531;
        }
      }
      else
      {
        a3 = -(6.28318531 - a3);
      }
      double v22 = a3 + 2.35619449;
      if (a3 + 2.35619449 <= 3.14159265)
      {
        if (v22 >= -3.14159265) {
          goto LABEL_56;
        }
        double v23 = 6.28318531;
      }
      else
      {
        double v23 = -6.28318531;
      }
      a3 = v22 + v23 + -2.35619449;
LABEL_56:
      double v24 = a3 * 180.0 / 3.14159265;
      double v25 = 90.0;
LABEL_57:
      double v7 = v24 + v25;
LABEL_58:
      +[CATransaction commit];
      [(InteractiveAccelerometerViewController *)self degreesShift];
      double v27 = fabs(v26);
      double v28 = [(InteractiveAccelerometerViewController *)self inputs];
      [v28 degreesShiftRange];
      double v30 = v29;

      CGFloat v31 = (char *)[(InteractiveAccelerometerViewController *)self orientation] - 5;
      BOOL v33 = v27 < v30 || (unint64_t)v31 < 0xFFFFFFFFFFFFFFFCLL;
      double v34 = [(InteractiveAccelerometerViewController *)self inputs];
      [v34 zeroRange];
      double v36 = v35;

      double v37 = 0;
      if (fabs(v7) >= v36 || !v33) {
        goto LABEL_68;
      }
      if ([(InteractiveAccelerometerViewController *)self framesLevel] <= 29)
      {
        double v37 = (char *)[(InteractiveAccelerometerViewController *)self framesLevel] + 1;
        BOOL v12 = 1;
LABEL_68:
        [(InteractiveAccelerometerViewController *)self setFramesLevel:v37];
      }
      uint64_t v38 = [(InteractiveAccelerometerViewController *)self framesLevel];
      if (v38 > 29 == [(InteractiveAccelerometerViewController *)self isLeveled]) {
        goto LABEL_80;
      }
      if ([(InteractiveAccelerometerViewController *)self isLeveled]
        && (([(InteractiveAccelerometerViewController *)self lastLevelChange],
             vabdd_f64(v39, v7) <= 0.75)
          ? (BOOL v40 = v33)
          : (BOOL v40 = 0),
            v40))
      {
        [(InteractiveAccelerometerViewController *)self setFramesLevel:30];
        return 0;
      }
      else
      {
        if (v38 < 30)
        {
          BOOL v42 = 0;
        }
        else
        {
          int64_t v41 = [(InteractiveAccelerometerViewController *)self orientation];
          BOOL v42 = v41 == [(InteractiveAccelerometerViewController *)self testingOrientation];
        }
        [(InteractiveAccelerometerViewController *)self setIsLeveled:v42];
        [(InteractiveAccelerometerViewController *)self setLastLevelChange:v7];
        [(InteractiveAccelerometerViewController *)self updateColors];
        BOOL v12 = 1;
LABEL_80:
        double v43 = 0.0;
        if (v38 <= 29) {
          double v43 = v7;
        }
        [(InteractiveAccelerometerViewController *)self _updateOffsetLabel:v43];
      }
      return v12;
    case 5:
      double v17 = -1.57079633;
      goto LABEL_32;
    case 6:
      double v17 = 1.57079633;
LABEL_32:
      double v7 = (a4 + v17) * 180.0 / 3.14159265;
      goto LABEL_58;
    default:
      double v7 = 0.0;
      goto LABEL_58;
  }
}

- (void)updateColors
{
  id v59 = +[UIColor systemGreenColor];
  unsigned int v3 = +[UIColor blackColor];
  if ([(InteractiveAccelerometerViewController *)self isLeveled]
    && (double v4 = [(InteractiveAccelerometerViewController *)self orientation],
        v4 == (void *)[(InteractiveAccelerometerViewController *)self testingOrientation]))
  {
    id v5 = v59;
    id v6 = [v5 CGColor];
    double v7 = [(InteractiveAccelerometerViewController *)self levelBottom];
    [v7 setBackgroundColor:v6];

    id v8 = v5;
    id v9 = [v8 CGColor];
    double v10 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
    [v10 setFillColor:v9];

    id v11 = v8;
    id v12 = [v11 CGColor];
    signed int v13 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
    [v13 setFillColor:v12];

    id v14 = v11;
    id v15 = [v14 CGColor];
    id v16 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
    [v16 setFillColor:v15];

    id v17 = v14;
    id v18 = [v17 CGColor];
    double v19 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
    [v19 setFillColor:v18];

    double v20 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    [v20 setTextColor:v17];

    id v21 = v17;
    id v22 = [v21 CGColor];
    double v23 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
    [v23 setBackgroundColor:v22];

    id v24 = [v21 CGColor];
    double v25 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
    [v25 setBackgroundColor:v24];

    if (![(InteractiveAccelerometerViewController *)self samplingRawData])
    {
      double v26 = [(InteractiveAccelerometerViewController *)self timeoutTimer];

      if (v26)
      {
        double v27 = [(InteractiveAccelerometerViewController *)self timeoutTimer];
        [v27 invalidate];

        double v28 = [(InteractiveAccelerometerViewController *)self inputs];
        [v28 holdStationaryTimeout];
        double v30 = "heldOrientationStationary";
LABEL_9:
        CATransform3D v58 = +[NSTimer scheduledTimerWithTimeInterval:self target:v30 selector:0 userInfo:0 repeats:v29];
        [(InteractiveAccelerometerViewController *)self setTimeoutTimer:v58];
      }
    }
  }
  else
  {
    id v31 = v3;
    id v32 = [v31 CGColor];
    BOOL v33 = [(InteractiveAccelerometerViewController *)self levelBottom];
    [v33 setBackgroundColor:v32];

    id v34 = v31;
    id v35 = [v34 CGColor];
    double v36 = [(InteractiveAccelerometerViewController *)self topInnerCircle];
    [v36 setFillColor:v35];

    id v37 = v34;
    id v38 = [v37 CGColor];
    double v39 = [(InteractiveAccelerometerViewController *)self topOuterCircle];
    [v39 setFillColor:v38];

    id v40 = v37;
    id v41 = [v40 CGColor];
    BOOL v42 = [(InteractiveAccelerometerViewController *)self bottomOuterCircle];
    [v42 setFillColor:v41];

    id v43 = v40;
    id v44 = [v43 CGColor];
    double v45 = [(InteractiveAccelerometerViewController *)self bottomInnerCircle];
    [v45 setFillColor:v44];

    float v46 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    [v46 setTextColor:v43];

    id v47 = v43;
    id v48 = [v47 CGColor];
    double v49 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
    [v49 setBackgroundColor:v48];

    id v50 = [v47 CGColor];
    double v51 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
    [v51 setBackgroundColor:v50];

    if (![(InteractiveAccelerometerViewController *)self samplingRawData])
    {
      double v52 = [(InteractiveAccelerometerViewController *)self timeoutTimer];

      if (v52)
      {
        v53 = [(InteractiveAccelerometerViewController *)self timeoutTimer];
        [v53 invalidate];

        CGFloat v54 = [(InteractiveAccelerometerViewController *)self startDate];
        [v54 timeIntervalSinceNow];
        double v56 = v55;

        double v28 = [(InteractiveAccelerometerViewController *)self inputs];
        [v28 notStationaryTimeout];
        double v29 = v56 + v57;
        double v30 = "notStationaryTimedOut";
        goto LABEL_9;
      }
    }
  }
}

- (void)_updateOffsetLabel:(double)a3
{
  id v5 = (void *)(uint64_t)a3;
  double v6 = fabs(a3);
  if (v6 < 1.0)
  {
    double v7 = [(InteractiveAccelerometerViewController *)self inputs];
    [v7 zeroRange];
    double v9 = v8;

    if (v6 > v9) {
      id v5 = (void *)((*(uint64_t *)&a3 >> 63) | 1);
    }
  }
  if ((void *)[(InteractiveAccelerometerViewController *)self lastDisplayDegrees] != v5)
  {
    [(InteractiveAccelerometerViewController *)self setLastDisplayDegrees:v5];
    double v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"COMPASS_DEGREES" value:&stru_1000109E0 table:0];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v5);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    [v12 setText:v20];

    signed int v13 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    [v13 sizeToFit];

    id v14 = [(InteractiveAccelerometerViewController *)self view];
    [v14 center];
    double v16 = v15;
    double v18 = v17;
    double v19 = [(InteractiveAccelerometerViewController *)self degreesLabel];
    [v19 setCenter:v16, v18];
  }
}

- (void)updateTicsForOrientation:(int64_t)a3
{
  unint64_t v4 = a3 - 1;
  id v5 = [(InteractiveAccelerometerViewController *)self leftLevelTic];
  double v6 = v5;
  if (v4 > 3)
  {
    [v5 setHidden:1];

    double v7 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    [v5 setHidden:0];

    double v7 = [(InteractiveAccelerometerViewController *)self rightLevelTic];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  [v7 setHidden:v8];
}

- (double)average:(id)a3 key:(id)a4 size:(unint64_t)a5
{
  id v7 = a4;
  if (a5)
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    unsigned int v10 = 1;
    do
    {
      id v11 = [a3 objectAtIndexedSubscript:v8];
      id v12 = [v11 objectForKeyedSubscript:v7];
      [v12 floatValue];
      double v9 = v9 + v13;

      unint64_t v8 = v10++;
    }
    while (v8 < a5);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9 / (double)a5;
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

- (BOOL)debuggingEnabled
{
  return self->_debuggingEnabled;
}

- (void)setDebuggingEnabled:(BOOL)a3
{
  self->_debuggingEnabled = a3;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (void)setFontDescriptor:(id)a3
{
}

- (CMMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (UIView)filterContainer
{
  return self->_filterContainer;
}

- (void)setFilterContainer:(id)a3
{
}

- (UIView)levelContainer
{
  return self->_levelContainer;
}

- (void)setLevelContainer:(id)a3
{
}

- (UIView)levelHoldContainer
{
  return self->_levelHoldContainer;
}

- (void)setLevelHoldContainer:(id)a3
{
}

- (UIView)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
}

- (UIView)ticContainer
{
  return self->_ticContainer;
}

- (void)setTicContainer:(id)a3
{
}

- (CAShapeLayer)bottomOuterCircle
{
  return self->_bottomOuterCircle;
}

- (void)setBottomOuterCircle:(id)a3
{
}

- (CAShapeLayer)bottomInnerCircle
{
  return self->_bottomInnerCircle;
}

- (void)setBottomInnerCircle:(id)a3
{
}

- (CAShapeLayer)topOuterCircle
{
  return self->_topOuterCircle;
}

- (void)setTopOuterCircle:(id)a3
{
}

- (CAShapeLayer)topInnerCircle
{
  return self->_topInnerCircle;
}

- (void)setTopInnerCircle:(id)a3
{
}

- (UILabel)degreesLabel
{
  return self->_degreesLabel;
}

- (void)setDegreesLabel:(id)a3
{
}

- (CALayer)levelBottom
{
  return self->_levelBottom;
}

- (void)setLevelBottom:(id)a3
{
}

- (CALayer)leftLevelTic
{
  return self->_leftLevelTic;
}

- (void)setLeftLevelTic:(id)a3
{
}

- (CALayer)rightLevelTic
{
  return self->_rightLevelTic;
}

- (void)setRightLevelTic:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)rotationOrientation
{
  return self->_rotationOrientation;
}

- (void)setRotationOrientation:(int64_t)a3
{
  self->_rotationOrientation = a3;
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_previousOrientation = a3;
}

- (int64_t)lastDisplayDegrees
{
  return self->_lastDisplayDegrees;
}

- (void)setLastDisplayDegrees:(int64_t)a3
{
  self->_lastDisplayDegrees = a3;
}

- (int64_t)framesLevel
{
  return self->_framesLevel;
}

- (void)setFramesLevel:(int64_t)a3
{
  self->_framesLevel = a3;
}

- (double)currentShift
{
  return self->_currentShift;
}

- (void)setCurrentShift:(double)a3
{
  self->_currentShift = a3;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (void)setCurrentRotation:(double)a3
{
  self->_currentRotation = a3;
}

- (double)previousShift
{
  return self->_previousShift;
}

- (void)setPreviousShift:(double)a3
{
  self->_previousShift = a3;
}

- (double)previousRotation
{
  return self->_previousRotation;
}

- (void)setPreviousRotation:(double)a3
{
  self->_previousRotation = a3;
}

- (double)lastLevelChange
{
  return self->_lastLevelChange;
}

- (void)setLastLevelChange:(double)a3
{
  self->_lastLevelChange = a3;
}

- (double)degreesShift
{
  return self->_degreesShift;
}

- (void)setDegreesShift:(double)a3
{
  self->_degreesShift = a3;
}

- (BOOL)isLeveled
{
  return self->_isLeveled;
}

- (void)setIsLeveled:(BOOL)a3
{
  self->_isLeveled = a3;
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (int64_t)testingOrientation
{
  return self->_testingOrientation;
}

- (void)setTestingOrientation:(int64_t)a3
{
  self->_testingOrientation = a3;
}

- (int)orientationsIndex
{
  return self->_orientationsIndex;
}

- (void)setOrientationsIndex:(int)a3
{
  self->_orientationsIndex = a3;
}

- (BOOL)orientationMissed
{
  return self->_orientationMissed;
}

- (void)setOrientationMissed:(BOOL)a3
{
  self->_orientationMissed = a3;
}

- (BOOL)samplingRawData
{
  return self->_samplingRawData;
}

- (void)setSamplingRawData:(BOOL)a3
{
  self->_samplingRawData = a3;
}

- (int)didCompleteSuccessfully
{
  return self->_didCompleteSuccessfully;
}

- (void)setDidCompleteSuccessfully:(int)a3
{
  self->_didCompleteSuccessfully = a3;
}

- (NSDictionary)averagedRawData
{
  return self->_averagedRawData;
}

- (void)setAveragedRawData:(id)a3
{
}

- (NSDictionary)notStationaryData
{
  return self->_notStationaryData;
}

- (void)setNotStationaryData:(id)a3
{
}

- (NSDictionary)stationaryData
{
  return self->_stationaryData;
}

- (void)setStationaryData:(id)a3
{
}

- (NSMutableArray)motionManagerData
{
  return self->_motionManagerData;
}

- (void)setMotionManagerData:(id)a3
{
}

- (NSMutableArray)copiedMotionManagerData
{
  return self->_copiedMotionManagerData;
}

- (void)setCopiedMotionManagerData:(id)a3
{
}

- (NSMutableArray)rawComponentData
{
  return self->_rawComponentData;
}

- (void)setRawComponentData:(id)a3
{
}

- (NSMutableArray)copiedRawComponentData
{
  return self->_copiedRawComponentData;
}

- (void)setCopiedRawComponentData:(id)a3
{
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (InteractiveAccelerometerInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_copiedRawComponentData, 0);
  objc_storeStrong((id *)&self->_rawComponentData, 0);
  objc_storeStrong((id *)&self->_copiedMotionManagerData, 0);
  objc_storeStrong((id *)&self->_motionManagerData, 0);
  objc_storeStrong((id *)&self->_stationaryData, 0);
  objc_storeStrong((id *)&self->_notStationaryData, 0);
  objc_storeStrong((id *)&self->_averagedRawData, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_rightLevelTic, 0);
  objc_storeStrong((id *)&self->_leftLevelTic, 0);
  objc_storeStrong((id *)&self->_levelBottom, 0);
  objc_storeStrong((id *)&self->_degreesLabel, 0);
  objc_storeStrong((id *)&self->_topInnerCircle, 0);
  objc_storeStrong((id *)&self->_topOuterCircle, 0);
  objc_storeStrong((id *)&self->_bottomInnerCircle, 0);
  objc_storeStrong((id *)&self->_bottomOuterCircle, 0);
  objc_storeStrong((id *)&self->_ticContainer, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_levelHoldContainer, 0);
  objc_storeStrong((id *)&self->_levelContainer, 0);
  objc_storeStrong((id *)&self->_filterContainer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_fontDescriptor, 0);
}

@end