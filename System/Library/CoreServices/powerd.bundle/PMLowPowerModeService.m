@interface PMLowPowerModeService
+ (id)sharedInstance;
- (BOOL)autoDisableCheck;
- (BOOL)autoDisableLowPowerMode;
- (BOOL)autoDisableWhenPluggedIn;
- (BOOL)dippedBelow;
- (BOOL)enabled;
- (BOOL)getDippedBelow;
- (BOOL)inLowPowerMode;
- (BOOL)isInternalBuild;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)perpetualMeadowEnabled;
- (BOOL)pluggedIn;
- (BOOL)readStateFromDefaults;
- (NSDate)stateChangeDate;
- (NSDictionary)params;
- (NSString)source;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)mainQueue;
- (PMLowPowerModeService)init;
- (double)autoDisableThreshold;
- (double)batteryChargeWhenEnabled;
- (double)batteryPercentage;
- (double)getBatteryChargeWhenEnabled;
- (id)readDateFromDefaults;
- (id)readParamsFromDefaults;
- (id)readSourceFromDefaults;
- (int)toggleState:(BOOL)a3 withDate:(id)a4 withBatteryLevel:(double)a5 fromSource:(id)a6 withParams:(id)a7;
- (void)autoEnableCheck;
- (void)batteryPercentageNotificationHandler:(int)a3;
- (void)initAnalyticsTimers;
- (void)lostModeCheck;
- (void)pluggedInNotificationHandler:(int)a3;
- (void)readPreferences;
- (void)reportStateToBiome:(BOOL)a3 fromSource:(id)a4;
- (void)saveDefaults:(BOOL)a3 date:(id)a4 batterylevel:(double)a5 source:(id)a6 withParams:(id)a7;
- (void)setAutoDisableThreshold:(double)a3;
- (void)setAutoDisableWhenPluggedIn:(BOOL)a3;
- (void)setBatteryChargeWhenEnabled:(double)a3;
- (void)setBatteryPercentage:(double)a3;
- (void)setDefaults:(id)a3;
- (void)setDippedBelow:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMainQueue:(id)a3;
- (void)setParams:(id)a3;
- (void)setPluggedIn:(BOOL)a3;
- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6;
- (void)setSource:(id)a3;
- (void)setStateChangeDate:(id)a3;
@end

@implementation PMLowPowerModeService

+ (id)sharedInstance
{
  if (qword_1000A46A8 != -1) {
    dispatch_once(&qword_1000A46A8, &stru_100091518);
  }
  v2 = (void *)qword_1000A46A0;

  return v2;
}

