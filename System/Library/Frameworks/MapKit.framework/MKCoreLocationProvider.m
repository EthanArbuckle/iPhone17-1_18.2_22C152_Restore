@interface MKCoreLocationProvider
- (BOOL)fusionInfoEnabled;
- (BOOL)isTracePlayer;
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(id)a3;
- (BOOL)matchInfoEnabled;
- (BOOL)shouldShiftIfNecessary;
- (BOOL)usesCLMapCorrection;
- (CLLocation)lastLocation;
- (CLLocationManager)_clLocationManager;
- (MKCoreLocationProvider)init;
- (MKCoreLocationProvider)initWithCLLocationManager:(id)a3;
- (MKLocationProviderDelegate)delegate;
- (NSBundle)effectiveBundle;
- (NSString)effectiveBundleIdentifier;
- (double)desiredAccuracy;
- (double)distanceFilter;
- (double)expectedGpsUpdateInterval;
- (double)timeScale;
- (int)_authorizationStatusOnQueue;
- (int)authorizationStatus;
- (int)headingOrientation;
- (int64_t)_accuracyAuthorizationOnQueue;
- (int64_t)accuracyAuthorization;
- (int64_t)activityType;
- (void)_authStatusReceived;
- (void)_beginWaitingForAuthCallback;
- (void)_createCLLocationManager;
- (void)_resetForNewEffectiveBundle;
- (void)_stopWaitingForAuthCallback;
- (void)_updateAccuracyAuthorizationOnQueue:(id)a3;
- (void)_updateAuthorizationStatus;
- (void)accuracyAuthorizationOnQueue:(id)a3 result:(id)a4;
- (void)authorizationStatusOnQueue:(id)a3 result:(id)a4;
- (void)dealloc;
- (void)dismissHeadingCalibrationDisplay;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4;
- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)locationManagerDidPauseLocationUpdates:(id)a3;
- (void)locationManagerDidResumeLocationUpdates:(id)a3;
- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4;
- (void)requestWhenInUseAuthorization;
- (void)setActivityType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setEffectiveBundle:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setFusionInfoEnabled:(BOOL)a3;
- (void)setHeadingOrientation:(int)a3;
- (void)setMatchInfoEnabled:(BOOL)a3;
- (void)startUpdatingHeading;
- (void)startUpdatingLocation;
- (void)startUpdatingVehicleHeading;
- (void)startUpdatingVehicleSpeed;
- (void)stopUpdatingHeading;
- (void)stopUpdatingLocation;
- (void)stopUpdatingVehicleHeading;
- (void)stopUpdatingVehicleSpeed;
- (void)stopWaitingForAuthCallback;
@end

@implementation MKCoreLocationProvider

double __41__MKCoreLocationProvider_desiredAccuracy__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 104);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 48);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(*(void *)(result + 32) + 104) != v1;
  *(double *)(*(void *)(result + 32) + 104) = v1;
  return result;
}

- (void)setDesiredAccuracy:(double)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  v5[6] = 3221225472;
  v5[7] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke;
  v5[8] = &unk_1E54B91A0;
  v5[9] = self;
  v5[10] = &v6;
  *(double *)&v5[11] = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v7 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v6, 8);
}

- (double)desiredAccuracy
{
  uint64_t v4 = 0;
  v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (int)authorizationStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MKCoreLocationProvider_authorizationStatus__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)expectedGpsUpdateInterval
{
  return self->_expectedGpsUpdateInterval;
}

