@interface ATXPredictionContextBuilder
+ (id)loadContextOverrideFromJSONFile:(id)a3;
+ (id)sharedInstance;
- (ATXPredictionContextBuilder)init;
- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8;
- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8 contextStream:(id)a9 biomeStreamsInitialized:(BOOL)a10;
- (BOOL)tryInitBiomeStreamsAndReturnSuccess:(id)a3;
- (BOOL)tryInitContextSourcesAndReturnSuccess:(id)a3;
- (NSDate)now;
- (_PASLock)lock;
- (id)_getContextForOverrideKey:(id)a3 fromContextOverride:(id)a4 withDefaultContext:(id)a5 allowNilValues:(BOOL)a6;
- (id)ambientLightContextForContextOverride:(id)a3 guardedData:(id)a4;
- (id)ambientLightContextForCurrentContext:(id)a3;
- (id)deviceStateContextForContextOverride:(id)a3 guardedData:(id)a4;
- (id)deviceStateContextForCurrentContext:(id)a3;
- (id)locationMotionContextForContextOverride:(id)a3 guardedData:(id)a4;
- (id)locationMotionContextForCurrentContext:(id)a3;
- (id)predictionContextForContextOverride:(id)a3;
- (id)predictionContextForCurrentContext;
- (id)predictionContextForCurrentContextAndCandidatePublisher:(id)a3 contextOverride:(id)a4;
- (id)timeContextForContextOverride:(id)a3 guardedData:(id)a4;
- (id)timeContextForCurrentContext:(id)a3;
- (id)updateContextStreamAndReturnPredictionContextForCurrentContext;
- (id)userContextForContextOverride:(id)a3 guardedData:(id)a4;
- (id)userContextForCurrentContext:(id)a3;
- (void)setNow:(id)a3;
@end

@implementation ATXPredictionContextBuilder

- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = objc_opt_new();
  LOBYTE(v21) = 1;
  v19 = [(ATXPredictionContextBuilder *)self initWithAppInfoManager:v17 locationManager:v16 motionManagerWrapper:v15 ambientLightMonitor:v14 deviceStateMonitorClass:a7 contextSourcesInitialized:v8 contextStream:v18 biomeStreamsInitialized:v21];

  return v19;
}

- (ATXPredictionContextBuilder)initWithAppInfoManager:(id)a3 locationManager:(id)a4 motionManagerWrapper:(id)a5 ambientLightMonitor:(id)a6 deviceStateMonitorClass:(Class)a7 contextSourcesInitialized:(BOOL)a8 contextStream:(id)a9 biomeStreamsInitialized:(BOOL)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ATXPredictionContextBuilder;
  uint64_t v21 = [(ATXPredictionContextBuilder *)&v26 init];
  if (v21)
  {
    v22 = objc_opt_new();
    [v22 updateAppInfoManager:v16 locationManager:v17 motionManagerWrapper:v18 ambientLightMonitor:v19 deviceStateMonitorClass:a7 contextSourcesInitialized:v10];
    [v22 updatePredictionContextStream:v20 biomeStreamsInitialized:a10];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v22];
    lock = v21->_lock;
    v21->_lock = (_PASLock *)v23;
  }
  return v21;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATXPredictionContextBuilder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_6, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_7;
  return v2;
}

void __45__ATXPredictionContextBuilder_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  objc_opt_class();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_7;
  sharedInstance__pasExprOnceResult_7 = v1;
}

- (ATXPredictionContextBuilder)init
{
  LOBYTE(v3) = 0;
  return [(ATXPredictionContextBuilder *)self initWithAppInfoManager:0 locationManager:0 motionManagerWrapper:0 ambientLightMonitor:0 deviceStateMonitorClass:0 contextSourcesInitialized:0 contextStream:0 biomeStreamsInitialized:v3];
}

- (BOOL)tryInitContextSourcesAndReturnSuccess:(id)a3
{
  id v3 = a3;
  if (([v3 contextSourcesInitialized] & 1) == 0
    && ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    v4 = +[_ATXAppInfoManager sharedInstance];
    v5 = [MEMORY[0x1E4F935D0] sharedInstance];
    v6 = [MEMORY[0x1E4F93610] sharedInstance];
    v7 = +[ATXAmbientLightMonitor sharedInstance];
    [v3 updateAppInfoManager:v4 locationManager:v5 motionManagerWrapper:v6 ambientLightMonitor:v7 deviceStateMonitorClass:objc_opt_class() contextSourcesInitialized:1];
  }
  char v8 = [v3 contextSourcesInitialized];

  return v8;
}

