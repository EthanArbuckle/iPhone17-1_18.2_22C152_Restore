@interface CBIdleSleepManager
+ (id)sharedInstance;
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (BOOL)finishedBoot;
- (BOOL)isDisplayDim;
- (CBIdleSleepManager)init;
- (NSMutableSet)idleTimerDisabledReasons;
- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer;
- (id)configurationWithAttentionLostTimeout:(double)a3;
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
- (void)_tapToWake:(id)a3;
- (void)_undimDisplay;
- (void)dealloc;
- (void)dimDisplay;
- (void)enableIdleSleep;
- (void)resetIdleTimerAndUndim:(BOOL)a3;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setDisplayDim:(BOOL)a3;
- (void)setFinishedBoot:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setIdleTimerDisabledReasons:(id)a3;
- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setTapToWakeGestureRecognizer:(id)a3;
- (void)setTapToWakeSupported:(unint64_t)a3;
- (void)undimDisplay;
@end

@implementation CBIdleSleepManager

+ (id)sharedInstance
{
  if (qword_10008FE60 != -1) {
    dispatch_once(&qword_10008FE60, &stru_100079F38);
  }
  v2 = (void *)qword_10008FE58;

  return v2;
}

- (CBIdleSleepManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)CBIdleSleepManager;
  v2 = [(CBIdleSleepManager *)&v15 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Registering idle timer notifications…", (uint8_t *)buf, 2u);
    }

    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    idleTimerDisabledReasons = v2->_idleTimerDisabledReasons;
    v2->_idleTimerDisabledReasons = v4;

    v6 = [(CBIdleSleepManager *)v2 configurationWithAttentionLostTimeout:30.0];
    v7 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)AWAttentionAwarenessClient);
    attentionAwarenessClient = v2->_attentionAwarenessClient;
    v2->_attentionAwarenessClient = v7;

    [(AWAttentionAwarenessClient *)v2->_attentionAwarenessClient setConfiguration:v6 shouldReset:1];
    [(CBIdleSleepManager *)v2 _initTapToWake];
    objc_initWeak(buf, v2);
    v9 = v2->_attentionAwarenessClient;
    id v10 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100023720;
    v12[3] = &unk_100079F60;
    objc_copyWeak(&v13, buf);
    [(AWAttentionAwarenessClient *)v9 setEventHandlerWithQueue:&_dispatch_main_q block:v12];

    BKSHIDServicesAmbientLightSensorEnableAutoBrightness();
    v2->_displayDim = 0;
    [(CBIdleSleepManager *)v2 _undimDisplay];
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  return v2;
}

- (void)dealloc
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dealloc was called", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  p_rootDomainConnect = &self->_rootDomainConnect;
  if (self->_rootDomainConnect)
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Deregistering and closing connection", buf, 2u);
    }

    IODeregisterForSystemPower(&self->_rootDomainConnect);
    IOServiceClose(*p_rootDomainConnect);
    unsigned int *p_rootDomainConnect = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CBIdleSleepManager;
  [(CBIdleSleepManager *)&v7 dealloc];
}

- (id)configurationWithAttentionLostTimeout:(double)a3
{
  id v4 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
  [v4 setIdentifier:@"CBIdleTimer"];
  [v4 setEventMask:3967];
  [v4 setAttentionLostTimeout:a3];

  return v4;
}

- (void)_setHIDUILockedState:(BOOL)a3
{
  if (byte_10008F3E8 != a3)
  {
    BOOL v3 = a3;
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Setting UI locked state to %d", (uint8_t *)v5, 8u);
    }

    BKSHIDServicesSetHIDUILockedState();
    byte_10008F3E8 = v3;
  }
}