- (BOOL)shouldShiftIfNecessary
{
  return 1;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = objc_opt_class();
    clLocationManager = self->_clLocationManager;
    *(_DWORD *)buf = 138413059;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = clLocationManager;
    LOWORD(v57) = 2113;
    *(void *)((char *)&v57 + 2) = v7;
    id v11 = v9;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "%@ %p - clLocationManager: %p didUpdateLocations: %{private}@", buf, 0x2Au);
  }
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  char v55 = 0;
  if (self->_hasExternallyProvidedLocationManager)
  {
    [v6 desiredAccuracy];
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke;
    v49 = &unk_1E54B9290;
    uint64_t v53 = v12;
    v50 = self;
    id v51 = v6;
    v52 = v54;
    geo_isolate_sync();
  }
  v13 = [v7 lastObject];
  objc_msgSend(v13, "_navigation_setGtLog:", 1);
  v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v15 = [v14 objectForKey:@"LocationLatitude"];
  v16 = [v14 objectForKey:@"LocationLongitude"];
  uint64_t v17 = [v14 objectForKey:@"LocationAccuracy"];
  v18 = (void *)v17;
  if (v15) {
    BOOL v19 = v16 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  if (v19 && !v17)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_3;
    block[3] = &unk_1E54B8298;
    v40 = v54;
    block[4] = self;
    id v39 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v21 = v7;
    goto LABEL_35;
  }
  if ((locationManager_didUpdateLocations__logged & 1) == 0)
  {
    NSLog(&cfstr_OverridingCore.isa, v15, v16, v17);
    locationManager_didUpdateLocations__logged = 1;
  }
  [v13 coordinate];
  double v23 = v22;
  double v25 = v24;
  [v13 horizontalAccuracy];
  double v27 = v26;
  if (v20)
  {
    [v15 cgFloatValue];
    double v29 = v28;
    [v16 cgFloatValue];
    v31 = &off_18BD1A000;
    v21 = v7;
    BOOL v32 = v29 >= -90.0;
    if (v29 > 90.0) {
      BOOL v32 = 0;
    }
    if (v30 < -180.0) {
      BOOL v32 = 0;
    }
    if (v32 && v30 <= 180.0)
    {
      double v23 = v29;
      double v25 = v30;
    }
    if (!v18) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  v21 = v7;
  v31 = &off_18BD1A000;
  if (v18)
  {
LABEL_27:
    [v18 cgFloatValue];
    if (v33 <= 5000.0 && v33 > 0.0) {
      double v27 = v33;
    }
  }
LABEL_32:
  long long v60 = 0u;
  memset(v61, 0, 60);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  memset(buf, 0, sizeof(buf));
  if (v13) {
    [v13 clientLocation];
  }
  *(double *)&buf[4] = v23;
  *(double *)&buf[12] = v25;
  *(double *)((char *)v61 + 4) = v23;
  *(double *)((char *)v61 + 12) = v25;
  *(double *)&buf[20] = v27;
  id v35 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  v44[6] = v61[0];
  v44[7] = v61[1];
  v45[0] = v61[2];
  *(_OWORD *)((char *)v45 + 12) = *(_OWORD *)((char *)&v61[2] + 12);
  v44[2] = v57;
  v44[3] = v58;
  v44[4] = v59;
  v44[5] = v60;
  v44[0] = *(_OWORD *)buf;
  v44[1] = *(_OWORD *)&buf[16];
  v36 = (void *)[v35 initWithClientLocation:v44];
  objc_msgSend(v36, "_navigation_setGtLog:", 1);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = *((void *)v31 + 364);
  v41[2] = __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_2;
  v41[3] = &unk_1E54B8298;
  id v42 = v36;
  v43 = v54;
  v41[4] = self;
  id v37 = v36;
  dispatch_async(MEMORY[0x1E4F14428], v41);

LABEL_35:
  _Block_object_dispose(v54, 8);
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (int64_t)accuracyAuthorization
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MKCoreLocationProvider_accuracyAuthorization__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int authorizationStatus = [v4 authorizationStatus];
  [(MKCoreLocationProvider *)self _authStatusReceived];
  [(MKCoreLocationProvider *)self _updateAccuracyAuthorizationOnQueue:v4];
  v5 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int authorizationStatus = self->_authorizationStatus;
    *(_DWORD *)buf = 134218498;
    id v11 = self;
    __int16 v12 = 1024;
    *(_DWORD *)v13 = authorizationStatus;
    *(_WORD *)&v13[4] = 2112;
    *(void *)&v13[6] = v4;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Updated authorization status for %p to: %i from CLLocationManager(%@)", buf, 0x1Cu);
  }

  id v7 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int64_t accuracyAuthorization = self->_accuracyAuthorization;
    *(_DWORD *)buf = 134218498;
    id v11 = self;
    __int16 v12 = 2048;
    *(void *)v13 = accuracyAuthorization;
    *(_WORD *)&v13[8] = 2112;
    *(void *)&v13[10] = v4;
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "Updated accuracy authorization for %p to: %li from CLLocationManager(%@)", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MKCoreLocationProvider_locationManagerDidChangeAuthorization___block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_authStatusReceived
{
  if (self->_authFetchStatus != 2)
  {
    beginWaitingTime = self->_beginWaitingTime;
    self->_authFetchStatus = 2;
    self->_beginWaitingTime = 0;

    [(NSTimer *)self->_waitingForAuthCheckinTimer invalidate];
    waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
    self->_waitingForAuthCheckinTimer = 0;
  }
}

uint64_t __47__MKCoreLocationProvider_accuracyAuthorization__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _accuracyAuthorizationOnQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_accuracyAuthorizationOnQueue
{
  return self->_accuracyAuthorization;
}