- (BOOL)tryInitBiomeStreamsAndReturnSuccess:(id)a3
{
  id v3 = a3;
  if (([v3 biomeStreamsInitialized] & 1) == 0)
  {
    v4 = objc_opt_new();
    [v3 updatePredictionContextStream:v4 biomeStreamsInitialized:1];
  }
  char v5 = [v3 biomeStreamsInitialized];

  return v5;
}

- (id)deviceStateContextForCurrentContext:(id)a3
{
  id v3 = a3;
  v4 = [ATXPredictionDeviceStateContext alloc];
  char v5 = objc_msgSend((id)objc_msgSend(v3, "deviceStateMonitorClass"), "SSID");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v3, "deviceStateMonitorClass"), "onWifi");
  v7 = (void *)[v3 deviceStateMonitorClass];

  char v8 = -[ATXPredictionDeviceStateContext initWithWifiSSID:onWifi:inAirplaneMode:](v4, "initWithWifiSSID:onWifi:inAirplaneMode:", v5, v6, [v7 airplaneMode]);
  return v8;
}

- (id)timeContextForCurrentContext:(id)a3
{
  v4 = [ATXPredictionTimeContext alloc];
  char v5 = [(ATXPredictionContextBuilder *)self now];
  uint64_t v6 = [(ATXPredictionTimeContext *)v4 initWithDate:v5];

  return v6;
}

- (id)locationMotionContextForCurrentContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 locationManager];
  char v5 = [v4 previousLOIAndCurrentLOI];

  uint64_t v6 = [v3 motionManagerWrapper];
  v7 = [v6 getCurrentActivity];

  char v8 = [ATXPredictionLocationMotionContext alloc];
  v29 = v5;
  v27 = [v5 second];
  objc_super v26 = [v5 first];
  uint64_t v25 = [v7 motiontype];
  v28 = [v3 locationManager];
  v9 = [v28 getCurrentLocation];
  BOOL v10 = [v3 locationManager];
  uint64_t v11 = [v10 locationEnabled];
  v12 = [v3 locationManager];
  [v12 distanceFromHomeOfCurrentLocationInMeters];
  double v14 = v13;
  id v15 = [v3 locationManager];
  [v15 distanceFromWorkOfCurrentLocationInMeters];
  double v17 = v16;
  id v18 = [v3 locationManager];
  [v18 distanceFromSchoolOfCurrentLocationInMeters];
  double v20 = v19;
  uint64_t v21 = [v3 locationManager];

  [v21 distanceFromGymOfCurrentLocationInMeters];
  uint64_t v23 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](v8, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v27, v26, v25, v9, v11, [v7 canPredictClipsGivenRecentMotion], v14, v17, v20, v22);

  return v23;
}

- (id)ambientLightContextForCurrentContext:(id)a3
{
  id v3 = a3;
  v4 = [ATXPredictionAmbientLightContext alloc];
  char v5 = [v3 ambientLightMonitor];

  uint64_t v6 = -[ATXPredictionAmbientLightContext initWithAmbientLightType:](v4, "initWithAmbientLightType:", [v5 getCurrentAmbientLightType]);
  return v6;
}

- (id)userContextForCurrentContext:(id)a3
{
  id v3 = a3;
  v4 = [ATXPredictionUserContext alloc];
  double v16 = [v3 appInfoManager];
  char v5 = [v16 lastUnlockDate];
  uint64_t v6 = [v3 appInfoManager];
  v7 = [v6 lastAppLaunch];
  char v8 = [v3 appInfoManager];
  v9 = [v8 lastAppLaunchDate];
  BOOL v10 = [v3 appInfoManager];
  uint64_t v11 = [v10 secondMostRecentAppLaunch];
  v12 = [v3 appInfoManager];

  double v13 = [v12 lastAppActionLaunch];
  double v14 = [(ATXPredictionUserContext *)v4 initWithLastUnlockDate:v5 lastAppLaunch:v7 lastAppLaunchDate:v9 secondMostRecentAppLaunch:v11 lastAppActionLaunch:v13];

  return v14;
}