- (void)_undimDisplay
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CBScreenWillUndimNotification" object:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_screenBlanked" object:0];
  [(CBIdleSleepManager *)self _disableTapToWake];
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Undimming display…", buf, 2u);
  }

  BKSDisplayServicesSetScreenBlanked();
  BKSHIDServicesSetBacklightFactorWithFadeDuration();
  [(CBIdleSleepManager *)self setDisplayDim:0];
  attentionAwarenessClient = self->_attentionAwarenessClient;
  id v16 = 0;
  unsigned __int8 v6 = [(AWAttentionAwarenessClient *)attentionAwarenessClient resumeWithError:&v16];
  id v7 = v16;
  if ((v6 & 1) == 0)
  {
    v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000492E8((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  [(CBIdleSleepManager *)self _preventIdleSleep];
  [(CBIdleSleepManager *)self _setHIDUILockedState:0];
  objc_super v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"CBScreenDidUndimNotification" object:0];
}

- (void)undimDisplay
{
  if ([(CBIdleSleepManager *)self isDisplayDim])
  {
    BOOL v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Display is off. Turning display on…", v4, 2u);
    }

    [(CBIdleSleepManager *)self _undimDisplay];
  }
}

- (void)dimDisplay
{
  if (![(CBIdleSleepManager *)self isDisplayDim])
  {
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"CBScreenWillDimNotification" object:0];

    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dimming display…", buf, 2u);
    }

    BKSHIDServicesSetBacklightFactorWithFadeDuration();
    [(CBIdleSleepManager *)self setDisplayDim:1];
    attentionAwarenessClient = self->_attentionAwarenessClient;
    id v18 = 0;
    unsigned __int8 v6 = [(AWAttentionAwarenessClient *)attentionAwarenessClient suspendWithError:&v18];
    id v7 = v18;
    if ((v6 & 1) == 0)
    {
      uint64_t v9 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100049354((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    LODWORD(v8) = 1.0;
    [(CBIdleSleepManager *)self _preventIdleSleepForNumberOfSeconds:v8];
    [(CBIdleSleepManager *)self resetIdleTimerAndUndim:0];
    [(CBIdleSleepManager *)self _setHIDUILockedState:1];
    NSRunLoopMode v20 = NSRunLoopCommonModes;
    id v16 = +[NSArray arrayWithObjects:&v20 count:1];
    [(CBIdleSleepManager *)self performSelector:"_screenBlanked" withObject:0 afterDelay:v16 inModes:0.25];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 postNotificationName:@"CBScreenDidDimNotification" object:0];
  }
}

- (void)_screenBlanked
{
  BKSDisplayServicesSetScreenBlanked();

  [(CBIdleSleepManager *)self _enableTapToWake];
}

- (void)_allowIdleSleep
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Allowing idle sleep…", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];
  [(CBIdleSleepManager *)self setPreventIdleSleep:0 forReason:@"backlight"];
}

- (void)_preventIdleSleep
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep…", v4, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_allowIdleSleep" object:0];
  [(CBIdleSleepManager *)self setPreventIdleSleep:1 forReason:@"backlight"];
}

- (void)_preventIdleSleepForNumberOfSeconds:(float)a3
{
  if ([(CBIdleSleepManager *)self isDisplayDim])
  {
    v5 = CheckerBoardLogHandleForCategory();
    double v6 = a3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep for %f seconds…", buf, 0xCu);
    }

    [(CBIdleSleepManager *)self _preventIdleSleep];
    NSRunLoopMode v8 = NSRunLoopCommonModes;
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [(CBIdleSleepManager *)self performSelector:"_allowIdleSleep" withObject:0 afterDelay:v7 inModes:v6];
  }
}

- (void)_powerChangedOnService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  NSRunLoopMode v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Received power notification %u", (uint8_t *)v15, 8u);
  }

  HIDWORD(v9) = a4;
  LODWORD(v9) = a4 + 536870288;
  switch((v9 >> 4))
  {
    case 0u:
      double v10 = CheckerBoardLogHandleForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v11 = "[CBIdleSleepManager] Received kIOMessageCanSystemSleep";
      goto LABEL_8;
    case 1u:
      double v10 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        uint64_t v11 = "[CBIdleSleepManager] Received kIOMessageSystemWillSleep";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)v15, 2u);
      }