- (PMLowPowerModeService)init
{
  v24.receiver = self;
  v24.super_class = (Class)PMLowPowerModeService;
  v2 = [(PMLowPowerModeService *)&v24 initWithMachServiceName:@"com.apple.powerd.lowpowermode"];
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = objc_claimAutoreleasedReturnValue(),
        dispatch_queue_t v4 = dispatch_queue_create("com.apple.powerd.LowPowerMode.mainQueue", v3),
        mainQueue = v2->_mainQueue,
        v2->_mainQueue = (OS_dispatch_queue *)v4,
        mainQueue,
        v3,
        v2->_mainQueue))
  {
    [(PMLowPowerModeService *)v2 setDelegate:v2];
    os_log_t v6 = os_log_create("com.apple.powerd", "lowPowerMode");
    v7 = (void *)qword_1000A4698;
    qword_1000A4698 = (uint64_t)v6;

    v8 = (NSDate *)objc_alloc_init((Class)NSDate);
    stateChangeDate = v2->_stateChangeDate;
    v2->_stateChangeDate = v8;

    v10 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.lowpowermode.state"];
    defaults = v2->_defaults;
    v2->_defaults = v10;

    v12 = [(PMLowPowerModeService *)v2 mainQueue];
    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000FAB8;
    handler[3] = &unk_100091278;
    v14 = v2;
    v22 = v14;
    v15 = v13;
    v23 = v15;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_time_t v16 = dispatch_walltime(0, 2000000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(v15);
    v17 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "LPM: Initialized PMLowPowerModeService\n", (uint8_t *)v20, 2u);
    }
    v18 = v14;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)initAnalyticsTimers
{
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_mainQueue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100010200;
  handler[3] = &unk_100091278;
  void handler[4] = self;
  dispatch_source_t v8 = v3;
  dispatch_queue_t v4 = v3;
  dispatch_source_set_event_handler(v4, handler);
  v6.tv_sec = 0;
  v6.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v6);
  v6.tv_sec = v6.tv_sec + 86399 - 3600 * ((v6.tv_sec + 86399) % 24);
  dispatch_time_t v5 = dispatch_walltime(&v6, 0);
  dispatch_source_set_timer(v4, v5, 0x4E94914F0000uLL, 0xD18C2E2800uLL);
  dispatch_resume(v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  timespec v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____PMLowPowerModeProtocol];
  [v5 setExportedInterface:v6];

  v7 = [v5 valueForEntitlement:@"com.apple.powerd.lowpowermode.allow"];
  dispatch_source_t v8 = v7;
  if (v7 && [v7 BOOLValue])
  {
    [v5 setExportedObject:self];
    [v5 resume];
    v9 = (void *)qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v14[0] = 67109120;
      v14[1] = [v5 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LPM: listener: accepted new connection from PID %d\n", (uint8_t *)v14, 8u);
    }
    BOOL v11 = 1;
  }
  else
  {
    v12 = (void *)qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
      sub_10006408C(v12, v5);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (id)readSourceFromDefaults
{
  return [(NSUserDefaults *)self->_defaults stringForKey:@"source"];
}

- (BOOL)readStateFromDefaults
{
  [(NSUserDefaults *)self->_defaults synchronize];
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEBUG)) {
    sub_100064128();
  }
  dispatch_source_t v3 = [(NSUserDefaults *)self->_defaults valueForKey:@"state"];
  dispatch_queue_t v4 = qword_1000A4698;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      timespec v6 = v4;
      v9[0] = 67109120;
      v9[1] = [v3 BOOLValue];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LPM: Read defaults state=%d\n", (uint8_t *)v9, 8u);
    }
    unsigned __int8 v7 = [v3 BOOLValue];
  }
  else
  {
    if (v5)
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LPM: No previous defaults state found\n", (uint8_t *)v9, 2u);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)readDateFromDefaults
{
  v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"stateChangeDate"];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    [v3 setDateFormat:@"yyyy-LLL-dd HH:mm:ss ZZZZ"];
    dispatch_queue_t v4 = [v3 stringFromDate:v2];
    BOOL v5 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LPM: Read defaults date=%{public}@\n", (uint8_t *)&v9, 0xCu);
    }
    id v6 = v2;
  }
  else
  {
    unsigned __int8 v7 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LPM: No previous state for start date found\n", (uint8_t *)&v9, 2u);
    }
  }

  return v2;
}

