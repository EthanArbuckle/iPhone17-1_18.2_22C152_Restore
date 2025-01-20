@interface CLBIdleSleepManager
+ (id)sharedInstance;
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BKSTouchStream)tapToWakeTouchStream;
- (BOOL)finishedBoot;
- (BOOL)isAutoLockDisabled;
- (BOOL)isDisplayDim;
- (BOOL)shouldSleepForLock;
- (CLBIdleSleepManager)init;
- (NSMutableSet)idleTimerDisabledReasons;
- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer;
- (UIWindow)tapToWakeWindow;
- (double)_nextLockTimeDuration;
- (double)autoLockTime;
- (id)_configurationWithAttentionLostTimeout:(double)a3;
- (id)_descriptionForTimeout:(double)a3;
- (unint64_t)tapToWakeSupported;
- (unsigned)rootDomainConnect;
- (void)_allowIdleSleep;
- (void)_disableTapToWake;
- (void)_enableTapToWake;
- (void)_initTapToWake;
- (void)_powerChangedOnService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_preventIdleSleep;
- (void)_preventIdleSleepForNumberOfSeconds:(float)a3;
- (void)_screenBlanked;
- (void)_setHIDUILockedState:(BOOL)a3;
- (void)_setUpAutoLockTime;
- (void)_tapToWake:(id)a3;
- (void)_undimDisplay;
- (void)dealloc;
- (void)dimDisplay;
- (void)enableIdleSleep;
- (void)resetIdleTimerAndUndim:(BOOL)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setAutoLockDisabled:(BOOL)a3;
- (void)setAutoLockTime:(double)a3;
- (void)setDisplayDim:(BOOL)a3;
- (void)setFinishedBoot:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setIdleTimerDisabledReasons:(id)a3;
- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setShouldSleepForLock:(BOOL)a3;
- (void)setTapToWakeGestureRecognizer:(id)a3;
- (void)setTapToWakeSupported:(unint64_t)a3;
- (void)setTapToWakeTouchStream:(id)a3;
- (void)setTapToWakeWindow:(id)a3;
- (void)undimDisplay;
@end

@implementation CLBIdleSleepManager

+ (id)sharedInstance
{
  if (qword_100181128 != -1) {
    dispatch_once(&qword_100181128, &stru_10015CC78);
  }
  v2 = (void *)qword_100181120;

  return v2;
}

- (CLBIdleSleepManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)CLBIdleSleepManager;
  v2 = [(CLBIdleSleepManager *)&v18 init];
  if (v2)
  {
    v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering idle timer notifications…", buf, 2u);
    }

    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    idleTimerDisabledReasons = v2->_idleTimerDisabledReasons;
    v2->_idleTimerDisabledReasons = v4;

    v2->_autoLockDisabled = 0;
    [(CLBIdleSleepManager *)v2 _setUpAutoLockTime];
    v6 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v6;

    [(CLBIdleSleepManager *)v2 _nextLockTimeDuration];
    double v9 = v8;
    v10 = [(CLBIdleSleepManager *)v2 _configurationWithAttentionLostTimeout:"_configurationWithAttentionLostTimeout:"];
    v11 = +[CLFLog commonLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(CLBIdleSleepManager *)v2 _descriptionForTimeout:v9];
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initializing with attention awareness configuration with timeout: %@", buf, 0xCu);
    }
    [(AWAttentionAwarenessClient *)v2->_attentionAwarenessClient setConfiguration:v10 shouldReset:1];
    [(CLBIdleSleepManager *)v2 _initTapToWake];
    objc_initWeak((id *)buf, v2);
    v13 = v2->_attentionAwarenessClient;
    id v14 = &_dispatch_main_q;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000205EC;
    v16[3] = &unk_10015CCA0;
    objc_copyWeak(&v17, (id *)buf);
    [(AWAttentionAwarenessClient *)v13 setEventHandlerWithQueue:&_dispatch_main_q block:v16];

    v2->_displayDim = 0;
    [(CLBIdleSleepManager *)v2 _undimDisplay];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  p_rootDomainConnect = &self->_rootDomainConnect;
  if (self->_rootDomainConnect)
  {
    v6 = +[CLFLog commonLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deregistering and closing connection", buf, 2u);
    }

    IODeregisterForSystemPower(&self->_rootDomainConnect);
    IOServiceClose(*p_rootDomainConnect);
    unsigned int *p_rootDomainConnect = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CLBIdleSleepManager;
  [(CLBIdleSleepManager *)&v7 dealloc];
}

