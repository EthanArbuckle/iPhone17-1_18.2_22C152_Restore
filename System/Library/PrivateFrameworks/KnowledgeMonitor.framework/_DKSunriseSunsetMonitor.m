@interface _DKSunriseSunsetMonitor
+ (id)entitlements;
+ (id)eventStream;
- (BOOL)awaitingLocationAfterDisabledAirplaneMode;
- (BOOL)currentSunriseSunsetTimes:(id)a3 differsFromPreviousTimes:(id)a4 byInterval:(double)a5;
- (BOOL)enabled;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isAirplaneModeEnabledWithPreferences:(__SCPreferences *)a3;
- (CLLocationManager)manager;
- (NSDictionary)previousDataDictionary;
- (OS_dispatch_source)updateTimer;
- (OS_os_log)log;
- (_DKSunriseSunsetMonitor)init;
- (__SCPreferences)radioPrefs;
- (id)contextDictionaryWithGeoAlmanac:(id)a3 authorizationStatus:(int)a4;
- (id)loadState;
- (int)authorizationStatus;
- (unint64_t)updateInterval;
- (void)dealloc;
- (void)init;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)respondToAirplaneModeStatusChanged;
- (void)respondToTimeChange:(id)a3;
- (void)setAuthorizationStatus:(int)a3;
- (void)setAwaitingLocationAfterDisabledAirplaneMode:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setManager:(id)a3;
- (void)setPreviousDataDictionary:(id)a3;
- (void)setRadioPrefs:(__SCPreferences *)a3;
- (void)setUpdateInterval:(unint64_t)a3;
- (void)setUpdateTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)unprotectedUpdateSunriseSunsetTime:(id)a3;
@end

@implementation _DKSunriseSunsetMonitor

+ (id)eventStream
{
  return @"SunriseSunset";
}

+ (id)entitlements
{
  return &unk_26D86D8A8;
}

- (_DKSunriseSunsetMonitor)init
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)_DKSunriseSunsetMonitor;
  id v2 = [(_DKMonitor *)&v41 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetknowledged", "sunrisesunsetmonitor");
    v4 = (void *)*((void *)v2 + 23);
    *((void *)v2 + 23) = v3;

    v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v5 doubleForKey:@"sunriseSunsetUpdateIntervalSeconds"];
    if (*(double *)&v6 == 0.0) {
      uint64_t v6 = kUpdateIntervalSeconds;
    }
    else {
      kUpdateIntervalSeconds = v6;
    }
    *((void *)v2 + 20) = (unint64_t)*(double *)&v6;
    v7 = [v2 queue];
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
    v9 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 19), 0, 1000000000 * *((void *)v2 + 20), 1000000000 * *((void *)v2 + 20) / 0xAuLL);
    v10 = *((void *)v2 + 19);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __31___DKSunriseSunsetMonitor_init__block_invoke;
    handler[3] = &unk_264714788;
    id v11 = v2;
    id v40 = v11;
    dispatch_source_set_event_handler(v10, handler);
    v12 = [v11 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_2;
    block[3] = &unk_264714788;
    v13 = (id *)v11;
    v38 = v13;
    dispatch_sync(v12, block);

    [v13[21] setDesiredAccuracy:*MEMORY[0x263F00B50]];
    *((_DWORD *)v13 + 37) = 0;
    v14 = [v13 queue];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_3;
    v35[3] = &unk_264714788;
    v15 = v13;
    v36 = v15;
    v16 = v35;
    v17 = (CFStringRef (__cdecl *)(const void *))os_transaction_create();
    context.version = MEMORY[0x263EF8330];
    context.info = (void *)3221225472;
    context.retain = (const void *(__cdecl *)(const void *))__cd_dispatch_async_capture_tx_block_invoke_9;
    context.release = (void (__cdecl *)(const void *))&unk_2647148A0;
    context.copyDescription = v17;
    id v43 = v16;
    v18 = v17;
    dispatch_async(v14, &context);

    v19 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.duetknowledged.sunrisesunset.airplaneMode", @"com.apple.radios.plist");
    v15[24] = v19;
    if (v19)
    {
      context.version = 0;
      memset(&context.retain, 0, 24);
      context.info = v15;
      if (SCPreferencesSetCallback(v19, (SCPreferencesCallBack)scRadioPreferencesCallBackHandler_0, &context))
      {
        v20 = (const __SCPreferences *)v15[24];
        v21 = [v15 queue];
        LODWORD(v20) = SCPreferencesSetDispatchQueue(v20, v21);

        if (!v20)
        {
          v22 = *((void *)v2 + 23);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[_DKSunriseSunsetMonitor init](v22);
          }
        }
      }
      else
      {
        v24 = *((void *)v2 + 23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DKSunriseSunsetMonitor init](v24);
        }
      }
    }
    else
    {
      v23 = *((void *)v2 + 23);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_DKSunriseSunsetMonitor init](v23);
      }
    }
    v25 = *((void *)v2 + 23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = NSNumber;
      uint64_t v27 = *((unsigned int *)v13 + 37);
      v28 = v25;
      v29 = [v26 numberWithInt:v27];
      LODWORD(context.version) = 138412290;
      *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v29;
      _os_log_impl(&dword_225002000, v28, OS_LOG_TYPE_DEFAULT, "Location authorization status: %@", (uint8_t *)&context, 0xCu);
    }
    v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v15 selector:sel_respondToTimeChange_ name:*MEMORY[0x263EFF5C8] object:0];

    LODWORD(context.version) = 0;
    v31 = [v15 queue];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_32;
    v33[3] = &unk_264714B68;
    v34 = v15;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)&context, v31, v33);
  }
  return (_DKSunriseSunsetMonitor *)v2;
}

