@interface ProximitySensorViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)timedOut;
- (DAHIDEventMonitor)eventMonitor;
- (DAProximityManagerProtocol)proximityManager;
- (NSTimer)holdTimer;
- (NSTimer)timeoutTimer;
- (ProximitySensorInputs)inputs;
- (UIImage)downImage;
- (UIImage)upImage;
- (UIImageView)instructionImageView;
- (id)downloadImageAsset:(id)a3 withResponder:(id)a4 error:(id *)a5;
- (id)instructionImageForPhase:(unint64_t)a3;
- (int64_t)actualCloseStateThreshold;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)proximityState;
- (unint64_t)sensorType;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)testPhase;
- (void)beginTest;
- (void)cleanUp;
- (void)disableProximitySensor;
- (void)enableProximitySensor;
- (void)endTest;
- (void)finishEarlyWithStatus:(int64_t)a3;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)hideInstructionImageAnimated:(BOOL)a3;
- (void)holdTimerFinished:(id)a3;
- (void)resetHoldTimerWithProximityState:(unint64_t)a3;
- (void)resetTimeoutTimer;
- (void)setActualCloseStateThreshold:(int64_t)a3;
- (void)setDownImage:(id)a3;
- (void)setEventMonitor:(id)a3;
- (void)setHoldTimer:(id)a3;
- (void)setInputs:(id)a3;
- (void)setInstructionImageView:(id)a3;
- (void)setProximityManager:(id)a3;
- (void)setProximityState:(unint64_t)a3;
- (void)setSensorType:(unint64_t)a3;
- (void)setTestPhase:(unint64_t)a3;
- (void)setTimedOut:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUpImage:(id)a3;
- (void)setupUI;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)showAlertWithTitle:(id)a3 message:(id)a4;
- (void)showInstructionImageForPhase:(unint64_t)a3 animated:(BOOL)a4;
- (void)start;
- (void)stopHoldTimer;
- (void)stopTimeoutTimer;
- (void)timeoutOccurred;
@end

@implementation ProximitySensorViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a4;
  [(ProximitySensorViewController *)self setInputs:a3];
  v7 = [(ProximitySensorViewController *)self inputs];
  v8 = [v7 downImageFileName];
  unsigned __int8 v9 = [v8 isEqualToString:&stru_10000C760];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v11 = [(ProximitySensorViewController *)self inputs];
    v12 = [v11 downImageFileName];
    id v34 = 0;
    v13 = [(ProximitySensorViewController *)self downloadImageAsset:v12 withResponder:v6 error:&v34];
    id v10 = v34;
    [(ProximitySensorViewController *)self setDownImage:v13];

    if (v10) {
      -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", [v10 code]);
    }
  }
  v14 = [(ProximitySensorViewController *)self inputs];
  v15 = [v14 upImageFileName];
  unsigned __int8 v16 = [v15 isEqualToString:&stru_10000C760];

  if ((v16 & 1) == 0)
  {
    v17 = [(ProximitySensorViewController *)self inputs];
    v18 = [v17 upImageFileName];
    id v33 = v10;
    v19 = [(ProximitySensorViewController *)self downloadImageAsset:v18 withResponder:v6 error:&v33];
    id v20 = v33;

    [(ProximitySensorViewController *)self setUpImage:v19];
    if (v20)
    {
      -[ProximitySensorViewController finishEarlyWithStatus:](self, "finishEarlyWithStatus:", [v20 code]);
      id v10 = v20;
    }
    else
    {
      id v10 = 0;
    }
  }
  v21 = +[DAOpticalProximityManager sharedInstance];
  unsigned int v22 = [v21 opticalSensorPresent];

  uint64_t v23 = v22 ^ 1;
  v24 = off_10000C2F8;
  if (v22) {
    v24 = &off_10000C300;
  }
  v25 = [(__objc2_class *)*v24 sharedInstance];
  [(ProximitySensorViewController *)self setProximityManager:v25];

  [(ProximitySensorViewController *)self setSensorType:v23];
  v26 = +[DSTestAutomation sharedInstance];
  LODWORD(v25) = [v26 testAutomationEnabled];

  if (v25)
  {
    v35[0] = @"noInputTimeout";
    v27 = [(ProximitySensorViewController *)self inputs];
    v28 = [v27 noInputTimeout];
    v29 = numberOrNull(v28);
    v36[0] = v29;
    v35[1] = @"holdTime";
    v30 = [(ProximitySensorViewController *)self inputs];
    v31 = [v30 holdTime];
    v36[1] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    +[DSTestAutomation postConfiguration:v32];
  }
  [(ProximitySensorViewController *)self setupUI];
}

