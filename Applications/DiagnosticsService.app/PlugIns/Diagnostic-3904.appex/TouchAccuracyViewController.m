@interface TouchAccuracyViewController
- (BOOL)prefersStatusBarHidden;
- (CGPoint)touchLocation;
- (MultiTouchHelper)multiTouchHelper;
- (NSMutableArray)allResults;
- (NSTimer)timeoutTimer;
- (TouchAccuracyInputs)inputs;
- (UIDevice)device;
- (UIView)targetView;
- (int)badTaps;
- (int)goodTaps;
- (int)totalTaps;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)touchStatus;
- (void)batteryStateChanged;
- (void)checkForNextTarget;
- (void)cleanUp;
- (void)endTestWithStatusCode:(id)a3;
- (void)handleTouch:(id)a3;
- (void)handleTouchBegan:(id)a3;
- (void)handleTouchEnded:(id)a3;
- (void)noInputTimedOut;
- (void)placeNextTarget:(id)a3;
- (void)setAllResults:(id)a3;
- (void)setBadTaps:(int)a3;
- (void)setDevice:(id)a3;
- (void)setGoodTaps:(int)a3;
- (void)setInputs:(id)a3;
- (void)setMultiTouchHelper:(id)a3;
- (void)setTargetView:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTouchLocation:(CGPoint)a3;
- (void)setTouchStatus:(unint64_t)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)shufflePositions;
- (void)start;
- (void)timedOut;
@end

@implementation TouchAccuracyViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[TouchAccuracyViewController setInputs:](self, "setInputs:", a3, a4);
  [(TouchAccuracyViewController *)self setGoodTaps:0];
  [(TouchAccuracyViewController *)self setBadTaps:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(TouchAccuracyViewController *)self setAllResults:v5];

  v6 = objc_alloc_init(MultiTouchHelper);
  [(TouchAccuracyViewController *)self setMultiTouchHelper:v6];

  [(TouchAccuracyViewController *)self setTouchStatus:0];
  [(TouchAccuracyViewController *)self shufflePositions];
  v7 = [(TouchAccuracyViewController *)self inputs];
  unsigned int v8 = [v7 connectedToPowerRequired];

  if (v8)
  {
    v9 = +[UIDevice currentDevice];
    [(TouchAccuracyViewController *)self setDevice:v9];

    v10 = [(TouchAccuracyViewController *)self device];
    [v10 setBatteryMonitoringEnabled:1];
  }
  v11 = +[DSTestAutomation sharedInstance];
  unsigned int v12 = [v11 testAutomationEnabled];

  if (v12)
  {
    v26[0] = @"blockWidth";
    v25 = [(TouchAccuracyViewController *)self inputs];
    [v25 blockWidth];
    v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v27[0] = v24;
    v26[1] = @"blockHeight";
    v23 = [(TouchAccuracyViewController *)self inputs];
    [v23 blockHeight];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v27[1] = v13;
    v26[2] = @"positions";
    v14 = [(TouchAccuracyViewController *)self inputs];
    v15 = [v14 positions];
    v27[2] = v15;
    v26[3] = @"noInputTimeout";
    v16 = [(TouchAccuracyViewController *)self inputs];
    [v16 noInputTimeout];
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v27[3] = v17;
    v26[4] = @"partialInputTimeout";
    v18 = [(TouchAccuracyViewController *)self inputs];
    [v18 partialInputTimeout];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v27[4] = v19;
    v26[5] = @"connectedToPowerRequired";
    v20 = [(TouchAccuracyViewController *)self inputs];
    v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 connectedToPowerRequired]);
    v27[5] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];
    +[DSTestAutomation postConfiguration:v22];
  }
}

