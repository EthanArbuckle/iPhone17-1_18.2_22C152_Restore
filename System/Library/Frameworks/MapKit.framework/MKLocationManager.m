@interface MKLocationManager
+ (id)sharedLocationManager;
+ (id)timeoutError;
- (BOOL)_isTimeToResetOnResume;
- (BOOL)_shouldAllowLocationUpdateInterval:(double)a3;
- (BOOL)continuesWhileInactive;
- (BOOL)fusionInfoEnabled;
- (BOOL)hasLocation;
- (BOOL)isAuthorizedForPreciseLocation;
- (BOOL)isEnabled;
- (BOOL)isHeadingServicesAvailable;
- (BOOL)isLastLocationStale;
- (BOOL)isLocationServicesApproved;
- (BOOL)isLocationServicesAuthorizationNeeded;
- (BOOL)isLocationServicesDenied;
- (BOOL)isLocationServicesEnabled;
- (BOOL)isLocationServicesPossiblyAvailable;
- (BOOL)isLocationServicesPossiblyAvailable:(id *)a3;
- (BOOL)isLocationServicesRestricted;
- (BOOL)isLocationSimulated;
- (BOOL)isTemporaryPreciseLocationAuthorizationPromptShown;
- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3;
- (BOOL)logStartStopLocationUpdates;
- (BOOL)matchInfoEnabled;
- (BOOL)useCourseForHeading;
- (BOOL)wasLastLocationPushed;
- (CLHeading)heading;
- (CLHeading)throttledHeading;
- (CLLocation)lastGoodLocation;
- (CLLocation)lastLocation;
- (CLLocation)lastProviderLocation;
- (GEOLocation)courseCorrectedLocation;
- (GEOLocation)currentLocation;
- (GEOLocation)gridSnappedCurrentLocation;
- (MKLocationManager)init;
- (MKLocationManager)initWithCLLocationManager:(id)a3;
- (MKLocationProvider)locationProvider;
- (MNLocationRecorder)locationRecorder;
- (NSBundle)effectiveBundle;
- (NSError)locationError;
- (NSString)description;
- (NSString)effectiveBundleIdentifier;
- (double)currentVehicleHeading;
- (double)currentVehicleSpeed;
- (double)desiredAccuracy;
- (double)distanceFilter;
- (double)expectedGpsUpdateInterval;
- (double)headingUpdateTimeInterval;
- (double)minimumLocationUpdateInterval;
- (double)navigationCourse;
- (double)timeScale;
- (double)vehicleHeadingOrCourse;
- (id)locationCorrector;
- (id)networkActivity;
- (id)observersDescription;
- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4;
- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5;
- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5 maxLocationAge:(double)a6;
- (id)singleLocationUpdateWithHandler:(id)a3;
- (int64_t)activityType;
- (int64_t)headingOrientation;
- (void)_initializeAuthStatusIfNecessary;
- (void)_locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5;
- (void)_reportHeadingFailureWithError:(id)a3;
- (void)_reportHeadingSuccess;
- (void)_reportLocationFailureWithError:(id)a3;
- (void)_reportLocationReset;
- (void)_reportLocationStatus:(SEL)a3;
- (void)_reportLocationSuccess;
- (void)_setIsReceivingAccurateLocations:(BOOL)a3;
- (void)_setTrackingHeading:(BOOL)a3;
- (void)_setTrackingLocation:(BOOL)a3;
- (void)_startLocationUpdateWithObserver:(id)a3 desiredAccuracy:(double)a4;
- (void)_suspend;
- (void)_syncLocationProviderWithTracking;
- (void)_useDefaultCoreLocationProvider;
- (void)_waitForAccurateLocationsTimerFired:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)dampenGPSLocationAccuracy:(id *)a3;
- (void)dealloc;
- (void)dismissHeadingCalibrationDisplay;
- (void)listenForLocationUpdates:(id)a3;
- (void)locationProvider:(id)a3 didReceiveError:(id)a4;
- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5;
- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5;
- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5;
- (void)locationProviderDidChangeAuthorizationStatus:(id)a3;
- (void)locationProviderDidPauseLocationUpdates:(id)a3;
- (void)locationProviderDidResumeLocationUpdates:(id)a3;
- (void)pushLocation:(id)a3;
- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4;
- (void)requestWhenInUseAuthorization;
- (void)reset;
- (void)resetAfterResumeIfNecessary;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)setActivityType:(int64_t)a3;
- (void)setContinuesWhileInactive:(BOOL)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setEffectiveBundle:(id)a3;
- (void)setEffectiveBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFusionInfoEnabled:(BOOL)a3;
- (void)setHeading:(id)a3;
- (void)setHeadingOrientation:(int64_t)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocationCorrector:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setLocationRecorder:(id)a3;
- (void)setLogStartStopLocationUpdates:(BOOL)a3;
- (void)setMatchInfoEnabled:(BOOL)a3;
- (void)setMinimumLocationUpdateInterval:(double)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setThrottledHeading:(id)a3;
- (void)setUseCourseForHeading:(BOOL)a3;
- (void)startHeadingUpdateWithObserver:(id)a3;
- (void)startLocationUpdateWithObserver:(id)a3;
- (void)startVehicleHeadingUpdate;
- (void)startVehicleSpeedUpdate;
- (void)stopHeadingUpdateWithObserver:(id)a3;
- (void)stopListeningForLocationUpdates:(id)a3;
- (void)stopLocationUpdateWithObserver:(id)a3;
- (void)stopVehicleHeadingUpdate;
- (void)stopVehicleSpeedUpdate;
- (void)stopWaitingForAuthCallback;
- (void)waitForAccurateLocationWithTimeout:(double)a3 handler:(id)a4;
@end

@implementation MKLocationManager

- (void)stopLocationUpdateWithObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_observersLock lock];
  if ([(NSHashTable *)self->_locationObservers containsObject:v4])
  {
    v5 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      int v11 = 138478083;
      v12 = v7;
      __int16 v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Removing location observer %{private}@ for %@", (uint8_t *)&v11, 0x16u);
    }
    [(NSHashTable *)self->_locationObservers removeObject:v4];
    v8 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = [(MKLocationManager *)self observersDescription];
      int v11 = 138412547;
      v12 = self;
      __int16 v13 = 2113;
      v14 = v9;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "Remaining location observers for %@: \n%{private}@", (uint8_t *)&v11, 0x16u);
    }
    NSUInteger v10 = [(NSHashTable *)self->_locationObservers count];
    [(NSLock *)self->_observersLock unlock];
    if (!v10) {
      [(MKLocationManager *)self _setTrackingLocation:0];
    }
  }
  else
  {
    [(NSLock *)self->_observersLock unlock];
  }
}

uint64_t __41__MKLocationManager_setLocationProvider___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 296) = 0;
  return result;
}

- (BOOL)isLocationServicesAuthorizationNeeded
{
  v2 = [(MKLocationManager *)self locationProvider];
  BOOL v3 = [v2 authorizationStatus] == 0;

  return v3;
}

+ (id)sharedLocationManager
{
  if (qword_1EB315CC0 != -1) {
    dispatch_once(&qword_1EB315CC0, &__block_literal_global_14);
  }
  v2 = (void *)_MergedGlobals_133;

  return v2;
}

- (void)listenForLocationUpdates:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_observersLock lock];
  locationListeners = self->_locationListeners;
  if (!locationListeners)
  {
    v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:5];
    v6 = self->_locationListeners;
    self->_locationListeners = v5;

    locationListeners = self->_locationListeners;
  }
  if (![(NSHashTable *)locationListeners containsObject:v7]) {
    [(NSHashTable *)self->_locationListeners addObject:v7];
  }
  [(NSLock *)self->_observersLock unlock];
}

- (void)_startLocationUpdateWithObserver:(id)a3 desiredAccuracy:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSLock *)self->_observersLock lock];
  locationObservers = self->_locationObservers;
  if (locationObservers)
  {
    BOOL v8 = [(NSHashTable *)locationObservers containsObject:v6];
    v9 = self->_locationObservers;
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  NSUInteger v10 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:5];
  int v11 = self->_locationObservers;
  self->_locationObservers = v10;

  v9 = self->_locationObservers;
LABEL_6:
  v12 = [(NSHashTable *)v9 count];
  if (![(NSHashTable *)self->_locationObservers containsObject:v6])
  {
    __int16 v13 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      uint64_t v15 = (MKLocationManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = self;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "Adding location observer %{private}@ for %@", buf, 0x16u);
    }
    [(NSHashTable *)self->_locationObservers addObject:v6];
    v16 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(MKLocationManager *)self observersDescription];
      *(_DWORD *)buf = 138412547;
      v28 = self;
      __int16 v29 = 2113;
      v30 = v17;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "All location observers for %@: \n%{private}@", buf, 0x16u);
    }
  }
  [(NSLock *)self->_observersLock unlock];
  if (self->_hasCustomDesiredAccuracy)
  {
    if (v8) {
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  v18 = [(MKLocationManager *)self locationProvider];
  v19 = v18;
  if (v12)
  {
    [v18 desiredAccuracy];
    double v21 = v20;
    double v22 = a4;
    if (v20 < a4)
    {
      v12 = [(MKLocationManager *)self locationProvider];
      [v12 desiredAccuracy];
      double v22 = v23;
    }
    v24 = [(MKLocationManager *)self locationProvider];
    [v24 setDesiredAccuracy:v22];

    if (v21 < a4) {
  }
    }
  else
  {
    [v18 setDesiredAccuracy:a4];
  }

  if (!v8)
  {
LABEL_22:
    if (self->_trackingLocation)
    {
      if ([(MKLocationManager *)self hasLocation] && !self->_isLastLocationStale) {
        [v6 locationManagerUpdatedLocation:self];
      }
    }
    else
    {
      [(MKLocationManager *)self _setTrackingLocation:1];
    }
  }
LABEL_27:
  [(MKLocationManager *)self _initializeAuthStatusIfNecessary];
  authStatusInitializationGroup = self->_authStatusInitializationGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MKLocationManager__startLocationUpdateWithObserver_desiredAccuracy___block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  dispatch_group_notify(authStatusInitializationGroup, MEMORY[0x1E4F14428], block);
}

- (GEOLocation)currentLocation
{
  if ([(MKLocationManager *)self isLocationServicesApproved]
    && [(MKLocationManager *)self hasLocation])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F64660]);
    id v4 = [(MKLocationManager *)self lastLocation];
    v5 = (void *)[v3 initWithCLLocation:v4];
  }
  else
  {
    v5 = 0;
  }

  return (GEOLocation *)v5;
}