- (id)downloadImageAsset:(id)a3 withResponder:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_1000039F0;
  v38 = sub_100003A00;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1000039F0;
  v32 = sub_100003A00;
  id v33 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100003A08;
  v23[3] = &unk_10000C4E0;
  id v11 = v8;
  id v24 = v11;
  v26 = &v34;
  v27 = &v28;
  v12 = v10;
  v25 = v12;
  [v9 getAsset:v11 completion:v23];
  v13 = [(ProximitySensorViewController *)self inputs];
  v14 = [v13 assetDownloadTimeout];
  [v14 doubleValue];
  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  intptr_t v17 = dispatch_semaphore_wait(v12, v16);

  if (v17)
  {
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Timed out downloading image asset.";
    v18 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v19 = +[NSError errorWithDomain:@"DAProximitySensorErrorDomain" code:-6 userInfo:v18];
    id v20 = (void *)v29[5];
    v29[5] = v19;
  }
  if (a5) {
    *a5 = (id) v29[5];
  }
  id v21 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v21;
}

- (void)start
{
}

- (void)setupUI
{
  id v4 = +[UIColor whiteColor];
  v3 = [(ProximitySensorViewController *)self view];
  [v3 setBackgroundColor:v4];
}

- (void)cleanUp
{
  [(ProximitySensorViewController *)self stopTimeoutTimer];
  [(ProximitySensorViewController *)self stopHoldTimer];
  [(ProximitySensorViewController *)self disableProximitySensor];
  v3 = [(ProximitySensorViewController *)self eventMonitor];

  if (v3)
  {
    id v4 = [(ProximitySensorViewController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      id v6 = [(ProximitySensorViewController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(ProximitySensorViewController *)self setEventMonitor:0];
  }
  v7 = [(ProximitySensorViewController *)self proximityManager];

  if (v7)
  {
    id v8 = [(ProximitySensorViewController *)self proximityManager];
    unsigned int v9 = [v8 isUpdating];

    if (v9)
    {
      dispatch_semaphore_t v10 = [(ProximitySensorViewController *)self proximityManager];
      [v10 stopProximitySensorUpdates];
    }
    [(ProximitySensorViewController *)self setProximityManager:0];
  }
}

- (void)setProximityState:(unint64_t)a3
{
  self->_proximityState = a3;
  if ([(ProximitySensorViewController *)self timedOut]) {
    return;
  }
  unint64_t v5 = [(ProximitySensorViewController *)self testPhase];
  switch(v5)
  {
    case 2uLL:
      goto LABEL_5;
    case 1uLL:
      if (a3) {
        return;
      }
LABEL_8:
      id v6 = (char *)[(ProximitySensorViewController *)self testPhase] + 1;
      [(ProximitySensorViewController *)self setTestPhase:v6];
      return;
    case 0uLL:
LABEL_5:
      if (a3 != 1) {
        return;
      }
      goto LABEL_8;
  }
  v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10000706C(self);
  }
}

- (void)setTestPhase:(unint64_t)a3
{
  self->_testPhase = a3;
  switch(a3)
  {
    case 0uLL:
      [(ProximitySensorViewController *)self beginTest];
      break;
    case 1uLL:
      unint64_t v5 = +[DSTestAutomation sharedInstance];
      unsigned int v6 = [v5 testAutomationEnabled];

      if (v6) {
        +[DSTestAutomation postInteractiveTestEvent:@"BeganListeningForProximityStateChange" info:&off_10000CCA0];
      }
      goto LABEL_13;
    case 2uLL:
      v7 = +[DSTestAutomation sharedInstance];
      unsigned int v8 = [v7 testAutomationEnabled];

      if (v8) {
        +[DSTestAutomation postInteractiveTestEvent:@"BeganListeningForProximityStateChange" info:&off_10000CCC8];
      }
LABEL_13:
      [(ProximitySensorViewController *)self resetTimeoutTimer];
      -[ProximitySensorViewController showInstructionImageForPhase:animated:](self, "showInstructionImageForPhase:animated:");
      break;
    case 3uLL:
      [(ProximitySensorViewController *)self endTest];
      [(ProximitySensorViewController *)self hideInstructionImageAnimated:1];
      break;
    default:
      id v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000070FC(self);
      }

      break;
  }
}

- (void)beginTest
{
  v3 = [(ProximitySensorViewController *)self result];
  [v3 setStatusCode:&off_10000CAB8];

  [(ProximitySensorViewController *)self setTimedOut:0];
  [(ProximitySensorViewController *)self enableProximitySensor];

  [(ProximitySensorViewController *)self setProximityState:1];
}

- (void)endTest
{
  [(ProximitySensorViewController *)self cleanUp];
  if (![(ProximitySensorViewController *)self sensorType])
  {
    v3 = [(ProximitySensorViewController *)self proximityManager];
    id v4 = [v3 sensorData];
    unint64_t v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

    unsigned int v6 = +[NSNumber numberWithLong:[(ProximitySensorViewController *)self actualCloseStateThreshold]];
    [v5 setObject:v6 forKeyedSubscript:@"actualCloseStateThreshold"];

    v7 = [(ProximitySensorViewController *)self result];
    [v7 setData:v5];
  }

  [(ProximitySensorViewController *)self setFinished:1];
}

- (void)finishEarlyWithStatus:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  unint64_t v5 = [(ProximitySensorViewController *)self result];
  [v5 setStatusCode:v4];

  [(ProximitySensorViewController *)self setFinished:1];
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ProximitySensorViewController *)self stopTimeoutTimer];
  [(ProximitySensorViewController *)self setTimedOut:1];
  [(ProximitySensorViewController *)self hideInstructionImageAnimated:1];
  unsigned int v8 = +[UIAlertController alertControllerWithTitle:v7 message:v6 preferredStyle:1];

  unsigned int v9 = +[NSBundle mainBundle];
  dispatch_semaphore_t v10 = [v9 localizedStringForKey:@"SKIP" value:&stru_10000C760 table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004450;
  v16[3] = &unk_10000C508;
  v16[4] = self;
  id v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v16];
  [v8 addAction:v11];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"RETRY" value:&stru_10000C760 table:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004520;
  v15[3] = &unk_10000C508;
  v15[4] = self;
  v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v15];
  [v8 addAction:v14];

  [(ProximitySensorViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)enableProximitySensor
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting Backboard HID Services to set proximity detection mode to passive.", buf, 2u);
  }

  BKSHIDServicesRequestProximityDetectionMode();
  id v4 = [(ProximitySensorViewController *)self eventMonitor];
  if (v4)
  {

LABEL_6:
    *(void *)buf = 0;
    v14 = buf;
    uint64_t v15 = 0x2020000000;
    unint64_t v16 = 0;
    unint64_t v16 = [(ProximitySensorViewController *)self proximityState];
    unint64_t v5 = [(ProximitySensorViewController *)self proximityManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004728;
    v12[3] = &unk_10000C530;
    v12[4] = self;
    v12[5] = buf;
    unsigned __int8 v6 = [v5 startProximitySensorUpdatesWithHandler:v12];

    if ((v6 & 1) == 0) {
      [(ProximitySensorViewController *)self finishEarlyWithStatus:-4];
    }
    _Block_object_dispose(buf, 8);
    return;
  }
  if ([(ProximitySensorViewController *)self sensorType]) {
    goto LABEL_6;
  }
  id v7 = +[DAHIDEventMonitor sharedInstance];
  [(ProximitySensorViewController *)self setEventMonitor:v7];

  unsigned int v8 = [(ProximitySensorViewController *)self eventMonitor];
  [v8 setDelegate:self];

  unsigned int v9 = [(ProximitySensorViewController *)self eventMonitor];
  dispatch_semaphore_t v10 = +[NSSet setWithObject:&off_10000CB18];
  unsigned __int8 v11 = [v9 startMonitoringWithHIDEvents:v10];

  if ((v11 & 1) == 0) {
    [(ProximitySensorViewController *)self finishEarlyWithStatus:-3];
  }
}

