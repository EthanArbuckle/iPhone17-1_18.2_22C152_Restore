@interface TMLSLinkSource
- ($1AB5FA073B851C12C2339EC22442E995)lastRTCSample;
- (BOOL)isGizmo;
- (BOOL)isLastRTCSampleValid;
- (NSString)companionTimeZone;
- (OS_dispatch_workloop)workloop;
- (TMLSLink)link;
- (TMLSLinkSource)init;
- (TMLSLinkSource)initWithClock:(id)a3;
- (TMLSLinkSource)initWithClock:(id)a3 daemonCore:(id)a4;
- (TMMonotonicClock)clock;
- (double)rtcWhenBeyondUncertainty:(double)a3;
- (id)daemonCore;
- (id)timeAtRtc:(double)a3;
- (void)_systemTimeChanged:(id)a3;
- (void)dealloc;
- (void)link:(id)a3 didReceiveAutomaticTimeEnabled:(BOOL)a4;
- (void)link:(id)a3 didReceiveDrift:(double)a4;
- (void)link:(id)a3 didReceiveTime:(double)a4 remoteRTC:(double)a5 uncertainty:(double)a6 source:(id)a7;
- (void)link:(id)a3 didReceiveTimeZone:(id)a4 forSource:(id)a5;
- (void)link:(id)a3 didSyncLocalRTC:(double)a4 remoteRTC:(double)a5 uncertainty:(double)a6;
- (void)linkBecameAvailable:(id)a3;
- (void)linkBecameUnavailable:(id)a3;
- (void)linkDidReceiveReset:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setClock:(id)a3;
- (void)setCompanionTimeZone:(id)a3;
- (void)setDaemonCore:(id)a3;
- (void)setGizmo:(BOOL)a3;
- (void)setLastRTCSample:(id)a3;
- (void)setLastRTCSampleValid:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setWorkloop:(id)a3;
- (void)setupThresholds;
- (void)significantTimeChange;
- (void)syncAutomaticTimeEnabled;
- (void)syncTimeZone;
- (void)systemTimeChanged:(id)a3;
- (void)systemTimeZoneChanged;
@end

@implementation TMLSLinkSource

- (void)setupThresholds
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_37B4;
  v11[3] = &unk_10458;
  v11[4] = self;
  v2 = objc_retainBlock(v11);
  ((void (*)(void *, void))v2[2])(v2, 0);
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = NRPairedDeviceRegistryDeviceDidPairNotification;
  v5 = +[NSOperationQueue currentQueue];
  id v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v2];

  v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
  v9 = +[NSOperationQueue currentQueue];
  id v10 = [v7 addObserverForName:v8 object:0 queue:v9 usingBlock:v2];
}

- (TMLSLinkSource)init
{
  uint64_t v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"TMLSLinkSource.m" lineNumber:120 description:@"Wrong method. Initialize plugin with -initWithClock:"];

  return 0;
}

- (TMLSLinkSource)initWithClock:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_FAULT)) {
    sub_97DC();
  }
  v5 = [(TMLSLinkSource *)self initWithClock:v4 daemonCore:0];

  return v5;
}