- (id)readParamsFromDefaults
{
  v2 = [(NSUserDefaults *)self->_defaults objectForKey:@"params"];
  if (v2)
  {
    id v3 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LPM: Read defaults params=%{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

  return v2;
}

- (double)getBatteryChargeWhenEnabled
{
  double result = self->_batteryChargeWhenEnabled;
  double v3 = -1.0;
  if (result == -1.0)
  {
    dispatch_queue_t v4 = [(NSUserDefaults *)self->_defaults valueForKey:@"stateBatteryCharge"];
    int v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      double v3 = v6;
    }

    return v3;
  }
  return result;
}

- (BOOL)getDippedBelow
{
  if (self->_dippedBelow) {
    return 1;
  }
  double v3 = [(NSUserDefaults *)self->_defaults valueForKey:@"dippedBelow"];
  dispatch_queue_t v4 = v3;
  if (v3) {
    unsigned __int8 v2 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v2 = 0;
  }

  return v2;
}

- (void)saveDefaults:(BOOL)a3 date:(id)a4 batterylevel:(double)a5 source:(id)a6 withParams:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  [(NSUserDefaults *)self->_defaults setBool:v10 forKey:@"state"];
  [(NSUserDefaults *)self->_defaults setObject:v12 forKey:@"stateChangeDate"];
  [(NSUserDefaults *)self->_defaults setDouble:@"stateBatteryCharge" forKey:a5];
  defaults = self->_defaults;
  if (v13) {
    [(NSUserDefaults *)defaults setObject:v13 forKey:@"source"];
  }
  else {
    [(NSUserDefaults *)defaults removeObjectForKey:@"source"];
  }
  if (v14)
  {
    [(NSUserDefaults *)self->_defaults setObject:v14 forKey:@"params"];
    dispatch_time_t v16 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      *(void *)v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "LPM: Saved params=%{public}@ to defaults", (uint8_t *)&v20, 0xCu);
    }
  }
  [(NSUserDefaults *)self->_defaults synchronize];
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEBUG)) {
    sub_10006415C();
  }
  id v17 = objc_alloc_init((Class)NSDateFormatter);
  [v17 setDateFormat:@"yyyy-LLL-dd HH:mm:ss ZZZZ"];
  v18 = [v17 stringFromDate:v12];
  v19 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109634;
    *(_DWORD *)v21 = v10;
    *(_WORD *)&v21[4] = 2114;
    *(void *)&v21[6] = v18;
    __int16 v22 = 1024;
    int v23 = (int)a5;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "LPM: Saved state=%d date=%{public}@ battery=%d%% to defaults\n", (uint8_t *)&v20, 0x18u);
  }
}

- (int)toggleState:(BOOL)a3 withDate:(id)a4 withBatteryLevel:(double)a5 fromSource:(id)a6 withParams:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t state64 = 0;
  if (v10)
  {
    v15 = [(NSUserDefaults *)self->_defaults valueForKey:@"wasUsedBefore"];

    if (!v15)
    {
      dispatch_time_t v16 = [(NSUserDefaults *)self->_defaults valueForKey:@"inLostMode"];
      if (!v16)
      {
        notify_post((const char *)[@"com.apple.system.lowpowermode.first_time" UTF8String]);
        [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"wasUsedBefore"];
        [(NSUserDefaults *)self->_defaults synchronize];
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEBUG)) {
          sub_10006432C();
        }
      }
    }
  }
  if (notify_get_state(dword_1000A46B0, &state64))
  {
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
      sub_100063FA4();
    }
