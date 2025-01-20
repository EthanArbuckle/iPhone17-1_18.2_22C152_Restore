@interface ViewController
- (BOOL)isPortTypeJasperDetected;
- (BOOL)prefersStatusBarHidden;
- (BOOL)skipSummaryScreen;
- (NSLayoutConstraint)upperTextWidthConstraint;
- (OBWelcomeController)contentViewController;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)quitButton;
- (UIImageView)imageView;
- (UIImageView)warningImageView;
- (UILabel)statusLabel;
- (UILabel)upperViewLabel;
- (UILabel)warningViewLabel;
- (UILabel)warningViewSubLabel;
- (UIProgressView)progressView;
- (UIStackView)bottomView;
- (UITextView)textView;
- (UIView)activityIndicatorBackgroundView;
- (UIView)cameraView;
- (UIView)gradientView;
- (UIView)mainView;
- (UIView)middleView;
- (UIView)storyBoardView;
- (UIView)upperView;
- (UIView)warningImageViewBackground;
- (ViewController)init;
- (ViewController)initWithCoder:(id)a3;
- (ViewControllerCallbacks)listener;
- (float)noMovementAttitudeChangeMinThreshold;
- (id).cxx_construct;
- (id)getCurrentLog;
- (int)consecutiveSceneErrorLimit;
- (int)consecutiveSceneErrorWarningLimit;
- (int)getCalibResults:(ViewController *)self focalPoint:(SEL)a2;
- (int)getCurrentResult;
- (int)getJasperSensorId:(void *)a3;
- (int)getRotAnglesToPrcl:(ViewController *)self focalPoint:(SEL)a2 prcl:(Prcl *)a3;
- (int)initDiagnosticRgbjFlow;
- (int)initStreaming;
- (int)sessionMaxTimeOut;
- (int)startStreaming;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)userNotMovingTimeout;
- (void)addToReducedLog:(const void *)a3;
- (void)buttonClicked:(id)a3;
- (void)cancel;
- (void)compareResults:(float *)a3;
- (void)continueButtonPressed:(id)a3;
- (void)dogWatch:(id)a3;
- (void)duplicatPixelBuffer:(__CVBuffer *)a3 newBuffer:(__CVBuffer *)a4;
- (void)endTest;
- (void)error:(id)a3 details:(id)a4;
- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:;
- (void)handleResume;
- (void)handleSuspend;
- (void)handleUserMovement;
- (void)handleUserNoMovement;
- (void)hideInProgressView;
- (void)hideWarningWindow;
- (void)initFlow;
- (void)loadNormalAppWindow;
- (void)log:(const void *)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pointCloudHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4;
- (void)prepareIterationToNewSession;
- (void)prepareNewIteration;
- (void)primaryScalerHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4 streamType:(int)a5;
- (void)primaryScalerHxISPFrameAvailableCallbackW:(__CVBuffer *)a3 pts:(id *)a4;
- (void)quitButtonTapped;
- (void)setActivityIndicatorBackgroundView:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setConsecutiveSceneErrorLimit:(int)a3;
- (void)setConsecutiveSceneErrorWarningLimit:(int)a3;
- (void)setContentViewController:(id)a3;
- (void)setFadedLabel:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setHighlightedLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setListener:(id)a3;
- (void)setMainView:(id)a3;
- (void)setMiddleView:(id)a3;
- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3;
- (void)setProgressView:(id)a3;
- (void)setQuitButton:(id)a3;
- (void)setSessionMaxTimeOut:(int)a3;
- (void)setSkipSummaryScreen:(BOOL)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStoryBoardView:(id)a3;
- (void)setTextView:(id)a3;
- (void)setUpperTextWidthConstraint:(id)a3;
- (void)setUpperView:(id)a3;
- (void)setUpperViewLabel:(id)a3;
- (void)setUpperViewLabelText:(id)a3;
- (void)setUserNotMovingTimeout:(unsigned int)a3;
- (void)setWarningImageView:(id)a3;
- (void)setWarningImageViewBackground:(id)a3;
- (void)setWarningViewLabel:(id)a3;
- (void)setWarningViewSubLabel:(id)a3;
- (void)showInProgressView;
- (void)showPausedDialog;
- (void)showSummaryScreen:(BOOL)a3;
- (void)showWarningWindow:(id)a3 subMessage:(id)a4;
- (void)startUI;
- (void)updateProgress;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ViewController

- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:
{
  id v24 = a3;
  id v23 = a4;
  std::to_string(&v25, a5);
  v10 = std::string::insert(&v25, 0, "finishRun, result = ");
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  std::string::size_type v28 = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  [(ViewController *)self log:__p];
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  v13 = __p[0];
  std::string::size_type v14 = (std::string::size_type)v12;
  *(void **)((char *)__p + *((void *)__p[0] - 3)) = v12;
  v15 = (std::ios_base *)((char *)__p + *((void *)__p[0] - 3));
  std::ios_base::init(v15, &__p[1]);
  v15[1].__vftable = 0;
  v15[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  std::ofstream::open();
  std::ostream::write();
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)__p + *((void *)__p[0] - 3)), *(_DWORD *)&v29[*((void *)__p[0] - 3)] | 4);
  }
  CFDataRef v16 = +[NSData dataWithBytes:a6 length:256];
  v17 = ConvertDataToHexString(v16);
  v25.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + *(v13 - 3)) = v14;
  v18 = (std::ios_base *)((char *)&v25 + *(void *)(v25.__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v18, &v25.__r_.__value_.__r.__words[1]);
  v18[1].__vftable = 0;
  v18[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  std::ofstream::open();
  v19 = v17;
  [(__CFString *)v19 UTF8String];
  [(__CFString *)v19 length];
  std::ostream::write();
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)&v25 + *(void *)(v25.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v25 + *(void *)(v25.__r_.__value_.__r.__words[0] - 24) + 32) | 4);
  }
  v20 = [@"PrCL:" stringByAppendingString:v19];
  [v24 addObject:v20];

  [v24 writeToFile:@"/tmp/diagnostic.log" atomically:0];
  [v24 writeToFile:@"/tmp/reduced.log" atomically:0];
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();

  __p[0] = v21;
  *(void **)((char *)__p + *((void *)v21 - 3)) = v22;
  std::filebuf::~filebuf();
  std::ostream::~ostream();
  std::ios::~ios();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ViewController;
  [(ViewController *)&v3 viewDidAppear:a3];
}

- (void)log:(const void *)a3
{
  v5 = self->_resultsDict;
  objc_sync_enter(v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0) {
      v6 = a3;
    }
    else {
      v6 = *(const void **)a3;
    }
    int v10 = 136315138;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "JasperCalibDiag %s", (uint8_t *)&v10, 0xCu);
  }
  resultsDict = self->_resultsDict;
  if (*((char *)a3 + 23) >= 0) {
    v8 = a3;
  }
  else {
    v8 = *(const void **)a3;
  }
  v9 = +[NSString stringWithUTF8String:v8];
  [(NSMutableArray *)resultsDict addObject:v9];

  objc_sync_exit(v5);
}

- (void)addToReducedLog:(const void *)a3
{
  v5 = self->_reducedLog;
  objc_sync_enter(v5);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0) {
      v6 = a3;
    }
    else {
      v6 = *(const void **)a3;
    }
    int v10 = 136315138;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "addToReducedLog %s", (uint8_t *)&v10, 0xCu);
  }
  reducedLog = self->_reducedLog;
  if (*((char *)a3 + 23) >= 0) {
    v8 = a3;
  }
  else {
    v8 = *(const void **)a3;
  }
  v9 = +[NSString stringWithUTF8String:v8];
  [(NSMutableArray *)reducedLog addObject:v9];

  objc_sync_exit(v5);
}

- (void)prepareNewIteration
{
  sub_100009158(__p, "prepareNewIteration");
  [(ViewController *)self log:__p];
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  self->_iterationTotalSuccessfullRuns = 0;
  self->_resetExtrinsics = 1;
}

- (void)prepareIterationToNewSession
{
  self->_progress = 0.0;
  self->_lastSceneError = 0;
  self->_sessionSecondsCount = 0;
  self->_consecutiveSceneError = 0;
}

- (ViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ViewController;
  v5 = [(ViewController *)&v8 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_isJasper = 120;
    v5->_topTextHeight = 30;
    v5->_textMargin = 1;
    *(_DWORD *)&v5->_upperViewRendered = 5;
    v5->_sessionMaxTimeOut = 1046562734;
    [(ViewController *)v5 setListener:v5];
    *(_DWORD *)&v6->_sensorId.__r_.var1 = 15;
    LODWORD(v6->_sensorId.var0) = 14;
  }

  return v6;
}

- (ViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)ViewController;
  result = [(ViewController *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_isJasper = 120;
    result->_topTextHeight = 30;
    result->_textMargin = 1;
    *(_DWORD *)&result->_upperViewRendered = 5;
    result->_sessionMaxTimeOut = 1046562734;
    *(_DWORD *)&result->_sensorId.__r_.var1 = 15;
    LODWORD(result->_sensorId.var0) = 14;
    BYTE5(result->_sensorId.var0) = 0;
  }
  return result;
}