LABEL_9:

      IOAllowPowerChange(self->_rootDomainConnect, (intptr_t)a5);
      return;
    case 2u:
      uint64_t v12 = CheckerBoardLogHandleForCategory();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v13 = "[CBIdleSleepManager] Received kIOMessageSystemWillNotSleep";
      break;
    case 9u:
      uint64_t v14 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Received kIOMessageSystemHasPoweredOn", (uint8_t *)v15, 2u);
      }

      uint64_t v12 = +[NSNotificationCenter defaultCenter];
      [v12 postNotificationName:@"CBDidWakeFromSleepNotification" object:0 userInfo:0];
      goto LABEL_18;
    case 0xBu:
      uint64_t v12 = CheckerBoardLogHandleForCategory();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v13 = "[CBIdleSleepManager] Received kIOMessageSystemWillPowerOn";
      break;
    default:
      return;
  }
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v15, 2u);
LABEL_18:
}

- (void)enableIdleSleep
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Enabling idle sleep…", buf, 2u);
  }

  io_object_t notifier = 0;
  *(void *)buf = 0;
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMasterPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  io_connect_t v5 = IORegisterForSystemPower(self, (IONotificationPortRef *)buf, (IOServiceInterestCallback)sub_10002455C, &notifier);
  self->_rootDomainConnect = v5;
  if (v5)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)buf);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  }
  else
  {
    NSRunLoopMode v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000493C0(v8);
    }
  }
  int valuePtr = 1;
  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  IORegistryEntrySetCFProperty(v4, @"System Boot Complete", kCFBooleanTrue);
  IORegistryEntrySetCFProperty(v4, @"System Idle Seconds", v9);
  CFRelease(v9);
  IOPMAssertionID AssertionID = 0;
  IOPMAssertionCreateWithName(@"EnableIdleSleep", 0xFFu, @"com.apple.CheckerBoard.enableidlesleep", &AssertionID);
  [(CBIdleSleepManager *)self setPreventIdleSleep:1 forReason:0];
  [(CBIdleSleepManager *)self setFinishedBoot:1];
}

- (void)setPreventIdleSleep:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Preventing idle sleep (%d) for reason: %@", (uint8_t *)v15, 0x12u);
  }

  [(CBIdleSleepManager *)self finishedBoot];
  if (v6)
  {
    NSRunLoopMode v8 = (void *)qword_10008FE70;
    if (v4)
    {
      if (!qword_10008FE70)
      {
        id v9 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
        double v10 = (void *)qword_10008FE70;
        qword_10008FE70 = (uint64_t)v9;

        NSRunLoopMode v8 = (void *)qword_10008FE70;
      }
      [v8 addObject:v6];
      goto LABEL_9;
    }
    [(id)qword_10008FE70 removeObject:v6];
LABEL_11:
    BOOL v11 = [(id)qword_10008FE70 count] != 0;
    goto LABEL_12;
  }
  if (!v4) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v11 = 1;
LABEL_12:
  if (v11 && !byte_10008FE78)
  {
    uint64_t v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Taking out kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v15, 2u);
    }

    BOOL v13 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, @"com.apple.CheckerBoard.idle", (IOPMAssertionID *)&dword_10008FE68) == 0;
LABEL_23:
    byte_10008FE78 = v13;
    goto LABEL_24;
  }
  if (!byte_10008FE78) {
    LOBYTE(v11) = 1;
  }
  if (!v11)
  {
    uint64_t v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Releasing kIOPMAssertionTypeNoIdleSleep assertion", (uint8_t *)v15, 2u);
    }

    IOPMAssertionRelease(dword_10008FE68);
    BOOL v13 = 0;
    goto LABEL_23;
  }
LABEL_24:
}