- (TMLSLinkSource)initWithClock:(id)a3 daemonCore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TMLSLinkSource;
  v9 = [(TMLSLinkSource *)&v27 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.timed", "data");
    v11 = (void *)CORETIME_DATA_FACILITY;
    CORETIME_DATA_FACILITY = (uint64_t)v10;

    os_log_t v12 = os_log_create("com.apple.timed", "tmls");
    v13 = (void *)TIMELINK_FACILITY;
    TIMELINK_FACILITY = (uint64_t)v12;

    objc_storeStrong((id *)&v9->_clock, a3);
    objc_storeWeak(&v9->_daemonCore, v8);
    uint64_t v14 = [v8 workloop];
    workloop = v9->_workloop;
    v9->_workloop = (OS_dispatch_workloop *)v14;

    [(TMLSLinkSource *)v9 setupThresholds];
    if ([(TMLSLinkSource *)v9 isGizmo]) {
      [v8 addTimeProvider:v9 forKey:@"Manual"];
    }
    v16 = [TMLSLink alloc];
    v17 = [(TMLSLinkSource *)v9 workloop];
    v18 = [(TMLSLink *)v16 initWithDelegate:v9 clock:v7 workloop:v17];
    link = v9->_link;
    v9->_link = v18;

    v20 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Loaded TMLSLinkSource", v26, 2u);
    }
    if (![(TMLSLinkSource *)v9 isGizmo])
    {
      v21 = TIMELINK_FACILITY;
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Setting up notification listeners", v26, 2u);
      }
      [v8 addObserver:v9 forKeyPath:@"automaticTimeEnabled" options:0 context:&off_10478];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_3BE0, @"SignificantTimeChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
      v23 = +[NSNotificationCenter defaultCenter];
      [v23 addObserver:v9 selector:"systemTimeChanged:" name:@"TMSystemTimeChanged" object:0];

      v24 = TIMELINK_FACILITY;
      if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Performing initial sync", v26, 2u);
      }
      [(TMLSLinkSource *)v9 syncAutomaticTimeEnabled];
      [(TMLSLinkSource *)v9 systemTimeZoneChanged];
    }
  }

  return v9;
}

- (void)dealloc
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopRef Main = CFRunLoopGetMain();
  if (!CFEqual(Current, Main))
  {
    id v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TMLSLinkSource dealloc]");
    [v7 handleFailureInFunction:v8 file:@"TMLSLinkSource.m" lineNumber:170 description:@"Expect to be torn down from the main thread"];
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);
  [WeakRetained removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)TMLSLinkSource;
  [(TMLSLinkSource *)&v9 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(TMLSLinkSource *)self workloop];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3E40;
  v14[3] = &unk_10488;
  id v15 = v9;
  id v16 = v10;
  v17 = self;
  v18 = a6;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(v11, v14);
}

- (void)setCompanionTimeZone:(id)a3
{
  v5 = (NSString *)a3;
  if ([(TMLSLinkSource *)self isGizmo]) {
    sub_9874();
  }
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_98A0();
  }
  companionTimeZone = self->_companionTimeZone;
  if (companionTimeZone != v5 && (!v5 || ![(NSString *)companionTimeZone isEqualToString:v5]))
  {
    objc_storeStrong((id *)&self->_companionTimeZone, a3);
    [(TMLSLinkSource *)self syncTimeZone];
  }
}

- (void)syncTimeZone
{
  if ([(TMLSLinkSource *)self isGizmo]) {
    sub_9928();
  }
  v3 = (void *)TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_9954(v3, self);
  }
  id v4 = [(TMLSLinkSource *)self link];
  v5 = [(TMLSLinkSource *)self companionTimeZone];
  [v4 sendTimeZone:v5 forSource:@"TMLSSourceDevice"];
}

- (void)syncAutomaticTimeEnabled
{
  if ([(TMLSLinkSource *)self isGizmo]) {
    sub_99F8();
  }
  v3 = [(TMLSLinkSource *)self daemonCore];
  id v4 = [v3 isAutomaticTimeEnabled];

  v5 = [(TMLSLinkSource *)self link];
  [v5 sendAutomaticTimeEnabled:v4];

  id v6 = [(TMLSLinkSource *)self link];
  [v6 syncRTC];
}

- (BOOL)isLastRTCSampleValid
{
  [(TMLSLinkSource *)self lastRTCSample];
  return v2 > 0.0;
}

- (void)setLastRTCSampleValid:(BOOL)a3
{
  if (a3)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TMLSLinkSource.m", 225, @"Invalid parameter not satisfying: %@", @"valid == NO" object file lineNumber description];
  }
  self->_lastRTCSample.localRTC = 0.0;
}