uint64_t __45__MKCoreLocationProvider_authorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _authorizationStatusOnQueue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_authorizationStatusOnQueue
{
  return self->_authorizationStatus;
}

- (void)_updateAuthorizationStatus
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_clLocationManager) {
    [(MKCoreLocationProvider *)self _createCLLocationManager];
  }
  if (GEOConfigGetBOOL() && self->_authFetchStatus == 1)
  {
    int64_t v3 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(MKCoreLocationProvider *)self _clLocationManager];
      int v8 = 138412546;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "CLLocationManager(%@) for %@ is avoiding location permission calls.", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    self->_int authorizationStatus = [(CLLocationManager *)self->_clLocationManager authorizationStatus];
    v5 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int authorizationStatus = self->_authorizationStatus;
      int v8 = 134218240;
      uint64_t v9 = self;
      __int16 v10 = 1024;
      LODWORD(v11) = authorizationStatus;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Updated authorization status for %p to: %i", (uint8_t *)&v8, 0x12u);
    }

    [(MKCoreLocationProvider *)self _updateAccuracyAuthorizationOnQueue:self->_clLocationManager];
    int64_t v3 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int64_t accuracyAuthorization = self->_accuracyAuthorization;
      int v8 = 134218240;
      uint64_t v9 = self;
      __int16 v10 = 2048;
      id v11 = (MKCoreLocationProvider *)accuracyAuthorization;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Updated accuracy authorization for %p to: %li", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_updateAccuracyAuthorizationOnQueue:(id)a3
{
  id v7 = a3;
  [v7 desiredAccuracy];
  if (v4 == *MEMORY[0x1E4F1E720] || ([v7 desiredAccuracy], v5 == 6380000.0)) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = [v7 accuracyAuthorization];
  }
  self->_int64_t accuracyAuthorization = v6;
}

- (CLLocationManager)_clLocationManager
{
  clLocationManager = self->_clLocationManager;
  if (!clLocationManager)
  {
    [(MKCoreLocationProvider *)self _createCLLocationManager];
    clLocationManager = self->_clLocationManager;
  }

  return clLocationManager;
}

- (void)_createCLLocationManager
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (self->_clLocationManager) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_coreLocationQueue);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__5;
  uint64_t v53 = __Block_byref_object_dispose__5;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__5;
  uint64_t v47 = __Block_byref_object_dispose__5;
  id v48 = 0;
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __50__MKCoreLocationProvider__createCLLocationManager__block_invoke;
  id v39 = &unk_1E54B82C0;
  v40 = self;
  v41 = &v49;
  id v42 = &v43;
  geo_isolate_sync();
  if (v50[5])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1E600]);
    double v4 = [(id)v50[5] bundlePath];
    double v5 = (CLLocationManager *)[v3 initWithEffectiveBundlePath:v4 delegate:self onQueue:self->_coreLocationQueue];

    int64_t v6 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(id)v50[5] bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v56 = v7;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "Created CLLocationManager(%@) for %p with bundle %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if (v44[5])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1E600]);
    double v5 = (CLLocationManager *)[v8 initWithEffectiveBundleIdentifier:v44[5] delegate:self onQueue:self->_coreLocationQueue];
    int64_t v6 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (void *)v44[5];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      v56 = v9;
      __int16 v10 = "Created CLLocationManager(%@) for %p with bundle identifier %@";
      id v11 = v6;
      uint32_t v12 = 32;
LABEL_10:
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    }
  }
  else
  {
    double v5 = (CLLocationManager *)[objc_alloc(MEMORY[0x1E4F1E600]) _initWithDelegate:self onQueue:self->_coreLocationQueue];
    int64_t v6 = MKGetMKCoreLocationProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      __int16 v10 = "Created CLLocationManager(%@) for %p with no bundle";
      id v11 = v6;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
  }
