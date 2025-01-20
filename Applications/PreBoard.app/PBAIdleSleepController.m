@interface PBAIdleSleepController
+ (id)sharedController;
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BLSHService)backlightService;
- (BOOL)isDisplayDim;
- (PBAIdleSleepController)init;
- (void)_allowIdleSleep;
- (void)_preventIdleSleep;
- (void)_preventIdleSleepForNumberOfSeconds:(float)a3;
- (void)_setHIDUILockedState:(BOOL)a3;
- (void)_undimDisplayForce;
- (void)dimDisplay;
- (void)resetIdleTimerAndUndim:(BOOL)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setBacklightService:(id)a3;
- (void)setDisplayDim:(BOOL)a3;
- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
- (void)undimDisplay;
@end

@implementation PBAIdleSleepController

+ (id)sharedController
{
  if (qword_100026168 != -1) {
    dispatch_once(&qword_100026168, &stru_10001CCB0);
  }
  v2 = (void *)qword_100026160;

  return v2;
}

- (PBAIdleSleepController)init
{
  v19.receiver = self;
  v19.super_class = (Class)PBAIdleSleepController;
  v2 = [(PBAIdleSleepController *)&v19 init];
  if (v2)
  {
    v3 = +[BLSHLocalOnlyServiceConfiguration configurationWithFadeInDuration:0.0 fadeOutDuration:0.1];
    uint64_t v4 = +[BLSHService startLocalOnlyServiceWithConfiguration:v3];
    backlightService = v2->_backlightService;
    v2->_backlightService = (BLSHService *)v4;

    id v6 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
    [v6 setIdentifier:@"PBAIdleTimer"];
    [v6 setEventMask:3967];
    [v6 setAttentionLostTimeout:30.0];
    v7 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v7;

    [(AWAttentionAwarenessClient *)v2->_attentionAwarenessClient setConfiguration:v6 shouldReset:1];
    objc_initWeak(&location, v2);
    v9 = v2->_attentionAwarenessClient;
    id v10 = &_dispatch_main_q;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10000E7C4;
    v16 = &unk_10001CCD8;
    objc_copyWeak(&v17, &location);
    [(AWAttentionAwarenessClient *)v9 setEventHandlerWithQueue:&_dispatch_main_q block:&v13];

    v11 = +[SWSystemSleepMonitor monitorUsingMainQueue];
    [v11 addObserver:v2];

    [(PBAIdleSleepController *)v2 setDisplayDim:0];
    [(PBAIdleSleepController *)v2 _undimDisplayForce];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_setHIDUILockedState:(BOOL)a3
{
  if (byte_100026018 != a3)
  {
    BKSHIDServicesSetHIDUILockedStateWithSource();
    byte_100026018 = a3;
  }
}

- (void)_undimDisplayForce
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PBAScreenWillUnblankNotification" object:0];

  uint64_t v4 = sub_1000085D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Undimming display", buf, 2u);
  }

  id v5 = [objc_alloc((Class)BLSBacklightChangeRequest) initWithRequestedActivityState:1 explanation:@"PreBoard Force Undim" timestamp:mach_continuous_time() sourceEvent:0 sourceEventMetadata:0];
  id v6 = +[BLSBacklight sharedBacklight];
  id v7 = [v6 performChangeRequest:v5];

  BKSHIDServicesSetBacklightFactorWithFadeDuration();
  [(PBAIdleSleepController *)self setDisplayDim:0];
  attentionAwarenessClient = self->_attentionAwarenessClient;
  id v19 = 0;
  unsigned __int8 v9 = [(AWAttentionAwarenessClient *)attentionAwarenessClient resumeWithError:&v19];
  id v10 = v19;
  if ((v9 & 1) == 0)
  {
    v11 = sub_1000085D4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000FF4C((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  [(PBAIdleSleepController *)self _preventIdleSleep];
  [(PBAIdleSleepController *)self _setHIDUILockedState:0];
  v18 = +[NSNotificationCenter defaultCenter];
  [v18 postNotificationName:@"PBAScreenDidUnblankNotification" object:0];
}

- (void)undimDisplay
{
  if (self->_displayDim) {
    [(PBAIdleSleepController *)self _undimDisplayForce];
  }
}

- (void)dimDisplay
{
  if (!self->_displayDim)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"PBAScreenWillBlankNotification" object:0];

    uint64_t v4 = sub_1000085D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dimming display", buf, 2u);
    }

    id v5 = [objc_alloc((Class)BLSBacklightChangeRequest) initWithRequestedActivityState:0 explanation:@"PreBoard Dim Display" timestamp:mach_continuous_time() sourceEvent:0 sourceEventMetadata:0];
    id v6 = +[BLSBacklight sharedBacklight];
    id v7 = [v6 performChangeRequest:v5];

    [(PBAIdleSleepController *)self setDisplayDim:1];
    attentionAwarenessClient = self->_attentionAwarenessClient;
    id v20 = 0;
    unsigned __int8 v9 = [(AWAttentionAwarenessClient *)attentionAwarenessClient suspendWithError:&v20];
    id v10 = v20;
    if ((v9 & 1) == 0)
    {
      uint64_t v12 = sub_1000085D4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000FFB8((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    LODWORD(v11) = 1.0;
    [(PBAIdleSleepController *)self _preventIdleSleepForNumberOfSeconds:v11];
    [(PBAIdleSleepController *)self _setHIDUILockedState:1];
    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:@"PBAScreenDidBlankNotification" object:0];
  }
}

- (void)_allowIdleSleep
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];

  [(PBAIdleSleepController *)self setPreventIdleSleep:0 forReason:@"backlight"];
}