- (void)significantTimeChange
{
  if ([(TMLSLinkSource *)self isGizmo]) {
    sub_9A24();
  }
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_9A50();
  }
  v3 = [(TMLSLinkSource *)self daemonCore];
  unsigned __int8 v4 = [v3 isAutomaticTimeEnabled];

  if ((v4 & 1) == 0)
  {
    v5 = [(TMLSLinkSource *)self link];
    [v5 syncRTC];
  }
}

- (void)systemTimeZoneChanged
{
  if ([(TMLSLinkSource *)self isGizmo]) {
    sub_9A90();
  }
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_9ABC();
  }
  +[NSTimeZone resetSystemTimeZone];
  v3 = +[NSTimeZone systemTimeZone];
  unsigned __int8 v4 = [v3 name];
  [(TMLSLinkSource *)self setCompanionTimeZone:v4];
}

- (void)_systemTimeChanged:(id)a3
{
  unsigned __int8 v4 = [(TMLSLinkSource *)self clock];
  [v4 coarseMonotonicTime];
  double v6 = v5;

  id v7 = [(TMLSLinkSource *)self daemonCore];
  id v8 = [v7 timeProvider];
  id v9 = [v8 timeAtRtc:v6];

  lastTime = self->_lastTime;
  if (lastTime)
  {
    [(TMTime *)lastTime propagatedTimeAtRTC:v6];
    double v12 = v11;
    [(TMTime *)self->_lastTime propagatedUncertaintyAtRTC:v6];
    double v14 = v13;
    objc_msgSend(v9, "utc_s");
    double v16 = v15 - v12;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    BOOL v17 = v14 + v16 > 0.01;
  }
  else
  {
    BOOL v17 = 1;
  }
  v18 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG))
  {
    sub_9AFC(v17, v18);
    if (!v17) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v17)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_lastTime, v9);
    v19 = [(TMLSLinkSource *)self link];
    [v19 syncRTC];
  }
LABEL_9:
}

- (void)systemTimeChanged:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEBUG)) {
    sub_9B78();
  }
  double v5 = [(TMLSLinkSource *)self workloop];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4494;
  v7[3] = &unk_10408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)link:(id)a3 didSyncLocalRTC:(double)a4 remoteRTC:(double)a5 uncertainty:(double)a6
{
  id v10 = (__CFString *)a3;
  double v11 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    CFStringRef v31 = v10;
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2048;
    double v35 = a5;
    __int16 v36 = 2048;
    double v37 = a6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "didSyncLocalRTC, %@, %f, %f, %f", buf, 0x2Au);
  }
  double v12 = CORETIME_DATA_FACILITY;
  if (os_log_type_enabled((os_log_t)CORETIME_DATA_FACILITY, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    CFStringRef v31 = @"didSyncLocalRTC";
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2048;
    double v35 = a5;
    __int16 v36 = 2048;
    double v37 = a6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "cmd,%@,local_rtc_s,%.9f,remote_rtc_s,%.9f,unc,%.9f", buf, 0x2Au);
  }
  v29[5] = _NSConcreteStackBlock;
  v29[6] = 3221225472;
  v29[7] = sub_4978;
  v29[8] = &unk_104A8;
  *(double *)&v29[9] = a4;
  *(double *)&v29[10] = a5;
  *(double *)&v29[11] = a6;
  AnalyticsSendEventLazy();
  self->_lastRTCSample.remoteRTC = a5;
  self->_lastRTCSample.localRTC = a4;
  self->_lastRTCSample.uncertainty = a6;
  if (![(TMLSLinkSource *)self isGizmo])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_4A84;
    v29[3] = &unk_104D0;
    v29[4] = self;
    double v13 = objc_retainBlock(v29);
    double v14 = [(TMLSLinkSource *)self daemonCore];
    double v15 = [v14 timeProvider];
    double v16 = [v15 timeAtRtc:a4];

    BOOL v17 = [v16 dictionary];
    id v18 = [v17 mutableCopy];

    [v18 setObject:@"TMLSSourceComputed" forKeyedSubscript:@"TMSource"];
    v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 reliability]);
    [v18 setObject:v19 forKeyedSubscript:@"TMTimeReliable"];

    ((void (*)(void *, id))v13[2])(v13, v18);
    v20 = [(TMLSLinkSource *)self clock];
    id v21 = [v20 machTime];

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v23 = [(TMLSLinkSource *)self clock];
    v24 = [(TMLSLinkSource *)self workloop];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_4CB0;
    v26[3] = &unk_104F8;
    v26[4] = self;
    id v27 = v13;
    CFAbsoluteTime v28 = Current;
    v25 = v13;
    [v23 montonicTimeForMachTime:v21 toQueue:v24 withCompletionHandler:v26];
  }
}

