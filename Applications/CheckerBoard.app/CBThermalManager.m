@interface CBThermalManager
+ (id)sharedInstance;
- (BOOL)_isLevelBlocked:(int64_t)a3;
- (BOOL)isInSunlight;
- (BOOL)isThermalBlocked;
- (BOOL)sampling;
- (CBThermalManager)init;
- (int)coldTempToken;
- (int)sunlightStateToken;
- (int64_t)level;
- (void)_beginThermalJetsamCPUSampling;
- (void)_calculateAppsCPUTimesWithCompletion:(id)a3;
- (void)_killThermallyActiveApplication;
- (void)_killThermallyActiveDiagnosticsApplication;
- (void)_respondToCurrentThermalCondition;
- (void)dealloc;
- (void)setColdTempToken:(int)a3;
- (void)setInSunlight:(BOOL)a3;
- (void)setLevel:(int64_t)a3;
- (void)setSampling:(BOOL)a3;
- (void)setSunlightStateToken:(int)a3;
- (void)startListeningForThermalEvents;
@end

@implementation CBThermalManager

+ (id)sharedInstance
{
  if (qword_10008FD88 != -1) {
    dispatch_once(&qword_10008FD88, &stru_100079630);
  }
  v2 = (void *)qword_10008FD80;

  return v2;
}

- (CBThermalManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBThermalManager;
  v2 = [(CBThermalManager *)&v6 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up thermal manager…", v5, 2u);
    }

    *(void *)(v2 + 12) = -1;
    *((void *)v2 + 3) = 0;
    v2[8] = 0;
  }
  return (CBThermalManager *)v2;
}

- (void)dealloc
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  notify_cancel([(CBThermalManager *)self coldTempToken]);
  notify_cancel([(CBThermalManager *)self sunlightStateToken]);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)CBThermalManager;
  [(CBThermalManager *)&v5 dealloc];
}

- (BOOL)isThermalBlocked
{
  BOOL v2 = [(CBThermalManager *)self _isLevelBlocked:[(CBThermalManager *)self level]];
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Thermal blocked %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (BOOL)_isLevelBlocked:(int64_t)a3
{
  unint64_t v3 = a3 - 3;
  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 < 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Level blocked %d", (uint8_t *)v6, 8u);
  }

  return v3 < 2;
}

- (void)startListeningForThermalEvents
{
  unint64_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering thermal notifications…", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_super v5 = +[NSString stringWithCString:kOSThermalNotificationName encoding:4];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100008D70, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008DE8;
  handler[3] = &unk_100079658;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.thermalpressurelevel.cold", &self->_coldTempToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  [(CBThermalManager *)self _respondToCurrentThermalCondition];
  if (notify_register_check("com.apple.system.thermalsunlightstate", &self->_sunlightStateToken))
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100048B10(v6);
    }
  }
}

- (void)_respondToCurrentThermalCondition
{
  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Responding to current thermal condition…", buf, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  int v5 = OSThermalNotificationCurrentLevel();
  if (v5 >= (int)_OSThermalNotificationLevelForBehavior())
  {
    [(CBThermalManager *)self _beginThermalJetsamCPUSampling];
  }
  else if ([(CBThermalManager *)self sampling])
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Thermal status level is %d. Canceling CPU usage sampling…", buf, 8u);
    }

    [(CBThermalManager *)self setSampling:0];
  }
  uint64_t state64 = 0;
  notify_get_state([(CBThermalManager *)self coldTempToken], &state64);
  v7 = [(CBThermalManager *)self level];
  unsigned int v8 = [(CBThermalManager *)self isInSunlight];
  if (v5 >= (int)_OSThermalNotificationLevelForBehavior())
  {
    uint64_t v10 = 4;
  }
  else if (v5 >= (int)_OSThermalNotificationLevelForBehavior())
  {
    uint64_t v10 = 3;
  }
  else if (v5 >= (int)_OSThermalNotificationLevelForBehavior())
  {
    uint64_t v10 = 2;
  }
  else if (v5 >= (int)_OSThermalNotificationLevelForBehavior())
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v9 = -2;
    if (state64 != 30) {
      uint64_t v9 = 0;
    }
    if (state64 == 20) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = v9;
    }
  }
  [(CBThermalManager *)self setLevel:v10];
  if ([(CBThermalManager *)self level])
  {
    *(void *)buf = 0;
    if (notify_get_state([(CBThermalManager *)self sunlightStateToken], (uint64_t *)buf))
    {
      v11 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100048B54(v11);
      }
    }
    else
    {
      [(CBThermalManager *)self setInSunlight:*(void *)buf != 0];
    }
  }
  if (v7 != (void *)[(CBThermalManager *)self level]
    || v8 != [(CBThermalManager *)self isInSunlight])
  {
    v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v13 = [(CBThermalManager *)self level];
      unsigned int v14 = [(CBThermalManager *)self isInSunlight];
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v13;
      __int16 v24 = 1024;
      unsigned int v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device is at level (%ld) and in sunlight (%d). inPosting thermal conditions did change notification", buf, 0x12u);
    }

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:@"CBThermalConditionsDidChangeNotification" object:self userInfo:0];
  }
  unsigned int v16 = [(CBThermalManager *)self _isLevelBlocked:v7];
  unsigned int v17 = [(CBThermalManager *)self isThermalBlocked];
  if (v16 != v17)
  {
    unsigned int v18 = v17;
    v19 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v20 = @"un";
      if (v18) {
        CFStringRef v20 = &stru_10007A9F8;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Device is %@blocked. Posting thermal blocked did change notification", buf, 0xCu);
    }

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 postNotificationName:@"CBThermalBlockedDidChangeNotification" object:self userInfo:0];
  }
}

