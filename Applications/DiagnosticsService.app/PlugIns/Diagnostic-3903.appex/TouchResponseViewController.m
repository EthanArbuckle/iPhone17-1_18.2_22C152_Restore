@interface TouchResponseViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)testFinished;
- (MultiTouchHelper)multiTouchHelper;
- (NSDate)startDate;
- (NSMutableArray)touchRegions;
- (NSTimer)timeoutTimer;
- (TouchResponseInputs)inputs;
- (UIDevice)device;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)batteryStateChanged;
- (void)checkIfAllViewsHaveBeenTouched;
- (void)cleanUp;
- (void)endTestWithStatusCode:(id)a3;
- (void)finish;
- (void)highlightView:(id)a3;
- (void)noInputTimedOut;
- (void)setDevice:(id)a3;
- (void)setInputs:(id)a3;
- (void)setMultiTouchHelper:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTestFinished:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTouchRegions:(id)a3;
- (void)setupView;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)timedOut;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TouchResponseViewController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[TouchResponseViewController setInputs:](self, "setInputs:", a3, a4);
  [(TouchResponseViewController *)self setTestFinished:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  [(TouchResponseViewController *)self setTouchRegions:v5];

  v6 = objc_alloc_init(MultiTouchHelper);
  [(TouchResponseViewController *)self setMultiTouchHelper:v6];

  v7 = [(TouchResponseViewController *)self inputs];
  unsigned int v8 = [v7 connectedToPowerRequired];

  if (v8)
  {
    v9 = +[UIDevice currentDevice];
    [(TouchResponseViewController *)self setDevice:v9];

    v10 = [(TouchResponseViewController *)self device];
    [v10 setBatteryMonitoringEnabled:1];
  }
  v11 = +[DSTestAutomation sharedInstance];
  unsigned int v12 = [v11 testAutomationEnabled];

  if (v12)
  {
    v24[0] = @"touchMap";
    v23 = [(TouchResponseViewController *)self inputs];
    v13 = [v23 touchMapDictionary];
    v25[0] = v13;
    v24[1] = @"blockColor";
    v14 = [(TouchResponseViewController *)self inputs];
    v15 = [v14 blockColor];
    v25[1] = v15;
    v24[2] = @"noInputTimeout";
    v16 = [(TouchResponseViewController *)self inputs];
    [v16 noInputTimeout];
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v25[2] = v17;
    v24[3] = @"timeoutSeconds";
    v18 = [(TouchResponseViewController *)self inputs];
    [v18 timeoutSeconds];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v25[3] = v19;
    v24[4] = @"connectedToPowerRequired";
    v20 = [(TouchResponseViewController *)self inputs];
    v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 connectedToPowerRequired]);
    v25[4] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
    +[DSTestAutomation postConfiguration:v22];
  }
}

- (void)noInputTimedOut
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"NO_INPUT_DETECTED" value:&stru_1000084B0 table:0];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"RETRY" value:&stru_1000084B0 table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000041BC;
  v13[3] = &unk_100008238;
  v13[4] = self;
  unsigned int v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v13];
  [v5 addAction:v8];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_1000084B0 table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004248;
  v12[3] = &unk_100008238;
  v12[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v12];
  [v5 addAction:v11];

  [(TouchResponseViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)timedOut
{
}

- (void)start
{
  [(TouchResponseViewController *)self setupView];
  v3 = [(TouchResponseViewController *)self inputs];
  [v3 noInputTimeout];
  v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "noInputTimedOut", 0, 0);
  [(TouchResponseViewController *)self setTimeoutTimer:v4];

  id v5 = [(TouchResponseViewController *)self inputs];
  LODWORD(v3) = [v5 connectedToPowerRequired];

  if (v3)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"batteryStateChanged" name:UIDeviceBatteryStateDidChangeNotification object:0];

    v7 = [(TouchResponseViewController *)self multiTouchHelper];
    unsigned __int8 v8 = [v7 isPowerConnected];

    if ((v8 & 1) == 0)
    {
      [(TouchResponseViewController *)self endTestWithStatusCode:&off_1000086B0];
    }
  }
}