- (BOOL)hasLocation
{
  [(NSLock *)self->_lastLocationLock lock];
  lastLocation = self->_lastLocation;
  [(NSLock *)self->_lastLocationLock unlock];
  return lastLocation != 0;
}

- (CLLocation)lastLocation
{
  [(NSLock *)self->_lastLocationLock lock];
  id v3 = self->_lastLocation;
  [(NSLock *)self->_lastLocationLock unlock];

  return v3;
}

- (void)_initializeAuthStatusIfNecessary
{
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  NSUInteger v10 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    [v9 coordinate];
    uint64_t v12 = v11;
    [v9 coordinate];
    uint64_t v14 = v13;
    [v9 rawCoordinate];
    uint64_t v16 = v15;
    [v9 rawCoordinate];
    uint64_t v18 = v17;
    [v9 course];
    uint64_t v20 = v19;
    [v9 horizontalAccuracy];
    uint64_t v22 = v21;
    double v23 = objc_msgSend(MEMORY[0x1E4F1E5F0], "_navigation_stringWithType:", objc_msgSend(v9, "type"));
    int v24 = [v9 referenceFrame];
    v25 = @"Not shifted";
    *(_DWORD *)buf = 138414339;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2049;
    if (v24 == 2) {
      v25 = @"Shifted";
    }
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2049;
    *(void *)&buf[24] = v14;
    *(_WORD *)&buf[32] = 2049;
    *(void *)&buf[34] = v16;
    *(_WORD *)&buf[42] = 2049;
    *(void *)&buf[44] = v18;
    *(_WORD *)&buf[52] = 2049;
    *(void *)&buf[54] = v20;
    *(_WORD *)&buf[62] = 2049;
    *(void *)&buf[64] = v22;
    *(_WORD *)&buf[72] = 2112;
    *(void *)&buf[74] = v23;
    *(_WORD *)&buf[82] = 2112;
    *(void *)&buf[84] = v25;
    _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_INFO, "%@ received location update: %{private}f, %{private}f (raw: %{private}f %{private}f) | %{private}0.1f° | %{private}gm, | %@ | %@", buf, 0x5Cu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v9 uuid];
    if (v26)
    {
      v27 = MKGetPuckTrackingLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[MKLocationManager locationProvider:didUpdateLocation:lastKnownNavCourse:]";
        _os_log_impl(&dword_18BAEC000, v27, OS_LOG_TYPE_INFO, "[MK] %@ Received - in %s", buf, 0x16u);
      }
    }
  }
  else
  {
    v26 = 0;
  }
  if ([(MKLocationManager *)self isLocationServicesAvailable])
  {
    if (!v9)
    {
      v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F1E6C8] code:0 userInfo:0];
      [(MKLocationManager *)self locationProvider:v8 didReceiveError:v33];

      goto LABEL_42;
    }
    if (!self->_trackingLocation)
    {
      v28 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_18BAEC000, v28, OS_LOG_TYPE_INFO, "didUpdateLocation while not tracking location: Stop updating location for %@", buf, 0xCu);
      }

      __int16 v29 = [(MKLocationManager *)self locationProvider];
      [v29 stopUpdatingLocation];
    }
    v30 = [v9 matchInfo];
    if (v30)
    {
      uint64_t v31 = [v9 matchInfo];
      if ([v31 matchQuality] == 1)
      {
        int v32 = 0;
      }
      else
      {
        v34 = [v9 matchInfo];
        int v32 = [v34 isMatchShifted];
      }
    }
    else
    {
      int v32 = 0;
    }

    if ([v9 referenceFrame] == 2) {
      int v35 = 1;
    }
    else {
      int v35 = v32;
    }
    v36 = [(MKLocationManager *)self locationProvider];
    if (([v36 isTracePlayer] & 1) == 0)
    {
      v37 = [(MKLocationManager *)self locationProvider];
      if ([v37 shouldShiftIfNecessary])
      {
        v38 = (void *)MEMORY[0x1E4F64670];
        [v9 coordinate];
        LODWORD(v38) = objc_msgSend(v38, "isLocationShiftRequiredForCoordinate:");

        if (v38)
        {
          if (v26)
          {
            v39 = MKGetPuckTrackingLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v26;
              _os_log_impl(&dword_18BAEC000, v39, OS_LOG_TYPE_INFO, "[MK] %@ Processing - Needs shifting", buf, 0xCu);
            }
          }
          if (v35)
          {
            long long v77 = 0u;
            memset(v78, 0, 28);
            long long v76 = 0u;
            memset(buf, 0, sizeof(buf));
            [v9 clientLocation];
            if (v32)
            {
              v40 = [v9 matchInfo];
              [v40 matchCoordinate];
              uint64_t v42 = v41;
              v43 = [v9 matchInfo];
              [v43 matchCoordinate];
              *(void *)&uint8_t buf[4] = v42;
              *(void *)&buf[12] = v44;
            }
            DWORD1(v78[0]) = 2;
            v45 = [v9 matchInfo];

            id v46 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            if (v45)
            {
              v47 = [v9 matchInfo];
              long long v72 = v76;
              long long v73 = v77;
              v74[0] = v78[0];
              *(_OWORD *)((char *)v74 + 12) = *(_OWORD *)((char *)v78 + 12);
              long long v68 = *(_OWORD *)&buf[32];
              long long v69 = *(_OWORD *)&buf[48];
              long long v70 = *(_OWORD *)&buf[64];
              long long v71 = *(_OWORD *)&buf[80];
              long long v66 = *(_OWORD *)buf;
              long long v67 = *(_OWORD *)&buf[16];
              uint64_t v48 = [v46 initWithClientLocation:&v66 matchInfo:v47];
            }
            else
            {
              v47 = [v9 coarseMetaData];
              long long v72 = v76;
              long long v73 = v77;
              v74[0] = v78[0];
              *(_OWORD *)((char *)v74 + 12) = *(_OWORD *)((char *)v78 + 12);
              long long v68 = *(_OWORD *)&buf[32];
              long long v69 = *(_OWORD *)&buf[48];
              long long v70 = *(_OWORD *)&buf[64];
              long long v71 = *(_OWORD *)&buf[80];
              long long v66 = *(_OWORD *)buf;
              long long v67 = *(_OWORD *)&buf[16];
              uint64_t v48 = [v46 initWithClientLocation:&v66 coarseMetaData:v47];
            }
            v57 = (void *)v48;

            [(MKLocationManager *)self _locationProvider:v8 didUpdateLocation:v57 lastKnownNavCourse:a5];
          }
          else
          {
            uint64_t v58 = MEMORY[0x1E4F143A8];
            uint64_t v59 = 3221225472;
            v60 = __75__MKLocationManager_locationProvider_didUpdateLocation_lastKnownNavCourse___block_invoke;
            v61 = &unk_1E54B9360;
            id v49 = v9;
            id v62 = v49;
            v63 = self;
            id v64 = v8;
            double v65 = a5;
            v50 = (void *)MEMORY[0x18C139AE0](&v58);
            id v51 = objc_alloc(MEMORY[0x1E4F64660]);
            v52 = objc_msgSend(v51, "initWithCLLocation:", v49, v58, v59, v60, v61);
            locationShifter = self->_locationShifter;
            if (!locationShifter)
            {
              v54 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E4F64670]);
              v55 = self->_locationShifter;
              self->_locationShifter = v54;

              locationShifter = self->_locationShifter;
            }
            v56 = [v52 latLng];
            [v49 horizontalAccuracy];
            -[GEOLocationShifter shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v56, v50, 0, 0, MEMORY[0x1E4F14428]);
          }
          goto LABEL_42;
        }
LABEL_41:
        [(MKLocationManager *)self _locationProvider:v8 didUpdateLocation:v9 lastKnownNavCourse:a5];
        goto LABEL_42;
      }
    }
    goto LABEL_41;
  }
LABEL_42:
}

- (BOOL)isLocationServicesPossiblyAvailable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager isLocationServicesPossiblyAvailable %@", (uint8_t *)&v5, 0xCu);
  }

  if ([(MKLocationManager *)self isLocationServicesDenied]) {
    return 0;
  }
  else {
    return ![(MKLocationManager *)self isLocationServicesRestricted];
  }
}

- (BOOL)isLocationServicesDenied
{
  v2 = [(MKLocationManager *)self locationProvider];
  BOOL v3 = [v2 authorizationStatus] == 2;

  return v3;
}

- (BOOL)isLocationServicesRestricted
{
  v2 = [(MKLocationManager *)self locationProvider];
  BOOL v3 = [v2 authorizationStatus] == 1;

  return v3;
}