- (void)startUI
{
  sub_100009158(&v33, "start UI");
  [(ViewController *)self log:&v33];
  if (SHIBYTE(v34) < 0) {
    operator delete((void *)v33);
  }
  sub_100009158(&v30, "_sessionMaxTimeOut ");
  std::to_string(&v29, *(_DWORD *)&self->_isJasper);
  if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    objc_super v3 = &v29;
  }
  else {
    objc_super v3 = (std::string *)v29.__r_.__value_.__r.__words[0];
  }
  if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v29.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v29.__r_.__value_.__l.__size_;
  }
  v5 = std::string::append(&v30, (const std::string::value_type *)v3, size);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  sub_100009158(v27, " _consecutiveSceneErrorLimit ");
  if ((v28 & 0x80u) == 0) {
    v7 = v27;
  }
  else {
    v7 = (void **)v27[0];
  }
  if ((v28 & 0x80u) == 0) {
    std::string::size_type v8 = v28;
  }
  else {
    std::string::size_type v8 = (std::string::size_type)v27[1];
  }
  v9 = std::string::append(&v31, (const std::string::value_type *)v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v32.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, self->_topTextHeight);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v12 = __p.__r_.__value_.__l.__size_;
  }
  v13 = std::string::append(&v32, (const std::string::value_type *)p_p, v12);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  std::string::size_type v34 = v13->__r_.__value_.__r.__words[2];
  long long v33 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  [(ViewController *)self log:&v33];
  if (SHIBYTE(v34) < 0) {
    operator delete((void *)v33);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  if ((char)v28 < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  resultsDict = self->_resultsDict;
  self->_resultsDict = v15;

  v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  reducedLog = self->_reducedLog;
  self->_reducedLog = v17;

  v19 = +[NSBundle mainBundle];
  v20 = [v19 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  v21 = self->_resultsDict;
  v22 = [@"version " stringByAppendingString:v20];
  [(NSMutableArray *)v21 addObject:v22];

  self->_calibrationResult = 1;
  self->_nextResultIndex = 0;
  self->_iterationTotalSuccessfullRunsLimit = 30;
  self->_calibUpdateEachIsfEntiresLimit = 10;
  self->_iterationsLimit = 3;
  self->_watchDogCounter = 0;
  self->_sesssionIsfCount = 1;
  self->_noMovementCounter = 0;
  self->_diagnosticCMInterface = 0;
  self->_diagnosticFinalResult = -1;
  id v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  id v24 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.RgbJasperCalibrationQueue", v23);
  backgroundDispatchQueue = self->_backgroundDispatchQueue;
  self->_backgroundDispatchQueue = v24;

  [(ViewController *)self loadNormalAppWindow];
}

- (void)viewDidLoad
{
  sub_100009158(__p, "viewDidLoad");
  [(ViewController *)self log:__p];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  v4.receiver = self;
  v4.super_class = (Class)ViewController;
  [(ViewController *)&v4 viewDidLoad];
  self->_diagnosticFinalResult = -1;
  self->_inResume = 0;
  objc_super v3 = +[UIApplication sharedApplication];
  [v3 setIdleTimerDisabled:1];

  [(ViewController *)self startUI];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int)getJasperSensorId:(void *)a3
{
  CFDictionaryRef theDict = 0;
  if (DeviceCMInterface::getJasperModuleInfo(self->_diagnosticCMInterface, &theDict))
  {
    int v5 = 2;
    self->_diagnosticFinalResult = 2;
    [(ViewController *)self error:@"unable to get JasperModuleInfo" details:&stru_10002D080];
  }
  else
  {
    CFDictionaryGetValue(theDict, kFigCapturePropertyValue_ModuleSerialNumberString);
    id v6 = objc_claimAutoreleasedReturnValue();
    std::string::assign((std::string *)a3, (const std::string::value_type *)[v6 UTF8String]);
    CFRelease(theDict);

    return 0;
  }
  return v5;
}

- (void)setFadedLabel:(id)a3
{
  id v5 = a3;
  objc_super v3 = +[UIColor colorWithDisplayP3Red:240.0 green:240.0 blue:240.0 alpha:0.5];
  [v5 setTextColor:v3];

  objc_super v4 = +[UIFont systemFontOfSize:14.0];
  [v5 setFont:v4];
}

- (void)setHighlightedLabel:(id)a3
{
  id v5 = a3;
  [v5 setAlpha:1.0];
  objc_super v3 = +[UIFont boldSystemFontOfSize:20.0];
  [v5 setFont:v3];

  objc_super v4 = +[UIColor whiteColor];
  [v5 setTextColor:v4];
}

- (void)updateProgress
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014900;
  block[3] = &unk_10002CE48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)startStreaming
{
  sub_100009158(__p, "startStreaming started");
  [(ViewController *)self log:__p];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (self->_running) {
    return 0;
  }
  DeviceCMInterface::enableJasperRgbVideo(self->_diagnosticCMInterface);
  objc_storeStrong((id *)&self->_streamingClient._listener, self);
  self->_diagnosticCMInterface->var1 = (StreamingClient *)&self->_streamingClient;
  if (DeviceCMInterface::startRgbWideRgbStream(self->_diagnosticCMInterface))
  {
    self->_diagnosticFinalResult = 2;
    objc_super v4 = [@"return val " stringByAppendingString:@"ds"];
    [(ViewController *)self error:@"unable to start wide stream" details:v4];
  }
  else
  {
    int result = DeviceCMInterface::startJasperStream(self->_diagnosticCMInterface);
    if (!result) {
      return result;
    }
    self->_diagnosticFinalResult = 2;
    objc_super v4 = [@"return val " stringByAppendingString:@"ds"];
    [(ViewController *)self error:@"unable to start jasper stream" details:v4];
  }

  return 2;
}

- (int)initStreaming
{
  sub_100009158(__p, "initStreaming");
  [(ViewController *)self log:__p];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  *(_DWORD *)&v7.var0 = 65537;
  v7.var4 = 16;
  if ([(ViewController *)self isPortTypeJasperDetected]) {
    DeviceCMInterface::initAndActivateCaptureDeviceController(self->_diagnosticCMInterface);
  }
  self->_diagnosticFinalResult = 2;
  [(ViewController *)self error:@"no JasperDevice" details:&stru_10002D080];
  return 2;
}

- (void)initFlow
{
  objc_super v4 = [[UserMovementTracker alloc] init:0 noMovementAttitudeChangeMinThreshold:0 noMovementMinTimeSeconds:*(float *)&self->_sessionMaxTimeOut startMovementTrackingNow:2.0];
  m_userMovementTracker = self->m_userMovementTracker;
  self->m_userMovementTracker = v4;

  self->_iterationNumber = 1;
  *(void *)self->_avgRotAngles = 0;
  *(_DWORD *)&self->_avgRotAngles[8] = 0;
  sub_100009158(__p, "init flow started");
  [(ViewController *)self log:__p];
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  [(ViewController *)self prepareNewIteration];
  [(ViewController *)self prepareIterationToNewSession];
  int v9 = 0;
  if (self->_iterationsLimit >= 1)
  {
    do
    {
      __p[0] = &v9;
      char v6 = sub_10001E5DC((uint64_t **)&self->_rgbjCalibrationResults, &v9, (uint64_t)&unk_100024567, (_DWORD **)__p);
      v6[6] = v6[5];
      ++v9;
    }
    while (v9 < self->_iterationsLimit);
  }
  *(void *)&self->_anon_b8[8] = *(void *)self->_anon_b8;
  JasperConfiguration v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"handleSuspend" name:UIApplicationDidEnterBackgroundNotification object:0];

  std::string::size_type v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"handleResume" name:UIApplicationWillEnterForegroundNotification object:0];

  [(ViewController *)self handleResume];
  [(UserMovementTracker *)self->m_userMovementTracker addObserver:self forKeyPath:@"movementState" options:1 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"movementState", a4, a5, a6))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015578;
    block[3] = &unk_10002CE48;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleUserNoMovement
{
  [(ViewController *)self showPausedDialog];
  ++self->_noMovementCounter;
  if (!self->m_noMovementQuitTimer)
  {
    LODWORD(v3) = *(_DWORD *)&self->_upperViewRendered;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000156F4;
    v6[3] = &unk_10002CE70;
    v6[4] = self;
    objc_super v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v6 block:(double)v3];
    m_noMovementQuitTimer = self->m_noMovementQuitTimer;
    self->m_noMovementQuitTimer = v4;
  }
}

- (void)handleUserMovement
{
  m_noMovementQuitTimer = self->m_noMovementQuitTimer;
  if (m_noMovementQuitTimer)
  {
    [(NSTimer *)m_noMovementQuitTimer invalidate];
    objc_super v4 = self->m_noMovementQuitTimer;
    self->m_noMovementQuitTimer = 0;
  }

  [(ViewController *)self hideWarningWindow];
}

- (void)showPausedDialog
{
  unint64_t v3 = +[NSBundle mainBundle];
  id v6 = [v3 localizedStringForKey:@"Device_Is_Motionless" value:&stru_10002D080 table:0];

  objc_super v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"Device_Is_Motionless_Subtitle" value:&stru_10002D080 table:0];

  [(ViewController *)self showWarningWindow:v6 subMessage:v5];
}

- (int)initDiagnosticRgbjFlow
{
  sub_100009158(__p, "set rgbj configuration to frameSelect(1)  featureVector(5)  dilutionRate(500)");
  [(ViewController *)self log:__p];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  if (DeviceCMInterface::setRgbjConfiguration(self->_diagnosticCMInterface, 1u, 5u, 500))
  {
    CFStringRef v3 = @"setRgbjConfiguration failed";
  }
  else
  {
    if (!self->_resetExtrinsics) {
      return 0;
    }
    sub_100009158(__p, "set wide jasper extrinsics to 0");
    [(ViewController *)self log:__p];
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    if (!DeviceCMInterface::setWideJasperExtrinsics(self->_diagnosticCMInterface, 0.0, 0.0, 1570.8, 0.0, 0.0, 0.0))return 0; {
    CFStringRef v3 = @"error setting wide jasper extrinsics";
    }
  }
  int v4 = 2;
  self->_diagnosticFinalResult = 2;
  [(ViewController *)self error:v3 details:&stru_10002D080];
  return v4;
}

- (int)getRotAnglesToPrcl:(ViewController *)self focalPoint:(SEL)a2 prcl:(Prcl *)a3
{
  long long v8 = v3;
  long long v9 = v4;
  p_sensorId = &self->_sensorId;
  if (*((char *)&self->_sensorId.__r_.__value_.var0.__l + 23) < 0) {
    p_sensorId = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_sensorId->__r_.__value_.var0.__l.__data_;
  }
  strcpy(a3->jasperSN, p_sensorId->__r_.__value_.var0.__s.__data_);
  CalcRotationMatrix(*(float *)&v8 / 1000.0, *((float *)&v8 + 1) / 1000.0, *((float *)&v8 + 2) / 1000.0, &v10);
  v10.columns[3].i32[2] = DWORD2(v9);
  v10.columns[3].i64[0] = v9;
  Simd4x3ToMatrix(&v10, a3->wideRotMatrix, a3->wideFocalPoint);
  return 0;
}

- (int)getCalibResults:(ViewController *)self focalPoint:(SEL)a2
{
  uint64_t v4 = v3;
  id v5 = v2;
  sub_100009158(&__p, "getCalibResults");
  [(ViewController *)self log:&__p];
  if (SHIBYTE(v21) < 0) {
    operator delete(__p);
  }
  v27 = 0;
  if (DeviceCMInterface::getJasperCalib(self->_diagnosticCMInterface, &v27))
  {
    int v7 = 2;
    self->_diagnosticFinalResult = 2;
    [(ViewController *)self error:@"unable to get JasperCalib" details:&stru_10002D080];
  }
  else
  {
    if (LOBYTE(self->_sensorId.__r_.var0))
    {
      long long v8 = (const void *)JDJasperCalibCreateWithBinaryRepresentation();
      JDJasperCalibGetOperationalWideToJasperTransform();
    }
    else
    {
      long long v8 = (const void *)PDPeridotCalibCreateWithBinaryRepresentation();
      PDPeridotCalibGetOperationalWideToPeridotTransform();
    }
    int v20 = v10;
    int v22 = v12;
    int v24 = v14;
    std::string __p = v9;
    uint64_t v21 = v11;
    int v26 = v16;
    uint64_t v23 = v13;
    uint64_t v25 = v15;
    CFRelease(v8);
    uint64_t v17 = v25;
    *(_DWORD *)(v4 + 8) = v26;
    *(void *)uint64_t v4 = v17;
    CalcRotationAngleFromMatrix((uint64_t)&__p, v5);
    CFRelease(v27);
    return 0;
  }
  return v7;
}