- (void)disableProximitySensor
{
  v3 = [(ProximitySensorViewController *)self eventMonitor];

  if (v3)
  {
    id v4 = [(ProximitySensorViewController *)self eventMonitor];
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      unsigned __int8 v6 = [(ProximitySensorViewController *)self eventMonitor];
      [v6 stopMonitoring];
    }
    [(ProximitySensorViewController *)self setEventMonitor:0];
  }
  else if ((id)[(ProximitySensorViewController *)self sensorType] == (id)1)
  {
    id v7 = [(ProximitySensorViewController *)self proximityManager];
    unsigned int v8 = [v7 isUpdating];

    if (v8)
    {
      unsigned int v9 = [(ProximitySensorViewController *)self proximityManager];
      [v9 stopProximitySensorUpdates];
    }
  }
  dispatch_semaphore_t v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting Backboard HID Services to restore proximity detection mode.", v11, 2u);
  }

  BKSHIDServicesRequestProximityDetectionMode();
}

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetType() == 14)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue < 1)
    {
      uint64_t v5 = 1;
    }
    else
    {
      [(ProximitySensorViewController *)self setActualCloseStateThreshold:IntegerValue];
      uint64_t v5 = 0;
    }
    [(ProximitySensorViewController *)self resetHoldTimerWithProximityState:v5];
  }
}