- (BOOL)isAuthorizedForPreciseLocation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MKLocationManager *)self locationProvider];
  geo_isolate_sync();
  if (*((unsigned char *)v7 + 24)) {
    BOOL v4 = [(MKLocationManager *)self isLocationServicesApproved];
  }
  else {
    BOOL v4 = 0;
  }

  _Block_object_dispose(&v6, 8);
  return v4;
}

- (BOOL)isLocationServicesApproved
{
  v2 = [(MKLocationManager *)self locationProvider];
  int v3 = [v2 authorizationStatus];

  return (v3 - 3) < 2;
}

- (MKLocationProvider)locationProvider
{
  if (self->_enabled) {
    v2 = self->_locationProvider;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (double)currentVehicleHeading
{
  double lastVehicleHeadingUpdateTime = self->_lastVehicleHeadingUpdateTime;
  double result = -1.0;
  if (lastVehicleHeadingUpdateTime > 0.0)
  {
    double lastLocationUpdateTime = self->_lastLocationUpdateTime;
    double v5 = lastLocationUpdateTime - lastVehicleHeadingUpdateTime;
    if (lastLocationUpdateTime > 0.0 && v5 < 10.0) {
      return self->_lastVehicleHeading;
    }
  }
  return result;
}

- (double)expectedGpsUpdateInterval
{
  v2 = [(MKLocationManager *)self locationProvider];
  [v2 expectedGpsUpdateInterval];
  double v4 = v3;

  return v4;
}

- (void)_locationProvider:(id)a3 didUpdateLocation:(id)a4 lastKnownNavCourse:(double)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [v7 timestamp];
  double v9 = MEMORY[0x18C1381F0]();

  if (![(MKLocationManager *)self _shouldAllowLocationUpdateInterval:v9])
  {
    uint64_t v15 = [(MKLocationManager *)self locationRecorder];
    [v15 recordLocation:v7 correctedLocation:0];

    uint64_t v16 = v7;
    goto LABEL_48;
  }
  if (v7)
  {
    [v7 clientLocation];
    double v10 = *(double *)((char *)&v50 + 4);
    [v7 clientLocation];
    double v11 = *(double *)((char *)&v45 + 4);
    if (*(double *)((char *)&v45 + 4) > 0.0 && *(double *)((char *)&v45 + 4) < 20.0)
    {
      int v13 = 0;
      int v14 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    double v11 = 0.0;
    long long v50 = 0u;
    memset(v51, 0, sizeof(v51));
    memset(&v49[32], 0, 112);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    memset(v49, 0, 28);
    double v10 = 0.0;
  }
  objc_msgSend(v7, "speed", v11);
  if (v17 > 3.0) {
    goto LABEL_12;
  }
  int v29 = objc_msgSend(v7, "_navigation_hasMatch");
  int v14 = 0;
  int v13 = 1;
  if (v29 && v10 >= 0.0)
  {
    if (a5 < 0.0) {
      goto LABEL_12;
    }
    [v7 course];
    long double v31 = v30;
    double v32 = fmod(v10, 360.0);
    double v33 = fmod(v31, 360.0);
    if (v31 < 0.0) {
      double v33 = v33 + 360.0;
    }
    if (vabdd_f64(v32, v33) > 180.0)
    {
      if (v32 >= v33) {
        double v33 = v33 + 360.0;
      }
      else {
        double v32 = v32 + 360.0;
      }
    }
    double v34 = vabdd_f64(v33, v32);
    [v7 course];
    long double v36 = v35;
    double v37 = fmod(a5, 360.0);
    if (a5 >= 0.0) {
      double v38 = v37;
    }
    else {
      double v38 = v37 + 360.0;
    }
    double v39 = fmod(v36, 360.0);
    if (v36 < 0.0) {
      double v39 = v39 + 360.0;
    }
    if (vabdd_f64(v38, v39) > 180.0)
    {
      if (v38 >= v39) {
        double v39 = v39 + 360.0;
      }
      else {
        double v38 = v38 + 360.0;
      }
    }
    if (v34 < vabdd_f64(v39, v38))
    {
LABEL_12:
      int v14 = 0;
      int v13 = 0;
      goto LABEL_13;
    }
    int v14 = 0;
    int v13 = 1;
  }
LABEL_13:
  if (self->_navCourse != a5) {
    self->_int consecutiveOutOfCourseCount = 0;
  }
  if (v10 == -1.0) {
    int v13 = 1;
  }
  if (v13) {
    double v18 = a5;
  }
  else {
    double v18 = v10;
  }
  self->_navCourse = v18;
  if (v10 == -1.0)
  {
    self->_int consecutiveOutOfCourseCount = 1;
LABEL_22:
    self->_navCourse = a5;
    goto LABEL_28;
  }
  int consecutiveOutOfCourseCount = self->_consecutiveOutOfCourseCount;
  if (consecutiveOutOfCourseCount >= 1)
  {
    if (vabdd_f64(a5, v10) >= 45.0)
    {
      self->_int consecutiveOutOfCourseCount = consecutiveOutOfCourseCount + 1;
      if (((consecutiveOutOfCourseCount < 3) & ~v14) != 0) {
        goto LABEL_22;
      }
    }
    self->_int consecutiveOutOfCourseCount = 0;
  }
  a5 = v18;
LABEL_28:
  locationCorrector = (void (**)(id, id, double))self->_locationCorrector;
  if (locationCorrector)
  {
    locationCorrector[2](locationCorrector, v7, a5);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    uint64_t v16 = v21;

    goto LABEL_34;
  }
  unsigned int v22 = [v7 type];
  uint64_t v16 = v7;
  if (v22 <= 0xA)
  {
    uint64_t v16 = v7;
    if (((1 << v22) & 0x40E) != 0)
    {
      id v40 = v7;
      [(MKLocationManager *)self dampenGPSLocationAccuracy:&v40];
      id v21 = v40;
      goto LABEL_33;
    }
  }
LABEL_34:
  double v23 = [(MKLocationManager *)self locationRecorder];
  [v23 recordLocation:v7 correctedLocation:v16];

  if (v16)
  {
    [(MKLocationManager *)self setLastLocation:v16];
    self->_double lastLocationUpdateTime = CFAbsoluteTimeGetCurrent();
    *(_WORD *)&self->_isLastLocationStale = 0;
    [(MKLocationManager *)self _reportLocationSuccess];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v24 = [v16 uuid];
      if (v24)
      {
        v25 = MKGetPuckTrackingLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v53 = v24;
          __int16 v54 = 2080;
          v55 = "-[MKLocationManager _locationProvider:didUpdateLocation:lastKnownNavCourse:]";
          _os_log_impl(&dword_18BAEC000, v25, OS_LOG_TYPE_INFO, "[MK] %@ Processed - in %s", buf, 0x16u);
        }
      }
    }
    if (!self->_isReceivingAccurateLocations)
    {
      if (CFAbsoluteTimeGetCurrent() - self->_locationUpdateStartTime > 10.0
        || ([v16 horizontalAccuracy], v26 <= 65.0))
      {
        [(MKLocationManager *)self _setIsReceivingAccurateLocations:1];
      }
    }
    if (self->_useCourseForHeading && self->_trackingHeading)
    {
      id v27 = objc_alloc(MEMORY[0x1E4F1E5E0]);
      [v16 course];
      v28 = objc_msgSend(v27, "initWithHeading:accuracy:");
      [(MKLocationManager *)self setHeading:v28];
    }
  }
LABEL_48:
}

- (MNLocationRecorder)locationRecorder
{
  return self->_locationRecorder;
}

- (void)setLastLocation:(id)a3
{
  uint64_t v6 = (CLLocation *)a3;
  [(NSLock *)self->_lastLocationLock lock];
  if (self->_lastLocation != v6)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    [(CLLocation *)self->_lastLocation _navigation_setGtLog:1];
  }
  [(CLLocation *)v6 horizontalAccuracy];
  if (v5 <= 200.0) {
    objc_storeStrong((id *)&self->_lastGoodLocation, a3);
  }
  [(NSLock *)self->_lastLocationLock unlock];
}

- (BOOL)_shouldAllowLocationUpdateInterval:(double)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  double v5 = [(MKLocationManager *)self lastLocation];
  uint64_t v6 = v5;
  if (!v5 || fabs(self->_minimumLocationUpdateInterval) < 0.000001) {
    goto LABEL_23;
  }
  id v7 = [v5 timestamp];
  double v8 = MEMORY[0x18C1381F0]();

  double v9 = a3 - v8;
  recentLocationUpdateIntervals = self->_recentLocationUpdateIntervals;
  if (v9 < 0.0)
  {
    [(NSMutableArray *)recentLocationUpdateIntervals removeAllObjects];
LABEL_23:
    BOOL v29 = 1;
    goto LABEL_24;
  }
  if ((unint64_t)[(NSMutableArray *)recentLocationUpdateIntervals count] >= 5) {
    [(NSMutableArray *)self->_recentLocationUpdateIntervals removeObjectAtIndex:0];
  }
  double v11 = self->_recentLocationUpdateIntervals;
  uint64_t v12 = [NSNumber numberWithDouble:v9];
  [(NSMutableArray *)v11 addObject:v12];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v13 = self->_recentLocationUpdateIntervals;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
  double v15 = 0.0;
  double v16 = 0.0;
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) doubleValue];
        double v16 = v16 + v20;
      }
      uint64_t v17 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v17);
  }

  unint64_t v21 = [(NSMutableArray *)self->_recentLocationUpdateIntervals count];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unsigned int v22 = self->_recentLocationUpdateIntervals;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    double v25 = v16 / (double)v21;
    uint64_t v26 = *(void *)v32;
    double v15 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "doubleValue", (void)v31);
        double v15 = v15 + (v28 - v25) * (v28 - v25);
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  if (v9
     + sqrt(v15 / (double)(unint64_t)[(NSMutableArray *)self->_recentLocationUpdateIntervals count])
     + 0.1 >= self->_minimumLocationUpdateInterval)
    goto LABEL_23;
  [(NSMutableArray *)self->_recentLocationUpdateIntervals removeLastObject];
  BOOL v29 = 0;