- (void)loadNormalAppWindow
{
  sub_100009158(__p, "loadNormalAppWindow");
  [(ViewController *)self log:__p];
  if (v150 < 0) {
    operator delete(__p[0]);
  }
  self->_progress = 0.0;
  self->_overallProgress = 0.0;
  id v3 = objc_alloc((Class)UIView);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [WeakRetained frame];
  id v5 = [v3 initWithFrame:];
  storyBoardView = self->_storyBoardView;
  self->_storyBoardView = v5;

  id v7 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [v7 addSubview:self->_storyBoardView];

  [(UIView *)self->_storyBoardView setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v8 = [(UIView *)self->_storyBoardView heightAnchor];
  id v9 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  int v10 = [v9 heightAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10 multiplier:1.0];
  [v11 setActive:1];

  int v12 = [(UIView *)self->_storyBoardView widthAnchor];
  id v13 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  int v14 = [v13 widthAnchor];
  uint64_t v15 = [v12 constraintEqualToAnchor:v14 multiplier:1.0];
  [v15 setActive:1];

  int v16 = [(UIView *)self->_storyBoardView centerXAnchor];
  id v17 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v18 = [v17 centerXAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  int v20 = [(UIView *)self->_storyBoardView centerYAnchor];
  id v21 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  int v22 = [v21 centerYAnchor];
  uint64_t v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  int v24 = (UIView *)objc_alloc_init((Class)UIView);
  mainView = self->_mainView;
  self->_mainView = v24;

  id v26 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [v26 addSubview:self->_mainView];

  id v27 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [v27 sendSubviewToBack:self->_mainView];

  BYTE4(self->_sensorId.var0) = 0;
  unsigned __int8 v28 = (UIView *)objc_alloc_init((Class)UIView);
  cameraView = self->_cameraView;
  self->_cameraView = v28;

  std::string v30 = [(UIView *)self->_cameraView layer];
  [v30 setCornerRadius:10.0];

  [(UIView *)self->_cameraView setAlpha:0.5];
  std::string v31 = +[UIColor blackColor];
  [(UIView *)self->_cameraView setBackgroundColor:v31];

  [(UIView *)self->_cameraView setTranslatesAutoresizingMaskIntoConstraints:0];
  std::string v32 = [(UIView *)self->_cameraView widthAnchor];
  id v33 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [v33 frame];
  v35 = [v32 constraintLessThanOrEqualToConstant:v34 - (double)(2 * LODWORD(self->_sensorId.var0))];
  [v35 setActive:1];

  v36 = [(UIView *)self->_cameraView widthAnchor];
  v37 = [v36 constraintEqualToConstant:0.0];
  warningViewLabel = self->_warningViewLabel;
  self->_warningViewLabel = v37;

  [(UILabel *)self->_warningViewLabel setActive:1];
  LODWORD(v39) = 1148813312;
  [(UILabel *)self->_warningViewLabel setPriority:v39];
  [(UIView *)self->_storyBoardView addSubview:self->_cameraView];
  [(UIView *)self->_cameraView setHidden:1];
  v40 = [(UIView *)self->_cameraView topAnchor];
  v41 = [(UIView *)self->_storyBoardView safeAreaLayoutGuide];
  v42 = [v41 topAnchor];
  v43 = [v40 constraintEqualToAnchor:v42 constant:(float)((float)LODWORD(self->_sensorId.var0) + 30.0)];
  [v43 setActive:1];

  v44 = [(UIView *)self->_cameraView heightAnchor];
  v45 = [v44 constraintEqualToConstant:(double)(*(_DWORD *)&self->_sensorId.__r_.var1 + 2 * LODWORD(self->_sensorId.var0))];
  [v45 setActive:1];

  v46 = [(UIView *)self->_cameraView centerXAnchor];
  v47 = [(UIView *)self->_storyBoardView centerXAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = (UIProgressView *)objc_alloc_init((Class)UILabel);
  progressView = self->_progressView;
  self->_progressView = v49;

  [(UIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_cameraView addSubview:self->_progressView];
  [(UIProgressView *)self->_progressView setHidden:1];
  v51 = +[UIColor whiteColor];
  [(UIProgressView *)self->_progressView setTextColor:v51];

  v52 = [(UIProgressView *)self->_progressView topAnchor];
  v53 = [(UIView *)self->_cameraView topAnchor];
  LODWORD(v54) = self->_sensorId.var0;
  v55 = [v52 constraintEqualToAnchor:v53 constant:(double)v54];
  [v55 setActive:1];

  v56 = [(UIProgressView *)self->_progressView leadingAnchor];
  v57 = [(UIView *)self->_cameraView leadingAnchor];
  LODWORD(v58) = self->_sensorId.var0;
  v59 = [v56 constraintEqualToAnchor:v57 constant:(double)v58];
  [v59 setActive:1];

  v60 = +[UIButton buttonWithType:0];
  warningViewSubLabel = self->_warningViewSubLabel;
  self->_warningViewSubLabel = v60;

  [(UILabel *)self->_warningViewSubLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v62 = +[UIColor blackColor];
  [(UILabel *)self->_warningViewSubLabel setBackgroundColor:v62];

  v63 = [(UILabel *)self->_warningViewSubLabel layer];
  [v63 setCornerRadius:15.0];

  id v64 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  [v64 addSubview:self->_warningViewSubLabel];

  [(UILabel *)self->_warningViewSubLabel addTarget:self action:"quitButtonTapped" forControlEvents:64];
  v143 = +[UIImageSymbolConfiguration configurationWithPointSize:15.0];
  v65 = +[UIImage systemImageNamed:@"multiply" withConfiguration:v143];
  v66 = self->_warningViewSubLabel;
  v139 = v65;
  v67 = [v65 imageWithRenderingMode:2];
  [(UILabel *)v66 setImage:v67 forState:0];

  v68 = self->_warningViewSubLabel;
  v69 = +[UIColor whiteColor];
  [(UILabel *)v68 setTintColor:v69];

  v145 = [(UILabel *)self->_warningViewSubLabel topAnchor];
  id v146 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v142 = [v146 topAnchor];
  v141 = [v145 constraintEqualToAnchor:30.0];
  v153[0] = v141;
  v144 = [(UILabel *)self->_warningViewSubLabel trailingAnchor];
  id v70 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v71 = [v70 trailingAnchor];
  v72 = [v144 constraintEqualToAnchor:v71 constant:-30.0];
  v153[1] = v72;
  v73 = [(UILabel *)self->_warningViewSubLabel widthAnchor];
  v74 = [v73 constraintEqualToConstant:30.0];
  v153[2] = v74;
  v75 = [(UILabel *)self->_warningViewSubLabel heightAnchor];
  v76 = [v75 constraintEqualToConstant:30.0];
  v153[3] = v76;
  v77 = +[NSArray arrayWithObjects:v153 count:4];
  +[NSLayoutConstraint activateConstraints:v77];

  id v78 = objc_alloc((Class)UIView);
  [(UIView *)self->_storyBoardView frame];
  double v80 = v79;
  [(UIView *)self->_storyBoardView frame];
  v81 = [v78 initWithFrame:0.0, v80 + -184.0];
  statusLabel = self->_statusLabel;
  self->_statusLabel = v81;

  v147 = +[CAGradientLayer layer];
  [(UILabel *)self->_statusLabel bounds];
  [v147 setFrame:];
  id v83 = +[UIColor clearColor];
  v152[0] = [v83 CGColor];
  id v84 = +[UIColor blackColor];
  v152[1] = [v84 CGColor];
  v85 = +[NSArray arrayWithObjects:v152 count:2];
  [v147 setColors:v85];

  [v147 setLocations:&off_100030118];
  v86 = [(UILabel *)self->_statusLabel layer];
  [v86 addSublayer:v147];

  [(UIView *)self->_storyBoardView addSubview:self->_statusLabel];
  v87 = (UIStackView *)objc_alloc_init((Class)UIProgressView);
  bottomView = self->_bottomView;
  self->_bottomView = v87;

  [(UIStackView *)self->_bottomView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_storyBoardView addSubview:self->_bottomView];
  v89 = [(UIStackView *)self->_bottomView leadingAnchor];
  v90 = [(UIView *)self->_storyBoardView leadingAnchor];
  v91 = [v89 constraintGreaterThanOrEqualToAnchor:v90 constant:30.0];
  [v91 setActive:1];

  v92 = [(UIStackView *)self->_bottomView trailingAnchor];
  v93 = [(UIView *)self->_storyBoardView trailingAnchor];
  v94 = [v92 constraintLessThanOrEqualToAnchor:v93 constant:-30.0];
  [v94 setActive:1];

  v95 = [(UIStackView *)self->_bottomView leadingAnchor];
  v96 = [(UIView *)self->_storyBoardView safeAreaLayoutGuide];
  v97 = [v96 leadingAnchor];
  v98 = [v95 constraintGreaterThanOrEqualToAnchor:v97 constant:30.0];
  [v98 setActive:1];

  v99 = [(UIStackView *)self->_bottomView trailingAnchor];
  v100 = [(UIView *)self->_storyBoardView safeAreaLayoutGuide];
  v101 = [v100 trailingAnchor];
  v102 = [v99 constraintLessThanOrEqualToAnchor:v101 constant:-30.0];
  [v102 setActive:1];

  v103 = [(UIStackView *)self->_bottomView widthAnchor];
  v104 = [v103 constraintEqualToConstant:334.0];
  [v104 setActive:1];

  v105 = [(UIStackView *)self->_bottomView heightAnchor];
  v106 = [v105 constraintEqualToConstant:4.0];
  [v106 setActive:1];

  v107 = [(UIStackView *)self->_bottomView centerXAnchor];
  id v108 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v109 = [v108 centerXAnchor];
  v110 = [v107 constraintEqualToAnchor:v109];
  [v110 setActive:1];

  v111 = [(UIStackView *)self->_bottomView bottomAnchor];
  v112 = [(UIView *)self->_storyBoardView safeAreaLayoutGuide];
  v113 = [v112 bottomAnchor];
  v114 = [v111 constraintEqualToAnchor:v113 constant:-46.0];
  [v114 setActive:1];

  [(UIStackView *)self->_bottomView setClipsToBounds:1];
  [(UIStackView *)self->_bottomView setProgressViewStyle:0];
  v115 = +[UIColor whiteColor];
  [(UIStackView *)self->_bottomView setTintColor:v115];

  v116 = +[UIColor blackColor];
  [(UIStackView *)self->_bottomView setTrackTintColor:v116];

  v117 = [(UIStackView *)self->_bottomView layer];
  [v117 setCornerRadius:2.0];

  v118 = (UIImageView *)objc_alloc_init((Class)UIView);
  imageView = self->_imageView;
  self->_imageView = v118;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView setAlpha:0.5];
  [(UIView *)self->_storyBoardView addSubview:self->_imageView];
  v120 = [(UIImageView *)self->_imageView widthAnchor];
  v121 = [(UIView *)self->_storyBoardView widthAnchor];
  v122 = [v120 constraintEqualToAnchor:v121 multiplier:1.0];
  [v122 setActive:1];

  v123 = [(UIImageView *)self->_imageView centerXAnchor];
  v124 = [(UIView *)self->_storyBoardView centerXAnchor];
  v125 = [v123 constraintEqualToAnchor:v124];
  [v125 setActive:1];

  v126 = [(UIImageView *)self->_imageView heightAnchor];
  v127 = [(UIView *)self->_storyBoardView heightAnchor];
  v128 = [v126 constraintEqualToAnchor:v127 multiplier:0.73];
  [v128 setActive:1];

  [(UIView *)self->_storyBoardView addSubview:self->_middleView];
  v129 = (ViewControllerCallbacks *)objc_alloc_init((Class)UIImageView);
  listener = self->_listener;
  self->_listener = v129;

  [(UIView *)self->_mainView addSubview:self->_listener];
  [(ViewControllerCallbacks *)self->_listener setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ViewControllerCallbacks *)self->_listener setContentMode:2];
  v148 = [(ViewControllerCallbacks *)self->_listener heightAnchor];
  id v131 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v132 = [v131 heightAnchor];
  v133 = [v148 constraintEqualToAnchor:v132];
  v151[0] = v133;
  v134 = [(ViewControllerCallbacks *)self->_listener widthAnchor];
  id v135 = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);
  v136 = [v135 widthAnchor];
  v137 = [v134 constraintEqualToAnchor:v136];
  v151[1] = v137;
  v138 = +[NSArray arrayWithObjects:v151 count:2];
  +[NSLayoutConstraint activateConstraints:v138];

  self->_uiStreamType = 0;
  self->_calibrationResult = 2;
  [(ViewController *)self showInProgressView];
  [(ViewController *)self initFlow];
}

- (void)compareResults:(float *)a3
{
  sub_100009158(&v48, "compareResults started");
  [(ViewController *)self log:&v48];
  if (SHIBYTE(v49) < 0) {
    operator delete(v48);
  }
  uint64_t v5 = *(void *)self->_anon_b8;
  uint64_t v6 = *(void *)&self->_anon_b8[8];
  uint64_t v7 = v6 - v5;
  if (v6 == v5)
  {
    long long v10 = 0uLL;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = v7 >> 4;
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    long long v10 = 0uLL;
    do
    {
      uint64_t v11 = (float32x2_t *)(v5 + 16 * v8);
      float32x2_t v12 = *v11;
      float v13 = v11[1].f32[0];
      unint64_t v14 = v9;
      uint64_t v15 = *(long long **)self->_anon_b8;
      do
      {
        long long v16 = *v15++;
        float32x2_t v17 = vabd_f32(v12, *(float32x2_t *)&v16);
        *(int8x8_t *)&long long v10 = vbsl_s8((int8x8_t)vcgt_f32(v17, *(float32x2_t *)&v10), (int8x8_t)v17, *(int8x8_t *)&v10);
        float v18 = vabds_f32(v13, *((float *)&v16 + 2));
        if (*((float *)&v10 + 2) >= v18) {
          float v18 = *((float *)&v10 + 2);
        }
        *((float *)&v10 + 2) = v18;
        --v14;
      }
      while (v14);
      ++v8;
    }
    while (v8 != v9);
  }
  long long __val = v10;
  v48 = 0;
  long long v49 = 0uLL;
  sub_10001E894((uint64_t)&v43, 0x10uLL);
  if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v19 = &v43;
  }
  else {
    v19 = (std::string *)v43.__r_.__value_.__r.__words[0];
  }
  strcpy((char *)v19, "maxDiff x,y,z = ");
  std::to_string(&v42, *(float *)&__val);
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v20 = &v42;
  }
  else {
    int v20 = (std::string *)v42.__r_.__value_.__r.__words[0];
  }
  if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v42.__r_.__value_.__l.__size_;
  }
  int v22 = std::string::append(&v43, (const std::string::value_type *)v20, size);
  long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v23;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  int v24 = std::string::append(&v44, " ");
  long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  float v26 = *((float *)&__val + 1);
  std::to_string(&v41, *((float *)&__val + 1));
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v27 = &v41;
  }
  else {
    id v27 = (std::string *)v41.__r_.__value_.__r.__words[0];
  }
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v28 = HIBYTE(v41.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v28 = v41.__r_.__value_.__l.__size_;
  }
  std::string v29 = std::string::append(&v45, (const std::string::value_type *)v27, v28);
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  std::string v31 = std::string::append(&v46, " ");
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v47.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v40, *((float *)&__val + 2));
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v33 = &v40;
  }
  else {
    id v33 = (std::string *)v40.__r_.__value_.__r.__words[0];
  }
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v34 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v34 = v40.__r_.__value_.__l.__size_;
  }
  v35 = std::string::append(&v47, (const std::string::value_type *)v33, v34);
  v36 = (void *)v35->__r_.__value_.__r.__words[0];
  v50[0] = v35->__r_.__value_.__l.__size_;
  *(void *)((char *)v50 + 7) = *(std::string::size_type *)((char *)&v35->__r_.__value_.__r.__words[1] + 7);
  char v37 = HIBYTE(v35->__r_.__value_.__r.__words[2]);
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  v48 = v36;
  *(void *)((char *)&v49 + 7) = *(void *)((char *)v50 + 7);
  *(void *)&long long v49 = v50[0];
  HIBYTE(v49) = v37;
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v47.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v42.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v43.__r_.__value_.__l.__data_);
  }
  -[ViewController log:](self, "log:", &v48, (void)__val);
  if (__vala > *a3 || v26 > a3[1] || *((float *)&__val + 2) > a3[2]) {
    self->_diagnosticFinalResult = -3;
  }
  else {
    self->_diagnosticFinalResult = 0;
  }
  if (SHIBYTE(v49) < 0) {
    operator delete(v48);
  }
}