- (void)setShouldSleepForLock:(BOOL)a3
{
  if (self->_shouldSleepForLock != a3)
  {
    BOOL v3 = a3;
    self->_shouldSleepForLock = a3;
    v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Should sleep for lock: %i", (uint8_t *)v6, 8u);
    }

    [(CLBIdleSleepManager *)self resetIdleTimerAndUndim:0];
  }
}

- (void)_setHIDUILockedState:(BOOL)a3
{
  if (byte_10017B500 != a3)
  {
    BOOL v3 = a3;
    v4 = +[CLFLog commonLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting UI locked state to %d", (uint8_t *)v5, 8u);
    }

    BKSHIDServicesSetHIDUILockedState();
    byte_10017B500 = v3;
  }
}

- (void)_undimDisplay
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CLBScreenWillUndimNotification" object:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_screenBlanked" object:0];
  [(CLBIdleSleepManager *)self _disableTapToWake];
  v4 = +[CLFLog commonLog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Undimming display…", buf, 2u);
  }

  BKSDisplayServicesSetScreenBlanked();
  BKSHIDServicesSetBacklightFactorWithFadeDuration();
  [(CLBIdleSleepManager *)self setDisplayDim:0];
  attentionAwarenessClient = self->_attentionAwarenessClient;
  id v16 = 0;
  unsigned __int8 v6 = [(AWAttentionAwarenessClient *)attentionAwarenessClient resumeWithError:&v16];
  id v7 = v16;
  if ((v6 & 1) == 0)
  {
    double v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001005CC((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  [(CLBIdleSleepManager *)self _preventIdleSleep];
  [(CLBIdleSleepManager *)self _setHIDUILockedState:0];
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"CLBScreenDidUndimNotification" object:0];
}

- (void)undimDisplay
{
  if ([(CLBIdleSleepManager *)self isDisplayDim])
  {
    BOOL v3 = +[CLFLog commonLog];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Display is off. Turning display on…", v4, 2u);
    }

    [(CLBIdleSleepManager *)self _undimDisplay];
  }
}

