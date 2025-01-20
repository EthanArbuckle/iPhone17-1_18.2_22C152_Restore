@interface CalibrationViewServiceController
+ (void)dismissCalibrationAlert;
+ (void)load;
- (BOOL)prefersStatusBarHidden;
- (CLLocationManager)locationManager;
- (CMMotionManager)motionManager;
- (CalibrationViewController)calibrationViewController;
- (CalibrationViewServiceController)init;
- (NSTimer)maximumTimer;
- (NSTimer)minimumTimer;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)finishedCalibrating;
- (void)maximumTimeElapsed;
- (void)minimumTimeElapsed;
- (void)reset;
- (void)setMaximumTimer:(id)a3;
- (void)setMinimumTimer:(id)a3;
- (void)tryToDismissCalibration;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CalibrationViewServiceController

+ (void)load
{
  int out_token = 0;
  notify_register_dispatch("com.apple.DismissCalibration", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100004130);
}

+ (void)dismissCalibrationAlert
{
  v2 = [(id)qword_100008AE0 _remoteViewControllerProxy];
  [v2 dismiss];

  v3 = (void *)qword_100008AE0;
  qword_100008AE0 = 0;
}

- (CalibrationViewServiceController)init
{
  v4.receiver = self;
  v4.super_class = (Class)CalibrationViewServiceController;
  v2 = [(CalibrationViewServiceController *)&v4 init];
  if (v2)
  {
    [(id)objc_opt_class() dismissCalibrationAlert];
    objc_storeStrong((id *)&qword_100008AE0, v2);
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewServiceController;
  [(CalibrationViewServiceController *)&v3 viewDidLoad];
  [(CalibrationViewServiceController *)self reset];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CalibrationViewServiceController;
  [(CalibrationViewServiceController *)&v13 viewWillAppear:a3];
  objc_initWeak(&location, self);
  objc_super v4 = [(CalibrationViewServiceController *)self motionManager];
  v5 = +[NSOperationQueue mainQueue];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100002154;
  v10 = &unk_100004158;
  objc_copyWeak(&v11, &location);
  [v4 startDeviceMotionUpdatesUsingReferenceFrame:1 toQueue:v5 withHandler:&v7];

  v6 = [(CalibrationViewServiceController *)self locationManager];
  [v6 startUpdatingHeading];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"finishedCalibrating" selector:0 userInfo:0 repeats:15.0];
  [(CalibrationViewServiceController *)self setMaximumTimer:v5];

  v6 = +[NSTimer scheduledTimerWithTimeInterval:self target:"minimumTimeElapsed" selector:0 userInfo:0 repeats:5.0];
  [(CalibrationViewServiceController *)self setMinimumTimer:v6];

  self->_minTimeElapsed = 0;
  self->_maxTimeElapsed = 0;
  self->_calibrated = 0;
  self->_hasPresented = 1;
  v7 = [(CalibrationViewServiceController *)self view];
  uint64_t v8 = [v7 window];
  v9 = [v8 windowScene];
  self->_finalOrientation = (int64_t)[v9 interfaceOrientation];

  [(CalibrationViewServiceController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  [(CalibrationViewServiceController *)self addChildViewController:self->_calibrationViewController];
  v10 = [(CalibrationViewServiceController *)self view];
  id v11 = [(CalibrationViewController *)self->_calibrationViewController view];
  [v10 addSubview:v11];

  v12 = [(CalibrationViewServiceController *)self view];
  objc_super v13 = [v12 layer];
  v14 = +[CATransition animation];
  [v13 addAnimation:v14 forKey:@"fade"];

  [(CalibrationViewController *)self->_calibrationViewController didMoveToParentViewController:self];
  v15.receiver = self;
  v15.super_class = (Class)CalibrationViewServiceController;
  [(CalibrationViewServiceController *)&v15 viewDidAppear:v3];
}

- (void)reset
{
  id v2 = [(CalibrationViewServiceController *)self calibrationViewController];
  [v2 reset];
}

- (CalibrationViewController)calibrationViewController
{
  calibrationViewController = self->_calibrationViewController;
  if (!calibrationViewController)
  {
    objc_super v4 = (CalibrationViewController *)objc_alloc_init((Class)CalibrationViewController);
    v5 = self->_calibrationViewController;
    self->_calibrationViewController = v4;

    calibrationViewController = self->_calibrationViewController;
  }

  return calibrationViewController;
}

- (CMMotionManager)motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    objc_super v4 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
    v5 = self->_motionManager;
    self->_motionManager = v4;

    [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:0.0500000007];
    motionManager = self->_motionManager;
  }

  return motionManager;
}

- (CLLocationManager)locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    objc_super v4 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/CompassCalibration.bundle" delegate:self onQueue:&_dispatch_main_q];
    v5 = self->_locationManager;
    self->_locationManager = v4;

    [(CLLocationManager *)self->_locationManager setDelegate:self];
    locationManager = self->_locationManager;
  }

  return locationManager;
}

- (void)minimumTimeElapsed
{
  BOOL v3 = [(CalibrationViewServiceController *)self minimumTimer];
  [v3 invalidate];

  [(CalibrationViewServiceController *)self setMinimumTimer:0];
  self->_minTimeElapsed = 1;

  [(CalibrationViewServiceController *)self tryToDismissCalibration];
}

- (void)maximumTimeElapsed
{
  BOOL v3 = [(CalibrationViewServiceController *)self maximumTimer];
  [v3 invalidate];

  [(CalibrationViewServiceController *)self setMaximumTimer:0];
  self->_maxTimeElapsed = 1;

  [(CalibrationViewServiceController *)self tryToDismissCalibration];
}

- (void)finishedCalibrating
{
  self->_calibrated = 1;
  [(CalibrationViewServiceController *)self tryToDismissCalibration];
}

- (void)tryToDismissCalibration
{
  if (self->_minTimeElapsed && self->_calibrated || self->_maxTimeElapsed)
  {
    BOOL v3 = [(CalibrationViewServiceController *)self motionManager];
    [v3 stopDeviceMotionUpdates];

    objc_super v4 = [(CalibrationViewServiceController *)self locationManager];
    [v4 stopUpdatingHeading];

    [(id)objc_opt_class() dismissCalibrationAlert];
    v5 = [(CalibrationViewServiceController *)self maximumTimer];
    [v5 invalidate];

    [(CalibrationViewServiceController *)self setMaximumTimer:0];
    v6 = [(CalibrationViewServiceController *)self minimumTimer];
    [v6 invalidate];

    [(CalibrationViewServiceController *)self setMinimumTimer:0];
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_maximumTimer invalidate];
  [(NSTimer *)self->_minimumTimer invalidate];
  [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
  [(CLLocationManager *)self->_locationManager stopUpdatingHeading];
  v3.receiver = self;
  v3.super_class = (Class)CalibrationViewServiceController;
  [(CalibrationViewServiceController *)&v3 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (!self->_hasPresented) {
    return 30;
  }
  unint64_t v2 = self->_finalOrientation - 2;
  if (v2 > 2) {
    return 2;
  }
  else {
    return qword_100003060[v2];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (NSTimer)maximumTimer
{
  return self->_maximumTimer;
}

- (void)setMaximumTimer:(id)a3
{
}

- (NSTimer)minimumTimer
{
  return self->_minimumTimer;
}

- (void)setMinimumTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_storeStrong((id *)&self->_maximumTimer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);

  objc_storeStrong((id *)&self->_calibrationViewController, 0);
}

@end