- (void)noInputTimedOut
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"NO_INPUT_DETECTED" value:&stru_100008588 table:0];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"RETRY" value:&stru_100008588 table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003CC4;
  v13[3] = &unk_1000082A0;
  v13[4] = self;
  unsigned int v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v13];
  [v5 addAction:v8];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_100008588 table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003D50;
  v12[3] = &unk_1000082A0;
  v12[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v12];
  [v5 addAction:v11];

  [(TouchAccuracyViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)timedOut
{
  LODWORD(v3) = [(TouchAccuracyViewController *)self totalTaps];
  v4 = [(TouchAccuracyViewController *)self inputs];
  int v5 = [v4 numberOfBlocks];

  if ((int)v3 < v5)
  {
    uint64_t v3 = (int)v3;
    do
    {
      v6 = [(TouchAccuracyViewController *)self inputs];
      v7 = [v6 positions];
      unsigned int v8 = [v7 objectAtIndexedSubscript:v3];

      v9 = [(TouchAccuracyViewController *)self allResults];
      v16[0] = @"tapX";
      v10 = +[NSNull null];
      v17[0] = v10;
      v16[1] = @"tapY";
      v11 = +[NSNull null];
      v17[1] = v11;
      v16[2] = @"targetX";
      unsigned int v12 = [v8 objectForKeyedSubscript:@"xPos"];
      v17[2] = v12;
      v16[3] = @"targetY";
      v13 = [v8 objectForKeyedSubscript:@"yPos"];
      v16[4] = @"hit";
      v17[3] = v13;
      v17[4] = &__kCFBooleanFalse;
      v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
      [v9 addObject:v14];

      ++v3;
      v15 = [(TouchAccuracyViewController *)self inputs];
      LODWORD(v8) = [v15 numberOfBlocks];
    }
    while (v3 < (int)v8);
  }
  [(TouchAccuracyViewController *)self endTestWithStatusCode:&off_100008808];
}

- (void)start
{
  [(TouchAccuracyViewController *)self setupView];
  id v10 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleTouch:"];
  [v10 setMinimumPressDuration:0.0];
  uint64_t v3 = [(TouchAccuracyViewController *)self view];
  [v3 addGestureRecognizer:v10];

  v4 = [(TouchAccuracyViewController *)self inputs];
  [v4 noInputTimeout];
  int v5 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
  [(TouchAccuracyViewController *)self setTimeoutTimer:v5];

  v6 = [(TouchAccuracyViewController *)self inputs];
  LODWORD(v4) = [v6 connectedToPowerRequired];

  if (v4)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"batteryStateChanged" name:UIDeviceBatteryStateDidChangeNotification object:0];

    unsigned int v8 = [(TouchAccuracyViewController *)self multiTouchHelper];
    unsigned __int8 v9 = [v8 isPowerConnected];

    if ((v9 & 1) == 0) {
      [(TouchAccuracyViewController *)self endTestWithStatusCode:&off_100008820];
    }
  }
}

- (void)shufflePositions
{
  uint64_t v3 = [(TouchAccuracyViewController *)self inputs];
  v4 = [v3 positions];
  int v5 = (char *)[v4 count];

  v6 = [(TouchAccuracyViewController *)self inputs];
  v7 = [v6 positions];
  id v11 = [v7 mutableCopy];

  if (v5)
  {
    uint64_t v8 = 0;
    do
    {
      [v11 exchangeObjectAtIndex:v8 withObjectAtIndex:v8 + arc4random_uniform((uint32_t)v5)];
      ++v8;
      --v5;
    }
    while (v5);
  }
  id v9 = [v11 copy];
  id v10 = [(TouchAccuracyViewController *)self inputs];
  [v10 setPositions:v9];
}