LABEL_16:
    int v21 = -1;
    goto LABEL_17;
  }
  if (self->_enabled != (state64 != 0))
  {
    id v17 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
      sub_1000642AC((uint64_t)&self->_enabled, &state64, v17);
    }
  }
  uint32_t v18 = notify_set_state(dword_1000A46B0, v10);
  if (v18)
  {
    int v19 = v18;
    int v20 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
      sub_100064210(v10, v19, v20);
    }
    goto LABEL_16;
  }
  p_enabled = &self->_enabled;
  uint64_t v23 = notify_post((const char *)[@"com.apple.system.lowpowermode" UTF8String]);
  if (v23)
  {
    uint64_t v24 = v23;
    v25 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
      sub_100064190(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  v32 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v60 = @"com.apple.system.lowpowermode";
    __int16 v61 = 1024;
    int v62 = v10;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "LPM: %{public}@ = %d\n", buf, 0x12u);
  }
  v33 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    v34 = "OFF";
    if (v10) {
      v34 = "ON";
    }
    *(_DWORD *)buf = 136446466;
    CFStringRef v60 = (const __CFString *)v34;
    __int16 v61 = 1024;
    int v62 = (int)a5;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "LPM: State is now %{public}s (battery:%d)", buf, 0x12u);
  }
  unsigned int v35 = [(PMLowPowerModeService *)self readStateFromDefaults];
  v36 = [(PMLowPowerModeService *)self readDateFromDefaults];
  v37 = v36;
  if (v35)
  {
    unsigned int v38 = 0;
    if (v12 && !v10 && v36)
    {
      if ([v36 compare:v12] == (id)-1)
      {
        [v12 timeIntervalSinceDate:v37];
        unsigned int v38 = fmin(v39 / 60.0, 1440.0);
      }
      else
      {
        unsigned int v38 = 0;
      }
    }
    if (v10) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (v10)
  {
    unsigned int v38 = 0;
LABEL_37:
    unsigned int v50 = v38;
    v52 = v37;
    +[NSNumber numberWithBool:v10];
    v40 = id v51 = v14;
    v41 = +[NSNumber numberWithDouble:a5];
    v42 = +[NSNumber numberWithBool:self->_pluggedIn];
    v43 = +[NSNumber numberWithUnsignedInt:v50];
    +[PMPowerModeAnalytics sendAnalyticsEvent:v40 withBatteryLevel:v41 fromSource:v13 withCharger:v42 withDurationInMinutes:v43 forStream:@"com.apple.powerd.lowpowermode.event"];

    v37 = v52;
    id v14 = v51;
  }
LABEL_38:
  [(PMLowPowerModeService *)self reportStateToBiome:v10 fromSource:v13];
  [(PMLowPowerModeService *)self saveDefaults:v10 date:v12 batterylevel:v13 source:v14 withParams:a5];
  p_source = &self->_source;
  objc_storeStrong((id *)&self->_source, a6);
  BOOL *p_enabled = v10;
  v45 = (NSDate *)[v12 copy];
  stateChangeDate = self->_stateChangeDate;
  self->_stateChangeDate = v45;

  self->_batteryChargeWhenEnabled = a5;
  if (v10)
  {
    if (v14) {
      objc_storeStrong((id *)&self->_params, a7);
    }
  }
  else
  {
    [(NSUserDefaults *)self->_defaults setBool:0 forKey:@"dippedBelow"];
    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"params"];
    [(NSUserDefaults *)self->_defaults synchronize];
    self->_dippedBelow = 0;
    params = self->_params;
    self->_params = 0;

    v48 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "LPM: toggleState cleared dippedBelow status and params\n", buf, 2u);
    }
  }
  if (&_PLLogTimeSensitiveRegisteredEvent)
  {
    v49 = *p_source;
    if (*p_enabled)
    {
      CFStringRef v57 = @"source";
      v58 = v49;
      +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    }
    else
    {
      CFStringRef v55 = @"source";
      v56 = v49;
      +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    }
    PLLogTimeSensitiveRegisteredEvent();
  }

  int v21 = 0;
LABEL_17:

  return v21;
}

- (void)reportStateToBiome:(BOOL)a3 fromSource:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  if ([v13 isEqualToString:kPMLPMSourceSpringBoardAlert])
  {
    uint64_t v5 = 3;
  }
  else if ([v13 isEqualToString:kPMLPMSourceReenableBulletin])
  {
    uint64_t v5 = 4;
  }
  else if ([v13 isEqualToString:kPMLPMSourceControlCenter])
  {
    uint64_t v5 = 5;
  }
  else if ([v13 isEqualToString:kPMLPMSourceSettings])
  {
    uint64_t v5 = 1;
  }
  else if ([v13 isEqualToString:kPMLPMSourceSiri])
  {
    uint64_t v5 = 2;
  }
  else if ([v13 isEqualToString:kPMLPMSourceLostMode])
  {
    uint64_t v5 = 6;
  }
  else if ([v13 isEqualToString:kPMLPMSourceSystemDisable])
  {
    uint64_t v5 = 7;
  }
  else if ([v13 isEqualToString:kPMLPMSourceWorkouts])
  {
    uint64_t v5 = 8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [objc_alloc((Class)BMEnergyMode) initWithMode:v6 reason:v5];
  dispatch_source_t v8 = BiomeLibrary();
  int v9 = [v8 Device];
  BOOL v10 = [v9 Power];
  BOOL v11 = [v10 EnergyMode];

  id v12 = [v11 source];
  [v12 sendEvent:v7];
}