LABEL_11:

  [(CLLocationManager *)v5 setDelegate:self];
  [(MKCoreLocationProvider *)self _beginWaitingForAuthCallback];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  v56 = 0;
  uint64_t v32 = 0;
  double v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  geo_isolate_sync();
  -[CLLocationManager setDistanceFilter:](v5, "setDistanceFilter:", *(double *)(*(void *)&buf[8] + 24), v15, 3221225472, __50__MKCoreLocationProvider__createCLLocationManager__block_invoke_13, &unk_1E54B9128, self, buf, &v32, &v28, &v24, &v20, &v16);
  [(CLLocationManager *)v5 setDesiredAccuracy:v33[3]];
  [(CLLocationManager *)v5 setActivityType:v29[3]];
  if (*((unsigned char *)v25 + 24)) {
    [(CLLocationManager *)v5 setMatchInfoEnabled:1];
  }
  if (*((unsigned char *)v21 + 24)) {
    [(CLLocationManager *)v5 _setFusionInfoEnabled:1];
  }
  if (*((_DWORD *)v17 + 6)) {
    -[CLLocationManager setHeadingOrientation:](v5, "setHeadingOrientation:");
  }
  [(CLLocationManager *)v5 setAllowsAlteredAccessoryLocations:1];
  clLocationManager = self->_clLocationManager;
  self->_clLocationManager = v5;
  uint64_t v14 = v5;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

- (void)_beginWaitingForAuthCallback
{
  if (!self->_authFetchStatus)
  {
    self->_authFetchStatus = 1;
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    beginWaitingTime = self->_beginWaitingTime;
    self->_beginWaitingTime = v3;

    objc_initWeak(&location, self);
    double v5 = (void *)MEMORY[0x1E4F1CB00];
    double Integer = (double)GEOConfigGetInteger();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke;
    v9[3] = &unk_1E54B9178;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    id v7 = [v5 scheduledTimerWithTimeInterval:1 repeats:v9 block:Integer];
    waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
    self->_waitingForAuthCheckinTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_3(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    [WeakRetained locationProviderDidChangeAuthorizationStatus:a1[4]];
  }
  id v3 = objc_loadWeakRetained((id *)(a1[4] + 16));
  [v3 locationProvider:a1[4] didUpdateLocation:a1[5]];
}

- (MKCoreLocationProvider)init
{
  return [(MKCoreLocationProvider *)self initWithCLLocationManager:0];
}

- (MKCoreLocationProvider)initWithCLLocationManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKCoreLocationProvider;
  int64_t v6 = [(MKCoreLocationProvider *)&v14 init];
  if (v6)
  {
    uint64_t v7 = geo_isolater_create();
    isolation = v6->_isolation;
    v6->_isolation = (geo_isolater *)v7;

    uint64_t v9 = geo_dispatch_queue_create();
    coreLocationQueue = v6->_coreLocationQueue;
    v6->_coreLocationQueue = (OS_dispatch_queue *)v9;

    v6->_hasExternallyProvidedLocationManager = v5 != 0;
    objc_storeStrong((id *)&v6->_clLocationManager, a3);
    [(CLLocationManager *)v6->_clLocationManager setDelegate:v6];
    v6->_expectedGpsUpdateInterval = 1.0;
    v6->_authFetchStatus = 0;
    if (v6->_hasExternallyProvidedLocationManager)
    {
      [v5 distanceFilter];
      v6->_distanceFilter = v11;
      [v5 desiredAccuracy];
    }
    else
    {
      v6->_distanceFilter = *(double *)MEMORY[0x1E4F1E6C0];
      double v12 = *MEMORY[0x1E4F1E6D8];
    }
    v6->_desiredAccuracy = v12;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

void __47__MKCoreLocationProvider_startUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_INFO, "Start updating Location for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) _clLocationManager];
  [v5 startUpdatingLocation];
}

void __46__MKCoreLocationProvider_startUpdatingHeading__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_INFO, "Start updating Heading for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) _clLocationManager];
  [v5 startUpdatingHeading];
}

- (void)startUpdatingLocation
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MKCoreLocationProvider_startUpdatingLocation__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

- (void)startUpdatingHeading
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MKCoreLocationProvider_startUpdatingHeading__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __59__MKCoreLocationProvider_locationManager_didUpdateHeading___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained locationProvider:*(void *)(a1 + 32) didUpdateHeading:*(void *)(a1 + 40)];
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  void v5[6] = 3221225472;
  v5[7] = __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke;
  v5[8] = &unk_1E54B91F0;
  v5[9] = self;
  v5[10] = &v7;
  int v6 = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v7, 8);
}

void __64__MKCoreLocationProvider_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained locationProviderDidChangeAuthorizationStatus:*(void *)(a1 + 32)];
}

uint64_t __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setHeadingOrientation:*(unsigned int *)(*(void *)(a1 + 32) + 132)];
}

uint64_t __42__MKCoreLocationProvider_setActivityType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setActivityType:*(void *)(*(void *)(a1 + 32) + 112)];
}

void __50__MKCoreLocationProvider__createCLLocationManager__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 40));
  double v2 = *(void **)(a1[4] + 48);
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v3, v2);
}