- (void)setupView
{
  uint64_t v3 = +[UIColor whiteColor];
  v4 = [(TouchAccuracyViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)UIView);
  v6 = [(TouchAccuracyViewController *)self inputs];
  [v6 blockWidth];
  double v8 = v7;
  id v9 = [(TouchAccuracyViewController *)self inputs];
  [v9 blockHeight];
  id v11 = [v5 initWithFrame:0.0, 0.0, v8, v10];
  [(TouchAccuracyViewController *)self setTargetView:v11];

  id v12 = +[UIColor colorWithHexValue:@"007AFF" error:0];
  id v13 = [v12 CGColor];
  v14 = [(TouchAccuracyViewController *)self targetView];
  v15 = [v14 layer];
  [v15 setBorderColor:v13];

  v16 = [(TouchAccuracyViewController *)self targetView];
  v17 = +[UIColor clearColor];
  [v16 setBackgroundColor:v17];

  v18 = [(TouchAccuracyViewController *)self targetView];
  v19 = [v18 layer];
  [v19 setBorderWidth:1.5];

  v20 = [(TouchAccuracyViewController *)self view];
  v21 = [(TouchAccuracyViewController *)self targetView];
  [v20 addSubview:v21];

  id v22 = [(TouchAccuracyViewController *)self targetView];
  [(TouchAccuracyViewController *)self placeNextTarget:v22];
}

- (void)placeNextTarget:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TouchAccuracyViewController *)self totalTaps];
  v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Index of the next target: %lu", buf, 0xCu);
  }

  double v7 = [(TouchAccuracyViewController *)self inputs];
  double v8 = [v7 positions];
  id v9 = [v8 count];

  if ((unint64_t)v9 > v5)
  {
    double v10 = [(TouchAccuracyViewController *)self inputs];
    id v11 = [v10 positions];
    id v12 = [v11 objectAtIndexedSubscript:v5];

    id v13 = [v12 objectForKeyedSubscript:@"xPos"];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v12 objectForKeyedSubscript:@"yPos"];
    [v16 doubleValue];
    [v4 setCenter:v15, v17];

    v18 = +[DSTestAutomation sharedInstance];
    LODWORD(v16) = [v18 testAutomationEnabled];

    if (v16)
    {
      v31[0] = @"width";
      v30 = [(TouchAccuracyViewController *)self targetView];
      [v30 frame];
      v20 = +[NSNumber numberWithDouble:v19];
      v32[0] = v20;
      v31[1] = @"height";
      v21 = [(TouchAccuracyViewController *)self targetView];
      [v21 frame];
      v23 = +[NSNumber numberWithDouble:v22];
      v32[1] = v23;
      v31[2] = @"x";
      v24 = [(TouchAccuracyViewController *)self targetView];
      [v24 center];
      v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v32[2] = v25;
      v31[3] = @"y";
      v26 = [(TouchAccuracyViewController *)self targetView];
      [v26 center];
      v28 = +[NSNumber numberWithDouble:v27];
      v32[3] = v28;
      v29 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
      +[DSTestAutomation postInteractiveTestEvent:@"TapTargetAppeared" info:v29];
    }
  }
}

- (int)totalTaps
{
  unsigned int v3 = [(TouchAccuracyViewController *)self goodTaps];
  return [(TouchAccuracyViewController *)self badTaps] + v3;
}

- (void)handleTouch:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)1)
  {
    [(TouchAccuracyViewController *)self handleTouchBegan:v4];
  }
  else if ([v4 state] == (id)3 || objc_msgSend(v4, "state") == (id)4)
  {
    [(TouchAccuracyViewController *)self handleTouchEnded:v4];
  }
}

- (void)handleTouchBegan:(id)a3
{
  id v4 = a3;
  if (![(TouchAccuracyViewController *)self touchStatus])
  {
    unint64_t v5 = [(TouchAccuracyViewController *)self view];
    [v4 locationInView:v5];
    -[TouchAccuracyViewController setTouchLocation:](self, "setTouchLocation:");

    v6 = [(TouchAccuracyViewController *)self view];
    [(TouchAccuracyViewController *)self touchLocation];
    double v7 = [v6 hitTest:0];
    double v8 = [(TouchAccuracyViewController *)self targetView];

    id v9 = DiagnosticLogHandleForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7 == v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v13 = [(TouchAccuracyViewController *)self totalTaps];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#%d Hit!", buf, 8u);
      }

      [(TouchAccuracyViewController *)self setTouchStatus:2];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000049D0;
      v11[3] = &unk_1000082C8;
      v11[4] = self;
      +[UIView animateWithDuration:v11 animations:0.25];
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v13 = [(TouchAccuracyViewController *)self totalTaps];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#%d Missed!", buf, 8u);
      }

      [(TouchAccuracyViewController *)self setTouchStatus:1];
    }
  }
}