- (void)dogWatch:(id)a3
{
  id v288 = a3;
  if (!self->_running) {
    goto LABEL_170;
  }
  uint64_t v4 = [(ViewController *)self imageView];
  [v4 setAlpha:1.0];

  if (DeviceCMInterface::getRgbjReport(self->_diagnosticCMInterface, (int *)&__val, (int *)&__val + 1, (int *)&__val + 3, v325, &v325[1]))goto LABEL_170; {
  if (v325[1] == 1)
  }
  {
    sub_100009158(__p, "Driver reported disk is full with RgbjReport_FailedToSave");
    [(ViewController *)self log:__p];
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    self->_diagnosticFinalResult = -913;
    backgroundDispatchQueue = self->_backgroundDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A648;
    block[3] = &unk_10002CE48;
    block[4] = self;
    dispatch_async(backgroundDispatchQueue, block);
  }
  DWORD2(__val) = __val - DWORD1(__val);
  self->_watchDogJasperFramesCount = self->_jasperFramesCount;
  self->_resetExtrinsics = 0;
  ++self->_watchDogCounter;
  p_iterationNumber = &self->_iterationNumber;
  *(void *)std::string __p = &self->_iterationNumber;
  uint64_t v7 = sub_10001E5DC((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100024567, (_DWORD **)__p);
  uint64_t v8 = v7[6];
  unint64_t v9 = v7[7];
  if (v8 >= v9)
  {
    float32x2_t v12 = v7[5];
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v8 - v12);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004F9C();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v9 - v12);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      float32x2_t v17 = (char *)sub_10001E91C((uint64_t)(v7 + 7), v16);
    }
    else {
      float32x2_t v17 = 0;
    }
    float v18 = (uint64_t *)&v17[24 * v13];
    v19 = (uint64_t *)&v17[24 * v16];
    long long v20 = __val;
    v18[2] = *(void *)v325;
    *(_OWORD *)float v18 = v20;
    uint64_t v11 = v18 + 3;
    int v22 = v7[5];
    id v21 = v7[6];
    if (v21 != v22)
    {
      do
      {
        long long v23 = *(_OWORD *)(v21 - 3);
        *(v18 - 1) = *(v21 - 1);
        *(_OWORD *)(v18 - 3) = v23;
        v18 -= 3;
        v21 -= 3;
      }
      while (v21 != v22);
      id v21 = v7[5];
    }
    v7[5] = v18;
    v7[6] = v11;
    v7[7] = v19;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    long long v10 = __val;
    v8[2] = *(void *)v325;
    *(_OWORD *)uint64_t v8 = v10;
    uint64_t v11 = v8 + 3;
  }
  v7[6] = v11;
  *(void *)std::string __p = &self->_iterationNumber;
  int v24 = sub_10001E5DC((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100024567, (_DWORD **)__p);
  if ((char *)v24[6] - (char *)v24[5] == 24)
  {
    [(ViewController *)self hideInProgressView];
    [(ViewController *)self hideWarningWindow];
    long long v25 = +[NSBundle mainBundle];
    float v26 = [v25 localizedStringForKey:@"Pan_Slowly" value:&stru_10002D080 table:0];
    [(ViewController *)self setUpperViewLabelText:v26];

    goto LABEL_170;
  }
  memset(&v322, 0, sizeof(v322));
  std::to_string(&v309, __val);
  id v27 = std::string::insert(&v309, 0, "newsframesReachedController ");
  long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  v310.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v310.__r_.__value_.__l.__data_ = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  std::string v29 = std::string::append(&v310, " framesPassedController ");
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v311.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v311.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v308, SDWORD1(__val));
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v31 = &v308;
  }
  else {
    std::string v31 = (std::string *)v308.__r_.__value_.__r.__words[0];
  }
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v308.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v308.__r_.__value_.__l.__size_;
  }
  id v33 = std::string::append(&v311, (const std::string::value_type *)v31, size);
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v328.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v328.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  v35 = std::string::append(&v328, " ");
  long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
  v329.__r_.__value_.__r.__words[2] = v35->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v36;
  v35->__r_.__value_.__l.__size_ = 0;
  v35->__r_.__value_.__r.__words[2] = 0;
  v35->__r_.__value_.__r.__words[0] = 0;
  char v37 = std::string::append(&v329, "IsfSuccessCount ");
  long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  v312.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v307, SHIDWORD(__val));
  if ((v307.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    double v39 = &v307;
  }
  else {
    double v39 = (std::string *)v307.__r_.__value_.__r.__words[0];
  }
  if ((v307.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v40 = HIBYTE(v307.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v40 = v307.__r_.__value_.__l.__size_;
  }
  std::string v41 = std::string::append(&v312, (const std::string::value_type *)v39, v40);
  long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
  v313.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v42;
  v41->__r_.__value_.__l.__size_ = 0;
  v41->__r_.__value_.__r.__words[2] = 0;
  v41->__r_.__value_.__r.__words[0] = 0;
  std::string v43 = std::string::append(&v313, " ");
  long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  v314.__r_.__value_.__r.__words[2] = v43->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  std::string v45 = std::string::append(&v314, "IsfFailedCount ");
  long long v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
  v315.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v46;
  v45->__r_.__value_.__l.__size_ = 0;
  v45->__r_.__value_.__r.__words[2] = 0;
  v45->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v306, v325[0]);
  if ((v306.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v47 = &v306;
  }
  else {
    std::string v47 = (std::string *)v306.__r_.__value_.__r.__words[0];
  }
  if ((v306.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v48 = HIBYTE(v306.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v48 = v306.__r_.__value_.__l.__size_;
  }
  long long v49 = std::string::append(&v315, (const std::string::value_type *)v47, v48);
  long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
  v316.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v50;
  v49->__r_.__value_.__l.__size_ = 0;
  v49->__r_.__value_.__r.__words[2] = 0;
  v49->__r_.__value_.__r.__words[0] = 0;
  v51 = std::string::append(&v316, " ");
  long long v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
  v317.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v52;
  v51->__r_.__value_.__l.__size_ = 0;
  v51->__r_.__value_.__r.__words[2] = 0;
  v51->__r_.__value_.__r.__words[0] = 0;
  v53 = std::string::append(&v317, "framesFailedController ");
  long long v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  v318.__r_.__value_.__r.__words[2] = v53->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v54;
  v53->__r_.__value_.__l.__size_ = 0;
  v53->__r_.__value_.__r.__words[2] = 0;
  v53->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v305, SDWORD2(__val));
  if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v55 = &v305;
  }
  else {
    v55 = (std::string *)v305.__r_.__value_.__r.__words[0];
  }
  if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v56 = HIBYTE(v305.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v56 = v305.__r_.__value_.__l.__size_;
  }
  v57 = std::string::append(&v318, (const std::string::value_type *)v55, v56);
  long long v58 = *(_OWORD *)&v57->__r_.__value_.__l.__data_;
  v319.__r_.__value_.__r.__words[2] = v57->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v58;
  v57->__r_.__value_.__l.__size_ = 0;
  v57->__r_.__value_.__r.__words[2] = 0;
  v57->__r_.__value_.__r.__words[0] = 0;
  v59 = std::string::append(&v319, " ");
  long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v320.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  v61 = std::string::append(&v320, "RgbjReportFailedToSave ");
  long long v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
  v321.__r_.__value_.__r.__words[2] = v61->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v62;
  v61->__r_.__value_.__l.__size_ = 0;
  v61->__r_.__value_.__r.__words[2] = 0;
  v61->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v304, v325[1]);
  if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v63 = &v304;
  }
  else {
    v63 = (std::string *)v304.__r_.__value_.__r.__words[0];
  }
  if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v64 = HIBYTE(v304.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v64 = v304.__r_.__value_.__l.__size_;
  }
  v65 = std::string::append(&v321, (const std::string::value_type *)v63, v64);
  long long v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
  *(void *)&__p[16] = *((void *)&v65->__r_.__value_.__l + 2);
  *(_OWORD *)std::string __p = v66;
  v65->__r_.__value_.__l.__size_ = 0;
  v65->__r_.__value_.__r.__words[2] = 0;
  v65->__r_.__value_.__r.__words[0] = 0;
  if (__p[23] >= 0) {
    v67 = __p;
  }
  else {
    v67 = *(const std::string::value_type **)__p;
  }
  if (__p[23] >= 0) {
    std::string::size_type v68 = __p[23];
  }
  else {
    std::string::size_type v68 = *(void *)&__p[8];
  }
  std::string::append(&v322, v67, v68);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v304.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v321.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v320.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v319.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v305.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v305.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v318.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v317.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v316.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v306.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v306.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v315.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v314.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v313.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v307.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v307.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v312.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v329.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v328.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v308.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v311.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v310.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v309.__r_.__value_.__l.__data_);
  }
  [(ViewController *)self log:&v322];
  *(void *)std::string __p = &self->_iterationNumber;
  v69 = sub_10001E5DC((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100024567, (_DWORD **)__p);
  *(void *)std::string __p = &self->_iterationNumber;
  id v70 = sub_10001E5DC((uint64_t **)&self->_rgbjCalibrationResults, &self->_iterationNumber, (uint64_t)&unk_100024567, (_DWORD **)__p);
  v72 = v70[5];
  v71 = v70[6];
  v73 = v69[5];
  std::string::assign(&v322, "");
  unint64_t v74 = 0xAAAAAAAAAAAAAAABLL * (v71 - v72) - 2;
  std::to_string(&v328, v73[3 * v74]);
  v75 = std::string::insert(&v328, 0, "lastframesReachedController ");
  long long v76 = *(_OWORD *)&v75->__r_.__value_.__l.__data_;
  v329.__r_.__value_.__r.__words[2] = v75->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v76;
  v75->__r_.__value_.__l.__size_ = 0;
  v75->__r_.__value_.__r.__words[2] = 0;
  v75->__r_.__value_.__r.__words[0] = 0;
  v77 = std::string::append(&v329, " framesPassedController ");
  long long v78 = *(_OWORD *)&v77->__r_.__value_.__l.__data_;
  v312.__r_.__value_.__r.__words[2] = v77->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v78;
  v77->__r_.__value_.__l.__size_ = 0;
  v77->__r_.__value_.__r.__words[2] = 0;
  v77->__r_.__value_.__r.__words[0] = 0;
  double v79 = &v73[3 * v74];
  int v81 = *((_DWORD *)v79 + 1);
  double v80 = (_DWORD *)v79 + 1;
  std::to_string(&v311, v81);
  if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v82 = &v311;
  }
  else {
    v82 = (std::string *)v311.__r_.__value_.__r.__words[0];
  }
  if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v83 = HIBYTE(v311.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v83 = v311.__r_.__value_.__l.__size_;
  }
  id v84 = std::string::append(&v312, (const std::string::value_type *)v82, v83);
  long long v85 = *(_OWORD *)&v84->__r_.__value_.__l.__data_;
  v313.__r_.__value_.__r.__words[2] = v84->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v85;
  v84->__r_.__value_.__l.__size_ = 0;
  v84->__r_.__value_.__r.__words[2] = 0;
  v84->__r_.__value_.__r.__words[0] = 0;
  v86 = std::string::append(&v313, " ");
  long long v87 = *(_OWORD *)&v86->__r_.__value_.__l.__data_;
  v314.__r_.__value_.__r.__words[2] = v86->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v87;
  v86->__r_.__value_.__l.__size_ = 0;
  v86->__r_.__value_.__r.__words[2] = 0;
  v86->__r_.__value_.__r.__words[0] = 0;
  v88 = std::string::append(&v314, "IsfSuccessCount ");
  long long v89 = *(_OWORD *)&v88->__r_.__value_.__l.__data_;
  v315.__r_.__value_.__r.__words[2] = v88->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v89;
  v88->__r_.__value_.__l.__size_ = 0;
  v88->__r_.__value_.__r.__words[2] = 0;
  v88->__r_.__value_.__r.__words[0] = 0;
  v90 = &v73[3 * v74];
  int v92 = *((_DWORD *)v90 + 3);
  v91 = (_DWORD *)v90 + 3;
  std::to_string(&v310, v92);
  if ((v310.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v93 = &v310;
  }
  else {
    v93 = (std::string *)v310.__r_.__value_.__r.__words[0];
  }
  if ((v310.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v94 = HIBYTE(v310.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v94 = v310.__r_.__value_.__l.__size_;
  }
  v95 = std::string::append(&v315, (const std::string::value_type *)v93, v94);
  long long v96 = *(_OWORD *)&v95->__r_.__value_.__l.__data_;
  v316.__r_.__value_.__r.__words[2] = v95->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v96;
  v95->__r_.__value_.__l.__size_ = 0;
  v95->__r_.__value_.__r.__words[2] = 0;
  v95->__r_.__value_.__r.__words[0] = 0;
  v97 = std::string::append(&v316, " ");
  long long v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
  v317.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v98;
  v97->__r_.__value_.__l.__size_ = 0;
  v97->__r_.__value_.__r.__words[2] = 0;
  v97->__r_.__value_.__r.__words[0] = 0;
  v99 = std::string::append(&v317, "IsfFailedCount ");
  long long v100 = *(_OWORD *)&v99->__r_.__value_.__l.__data_;
  v318.__r_.__value_.__r.__words[2] = v99->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v100;
  v99->__r_.__value_.__l.__size_ = 0;
  v99->__r_.__value_.__r.__words[2] = 0;
  v99->__r_.__value_.__r.__words[0] = 0;
  v101 = &v73[3 * v74];
  int v103 = *((_DWORD *)v101 + 4);
  v102 = v101 + 2;
  std::to_string(&v309, v103);
  if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v104 = &v309;
  }
  else {
    v104 = (std::string *)v309.__r_.__value_.__r.__words[0];
  }
  if ((v309.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v105 = HIBYTE(v309.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v105 = v309.__r_.__value_.__l.__size_;
  }
  v106 = std::string::append(&v318, (const std::string::value_type *)v104, v105);
  long long v107 = *(_OWORD *)&v106->__r_.__value_.__l.__data_;
  v319.__r_.__value_.__r.__words[2] = v106->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v107;
  v106->__r_.__value_.__l.__size_ = 0;
  v106->__r_.__value_.__r.__words[2] = 0;
  v106->__r_.__value_.__r.__words[0] = 0;
  id v108 = std::string::append(&v319, " ");
  long long v109 = *(_OWORD *)&v108->__r_.__value_.__l.__data_;
  v320.__r_.__value_.__r.__words[2] = v108->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v109;
  v108->__r_.__value_.__l.__size_ = 0;
  v108->__r_.__value_.__r.__words[2] = 0;
  v108->__r_.__value_.__r.__words[0] = 0;
  v110 = std::string::append(&v320, "framesFailedController ");
  long long v111 = *(_OWORD *)&v110->__r_.__value_.__l.__data_;
  v321.__r_.__value_.__r.__words[2] = v110->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v111;
  v110->__r_.__value_.__l.__size_ = 0;
  v110->__r_.__value_.__r.__words[2] = 0;
  v110->__r_.__value_.__r.__words[0] = 0;
  v112 = &v73[3 * v74];
  int v114 = *((_DWORD *)v112 + 2);
  v113 = v112 + 1;
  std::to_string(&v308, v114);
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v115 = &v308;
  }
  else {
    v115 = (std::string *)v308.__r_.__value_.__r.__words[0];
  }
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v116 = HIBYTE(v308.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v116 = v308.__r_.__value_.__l.__size_;
  }
  v117 = std::string::append(&v321, (const std::string::value_type *)v115, v116);
  long long v118 = *(_OWORD *)&v117->__r_.__value_.__l.__data_;
  *(void *)&__p[16] = *((void *)&v117->__r_.__value_.__l + 2);
  *(_OWORD *)std::string __p = v118;
  v117->__r_.__value_.__l.__size_ = 0;
  v117->__r_.__value_.__r.__words[2] = 0;
  v117->__r_.__value_.__r.__words[0] = 0;
  if (__p[23] >= 0) {
    v119 = __p;
  }
  else {
    v119 = *(const std::string::value_type **)__p;
  }
  if (__p[23] >= 0) {
    std::string::size_type v120 = __p[23];
  }
  else {
    std::string::size_type v120 = *(void *)&__p[8];
  }
  std::string::append(&v322, v119, v120);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v308.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v321.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v320.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v319.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v309.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v318.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v317.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v316.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v310.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v315.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v314.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v313.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v311.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v312.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v329.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v328.__r_.__value_.__l.__data_);
  }
  [(ViewController *)self log:&v322];
  v121 = +[NSBundle mainBundle];
  v122 = [v121 localizedStringForKey:@"Pan_Slowly" value:&stru_10002D080 table:0];
  [(ViewController *)self setUpperViewLabelText:v122];

  if (self->m_noMovementQuitTimer) {
    goto LABEL_168;
  }
  if (!LOBYTE(self->_sensorId.__r_.var0) && self->_lastSceneError == 2)
  {
    self->_lastSceneError = 0;
    [(ViewController *)self hideWarningWindow];
  }
  if (SHIDWORD(__val) > *v91)
  {
    self->_consecutiveSceneError = 0;
    float progress = self->_progress;
    std::to_string(&v321, progress);
    v124 = std::string::insert(&v321, 0, "currProgress ");
    long long v125 = *(_OWORD *)&v124->__r_.__value_.__l.__data_;
    *(void *)&__p[16] = *((void *)&v124->__r_.__value_.__l + 2);
    *(_OWORD *)std::string __p = v125;
    v124->__r_.__value_.__l.__size_ = 0;
    v124->__r_.__value_.__r.__words[2] = 0;
    v124->__r_.__value_.__r.__words[0] = 0;
    [(ViewController *)self log:__p];
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v321.__r_.__value_.__l.__data_);
    }
    float v126 = (float)SHIDWORD(__val) / (float)self->_calibUpdateEachIsfEntiresLimit;
    self->_float progress = v126;
    std::to_string(&v321, v126);
    v127 = std::string::insert(&v321, 0, "New progress per cycle ");
    long long v128 = *(_OWORD *)&v127->__r_.__value_.__l.__data_;
    *(void *)&__p[16] = *((void *)&v127->__r_.__value_.__l + 2);
    *(_OWORD *)std::string __p = v128;
    v127->__r_.__value_.__l.__size_ = 0;
    v127->__r_.__value_.__r.__words[2] = 0;
    v127->__r_.__value_.__r.__words[0] = 0;
    [(ViewController *)self log:__p];
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v321.__r_.__value_.__l.__data_);
    }
    float v129 = self->_overallProgress + (float)((float)(self->_progress - progress) / 9.0);
    self->_overallProgress = v129;
    std::to_string(&v321, v129);
    v130 = std::string::insert(&v321, 0, "_overallProgress ");
    long long v131 = *(_OWORD *)&v130->__r_.__value_.__l.__data_;
    *(void *)&__p[16] = *((void *)&v130->__r_.__value_.__l + 2);
    *(_OWORD *)std::string __p = v131;
    v130->__r_.__value_.__l.__size_ = 0;
    v130->__r_.__value_.__r.__words[2] = 0;
    v130->__r_.__value_.__r.__words[0] = 0;
    [(ViewController *)self log:__p];
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v321.__r_.__value_.__l.__data_);
    }
    self->_lastSceneError = 0;
    [(ViewController *)self updateProgress];
    [(ViewController *)self hideInProgressView];
    [(ViewController *)self hideWarningWindow];
    goto LABEL_199;
  }
  if (v325[0] > *v102)
  {
    self->_lastSceneError = 2;
    int v132 = self->_consecutiveSceneError + 1;
    self->_consecutiveSceneError = v132;
    if (v132 < (signed int)self->_textMargin) {
      goto LABEL_199;
    }
    v133 = +[NSBundle mainBundle];
    v134 = [v133 localizedStringForKey:@"Bad_Scene" value:&stru_10002D080 table:0];
    id v135 = +[NSBundle mainBundle];
    v136 = [v135 localizedStringForKey:@"Bad_Scene_Subtitle" value:&stru_10002D080 table:0];
    [(ViewController *)self showWarningWindow:v134 subMessage:v136];

    v137 = +[NSBundle mainBundle];
    v138 = [v137 localizedStringForKey:@"Pan_Slowly" value:&stru_10002D080 table:0];
    [(ViewController *)self setUpperViewLabelText:v138];
    goto LABEL_198;
  }
  if (SDWORD1(__val) <= *v80)
  {
    if (SDWORD2(__val) <= *v113) {
      goto LABEL_199;
    }
    self->_lastSceneError = 1;
    int v139 = self->_consecutiveSceneError + 1;
    self->_consecutiveSceneError = v139;
    if (v139 < (signed int)self->_textMargin) {
      goto LABEL_199;
    }
    v137 = +[NSBundle mainBundle];
    v138 = [v137 localizedStringForKey:@"No_Objects_Found" value:&stru_10002D080 table:0];
    v140 = +[NSBundle mainBundle];
    v141 = [v140 localizedStringForKey:@"No_Objects_Found_Subtitle" value:&stru_10002D080 table:0];
    [(ViewController *)self showWarningWindow:v138 subMessage:v141];

LABEL_198:
    goto LABEL_199;
  }
  if (self->_lastSceneError != 2)
  {
    [(ViewController *)self hideWarningWindow];
    self->_lastSceneError = 0;
  }
  [(ViewController *)self hideInProgressView];