- (id)predictionContextForCurrentContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  BOOL v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__ATXPredictionContextBuilder_predictionContextForCurrentContext__block_invoke;
  v5[3] = &unk_1E68ADC08;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __65__ATXPredictionContextBuilder_predictionContextForCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tryInitContextSourcesAndReturnSuccess:"))
  {
    id v3 = [ATXPredictionContext alloc];
    v4 = [*(id *)(a1 + 32) deviceStateContextForCurrentContext:v12];
    char v5 = [*(id *)(a1 + 32) timeContextForCurrentContext:v12];
    uint64_t v6 = [*(id *)(a1 + 32) locationMotionContextForCurrentContext:v12];
    v7 = [*(id *)(a1 + 32) ambientLightContextForCurrentContext:v12];
    uint64_t v8 = [*(id *)(a1 + 32) userContextForCurrentContext:v12];
    uint64_t v9 = [(ATXPredictionContext *)v3 initWithDeviceStateContext:v4 timeContext:v5 locationMotionContext:v6 ambientLightContext:v7 userContext:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)updateContextStreamAndReturnPredictionContextForCurrentContext
{
  id v3 = [(ATXPredictionContextBuilder *)self predictionContextForCurrentContext];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__23;
  v13[4] = __Block_byref_object_dispose__23;
  id v14 = 0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke;
  v12[3] = &unk_1E68ADC30;
  v12[4] = v13;
  [(_PASLock *)lock runWithLockAcquired:v12];
  char v5 = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke_2;
  v10[3] = &unk_1E68ADC58;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  [(_PASLock *)v5 runWithLockAcquired:v10];
  v7 = v11;
  id v8 = v6;

  _Block_object_dispose(v13, 8);
  return v8;
}

void __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 locationManager];
  uint64_t v3 = [v6 getCurrentLocation];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __93__ATXPredictionContextBuilder_updateContextStreamAndReturnPredictionContextForCurrentContext__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) tryInitBiomeStreamsAndReturnSuccess:v3] && *(void *)(a1 + 40))
  {
    CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(0.0, 0.0);
    char v5 = [*(id *)(a1 + 40) locationMotionContext];
    id v6 = [v5 currentLOI];
    objc_msgSend(v6, "setCoordinate:", v4.latitude, v4.longitude);

    CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(0.0, 0.0);
    id v8 = [*(id *)(a1 + 40) locationMotionContext];
    uint64_t v9 = [v8 previousLOI];
    objc_msgSend(v9, "setCoordinate:", v7.latitude, v7.longitude);

    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v14 = 138412290;
      id v15 = v12;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - updating prediction context Biome stream.", (uint8_t *)&v14, 0xCu);
    }
    double v13 = [v3 predictionContextStream];
    [v13 sendEvent:*(void *)(a1 + 40)];
  }
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    id v3 = now;
  }
  else {
    id v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (id)_getContextForOverrideKey:(id)a3 fromContextOverride:(id)a4 withDefaultContext:(id)a5 allowNilValues:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11 && !v6)
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionContextBuilder _getContextForOverrideKey:fromContextOverride:withDefaultContext:allowNilValues:](v12);
    }
  }
  double v13 = [v10 objectForKey:v9];
  int v14 = [MEMORY[0x1E4F1CA98] null];
  int v15 = [v13 isEqual:v14];

  if (v6) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v11;
  }
  if (v13) {
    id v17 = v13;
  }
  else {
    id v17 = v11;
  }
  if (!v15) {
    uint64_t v16 = v17;
  }
  id v18 = v16;

  return v18;
}