LABEL_24:

  return v29;
}

- (void)_reportLocationSuccess
{
  self->_lastLocationReportTime = CFAbsoluteTimeGetCurrent();
  locationError = self->_locationError;
  self->_locationError = 0;

  [(MKLocationManager *)self _reportLocationStatus:sel_locationManagerUpdatedLocation_];
}

- (void)_reportLocationStatus:(SEL)a3
{
  [(NSLock *)self->_observersLock lock];
  double v5 = [(NSHashTable *)self->_locationObservers allObjects];
  id v8 = (id)[v5 copy];

  uint64_t v6 = [(NSHashTable *)self->_locationListeners allObjects];
  id v7 = (void *)[v6 copy];

  [(NSLock *)self->_observersLock unlock];
  [v8 makeObjectsPerformSelector:a3 withObject:self];
  [v7 makeObjectsPerformSelector:a3 withObject:self];
  if (![v8 count]) {
    [(MKLocationManager *)self _setTrackingLocation:0];
  }
}

- (BOOL)isLastLocationStale
{
  return self->_isLastLocationStale;
}

- (void)dampenGPSLocationAccuracy:(id *)a3
{
  if (a3)
  {
    id v5 = *a3;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    id v7 = [(MKLocationManager *)self lastLocation];
    unsigned int v8 = [v7 type];
    if (v8 <= 0xA && ((1 << v8) & 0x40E) != 0)
    {
      [v5 horizontalAccuracy];
      double v10 = v9;
      [v7 horizontalAccuracy];
      if (vabdd_f64(v10, v11) >= 0.000001 && v10 > v11)
      {
        if (Current - self->_locationAccuracyUpdateTime >= 3.0)
        {
          self->_locationAccuracyUpdateTime = Current;
        }
        else
        {
          long long v27 = 0u;
          memset(v28, 0, 28);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v20 = 0u;
          if (v5) {
            [v5 clientLocation];
          }
          [v7 horizontalAccuracy];
          *(void *)((char *)&v21 + 4) = v13;
          id v14 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          double v15 = [v5 coarseMetaData];
          v18[6] = v26;
          v18[7] = v27;
          v19[0] = v28[0];
          *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)v28 + 12);
          v18[2] = v22;
          v18[3] = v23;
          v18[4] = v24;
          v18[5] = v25;
          v18[0] = v20;
          v18[1] = v21;
          uint64_t v16 = [v14 initWithClientLocation:v18 coarseMetaData:v15];

          id v5 = (id)v16;
        }
      }
    }
    id v17 = v5;
    *a3 = v17;
  }
}

uint64_t __66__MKLocationManager_locationProviderDidChangeAuthorizationStatus___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accuracyAuthorization];
  if (result) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != *(_DWORD *)(*(void *)(a1 + 40) + 296);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 296) = v3;
    *(unsigned char *)(*(void *)(a1 + 40) + 300) = 0;
  }
  return result;
}

uint64_t __51__MKLocationManager_isAuthorizedForPreciseLocation__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(*(void *)(result + 32) + 296);
  if (!v2)
  {
    uint64_t result = [*(id *)(result + 40) accuracyAuthorization];
    if (result) {
      int v3 = 2;
    }
    else {
      int v3 = 1;
    }
    *(_DWORD *)(*(void *)(v1 + 32) + 296) = v3;
    int v2 = *(_DWORD *)(*(void *)(v1 + 32) + 296);
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = v2 == 1;
  return result;
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
}

- (MKLocationManager)initWithCLLocationManager:(id)a3
{
  id v4 = a3;
  id v5 = MKGetMKLocationManagerLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18BD3917F, buf, 2u);
  }

  v27.receiver = self;
  v27.super_class = (Class)MKLocationManager;
  uint64_t v6 = [(MKLocationManager *)&v27 init];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    unsigned int v8 = +[MKApplicationStateMonitor sharedInstance];
    [v8 startObserving];

    [v7 addObserver:v6 selector:sel_applicationDidBecomeActive_ name:@"MKApplicationStateDidBecomeActiveNotification" object:0];
    [v7 addObserver:v6 selector:sel_applicationWillResignActive_ name:@"MKApplicationStateWillResignActiveNotification" object:0];
    v6->_enabled = 1;
    v6->_initializedAuthorizationStatus.lock._os_unfair_lock_opaque = 0;
    v6->_initializedAuthorizationStatus.didRun = 0;
    dispatch_group_t v9 = dispatch_group_create();
    authStatusInitializationGroup = v6->_authStatusInitializationGroup;
    v6->_authStatusInitializationGroup = (OS_dispatch_group *)v9;

    double v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lastLocationLock = v6->_lastLocationLock;
    v6->_lastLocationLock = v11;

    uint64_t v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    observersLock = v6->_observersLock;
    v6->_observersLock = v13;

    uint64_t v15 = geo_isolater_create();
    accuracyAuthorizationIsolater = v6->_accuracyAuthorizationIsolater;
    v6->_accuracyAuthorizationIsolater = (geo_isolater *)v15;

    id v17 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v18 = [v17 bundleIdentifier];
    if ([v18 length])
    {
      uint64_t v19 = [MEMORY[0x1E4F28B50] mainBundle];
      long long v20 = [v19 bundleIdentifier];
      v6->_continuesWhileInactive = [&unk_1ED97F1E8 containsObject:v20];
    }
    else
    {
      v6->_continuesWhileInactive = 0;
    }

    v6->_int consecutiveOutOfCourseCount = 0;
    v6->_navCourse = -1.0;
    uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    recentLocationUpdateIntervals = v6->_recentLocationUpdateIntervals;
    v6->_recentLocationUpdateIntervals = (NSMutableArray *)v21;

    if (v4)
    {
      long long v23 = [[MKCoreLocationProvider alloc] initWithCLLocationManager:v4];
      [(MKLocationManager *)v6 setLocationProvider:v23];
    }
    else
    {
      [(MKLocationManager *)v6 _useDefaultCoreLocationProvider];
    }
    long long v24 = [MEMORY[0x1E4F64918] modernManager];
    [v24 addTileGroupObserver:v6 queue:MEMORY[0x1E4F14428]];
  }
  long long v25 = MKGetMKLocationManagerLog();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Initialization", (const char *)&unk_18BD3917F, buf, 2u);
  }

  return v6;
}

- (void)_useDefaultCoreLocationProvider
{
  int v3 = objc_alloc_init(MKCoreLocationProvider);
  [(MKLocationManager *)self setLocationProvider:v3];
}

- (void)locationProviderDidChangeAuthorizationStatus:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v13 = self;
    id v6 = *(id *)&buf[4];
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did change auth status", buf, 0x20u);
  }
  GEOOnce();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v13) = 0;
  id v7 = v4;
  geo_isolate_sync();
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(NSLock *)self->_lastLocationLock lock];
    lastLocation = self->_lastLocation;
    self->_lastLocation = 0;

    lastGoodLocation = self->_lastGoodLocation;
    self->_lastGoodLocation = 0;

    [(NSLock *)self->_lastLocationLock unlock];
  }
  if ([(MKLocationManager *)self isLocationServicesAvailable]) {
    [(MKLocationManager *)self _syncLocationProviderWithTracking];
  }
  else {
    [(MKLocationManager *)self reset];
  }
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v11 = [MEMORY[0x1E4F28EA0] notificationWithName:MKLocationManagerApprovalDidChangeNotification object:0];
  [v10 postNotification:v11];

  _Block_object_dispose(buf, 8);
}

- (void)setLocationProvider:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (MKLocationProvider *)a3;
  id v6 = v5;
  p_locationProvider = &self->_locationProvider;
  if (self->_locationProvider != v5)
  {
    if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      unsigned int v8 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        long long v20 = self;
        id v9 = v16;
        _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "Setting location provider [%@](%p) for %@", buf, 0x20u);
      }
      locationProvider = self->_locationProvider;
      if (self->_trackingLocation && locationProvider)
      {
        double v11 = MKGetMKLocationManagerLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = self;
          _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_INFO, "Replacing location provider: Stop updating location for %@", buf, 0xCu);
        }

        [(MKLocationProvider *)*p_locationProvider stopUpdatingLocation];
        locationProvider = *p_locationProvider;
      }
      if (self->_trackingHeading)
      {
        [(MKLocationProvider *)locationProvider stopUpdatingHeading];
        locationProvider = *p_locationProvider;
      }
      [(MKLocationProvider *)locationProvider setDelegate:0];
      uint64_t v12 = self->_locationProvider;
      self->_locationProvider = 0;

      [(NSLock *)self->_lastLocationLock lock];
      lastLocation = self->_lastLocation;
      self->_lastLocation = 0;

      lastGoodLocation = self->_lastGoodLocation;
      self->_lastGoodLocation = 0;

      [(NSLock *)self->_lastLocationLock unlock];
      if (v6) {
        objc_storeStrong((id *)&self->_locationProvider, a3);
      }
      else {
        [(MKLocationManager *)self _useDefaultCoreLocationProvider];
      }
      [(MKLocationProvider *)self->_locationProvider setDelegate:self];
      [(MKLocationManager *)self _syncLocationProviderWithTracking];
      geo_isolate_sync();
    }
  }
}