- (void)dealloc
{
  [(_DKSunriseSunsetMonitor *)self deactivate];
  if (self->_enabled)
  {
    updateTimer = self->_updateTimer;
    if (updateTimer)
    {
      dispatch_source_cancel(updateTimer);
      dispatch_resume((dispatch_object_t)self->_updateTimer);
      self->_enabled = 0;
      v4 = self->_updateTimer;
      self->_updateTimer = 0;
    }
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  radioPrefs = self->_radioPrefs;
  if (radioPrefs) {
    CFRelease(radioPrefs);
  }
  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263EFF5C8] object:0];

  v8.receiver = self;
  v8.super_class = (Class)_DKSunriseSunsetMonitor;
  [(_DKMonitor *)&v8 dealloc];
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSunriseSunsetMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsActivation])
  {
    self->_enabled = 1;
    dispatch_resume((dispatch_object_t)self->_updateTimer);
  }
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)_DKSunriseSunsetMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsDeactivation])
  {
    objc_super v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31___DKSunriseSunsetMonitor_stop__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);

    [(_DKSunriseSunsetMonitor *)self deactivate];
  }
}

- (id)contextDictionaryWithGeoAlmanac:(id)a3 authorizationStatus:(int)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 && a4 != 3)
  {
    v24 = [MEMORY[0x263F351D0] sunriseSunsetAvailabilityStatusKey];
    v46 = v24;
    v47[0] = &unk_26D86D9E8;
    v25 = NSDictionary;
    v26 = (void **)v47;
    uint64_t v27 = &v46;
LABEL_31:
    v23 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
    goto LABEL_32;
  }
  if (!v5)
  {
    v24 = [MEMORY[0x263F351D0] sunriseSunsetAvailabilityStatusKey];
    uint64_t v44 = v24;
    v45 = &unk_26D86DA00;
    v25 = NSDictionary;
    v26 = &v45;
    uint64_t v27 = &v44;
    goto LABEL_31;
  }
  uint64_t v7 = [v5 isDayLightForTime:CFAbsoluteTimeGetCurrent()];
  uint64_t v8 = [MEMORY[0x263F351D0] sunriseSunsetAvailabilityStatusKey];
  v42[0] = v8;
  v43[0] = &unk_26D86DA18;
  id v40 = [MEMORY[0x263F351D0] currentSunriseKey];
  v42[1] = v40;
  uint64_t v9 = [v6 sunrise];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF910] distantFuture];
  }
  v32 = (void *)v9;
  v43[1] = v9;
  v38 = [MEMORY[0x263F351D0] currentSunsetKey];
  v42[2] = v38;
  uint64_t v11 = [v6 sunset];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
  }
  v31 = (void *)v11;
  v43[2] = v11;
  v36 = [MEMORY[0x263F351D0] nextSunriseKey];
  v42[3] = v36;
  uint64_t v13 = [v6 nextSunrise];
  v35 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x263EFF910] distantFuture];
  }
  v37 = v12;
  v39 = v10;
  v30 = (void *)v13;
  v43[3] = v13;
  v34 = [MEMORY[0x263F351D0] nextSunsetKey];
  v42[4] = v34;
  uint64_t v14 = [v6 nextSunset];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF910] distantPast];
  }
  objc_super v41 = (void *)v8;
  v29 = (void *)v14;
  v43[4] = v14;
  v33 = [MEMORY[0x263F351D0] previousSunriseKey];
  v42[5] = v33;
  v16 = [v6 previousSunrise];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x263EFF910] distantFuture];
  }
  v43[5] = v17;
  v18 = [MEMORY[0x263F351D0] previousSunsetKey];
  v42[6] = v18;
  v19 = [v6 previousSunset];
  v20 = v19;
  if (!v19)
  {
    v20 = [MEMORY[0x263EFF910] distantPast];
  }
  v43[6] = v20;
  v21 = [MEMORY[0x263F351D0] isDaylightKey];
  v42[7] = v21;
  v22 = [NSNumber numberWithBool:v7];
  v43[7] = v22;
  v23 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:8];

  if (!v19) {
  if (!v16)
  }

  v24 = v41;
  if (!v15) {

  }
  if (!v35) {
  if (!v37)
  }

  if (!v39) {
LABEL_32:
  }

  return v23;
}