- (void)handleTouchEnded:(id)a3
{
  if ([(TouchAccuracyViewController *)self touchStatus])
  {
    unint64_t v4 = [(TouchAccuracyViewController *)self touchStatus];
    if (v4 == 2) {
      [(TouchAccuracyViewController *)self setGoodTaps:[(TouchAccuracyViewController *)self goodTaps] + 1];
    }
    else {
      [(TouchAccuracyViewController *)self setBadTaps:[(TouchAccuracyViewController *)self badTaps] + 1];
    }
    BOOL v5 = v4 == 2;
    v6 = [(TouchAccuracyViewController *)self allResults];
    v17[0] = @"tapX";
    [(TouchAccuracyViewController *)self touchLocation];
    double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[0] = v7;
    v17[1] = @"tapY";
    [(TouchAccuracyViewController *)self touchLocation];
    id v9 = +[NSNumber numberWithDouble:v8];
    v18[1] = v9;
    v17[2] = @"targetX";
    BOOL v10 = [(TouchAccuracyViewController *)self targetView];
    [v10 center];
    id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18[2] = v11;
    v17[3] = @"targetY";
    id v12 = [(TouchAccuracyViewController *)self targetView];
    [v12 center];
    double v14 = +[NSNumber numberWithDouble:v13];
    v18[3] = v14;
    v17[4] = @"hit";
    double v15 = +[NSNumber numberWithBool:v5];
    v18[4] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
    [v6 addObject:v16];

    [(TouchAccuracyViewController *)self checkForNextTarget];
  }
}

- (void)checkForNextTarget
{
  unsigned int v3 = [(TouchAccuracyViewController *)self timeoutTimer];

  if (v3)
  {
    unint64_t v4 = [(TouchAccuracyViewController *)self timeoutTimer];
    [v4 invalidate];

    [(TouchAccuracyViewController *)self setTimeoutTimer:0];
  }
  BOOL v5 = [(TouchAccuracyViewController *)self inputs];
  [v5 partialInputTimeout];
  v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timedOut", 0, 0);
  [(TouchAccuracyViewController *)self setTimeoutTimer:v6];

  LODWORD(v6) = [(TouchAccuracyViewController *)self totalTaps];
  double v7 = [(TouchAccuracyViewController *)self inputs];
  int v8 = [v7 numberOfBlocks];

  if ((int)v6 >= v8)
  {
    if ([(TouchAccuracyViewController *)self badTaps] < 1) {
      id v11 = &off_100008838;
    }
    else {
      id v11 = &off_100008808;
    }
    [(TouchAccuracyViewController *)self endTestWithStatusCode:v11];
  }
  else
  {
    -[TouchAccuracyViewController setTouchLocation:](self, "setTouchLocation:", CGPointZero.x, CGPointZero.y);
    [(TouchAccuracyViewController *)self setTouchStatus:0];
    id v9 = +[UIColor clearColor];
    BOOL v10 = [(TouchAccuracyViewController *)self targetView];
    [v10 setBackgroundColor:v9];

    id v12 = [(TouchAccuracyViewController *)self targetView];
    [(TouchAccuracyViewController *)self placeNextTarget:v12];
  }
}