- (id)deviceStateContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6 = a3;
  CLLocationCoordinate2D v7 = [(ATXPredictionContextBuilder *)self deviceStateContextForCurrentContext:a4];
  id v8 = [v7 wifiSSID];
  id v9 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideWifiSSID" fromContextOverride:v6 withDefaultContext:v8 allowNilValues:0];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "onWifi"));
  id v11 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideOnWifi" fromContextOverride:v6 withDefaultContext:v10 allowNilValues:0];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "inAirplaneMode"));
  double v13 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideInAirplaneMode" fromContextOverride:v6 withDefaultContext:v12 allowNilValues:0];

  int v14 = -[ATXPredictionDeviceStateContext initWithWifiSSID:onWifi:inAirplaneMode:]([ATXPredictionDeviceStateContext alloc], "initWithWifiSSID:onWifi:inAirplaneMode:", v9, [v11 BOOLValue], objc_msgSend(v13, "BOOLValue"));
  return v14;
}

- (id)timeContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6 = a3;
  CLLocationCoordinate2D v7 = [(ATXPredictionContextBuilder *)self timeContextForCurrentContext:a4];
  id v8 = [v7 date];
  id v9 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideDate" fromContextOverride:v6 withDefaultContext:v8 allowNilValues:0];

  id v10 = [[ATXPredictionTimeContext alloc] initWithDate:v9];
  return v10;
}

- (id)locationMotionContextForContextOverride:(id)a3 guardedData:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v72 = a4;
  v73 = -[ATXPredictionContextBuilder locationMotionContextForCurrentContext:](self, "locationMotionContextForCurrentContext:");
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v73, "locationEnabled"));
  v68 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLocationEnabled" fromContextOverride:v74 withDefaultContext:v6 allowNilValues:0];

  CLLocationCoordinate2D v7 = objc_msgSend(MEMORY[0x1E4F93618], "stringForMotionType:", objc_msgSend(v73, "motionType"));
  v70 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideMotionType" fromContextOverride:v74 withDefaultContext:v7 allowNilValues:0];

  char v90 = 0;
  uint64_t v66 = [MEMORY[0x1E4F93618] motionTypeForString:v70 found:&v90];
  if (!v90)
  {
    id v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionContextBuilder locationMotionContextForContextOverride:guardedData:](v8);
    }

    uint64_t v66 = 4;
  }
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v73, "canPredictClipsGivenRecentMotion"));
  v67 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverridecanPredictClipsGivenRecentMotion" fromContextOverride:v74 withDefaultContext:v9 allowNilValues:0];

  id v10 = [v72 locationManager];
  id v11 = [v10 getCurrentLocation];
  id v12 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideCurrentLocation" fromContextOverride:v74 withDefaultContext:v11 allowNilValues:1];

  double v13 = [v72 locationManager];
  int v14 = [v13 previousLOIAndCurrentLOI];
  v71 = [v14 first];

  if (v71)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v71 coordinate];
    double v17 = v16;
    [v71 coordinate];
    double v19 = (void *)[v15 initWithLatitude:v17 longitude:v18];
    double v20 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverridePreviousLocation" fromContextOverride:v74 withDefaultContext:v19 allowNilValues:1];
  }
  else
  {
    double v20 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverridePreviousLocation" fromContextOverride:v74 withDefaultContext:0 allowNilValues:1];
  }
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__23;
  v88 = __Block_byref_object_dispose__23;
  id v89 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  double v22 = [v72 locationManager];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __83__ATXPredictionContextBuilder_locationMotionContextForContextOverride_guardedData___block_invoke;
  v81[3] = &unk_1E68AC9A8;
  v83 = &v84;
  v69 = v21;
  v82 = v69;
  [v22 fetchAllLocationsOfInterest:v81];

  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v69 timeoutSeconds:5.0] == 1)
  {
    uint64_t v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ATXPredictionContextBuilder locationMotionContextForContextOverride:guardedData:](v23);
    }
  }
  [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLocationsOfInterest" fromContextOverride:v74 withDefaultContext:v85[5] allowNilValues:1];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
  double v25 = *MEMORY[0x1E4F936A8];
  if (v24)
  {
    v76 = 0;
    objc_super v26 = 0;
    double v27 = *MEMORY[0x1E4F1E568];
    uint64_t v28 = *(void *)v78;
    double v29 = *MEMORY[0x1E4F1E568];
    double v30 = *MEMORY[0x1E4F936A8];
    double v31 = *MEMORY[0x1E4F936A8];
    double v32 = *MEMORY[0x1E4F936A8];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v78 != v28) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        id v35 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v34 coordinate];
        double v37 = v36;
        [v34 coordinate];
        v38 = objc_msgSend(v35, "initWithLatitude:longitude:", v37);
        [v12 distanceFromLocation:v38];
        if (v12)
        {
          double v40 = v39;
          if (v39 < 400.0 && v39 < v27)
          {
            id v42 = v34;

            v76 = v42;
            double v27 = v40;
          }
        }
        [v20 distanceFromLocation:v38];
        if (v20)
        {
          double v44 = v43;
          if (v43 < 400.0 && v43 < v29)
          {
            id v46 = v34;

            objc_super v26 = v46;
            double v29 = v44;
          }
        }
        if (v12)
        {
          if (![v34 type])
          {
            [v12 distanceFromLocation:v38];
            double v25 = v47;
          }
          if ([v34 type] == 1)
          {
            [v12 distanceFromLocation:v38];
            double v30 = v48;
          }
          if ([v34 type] == 2)
          {
            [v12 distanceFromLocation:v38];
            double v31 = v49;
          }
          if ([v34 type] == 3)
          {
            [v12 distanceFromLocation:v38];
            double v32 = v50;
          }
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
    }
    while (v24);
  }
  else
  {
    v76 = 0;
    objc_super v26 = 0;
    double v30 = *MEMORY[0x1E4F936A8];
    double v31 = *MEMORY[0x1E4F936A8];
    double v32 = *MEMORY[0x1E4F936A8];
  }

  v51 = [ATXPredictionLocationMotionContext alloc];
  uint64_t v52 = [v68 BOOLValue];
  v53 = [NSNumber numberWithDouble:v25];
  [v53 doubleValue];
  double v55 = v54;
  v56 = [NSNumber numberWithDouble:v30];
  [v56 doubleValue];
  double v58 = v57;
  v59 = [NSNumber numberWithDouble:v31];
  [v59 doubleValue];
  double v61 = v60;
  v62 = [NSNumber numberWithDouble:v32];
  [v62 doubleValue];
  v64 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](v51, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v76, v26, v66, v12, v52, [v67 BOOLValue], v55, v58, v61, v63);

  _Block_object_dispose(&v84, 8);
  return v64;
}