- (void)_preventIdleSleep
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];

  [(PBAIdleSleepController *)self setPreventIdleSleep:1 forReason:@"backlight"];
}

- (void)_preventIdleSleepForNumberOfSeconds:(float)a3
{
  if (self->_displayDim)
  {
    [(PBAIdleSleepController *)self _preventIdleSleep];
    NSRunLoopMode v6 = NSRunLoopCommonModes;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [(PBAIdleSleepController *)self performSelector:"_allowIdleSleep" withObject:0 afterDelay:v5 inModes:a3];
  }
}

- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[FBSystemService sharedInstance];
  [v6 setSystemIdleSleepDisabled:v4 forReason:v5];
}

- (void)resetIdleTimerAndUndim:(BOOL)a3
{
  if (a3) {
    [(PBAIdleSleepController *)self undimDisplay];
  }
  attentionAwarenessClient = self->_attentionAwarenessClient;
  id v14 = 0;
  unsigned __int8 v5 = [(AWAttentionAwarenessClient *)attentionAwarenessClient resetAttentionLostTimeoutWithError:&v14];
  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    id v7 = sub_1000085D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010024((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  BOOL v4 = (uint64_t (**)(id, uint64_t, void))a4;
  unsigned __int8 v5 = sub_1000085D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got kIOMessageCanSystemSleep", v7, 2u);
  }

  id v6 = (id)v4[2](v4, 1, 0);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  BOOL v4 = (void (**)(void))a4;
  unsigned __int8 v5 = sub_1000085D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillSleep", v6, 2u);
  }

  v4[2](v4);
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  v3 = sub_1000085D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillNotSleep", v4, 2u);
  }
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  v3 = sub_1000085D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillPowerOn", v4, 2u);
  }
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  v3 = sub_1000085D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Got kIOMessageSystemHasPoweredOn", v4, 2u);
  }
}

- (BOOL)isDisplayDim
{
  return self->_displayDim;
}

- (void)setDisplayDim:(BOOL)a3
{
  self->_displayDim = a3;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (BLSHService)backlightService
{
  return self->_backlightService;
}

- (void)setBacklightService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightService, 0);

  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
}

@end