LABEL_199:
  if (SHIDWORD(__val) < self->_calibUpdateEachIsfEntiresLimit)
  {
    int sessionSecondsCount = self->_sessionSecondsCount;
    self->_int sessionSecondsCount = sessionSecondsCount + 1;
    if (sessionSecondsCount >= *(_DWORD *)&self->_isJasper
      || self->_consecutiveSceneError > (signed int)self->_topTextHeight)
    {
      std::to_string(&v315, sessionSecondsCount + 1);
      v143 = std::string::insert(&v315, 0, "sessionTimeOutTimer timeout _sessionSecondsCount");
      long long v144 = *(_OWORD *)&v143->__r_.__value_.__l.__data_;
      v316.__r_.__value_.__r.__words[2] = v143->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v144;
      v143->__r_.__value_.__l.__size_ = 0;
      v143->__r_.__value_.__r.__words[2] = 0;
      v143->__r_.__value_.__r.__words[0] = 0;
      v145 = std::string::append(&v316, " _consecutiveSceneError ");
      long long v146 = *(_OWORD *)&v145->__r_.__value_.__l.__data_;
      v317.__r_.__value_.__r.__words[2] = v145->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v146;
      v145->__r_.__value_.__l.__size_ = 0;
      v145->__r_.__value_.__r.__words[2] = 0;
      v145->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v314, self->_consecutiveSceneError);
      if ((v314.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v147 = &v314;
      }
      else {
        v147 = (std::string *)v314.__r_.__value_.__r.__words[0];
      }
      if ((v314.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v148 = HIBYTE(v314.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v148 = v314.__r_.__value_.__l.__size_;
      }
      v149 = std::string::append(&v317, (const std::string::value_type *)v147, v148);
      long long v150 = *(_OWORD *)&v149->__r_.__value_.__l.__data_;
      v318.__r_.__value_.__r.__words[2] = v149->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v150;
      v149->__r_.__value_.__l.__size_ = 0;
      v149->__r_.__value_.__r.__words[2] = 0;
      v149->__r_.__value_.__r.__words[0] = 0;
      v151 = std::string::append(&v318, " _sessionMaxTimeOut ");
      long long v152 = *(_OWORD *)&v151->__r_.__value_.__l.__data_;
      v319.__r_.__value_.__r.__words[2] = v151->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v152;
      v151->__r_.__value_.__l.__size_ = 0;
      v151->__r_.__value_.__r.__words[2] = 0;
      v151->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v313, *(_DWORD *)&self->_isJasper);
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v153 = &v313;
      }
      else {
        v153 = (std::string *)v313.__r_.__value_.__r.__words[0];
      }
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v154 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v154 = v313.__r_.__value_.__l.__size_;
      }
      v155 = std::string::append(&v319, (const std::string::value_type *)v153, v154);
      long long v156 = *(_OWORD *)&v155->__r_.__value_.__l.__data_;
      v320.__r_.__value_.__r.__words[2] = v155->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v156;
      v155->__r_.__value_.__l.__size_ = 0;
      v155->__r_.__value_.__r.__words[2] = 0;
      v155->__r_.__value_.__r.__words[0] = 0;
      v157 = std::string::append(&v320, " _consecutiveSceneErrorLimit ");
      long long v158 = *(_OWORD *)&v157->__r_.__value_.__l.__data_;
      v321.__r_.__value_.__r.__words[2] = v157->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v321.__r_.__value_.__l.__data_ = v158;
      v157->__r_.__value_.__l.__size_ = 0;
      v157->__r_.__value_.__r.__words[2] = 0;
      v157->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v312, self->_topTextHeight);
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v159 = &v312;
      }
      else {
        v159 = (std::string *)v312.__r_.__value_.__r.__words[0];
      }
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v160 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v160 = v312.__r_.__value_.__l.__size_;
      }
      v161 = std::string::append(&v321, (const std::string::value_type *)v159, v160);
      long long v162 = *(_OWORD *)&v161->__r_.__value_.__l.__data_;
      *(void *)&__p[16] = *((void *)&v161->__r_.__value_.__l + 2);
      *(_OWORD *)std::string __p = v162;
      v161->__r_.__value_.__l.__size_ = 0;
      v161->__r_.__value_.__r.__words[2] = 0;
      v161->__r_.__value_.__r.__words[0] = 0;
      [(ViewController *)self log:__p];
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
      if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v312.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v321.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v320.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v313.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v319.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v318.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v314.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v317.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v316.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v315.__r_.__value_.__l.__data_);
      }
      [(ViewController *)self handleSuspend];
      v163 = +[NSBundle mainBundle];
      v164 = [v163 localizedStringForKey:@"Timed_Out" value:&stru_10002D080 table:0];
      [(ViewController *)self showWarningWindow:v164 subMessage:&stru_10002D080];

      v165 = [(ViewController *)self upperView];
      [v165 setHidden:1];

      v166 = self->_backgroundDispatchQueue;
      v289[0] = _NSConcreteStackBlock;
      v289[1] = 3221225472;
      v289[2] = sub_10001A92C;
      v289[3] = &unk_10002CE48;
      v289[4] = self;
      dispatch_async(v166, v289);
    }
    goto LABEL_168;
  }
  sub_100009158(__p, "dogWatch finishing sub iteration");
  [(ViewController *)self log:__p];
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  ++self->_sesssionIsfCount;
  self->_running = 0;
  id v167 = &_dispatch_main_q;
  v303[0] = _NSConcreteStackBlock;
  v303[1] = 3221225472;
  v303[2] = sub_10001A650;
  v303[3] = &unk_10002CE48;
  v303[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v303);

  if (DeviceCMInterface::forceSaveWideJasperCalib(self->_diagnosticCMInterface))
  {
    [(ViewController *)self error:@"failed to forceSaveWideJasperCalib" details:&stru_10002D080];
    goto LABEL_168;
  }
  DWORD2(v302) = 0;
  *(void *)&long long v302 = 0;
  int v301 = 0;
  uint64_t v300 = 0;
  if (![(ViewController *)self getCalibResults:&v302 focalPoint:&v300])
  {
    memset(&v321, 0, sizeof(v321));
    sub_100017694("iteration ", (const void **)&v321.__r_.__value_.__l.__data_, (void **)&v306.__r_.__value_.__l.__data_);
    std::to_string(&v305, *p_iterationNumber);
    if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v168 = &v305;
    }
    else {
      v168 = (std::string *)v305.__r_.__value_.__r.__words[0];
    }
    if ((v305.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v169 = HIBYTE(v305.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v169 = v305.__r_.__value_.__l.__size_;
    }
    v170 = std::string::append(&v306, (const std::string::value_type *)v168, v169);
    long long v171 = *(_OWORD *)&v170->__r_.__value_.__l.__data_;
    v307.__r_.__value_.__r.__words[2] = v170->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v307.__r_.__value_.__l.__data_ = v171;
    v170->__r_.__value_.__l.__size_ = 0;
    v170->__r_.__value_.__r.__words[2] = 0;
    v170->__r_.__value_.__r.__words[0] = 0;
    v172 = std::string::append(&v307, " Iteration Total Successfull Runs ");
    long long v173 = *(_OWORD *)&v172->__r_.__value_.__l.__data_;
    v308.__r_.__value_.__r.__words[2] = v172->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v308.__r_.__value_.__l.__data_ = v173;
    v172->__r_.__value_.__l.__size_ = 0;
    v172->__r_.__value_.__r.__words[2] = 0;
    v172->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v304, self->_iterationTotalSuccessfullRuns);
    if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v174 = &v304;
    }
    else {
      v174 = (std::string *)v304.__r_.__value_.__r.__words[0];
    }
    if ((v304.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v175 = HIBYTE(v304.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v175 = v304.__r_.__value_.__l.__size_;
    }
    v176 = std::string::append(&v308, (const std::string::value_type *)v174, v175);
    long long v177 = *(_OWORD *)&v176->__r_.__value_.__l.__data_;
    v309.__r_.__value_.__r.__words[2] = v176->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v309.__r_.__value_.__l.__data_ = v177;
    v176->__r_.__value_.__l.__size_ = 0;
    v176->__r_.__value_.__r.__words[2] = 0;
    v176->__r_.__value_.__r.__words[0] = 0;
    v178 = std::string::append(&v309, " ISF Entries successfull ");
    long long v179 = *(_OWORD *)&v178->__r_.__value_.__l.__data_;
    v310.__r_.__value_.__r.__words[2] = v178->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v310.__r_.__value_.__l.__data_ = v179;
    v178->__r_.__value_.__l.__size_ = 0;
    v178->__r_.__value_.__r.__words[2] = 0;
    v178->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v299, SHIDWORD(__val));
    if ((v299.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v180 = &v299;
    }
    else {
      v180 = (std::string *)v299.__r_.__value_.__r.__words[0];
    }
    if ((v299.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v181 = HIBYTE(v299.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v181 = v299.__r_.__value_.__l.__size_;
    }
    v182 = std::string::append(&v310, (const std::string::value_type *)v180, v181);
    long long v183 = *(_OWORD *)&v182->__r_.__value_.__l.__data_;
    v311.__r_.__value_.__r.__words[2] = v182->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v311.__r_.__value_.__l.__data_ = v183;
    v182->__r_.__value_.__l.__size_ = 0;
    v182->__r_.__value_.__r.__words[2] = 0;
    v182->__r_.__value_.__r.__words[0] = 0;
    v184 = std::string::append(&v311, " ISF Entries Failed ");
    long long v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
    v328.__r_.__value_.__r.__words[2] = v184->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v328.__r_.__value_.__l.__data_ = v185;
    v184->__r_.__value_.__l.__size_ = 0;
    v184->__r_.__value_.__r.__words[2] = 0;
    v184->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v298, v325[0]);
    if ((v298.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v186 = &v298;
    }
    else {
      v186 = (std::string *)v298.__r_.__value_.__r.__words[0];
    }
    if ((v298.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v187 = HIBYTE(v298.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v187 = v298.__r_.__value_.__l.__size_;
    }
    v188 = std::string::append(&v328, (const std::string::value_type *)v186, v187);
    long long v189 = *(_OWORD *)&v188->__r_.__value_.__l.__data_;
    v329.__r_.__value_.__r.__words[2] = v188->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v189;
    v188->__r_.__value_.__l.__size_ = 0;
    v188->__r_.__value_.__r.__words[2] = 0;
    v188->__r_.__value_.__r.__words[0] = 0;
    v190 = std::string::append(&v329, " ISF Passed Controller ");
    long long v191 = *(_OWORD *)&v190->__r_.__value_.__l.__data_;
    v312.__r_.__value_.__r.__words[2] = v190->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v312.__r_.__value_.__l.__data_ = v191;
    v190->__r_.__value_.__l.__size_ = 0;
    v190->__r_.__value_.__r.__words[2] = 0;
    v190->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v297, SDWORD1(__val));
    if ((v297.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v192 = &v297;
    }
    else {
      v192 = (std::string *)v297.__r_.__value_.__r.__words[0];
    }
    if ((v297.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v193 = HIBYTE(v297.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v193 = v297.__r_.__value_.__l.__size_;
    }
    v194 = std::string::append(&v312, (const std::string::value_type *)v192, v193);
    long long v195 = *(_OWORD *)&v194->__r_.__value_.__l.__data_;
    v313.__r_.__value_.__r.__words[2] = v194->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v313.__r_.__value_.__l.__data_ = v195;
    v194->__r_.__value_.__l.__size_ = 0;
    v194->__r_.__value_.__r.__words[2] = 0;
    v194->__r_.__value_.__r.__words[0] = 0;
    v196 = std::string::append(&v313, " ISF Faild Controller ");
    long long v197 = *(_OWORD *)&v196->__r_.__value_.__l.__data_;
    v314.__r_.__value_.__r.__words[2] = v196->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v314.__r_.__value_.__l.__data_ = v197;
    v196->__r_.__value_.__l.__size_ = 0;
    v196->__r_.__value_.__r.__words[2] = 0;
    v196->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v296, SDWORD2(__val));
    if ((v296.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v198 = &v296;
    }
    else {
      v198 = (std::string *)v296.__r_.__value_.__r.__words[0];
    }
    if ((v296.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v199 = HIBYTE(v296.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v199 = v296.__r_.__value_.__l.__size_;
    }
    v200 = std::string::append(&v314, (const std::string::value_type *)v198, v199);
    long long v201 = *(_OWORD *)&v200->__r_.__value_.__l.__data_;
    v315.__r_.__value_.__r.__words[2] = v200->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v201;
    v200->__r_.__value_.__l.__size_ = 0;
    v200->__r_.__value_.__r.__words[2] = 0;
    v200->__r_.__value_.__r.__words[0] = 0;
    v202 = std::string::append(&v315, " Angles (x,y,z,) = (");
    long long v203 = *(_OWORD *)&v202->__r_.__value_.__l.__data_;
    v316.__r_.__value_.__r.__words[2] = v202->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v203;
    v202->__r_.__value_.__l.__size_ = 0;
    v202->__r_.__value_.__r.__words[2] = 0;
    v202->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v295, *(float *)&v302);
    if ((v295.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v204 = &v295;
    }
    else {
      v204 = (std::string *)v295.__r_.__value_.__r.__words[0];
    }
    if ((v295.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v205 = HIBYTE(v295.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v205 = v295.__r_.__value_.__l.__size_;
    }
    v206 = std::string::append(&v316, (const std::string::value_type *)v204, v205);
    long long v207 = *(_OWORD *)&v206->__r_.__value_.__l.__data_;
    v317.__r_.__value_.__r.__words[2] = v206->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v207;
    v206->__r_.__value_.__l.__size_ = 0;
    v206->__r_.__value_.__r.__words[2] = 0;
    v206->__r_.__value_.__r.__words[0] = 0;
    v208 = std::string::append(&v317, ", ");
    long long v209 = *(_OWORD *)&v208->__r_.__value_.__l.__data_;
    v318.__r_.__value_.__r.__words[2] = v208->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v209;
    v208->__r_.__value_.__l.__size_ = 0;
    v208->__r_.__value_.__r.__words[2] = 0;
    v208->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v294, *((float *)&v302 + 1));
    if ((v294.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v210 = &v294;
    }
    else {
      v210 = (std::string *)v294.__r_.__value_.__r.__words[0];
    }
    if ((v294.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v211 = HIBYTE(v294.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v211 = v294.__r_.__value_.__l.__size_;
    }
    v212 = std::string::append(&v318, (const std::string::value_type *)v210, v211);
    long long v213 = *(_OWORD *)&v212->__r_.__value_.__l.__data_;
    v319.__r_.__value_.__r.__words[2] = v212->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v213;
    v212->__r_.__value_.__l.__size_ = 0;
    v212->__r_.__value_.__r.__words[2] = 0;
    v212->__r_.__value_.__r.__words[0] = 0;
    v214 = std::string::append(&v319, " ,");
    long long v215 = *(_OWORD *)&v214->__r_.__value_.__l.__data_;
    v320.__r_.__value_.__r.__words[2] = v214->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v215;
    v214->__r_.__value_.__l.__size_ = 0;
    v214->__r_.__value_.__r.__words[2] = 0;
    v214->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v293, *((float *)&v302 + 2));
    if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v216 = &v293;
    }
    else {
      v216 = (std::string *)v293.__r_.__value_.__r.__words[0];
    }
    if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v217 = HIBYTE(v293.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v217 = v293.__r_.__value_.__l.__size_;
    }
    v218 = std::string::append(&v320, (const std::string::value_type *)v216, v217);
    long long v219 = *(_OWORD *)&v218->__r_.__value_.__l.__data_;
    *(void *)&__p[16] = *((void *)&v218->__r_.__value_.__l + 2);
    *(_OWORD *)std::string __p = v219;
    v218->__r_.__value_.__l.__size_ = 0;
    v218->__r_.__value_.__r.__words[2] = 0;
    v218->__r_.__value_.__r.__words[0] = 0;
    v220 = std::string::append((std::string *)__p, ")");
    std::string::size_type v221 = v220->__r_.__value_.__r.__words[0];
    v327[0] = v220->__r_.__value_.__l.__size_;
    *(void *)((char *)v327 + 7) = *(std::string::size_type *)((char *)&v220->__r_.__value_.__r.__words[1] + 7);
    char v222 = HIBYTE(v220->__r_.__value_.__r.__words[2]);
    v220->__r_.__value_.__l.__size_ = 0;
    v220->__r_.__value_.__r.__words[2] = 0;
    v220->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v321.__r_.__value_.__l.__data_);
    }
    v321.__r_.__value_.__r.__words[0] = v221;
    v321.__r_.__value_.__l.__size_ = v327[0];
    *(std::string::size_type *)((char *)&v321.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v327 + 7);
    *((unsigned char *)&v321.__r_.__value_.__s + 23) = v222;
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v293.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v293.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v320.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v319.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v294.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v294.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v318.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v317.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v295.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v295.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v316.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v315.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v296.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v296.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v314.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v313.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v297.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v297.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v312.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v329.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v298.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v298.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v328.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v328.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v311.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v299.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v299.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v310.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v310.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v309.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v309.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v304.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v308.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v307.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v307.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v305.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v305.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v306.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v306.__r_.__value_.__l.__data_);
    }
    [(ViewController *)self log:&v321];
    [(ViewController *)self handleSuspend];
    int v223 = self->_iterationTotalSuccessfullRuns + self->_calibUpdateEachIsfEntiresLimit;
    self->_iterationTotalSuccessfullRuns = v223;
    if (v223 < self->_iterationTotalSuccessfullRunsLimit) {
      goto LABEL_359;
    }
    sub_100009158(__p, "dogWatch finishing iteration");
    [(ViewController *)self log:__p];
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    anon_b8 = self->_anon_b8;
    sub_10001A6B0((void **)self->_anon_b8, &v302);
    std::to_string(&v314, *p_iterationNumber);
    v226 = std::string::insert(&v314, 0, "iteration ");
    long long v227 = *(_OWORD *)&v226->__r_.__value_.__l.__data_;
    v315.__r_.__value_.__r.__words[2] = v226->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v227;
    v226->__r_.__value_.__l.__size_ = 0;
    v226->__r_.__value_.__r.__words[2] = 0;
    v226->__r_.__value_.__r.__words[0] = 0;
    v228 = std::string::append(&v315, " ");
    long long v229 = *(_OWORD *)&v228->__r_.__value_.__l.__data_;
    v316.__r_.__value_.__r.__words[2] = v228->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v229;
    v228->__r_.__value_.__l.__size_ = 0;
    v228->__r_.__value_.__r.__words[2] = 0;
    v228->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v313, *(float *)&v302);
    if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v230 = &v313;
    }
    else {
      v230 = (std::string *)v313.__r_.__value_.__r.__words[0];
    }
    if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v231 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v231 = v313.__r_.__value_.__l.__size_;
    }
    v232 = std::string::append(&v316, (const std::string::value_type *)v230, v231);
    long long v233 = *(_OWORD *)&v232->__r_.__value_.__l.__data_;
    v317.__r_.__value_.__r.__words[2] = v232->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v233;
    v232->__r_.__value_.__l.__size_ = 0;
    v232->__r_.__value_.__r.__words[2] = 0;
    v232->__r_.__value_.__r.__words[0] = 0;
    v234 = std::string::append(&v317, " ");
    long long v235 = *(_OWORD *)&v234->__r_.__value_.__l.__data_;
    v318.__r_.__value_.__r.__words[2] = v234->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v235;
    v234->__r_.__value_.__l.__size_ = 0;
    v234->__r_.__value_.__r.__words[2] = 0;
    v234->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v312, *((float *)&v302 + 1));
    if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v236 = &v312;
    }
    else {
      v236 = (std::string *)v312.__r_.__value_.__r.__words[0];
    }
    if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v237 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v237 = v312.__r_.__value_.__l.__size_;
    }
    v238 = std::string::append(&v318, (const std::string::value_type *)v236, v237);
    long long v239 = *(_OWORD *)&v238->__r_.__value_.__l.__data_;
    v319.__r_.__value_.__r.__words[2] = v238->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v239;
    v238->__r_.__value_.__l.__size_ = 0;
    v238->__r_.__value_.__r.__words[2] = 0;
    v238->__r_.__value_.__r.__words[0] = 0;
    v240 = std::string::append(&v319, " ");
    long long v241 = *(_OWORD *)&v240->__r_.__value_.__l.__data_;
    *(void *)&__p[16] = *((void *)&v240->__r_.__value_.__l + 2);
    *(_OWORD *)std::string __p = v241;
    v240->__r_.__value_.__l.__size_ = 0;
    v240->__r_.__value_.__r.__words[2] = 0;
    v240->__r_.__value_.__r.__words[0] = 0;
    std::to_string(&v329, *((float *)&v302 + 2));
    if ((v329.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v242 = &v329;
    }
    else {
      v242 = (std::string *)v329.__r_.__value_.__r.__words[0];
    }
    if ((v329.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v243 = HIBYTE(v329.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v243 = v329.__r_.__value_.__l.__size_;
    }
    v244 = std::string::append((std::string *)__p, (const std::string::value_type *)v242, v243);
    long long v245 = *(_OWORD *)&v244->__r_.__value_.__l.__data_;
    v320.__r_.__value_.__r.__words[2] = v244->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v320.__r_.__value_.__l.__data_ = v245;
    v244->__r_.__value_.__l.__size_ = 0;
    v244->__r_.__value_.__r.__words[2] = 0;
    v244->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v329.__r_.__value_.__l.__data_);
    }
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v319.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v312.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v318.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v317.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v313.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v316.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v315.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v314.__r_.__value_.__l.__data_);
    }
    LODWORD(v329.__r_.__value_.__r.__words[1]) = 1084227584;
    v329.__r_.__value_.__r.__words[0] = 0x4000000040000000;
    v328.__r_.__value_.__r.__words[0] = 0x4090000040900000;
    LODWORD(v328.__r_.__value_.__r.__words[1]) = 1091567616;
    if (!LOBYTE(self->_sensorId.__r_.var0))
    {
      __asm { FMOV            V0.2S, #3.0 }
      v329.__r_.__value_.__r.__words[0] = _D0;
      LODWORD(v329.__r_.__value_.__r.__words[1]) = 1086324736;
      __asm { FMOV            V0.2S, #6.0 }
      v328.__r_.__value_.__r.__words[0] = _D0;
      LODWORD(v328.__r_.__value_.__r.__words[1]) = 1091567616;
    }
    [(ViewController *)self addToReducedLog:&v320];
    if (*p_iterationNumber >= 3) {
      v252 = &v328;
    }
    else {
      v252 = &v329;
    }
    [(ViewController *)self compareResults:&v328];
    if (self->_diagnosticFinalResult == -3)
    {
      v253 = self->_backgroundDispatchQueue;
      v292[0] = _NSConcreteStackBlock;
      v292[1] = 3221225472;
      v292[2] = sub_10001A790;
      v292[3] = &unk_10002CE48;
      v292[4] = self;
      v254 = v292;
    }
    else
    {
      [(ViewController *)self compareResults:v252];
      if (self->_diagnosticFinalResult == -3) {
        int v256 = 3;
      }
      else {
        int v256 = 2;
      }
      self->_int iterationsLimit = v256;
      if (*p_iterationNumber < v256)
      {
        ++*p_iterationNumber;
        [(ViewController *)self prepareNewIteration];
        if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v320.__r_.__value_.__l.__data_);
        }
LABEL_359:
        [(ViewController *)self handleResume];
        v224 = self->_backgroundDispatchQueue;
        v290[0] = _NSConcreteStackBlock;
        v290[1] = 3221225472;
        v290[2] = sub_10001A7F0;
        v290[3] = &unk_10002CE48;
        v290[4] = self;
        dispatch_async(v224, v290);
LABEL_450:
        if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v321.__r_.__value_.__l.__data_);
        }
        goto LABEL_168;
      }
      uint64_t v257 = *(void *)anon_b8;
      if (*(void *)&self->_anon_b8[8] != *(void *)anon_b8)
      {
        uint64_t v258 = 0;
        unint64_t v259 = 0;
        long long v260 = *(_OWORD *)self->_avgRotAngles;
        avgRotAngles = self->_avgRotAngles;
        do
        {
          *(float *)&long long v255 = (float)(*(float *)(v257 + v258) / (float)self->_iterationsLimit) + *(float *)&v260;
          *(_DWORD *)avgRotAngles = v255;
          int iterationsLimit = self->_iterationsLimit;
          float v263 = *(float *)(*(void *)anon_b8 + v258 + 4);
          *(_DWORD *)&self->_avgRotAngles[8] = DWORD2(v260);
          LODWORD(v260) = v255;
          *((float *)&v260 + 1) = *((float *)&v260 + 1) + (float)(v263 / (float)iterationsLimit);
          *(void *)avgRotAngles = v260;
          DWORD1(v255) = DWORD1(v260);
          *((float *)&v255 + 2) = *((float *)&v260 + 2)
                                + (float)(*(float *)(*(void *)anon_b8 + v258 + 8) / (float)self->_iterationsLimit);
          *(void *)avgRotAngles = v260;
          *(float *)&self->_avgRotAngles[8] = *((float *)&v255 + 2);
          ++v259;
          uint64_t v257 = *(void *)anon_b8;
          v258 += 16;
          long long v260 = v255;
        }
        while (v259 < (uint64_t)(*(void *)&self->_anon_b8[8] - *(void *)self->_anon_b8) >> 4);
      }
      std::to_string(&v314, *(float *)self->_avgRotAngles);
      v264 = std::string::insert(&v314, 0, "Average Angles (x,y,z,) = (");
      long long v265 = *(_OWORD *)&v264->__r_.__value_.__l.__data_;
      v315.__r_.__value_.__r.__words[2] = v264->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v315.__r_.__value_.__l.__data_ = v265;
      v264->__r_.__value_.__l.__size_ = 0;
      v264->__r_.__value_.__r.__words[2] = 0;
      v264->__r_.__value_.__r.__words[0] = 0;
      v266 = std::string::append(&v315, ", ");
      long long v267 = *(_OWORD *)&v266->__r_.__value_.__l.__data_;
      v316.__r_.__value_.__r.__words[2] = v266->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v316.__r_.__value_.__l.__data_ = v267;
      v266->__r_.__value_.__l.__size_ = 0;
      v266->__r_.__value_.__r.__words[2] = 0;
      v266->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v313, *(float *)&self->_avgRotAngles[4]);
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v268 = &v313;
      }
      else {
        v268 = (std::string *)v313.__r_.__value_.__r.__words[0];
      }
      if ((v313.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v269 = HIBYTE(v313.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v269 = v313.__r_.__value_.__l.__size_;
      }
      v270 = std::string::append(&v316, (const std::string::value_type *)v268, v269);
      long long v271 = *(_OWORD *)&v270->__r_.__value_.__l.__data_;
      v317.__r_.__value_.__r.__words[2] = v270->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v317.__r_.__value_.__l.__data_ = v271;
      v270->__r_.__value_.__l.__size_ = 0;
      v270->__r_.__value_.__r.__words[2] = 0;
      v270->__r_.__value_.__r.__words[0] = 0;
      v272 = std::string::append(&v317, " ,");
      long long v273 = *(_OWORD *)&v272->__r_.__value_.__l.__data_;
      v318.__r_.__value_.__r.__words[2] = v272->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v318.__r_.__value_.__l.__data_ = v273;
      v272->__r_.__value_.__l.__size_ = 0;
      v272->__r_.__value_.__r.__words[2] = 0;
      v272->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v312, *(float *)&self->_avgRotAngles[8]);
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v274 = &v312;
      }
      else {
        v274 = (std::string *)v312.__r_.__value_.__r.__words[0];
      }
      if ((v312.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v275 = HIBYTE(v312.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v275 = v312.__r_.__value_.__l.__size_;
      }
      v276 = std::string::append(&v318, (const std::string::value_type *)v274, v275);
      long long v277 = *(_OWORD *)&v276->__r_.__value_.__l.__data_;
      v319.__r_.__value_.__r.__words[2] = v276->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v319.__r_.__value_.__l.__data_ = v277;
      v276->__r_.__value_.__l.__size_ = 0;
      v276->__r_.__value_.__r.__words[2] = 0;
      v276->__r_.__value_.__r.__words[0] = 0;
      v278 = std::string::append(&v319, ")");
      long long v279 = *(_OWORD *)&v278->__r_.__value_.__l.__data_;
      *(void *)&__p[16] = *((void *)&v278->__r_.__value_.__l + 2);
      *(_OWORD *)std::string __p = v279;
      v278->__r_.__value_.__l.__size_ = 0;
      v278->__r_.__value_.__r.__words[2] = 0;
      v278->__r_.__value_.__r.__words[0] = 0;
      [(ViewController *)self log:__p];
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v319.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v312.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v312.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v318.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v318.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v317.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v317.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v313.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v313.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v316.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v316.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v315.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v315.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v314.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v314.__r_.__value_.__l.__data_);
      }
      memset(&__p[4], 0, 252);
      *(_DWORD *)std::string __p = 2;
      if ([(ViewController *)self getRotAnglesToPrcl:__p focalPoint:*(double *)self->_avgRotAngles prcl:*(double *)self->_focalPoint])
      {
LABEL_448:
        if (SHIBYTE(v320.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v320.__r_.__value_.__l.__data_);
        }
        goto LABEL_450;
      }
      long long v280 = *(_OWORD *)&__p[208];
      *(_OWORD *)&self->_prclResult.reserved[26] = *(_OWORD *)&__p[192];
      *(_OWORD *)&self->_prclResult.reserved[42] = v280;
      long long v281 = *(_OWORD *)&__p[240];
      *(_OWORD *)&self->_prclResult.reserved[58] = *(_OWORD *)&__p[224];
      *(_OWORD *)&self->_prclResult.reserved[74] = v281;
      long long v282 = *(_OWORD *)&__p[144];
      *(_OWORD *)&self->_prclResult.teleRotMatrix[2][1] = *(_OWORD *)&__p[128];
      *(_OWORD *)&self->_prclResult.teleFocalPoint[2] = v282;
      long long v283 = *(_OWORD *)&__p[176];
      *(_OWORD *)&self->_prclResult.jasperSN[12] = *(_OWORD *)&__p[160];
      *(_OWORD *)&self->_prclResult.reserved[10] = v283;
      long long v284 = *(_OWORD *)&__p[80];
      *(_OWORD *)&self->_prclResult.wideRotMatrix[1][0] = *(_OWORD *)&__p[64];
      *(_OWORD *)&self->_prclResult.wideRotMatrix[2][1] = v284;
      long long v285 = *(_OWORD *)&__p[112];
      *(_OWORD *)&self->_prclResult.wideFocalPoint[2] = *(_OWORD *)&__p[96];
      *(_OWORD *)&self->_prclResult.teleRotMatrix[1][0] = v285;
      long long v286 = *(_OWORD *)&__p[16];
      *(_OWORD *)&self->_prclResult.version = *(_OWORD *)__p;
      *(_OWORD *)&self->_prclResult.swideRotMatrix[1][0] = v286;
      long long v287 = *(_OWORD *)&__p[48];
      *(_OWORD *)&self->_prclResult.swideRotMatrix[2][1] = *(_OWORD *)&__p[32];
      *(_OWORD *)&self->_prclResult.swideFocalPoint[2] = v287;
      sub_100009158(&v319, "dogWatch finishing all iterations");
      [(ViewController *)self log:&v319];
      if (SHIBYTE(v319.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v319.__r_.__value_.__l.__data_);
      }
      v253 = self->_backgroundDispatchQueue;
      v291[0] = _NSConcreteStackBlock;
      v291[1] = 3221225472;
      v291[2] = sub_10001A7E8;
      v291[3] = &unk_10002CE48;
      v291[4] = self;
      v254 = v291;
    }
    dispatch_async(v253, v254);
    self->_running = 0;
    goto LABEL_448;
  }