- (void)dimDisplay
{
  if (![(CLBIdleSleepManager *)self isDisplayDim])
  {
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"CLBScreenWillDimNotification" object:0];

    v4 = +[CLFLog commonLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dimming display…", buf, 2u);
    }

    BKSHIDServicesSetBacklightFactorWithFadeDuration();
    [(CLBIdleSleepManager *)self setDisplayDim:1];
    attentionAwarenessClient = self->_attentionAwarenessClient;
    id v17 = 0;
    unsigned __int8 v6 = [(AWAttentionAwarenessClient *)attentionAwarenessClient suspendWithError:&v17];
    id v7 = v17;
    if ((v6 & 1) == 0)
    {
      uint64_t v9 = +[CLFLog commonLog];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100100638((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    LODWORD(v8) = 1.0;
    [(CLBIdleSleepManager *)self _preventIdleSleepForNumberOfSeconds:v8];
    [(CLBIdleSleepManager *)self resetIdleTimerAndUndim:0];
    [(CLBIdleSleepManager *)self _setHIDUILockedState:1];
    NSRunLoopMode v19 = NSRunLoopCommonModes;
    id v16 = +[NSArray arrayWithObjects:&v19 count:1];
    [(CLBIdleSleepManager *)self performSelector:"_screenBlanked" withObject:0 afterDelay:v16 inModes:0.25];

    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)_screenBlanked
{
  BKSDisplayServicesSetScreenBlanked();

  [(CLBIdleSleepManager *)self _enableTapToWake];
}

- (void)_allowIdleSleep
{
  BOOL v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Allowing idle sleep…", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];
  [(CLBIdleSleepManager *)self setPreventIdleSleep:0 forReason:@"backlight"];
}

- (void)_preventIdleSleep
{
  BOOL v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Preventing idle sleep…", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];
  [(CLBIdleSleepManager *)self setPreventIdleSleep:1 forReason:@"backlight"];
}

- (void)_preventIdleSleepForNumberOfSeconds:(float)a3
{
  if ([(CLBIdleSleepManager *)self isDisplayDim])
  {
    v5 = +[CLFLog commonLog];
    double v6 = a3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preventing idle sleep for %f seconds…", buf, 0xCu);
    }

    [(CLBIdleSleepManager *)self _preventIdleSleep];
    NSRunLoopMode v8 = NSRunLoopCommonModes;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [(CLBIdleSleepManager *)self performSelector:"_allowIdleSleep" withObject:0 afterDelay:v7 inModes:v6];
  }
}

- (void)_setUpAutoLockTime
{
  BOOL v3 = +[MCProfileConnection sharedConnection];
  v4 = [v3 effectiveValueForSetting:MCFeatureAutoLockTime];

  if (v4)
  {
    [v4 doubleValue];
    self->_double autoLockTime = v5;
    unsigned int v6 = [v4 intValue];
    id v7 = +[CLFLog commonLog];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6 == 0x7FFFFFFF)
    {
      if (v8)
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AutoLock is set to never", (uint8_t *)&v11, 2u);
      }

      self->_autoLockDisabled = 1;
    }
    else
    {
      if (v8)
      {
        double autoLockTime = self->_autoLockTime;
        int v11 = 134217984;
        double v12 = autoLockTime;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AutoLock set to %f", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    self->_double autoLockTime = 30.0;
    uint64_t v9 = +[CLFLog commonLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to retrieve MCFeatureAutoLockTime using kDefaultAutoLockTime for AutoLock", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)_powerChangedOnService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  BOOL v8 = +[CLFLog commonLog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received power notification %u", (uint8_t *)v15, 8u);
  }

  HIDWORD(v9) = a4;
  LODWORD(v9) = a4 + 536870288;
  switch((v9 >> 4))
  {
    case 0u:
      double v10 = +[CLFLog commonLog];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      LOWORD(v15[0]) = 0;
      int v11 = "Received kIOMessageCanSystemSleep";
      goto LABEL_8;
    case 1u:
      double v10 = +[CLFLog commonLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        int v11 = "Received kIOMessageSystemWillSleep";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v15, 2u);
      }
LABEL_9:

      IOAllowPowerChange(self->_rootDomainConnect, (intptr_t)a5);
      return;
    case 2u:
      double v12 = +[CLFLog commonLog];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v13 = "Received kIOMessageSystemWillNotSleep";
      break;
    case 9u:
      uint64_t v14 = +[CLFLog commonLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received kIOMessageSystemHasPoweredOn", (uint8_t *)v15, 2u);
      }

      double v12 = +[NSNotificationCenter defaultCenter];
      [v12 postNotificationName:@"CLBDidWakeFromSleepNotification" object:0 userInfo:0];
      goto LABEL_18;
    case 0xBu:
      double v12 = +[CLFLog commonLog];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v13 = "Received kIOMessageSystemWillPowerOn";
      break;
    default:
      return;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v15, 2u);
LABEL_18:
}

- (void)enableIdleSleep
{
  BOOL v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling idle sleep…", buf, 2u);
  }

  io_object_t notifier = 0;
  *(void *)buf = 0;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  io_connect_t v5 = IORegisterForSystemPower(self, (IONotificationPortRef *)buf, (IOServiceInterestCallback)sub_1000216A8, &notifier);
  self->_rootDomainConnect = v5;
  if (v5)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)buf);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  }
  else
  {
    BOOL v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1001006A4(v8);
    }
  }
  int valuePtr = 1;
  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  IORegistryEntrySetCFProperty(v4, @"System Boot Complete", kCFBooleanTrue);
  IORegistryEntrySetCFProperty(v4, @"System Idle Seconds", v9);
  CFRelease(v9);
  IOPMAssertionID AssertionID = 0;
  IOPMAssertionCreateWithName(@"EnableIdleSleep", 0xFFu, @"com.apple.ClarityBoard.enableidlesleep", &AssertionID);
  [(CLBIdleSleepManager *)self setPreventIdleSleep:1 forReason:0];
  [(CLBIdleSleepManager *)self setFinishedBoot:1];
}

- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[CLFLog commonLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preventing idle sleep (%d) for reason: %@", (uint8_t *)v15, 0x12u);
  }

  [(CLBIdleSleepManager *)self finishedBoot];
  if (v6)
  {
    BOOL v8 = (void *)qword_100181138;
    if (v4)
    {
      if (!qword_100181138)
      {
        id v9 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
        double v10 = (void *)qword_100181138;
        qword_100181138 = (uint64_t)v9;

        BOOL v8 = (void *)qword_100181138;
      }
      [v8 addObject:v6];
      goto LABEL_9;
    }
    [(id)qword_100181138 removeObject:v6];
LABEL_11:
    BOOL v11 = [(id)qword_100181138 count] != 0;
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v11 = 1;
LABEL_12:
  if (v11 && !byte_100181140)
  {
    double v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Taking out kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v15, 2u);
    }

    BOOL v13 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"com.apple.CheckerBoard.idle", (IOPMAssertionID *)&dword_100181130) == 0;
LABEL_23:
    byte_100181140 = v13;
    goto LABEL_24;
  }
  if (!byte_100181140) {
    LOBYTE(v11) = 1;
  }
  if (!v11)
  {
    uint64_t v14 = +[CLFLog commonLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v15, 2u);
    }

    IOPMAssertionRelease(dword_100181130);
    BOOL v13 = 0;
    goto LABEL_23;
  }