- (void)_beginThermalJetsamCPUSampling
{
  unint64_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Begin thermal jetsam CPU sampling…", buf, 2u);
  }

  if ([(CBThermalManager *)self sampling])
  {
    v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We are already sampling for killing…", buf, 2u);
    }
  }
  else
  {
    int v5 = OSThermalNotificationCurrentLevel();
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Thermal status level is urgent (%d). Starting CPU usage sampling…", buf, 8u);
    }

    [(CBThermalManager *)self setSampling:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000093FC;
    v7[3] = &unk_100079680;
    v7[4] = self;
    [(CBThermalManager *)self _calculateAppsCPUTimesWithCompletion:v7];
  }
}

- (void)_calculateAppsCPUTimesWithCompletion:(id)a3
{
  unint64_t v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating dictionary with applications to kill…", buf, 2u);
    }

    int v5 = +[NSMutableDictionary dictionary];
    objc_super v6 = +[FBProcessManager sharedInstance];
    v7 = [v6 allApplicationProcesses];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v12 elapsedCPUTime];
          int64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          unsigned int v14 = [v12 bundleIdentifier];
          [v5 setObject:v13 forKey:v14];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
    v3[2](v3, v5);
  }
}

- (void)_killThermallyActiveApplication
{
  unsigned int v3 = [(CBThermalManager *)self sampling];
  v4 = CheckerBoardLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We are sampling so we must kill", buf, 2u);
    }

    [(CBThermalManager *)self _killThermallyActiveDiagnosticsApplication];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "We are no longer sampling so no more killing", v6, 2u);
    }
  }
}

- (void)_killThermallyActiveDiagnosticsApplication
{
  if ([(CBThermalManager *)self sampling])
  {
    int v3 = OSThermalNotificationCurrentLevel();
    v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v9 = v3;
      __int16 v10 = 2112;
      CFStringRef v11 = @"com.apple.Diagnostics";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Thermal status level is urgent (%d). Attempt to kill %@", buf, 0x12u);
    }

    BOOL v5 = +[CBAppManager sharedInstance];
    [v5 terminateAppWithBundleID:@"com.apple.Diagnostics" reason:4 reportCrash:1 description:0 completion:0];

    NSRunLoopMode v7 = NSRunLoopCommonModes;
    objc_super v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(CBThermalManager *)self performSelector:"_respondToCurrentThermalCondition" withObject:0 afterDelay:v6 inModes:30.0];
  }
  [(CBThermalManager *)self setSampling:0];
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (BOOL)isInSunlight
{
  return self->_inSunlight;
}

- (void)setInSunlight:(BOOL)a3
{
  self->_inSunlight = a3;
}

- (BOOL)sampling
{
  return self->_sampling;
}

- (void)setSampling:(BOOL)a3
{
  self->_sampling = a3;
}

- (int)coldTempToken
{
  return self->_coldTempToken;
}

- (void)setColdTempToken:(int)a3
{
  self->_coldTempToken = a3;
}

- (int)sunlightStateToken
{
  return self->_sunlightStateToken;
}

- (void)setSunlightStateToken:(int)a3
{
  self->_sunlightStateToken = a3;
}

@end