- (void)timeoutOccurred
{
  [(ProximitySensorViewController *)self disableProximitySensor];
  id v4 = +[NSBundle mainBundle];
  v3 = [v4 localizedStringForKey:@"NO_INPUT_DETECTED" value:&stru_10000C760 table:0];
  [(ProximitySensorViewController *)self showAlertWithTitle:v3 message:0];
}

- (void)resetTimeoutTimer
{
  [(ProximitySensorViewController *)self stopTimeoutTimer];
  [(ProximitySensorViewController *)self setTimedOut:0];
  v3 = [(ProximitySensorViewController *)self inputs];
  id v4 = [v3 noInputTimeout];

  if (v4)
  {
    id v7 = [(ProximitySensorViewController *)self inputs];
    uint64_t v5 = [v7 noInputTimeout];
    [v5 doubleValue];
    unsigned __int8 v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timeoutOccurred", 0, 0);
    [(ProximitySensorViewController *)self setTimeoutTimer:v6];
  }
}

- (void)stopTimeoutTimer
{
  v3 = [(ProximitySensorViewController *)self timeoutTimer];

  if (v3)
  {
    id v4 = [(ProximitySensorViewController *)self timeoutTimer];
    [v4 invalidate];

    [(ProximitySensorViewController *)self setTimeoutTimer:0];
  }
}

- (void)holdTimerFinished:(id)a3
{
  id v5 = a3;
  if (![(ProximitySensorViewController *)self timedOut])
  {
    id v4 = [v5 userInfo];
    -[ProximitySensorViewController setProximityState:](self, "setProximityState:", [v4 unsignedIntegerValue]);
  }
}

- (void)resetHoldTimerWithProximityState:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004C2C;
  v3[3] = &unk_10000C558;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)stopHoldTimer
{
  v3 = [(ProximitySensorViewController *)self holdTimer];

  if (v3)
  {
    id v4 = [(ProximitySensorViewController *)self holdTimer];
    [v4 invalidate];

    [(ProximitySensorViewController *)self setHoldTimer:0];
  }
}