- (BOOL)currentSunriseSunsetTimes:(id)a3 differsFromPreviousTimes:(id)a4 byInterval:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263F351D0] sunriseSunsetAvailabilityStatusKey];
  v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [MEMORY[0x263F351D0] sunriseSunsetAvailabilityStatusKey];
  v12 = [v7 objectForKeyedSubscript:v11];
  int v13 = [v10 isEqual:v12];

  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = [MEMORY[0x263F351D0] isDaylightKey];
  v15 = [v8 objectForKeyedSubscript:v14];
  v16 = [MEMORY[0x263F351D0] isDaylightKey];
  v17 = [v7 objectForKeyedSubscript:v16];
  int v18 = [v15 isEqual:v17];

  if (v18)
  {
    v19 = [MEMORY[0x263F351D0] currentSunriseKey];
    v20 = [v8 objectForKeyedSubscript:v19];

    v21 = [MEMORY[0x263F351D0] currentSunriseKey];
    v22 = [v7 objectForKeyedSubscript:v21];

    v23 = [MEMORY[0x263F351D0] nextSunriseKey];
    v24 = [v8 objectForKeyedSubscript:v23];

    v25 = [MEMORY[0x263F351D0] nextSunriseKey];
    v26 = [v7 objectForKeyedSubscript:v25];

    uint64_t v27 = [MEMORY[0x263F351D0] previousSunriseKey];
    v28 = [v8 objectForKeyedSubscript:v27];

    v29 = [MEMORY[0x263F351D0] previousSunriseKey];
    v30 = [v7 objectForKeyedSubscript:v29];

    BOOL v34 = 1;
    if ((v20 == 0) != (v22 != 0) && (v28 == 0) != (v30 != 0) && (v24 == 0) != (v26 != 0))
    {
      if (!v22 || ([v22 timeIntervalSinceDate:v20], fabs(v31) < a5))
      {
        if (!v30 || ([v30 timeIntervalSinceDate:v28], fabs(v32) < a5))
        {
          if (!v26 || ([v26 timeIntervalSinceDate:v24], fabs(v33) < a5)) {
            BOOL v34 = 0;
          }
        }
      }
    }
  }
  else
  {
LABEL_13:
    BOOL v34 = 1;
  }

  return v34;
}