uint64_t __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 129) != *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 129) = *(unsigned char *)(result + 48);
  return result;
}

uint64_t __48__MKCoreLocationProvider_setHeadingOrientation___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 132) != *(_DWORD *)(result + 48);
  *(_DWORD *)(*(void *)(result + 32) + 132) = *(_DWORD *)(result + 48);
  return result;
}

void *__42__MKCoreLocationProvider_setActivityType___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 112) != result[6];
  *(void *)(result[4] + 112) = result[6];
  return result;
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MKCoreLocationProvider_locationManager_didUpdateHeading___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  void v5[6] = 3221225472;
  v5[7] = __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke;
  v5[8] = &unk_1E54B91C8;
  v5[9] = self;
  v5[10] = &v7;
  BOOL v6 = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setActivityType:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  void v5[6] = 3221225472;
  v5[7] = __42__MKCoreLocationProvider_setActivityType___block_invoke;
  v5[8] = &unk_1E54B91A0;
  v5[9] = self;
  v5[10] = &v6;
  void v5[11] = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v7 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__MKCoreLocationProvider_setActivityType___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __47__MKCoreLocationProvider_setFusionInfoEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) _setFusionInfoEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 129)];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(NSTimer *)self->_waitingForAuthCheckinTimer invalidate];
  uint64_t v4 = self->_clLocationManager;
  clLocationManager = self->_clLocationManager;
  self->_clLocationManager = 0;

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MKCoreLocationProvider_dealloc__block_invoke;
  block[3] = &unk_1E54B8188;
  char v10 = v4;
  uint64_t v7 = v4;
  dispatch_async(coreLocationQueue, block);

  v8.receiver = self;
  v8.super_class = (Class)MKCoreLocationProvider;
  [(MKCoreLocationProvider *)&v8 dealloc];
}

uint64_t __33__MKCoreLocationProvider_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopUpdatingLocation];
  [*(id *)(a1 + 32) stopUpdatingHeading];
  double v2 = *(void **)(a1 + 32);

  return [v2 setDelegate:0];
}

double __50__MKCoreLocationProvider__createCLLocationManager__block_invoke_13(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 120);
  double result = *(double *)(a1[4] + 104);
  *(double *)(*(void *)(a1[6] + 8) + 24) = result;
  *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 112);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = *(unsigned char *)(a1[4] + 128);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = *(unsigned char *)(a1[4] + 129);
  *(_DWORD *)(*(void *)(a1[10] + 8) + 24) = *(_DWORD *)(a1[4] + 132);
  return result;
}

void __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v6 = [v3 isValid];

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 40));
      [*((id *)v7 + 9) timeIntervalSinceNow];
      objc_super v8 = *((void *)v7 + 12);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke_2;
      block[3] = &unk_1E54B9150;
      uint64_t v9 = *(void *)(a1 + 32);
      void block[4] = v7;
      void block[5] = v9;
      *(double *)&block[6] = -v10;
      dispatch_async(v8, block);
    }
  }
}

void __54__MKCoreLocationProvider__beginWaitingForAuthCallback__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v2 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) _clLocationManager];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    int v6 = 138412802;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    double v11 = v5;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_ERROR, "CLLocationManager(%@) for %@ has not received auth status for %@ seconds.", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_stopWaitingForAuthCallback
{
  beginWaitingTime = self->_beginWaitingTime;
  self->_authFetchStatus = 0;
  self->_beginWaitingTime = 0;

  [(NSTimer *)self->_waitingForAuthCheckinTimer invalidate];
  waitingForAuthCheckinTimer = self->_waitingForAuthCheckinTimer;
  self->_waitingForAuthCheckinTimer = 0;
}

- (void)stopWaitingForAuthCallback
{
  [(MKCoreLocationProvider *)self _stopWaitingForAuthCallback];

  [(MKCoreLocationProvider *)self authorizationStatus];
}

- (BOOL)usesCLMapCorrection
{
  return [MEMORY[0x1E4F1E600] mapCorrectionAvailable];
}

- (void)stopUpdatingLocation
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MKCoreLocationProvider_stopUpdatingLocation__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __46__MKCoreLocationProvider_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_INFO, "Stop updating Location for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) stopUpdatingLocation];
}

- (void)stopUpdatingHeading
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MKCoreLocationProvider_stopUpdatingHeading__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __45__MKCoreLocationProvider_stopUpdatingHeading__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v2 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_INFO, "Stop updating Heading for %p _clLocationManager %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) stopUpdatingHeading];
}