- (void)resetIdleTimerAndUndim:(BOOL)a3
{
  BOOL v3 = a3;
  io_connect_t v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Resetting idle timer and undim %d", buf, 8u);
  }

  if (v3) {
    [(CBIdleSleepManager *)self undimDisplay];
  }
  if (![(CBIdleSleepManager *)self isDisplayDim])
  {
    id v6 = [(CBIdleSleepManager *)self idleTimerDisabledReasons];
    if ([v6 count]) {
      double v7 = 1.79769313e308;
    }
    else {
      double v7 = 30.0;
    }

    NSRunLoopMode v8 = [(CBIdleSleepManager *)self configurationWithAttentionLostTimeout:v7];
    id v9 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Setting a new attention awareness configuration with timeout: %f", buf, 0xCu);
    }

    double v10 = [(CBIdleSleepManager *)self attentionAwarenessClient];
    id v20 = 0;
    unsigned __int8 v11 = [v10 setConfiguration:v8 shouldReset:1 error:&v20];
    id v12 = v20;

    if ((v11 & 1) == 0)
    {
      BOOL v13 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100049404((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109120;
    LODWORD(v15) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Attempting to set idle timer disabled to %d", (uint8_t *)&v14, 8u);
  }

  if (v6)
  {
    NSRunLoopMode v8 = [(CBIdleSleepManager *)self idleTimerDisabledReasons];
    unsigned int v9 = [v8 containsObject:v6];

    if (v4)
    {
      if ((v9 & 1) == 0)
      {
        double v10 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Adding idle timer disabled reason: %@", (uint8_t *)&v14, 0xCu);
        }

        unsigned __int8 v11 = [(CBIdleSleepManager *)self idleTimerDisabledReasons];
        [v11 addObject:v6];
LABEL_16:

        [(CBIdleSleepManager *)self resetIdleTimerAndUndim:1];
      }
    }
    else if (v9)
    {
      BOOL v13 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Removing idle timer disabled reason: %@", (uint8_t *)&v14, 0xCu);
      }

      unsigned __int8 v11 = [(CBIdleSleepManager *)self idleTimerDisabledReasons];
      [v11 removeObject:v6];
      goto LABEL_16;
    }
  }
  else
  {
    id v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Ignoring request since idle timer disabled reason was not specified…", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_initTapToWake
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Initializing tap to wake", buf, 2u);
  }

  int v4 = MGGetBoolAnswer();
  unint64_t v5 = 1;
  if (!v4) {
    unint64_t v5 = 2;
  }
  self->_tapToWakeSupported = v5;
  if (v4)
  {
    id v6 = +[_UISystemGestureManager sharedInstance];
    double v7 = +[UIScreen mainScreen];
    NSRunLoopMode v8 = (SBFTapToWakeGestureRecognizer *)[objc_alloc((Class)SBFTapToWakeGestureRecognizer) initWithTarget:self action:"_tapToWake:"];
    tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
    self->_tapToWakeGestureRecognizer = v8;

    [(SBFTapToWakeGestureRecognizer *)self->_tapToWakeGestureRecognizer setEnabled:0];
    double v10 = self->_tapToWakeGestureRecognizer;
    unsigned __int8 v11 = [v7 displayIdentity];
    [v6 addGestureRecognizer:v10 toDisplayWithIdentity:v11];

    id v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to wake is supported and has been set up.", v14, 2u);
    }
  }
  else
  {
    id v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Hardware does not support tap to wake.", v13, 2u);
    }
  }
}

- (void)_tapToWake:(id)a3
{
  if ([a3 state] == (id)3)
  {
    int v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to wake performed!", v5, 2u);
    }

    if ([(CBIdleSleepManager *)self isDisplayDim]) {
      [(CBIdleSleepManager *)self resetIdleTimerAndUndim:1];
    }
  }
}

- (void)_enableTapToWake
{
  if ((id)[(CBIdleSleepManager *)self tapToWakeSupported] == (id)1)
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100079F80);
    BOOL v3 = [(CBIdleSleepManager *)self tapToWakeGestureRecognizer];
    [v3 setEnabled:1];

    int v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to Wake enabled", v5, 2u);
    }
  }
}

- (void)_disableTapToWake
{
  if ((id)[(CBIdleSleepManager *)self tapToWakeSupported] == (id)1)
  {
    BOOL v3 = [(CBIdleSleepManager *)self tapToWakeGestureRecognizer];
    [v3 setEnabled:0];

    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100079FA0);
    int v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Tap to Wake disabled", v5, 2u);
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

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
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

  objc_storeStrong((id *)&self->_idleTimerDisabledReasons, 0);
}

@end