LABEL_24:
}

- (id)_descriptionForTimeout:(double)a3
{
  if (a3 == 1.79769313e308)
  {
    io_connect_t v5 = @"infinite";
  }
  else
  {
    io_connect_t v5 = +[NSNumber numberWithDouble:v3];
  }
  return v5;
}

- (double)_nextLockTimeDuration
{
  double autoLockTime = self->_autoLockTime;
  uint64_t v4 = [(CLBIdleSleepManager *)self idleTimerDisabledReasons];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = +[CLFLog commonLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CLBIdleSleepManager *)self idleTimerDisabledReasons];
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Idle timer should be disabled because of the following reasons: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if ([(CLBIdleSleepManager *)self shouldSleepForLock])
    {
      id v6 = +[CLFLog commonLog];
      double autoLockTime = 5.0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Idle timer should sleep for lock screen. Setting auto lock time to kLockScreenAutoLockTime", (uint8_t *)&v9, 2u);
      }
      goto LABEL_5;
    }
    if (![(CLBIdleSleepManager *)self isAutoLockDisabled]) {
      return autoLockTime;
    }
    id v6 = +[CLFLog commonLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Auto Lock is disabled", (uint8_t *)&v9, 2u);
    }
  }
  double autoLockTime = 1.79769313e308;
LABEL_5:

  return autoLockTime;
}

- (id)_configurationWithAttentionLostTimeout:(double)a3
{
  id v4 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
  [v4 setIdentifier:@"CLBIdleTimer"];
  [v4 setEventMask:3967];
  [v4 setAttentionLostTimeout:a3];

  return v4;
}