- (void)startUpdatingVehicleSpeed
{
  uint64_t v3 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Starting vehicle speed updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MKCoreLocationProvider_startUpdatingVehicleSpeed__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __51__MKCoreLocationProvider_startUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clLocationManager];
  [v1 startUpdatingVehicleSpeed];
}

- (void)stopUpdatingVehicleSpeed
{
  uint64_t v3 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Stopping vehicle speed updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MKCoreLocationProvider_stopUpdatingVehicleSpeed__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __50__MKCoreLocationProvider_stopUpdatingVehicleSpeed__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stopUpdatingVehicleSpeed];
}

- (void)startUpdatingVehicleHeading
{
  uint64_t v3 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Starting vehicle heading updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MKCoreLocationProvider_startUpdatingVehicleHeading__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __53__MKCoreLocationProvider_startUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clLocationManager];
  [v1 startUpdatingVehicleHeading];
}

- (void)stopUpdatingVehicleHeading
{
  uint64_t v3 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "Stopping vehicle heading updates", buf, 2u);
  }

  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MKCoreLocationProvider_stopUpdatingVehicleHeading__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __52__MKCoreLocationProvider_stopUpdatingVehicleHeading__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stopUpdatingVehicleHeading];
}

- (void)_resetForNewEffectiveBundle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    clLocationManager = self->_clLocationManager;
    int v7 = 134218242;
    __int16 v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = clLocationManager;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Reset for effective bundle %p _clLocationManager %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = self->_clLocationManager;
  if (v5)
  {
    [(CLLocationManager *)v5 setDelegate:0];
    int v6 = self->_clLocationManager;
    self->_clLocationManager = 0;

    [(MKCoreLocationProvider *)self _stopWaitingForAuthCallback];
    self->_int authorizationStatus = 0;
    [(MKCoreLocationProvider *)self _createCLLocationManager];
    [(MKCoreLocationProvider *)self _updateAuthorizationStatus];
  }
}

- (NSBundle)effectiveBundle
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__5;
  __int16 v8 = __Block_byref_object_dispose__5;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSBundle *)v2;
}

void __41__MKCoreLocationProvider_effectiveBundle__block_invoke(uint64_t a1)
{
}

- (void)setEffectiveBundle:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  void v7[5] = MEMORY[0x1E4F143A8];
  v7[6] = 3221225472;
  v7[7] = __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke;
  v7[8] = &unk_1E54B8298;
  id v9 = &v10;
  v7[9] = self;
  id v5 = v4;
  id v8 = v5;
  geo_isolate_sync();
  if (*((unsigned char *)v11 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke_2;
    v7[3] = &unk_1E54B8188;
    v7[4] = self;
    dispatch_async(coreLocationQueue, v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __45__MKCoreLocationProvider_setEffectiveBundle___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 40) isEqual:a1[5]] ^ 1;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v2 = (void *)a1[5];
    uint64_t v3 = (id *)(a1[4] + 40);
    objc_storeStrong(v3, v2);
  }
}

void *__45__MKCoreLocationProvider_setEffectiveBundle___block_invoke_2(uint64_t a1)
{
  double result = *(void **)(a1 + 32);
  if (result[1]) {
    return (void *)[result _resetForNewEffectiveBundle];
  }
  return result;
}

- (NSString)effectiveBundleIdentifier
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__5;
  id v8 = __Block_byref_object_dispose__5;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __51__MKCoreLocationProvider_effectiveBundleIdentifier__block_invoke(uint64_t a1)
{
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  void v7[5] = MEMORY[0x1E4F143A8];
  v7[6] = 3221225472;
  v7[7] = __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke;
  v7[8] = &unk_1E54B8298;
  id v9 = &v10;
  v7[9] = self;
  id v5 = v4;
  id v8 = v5;
  geo_isolate_sync();
  if (*((unsigned char *)v11 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke_2;
    v7[3] = &unk_1E54B8188;
    v7[4] = self;
    dispatch_async(coreLocationQueue, v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 48) isEqualToString:*(void *)(a1 + 40)] ^ 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;
  }
}

void *__55__MKCoreLocationProvider_setEffectiveBundleIdentifier___block_invoke_2(uint64_t a1)
{
  double result = *(void **)(a1 + 32);
  if (result[1]) {
    return (void *)[result _resetForNewEffectiveBundle];
  }
  return result;
}