LABEL_168:
  if (SHIBYTE(v322.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v322.__r_.__value_.__l.__data_);
  }
LABEL_170:
}

- (void)primaryScalerHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4 streamType:(int)a5
{
  if (self->_running)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    CGImageRef imageOut = 0;
    VTCreateCGImageFromCVPixelBuffer(a3, 0, &imageOut);
    v13.size.height = (double)Height;
    v13.size.width = (double)Width;
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    long long v10 = CGImageCreateWithImageInRect(imageOut, v13);
    if (v10)
    {
      uint64_t v11 = +[UIImage imageWithCGImage:v10 scale:3 orientation:1.0];
    }
    else
    {
      uint64_t v11 = 0;
    }
    CGImageRelease(imageOut);
    CGImageRelease(v10);
    if (a5 == 1)
    {
      if (self->_uiStreamType != 1)
      {
LABEL_11:

        return;
      }
    }
    else if (a5 || self->_uiStreamType)
    {
      goto LABEL_11;
    }
    [(ViewControllerCallbacks *)self->_listener performSelectorOnMainThread:"setImage:" withObject:v11 waitUntilDone:0];
    goto LABEL_11;
  }
}

- (void)primaryScalerHxISPFrameAvailableCallbackW:(__CVBuffer *)a3 pts:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  [(ViewController *)self primaryScalerHxISPFrameAvailableCallback:a3 pts:&v4 streamType:0];
}