- (void)resetIdleTimerAndUndim:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting idle timer and undim %d", buf, 8u);
  }

  if (v3) {
    [(CLBIdleSleepManager *)self undimDisplay];
  }
  if (![(CLBIdleSleepManager *)self isDisplayDim])
  {
    [(CLBIdleSleepManager *)self _nextLockTimeDuration];
    double v7 = v6;
    BOOL v8 = [(CLBIdleSleepManager *)self _configurationWithAttentionLostTimeout:"_configurationWithAttentionLostTimeout:"];
    int v9 = +[CLFLog commonLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(CLBIdleSleepManager *)self _descriptionForTimeout:v7];
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting a new attention awareness configuration with timeout: %@", buf, 0xCu);
    }
    BOOL v11 = [(CLBIdleSleepManager *)self attentionAwarenessClient];
    id v21 = 0;
    unsigned __int8 v12 = [v11 setConfiguration:v8 shouldReset:1 error:&v21];
    id v13 = v21;

    if ((v12 & 1) == 0)
    {
      uint64_t v14 = +[CLFLog commonLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001006E8((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = +[CLFLog commonLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109120;
    LODWORD(v15) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to set idle timer disabled to %d", (uint8_t *)&v14, 8u);
  }

  if (v6)
  {
    BOOL v8 = [(CLBIdleSleepManager *)self idleTimerDisabledReasons];
    unsigned int v9 = [v8 containsObject:v6];

    if (v4)
    {
      if ((v9 & 1) == 0)
      {
        double v10 = +[CLFLog commonLog];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Adding idle timer disabled reason: %@", (uint8_t *)&v14, 0xCu);
        }

        BOOL v11 = [(CLBIdleSleepManager *)self idleTimerDisabledReasons];
        [v11 addObject:v6];
LABEL_16:

        [(CLBIdleSleepManager *)self resetIdleTimerAndUndim:0];
      }
    }
    else if (v9)
    {
      id v13 = +[CLFLog commonLog];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Removing idle timer disabled reason: %@", (uint8_t *)&v14, 0xCu);
      }

      BOOL v11 = [(CLBIdleSleepManager *)self idleTimerDisabledReasons];
      [v11 removeObject:v6];
      goto LABEL_16;
    }
  }
  else
  {
    unsigned __int8 v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring request since idle timer disabled reason was not specified…", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_initTapToWake
{
  BOOL v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing tap to wake", buf, 2u);
  }

  int v4 = MGGetBoolAnswer();
  unint64_t v5 = 1;
  if (!v4) {
    unint64_t v5 = 2;
  }
  self->_tapToWakeSupported = v5;
  if (v4)
  {
    id v6 = (SBFTapToWakeGestureRecognizer *)[objc_alloc((Class)SBFTapToWakeGestureRecognizer) initWithTarget:self action:"_tapToWake:"];
    tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
    self->_tapToWakeGestureRecognizer = v6;

    [(SBFTapToWakeGestureRecognizer *)self->_tapToWakeGestureRecognizer setEnabled:0];
    BOOL v8 = +[_UISystemGestureManager sharedInstance];
    unsigned int v9 = +[UIScreen mainScreen];
    double v10 = self->_tapToWakeGestureRecognizer;
    BOOL v11 = [v9 displayIdentity];
    [v8 addGestureRecognizer:v10 recognitionEvent:2 toDisplayWithIdentity:v11];

    unsigned __int8 v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tap to wake is supported and has been set up.", v14, 2u);
    }
  }
  else
  {
    BOOL v8 = +[CLFLog commonLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Hardware does not support tap to wake.", v13, 2u);
    }
  }
}

- (void)_tapToWake:(id)a3
{
  if ([a3 state] == (id)3)
  {
    int v4 = +[CLFLog commonLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tap to wake performed!", v5, 2u);
    }

    if ([(CLBIdleSleepManager *)self isDisplayDim]) {
      [(CLBIdleSleepManager *)self resetIdleTimerAndUndim:1];
    }
  }
}

- (void)_enableTapToWake
{
  if ((id)[(CLBIdleSleepManager *)self tapToWakeSupported] == (id)1)
  {
    BOOL v3 = +[UIKeyboard activeKeyboard];
    int v4 = v3;
    if (v3 && ([v3 isMinimized] & 1) == 0) {
      [v4 setMinimized:1];
    }
    id v5 = objc_alloc((Class)BKSTouchStream);
    id v6 = [(CLBIdleSleepManager *)self tapToWakeWindow];
    id v7 = [v6 _contextId];
    id v8 = objc_alloc_init((Class)BKSTouchStreamPolicy);
    id v9 = [v5 initWithContextID:v7 displayUUID:0 identifier:1 policy:v8];
    [(CLBIdleSleepManager *)self setTapToWakeTouchStream:v9];

    double v10 = [(CLBIdleSleepManager *)self tapToWakeGestureRecognizer];
    [v10 setEnabled:1];

    BOOL v11 = +[CLFLog commonLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tap to Wake enabled", v12, 2u);
    }
  }
}

- (void)_disableTapToWake
{
  if ((id)[(CLBIdleSleepManager *)self tapToWakeSupported] == (id)1)
  {
    BOOL v3 = [(CLBIdleSleepManager *)self tapToWakeGestureRecognizer];
    [v3 setEnabled:0];

    int v4 = [(CLBIdleSleepManager *)self tapToWakeTouchStream];

    if (v4)
    {
      id v5 = [(CLBIdleSleepManager *)self tapToWakeTouchStream];
      [v5 invalidate];

      [(CLBIdleSleepManager *)self setTapToWakeTouchStream:0];
    }
    id v6 = +[UIKeyboard activeKeyboard];
    if (v6) {
      objc_msgSend(v6, "setMinimized:", +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"));
    }
    id v7 = +[CLFLog commonLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tap to Wake disabled", v8, 2u);
    }
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

- (BOOL)shouldSleepForLock
{
  return self->_shouldSleepForLock;
}

- (unsigned)rootDomainConnect
{
  return self->_rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->_rootDomainConnect = a3;
}

- (BOOL)finishedBoot
{
  return self->_finishedBoot;
}

- (void)setFinishedBoot:(BOOL)a3
{
  self->_finishedBoot = a3;
}

- (BOOL)isAutoLockDisabled
{
  return self->_autoLockDisabled;
}

- (void)setAutoLockDisabled:(BOOL)a3
{
  self->_autoLockDisabled = a3;
}

- (NSMutableSet)idleTimerDisabledReasons
{
  return self->_idleTimerDisabledReasons;
}

- (void)setIdleTimerDisabledReasons:(id)a3
{
}

- (unint64_t)tapToWakeSupported
{
  return self->_tapToWakeSupported;
}

- (void)setTapToWakeSupported:(unint64_t)a3
{
  self->_tapToWakeSupported = a3;
}

- (UIWindow)tapToWakeWindow
{
  return self->_tapToWakeWindow;
}

- (void)setTapToWakeWindow:(id)a3
{
}

- (BKSTouchStream)tapToWakeTouchStream
{
  return self->_tapToWakeTouchStream;
}

- (void)setTapToWakeTouchStream:(id)a3
{
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
}

- (double)autoLockTime
{
  return self->_autoLockTime;
}

- (void)setAutoLockTime:(double)a3
{
  self->_double autoLockTime = a3;
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToWakeTouchStream, 0);
  objc_storeStrong((id *)&self->_tapToWakeWindow, 0);

  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
}

@end