void __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    uint64_t v7 = 0;
    id v8 = (double *)&v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    void block[5] = MEMORY[0x1E4F143A8];
    block[6] = 3221225472;
    void block[7] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_3;
    block[8] = &unk_1E54B8200;
    block[9] = v1;
    block[10] = &v7;
    geo_isolate_sync();
    [*(id *)(*(void *)(a1 + 32) + 8) setDesiredAccuracy:v8[3]];
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3[8] == 2)
    {
      uint64_t v4 = v3[4];
      [v3 _updateAccuracyAuthorizationOnQueue:v3[1]];
      uint64_t v5 = *(void *)(a1 + 32);
      if (*(void *)(v5 + 32) != v4)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_4;
        block[3] = &unk_1E54B8188;
        void block[4] = v5;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    _Block_object_dispose(&v7, 8);
  }
}

double __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_3(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 104);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __45__MKCoreLocationProvider_setDesiredAccuracy___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained locationProviderDidChangeAuthorizationStatus:*(void *)(a1 + 32)];
}

- (int64_t)activityType
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __38__MKCoreLocationProvider_activityType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (double)distanceFilter
{
  uint64_t v4 = 0;
  uint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  geo_isolate_sync();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

double __40__MKCoreLocationProvider_distanceFilter__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 120);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDistanceFilter:(double)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  void v5[6] = 3221225472;
  v5[7] = __44__MKCoreLocationProvider_setDistanceFilter___block_invoke;
  v5[8] = &unk_1E54B91A0;
  v5[9] = self;
  v5[10] = &v6;
  *(double *)&void v5[11] = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v7 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__MKCoreLocationProvider_setDistanceFilter___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __44__MKCoreLocationProvider_setDistanceFilter___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 48);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(*(void *)(result + 32) + 120) != v1;
  *(double *)(*(void *)(result + 32) + 120) = v1;
  return result;
}

uint64_t __44__MKCoreLocationProvider_setDistanceFilter___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setDistanceFilter:*(double *)(*(void *)(a1 + 32) + 120)];
}

- (BOOL)matchInfoEnabled
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __42__MKCoreLocationProvider_matchInfoEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 128);
  return result;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[5] = MEMORY[0x1E4F143A8];
  void v5[6] = 3221225472;
  v5[7] = __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke;
  v5[8] = &unk_1E54B91C8;
  v5[9] = self;
  v5[10] = &v7;
  BOOL v6 = a3;
  geo_isolate_sync();
  if (*((unsigned char *)v8 + 24))
  {
    coreLocationQueue = self->_coreLocationQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke_2;
    v5[3] = &unk_1E54B8188;
    v5[4] = self;
    dispatch_async(coreLocationQueue, v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 128) != *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 128) = *(unsigned char *)(result + 48);
  return result;
}

uint64_t __46__MKCoreLocationProvider_setMatchInfoEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setMatchInfoEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
}

- (BOOL)fusionInfoEnabled
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __43__MKCoreLocationProvider_fusionInfoEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 129);
  return result;
}

- (int)headingOrientation
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  geo_isolate_sync();
  int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __44__MKCoreLocationProvider_headingOrientation__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 132);
  return result;
}

- (void)authorizationStatusOnQueue:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    coreLocationQueue = self->_coreLocationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke;
    block[3] = &unk_1E54B9240;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(coreLocationQueue, block);
  }
}

void __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _authorizationStatusOnQueue];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke_2;
  v6[3] = &unk_1E54B9218;
  id v7 = *(id *)(a1 + 48);
  int v8 = v2;
  dispatch_async(v4, v6);
  if (!v3) {
}
  }

uint64_t __60__MKCoreLocationProvider_authorizationStatusOnQueue_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)accuracyAuthorizationOnQueue:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    coreLocationQueue = self->_coreLocationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke;
    block[3] = &unk_1E54B9240;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(coreLocationQueue, block);
  }
}

void __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _accuracyAuthorizationOnQueue];
  uint64_t v3 = *(NSObject **)(a1 + 40);
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke_2;
  v6[3] = &unk_1E54B9268;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = v2;
  dispatch_async(v4, v6);
  if (!v3) {
}
  }

uint64_t __62__MKCoreLocationProvider_accuracyAuthorizationOnQueue_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (double)timeScale
{
  return 1.0;
}

- (void)dismissHeadingCalibrationDisplay
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MKCoreLocationProvider_dismissHeadingCalibrationDisplay__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

uint64_t __58__MKCoreLocationProvider_dismissHeadingCalibrationDisplay__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) dismissHeadingCalibrationDisplay];
}