- (void)autoEnableCheck
{
  if ([(PMLowPowerModeService *)self readStateFromDefaults])
  {
    double v3 = [(PMLowPowerModeService *)self readSourceFromDefaults];
    source = self->_source;
    self->_source = v3;

    uint64_t v5 = [(PMLowPowerModeService *)self readDateFromDefaults];
    uint64_t v6 = (NSDate *)[v5 copy];
    stateChangeDate = self->_stateChangeDate;
    self->_stateChangeDate = v6;

    self->_batteryChargeWhenEnabled = -1.0;
    [(PMLowPowerModeService *)self getBatteryChargeWhenEnabled];
    self->_batteryChargeWhenEnabled = v8;
    self->_dippedBelow = [(PMLowPowerModeService *)self getDippedBelow];
    int v9 = [(PMLowPowerModeService *)self readParamsFromDefaults];
    params = self->_params;
    self->_params = v9;

    if (self->_enabled)
    {
      BOOL v11 = qword_1000A4698;
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        id v12 = "LPM: Already enabled, not auto-enabling\n";
        id v13 = (uint8_t *)&v16;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else if ([(PMLowPowerModeService *)self autoDisableCheck])
    {
      BOOL v11 = qword_1000A4698;
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        id v12 = "LPM: Auto-disabled, not auto-enabling\n";
        id v13 = (uint8_t *)&v15;
        goto LABEL_11;
      }
    }
    else if ([(PMLowPowerModeService *)self toggleState:1 withDate:v5 withBatteryLevel:self->_source fromSource:self->_params withParams:self->_batteryChargeWhenEnabled]&& os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR))
    {
      sub_100064360();
    }
  }
  else
  {
    id v14 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "LPM: No saved state found, not auto-enabling\n", buf, 2u);
    }
    uint64_t v5 = 0;
  }
}

- (void)readPreferences
{
  CFPreferencesAppSynchronize(@"com.apple.powerd.lowpowermode");
  CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(@"autoDisableThreshold", @"com.apple.powerd.lowpowermode");
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID()) {
      CFNumberGetValue(v4, kCFNumberDoubleType, &self->_autoDisableThreshold);
    }
    CFRelease(v4);
  }
  else
  {
    self->_int autoDisableThreshold = 80.0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"autoDisableWhenPluggedIn", @"com.apple.powerd.lowpowermode", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    self->_BOOL autoDisableWhenPluggedIn = AppBooleanValue != 0;
  }
  else {
    self->_BOOL autoDisableWhenPluggedIn = 0;
  }
  id v7 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    int autoDisableThreshold = (int)self->_autoDisableThreshold;
    BOOL autoDisableWhenPluggedIn = self->_autoDisableWhenPluggedIn;
    *(_DWORD *)buf = 67109376;
    int v12 = autoDisableThreshold;
    __int16 v13 = 1024;
    BOOL v14 = autoDisableWhenPluggedIn;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LPM: readPreferences: autoDisableThreshold=%d%%, autoDisableWhenPluggedIn=%d\n", buf, 0xEu);
  }
}