- (void)_syncLocationProviderWithTracking
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_suspended || self->_continuesWhileInactive)
  {
    if (self->_trackingLocation)
    {
      int v3 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = self;
        _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Sync with tracking: Start updating location for %@", (uint8_t *)&v8, 0xCu);
      }

      id v4 = [(MKLocationManager *)self locationProvider];
      [v4 startUpdatingLocation];

      self->_locationUpdateStartTime = CFAbsoluteTimeGetCurrent();
      id v5 = [MEMORY[0x1E4F42738] sharedApplication];
      char v6 = [v5 isRunningTest];

      if ((v6 & 1) == 0) {
        [(MKLocationManager *)self _setIsReceivingAccurateLocations:0];
      }
    }
    if (self->_trackingHeading && !self->_useCourseForHeading)
    {
      id v7 = [(MKLocationManager *)self locationProvider];
      [v7 startUpdatingHeading];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setNetworkActivity:(id)a3
{
}

void __70__MKLocationManager__startLocationUpdateWithObserver_desiredAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  id v7 = 0;
  char v3 = [v2 isLocationServicesPossiblyAvailable:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "Location Services not available for %@: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _reportLocationFailureWithError:v4];
  }
}

- (BOOL)isLocationServicesPossiblyAvailable:(id *)a3
{
  if (![(MKLocationManager *)self isLocationServicesPossiblyAvailable])
  {
    id v5 = MKLocationErrorDomain;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    int v8 = [v7 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __57__MKLocationManager_isLocationServicesPossiblyAvailable___block_invoke;
    __int16 v17 = &unk_1E54B8248;
    id v9 = v6;
    id v18 = v9;
    id v10 = v8;
    id v19 = v10;
    id v11 = (void (**)(void))MEMORY[0x18C139AE0](&v14);
    if ([(MKLocationManager *)self isLocationServicesEnabled])
    {
      if ([(MKLocationManager *)self isLocationServicesRestricted])
      {
        uint64_t v12 = 1;
      }
      else
      {
        if (![(MKLocationManager *)self isLocationServicesDenied])
        {
          uint64_t v12 = -1;
          if (!a3) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 2;
    }
    v11[2](v11);
    if (!a3)
    {
LABEL_10:

      return [(MKLocationManager *)self isLocationServicesPossiblyAvailable];
    }
LABEL_9:
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:v5 code:v12 userInfo:v9];
    goto LABEL_10;
  }
  return [(MKLocationManager *)self isLocationServicesPossiblyAvailable];
}

- (void)locationProvider:(id)a3 didUpdateHeading:(id)a4
{
  id v13 = a4;
  id v5 = [(MKLocationManager *)self locationRecorder];
  [v13 trueHeading];
  double v7 = v6;
  [v13 magneticHeading];
  double v9 = v8;
  [v13 headingAccuracy];
  double v11 = v10;
  uint64_t v12 = [v13 timestamp];
  [v5 recordCompassHeading:v12 magneticHeading:v7 accuracy:v9 timestamp:v11];

  [(MKLocationManager *)self setHeading:v13];
}

- (void)setHeading:(id)a3
{
  id v5 = (CLHeading *)a3;
  if (self->_heading != v5)
  {
    CFTimeInterval v6 = CACurrentMediaTime();
    double v7 = v6 - self->_headingUpdateTime;
    if (v7 < 0.2)
    {
      [(MKLocationManager *)self setThrottledHeading:v5];
      if (!self->_headingThrottlingTimer)
      {
        objc_initWeak(&location, self);
        double v9 = (void *)MEMORY[0x1E4F1CB00];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __32__MKLocationManager_setHeading___block_invoke;
        v12[3] = &unk_1E54B9338;
        objc_copyWeak(&v13, &location);
        double v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:v12 block:0.2 - v7];
        headingThrottlingTimer = self->_headingThrottlingTimer;
        self->_headingThrottlingTimer = v10;

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [(NSTimer *)self->_headingThrottlingTimer invalidate];
      double v8 = self->_headingThrottlingTimer;
      self->_headingThrottlingTimer = 0;

      [(MKLocationManager *)self setThrottledHeading:0];
      objc_storeStrong((id *)&self->_heading, a3);
      if (self->_heading)
      {
        [(MKLocationManager *)self _reportHeadingSuccess];
        self->_headingUpdateTime = v6;
      }
    }
  }
}

- (void)setThrottledHeading:(id)a3
{
}

- (void)_reportHeadingSuccess
{
  id v3 = [(NSHashTable *)self->_headingObservers allObjects];
  [v3 makeObjectsPerformSelector:sel_locationManagerUpdatedHeading_ withObject:self];
}

- (BOOL)isHeadingServicesAvailable
{
  return [MEMORY[0x1E4F1E600] headingAvailable];
}

- (CLHeading)heading
{
  return self->_heading;
}

- (double)headingUpdateTimeInterval
{
  return 0.2;
}

- (void)startHeadingUpdateWithObserver:(id)a3
{
  id v4 = a3;
  headingObservers = self->_headingObservers;
  id v8 = v4;
  if (!headingObservers)
  {
    CFTimeInterval v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:5];
    double v7 = self->_headingObservers;
    self->_headingObservers = v6;

    id v4 = v8;
    headingObservers = self->_headingObservers;
  }
  if (![(NSHashTable *)headingObservers containsObject:v4])
  {
    [(NSHashTable *)self->_headingObservers addObject:v8];
    [(MKLocationManager *)self _setTrackingHeading:1];
  }
}

- (void)setHeadingOrientation:(int64_t)a3
{
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setHeadingOrientation:a3];
}

- (void)_setTrackingHeading:(BOOL)a3
{
  if (self->_trackingHeading != a3)
  {
    if (a3)
    {
      if (!self->_useCourseForHeading)
      {
        id v4 = [(MKLocationManager *)self locationProvider];
        [v4 startUpdatingHeading];
      }
      BOOL v5 = 1;
    }
    else
    {
      CFTimeInterval v6 = [(MKLocationManager *)self locationProvider];
      [v6 stopUpdatingHeading];

      heading = self->_heading;
      self->_heading = 0;

      BOOL v5 = 0;
      self->_headingUpdateTime = 0.0;
    }
    self->_trackingHeading = v5;
  }
}

uint64_t __71__MKLocationManager_isTemporaryPreciseLocationAuthorizationPromptShown__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 300);
  return result;
}

- (void)startLocationUpdateWithObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    double v7 = self;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager %@ startLocationUpdateWithObserver", (uint8_t *)&v6, 0xCu);
  }

  [(MKLocationManager *)self _startLocationUpdateWithObserver:v4 desiredAccuracy:*MEMORY[0x1E4F1E6D8]];
}

- (id)singleLocationUpdateWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[MKLocationManagerSingleUpdater alloc] initWithLocationManager:self handler:v4];

  return v5;
}

void __42__MKLocationManager_sharedLocationManager__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(MKLocationManager);
  uint64_t v1 = (void *)_MergedGlobals_133;
  _MergedGlobals_133 = (uint64_t)v0;

  int v2 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 134217984;
    id v4 = &_MergedGlobals_133;
    _os_log_impl(&dword_18BAEC000, v2, OS_LOG_TYPE_INFO, "Shared location manager: %p", (uint8_t *)&v3, 0xCu);
  }
}

- (MKLocationManager)init
{
  return [(MKLocationManager *)self initWithCLLocationManager:0];
}

- (void)resetAfterResumeIfNecessary
{
  if (!self->_continuedAfterBecomingInactive)
  {
    if (self->_suspended)
    {
      self->_applicationResumeTime = CFAbsoluteTimeGetCurrent();
      self->_suspended = 0;
      if ([(MKLocationManager *)self _isTimeToResetOnResume]) {
        [(MKLocationManager *)self reset];
      }
    }
    [(MKLocationManager *)self _syncLocationProviderWithTracking];
  }
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setFusionInfoEnabled:v3];
}

- (void)_setTrackingLocation:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_trackingLocation != a3)
  {
    if (a3)
    {
      self->_trackingLocation = 1;
      id v4 = +[MKApplicationStateMonitor sharedInstance];
      char v5 = [v4 isActive];

      if ((v5 & 1) != 0 || self->_continuesWhileInactive)
      {
        int v6 = MKGetMKLocationManagerLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          uint64_t v12 = self;
          _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "Set tracking location to YES: Start updating location for %@", (uint8_t *)&v11, 0xCu);
        }

        double v7 = MKGetMKLocationManagerLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "DebugMKLocationManager startUpdatingLocation", (uint8_t *)&v11, 2u);
        }

        uint64_t v8 = [(MKLocationManager *)self locationProvider];
        [v8 startUpdatingLocation];

        self->_locationUpdateStartTime = CFAbsoluteTimeGetCurrent();
        [(MKLocationManager *)self _setIsReceivingAccurateLocations:0];
      }
      else
      {
        double v10 = MKGetMKLocationManagerLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          uint64_t v12 = self;
          _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_INFO, "Set tracking location to YES: %@ is inactive", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    else
    {
      double v9 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = self;
        _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_INFO, "Set tracking location to NO: Stop updating location for %@", (uint8_t *)&v11, 0xCu);
      }

      [(MKLocationProvider *)self->_locationProvider stopUpdatingLocation];
      self->_trackingLocation = 0;
    }
  }
}