- (void)link:(id)a3 didReceiveTime:(double)a4 remoteRTC:(double)a5 uncertainty:(double)a6 source:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  double v14 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    id v31 = v12;
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2048;
    double v35 = a5;
    __int16 v36 = 2048;
    double v37 = a6;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "didReceiveTime, %@, %f, %f, %f, %@", buf, 0x34u);
  }
  if (![(TMLSLinkSource *)self isGizmo]
    && os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR))
  {
    sub_9D44();
  }
  if ([(TMLSLinkSource *)self isGizmo]
    && [(TMLSLinkSource *)self isLastRTCSampleValid])
  {
    [(TMLSLinkSource *)self lastRTCSample];
    double v16 = a5 - v15;
    [(TMLSLinkSource *)self lastRTCSample];
    double v18 = v16 + v17;
    [(TMLSLinkSource *)self lastRTCSample];
    double v20 = v19 + a6;
    v29[0] = @"TMSetSourceTime";
    v29[1] = v13;
    id v21 = +[NSNumber numberWithDouble:a4, @"TMCommand", @"TMSource", @"TMCurrentTime"];
    v29[2] = v21;
    v28[3] = @"TMTimeError";
    v22 = +[NSNumber numberWithDouble:v20];
    v29[3] = v22;
    v28[4] = @"TMRtcTime";
    v23 = +[NSNumber numberWithDouble:v18];
    v29[4] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];

    id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);
    if (([v13 isEqualToString:@"TMLSSourceComputed"] & 1) != 0
      || [v13 isEqualToString:@"TMLSSourceComputedReliable"])
    {
      [WeakRetained setSourceTime:v24];
    }
    else if ([v13 isEqualToString:@"TMLSSourceDevice"])
    {
      v26 = (NSDictionary *)[v24 copy];
      lastCompanionTimeUpdate = self->_lastCompanionTimeUpdate;
      self->_lastCompanionTimeUpdate = v26;

      [WeakRetained testAndApplySystemTime];
    }
  }
}

- (void)link:(id)a3 didReceiveTimeZone:(id)a4 forSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v11 isEqualToString:@"TMLSSourceDevice"] & 1) == 0)
  {
    double v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TMLSLinkSource.m", 400, @"Unexpected source %@", v11 object file lineNumber description];
  }
  id v12 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "didReceiveTimeZone, %@, %@, %@", buf, 0x20u);
  }
  if ([(TMLSLinkSource *)self isGizmo])
  {
    v17[0] = @"TMCommand";
    v17[1] = @"TMSource";
    v18[0] = @"TMSetSourceTimeZone";
    v18[1] = v11;
    v18[2] = v10;
    v17[2] = @"TMTimeZone";
    v17[3] = @"TMRtcTime";
    id v13 = +[NSNumber numberWithDouble:TMLSHackedRTC()];
    v18[3] = v13;
    double v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

    id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);
    [WeakRetained setSourceTimeZone:v14];
  }
}

- (void)link:(id)a3 didReceiveAutomaticTimeEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  unsigned int v7 = [(TMLSLinkSource *)self isGizmo];
  id v8 = TIMELINK_FACILITY;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      double v16 = v6;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "didReceiveAutomaticTimeEnabled, %@, %d", buf, 0x12u);
    }
    id v9 = @"Manual";
    if (v4) {
      id v9 = @"Filtered";
    }
    id v10 = v9;
    id v11 = TIMELINK_FACILITY;
    if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v16 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Switching provider to '%@'", buf, 0xCu);
    }
    id v12 = +[NSUserDefaults standardUserDefaults];
    [v12 setObject:v10 forKey:@"TimeProvider"];

    id v13 = [(TMLSLinkSource *)self workloop];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_54E4;
    block[3] = &unk_10520;
    block[4] = self;
    dispatch_async(v13, block);
  }
  else if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_ERROR))
  {
    sub_9D84();
  }
}