void __83__ATXPredictionContextBuilder_locationMotionContextForContextOverride_guardedData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)ambientLightContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6 = a3;
  CLLocationCoordinate2D v7 = [(ATXPredictionContextBuilder *)self ambientLightContextForCurrentContext:a4];
  uint64_t v8 = [v7 ambientLightType];
  if (v8 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = off_1E68ADCA0[(int)v8];
  }
  id v10 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideAmbientLightType" fromContextOverride:v6 withDefaultContext:v9 allowNilValues:0];

  id v11 = v10;
  uint64_t v12 = 0;
  if (([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeDark"] & 1) == 0)
  {
    if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorDark"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoorDark"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorArtificialLight"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeIndoorBrightArtificialLight"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoor"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeOutdoorDirectSun"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"ProactiveAppPredictionAmbientLightTypeUnknown"])
    {
      uint64_t v12 = 7;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  double v13 = [[ATXPredictionAmbientLightContext alloc] initWithAmbientLightType:v12];
  return v13;
}

- (id)userContextForContextOverride:(id)a3 guardedData:(id)a4
{
  id v6 = a3;
  CLLocationCoordinate2D v7 = [(ATXPredictionContextBuilder *)self userContextForCurrentContext:a4];
  uint64_t v8 = [v7 lastUnlockDate];
  id v9 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLastUnlockDate" fromContextOverride:v6 withDefaultContext:v8 allowNilValues:1];

  id v10 = [v7 lastAppLaunch];
  id v11 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLastAppLaunch" fromContextOverride:v6 withDefaultContext:v10 allowNilValues:1];

  uint64_t v12 = [v7 lastAppLaunchDate];
  double v13 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLastAppLaunchDate" fromContextOverride:v6 withDefaultContext:v12 allowNilValues:1];

  int v14 = [v7 secondMostRecentAppLaunch];
  id v15 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideSecondMostRecentAppLaunch" fromContextOverride:v6 withDefaultContext:v14 allowNilValues:1];

  double v16 = [v7 lastAppActionLaunch];
  double v17 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideLastAppActionLaunch" fromContextOverride:v6 withDefaultContext:v16 allowNilValues:1];

  double v18 = [[ATXPredictionUserContext alloc] initWithLastUnlockDate:v9 lastAppLaunch:v11 lastAppLaunchDate:v13 secondMostRecentAppLaunch:v15 lastAppActionLaunch:v17];
  return v18;
}

- (id)predictionContextForContextOverride:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    int v14 = __Block_byref_object_copy__23;
    id v15 = __Block_byref_object_dispose__23;
    id v16 = 0;
    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__ATXPredictionContextBuilder_predictionContextForContextOverride___block_invoke;
    v8[3] = &unk_1E68ADC80;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [(_PASLock *)lock runWithLockAcquired:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = [(ATXPredictionContextBuilder *)self predictionContextForCurrentContext];
  }

  return v6;
}

void __67__ATXPredictionContextBuilder_predictionContextForContextOverride___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tryInitContextSourcesAndReturnSuccess:"))
  {
    id v3 = [*(id *)(a1 + 32) deviceStateContextForContextOverride:*(void *)(a1 + 40) guardedData:v11];
    id v4 = [*(id *)(a1 + 32) timeContextForContextOverride:*(void *)(a1 + 40) guardedData:v11];
    char v5 = [*(id *)(a1 + 32) locationMotionContextForContextOverride:*(void *)(a1 + 40) guardedData:v11];
    id v6 = [*(id *)(a1 + 32) ambientLightContextForContextOverride:*(void *)(a1 + 40) guardedData:v11];
    CLLocationCoordinate2D v7 = [*(id *)(a1 + 32) userContextForContextOverride:*(void *)(a1 + 40) guardedData:v11];
    uint64_t v8 = [[ATXPredictionContext alloc] initWithDeviceStateContext:v3 timeContext:v4 locationMotionContext:v5 ambientLightContext:v6 userContext:v7 isOverridden:1];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

+ (id)loadContextOverrideFromJSONFile:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  long long v80 = v3;
  char v5 = [v4 stringByAppendingPathComponent:v3];
  uint64_t v6 = [v5 stringByAppendingPathExtension:@"json"];

  long long v79 = (void *)v6;
  CLLocationCoordinate2D v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:0];
    uint64_t v9 = (void *)[v8 mutableCopy];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [v9 valueForKey:@"ATXContextOverrideDate"];

  if (v10)
  {
    id v11 = [v9 objectForKeyedSubscript:@"ATXContextOverrideDate"];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v11, "integerValue"));
    [v9 setObject:v12 forKeyedSubscript:@"ATXContextOverrideDate"];
  }
  uint64_t v13 = [v9 valueForKey:@"ATXContextOverrideCurrentLocation"];

  if (v13)
  {
    int v14 = [v9 objectForKeyedSubscript:@"ATXContextOverrideCurrentLocation"];
    id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    id v16 = [v14 objectAtIndexedSubscript:0];
    [v16 floatValue];
    double v18 = v17;
    double v19 = [v14 objectAtIndexedSubscript:1];
    [v19 floatValue];
    dispatch_semaphore_t v21 = (void *)[v15 initWithLatitude:v18 longitude:v20];
    [v9 setObject:v21 forKeyedSubscript:@"ATXContextOverrideCurrentLocation"];
  }
  double v22 = [v9 valueForKey:@"ATXContextOverridePreviousLocation"];

  if (v22)
  {
    uint64_t v23 = [v9 objectForKeyedSubscript:@"ATXContextOverridePreviousLocation"];
    id v24 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    double v25 = [v23 objectAtIndexedSubscript:0];
    [v25 floatValue];
    double v27 = v26;
    uint64_t v28 = [v23 objectAtIndexedSubscript:1];
    [v28 floatValue];
    double v30 = (void *)[v24 initWithLatitude:v27 longitude:v29];
    [v9 setObject:v30 forKeyedSubscript:@"ATXContextOverridePreviousLocation"];
  }
  double v31 = [v9 valueForKey:@"ATXContextOverrideInferredModeEvent"];

  if (v31)
  {
    double v32 = [v9 objectForKeyedSubscript:@"ATXContextOverrideInferredModeEvent"];
    id v33 = objc_alloc(MEMORY[0x1E4F50180]);
    v34 = objc_opt_new();
    id v35 = objc_opt_new();
    double v36 = [v35 UUIDString];
    LODWORD(v77) = BMUserFocusInferredModeTypeFromString();
    double v37 = objc_msgSend(v33, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v34, 0, 1, 0, v36, 0, &unk_1F27F04F8, &unk_1F27F0510, MEMORY[0x1E4F1CBF0], v77, MEMORY[0x1E4F1CC28], 0);
    [v9 setObject:v37 forKeyedSubscript:@"ATXContextOverrideInferredModeEvent"];
  }
  v38 = [v9 valueForKey:@"ATXContextOverrideUserFocusComputedModeEvent"];

  if (v38)
  {
    double v39 = [v9 objectForKeyedSubscript:@"ATXContextOverrideUserFocusComputedModeEvent"];
    id v40 = objc_alloc(MEMORY[0x1E4F50188]);
    v41 = (void *)[v40 initWithMode:v39 starting:MEMORY[0x1E4F1CC38] updateReason:0 semanticType:0 updateSource:0 semanticModeIdentifier:0];
    [v9 setObject:v41 forKeyedSubscript:@"ATXContextOverrideUserFocusComputedModeEvent"];
  }
  id v42 = [v9 valueForKey:@"ATXContextOverridePoiCategory"];

  if (v42)
  {
    double v43 = [v9 objectForKeyedSubscript:@"ATXContextOverridePoiCategory"];
    id v44 = objc_alloc(MEMORY[0x1E4F4FEA8]);
    v45 = objc_opt_new();
    id v46 = (void *)[v44 initWithPoiCategory:v43 rank:&unk_1F27F0528 timestamp:v45];
    [v9 setObject:v46 forKeyedSubscript:@"ATXContextOverridePoiCategory"];
  }
  double v47 = [v9 valueForKey:@"ATXContextOverrideCandidateIdentifiersLaunchAge"];

  if (v47)
  {
    long long v78 = v7;
    double v48 = [v9 objectForKeyedSubscript:@"ATXContextOverrideCandidateIdentifiersLaunchAge"];
    double v49 = objc_opt_new();
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v50 = v48;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v81 objects:v85 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v82 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          v56 = (void *)MEMORY[0x1E4F1C9C8];
          double v57 = [v50 objectForKeyedSubscript:v55];
          double v58 = objc_msgSend(v56, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v57, "integerValue"));
          [v49 setObject:v58 forKeyedSubscript:v55];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v81 objects:v85 count:16];
      }
      while (v52);
    }

    [v9 setObject:v49 forKeyedSubscript:@"ATXContextOverrideCandidateIdentifiersLaunchAge"];
    CLLocationCoordinate2D v7 = v78;
  }
  v59 = [v9 valueForKey:@"ATXContextOverrideBluetoothEvent"];

  if (v59)
  {
    double v60 = [v9 objectForKeyedSubscript:@"ATXContextOverrideBluetoothEvent"];
    double v61 = (void *)MEMORY[0x1E4F1C9C8];
    v62 = [v60 objectAtIndexedSubscript:0];
    double v63 = objc_msgSend(v61, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v62, "integerValue"));

    v64 = (void *)MEMORY[0x1E4F1C9C8];
    v65 = [v60 objectAtIndexedSubscript:1];
    uint64_t v66 = objc_msgSend(v64, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v65, "integerValue"));

    v67 = [[ATXBluetoothDuetEvent alloc] initWithBluetoothState:1 deviceType:3 deviceName:&stru_1F2740B58 hardwareAddress:&stru_1F2740B58 startDate:v63 endDate:v66];
    [v9 setObject:v67 forKeyedSubscript:@"ATXContextOverrideBluetoothEvent"];
  }
  v68 = [v9 valueForKey:@"ATXContextOverrideMicrolocationVisitEvent"];

  if (v68)
  {
    v69 = [v9 objectForKeyedSubscript:@"ATXContextOverrideMicrolocationVisitEvent"];
    v70 = [ATXMicrolocationVisitDuetEvent alloc];
    v71 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v69];
    id v72 = objc_opt_new();
    v73 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
    id v74 = objc_opt_new();
    v75 = [(ATXMicrolocationVisitDuetEvent *)v70 initWithDominantMicrolocationUUID:v71 microlocationProbabilities:v72 startDate:v73 endDate:v74];
    [v9 setObject:v75 forKeyedSubscript:@"ATXContextOverrideMicrolocationVisitEvent"];
  }
  return v9;
}