- (void)lostModeCheck
{
  if (objc_opt_class())
  {
    CFNumberRef v3 = +[FMDFMIPManager sharedInstance];
    unsigned int v4 = [v3 isLostModeActive];

    if (v4)
    {
      CFTypeID v5 = qword_1000A4698;
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: FMiP entered lost mode\n", v22, 2u);
      }
      [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"inLostMode"];
      BOOL enabled = self->_enabled;
      id v7 = qword_1000A4698;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT);
      if (enabled)
      {
        if (v8)
        {
          *(_WORD *)__int16 v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: Low Power Mode is already enabled\n", v22, 2u);
        }
        int v9 = [(NSUserDefaults *)self->_defaults valueForKey:@"preLostModeState"];

        if (!v9)
        {
          BOOL v10 = qword_1000A4698;
          if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: saving pre-lost Low Power Mode state (1)\n", v22, 2u);
          }
          [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"preLostModeState"];
          [(NSUserDefaults *)self->_defaults synchronize];
          if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEBUG)) {
            sub_100064394();
          }
        }
        return;
      }
      if (v8)
      {
        *(_WORD *)__int16 v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: enabling Low Power Mode mode\n", v22, 2u);
      }
      uint32_t v18 = [(NSUserDefaults *)self->_defaults valueForKey:@"preLostModeState"];

      if (!v18)
      {
        int v19 = qword_1000A4698;
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: saving pre-lost Low Power Mode state (0)\n", v22, 2u);
        }
        [(NSUserDefaults *)self->_defaults setBool:0 forKey:@"preLostModeState"];
        [(NSUserDefaults *)self->_defaults synchronize];
      }
      __int16 v13 = +[NSDate date];
      [(PMLowPowerModeService *)self toggleState:1 withDate:v13 withBatteryLevel:kPMLPMSourceLostMode fromSource:0 withParams:self->_batteryPercentage];
    }
    else
    {
      int v12 = [(NSUserDefaults *)self->_defaults valueForKey:@"inLostMode"];
      __int16 v13 = v12;
      if (v12 && [v12 BOOLValue])
      {
        [(NSUserDefaults *)self->_defaults removeObjectForKey:@"inLostMode"];
        BOOL v14 = qword_1000A4698;
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: FMiP exited lost mode\n", v22, 2u);
        }
        __int16 v15 = [(NSUserDefaults *)self->_defaults valueForKey:@"preLostModeState"];
        unsigned int v16 = [v15 BOOLValue];

        [(NSUserDefaults *)self->_defaults removeObjectForKey:@"preLostModeState"];
        [(NSUserDefaults *)self->_defaults synchronize];
        if (v16)
        {
          id v17 = qword_1000A4698;
          if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: not disabling Low Power Mode (was enabled before)\n", v22, 2u);
          }
        }
        else
        {
          int v20 = +[NSDate date];
          int v21 = qword_1000A4698;
          if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v22 = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "LPM: checkLostMode: disabling Low Power Mode (was disabled before)\n", v22, 2u);
          }
          [(PMLowPowerModeService *)self toggleState:0 withDate:v20 withBatteryLevel:kPMLPMSourceLostMode fromSource:0 withParams:self->_batteryPercentage];
        }
      }
    }

    return;
  }
  BOOL v11 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "LPM: FMD is not available. Skipping lostModeCheck\n", v22, 2u);
  }
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  int v12 = (void (**)(id, void, void *))a6;
  if ((unint64_t)a3 >= 2)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Invalid Power Mode";
    unsigned int v16 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v17 = +[NSError errorWithDomain:@"Low Power Mode" code:1 userInfo:v16];
    v12[2](v12, 0, v17);
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    mainQueue = self->_mainQueue;
    uint32_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    int v20 = sub_100011DC8;
    int v21 = &unk_100091540;
    int64_t v26 = a3;
    __int16 v22 = self;
    id v23 = v10;
    id v24 = v11;
    v25 = &v27;
    dispatch_sync((dispatch_queue_t)mainQueue, &v18);
    int v14 = *((unsigned __int8 *)v28 + 24);
    if (*((unsigned char *)v28 + 24))
    {
      __int16 v15 = 0;
    }
    else
    {
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      CFStringRef v32 = @"Failed to update power mode";
      a3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v18, v19, v20, v21, v22, v23);
      __int16 v15 = +[NSError errorWithDomain:@"Low Power Mode" code:1 userInfo:a3];
    }
    ((void (**)(id, BOOL, void *))v12)[2](v12, v14 != 0, v15);
    if (!v14)
    {
    }
    _Block_object_dispose(&v27, 8);
  }
}