- (CLLocation)lastLocation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  coreLocationQueue = self->_coreLocationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MKCoreLocationProvider_lastLocation__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(coreLocationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

void __38__MKCoreLocationProvider_lastLocation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _clLocationManager];
  uint64_t v2 = [v5 location];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 56);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(double *)(v2 + 104))
  {
    uint64_t v3 = (void *)result;
    *(double *)(v2 + 104) = v1;
    uint64_t v4 = *(void **)(result + 32);
    uint64_t v5 = v4[4];
    double result = [v4 _updateAccuracyAuthorizationOnQueue:v3[5]];
    *(unsigned char *)(*(void *)(v3[6] + 8) + 24) = *(void *)(v3[4] + 32) != v5;
  }
  return result;
}

void __61__MKCoreLocationProvider_locationManager_didUpdateLocations___block_invoke_2(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
    [WeakRetained locationProviderDidChangeAuthorizationStatus:a1[4]];
  }
  id v3 = objc_loadWeakRetained((id *)(a1[4] + 16));
  [v3 locationProvider:a1[4] didUpdateLocation:a1[5]];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MKGetMKCoreLocationProviderLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "CLLocationManager(%@) for %@ did fail with error: %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__MKCoreLocationProvider_locationManager_didFailWithError___block_invoke;
  v10[3] = &unk_1E54B8248;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __59__MKCoreLocationProvider_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained locationProvider:*(void *)(a1 + 32) didReceiveError:*(void *)(a1 + 40)];
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", a3);
  uint64_t v4 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 applicationCanPromptToCalibrateHeading:v3];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)requestWhenInUseAuthorization
{
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MKCoreLocationProvider_requestWhenInUseAuthorization__block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(coreLocationQueue, block);
}

void __55__MKCoreLocationProvider_requestWhenInUseAuthorization__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clLocationManager];
  [v1 requestWhenInUseAuthorization];
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  coreLocationQueue = self->_coreLocationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MKCoreLocationProvider_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke;
  block[3] = &unk_1E54B9240;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(coreLocationQueue, block);
}

void __96__MKCoreLocationProvider_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clLocationManager];
  [v2 requestTemporaryFullAccuracyAuthorizationWithPurposeKey:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)locationManagerDidPauseLocationUpdates:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke;
  v6[3] = &unk_1E54B8248;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v3 = [WeakRetained locationProviderShouldPauseLocationUpdates:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v6 = objc_loadWeakRetained((id *)(v4 + 16));
    [v6 locationProviderDidPauseLocationUpdates:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = *(NSObject **)(v4 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke_2;
    block[3] = &unk_1E54B8188;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
  }
}

uint64_t __65__MKCoreLocationProvider_locationManagerDidPauseLocationUpdates___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startUpdatingLocation];
}

- (void)locationManagerDidResumeLocationUpdates:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MKCoreLocationProvider_locationManagerDidResumeLocationUpdates___block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__MKCoreLocationProvider_locationManagerDidResumeLocationUpdates___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained locationProviderDidResumeLocationUpdates:*(void *)(a1 + 32)];
}

- (void)locationManager:(id)a3 didUpdateVehicleSpeed:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    [v5 speed];
    uint64_t v8 = v7;
    id v9 = [v5 timestamp];
    *(_DWORD *)buf = 134218243;
    uint64_t v14 = v8;
    __int16 v15 = 2113;
    __int16 v16 = v9;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle speed: %g | %{private}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MKCoreLocationProvider_locationManager_didUpdateVehicleSpeed___block_invoke;
  v11[3] = &unk_1E54B8248;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __64__MKCoreLocationProvider_locationManager_didUpdateVehicleSpeed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) speed];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 40) timestamp];
  [WeakRetained locationProvider:v2 didUpdateVehicleSpeed:v5 timestamp:v4];
}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MKGetVehicleSensorLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    [v5 trueHeading];
    uint64_t v8 = v7;
    id v9 = [v5 timestamp];
    *(_DWORD *)buf = 134218243;
    uint64_t v14 = v8;
    __int16 v15 = 2113;
    __int16 v16 = v9;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "Got vehicle heading: %g | %{private}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MKCoreLocationProvider_locationManager_didUpdateVehicleHeading___block_invoke;
  v11[3] = &unk_1E54B8248;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __66__MKCoreLocationProvider_locationManager_didUpdateVehicleHeading___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) trueHeading];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 40) timestamp];
  [WeakRetained locationProvider:v2 didUpdateVehicleHeading:v5 timestamp:v4];
}

- (MKLocationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKLocationProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreLocationQueue, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_waitingForAuthCheckinTimer, 0);
  objc_storeStrong((id *)&self->_beginWaitingTime, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveBundle, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_clLocationManager, 0);
}

@end