- (void)cleanUp
{
  unsigned int v3 = [(TouchAccuracyViewController *)self timeoutTimer];

  if (v3)
  {
    unint64_t v4 = [(TouchAccuracyViewController *)self timeoutTimer];
    [v4 invalidate];

    [(TouchAccuracyViewController *)self setTimeoutTimer:0];
  }
  BOOL v5 = [(TouchAccuracyViewController *)self inputs];
  unsigned int v6 = [v5 connectedToPowerRequired];

  if (v6)
  {
    double v7 = [(TouchAccuracyViewController *)self device];
    [v7 setBatteryMonitoringEnabled:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self];
  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  [(TouchAccuracyViewController *)self cleanUp];
  BOOL v5 = [(TouchAccuracyViewController *)self result];
  [v5 setStatusCode:v4];

  unsigned int v6 = [(TouchAccuracyViewController *)self result];
  double v7 = [v6 statusCode];
  unsigned int v8 = [v7 isEqualToNumber:&off_100008850];

  if (v8)
  {
    id v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100005838(v9);
    }
  }
  else
  {
    BOOL v10 = [(TouchAccuracyViewController *)self result];
    id v11 = [v10 statusCode];
    unsigned int v12 = [v11 isEqualToNumber:&off_100008820];

    if (!v12)
    {
      v30[0] = @"displayResX";
      double v13 = +[UIScreen mainScreen];
      [v13 bounds];
      v29 = +[NSNumber numberWithDouble:v14];
      v31[0] = v29;
      v30[1] = @"displayResY";
      v28 = +[UIScreen mainScreen];
      [v28 bounds];
      double v27 = +[NSNumber numberWithDouble:v15];
      v31[1] = v27;
      v30[2] = @"allTaps";
      v26 = [(TouchAccuracyViewController *)self allResults];
      v31[2] = v26;
      v30[3] = @"isCharging";
      id v16 = objc_alloc((Class)NSNumber);
      double v17 = [(TouchAccuracyViewController *)self multiTouchHelper];
      id v18 = [v16 initWithBool:[v17 isBatteryCharging]];
      v31[3] = v18;
      v30[4] = @"isPluggedIntoPower";
      id v19 = objc_alloc((Class)NSNumber);
      v20 = [(TouchAccuracyViewController *)self multiTouchHelper];
      id v21 = [v19 initWithBool:[v20 isPowerConnected]];
      void v31[4] = v21;
      v30[5] = @"temperatureData";
      double v22 = [(TouchAccuracyViewController *)self multiTouchHelper];
      v23 = [v22 temperatureData];
      v31[5] = v23;
      v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
      v25 = [(TouchAccuracyViewController *)self result];
      [v25 setData:v24];

      goto LABEL_9;
    }
    id v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000587C(v9);
    }
  }

  double v13 = [(TouchAccuracyViewController *)self result];
  [v13 setData:&__NSDictionary0__struct];
LABEL_9:

  [(TouchAccuracyViewController *)self setFinished:1];
}

- (void)batteryStateChanged
{
  unsigned int v3 = [(TouchAccuracyViewController *)self device];
  if ([v3 batteryState] == (id)1)
  {
  }
  else
  {
    id v4 = [(TouchAccuracyViewController *)self device];
    id v5 = [v4 batteryState];

    if (v5) {
      return;
    }
  }

  [(TouchAccuracyViewController *)self endTestWithStatusCode:&off_100008820];
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

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (unint64_t)touchStatus
{
  return self->_touchStatus;
}

- (void)setTouchStatus:(unint64_t)a3
{
  self->_touchStatus = a3;
}

- (int)goodTaps
{
  return self->_goodTaps;
}

- (void)setGoodTaps:(int)a3
{
  self->_goodTaps = a3;
}

- (int)badTaps
{
  return self->_badTaps;
}

- (void)setBadTaps:(int)a3
{
  self->_badTaps = a3;
}

- (CGPoint)touchLocation
{
  double x = self->_touchLocation.x;
  double y = self->_touchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchLocation:(CGPoint)a3
{
  self->_touchLocation = a3;
}

- (NSMutableArray)allResults
{
  return self->_allResults;
}

- (void)setAllResults:(id)a3
{
}

- (UIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MultiTouchHelper)multiTouchHelper
{
  return self->_multiTouchHelper;
}

- (void)setMultiTouchHelper:(id)a3
{
}

- (TouchAccuracyInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_multiTouchHelper, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_allResults, 0);
  objc_storeStrong((id *)&self->_targetView, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end