- (BOOL)autoDisableLowPowerMode
{
  CFNumberRef v3 = [(NSUserDefaults *)self->_defaults valueForKey:@"inLostMode"];
  unsigned int v4 = v3;
  if (v3 && [v3 BOOLValue])
  {
    CFTypeID v5 = qword_1000A4698;
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LPM: Not auto-disabled due to Lost Mode\n", (uint8_t *)v17, 2u);
      BOOL v6 = 0;
    }
  }
  else
  {
    id v7 = +[NSDate date];
    unsigned int v8 = [(PMLowPowerModeService *)self toggleState:0 withDate:v7 withBatteryLevel:kPMLPMSourceSystemDisable fromSource:0 withParams:self->_batteryPercentage];
    BOOL v6 = v8 == 0;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
        sub_100064494();
      }
    }
    else
    {
      uint32_t v9 = notify_set_state(dword_1000A46B4, 0);
      if (v9)
      {
        int v10 = v9;
        id v11 = qword_1000A4698;
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
          sub_1000643FC(v10, v11);
        }
      }
      notify_post((const char *)[@"com.apple.system.lowpowermode.auto_disabled" UTF8String]);
      int v12 = qword_1000A4698;
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
      {
        int batteryPercentage = (int)self->_batteryPercentage;
        int batteryChargeWhenEnabled = (int)self->_batteryChargeWhenEnabled;
        BOOL pluggedIn = self->_pluggedIn;
        v17[0] = 67109632;
        v17[1] = batteryPercentage;
        __int16 v18 = 1024;
        int v19 = batteryChargeWhenEnabled;
        __int16 v20 = 1024;
        BOOL v21 = pluggedIn;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LPM: auto-disabled (now:%d%%, whenEnabled:%d%%, plugged:%d)\n", (uint8_t *)v17, 0x14u);
      }
    }
  }
  return v6;
}

- (BOOL)autoDisableCheck
{
  CFNumberRef v3 = qword_1000A4698;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    BOOL pluggedIn = self->_pluggedIn;
    BOOL autoDisableWhenPluggedIn = self->_autoDisableWhenPluggedIn;
    int batteryChargeWhenEnabled = (int)self->_batteryChargeWhenEnabled;
    int autoDisableThreshold = (int)self->_autoDisableThreshold;
    int batteryPercentage = (int)self->_batteryPercentage;
    BOOL dippedBelow = self->_dippedBelow;
    int v22 = 67110656;
    *(_DWORD *)id v23 = pluggedIn;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = autoDisableWhenPluggedIn;
    __int16 v24 = 1024;
    int v25 = batteryChargeWhenEnabled;
    __int16 v26 = 1024;
    int v27 = autoDisableThreshold;
    __int16 v28 = 1024;
    int v29 = batteryPercentage;
    __int16 v30 = 1024;
    int v31 = autoDisableThreshold;
    __int16 v32 = 1024;
    BOOL v33 = dippedBelow;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LPM: autoDisableCheck: pluggedIn %d, autoDisableWhenPluggedIn %d, batteryChargeWhenEnabled %d%%, autoDisableThreshold %d%%, batteryPercentage %d%%, autoDisableThreshold %d%%, dippedBelow %d", (uint8_t *)&v22, 0x2Cu);
  }
  if (self->_params)
  {
    int v10 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      params = self->_params;
      int v22 = 138543362;
      *(void *)id v23 = params;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "LPM: autoDisableCheck: params %{public}@", (uint8_t *)&v22, 0xCu);
    }
  }
  if (![(PMLowPowerModeService *)self perpetualMeadowEnabled])
  {
    if (self->_params && self->_stateChangeDate)
    {
      int v14 = +[NSDate date];
      __int16 v15 = [(NSDictionary *)self->_params objectForKey:@"MinimumOnDays"];
      id v16 = [v15 intValue];

      if ((v16 - 1) < 3)
      {
        id v17 = [(NSDate *)self->_stateChangeDate dateByAddingTimeInterval:(double)(86400 * v16)];
        if ([v14 compare:v17] == (id)-1)
        {
          __int16 v20 = qword_1000A4698;
          BOOL v13 = 0;
          if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 138543362;
            *(void *)id v23 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "LPM: won't auto exit until at least %{public}@", (uint8_t *)&v22, 0xCu);
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = [(PMLowPowerModeService *)self autoDisableLowPowerMode];
        }

        return v13;
      }
      __int16 v18 = qword_1000A4698;
      if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_ERROR)) {
        sub_1000644C8((uint64_t)self, (uint64_t)v16, v18);
      }
    }
    if (self->_pluggedIn && self->_autoDisableWhenPluggedIn) {
      return [(PMLowPowerModeService *)self autoDisableLowPowerMode];
    }
    double v19 = self->_autoDisableThreshold;
    if (self->_batteryPercentage >= v19 && (self->_batteryChargeWhenEnabled < v19 || self->_dippedBelow)) {
      return [(PMLowPowerModeService *)self autoDisableLowPowerMode];
    }
    return 0;
  }
  int v12 = qword_1000A4698;
  BOOL v13 = 0;
  if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LPM: will not exit - perpetual meadow mode is enabled", (uint8_t *)&v22, 2u);
    return 0;
  }
  return v13;
}