- (void)pointCloudHxISPFrameAvailableCallback:(__CVBuffer *)a3 pts:(id *)a4
{
}

- (void)error:(id)a3 details:(id)a4
{
  id v5 = a3;
  sub_100009158(__p, (char *)[v5 UTF8String]);
  [(ViewController *)self log:__p];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  [(ViewController *)self endTest];
}

- (BOOL)isPortTypeJasperDetected
{
  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (void)handleResume
{
  if (!*(void *)&self->_running)
  {
    self->_inResume = 1;
    sub_100009158(__p, "handleResume");
    [(ViewController *)self log:__p];
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    backgroundDispatchQueue = self->_backgroundDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001AE3C;
    v5[3] = &unk_10002CE48;
    v5[4] = self;
    dispatch_async(backgroundDispatchQueue, v5);
  }
}

- (void)handleSuspend
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = self;
  objc_sync_enter(v4);
  sub_100009158(__p, "handleSuspend");
  [(ViewController *)v4 log:__p];
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  v4->_running = 0;
  m_userMovementTracker = v4->m_userMovementTracker;
  if (m_userMovementTracker) {
    [(UserMovementTracker *)m_userMovementTracker stopDeviceMotionTracking];
  }
  if (v4->_diagnosticCMInterface)
  {
    [(NSTimer *)v4->_watchDogTimer invalidate];
    backgroundDispatchQueue = v4->_backgroundDispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001BC24;
    v7[3] = &unk_10002CE48;
    v7[4] = v4;
    dispatch_async(backgroundDispatchQueue, v7);
  }
  objc_sync_exit(v4);
}