- (id)instructionImageForPhase:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v7 = [(ProximitySensorViewController *)self downImage];

    if (v7)
    {
      uint64_t v6 = [(ProximitySensorViewController *)self downImage];
      goto LABEL_7;
    }
  }
  else if (a3 == 2)
  {
    id v5 = [(ProximitySensorViewController *)self upImage];

    if (v5)
    {
      uint64_t v6 = [(ProximitySensorViewController *)self upImage];
LABEL_7:
      unsigned int v8 = (void *)v6;
      goto LABEL_15;
    }
  }
  unsigned int v9 = +[UIScreen mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  v14 = +[UIScreen mainScreen];
  [v14 scale];
  double v16 = v15;

  intptr_t v17 = +[NSMutableString string];
  v18 = v17;
  if (a3 == 2)
  {
    CFStringRef v19 = @"up-";
  }
  else
  {
    if (a3 != 1)
    {
      unsigned int v8 = 0;
      goto LABEL_14;
    }
    CFStringRef v19 = @"down-";
  }
  [v17 appendString:v19];
  id v20 = +[NSNumber numberWithDouble:v11 * v16];
  id v21 = +[NSNumber numberWithDouble:v13 * v16];
  [v18 appendFormat:@"%@-%@.png", v20, v21];

  unsigned int v8 = +[UIImage imageNamed:v18];
LABEL_14:

LABEL_15:

  return v8;
}

- (void)showInstructionImageForPhase:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ProximitySensorViewController *)self instructionImageView];

  if (v7)
  {
    unsigned int v8 = [(ProximitySensorViewController *)self instructionImageView];
    [v8 removeFromSuperview];

    [(ProximitySensorViewController *)self setInstructionImageView:0];
  }
  id v9 = objc_alloc((Class)UIImageView);
  double v10 = [(ProximitySensorViewController *)self view];
  [v10 bounds];
  id v11 = [v9 initWithFrame:];
  [(ProximitySensorViewController *)self setInstructionImageView:v11];

  double v12 = [(ProximitySensorViewController *)self instructionImageForPhase:a3];
  double v13 = [(ProximitySensorViewController *)self instructionImageView];
  [v13 setImage:v12];

  if (v4)
  {
    v14 = [(ProximitySensorViewController *)self instructionImageView];
    [v14 setAlpha:0.0];

    double v15 = [(ProximitySensorViewController *)self view];
    double v16 = [(ProximitySensorViewController *)self instructionImageView];
    [v15 addSubview:v16];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100005134;
    v19[3] = &unk_10000C480;
    v19[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v19 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    id v18 = [(ProximitySensorViewController *)self view];
    intptr_t v17 = [(ProximitySensorViewController *)self instructionImageView];
    [v18 addSubview:v17];
  }
}

- (void)hideInstructionImageAnimated:(BOOL)a3
{
  if (a3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000523C;
    v4[3] = &unk_10000C480;
    v4[4] = self;
    +[UIView animateWithDuration:0x20000 delay:v4 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    id v3 = [(ProximitySensorViewController *)self instructionImageView];
    [v3 setAlpha:0.0];
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

- (UIImageView)instructionImageView
{
  return self->_instructionImageView;
}

- (void)setInstructionImageView:(id)a3
{
}

- (UIImage)upImage
{
  return self->_upImage;
}

- (void)setUpImage:(id)a3
{
}

- (UIImage)downImage
{
  return self->_downImage;
}

- (void)setDownImage:(id)a3
{
}

- (unint64_t)proximityState
{
  return self->_proximityState;
}

- (unint64_t)testPhase
{
  return self->_testPhase;
}

- (NSTimer)holdTimer
{
  return self->_holdTimer;
}

- (void)setHoldTimer:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (unint64_t)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(unint64_t)a3
{
  self->_sensorType = a3;
}

- (int64_t)actualCloseStateThreshold
{
  return self->_actualCloseStateThreshold;
}

- (void)setActualCloseStateThreshold:(int64_t)a3
{
  self->_actualCloseStateThreshold = a3;
}

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (DAProximityManagerProtocol)proximityManager
{
  return self->_proximityManager;
}

- (void)setProximityManager:(id)a3
{
}

- (ProximitySensorInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_proximityManager, 0);
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_holdTimer, 0);
  objc_storeStrong((id *)&self->_downImage, 0);
  objc_storeStrong((id *)&self->_upImage, 0);

  objc_storeStrong((id *)&self->_instructionImageView, 0);
}

@end