- (BOOL)inLowPowerMode
{
  return self->_enabled;
}

- (void)batteryPercentageNotificationHandler:(int)a3
{
  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  int v4 = state64;
  double v5 = (double)state64;
  if (self->_batteryPercentage != v5)
  {
    BOOL v6 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LPM: monitor: batteryPercentage=%d%%\n", buf, 8u);
    }
    self->_int batteryPercentage = v5;
    if (self->_enabled)
    {
      if (self->_autoDisableThreshold > v5 && !self->_dippedBelow)
      {
        self->_BOOL dippedBelow = 1;
        [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"dippedBelow"];
        [(NSUserDefaults *)self->_defaults synchronize];
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEBUG)) {
          sub_10006454C();
        }
        id v7 = qword_1000A4698;
        if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LPM: monitor: recording dippedBelow event\n", buf, 2u);
        }
      }
      [(PMLowPowerModeService *)self autoDisableCheck];
    }
  }
}

- (void)pluggedInNotificationHandler:(int)a3
{
  int v4 = IOPSDrawingUnlimitedPower();
  if (self->_pluggedIn != v4)
  {
    BOOL v5 = v4;
    BOOL v6 = qword_1000A4698;
    if (os_log_type_enabled((os_log_t)qword_1000A4698, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LPM: monitor: pluggedIn=%d\n", (uint8_t *)v7, 8u);
    }
    self->_BOOL pluggedIn = v5;
    if (self->_enabled) {
      [(PMLowPowerModeService *)self autoDisableCheck];
    }
  }
}

- (BOOL)isInternalBuild
{
  if (qword_1000A46D0 != -1) {
    dispatch_once(&qword_1000A46D0, &stru_100091560);
  }
  return byte_1000A46C8;
}

- (BOOL)perpetualMeadowEnabled
{
  return 0;
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (double)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void)setBatteryPercentage:(double)a3
{
  self->_int batteryPercentage = a3;
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setPluggedIn:(BOOL)a3
{
  self->_BOOL pluggedIn = a3;
}

- (double)autoDisableThreshold
{
  return self->_autoDisableThreshold;
}

- (void)setAutoDisableThreshold:(double)a3
{
  self->_int autoDisableThreshold = a3;
}

- (BOOL)autoDisableWhenPluggedIn
{
  return self->_autoDisableWhenPluggedIn;
}

- (void)setAutoDisableWhenPluggedIn:(BOOL)a3
{
  self->_BOOL autoDisableWhenPluggedIn = a3;
}

- (NSDate)stateChangeDate
{
  return self->_stateChangeDate;
}

- (void)setStateChangeDate:(id)a3
{
}

- (double)batteryChargeWhenEnabled
{
  return self->_batteryChargeWhenEnabled;
}

- (void)setBatteryChargeWhenEnabled:(double)a3
{
  self->_int batteryChargeWhenEnabled = a3;
}

- (BOOL)dippedBelow
{
  return self->_dippedBelow;
}

- (void)setDippedBelow:(BOOL)a3
{
  self->_BOOL dippedBelow = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_stateChangeDate, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end