- (void)_setIsReceivingAccurateLocations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (GEOConfigGetBOOL())
  {
    if (!self->_isReceivingAccurateLocations)
    {
      char v5 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Now assuming locations are accurate", buf, 2u);
      }
    }
    BOOL v3 = 1;
  }
  if (self->_isReceivingAccurateLocations != v3)
  {
    self->_isReceivingAccurateLocations = v3;
    [(NSTimer *)self->_waitForAccurateLocationsTimer invalidate];
    waitForAccurateLocationsTimer = self->_waitForAccurateLocationsTimer;
    self->_waitForAccurateLocationsTimer = 0;

    if (v3)
    {
      double v7 = self->_waitForAccurateLocationsHandlers;
      waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      self->_waitForAccurateLocationsHandlers = 0;

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      double v9 = v7;
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)setActivityType:(int64_t)a3
{
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setActivityType:a3];
}

- (BOOL)isTemporaryPreciseLocationAuthorizationPromptShown
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)stopListeningForLocationUpdates:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_observersLock lock];
  locationListeners = self->_locationListeners;
  if (locationListeners && [(NSHashTable *)locationListeners containsObject:v5]) {
    [(NSHashTable *)self->_locationListeners removeObject:v5];
  }
  [(NSLock *)self->_observersLock unlock];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = +[MKApplicationStateMonitor sharedInstance];
  [v5 stopObserving];

  [(MKLocationManager *)self setLocationRecorder:0];
  [(NSTimer *)self->_waitForAccurateLocationsTimer invalidate];
  v6.receiver = self;
  v6.super_class = (Class)MKLocationManager;
  [(MKLocationManager *)&v6 dealloc];
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  locationProvider = self->_locationProvider;
  objc_super v6 = NSStringFromBOOL();
  char v7 = [v3 stringWithFormat:@"<%@: %p, provider: %p, isShared:%@>", v4, self, locationProvider, v6];

  return (NSString *)v7;
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v6 = +[MKApplicationStateMonitor sharedInstance];
  char v7 = [v6 isActive];

  if (self->_trackingLocation && ((v7 & 1) != 0 || self->_continuesWhileInactive))
  {
    uint64_t v8 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "didChangeActiveTileGroup: Stop then Start updating location for %@", (uint8_t *)&v11, 0xCu);
    }

    double v9 = [(MKLocationManager *)self locationProvider];
    [v9 stopUpdatingLocation];

    uint64_t v10 = [(MKLocationManager *)self locationProvider];
    [v10 startUpdatingLocation];
  }
}

- (void)setLocationCorrector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locationCorrector != v4)
  {
    objc_super v6 = (void *)[v4 copy];
    id locationCorrector = self->_locationCorrector;
    self->_id locationCorrector = v6;

    if ([(MKLocationManager *)self hasLocation])
    {
      uint64_t v8 = [(MKLocationManager *)self lastLocation];
      double v9 = (void (**)(id, void *, double))self->_locationCorrector;
      if (v9)
      {
        uint64_t v10 = v9[2](v9, v8, self->_navCourse);
      }
      else
      {
        if ([v8 isMemberOfClass:objc_opt_class()])
        {
LABEL_11:

          goto LABEL_12;
        }
        id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        if (v8)
        {
          [v8 clientLocation];
        }
        else
        {
          long long v20 = 0u;
          memset(v21, 0, 28);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          long long v13 = 0u;
        }
        uint64_t v12 = objc_msgSend(v8, "coarseMetaData", v13, v14, v15, v16, v17, v18, v19, v20, *(void *)v21, *(_OWORD *)&v21[8], *(void *)&v21[24]);
        uint64_t v10 = (void *)[v11 initWithClientLocation:&v13 coarseMetaData:v12];
      }
      [(MKLocationManager *)self setLastLocation:v10];

      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)setLocationRecorder:(id)a3
{
  id v5 = (MNLocationRecorder *)a3;
  if (self->_locationRecorder != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_locationRecorder, a3);
    [(MNLocationRecorder *)self->_locationRecorder recordInitialCourse:self->_navCourse];
    id v5 = v6;
  }
}

- (BOOL)isLocationServicesEnabled
{
  return [MEMORY[0x1E4F1E600] locationServicesEnabled];
}

- (BOOL)isLocationSimulated
{
  char v2 = [(MKLocationManager *)self lastLocation];
  BOOL v3 = [v2 sourceInformation];
  char v4 = [v3 isSimulatedBySoftware];

  return v4;
}

- (void)stopWaitingForAuthCallback
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 stopWaitingForAuthCallback];
}

- (NSBundle)effectiveBundle
{
  return (NSBundle *)[(MKLocationProvider *)self->_locationProvider effectiveBundle];
}

- (void)setEffectiveBundle:(id)a3
{
  [(MKLocationProvider *)self->_locationProvider setEffectiveBundle:a3];

  [(MKLocationManager *)self _syncLocationProviderWithTracking];
}

- (NSString)effectiveBundleIdentifier
{
  return (NSString *)[(MKLocationProvider *)self->_locationProvider effectiveBundleIdentifier];
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  [(MKLocationProvider *)self->_locationProvider setEffectiveBundleIdentifier:a3];

  [(MKLocationManager *)self _syncLocationProviderWithTracking];
}

- (CLLocation)lastGoodLocation
{
  [(NSLock *)self->_lastLocationLock lock];
  BOOL v3 = self->_lastGoodLocation;
  [(NSLock *)self->_lastLocationLock unlock];

  return v3;
}

- (CLLocation)lastProviderLocation
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(MKLocationProvider *)self->_locationProvider lastLocation];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (CLLocation *)v3;
}

- (GEOLocation)gridSnappedCurrentLocation
{
  if ([(MKLocationManager *)self isLocationServicesApproved]
    && [(MKLocationManager *)self hasLocation])
  {
    BOOL v3 = [(MKLocationManager *)self lastLocation];
    char v4 = [v3 snapToResolution:3000.0];
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;

    double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:isUserLocation:", 1, v6, v8);
  }
  else
  {
    double v9 = 0;
  }

  return (GEOLocation *)v9;
}

- (GEOLocation)courseCorrectedLocation
{
  BOOL v3 = (void *)MEMORY[0x1E4F64660];
  char v4 = [(MKLocationManager *)self lastLocation];
  double v5 = [v3 locationWithCLLocation:v4 course:self->_navCourse];

  return (GEOLocation *)v5;
}

- (int64_t)headingOrientation
{
  return (int)[(MKLocationProvider *)self->_locationProvider headingOrientation];
}

- (void)requestWhenInUseAuthorization
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 requestWhenInUseAuthorization];
}

- (double)currentVehicleSpeed
{
  double lastVehicleSpeedUpdateTime = self->_lastVehicleSpeedUpdateTime;
  double result = -1.0;
  if (lastVehicleSpeedUpdateTime > 0.0)
  {
    double lastLocationUpdateTime = self->_lastLocationUpdateTime;
    double v5 = lastLocationUpdateTime - lastVehicleSpeedUpdateTime;
    if (lastLocationUpdateTime > 0.0 && v5 < 10.0) {
      return self->_lastVehicleSpeed;
    }
  }
  return result;
}

- (double)vehicleHeadingOrCourse
{
  [(MKLocationManager *)self currentVehicleHeading];
  double v4 = v3;
  if (v3 < 0.0)
  {
    double v5 = [(MKLocationManager *)self lastLocation];
    if (v5
      && ![(MKLocationManager *)self isLastLocationStale]
      && objc_msgSend(v5, "_navigation_hasValidCourse"))
    {
      [v5 course];
      double v4 = v6;
    }
  }
  return v4;
}

- (void)requestTemporaryPreciseLocationAuthorizationWithPurposeKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  if ([(MKLocationManager *)self isAuthorizedForPreciseLocation]
    || ![(MKLocationManager *)self isLocationServicesApproved])
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke;
    location[4] = &unk_1E54B8188;
    location[5] = self;
    geo_isolate_sync();
    objc_initWeak(location, self);
    double v8 = [(MKLocationManager *)self locationProvider];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_2;
    v9[3] = &unk_1E54B9310;
    objc_copyWeak(&v11, location);
    v9[4] = self;
    uint64_t v10 = v7;
    [v8 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:v6 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
}

uint64_t __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 300) = 1;
  return result;
}

void __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_3;
  v6[3] = &unk_1E54B92E8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  double v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
}

void __91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    geo_isolate_sync();
    int v3 = *((unsigned __int8 *)v9 + 24);
    double v4 = +[MKMapService sharedService];
    id v5 = v4;
    if (v3) {
      uint64_t v6 = 76;
    }
    else {
      uint64_t v6 = 77;
    }
    [v4 captureUserAction:v6 onTarget:689 eventValue:0];

    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
    }
    _Block_object_dispose(&v8, 8);
  }
}

void *__91__MKLocationManager_requestTemporaryPreciseLocationAuthorizationWithPurposeKey_completion___block_invoke_4(void *result)
{
  *(unsigned char *)(result[4] + 300) = 0;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[5] + 296) == 1;
  return result;
}