- (void)link:(id)a3 didReceiveDrift:(double)a4
{
  id v5 = a3;
  id v6 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2048;
    double v10 = a4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "didReceiveDrift, %@, %f", (uint8_t *)&v7, 0x16u);
  }
}

- (void)linkDidReceiveReset:(id)a3
{
  id v4 = a3;
  id v5 = TIMELINK_FACILITY;
  if (os_log_type_enabled((os_log_t)TIMELINK_FACILITY, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "linkDidReceiveReset, %@", (uint8_t *)&v6, 0xCu);
  }
  [(TMLSLinkSource *)self setLastRTCSampleValid:0];
  if (![(TMLSLinkSource *)self isGizmo])
  {
    [(TMLSLinkSource *)self syncAutomaticTimeEnabled];
    [(TMLSLinkSource *)self syncTimeZone];
  }
}

- (void)linkBecameAvailable:(id)a3
{
  id v4 = a3;
  if (![(TMLSLinkSource *)self isGizmo]) {
    sub_9E0C();
  }
  id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);
  v9[0] = @"TMSource";
  v9[1] = @"TMRtcTime";
  v10[0] = @"TMLSSourceDevice";
  int v6 = +[NSNumber numberWithDouble:TMLSHackedRTC()];
  v10[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [WeakRetained setSourceAvailable:v7];

  id v8 = [(TMLSLinkSource *)self link];
  [v8 sendReset];
}

- (void)linkBecameUnavailable:(id)a3
{
  id v4 = a3;
  if (![(TMLSLinkSource *)self isGizmo]) {
    sub_9E38();
  }
  id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);
  v8[0] = @"TMSource";
  v8[1] = @"TMRtcTime";
  v9[0] = @"TMLSSourceDevice";
  int v6 = +[NSNumber numberWithDouble:TMLSHackedRTC()];
  v9[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [WeakRetained setSourceUnavailable:v7];
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (id)daemonCore
{
  id WeakRetained = objc_loadWeakRetained(&self->_daemonCore);

  return WeakRetained;
}

- (void)setDaemonCore:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (TMLSLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- ($1AB5FA073B851C12C2339EC22442E995)lastRTCSample
{
  double remoteRTC = self->_lastRTCSample.remoteRTC;
  double localRTC = self->_lastRTCSample.localRTC;
  double uncertainty = self->_lastRTCSample.uncertainty;
  result.var2 = uncertainty;
  result.var1 = localRTC;
  result.var0 = remoteRTC;
  return result;
}

- (void)setLastRTCSample:(id)a3
{
  self->_lastRTCSample = ($1EA3A853182FDDA4925E873349471975)a3;
}

- (NSString)companionTimeZone
{
  return self->_companionTimeZone;
}

- (BOOL)isGizmo
{
  return self->_gizmo;
}

- (void)setGizmo:(BOOL)a3
{
  self->_gizmo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionTimeZone, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_destroyWeak(&self->_daemonCore);
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_lastTime, 0);

  objc_storeStrong((id *)&self->_lastCompanionTimeUpdate, 0);
}

- (id)timeAtRtc:(double)a3
{
  if (![(TMLSLinkSource *)self isGizmo]) {
    sub_9E64();
  }
  if (self->_lastCompanionTimeUpdate)
  {
    id v4 = +[TMTime timeWithDictionary:](TMTime, "timeWithDictionary:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (double)rtcWhenBeyondUncertainty:(double)a3
{
  if (![(TMLSLinkSource *)self isGizmo]) {
    sub_9E90();
  }
  return INFINITY;
}

@end