- (void)setupView
{
  v3 = +[UIColor whiteColor];
  v4 = [(TouchResponseViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = +[UIScreen mainScreen];
  [v5 nativeScale];
  double v7 = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned __int8 v8 = [(TouchResponseViewController *)self inputs];
  v9 = [v8 touchMap];

  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
        id v15 = objc_alloc((Class)UIView);
        [v14 x];
        double v17 = v16 / v7;
        [v14 y];
        double v19 = v18 / v7;
        [v14 width];
        double v21 = v20 / v7;
        [v14 height];
        id v23 = [v15 initWithFrame:v17, v19, v21, v22 / v7];
        [v23 setTag:1];
        v24 = +[UIColor whiteColor];
        [v23 setBackgroundColor:v24];

        v25 = [(TouchResponseViewController *)self touchRegions];
        [v25 addObject:v23];

        v26 = [(TouchResponseViewController *)self view];
        [v26 addSubview:v23];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = [(TouchResponseViewController *)self view];
  double v7 = [v5 anyObject];

  unsigned __int8 v8 = [(TouchResponseViewController *)self view];
  [v7 locationInView:v8];
  v9 = [v6 hitTest:0];

  if (v9 && [v9 tag] == (id)1) {
    [(TouchResponseViewController *)self highlightView:v9];
  }

  _objc_release_x1();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = [(TouchResponseViewController *)self view];
        uint64_t v12 = [(TouchResponseViewController *)self view];
        [v10 locationInView:v12];
        v13 = [v11 hitTest:0];

        if (v13 && [v13 tag] == (id)1) {
          [(TouchResponseViewController *)self highlightView:v13];
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = [(TouchResponseViewController *)self view];
        uint64_t v12 = [(TouchResponseViewController *)self view];
        [v10 locationInView:v12];
        v13 = [v11 hitTest:0];

        if (v13 && [v13 tag] == (id)1) {
          [(TouchResponseViewController *)self highlightView:v13];
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)highlightView:(id)a3
{
  id v4 = a3;
  id v5 = [(TouchResponseViewController *)self timeoutTimer];

  if (v5)
  {
    id v6 = [(TouchResponseViewController *)self timeoutTimer];
    [v6 invalidate];

    [(TouchResponseViewController *)self setTimeoutTimer:0];
  }
  id v7 = [(TouchResponseViewController *)self inputs];
  [v7 timeoutSeconds];
  uint64_t v8 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "timedOut", 0, 0);
  [(TouchResponseViewController *)self setTimeoutTimer:v8];

  v9 = +[NSDate date];
  [(TouchResponseViewController *)self setStartDate:v9];

  id v10 = [(TouchResponseViewController *)self inputs];
  id v11 = [v10 blockColor];
  [v4 setBackgroundColor:v11];

  [v4 setTag:0];

  [(TouchResponseViewController *)self checkIfAllViewsHaveBeenTouched];
}

- (void)checkIfAllViewsHaveBeenTouched
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B0C;
  block[3] = &unk_100008260;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cleanUp
{
  v3 = [(TouchResponseViewController *)self timeoutTimer];

  if (v3)
  {
    id v4 = [(TouchResponseViewController *)self timeoutTimer];
    [v4 invalidate];

    [(TouchResponseViewController *)self setTimeoutTimer:0];
  }
  id v5 = [(TouchResponseViewController *)self inputs];
  unsigned int v6 = [v5 connectedToPowerRequired];

  if (v6)
  {
    id v7 = [(TouchResponseViewController *)self device];
    [v7 setBatteryMonitoringEnabled:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self];
  }
}

- (void)endTestWithStatusCode:(id)a3
{
  id v4 = a3;
  if (![(TouchResponseViewController *)self testFinished])
  {
    [(TouchResponseViewController *)self setTestFinished:1];
    [(TouchResponseViewController *)self cleanUp];
    id v5 = [(TouchResponseViewController *)self result];
    [v5 setStatusCode:v4];

    unsigned int v6 = [(TouchResponseViewController *)self result];
    id v7 = [v6 statusCode];
    unsigned int v8 = [v7 isEqualToNumber:&off_1000086E0];

    if (v8)
    {
      v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100005A58(v9);
      }
LABEL_8:

      v13 = [(TouchResponseViewController *)self result];
      [v13 setData:&__NSDictionary0__struct];

      [(TouchResponseViewController *)self setFinished:1];
      goto LABEL_19;
    }
    id v10 = [(TouchResponseViewController *)self result];
    id v11 = [v10 statusCode];
    unsigned int v12 = [v11 isEqualToNumber:&off_1000086B0];

    if (v12)
    {
      v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100005A9C(v9);
      }
      goto LABEL_8;
    }
    id v39 = v4;
    id v43 = objc_alloc_init((Class)NSMutableArray);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [(TouchResponseViewController *)self touchRegions];
    id v14 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v47;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v18 tag] == (id)1)
          {
            v52[0] = @"xPos";
            [v18 frame];
            double v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            v53[0] = v19;
            v52[1] = @"yPos";
            [v18 frame];
            double v21 = +[NSNumber numberWithDouble:v20];
            v53[1] = v21;
            v52[2] = @"width";
            [v18 frame];
            id v23 = +[NSNumber numberWithDouble:v22];
            v53[2] = v23;
            v52[3] = @"height";
            [v18 frame];
            v25 = +[NSNumber numberWithDouble:v24];
            v53[3] = v25;
            v26 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
            [v43 addObject:v26];
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v15);
    }

    v50[0] = @"displayResX";
    id obja = +[UIScreen mainScreen];
    [obja bounds];
    v42 = +[NSNumber numberWithDouble:v27];
    v51[0] = v42;
    v50[1] = @"displayResY";
    v41 = +[UIScreen mainScreen];
    [v41 bounds];
    v40 = +[NSNumber numberWithDouble:v28];
    v51[1] = v40;
    v51[2] = v43;
    v50[2] = @"missedRegions";
    v50[3] = @"isCharging";
    id v29 = objc_alloc((Class)NSNumber);
    v38 = [(TouchResponseViewController *)self multiTouchHelper];
    id v30 = [v29 initWithBool:[v38 isBatteryCharging]];
    v51[3] = v30;
    v50[4] = @"isPluggedIntoPower";
    id v31 = objc_alloc((Class)NSNumber);
    v32 = [(TouchResponseViewController *)self multiTouchHelper];
    id v33 = [v31 initWithBool:[v32 isPowerConnected]];
    v51[4] = v33;
    v50[5] = @"temperatureData";
    v34 = [(TouchResponseViewController *)self multiTouchHelper];
    v35 = [v34 temperatureData];
    v51[5] = v35;
    v36 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:6];
    v37 = [(TouchResponseViewController *)self result];
    [v37 setData:v36];

    [(TouchResponseViewController *)self performSelector:"finish" withObject:0 afterDelay:0.5];
    id v4 = v39;
  }
LABEL_19:
}

- (void)finish
{
}

- (void)batteryStateChanged
{
  v3 = [(TouchResponseViewController *)self device];
  if ([v3 batteryState] == (id)1)
  {
  }
  else
  {
    id v4 = [(TouchResponseViewController *)self device];
    id v5 = [v4 batteryState];

    if (v5) {
      return;
    }
  }

  [(TouchResponseViewController *)self endTestWithStatusCode:&off_1000086B0];
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)testFinished
{
  return self->_testFinished;
}

- (void)setTestFinished:(BOOL)a3
{
  self->_testFinished = a3;
}

- (NSMutableArray)touchRegions
{
  return self->_touchRegions;
}

- (void)setTouchRegions:(id)a3
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

- (TouchResponseInputs)inputs
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
  objc_storeStrong((id *)&self->_touchRegions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end