- (void)endTest
{
  self->_running = 0;
  watchDogTimer = self->_watchDogTimer;
  if (watchDogTimer) {
    [(NSTimer *)watchDogTimer invalidate];
  }
  sub_100009158(__p, "endTest");
  [(ViewController *)self log:__p];
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
  std::to_string(&v7, self->_noMovementCounter);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = std::string::insert(&v7, 0, "noMovementCount ");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  std::string::size_type v9 = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  [(ViewController *)self addToReducedLog:__p];
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
  if (BYTE5(self->_sensorId.var0))
  {
    sub_100009158(__p, "_skipSummaryScreen is true");
    [(ViewController *)self log:__p];
    if (SHIBYTE(v9) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v6 = [(ViewController *)self listener];
    [v6 finishRun:self->_resultsDict reducedLog:self->_reducedLog result:self->_diagnosticFinalResult prcl:&self->_prclResult angles:self->_avgRotAngles];

    exit(0);
  }
  sub_100009158(__p, "_skipSummaryScreen is false");
  [(ViewController *)self log:__p];
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
  [(ViewController *)self showSummaryScreen:self->_diagnosticFinalResult == 0];
}

- (void)showSummaryScreen:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C020;
  v3[3] = &unk_10002CE98;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)buttonClicked:(id)a3
{
  sub_100009158(__p, "button clicked");
  [(ViewController *)self log:__p];
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

- (void)setUpperViewLabelText:(id)a3
{
  id v4 = a3;
  sub_100009158(&v10, (char *)[v4 UTF8String]);
  std::operator+<char>();
  [(ViewController *)self log:&__p];
  if (v9 < 0) {
    operator delete(__p);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C55C;
  v6[3] = &unk_10002CEC0;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  if (v11 < 0) {
    operator delete(v10);
  }
}

- (void)duplicatPixelBuffer:(__CVBuffer *)a3 newBuffer:(__CVBuffer *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (!CVPixelBufferCreate(kCFAllocatorDefault, Width, Height, PixelFormatType, 0, a4))
  {
    char v9 = *a4;
    CVPixelBufferLockBaseAddress(v9, 0);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v9, 0);
    char v11 = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    memcpy(BaseAddressOfPlane, v11, HeightOfPlane * BytesPerRowOfPlane);
    unint64_t v14 = CVPixelBufferGetBaseAddressOfPlane(v9, 1uLL);
    unint64_t v15 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    size_t v16 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    size_t v17 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
    memcpy(v14, v15, v17 * v16);
    CVPixelBufferUnlockBaseAddress(v9, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
}

- (void)cancel
{
  sub_100009158(__p, "cancel");
  [(ViewController *)self log:__p];
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  self->_diagnosticFinalResult = -4;
  [(ViewController *)self handleSuspend];
}

- (id)getCurrentLog
{
  return self->_resultsDict;
}

- (int)getCurrentResult
{
  return self->_diagnosticFinalResult;
}

- (void)hideInProgressView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C948;
  block[3] = &unk_10002CE48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (void)showInProgressView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CA20;
  block[3] = &unk_10002CE48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideWarningWindow
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CEB8;
  block[3] = &unk_10002CE48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showWarningWindow:(id)a3 subMessage:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CFD4;
  block[3] = &unk_10002CEE8;
  block[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)quitButtonTapped
{
  sub_100009158(__p, "Quit button tapped!");
  [(ViewController *)self log:__p];
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  [(ViewController *)self endTest];
}

- (void)continueButtonPressed:(id)a3
{
  id v4 = a3;
  NSLog(@"Continue button pressed");
  id v5 = [(ViewController *)self listener];
  [v5 finishRun:self->_resultsDict reducedLog:self->_reducedLog result:self->_diagnosticFinalResult prcl:&self->_prclResult angles:self->_avgRotAngles];

  exit(0);
}

- (UIView)storyBoardView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consecutiveSceneErrorWarningLimit);

  return (UIView *)WeakRetained;
}

- (void)setStoryBoardView:(id)a3
{
}

- (ViewControllerCallbacks)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noMovementAttitudeChangeMinThreshold);

  return (ViewControllerCallbacks *)WeakRetained;
}

- (void)setListener:(id)a3
{
}

- (int)sessionMaxTimeOut
{
  return *(_DWORD *)&self->_isJasper;
}

- (void)setSessionMaxTimeOut:(int)a3
{
  *(_DWORD *)&self->_isJasper = a3;
}

- (int)consecutiveSceneErrorLimit
{
  return self->_topTextHeight;
}

- (void)setConsecutiveSceneErrorLimit:(int)a3
{
  self->_topTextsize_t Height = a3;
}

- (int)consecutiveSceneErrorWarningLimit
{
  return self->_textMargin;
}

- (void)setConsecutiveSceneErrorWarningLimit:(int)a3
{
  self->_textMargin = a3;
}

- (unsigned)userNotMovingTimeout
{
  return *(_DWORD *)&self->_upperViewRendered;
}

- (void)setUserNotMovingTimeout:(unsigned int)a3
{
  *(_DWORD *)&self->_upperViewRendered = a3;
}

- (float)noMovementAttitudeChangeMinThreshold
{
  return *(float *)&self->_sessionMaxTimeOut;
}

- (void)setNoMovementAttitudeChangeMinThreshold:(float)a3
{
  *(float *)&self->_sessionMaxTimeOut = a3;
}

- (BOOL)skipSummaryScreen
{
  return BYTE5(self->_sensorId.var0);
}

- (void)setSkipSummaryScreen:(BOOL)a3
{
  BYTE5(self->_sensorId.var0) = a3;
}

- (UIView)mainView
{
  return self->_storyBoardView;
}

- (void)setMainView:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)self->_listener;
}

- (void)setImageView:(id)a3
{
}

- (UIView)cameraView
{
  return self->_mainView;
}

- (void)setCameraView:(id)a3
{
}

- (UIView)middleView
{
  return &self->_imageView->super;
}

- (void)setMiddleView:(id)a3
{
}

- (UIView)upperView
{
  return self->_cameraView;
}

- (void)setUpperView:(id)a3
{
}

- (UIStackView)bottomView
{
  return (UIStackView *)self->_middleView;
}

- (void)setBottomView:(id)a3
{
}

- (UILabel)statusLabel
{
  return (UILabel *)self->_upperView;
}

- (void)setStatusLabel:(id)a3
{
}

- (UIProgressView)progressView
{
  return (UIProgressView *)self->_bottomView;
}

- (void)setProgressView:(id)a3
{
}

- (UIView)gradientView
{
  return &self->_statusLabel->super;
}

- (void)setGradientView:(id)a3
{
}

- (UILabel)upperViewLabel
{
  return (UILabel *)self->_progressView;
}

- (void)setUpperViewLabel:(id)a3
{
}

- (UITextView)textView
{
  return (UITextView *)self->_gradientView;
}

- (void)setTextView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)self->_upperViewLabel;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIView)activityIndicatorBackgroundView
{
  return &self->_textView->super.super;
}

- (void)setActivityIndicatorBackgroundView:(id)a3
{
}

- (UIImageView)warningImageView
{
  return (UIImageView *)self->_activityIndicatorView;
}

- (void)setWarningImageView:(id)a3
{
}

- (UIView)warningImageViewBackground
{
  return self->_activityIndicatorBackgroundView;
}

- (void)setWarningImageViewBackground:(id)a3
{
}

- (UILabel)warningViewLabel
{
  return (UILabel *)self->_warningImageView;
}

- (void)setWarningViewLabel:(id)a3
{
}

- (UILabel)warningViewSubLabel
{
  return (UILabel *)self->_warningImageViewBackground;
}

- (void)setWarningViewSubLabel:(id)a3
{
}

- (NSLayoutConstraint)upperTextWidthConstraint
{
  return (NSLayoutConstraint *)self->_warningViewLabel;
}

- (void)setUpperTextWidthConstraint:(id)a3
{
}

- (UIButton)quitButton
{
  return (UIButton *)self->_warningViewSubLabel;
}

- (void)setQuitButton:(id)a3
{
}

- (OBWelcomeController)contentViewController
{
  return (OBWelcomeController *)self->_upperTextWidthConstraint;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upperTextWidthConstraint, 0);
  objc_storeStrong((id *)&self->_warningViewSubLabel, 0);
  objc_storeStrong((id *)&self->_warningViewLabel, 0);
  objc_storeStrong((id *)&self->_warningImageViewBackground, 0);
  objc_storeStrong((id *)&self->_warningImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_upperViewLabel, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_upperView, 0);
  objc_storeStrong((id *)&self->_middleView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_storyBoardView, 0);
  objc_destroyWeak((id *)&self->_noMovementAttitudeChangeMinThreshold);
  objc_destroyWeak((id *)&self->_consecutiveSceneErrorWarningLimit);
  if (*((char *)&self->_sensorId.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_sensorId.__r_.__value_.var0.__l.__data_);
  }
  objc_storeStrong((id *)&self->m_noMovementQuitTimer, 0);
  objc_storeStrong((id *)&self->m_userMovementTracker, 0);
  objc_storeStrong((id *)&self->_backgroundDispatchQueue, 0);
  DeviceCMInterface v3 = *(void **)self->_anon_b8;
  if (v3)
  {
    *(void *)&self->_anon_b8[8] = v3;
    operator delete(v3);
  }
  sub_10001E99C((uint64_t)&self->_rgbjCalibrationResults, (void *)self->_rgbjCalibrationResults.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_warningFont, 0);
  objc_storeStrong((id *)&self->_reducedLog, 0);
  objc_storeStrong((id *)&self->_resultsDict, 0);
  objc_storeStrong((id *)&self->_watchDogTimer, 0);
  listener = self->_streamingClient._listener;
}

- (id).cxx_construct
{
  *((void *)self + 2) = off_10002CF18;
  *((void *)self + 3) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 20) = (char *)self + 168;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = 0;
  *(_OWORD *)((char *)self + 488) = 0u;
  *(_OWORD *)((char *)self + 476) = 0u;
  *(_OWORD *)((char *)self + 460) = 0u;
  *(_OWORD *)((char *)self + 444) = 0u;
  *(_OWORD *)((char *)self + 428) = 0u;
  *(_OWORD *)((char *)self + 412) = 0u;
  *(_OWORD *)((char *)self + 396) = 0u;
  *(_OWORD *)((char *)self + 380) = 0u;
  *(_OWORD *)((char *)self + 364) = 0u;
  *(_OWORD *)((char *)self + 348) = 0u;
  *(_OWORD *)((char *)self + 332) = 0u;
  *(_OWORD *)((char *)self + 316) = 0u;
  *(_OWORD *)((char *)self + 300) = 0u;
  *(_OWORD *)((char *)self + 284) = 0u;
  *(_OWORD *)((char *)self + 268) = 0u;
  *(_OWORD *)((char *)self + 252) = 0u;
  *((_DWORD *)self + 62) = 2;
  *((_OWORD *)self + 34) = 0uLL;
  *((void *)self + 67) = 0;
  return self;
}

@end