- (void)setNow:(id)a3
{
}

- (_PASLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)predictionContextForCurrentContextAndCandidatePublisher:(id)a3 contextOverride:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXPredictionContextBuilder *)self predictionContextForContextOverride:v7];
  uint64_t v25 = 0;
  float v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__81;
  float v29 = __Block_byref_object_dispose__81;
  id v30 = (id)objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke;
  v24[3] = &unk_1E68B37E0;
  v24[4] = self;
  v24[5] = &v25;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_5;
  v23[3] = &unk_1E68B3EA8;
  v23[4] = &v25;
  id v9 = (id)[v6 sinkWithCompletion:v24 receiveInput:v23];
  id v10 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideCandidateIdentifiersLaunchAge" fromContextOverride:v7 withDefaultContext:v26[5] allowNilValues:1];
  [v8 setCandidateIdentifiersLaunchAge:v10];

  id v11 = [MEMORY[0x1E4F93658] currentMode];
  uint64_t v12 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideInferredModeEvent" fromContextOverride:v7 withDefaultContext:v11 allowNilValues:1];
  [v8 setInferredModeEvent:v12];

  uint64_t v13 = [MEMORY[0x1E4F93650] currentMode];
  int v14 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideUserFocusComputedModeEvent" fromContextOverride:v7 withDefaultContext:v13 allowNilValues:1];
  [v8 setUserFocusComputedModeEvent:v14];

  id v15 = objc_opt_new();
  id v16 = [v15 currentPoiCategory];
  float v17 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverridePoiCategory" fromContextOverride:v7 withDefaultContext:v16 allowNilValues:1];
  [v8 setPoiCategory:v17];

  double v18 = +[ATXBluetoothDuetEvent mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues];
  double v19 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideBluetoothEvent" fromContextOverride:v7 withDefaultContext:v18 allowNilValues:1];
  [v8 setBluetoothEvent:v19];

  float v20 = objc_msgSend(objc_alloc(+[ATXMicrolocationVisitDuetDataProvider supportedDuetEventClass](ATXMicrolocationVisitDuetDataProvider, "supportedDuetEventClass")), "initWithCurrentContextStoreValuesWithTwoHourLimit:", 0);
  dispatch_semaphore_t v21 = [(ATXPredictionContextBuilder *)self _getContextForOverrideKey:@"ATXContextOverrideMicrolocationVisitEvent" fromContextOverride:v7 withDefaultContext:v20 allowNilValues:1];
  [v8 setMicrolocationVisitEvent:v21];

  if ([v7 count]) {
    [v8 setIsOverridden:1];
  }
  _Block_object_dispose(&v25, 8);

  return v8;
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 state])
  {
    id v3 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_cold_1(a1, v3);
    }

    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  [v4 timestamp];
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = [v4 eventBody];

  id v7 = [v6 identifier];
  [v5 setObject:v8 forKeyedSubscript:v7];
}

- (void)_getContextForOverrideKey:(os_log_t)log fromContextOverride:withDefaultContext:allowNilValues:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "_getContextForOverrideKey invoked with nil defaultContext, but allowNilValues is NO", v1, 2u);
}

- (void)locationMotionContextForContextOverride:(os_log_t)log guardedData:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "fetchAllLocationsOfInterest in locationMotionContextForContextOverride timed out", v1, 2u);
}

- (void)locationMotionContextForContextOverride:(os_log_t)log guardedData:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "contextOverride in locationMotionContextForContextOverride supplied with invalid ATXMotionType", v1, 2u);
}

void __121__ATXPredictionContextBuilder_CandidateContext__predictionContextForCurrentContextAndCandidatePublisher_contextOverride___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Error when querying for recently launched candidate. Returning empty set.", (uint8_t *)&v5, 0xCu);
}

@end