- (CLHeading)throttledHeading
{
  throttledHeading = self->_throttledHeading;
  if (throttledHeading)
  {
    heading = self->_heading;
    if (!heading)
    {
LABEL_10:
      throttledHeading = throttledHeading;
      goto LABEL_12;
    }
    if (heading != throttledHeading)
    {
      id v5 = [(CLHeading *)throttledHeading timestamp];
      uint64_t v6 = [(CLHeading *)self->_heading timestamp];
      uint64_t v7 = [v5 compare:v6];

      if (v7 != -1)
      {
        [(CLHeading *)self->_throttledHeading headingAccuracy];
        double v9 = v8;
        [(CLHeading *)self->_heading headingAccuracy];
        double v11 = vabdd_f64(v9, v10);
        [(CLHeading *)self->_throttledHeading heading];
        double v13 = v12;
        [(CLHeading *)self->_heading heading];
        double v15 = vabdd_f64(v13, v14);
        if (v11 > 2.0 || v15 > 2.0)
        {
          throttledHeading = self->_throttledHeading;
          goto LABEL_10;
        }
      }
    }
    throttledHeading = 0;
  }
LABEL_12:

  return throttledHeading;
}

void __32__MKLocationManager_setHeading___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [v2 throttledHeading];
  [v2 setHeading:v1];
}

- (BOOL)_isTimeToResetOnResume
{
  double applicationSuspendTime = self->_applicationSuspendTime;
  return applicationSuspendTime > 0.0 && self->_applicationResumeTime - applicationSuspendTime > 60.0;
}

- (void)setContinuesWhileInactive:(BOOL)a3
{
  if (self->_continuesWhileInactive != a3)
  {
    BOOL v3 = a3;
    self->_continuesWhileInactive = a3;
    id v5 = +[MKApplicationStateMonitor sharedInstance];
    char v6 = [v5 isActive];

    if ((v6 & 1) == 0)
    {
      if (v3)
      {
        [(MKLocationManager *)self _syncLocationProviderWithTracking];
      }
      else
      {
        self->_continuedAfterBecomingInactive = 0;
        [(MKLocationManager *)self _suspend];
      }
    }
  }
}

- (void)applicationWillResignActive:(id)a3
{
  if ([(MKLocationManager *)self continuesWhileInactive])
  {
    self->_continuedAfterBecomingInactive = 1;
  }
  else
  {
    self->_continuedAfterBecomingInactive = 0;
    [(MKLocationManager *)self _suspend];
  }
}

- (void)_suspend
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_double applicationSuspendTime = CFAbsoluteTimeGetCurrent();
  self->_suspended = 1;
  if (self->_trackingLocation)
  {
    BOOL v3 = MKGetMKLocationManagerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      char v6 = self;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_INFO, "Suspend: Stop updating location for %@", (uint8_t *)&v5, 0xCu);
    }

    [(MKLocationProvider *)self->_locationProvider stopUpdatingLocation];
  }
  if (self->_trackingHeading)
  {
    [(MKLocationProvider *)self->_locationProvider stopUpdatingHeading];
    heading = self->_heading;
    self->_heading = 0;

    self->_headingUpdateTime = 0.0;
  }
}

- (void)_reportLocationFailureWithError:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = NSStringFromBOOL();
    double v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138413058;
    id v34 = v5;
    __int16 v35 = 2112;
    long long v36 = self;
    __int16 v37 = 2112;
    long long v38 = v7;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_INFO, "Location error: %@ for %@ while suspended: %@ while tracking location: %@", buf, 0x2Au);
  }
  objc_storeStrong((id *)&self->_locationError, a3);
  [(NSLock *)self->_observersLock lock];
  double v9 = [(NSHashTable *)self->_locationObservers allObjects];
  double v10 = (void *)[v9 copy];

  double v11 = [(NSHashTable *)self->_locationListeners allObjects];
  double v12 = (void *)[v11 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v17++) locationManagerFailedToUpdateLocation:self withError:v5];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "locationManagerFailedToUpdateLocation:withError:", self, v5, (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void)_reportLocationReset
{
}

- (void)_reportHeadingFailureWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_headingObservers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) locationManagerFailedToUpdateHeading:self withError:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)reset
{
  if (self->_trackingLocation)
  {
    self->_isLastLocationStale = 0;
    [(MKLocationManager *)self setLastLocation:0];
    [(MKLocationManager *)self _reportLocationReset];
  }
}

void __57__MKLocationManager_isLocationServicesPossiblyAvailable___block_invoke(uint64_t a1)
{
  id v2 = _MKLocalizedStringFromThisBundle(@"Location Services Off");
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  BOOL v3 = NSString;
  _MKLocalizedStringFromThisBundle(@"Turn on Location Services in Settings > Privacy & Security to allow %@ to determine your current location");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_msgSend(v3, "stringWithFormat:", v5, *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
}

- (double)desiredAccuracy
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 desiredAccuracy];
  double v4 = v3;

  return v4;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_hasCustomDesiredAccuracy = 1;
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setDesiredAccuracy:a3];
}

- (double)distanceFilter
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 distanceFilter];
  double v4 = v3;

  return v4;
}

- (void)setDistanceFilter:(double)a3
{
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setDistanceFilter:a3];
}

- (BOOL)matchInfoEnabled
{
  id v2 = [(MKLocationManager *)self locationProvider];
  char v3 = [v2 matchInfoEnabled];

  return v3;
}

- (void)setMatchInfoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MKLocationManager *)self locationProvider];
  [v4 setMatchInfoEnabled:v3];
}

- (BOOL)fusionInfoEnabled
{
  id v2 = [(MKLocationManager *)self locationProvider];
  char v3 = [v2 fusionInfoEnabled];

  return v3;
}

- (int64_t)activityType
{
  id v2 = [(MKLocationManager *)self locationProvider];
  int64_t v3 = [v2 activityType];

  return v3;
}

- (double)timeScale
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 timeScale];
  double v4 = v3;

  return v4;
}

- (void)dismissHeadingCalibrationDisplay
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 dismissHeadingCalibrationDisplay];
}

- (void)pushLocation:(id)a3
{
  if (a3)
  {
    -[MKLocationManager setLastLocation:](self, "setLastLocation:");
    self->_double lastLocationUpdateTime = CFAbsoluteTimeGetCurrent();
    *(_WORD *)&self->_isLastLocationStale = 256;
  }
}

void __75__MKLocationManager_locationProvider_didUpdateLocation_lastKnownNavCourse___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 28);
  *(_OWORD *)&v14[16] = 0u;
  *(_DWORD *)uint64_t v14 = 0;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 clientLocation];
  }
  *(double *)&v14[4] = a2;
  *(double *)&v14[12] = a3;
  DWORD1(v15[0]) = 2;
  uint64_t v7 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    [*(id *)(a1 + 32) coordinate];
    uint64_t v9 = v8;
    [*(id *)(a1 + 32) coordinate];
    *(_DWORD *)buf = 134284289;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2049;
    *(double *)&unsigned char buf[24] = a2;
    LOWORD(v17) = 2049;
    *(double *)((char *)&v17 + 2) = a3;
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "Maps shifting location %{private}f, %{private}f => %{private}f, %{private}f", buf, 0x2Au);
  }

  id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  long long v12 = [*(id *)(a1 + 32) coarseMetaData];
  long long v21 = 0u;
  long long v22 = 0u;
  v23[0] = v15[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v15 + 12);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)buf = *(_OWORD *)v14;
  *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)&v14[16];
  long long v13 = (void *)[v11 initWithClientLocation:buf coarseMetaData:v12];

  [*(id *)(a1 + 40) _locationProvider:*(void *)(a1 + 48) didUpdateLocation:v13 lastKnownNavCourse:*(double *)(a1 + 56)];
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138413058;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2048;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    id v9 = v12;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "Location provider [%@](%p) for %@ did receive error: %@", (uint8_t *)&v11, 0x2Au);
  }
  self->_isLastLocationStale = 1;
  uint64_t v10 = [(MKLocationManager *)self locationRecorder];
  [v10 recordError:v7];

  [(MKLocationManager *)self _reportLocationFailureWithError:v7];
}

- (BOOL)locationProviderShouldPauseLocationUpdates:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = (id)objc_opt_class();
    __int16 v35 = 2048;
    id v36 = v4;
    __int16 v37 = 2112;
    long long v38 = self;
    id v6 = v34;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ should pause location updates", buf, 0x20u);
  }
  [(NSLock *)self->_observersLock lock];
  id v7 = [(NSHashTable *)self->_locationObservers allObjects];
  uint64_t v8 = (void *)[v7 copy];

  id v9 = [(NSHashTable *)self->_locationListeners allObjects];
  uint64_t v10 = (void *)[v9 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        if (![*(id *)(*((void *)&v27 + 1) + 8 * i) locationManagerShouldPauseLocationUpdates:self])
        {
          BOOL v21 = 0;
          id v16 = v11;
          goto LABEL_23;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "locationManagerShouldPauseLocationUpdates:", self, (void)v23))
        {
          BOOL v21 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      BOOL v21 = 1;
      if (v18) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v21 = 1;
  }
LABEL_23:

  return v21;
}

- (void)locationProviderDidPauseLocationUpdates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2048;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = self;
    id v6 = v13;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did pause location updates", (uint8_t *)&v12, 0x20u);
  }
  id v7 = [(MKLocationManager *)self locationRecorder];
  [v7 recordLocationUpdatePause];

  [(NSLock *)self->_observersLock lock];
  uint64_t v8 = [(NSHashTable *)self->_locationObservers allObjects];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [(NSHashTable *)self->_locationListeners allObjects];
  id v11 = (void *)[v10 copy];

  [(NSLock *)self->_observersLock unlock];
  [v9 makeObjectsPerformSelector:sel_locationManagerDidPauseLocationUpdates_ withObject:self];
  [v11 makeObjectsPerformSelector:sel_locationManagerDidPauseLocationUpdates_ withObject:self];
}