- (void)unprotectedUpdateSunriseSunsetTime:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_enabled)
  {
    dispatch_suspend((dispatch_object_t)self->_updateTimer);
    [(CLLocationManager *)self->_manager stopUpdatingLocation];
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = [(CLLocationManager *)self->_manager location];
    }
    uint64_t v6 = v5;
    if (self->_awaitingLocationAfterDisabledAirplaneMode) {
      goto LABEL_6;
    }
    if (![(_DKSunriseSunsetMonitor *)self isAirplaneModeEnabled] || v6)
    {
      if (v6) {
        goto LABEL_21;
      }
    }
    else if (self->_authorizationStatus == 3)
    {
LABEL_6:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
        -[_DKSunriseSunsetMonitor unprotectedUpdateSunriseSunsetTime:](log);
      }
      goto LABEL_33;
    }
    id v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_DEFAULT, "Location unknown", (uint8_t *)&v33, 2u);
    }
    previousDataDictionary = self->_previousDataDictionary;
    v10 = [MEMORY[0x263F351D0] currentSunriseKey];
    uint64_t v11 = [(NSDictionary *)previousDataDictionary objectForKeyedSubscript:v10];
    if (v11)
    {
    }
    else
    {
      int authorizationStatus = self->_authorizationStatus;

      if (authorizationStatus == 3)
      {
        int v13 = self->_log;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          _os_log_impl(&dword_225002000, v13, OS_LOG_TYPE_DEFAULT, "Attempt to request location", (uint8_t *)&v33, 2u);
        }
        [(CLLocationManager *)self->_manager startUpdatingLocation];
        uint64_t v6 = [(_DKSunriseSunsetMonitor *)self contextDictionaryWithGeoAlmanac:0 authorizationStatus:self->_authorizationStatus];
        uint64_t v14 = [MEMORY[0x263F351B8] userContext];
        v15 = [MEMORY[0x263F351D0] keyPathForSunriseSunsetDataDictionary];
        [v14 setObject:v6 forKeyedSubscript:v15];
        goto LABEL_32;
      }
    }
LABEL_21:
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = NSNumber;
      uint64_t v18 = self->_authorizationStatus;
      v19 = v16;
      v20 = [v17 numberWithInt:v18];
      v21 = self->_previousDataDictionary;
      int v33 = 138412546;
      BOOL v34 = v20;
      __int16 v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_225002000, v19, OS_LOG_TYPE_DEFAULT, "Not requesting location (%@, %@)", (uint8_t *)&v33, 0x16u);
    }
    if (v6)
    {
      uint64_t v14 = objc_opt_new();
      [v6 coordinate];
      double v23 = v22;
      [v6 coordinate];
      objc_msgSend(v14, "calculateAstronomicalTimeForLocation:altitudeInDegrees:", v23);
    }
    else
    {
      uint64_t v14 = 0;
    }
    v15 = [(_DKSunriseSunsetMonitor *)self contextDictionaryWithGeoAlmanac:v14 authorizationStatus:self->_authorizationStatus];
    p_previousDataDictionary = &self->_previousDataDictionary;
    BOOL v25 = [(_DKSunriseSunsetMonitor *)self currentSunriseSunsetTimes:v15 differsFromPreviousTimes:self->_previousDataDictionary byInterval:5.0];
    v26 = self->_log;
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        int v33 = 138412290;
        BOOL v34 = v15;
        _os_log_impl(&dword_225002000, v26, OS_LOG_TYPE_DEFAULT, "Saving new values: %@", (uint8_t *)&v33, 0xCu);
      }
      v28 = [MEMORY[0x263F351B8] userContext];
      v29 = [MEMORY[0x263F351D0] keyPathForSunriseSunsetDataDictionary];
      [v28 setObject:v15 forKeyedSubscript:v29];

      objc_storeStrong((id *)p_previousDataDictionary, v15);
    }
    else if (v27)
    {
      v30 = *p_previousDataDictionary;
      int v33 = 138412546;
      BOOL v34 = v15;
      __int16 v35 = 2112;
      v36 = v30;
      _os_log_impl(&dword_225002000, v26, OS_LOG_TYPE_DEFAULT, "Not saving new values: %@ (Old=%@)", (uint8_t *)&v33, 0x16u);
    }
LABEL_32:

LABEL_33:
    updateTimer = self->_updateTimer;
    dispatch_time_t v32 = dispatch_time(0, 1000000000 * self->_updateInterval);
    dispatch_source_set_timer(updateTimer, v32, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * self->_updateInterval / 0xA);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
  }
}

- (void)respondToTimeChange:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225002000, log, OS_LOG_TYPE_DEFAULT, "Time changed; reevaluating sunrise/sunset times", buf, 2u);
  }
  id v5 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___DKSunriseSunsetMonitor_respondToTimeChange___block_invoke;
  block[3] = &unk_264714788;
  void block[4] = self;
  dispatch_sync(v5, block);
}