- (void)locationProviderDidResumeLocationUpdates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2048;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = self;
    id v6 = v13;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "Location provider [%@](%p) for %@ did resume location updates", (uint8_t *)&v12, 0x20u);
  }
  id v7 = [(MKLocationManager *)self locationRecorder];
  [v7 recordLocationUpdateResume];

  [(NSLock *)self->_observersLock lock];
  uint64_t v8 = [(NSHashTable *)self->_locationObservers allObjects];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [(NSHashTable *)self->_locationListeners allObjects];
  id v11 = (void *)[v10 copy];

  [(NSLock *)self->_observersLock unlock];
  [v9 makeObjectsPerformSelector:sel_locationManagerDidResumeLocationUpdates_ withObject:self];
  [v11 makeObjectsPerformSelector:sel_locationManagerDidResumeLocationUpdates_ withObject:self];
}

- (void)locationProvider:(id)a3 didUpdateVehicleSpeed:(double)a4 timestamp:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  self->_lastVehicleSpeed = a4;
  self->_double lastVehicleSpeedUpdateTime = MEMORY[0x18C1381F0]();
  uint64_t v8 = MKGetVehicleSensorLog_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    double v23 = a4;
    __int16 v24 = 2113;
    id v25 = v7;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "Vehicle speed: %g | Timestamp: %{private}@\n", buf, 0x16u);
  }

  id v9 = [(MKLocationManager *)self locationRecorder];
  [v9 recordVehicleSpeed:v7 timestamp:a4];

  [(NSLock *)self->_observersLock lock];
  uint64_t v10 = [(NSHashTable *)self->_locationObservers allObjects];
  id v11 = (void *)[v10 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "locationManager:didUpdateVehicleSpeed:timestamp:", self, v7, a4, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)locationProvider:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  self->_lastVehicleHeading = a4;
  self->_double lastVehicleHeadingUpdateTime = MEMORY[0x18C1381F0]();
  uint64_t v8 = MKGetVehicleSensorLog_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218243;
    double v23 = a4;
    __int16 v24 = 2113;
    id v25 = v7;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "Vehicle heading: %g | Timestamp: %{private}@\n", buf, 0x16u);
  }

  id v9 = [(MKLocationManager *)self locationRecorder];
  [v9 recordVehicleHeading:v7 timestamp:a4];

  [(NSLock *)self->_observersLock lock];
  uint64_t v10 = [(NSHashTable *)self->_locationObservers allObjects];
  id v11 = (void *)[v10 copy];

  [(NSLock *)self->_observersLock unlock];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "locationManager:didUpdateVehicleHeading:timestamp:", self, v7, a4, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

void __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  uint64_t v10 = __Block_byref_object_dispose__6;
  id v11 = (id)geo_dispatch_queue_create();
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 320);
  id v4 = v7[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke_94;
  v5[3] = &unk_1E54B8310;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_group_async(v3, v4, v5);
  _Block_object_dispose(&v6, 8);
}

void __53__MKLocationManager__initializeAuthStatusIfNecessary__block_invoke_94(uint64_t a1)
{
  [*(id *)(a1 + 32) isLocationServicesApproved];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  double v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)observersDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F28E78] string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_locationObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = NSString;
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        uint64_t v13 = [v10 stringWithFormat:@"%@: %p \n", v12, v9, (void)v16];
        [v3 appendString:v13];
      }
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[v3 copy];

  return v14;
}

- (void)waitForAccurateLocationWithTimeout:(double)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6 && self->_trackingLocation)
  {
    if (self->_isReceivingAccurateLocations)
    {
      (*((void (**)(id))v6 + 2))(v6);
    }
    else
    {
      uint64_t v8 = MKGetMKLocationManagerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 134217984;
        double v24 = a3;
        _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "waitForAccurateLocationWithTimeout:handler: waiting %#.2fs for an accurate location", (uint8_t *)&v23, 0xCu);
      }

      waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      if (!waitForAccurateLocationsHandlers)
      {
        uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = self->_waitForAccurateLocationsHandlers;
        self->_waitForAccurateLocationsHandlers = v10;

        id v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__waitForAccurateLocationsTimerFired_ selector:0 userInfo:0 repeats:10.0];
        waitForAccurateLocationsTimer = self->_waitForAccurateLocationsTimer;
        self->_waitForAccurateLocationsTimer = v12;

        waitForAccurateLocationsHandlers = self->_waitForAccurateLocationsHandlers;
      }
      uint64_t v14 = (void *)[v7 copy];
      [(NSMutableArray *)waitForAccurateLocationsHandlers addObject:v14];

      uint64_t v15 = [(MKLocationManager *)self lastGoodLocation];
      long long v16 = v15;
      if (v15)
      {
        long long v17 = [v15 timestamp];
        [v17 timeIntervalSinceNow];
        double v19 = v18;

        if (v19 <= 0.0 && v19 >= -10.0)
        {
          [v16 horizontalAccuracy];
          if (v20 <= 65.0)
          {
            uint64_t v21 = MKGetMKLocationManagerLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              [v16 horizontalAccuracy];
              int v23 = 134218240;
              double v24 = -v19;
              __int16 v25 = 2048;
              uint64_t v26 = v22;
              _os_log_impl(&dword_18BAEC000, v21, OS_LOG_TYPE_DEBUG, "waitForAccurateLocationWithTimeout:handler: lastGoodLocation is good enough to consider accurate, short-circuiting wait for new location (%#.1lfs old, %#.1lfm accuracy)", (uint8_t *)&v23, 0x16u);
            }

            [(MKLocationManager *)self _setIsReceivingAccurateLocations:1];
          }
        }
      }
    }
  }
}

- (void)_waitForAccurateLocationsTimerFired:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = MKGetMKLocationManagerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134218240;
    id v6 = self;
    __int16 v7 = 2048;
    uint64_t v8 = 0x4024000000000000;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "No accurate locations received for %p after %f seconds", (uint8_t *)&v5, 0x16u);
  }

  [(MKLocationManager *)self _setIsReceivingAccurateLocations:1];
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4
{
  id v6 = a4;
  __int16 v7 = [[MKLocationManagerSingleUpdater alloc] initWithLocationManager:self desiredAccuracy:v6 handler:a3];

  return v7;
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5
{
  id v8 = a4;
  uint64_t v9 = [[MKLocationManagerSingleUpdater alloc] initWithLocationManager:self desiredAccuracy:v8 handler:a3 timeout:a5];

  return v9;
}

- (id)singleLocationUpdateWithDesiredAccuracy:(double)a3 handler:(id)a4 timeout:(double)a5 maxLocationAge:(double)a6
{
  id v10 = a4;
  id v11 = [[MKLocationManagerSingleUpdater alloc] initWithLocationManager:self desiredAccuracy:v10 handler:a3 timeout:a5 maxLocationAge:a6];

  return v11;
}

- (void)stopHeadingUpdateWithObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_headingObservers, "containsObject:"))
  {
    [(NSHashTable *)self->_headingObservers removeObject:v4];
    if (![(NSHashTable *)self->_headingObservers count]) {
      [(MKLocationManager *)self _setTrackingHeading:0];
    }
  }
}

- (void)startVehicleSpeedUpdate
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 startUpdatingVehicleSpeed];
}

- (void)stopVehicleSpeedUpdate
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 stopUpdatingVehicleSpeed];
}

- (void)startVehicleHeadingUpdate
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 startUpdatingVehicleHeading];
}

- (void)stopVehicleHeadingUpdate
{
  id v2 = [(MKLocationManager *)self locationProvider];
  [v2 stopUpdatingVehicleHeading];
}

+ (id)timeoutError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:MKLocationErrorDomain code:5 userInfo:0];
}

- (NSError)locationError
{
  return self->_locationError;
}

- (id)networkActivity
{
  return self->_networkActivity;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)useCourseForHeading
{
  return self->_useCourseForHeading;
}

- (void)setUseCourseForHeading:(BOOL)a3
{
  self->_useCourseForHeading = a3;
}

- (BOOL)continuesWhileInactive
{
  return self->_continuesWhileInactive;
}

- (double)navigationCourse
{
  return self->_navCourse;
}

- (id)locationCorrector
{
  return self->_locationCorrector;
}

- (BOOL)wasLastLocationPushed
{
  return self->_lastLocationPushed;
}

- (double)minimumLocationUpdateInterval
{
  return self->_minimumLocationUpdateInterval;
}

- (void)setMinimumLocationUpdateInterval:(double)a3
{
  self->_minimumLocationUpdateInterval = a3;
}

- (BOOL)logStartStopLocationUpdates
{
  return self->_logStartStopLocationUpdates;
}

- (void)setLogStartStopLocationUpdates:(BOOL)a3
{
  self->_logStartStopLocationUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationError, 0);
  objc_storeStrong((id *)&self->_authStatusInitializationGroup, 0);
  objc_storeStrong((id *)&self->_accuracyAuthorizationIsolater, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_lastLocationLock, 0);
  objc_storeStrong((id *)&self->_recentLocationUpdateIntervals, 0);
  objc_storeStrong(&self->_locationCorrector, 0);
  objc_storeStrong(&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_headingThrottlingTimer, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_throttledHeading, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_waitForAccurateLocationsTimer, 0);
  objc_storeStrong((id *)&self->_waitForAccurateLocationsHandlers, 0);
  objc_storeStrong((id *)&self->_locationRecorder, 0);
  objc_storeStrong((id *)&self->_lastGoodLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_headingObservers, 0);
  objc_storeStrong((id *)&self->_locationListeners, 0);
  objc_storeStrong((id *)&self->_locationObservers, 0);

  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end