- (void)respondToAirplaneModeStatusChanged
{
  if (self->_authorizationStatus == 3)
  {
    BOOL v3 = [(_DKSunriseSunsetMonitor *)self isAirplaneModeEnabled];
    self->_awaitingLocationAfterDisabledAirplaneMode = !v3;
    if (!v3)
    {
      manager = self->_manager;
      [(CLLocationManager *)manager startUpdatingLocation];
    }
  }
  else
  {
    self->_awaitingLocationAfterDisabledAirplaneMode = 0;
  }
}

- (BOOL)isAirplaneModeEnabled
{
  BOOL v3 = [(_DKSunriseSunsetMonitor *)self radioPrefs];
  return [(_DKSunriseSunsetMonitor *)self isAirplaneModeEnabledWithPreferences:v3];
}

- (BOOL)isAirplaneModeEnabledWithPreferences:(__SCPreferences *)a3
{
  if (a3)
  {
    SCPreferencesLock(a3, 1u);
    BOOL v4 = SCPreferencesGetValue(a3, @"AirplaneMode") == (CFPropertyListRef)*MEMORY[0x263EFFB40];
    SCPreferencesUnlock(a3);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[_DKSunriseSunsetMonitor isAirplaneModeEnabledWithPreferences:](log);
    }
    return 0;
  }
  return v4;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if ([a3 isEqual:self->_manager])
  {
    if (self->_authorizationStatus != a4)
    {
      self->_int authorizationStatus = a4;
      uint64_t v6 = [(_DKMonitor *)self queue];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __72___DKSunriseSunsetMonitor_locationManager_didChangeAuthorizationStatus___block_invoke;
      v10[3] = &unk_264714788;
      v10[4] = self;
      id v7 = v10;
      id v8 = (void *)os_transaction_create();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
      block[3] = &unk_2647148A0;
      id v12 = v8;
      id v13 = v7;
      id v9 = v8;
      dispatch_async(v6, block);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  self->_awaitingLocationAfterDisabledAirplaneMode = 0;
  if ([v5 count])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, log, OS_LOG_TYPE_INFO, "Obtained new location", buf, 2u);
    }
  }
  id v7 = [(_DKMonitor *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62___DKSunriseSunsetMonitor_locationManager_didUpdateLocations___block_invoke;
  v12[3] = &unk_2647147D8;
  v12[4] = self;
  id v13 = v5;
  id v8 = v12;
  id v9 = v5;
  v10 = (void *)os_transaction_create();
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __cd_dispatch_async_capture_tx_block_invoke_9;
  v17 = &unk_2647148A0;
  id v18 = v10;
  id v19 = v8;
  id v11 = v10;
  dispatch_async(v7, buf);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  self->_awaitingLocationAfterDisabledAirplaneMode = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_source)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (unint64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(unint64_t)a3
{
  self->_updateInterval = a3;
}

- (CLLocationManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSDictionary)previousDataDictionary
{
  return self->_previousDataDictionary;
}

- (void)setPreviousDataDictionary:(id)a3
{
}

- (BOOL)awaitingLocationAfterDisabledAirplaneMode
{
  return self->_awaitingLocationAfterDisabledAirplaneMode;
}

- (void)setAwaitingLocationAfterDisabledAirplaneMode:(BOOL)a3
{
  self->_awaitingLocationAfterDisabledAirplaneMode = a3;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_int authorizationStatus = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (__SCPreferences)radioPrefs
{
  return self->_radioPrefs;
}

- (void)setRadioPrefs:(__SCPreferences *)a3
{
  self->_radioPrefs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_previousDataDictionary, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

- (void)init
{
  id v1 = a1;
  int v2 = SCError();
  SCErrorString(v2);
  OUTLINED_FUNCTION_0_0(&dword_225002000, v3, v4, "SCPreferencesSetDispatchQueue() failed: %s", v5, v6, v7, v8, 2u);
}

- (void)unprotectedUpdateSunriseSunsetTime:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "Didn't update information!", v1, 2u);
}

- (void)isAirplaneModeEnabledWithPreferences:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_225002000, log, OS_LOG_TYPE_ERROR, "SCPreferencesRef is nil", v1, 2u);
}

@end