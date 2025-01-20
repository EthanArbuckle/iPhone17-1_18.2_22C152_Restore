@interface ADLocationManager
+ (void)prepareForAssistantEnablementInBackground;
- (ADLocationManager)initWithSerialQueue:(id)a3;
- (ADLocationManagerDelegate)delegate;
- (ADLocationManagerState)currentState;
- (BOOL)_locationUpdateIsCapableOfSucceeding;
- (BOOL)allowAdHocSendingLocationToServer;
- (BOOL)doNotClearLocationManagerDelegateForUnitTests;
- (BOOL)isNavigating;
- (BOOL)needsToSendLocation;
- (BOOL)shouldEndLocationUpdateSession;
- (BOOL)shouldSendLocationToServer:(id)a3 forAceCommand:(id)a4;
- (CLLocation)knownLocation;
- (CLLocation)lastLocation;
- (CLLocation)lastShiftedLocation;
- (CLLocation)locationSentToServer;
- (id)_locationManager;
- (id)_locationShifter;
- (id)_peerLocationConnection;
- (id)createCurrentLocationSnapshot;
- (id)createLocationInUseAssertion;
- (id)createSetRequestOrigin;
- (id)locationForSnapshot;
- (id)shiftLocationUsingCachedShifterFunction:(id)a3;
- (void)_cancelLocationSLATimer;
- (void)_cancelLocationTimer;
- (void)_clearCompletionState;
- (void)_dismissTCCDialogIfNeeded;
- (void)_generateLocationDeniedResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationDisabledResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationTimedOutResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationUnknownResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateLocationWiFiOffResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4;
- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withStatus:(id)a4 completion:(id)a5;
- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withUnshiftedLocation:(id)a4 completion:(id)a5;
- (void)_processUpdatedLocation:(id)a3;
- (void)_requestLocationForGetRequestOrigin:(id)a3 completion:(id)a4;
- (void)_requestLocationWithBestAccuracy;
- (void)_scheduleLocationSLATimer;
- (void)_scheduleLocationTimerWithTimeout:(double)a3;
- (void)_startMonitoringLocationForGetRequestOrigin:(id)a3 completion:(id)a4;
- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3;
- (void)_triggerLocationABCForSubtype:(id)a3;
- (void)cancelLocationUpdateSessionTeardown;
- (void)currentAuthorizationStyle:(id)a3;
- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5;
- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissTCCDialogIfNeeded:(id)a3;
- (void)dismissedAllVisibleAssistantUIForReason:(id)a3;
- (void)drainAuthorizationRequestCompletionsWithPossibleError:(id)a3;
- (void)drainLocationFetchRequestsWithPossibleError:(id)a3;
- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5;
- (void)endLocationUpdateSessionIfNeeded;
- (void)fetchLocationAuthorization:(id)a3;
- (void)forceLocationUpdateFromCoreLocation;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)navStatusChanged:(id)a3;
- (void)peerLocationConnection:(id)a3 didReceiveUnsolicitedLocation:(id)a4;
- (void)peerLocationConnectionSuggestsClearingCachedLocation:(id)a3;
- (void)prefetchCurrentLocation;
- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)scheduleAuthorizationRequestTimeoutForCompletionBlock:(id)a3 timeout:(double)a4;
- (void)scheduleLocationFetchRequestTimeoutForRequest:(id)a3 timeout:(double)a4;
- (void)scheduleLocationUpdateSessionTeardown;
- (void)sendTemporaryAccuracyAuthorizationRequestWithTimeout:(double)a3 completion:(id)a4;
- (void)setAllowAdHocSendingLocationToServer:(BOOL)a3;
- (void)setCurrentState:(ADLocationManagerState)a3;
- (void)setDelegate:(id)a3;
- (void)setDoNotClearLocationManagerDelegateForUnitTests:(BOOL)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastShiftedLocation:(id)a3;
- (void)setLocationSentToServer:(id)a3;
- (void)setNeedsToSendLocation:(BOOL)a3;
- (void)shiftLocation:(id)a3 completion:(id)a4;
- (void)shiftLocationWithTimeout:(id)a3 timeoutHandler:(id)a4 completion:(id)a5;
- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4;
- (void)startLocationPrefetchRoutine;
- (void)startLocationUpdateSession;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4;
- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5;
- (void)updateLocationForCommand:(id)a3 completion:(id)a4;
- (void)updateLocationSnapshot;
- (void)updateLocationSnapshotWithCompletion:(id)a3;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4;
- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5;
- (void)upgradeAccuracyIfNeeded:(double)a3;
@end

@implementation ADLocationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSentToServer, 0);
  objc_storeStrong((id *)&self->_lastShiftedLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationUpdateSessionTeardownTimer, 0);
  objc_storeStrong((id *)&self->_locationFetchRequests, 0);
  objc_storeStrong((id *)&self->_authorizationRequestCompletions, 0);
  objc_storeStrong((id *)&self->_greenTeaLogger, 0);
  objc_storeStrong((id *)&self->_lastPeerLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_initialLocationAuthorizationCallbackGroup, 0);
  objc_storeStrong((id *)&self->_locationSLATimerSource, 0);
  objc_storeStrong((id *)&self->_locationTimerSource, 0);
  objc_storeStrong(&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_peerLocationConnection, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_updateCompletion, 0);
  objc_storeStrong((id *)&self->_requestOriginCommand, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)setDoNotClearLocationManagerDelegateForUnitTests:(BOOL)a3
{
  self->_doNotClearLocationManagerDelegateForUnitTests = a3;
}

- (BOOL)doNotClearLocationManagerDelegateForUnitTests
{
  return self->_doNotClearLocationManagerDelegateForUnitTests;
}

- (void)setCurrentState:(ADLocationManagerState)a3
{
  ADLocationManagerState v3 = a3;
  objc_copyStruct(&self->_currentState, &v3, 16, 1, 0);
}

- (ADLocationManagerState)currentState
{
  objc_copyStruct(v4, &self->_currentState, 16, 1, 0);
  uint64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.accuracyAuthorization = v3;
  result.locationServicesEnabled = v2;
  result.authorizationStatus = HIDWORD(v2);
  return result;
}

- (void)setAllowAdHocSendingLocationToServer:(BOOL)a3
{
  self->_allowAdHocSendingLocationToServer = a3;
}

- (BOOL)allowAdHocSendingLocationToServer
{
  return self->_allowAdHocSendingLocationToServer;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (void)setNeedsToSendLocation:(BOOL)a3
{
  self->_needsToSendLocation = a3;
}

- (BOOL)needsToSendLocation
{
  return self->_needsToSendLocation;
}

- (void)setDelegate:(id)a3
{
}

- (ADLocationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADLocationManagerDelegate *)WeakRetained;
}

- (id)createSetRequestOrigin
{
  int64_t v3 = objc_opt_new();
  id v4 = [(ADLocationManager *)self currentState];
  if ((v4 & 1) == 0)
  {
    v5 = &SASetRequestOriginStatusDisabledValue;
LABEL_5:
    [v3 setStatus:*v5];
    goto LABEL_6;
  }
  if (HIDWORD(v4) < 3)
  {
    v5 = &SASetRequestOriginStatusDeniedValue;
    goto LABEL_5;
  }
  if ((HIDWORD(v4) - 3) < 2)
  {
    v7 = [(ADLocationManager *)self locationForSnapshot];
    [v7 coordinate];
    objc_msgSend(v3, "setLatitude:");
    [v7 coordinate];
    [v3 setLongitude:v8];
    [v7 horizontalAccuracy];
    objc_msgSend(v3, "setHorizontalAccuracy:");
    [v7 verticalAccuracy];
    objc_msgSend(v3, "setVerticalAccuracy:");
    [v7 speed];
    objc_msgSend(v3, "setSpeed:");
    [v7 altitude];
    objc_msgSend(v3, "setAltitude:");
    [v7 course];
    objc_msgSend(v3, "setDirection:");
    [v3 setStatus:SASetRequestOriginStatusValidValue];
  }
LABEL_6:
  return v3;
}

- (void)forceLocationUpdateFromCoreLocation
{
  if (self->_locationUpdateSessionStatus == 1)
  {
    uint64_t v2 = [(ADLocationManager *)self _locationManager];
    int64_t v3 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Stopping location updates from CoreLocation", (uint8_t *)&v6, 0xCu);
    }
    [v2 stopUpdatingLocation];
    id v4 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Starting location updates from CoreLocation", (uint8_t *)&v6, 0xCu);
    }
    [v2 startUpdatingLocation];
  }
  else
  {
    v5 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADLocationManager forceLocationUpdateFromCoreLocation]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Not forcing location update from CoreLocation because location update session is not active", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)endLocationUpdateSessionIfNeeded
{
  if ([(ADLocationManager *)self shouldEndLocationUpdateSession])
  {
    unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
    id v4 = AFSiriLogContextLocation;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (locationUpdateSessionStatus == 1)
    {
      if (v5)
      {
        int v17 = 136315138;
        v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Ending location update session", (uint8_t *)&v17, 0xCu);
      }
      [(ADLocationManager *)self scheduleLocationUpdateSessionTeardown];
      int v6 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Stopping location updates from CoreLocation", (uint8_t *)&v17, 0xCu);
      }
      v7 = [(ADLocationManager *)self _locationManager];
      [v7 stopUpdatingLocation];

      double v8 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Clearing last shifted location", (uint8_t *)&v17, 0xCu);
      }
      [(ADLocationManager *)self setLastShiftedLocation:0];
      v9 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Clearing location sent to server", (uint8_t *)&v17, 0xCu);
      }
      [(ADLocationManager *)self setLocationSentToServer:0];
      id locationInUseAssertion = self->_locationInUseAssertion;
      if (locationInUseAssertion)
      {
        v11 = AFSiriLogContextLocation;
        if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
        {
          int v17 = 136315138;
          v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Location update session ended - releasing assertion", (uint8_t *)&v17, 0xCu);
          id locationInUseAssertion = self->_locationInUseAssertion;
        }
        self->_id locationInUseAssertion = 0;
      }
      self->_unint64_t locationUpdateSessionStatus = 2;
    }
    else if (v5)
    {
      int v17 = 136315138;
      v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Location update session is not active, not trying to end it", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    v12 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      BOOL siriUserInterfaceIsVisible = self->_siriUserInterfaceIsVisible;
      v14 = v12;
      v15 = +[NSNumber numberWithBool:siriUserInterfaceIsVisible];
      id v16 = [(NSMutableSet *)self->_locationFetchRequests count];
      int v17 = 136315650;
      v18 = "-[ADLocationManager endLocationUpdateSessionIfNeeded]";
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2048;
      id v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Not ending location update session. UI visible: %@, location fetch requests count: %lu", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (BOOL)shouldEndLocationUpdateSession
{
  return !self->_siriUserInterfaceIsVisible && [(NSMutableSet *)self->_locationFetchRequests count] == 0;
}

- (void)startLocationUpdateSession
{
  unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
  id v4 = AFSiriLogContextLocation;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (locationUpdateSessionStatus == 1)
  {
    if (v5)
    {
      int v11 = 136315138;
      v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Location update session is already active, not trying to activate it again", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v11 = 136315138;
      v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Starting location update session", (uint8_t *)&v11, 0xCu);
    }
    [(ADLocationManager *)self cancelLocationUpdateSessionTeardown];
    if (!self->_locationInUseAssertion)
    {
      int v6 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        v12 = "-[ADLocationManager startLocationUpdateSession]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Starting location update session - grabbing assertion once", (uint8_t *)&v11, 0xCu);
      }
      v7 = [(ADLocationManager *)self createLocationInUseAssertion];
      id locationInUseAssertion = self->_locationInUseAssertion;
      self->_id locationInUseAssertion = v7;
    }
    v9 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      v12 = "-[ADLocationManager startLocationUpdateSession]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Starting updating location with CoreLocation", (uint8_t *)&v11, 0xCu);
    }
    v10 = [(ADLocationManager *)self _locationManager];
    [v10 startUpdatingLocation];

    self->_unint64_t locationUpdateSessionStatus = 1;
  }
}

- (void)cancelLocationUpdateSessionTeardown
{
  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer)
  {
    id v4 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      v7 = "-[ADLocationManager cancelLocationUpdateSessionTeardown]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Canceling location update session teardown timer", (uint8_t *)&v6, 0xCu);
      locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
    }
    dispatch_source_cancel(locationUpdateSessionTeardownTimer);
    BOOL v5 = self->_locationUpdateSessionTeardownTimer;
    self->_locationUpdateSessionTeardownTimer = 0;
  }
}

- (void)scheduleLocationUpdateSessionTeardown
{
  int64_t v3 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[ADLocationManager scheduleLocationUpdateSessionTeardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Scheduling location update session teardown", buf, 0xCu);
  }
  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer)
  {
    dispatch_source_cancel(locationUpdateSessionTeardownTimer);
  }
  else
  {
    BOOL v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
    int v6 = self->_locationUpdateSessionTeardownTimer;
    self->_locationUpdateSessionTeardownTimer = v5;
  }
  v7 = self->_locationUpdateSessionTeardownTimer;
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  v9 = self->_locationUpdateSessionTeardownTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100188968;
  handler[3] = &unk_10050B790;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_activate((dispatch_object_t)self->_locationUpdateSessionTeardownTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)upgradeAccuracyIfNeeded:(double)a3
{
  BOOL v5 = [(ADLocationManager *)self _locationManager];
  int v6 = v5;
  if (self->_locationUpdateSessionStatus && ([v5 desiredAccuracy], a3 - v7 > 2.22044605e-16))
  {
    dispatch_time_t v8 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      unint64_t locationUpdateSessionStatus = self->_locationUpdateSessionStatus;
      v10 = v8;
      [v6 desiredAccuracy];
      int v13 = 136315906;
      v14 = "-[ADLocationManager upgradeAccuracyIfNeeded:]";
      __int16 v15 = 2048;
      double v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = locationUpdateSessionStatus;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Not upgrading desired accuracy of location to %.5g. Session status: %lu, current desired accuracy: %.5g", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    v12 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      v14 = "-[ADLocationManager upgradeAccuracyIfNeeded:]";
      __int16 v15 = 2048;
      double v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Upgrading desired accuracy of location to %.5g", (uint8_t *)&v13, 0x16u);
    }
    [v6 setDesiredAccuracy:a3];
    [(ADLocationManager *)self forceLocationUpdateFromCoreLocation];
  }
}

- (id)createLocationInUseAssertion
{
  uint64_t v2 = AFEffectiveSiriBundleForLocation();
  id v3 = +[CLInUseAssertion newAssertionForBundle:v2 withReason:@"Assistant Daemon requires location to handle Siri & Dictation requests"];

  return v3;
}

- (void)dismissTCCDialogIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    internalQueue = self->_internalQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100188D00;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(internalQueue, v7);
  }
  else if (v4)
  {
    dispatch_async((dispatch_queue_t)self->_internalQueue, v4);
  }
}

- (void)_dismissTCCDialogIfNeeded
{
  uint64_t v2 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[ADLocationManager _dismissTCCDialogIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Sending the dialog dismiss to CoreLocation", (uint8_t *)&v4, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    id v3 = AFEffectiveSiriBundlePathForLocation();
    +[CLLocationManager tearDownLocationAuthorizationPromptForBundlePath:v3];
  }
}

- (void)drainRequestsWithErrorCode:(int64_t)a3 clearLocationCache:(BOOL)a4 dismissDialog:(BOOL)a5
{
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100188EB0;
  block[3] = &unk_1005049D8;
  BOOL v7 = a4;
  block[4] = self;
  block[5] = a3;
  BOOL v8 = a5;
  dispatch_async(internalQueue, block);
}

- (void)prefetchCurrentLocation
{
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100189038;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)startLocationPrefetchRoutine
{
  id v3 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    BOOL v8 = "-[ADLocationManager startLocationPrefetchRoutine]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Starting location pre-fetching", (uint8_t *)&v7, 0xCu);
  }
  [(ADLocationManager *)self _startMonitoringLocationWithDesiredAccuracy:self->_preferredPlatformLocationAccuracy];
  if (!self->_locationInUseAssertion)
  {
    int v4 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      BOOL v8 = "-[ADLocationManager startLocationPrefetchRoutine]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Location prefetching routine is started - grabbing assertion once", (uint8_t *)&v7, 0xCu);
    }
    BOOL v5 = [(ADLocationManager *)self createLocationInUseAssertion];
    id locationInUseAssertion = self->_locationInUseAssertion;
    self->_id locationInUseAssertion = v5;
  }
}

- (void)currentLocationWithFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 desiredAccuracy];
  uint64_t v9 = v8;
  [v6 timeout];
  uint64_t v11 = v10;
  v12 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[ADLocationManager currentLocationWithFetchRequest:completion:]";
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Received current location request with accuracy: %.5g, timeout: %.5g", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100189400;
  block[3] = &unk_10050BC30;
  id v17 = v6;
  id v18 = v7;
  block[4] = self;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  id v14 = v6;
  id v15 = v7;
  dispatch_async(internalQueue, block);
}

- (void)currentLocationWithAccuracy:(double)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_opt_new();
  [v9 setDesiredAccuracy:a3];
  [v9 setTimeout:a4];
  [v9 setStyle:0];
  [(ADLocationManager *)self currentLocationWithFetchRequest:v9 completion:v8];
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 timeout:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[NSNumber numberWithBool:v6];
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[ADLocationManager updateTemporaryAuthorizationForAccurateLocation:timeout:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Received update temporary accuracy authorization, isAuthorized: %@, timeout: %.5g", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100189B44;
  v14[3] = &unk_1005049B0;
  BOOL v17 = v6;
  v14[4] = self;
  id v15 = v8;
  double v16 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)updateTemporaryAuthorizationForAccurateLocation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100189E6C;
  v7[3] = &unk_100504988;
  id v8 = a4;
  id v6 = v8;
  [(ADLocationManager *)self updateTemporaryAuthorizationForAccurateLocation:v4 timeout:v7 completion:2.0];
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[ADLocationManager updateAuthorizationStyleWithUserSelection:timeout:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Received update authorization style: %@, timeout: %.5g", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10018A008;
  v14[3] = &unk_100507500;
  id v15 = v8;
  unint64_t v16 = a3;
  v14[4] = self;
  double v17 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)updateAuthorizationStyleWithUserSelection:(unint64_t)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018A374;
  v7[3] = &unk_100504988;
  id v8 = a4;
  id v6 = v8;
  [(ADLocationManager *)self updateAuthorizationStyleWithUserSelection:a3 timeout:v7 completion:2.0];
}

- (void)requestTemporaryAccuracyAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 136315650;
    id v18 = "-[ADLocationManager requestTemporaryAccuracyAuthorizationWithStyle:timeout:completion:]";
    __int16 v19 = 2112;
    __int16 v20 = v11;
    __int16 v21 = 2048;
    double v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Received temporary accuracy authorization request with style: %@, timeout: %.5g", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A50C;
  block[3] = &unk_10050C148;
  block[4] = self;
  id v15 = v8;
  double v16 = a4;
  id v13 = v8;
  dispatch_async(internalQueue, block);
}

- (void)sendTemporaryAccuracyAuthorizationRequestWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  authorizationRequestCompletions = self->_authorizationRequestCompletions;
  id v8 = objc_retainBlock(v6);
  [(NSMutableSet *)authorizationRequestCompletions addObject:v8];

  [(ADLocationManager *)self scheduleAuthorizationRequestTimeoutForCompletionBlock:v6 timeout:a3];
  if (!self->_locationInUseAssertion)
  {
    id v9 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "-[ADLocationManager sendTemporaryAccuracyAuthorizationRequestWithTimeout:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Will request temporary full accuracy authorization - grabbing assertion once", buf, 0xCu);
    }
    uint64_t v10 = [(ADLocationManager *)self createLocationInUseAssertion];
    id locationInUseAssertion = self->_locationInUseAssertion;
    self->_id locationInUseAssertion = v10;
  }
  v12 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v19 = "-[ADLocationManager sendTemporaryAccuracyAuthorizationRequestWithTimeout:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Sending requestTemporaryFullAccuracyAuthorizationWithPurposeKey:completion:", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v13 = [(ADLocationManager *)self _locationManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10018A9E0;
  v15[3] = &unk_100504960;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v6;
  v15[4] = self;
  id v16 = v14;
  [v13 requestTemporaryFullAccuracyAuthorizationWithPurposeKey:@"generic" completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)requestAuthorizationWithStyle:(unint64_t)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[ADLocationManager requestAuthorizationWithStyle:timeout:completion:]";
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2048;
    double v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Received location authorization request with style: %@, timeout: %.5g", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10018ADF8;
  v14[3] = &unk_100507500;
  v14[4] = self;
  id v15 = v8;
  double v16 = a4;
  unint64_t v17 = a3;
  id v13 = v8;
  dispatch_async(internalQueue, v14);
}

- (void)currentAuthorizationStyle:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[ADLocationManager currentAuthorizationStyle:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received current authorizationg style request", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018B284;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(internalQueue, v8);
}

- (void)drainLocationFetchRequestsWithPossibleError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[ADLocationManager drainLocationFetchRequestsWithPossibleError:]";
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Draining location fetch requests with error %@", buf, 0x16u);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = self->_locationFetchRequests;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v29 + 1) + 8 * i) completion];
          ((void (**)(void, void, id))v11)[2](v11, 0, v4);
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }

    [(NSMutableSet *)self->_locationFetchRequests removeAllObjects];
  }
  else
  {
    v12 = [(ADLocationManager *)self lastShiftedLocation];
    if (v12)
    {
      id v13 = [(NSMutableSet *)self->_locationFetchRequests copy];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            __int16 v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
            if (!objc_msgSend(v19, "style", (void)v25))
            {
              [v12 horizontalAccuracy];
              [v19 desiredAccuracy];
            }
            [v12 horizontalAccuracy];
            double v21 = v20;
            [v19 desiredAccuracy];
            if (v21 <= v22)
            {
              double v23 = [v19 completion];
              ((void (**)(void, void *, void))v23)[2](v23, v12, 0);

              [(NSMutableSet *)self->_locationFetchRequests removeObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v16);
      }
    }
    else
    {
      uint64_t v24 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[ADLocationManager drainLocationFetchRequestsWithPossibleError:]";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Drain location is called with no location and no error, this situation should not be possible", buf, 0xCu);
      }
    }
  }
}

- (void)drainAuthorizationRequestCompletionsWithPossibleError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v26 = "-[ADLocationManager drainAuthorizationRequestCompletionsWithPossibleError:]";
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Draining authorization requests with error %@", buf, 0x16u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = self->_authorizationRequestCompletions;
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * i) + 16))();
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(ADLocationManager *)self currentState];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_authorizationRequestCompletions;
    id v11 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)j) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * (void)j));
        }
        id v12 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }

  [(NSMutableSet *)self->_authorizationRequestCompletions removeAllObjects];
}

- (void)scheduleLocationFetchRequestTimeoutForRequest:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  internalQueue = self->_internalQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018BA04;
  v10[3] = &unk_10050A280;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  dispatch_after(v7, internalQueue, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)scheduleAuthorizationRequestTimeoutForCompletionBlock:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018BBF0;
  block[3] = &unk_100505DA8;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, internalQueue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v6 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v6(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v6)(a6, 0, 0, a4);
  }
}

- (void)dismissedAllVisibleAssistantUIForReason:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018BE10;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018BFA0;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

- (void)updateLocationForCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10018C274;
  v15[3] = &unk_100504918;
  v15[4] = self;
  id v16 = a4;
  id v7 = v16;
  id v8 = objc_retainBlock(v15);
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C414;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(internalQueue, block);
}

- (BOOL)shouldSendLocationToServer:(id)a3 forAceCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 maxAge];
    unsigned int v10 = objc_msgSend(v6, "_af_isOlderThanAge:", v9);

    id v11 = AFSiriLogContextLocation;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        id v13 = v11;
        double v14 = [v8 maxAge];
        int v44 = 136315394;
        v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
        __int16 v46 = 2112;
        double v47 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Not sending location to server for server request because location is too old. Max age %@", (uint8_t *)&v44, 0x16u);
      }
LABEL_18:
      BOOL v15 = 0;
      goto LABEL_19;
    }
    if (!v12)
    {
      BOOL v15 = 1;
      goto LABEL_19;
    }
    int v44 = 136315138;
    v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
    id v16 = "%s Sending location to server because it asked us for location update";
    BOOL v15 = 1;
    goto LABEL_10;
  }
  if (![(id)objc_opt_class() _shouldUseOneshotLocationRequest])
  {
    if (![(ADLocationManager *)self allowAdHocSendingLocationToServer])
    {
      long long v17 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        int v44 = 136315138;
        v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Not sending location to server because running full UOD", (uint8_t *)&v44, 0xCu);
      }
      goto LABEL_18;
    }
    if ([(ADLocationManager *)self needsToSendLocation])
    {
      id v11 = AFSiriLogContextLocation;
      BOOL v15 = 1;
      if (!os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      int v44 = 136315138;
      v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
      id v16 = "%s Sending location to server because of needsToSendLocation override";
      goto LABEL_10;
    }
    long long v19 = [(ADLocationManager *)self locationSentToServer];
    if (v19)
    {
      if ([(ADLocationManager *)self isNavigating]) {
        double v20 = 1.0;
      }
      else {
        double v20 = 5.0;
      }
      long long v21 = [v6 timestamp];
      long long v22 = [v19 timestamp];
      [v21 timeIntervalSinceDate:v22];
      double v24 = v23;

      if (v24 - v20 <= 2.22044605e-16)
      {
        v35 = AFSiriLogContextLocation;
        if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
        {
          int v44 = 136315650;
          v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
          __int16 v46 = 2048;
          double v47 = v24;
          __int16 v48 = 2048;
          double v49 = v20;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Not sending location to server because location age difference %.3g is less than or equal to %.3g", (uint8_t *)&v44, 0x20u);
        }
        goto LABEL_39;
      }
      objc_msgSend(v6, "horizontalAccuracy", v24 - v20);
      double v26 = v25;
      [v19 horizontalAccuracy];
      if (v26 - v27 < -2.22044605e-16)
      {
        id v28 = (void *)AFSiriLogContextLocation;
        BOOL v15 = 1;
        if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
        {
          long long v29 = v28;
          [v6 horizontalAccuracy];
          double v31 = v30;
          [v19 horizontalAccuracy];
          int v44 = 136315650;
          v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
          __int16 v46 = 2048;
          double v47 = v31;
          __int16 v48 = 2048;
          double v49 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Sending location to server because new location accuracy %.3g is better than old %.3g", (uint8_t *)&v44, 0x20u);
        }
        goto LABEL_40;
      }
      [v6 horizontalAccuracy];
      if (v36 - kCLLocationAccuracyHundredMeters <= 2.22044605e-16
        && ([v19 horizontalAccuracy], v37 - kCLLocationAccuracyHundredMeters <= 2.22044605e-16)
        && ([v19 distanceFromLocation:v6], v38 + -10.0 >= 2.22044605e-16))
      {
        v33 = AFSiriLogContextLocation;
        BOOL v15 = 1;
        if (!os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO)) {
          goto LABEL_40;
        }
        int v44 = 136315138;
        v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
        v34 = "%s Sending location to server because new location is further than 10m from previously sent";
      }
      else
      {
        [v6 verticalAccuracy];
        if (v39 + -30.0 > 2.22044605e-16
          || ([v19 verticalAccuracy], v40 + -30.0 > 2.22044605e-16)
          || ([v6 altitude], double v42 = v41, objc_msgSend(v19, "altitude"), vabdd_f64(v42, v43) < 10.0))
        {
LABEL_39:
          BOOL v15 = 0;
          goto LABEL_40;
        }
        v33 = AFSiriLogContextLocation;
        BOOL v15 = 1;
        if (!os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO)) {
          goto LABEL_40;
        }
        int v44 = 136315138;
        v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
        v34 = "%s Sending location to server because location altitude has changed for more than 50 centimeters";
      }
    }
    else
    {
      v33 = AFSiriLogContextLocation;
      BOOL v15 = 1;
      if (!os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
LABEL_40:

        goto LABEL_19;
      }
      int v44 = 136315138;
      v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
      v34 = "%s Sending location to server because never sent it to server during this session";
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, v34, (uint8_t *)&v44, 0xCu);
    goto LABEL_40;
  }
  id v11 = AFSiriLogContextLocation;
  BOOL v15 = 1;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v44 = 136315138;
    v45 = "-[ADLocationManager shouldSendLocationToServer:forAceCommand:]";
    id v16 = "%s Sending location to server because because it's running on stationary device";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v44, 0xCu);
  }
LABEL_19:

  return v15;
}

- (void)updateLocationSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018CEA4;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)updateLocationSnapshot
{
  id v8 = [(ADLocationManager *)self createCurrentLocationSnapshot];
  if (v8)
  {
    uint64_t v2 = +[NSDate date];
    id v3 = objc_alloc((Class)AFDeviceContextMetadata);
    uint64_t v4 = AFDeviceContextKeyLocation;
    BOOL v5 = [v2 dateByAddingTimeInterval:300.0];
    id v6 = [v3 initWithType:v4 deliveryDate:v2 expirationDate:v5 redactedKeyPaths:0 historyConfiguration:0];

    id v7 = +[AFContextDonationService defaultService];
    [v7 donateContext:v8 withMetadata:v6 pushToRemote:0];
  }
}

- (id)createCurrentLocationSnapshot
{
  id v3 = [(ADLocationManager *)self currentState];
  uint64_t v5 = v4;
  id v6 = AFSiriLogContextLocation;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if ((v3 & 1) == 0)
  {
    if (v7)
    {
      int v14 = 136315138;
      BOOL v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Generating location snapshot for location services disabled", (uint8_t *)&v14, 0xCu);
    }
    id v8 = &stru_1005048D0;
    goto LABEL_9;
  }
  if (v7)
  {
    int v14 = 136315650;
    BOOL v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
    __int16 v16 = 1024;
    int v17 = HIDWORD(v3);
    __int16 v18 = 2048;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Generating location snapshot for authorization status: %d, accuracy authorization: %ld", (uint8_t *)&v14, 0x1Cu);
  }
  if (HIDWORD(v3) < 3)
  {
    id v8 = &stru_1005048F0;
LABEL_9:
    id v9 = +[AFLocationSnapshot newWithBuilder:v8];
    goto LABEL_10;
  }
  if ((HIDWORD(v3) - 3) >= 2) {
    goto LABEL_20;
  }
  id v11 = [(ADLocationManager *)self locationForSnapshot];
  BOOL v12 = AFSiriLogContextLocation;
  BOOL v13 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v13)
    {
      int v14 = 136315138;
      BOOL v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s No cached location available to create location snapshot", (uint8_t *)&v14, 0xCu);
    }
LABEL_20:
    id v9 = 0;
    goto LABEL_10;
  }
  if (v13)
  {
    int v14 = 136315138;
    BOOL v15 = "-[ADLocationManager createCurrentLocationSnapshot]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Creating location snapshot from cached location", (uint8_t *)&v14, 0xCu);
  }
  id v9 = objc_msgSend(objc_alloc((Class)AFLocationSnapshot), "initWithLocation:locationManagerState:", v11, v3, v5);

LABEL_10:
  return v9;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[(ADLocationManager *)self currentState];
  id v7 = v6;
  unint64_t v21 = HIDWORD(v5);
  id v8 = v4;
  BOOL v9 = +[CLLocationManager locationServicesEnabled];
  id v10 = [v8 authorizationStatus];
  id v11 = [v8 accuracyAuthorization];

  -[ADLocationManager setCurrentState:](self, "setCurrentState:", v9 | ((void)v10 << 32), v11);
  if (!self->_isLocationManagerReady)
  {
    self->_isLocationManagerReady = 1;
    BOOL v12 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v27 = "-[ADLocationManager locationManagerDidChangeAuthorization:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Got our first location authorization callback", buf, 0xCu);
    }
    dispatch_group_leave((dispatch_group_t)self->_initialLocationAuthorizationCallbackGroup);
  }
  BOOL v13 = +[AFAnalytics sharedAnalytics];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10018D6F4;
  v25[3] = &unk_100504890;
  v25[6] = v11;
  v25[7] = v5;
  v25[8] = v7;
  v25[4] = self;
  v25[5] = v9 | ((void)v10 << 32);
  [v13 logEventWithType:1929 contextProvider:v25 contextProvidingQueue:self->_internalQueue];

  if (((v5 & 1) == 0) == v9 || v10 != HIDWORD(v5) || v11 != v7)
  {
    int v14 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = v14;
      __int16 v16 = +[NSNumber numberWithBool:v9];
      int v17 = +[NSNumber numberWithInt:v11 == 0];
      *(_DWORD *)buf = 136315906;
      double v27 = "-[ADLocationManager locationManagerDidChangeAuthorization:]";
      __int16 v28 = 1024;
      int v29 = (int)v10;
      __int16 v30 = 2112;
      double v31 = v16;
      __int16 v32 = 2112;
      v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Authorization status changed to %d, isEnabled: %@, preciseLocationEnabled: %@", buf, 0x26u);
    }
    if (v10 == 1 || v21 == 1)
    {
      __int16 v18 = +[NSNotificationCenter defaultCenter];
      [v18 postNotificationName:@"ADLocationRestrictionDidChangeNotification" object:0];
    }
    [(ADLocationManager *)self _cancelLocationSLATimer];
    if (v10 >= 3)
    {
      if ((v10 - 3) >= 2)
      {
LABEL_32:
        [(ADLocationManager *)self drainAuthorizationRequestCompletionsWithPossibleError:0];
        goto LABEL_33;
      }
      uint64_t v19 = [(ADLocationManager *)self locationForSnapshot];
      if (v19)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10018D8DC;
        v23[3] = &unk_10050D618;
        v23[4] = self;
        [(ADLocationManager *)self _generateResponseForGetRequestOriginCommand:0 withUnshiftedLocation:v19 completion:v23];
      }
      else
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10018D978;
        v22[3] = &unk_10050D618;
        v22[4] = self;
        [(ADLocationManager *)self _generateLocationUnknownResponseForGetRequestOriginCommand:0 completion:v22];
      }
      if (v10 == v21)
      {
        if (v7 && !v11) {
          [(ADLocationManager *)self forceLocationUpdateFromCoreLocation];
        }
      }
      else
      {
        [(ADLocationManager *)self startLocationPrefetchRoutine];
      }
    }
    else
    {
      [(ADLocationManager *)self setLastShiftedLocation:0];
      uint64_t v19 = self->_requestOriginCommand;
      double v20 = objc_retainBlock(self->_updateCompletion);
      if (!v20)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10018D840;
        v24[3] = &unk_10050D618;
        v24[4] = self;
        double v20 = objc_retainBlock(v24);
      }
      if (v9) {
        [(ADLocationManager *)self _generateLocationDeniedResponseForGetRequestOriginCommand:v19 completion:v20];
      }
      else {
        [(ADLocationManager *)self _generateLocationDisabledResponseForGetRequestOriginCommand:v19 completion:v20];
      }
      if (self->_updateCompletion) {
        [(ADLocationManager *)self _clearCompletionState];
      }
    }
    goto LABEL_32;
  }
LABEL_33:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADLocationManager locationManager:didFailWithError:]";
    __int16 v32 = 2114;
    id v33 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  BOOL v9 = +[AFAnalytics sharedAnalytics];
  double v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  double v27 = sub_10018DEA4;
  __int16 v28 = &unk_10050A230;
  id v10 = v7;
  id v29 = v10;
  __int16 v30 = self;
  [v9 logEventWithType:1929 contextProvider:&v25 contextProvidingQueue:self->_internalQueue];

  id v11 = objc_msgSend(v10, "domain", v25, v26, v27, v28);
  unsigned int v12 = [v11 isEqualToString:kCLErrorDomain];

  if (!v12)
  {
LABEL_8:
    int v14 = 0;
    goto LABEL_9;
  }
  BOOL v13 = (char *)[v10 code];
  if (!v13)
  {
    if (![(id)objc_opt_class() _shouldUseOneshotLocationRequest]) {
      goto LABEL_19;
    }
    goto LABEL_8;
  }
  int v14 = v13;
  if (v13 == (char *)1) {
    [v6 stopUpdatingLocation];
  }
LABEL_9:
  [(ADLocationManager *)self _cancelLocationTimer];
  [(ADLocationManager *)self _cancelLocationSLATimer];
  BOOL v15 = self->_requestOriginCommand;
  if (v15)
  {
    id updateCompletion = self->_updateCompletion;
    if (v14 == (char *)1) {
      [(ADLocationManager *)self _generateLocationDeniedResponseForGetRequestOriginCommand:v15 completion:updateCompletion];
    }
    else {
      [(ADLocationManager *)self _generateLocationUnknownResponseForGetRequestOriginCommand:v15 completion:updateCompletion];
    }
    [(ADLocationManager *)self _clearCompletionState];
  }

  if ((unint64_t)(v14 - 1) < 2)
  {
    NSErrorUserInfoKey v36 = NSUnderlyingErrorKey;
    *(void *)buf = v10;
    id v17 = v10;
    __int16 v18 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v36 count:1];
    uint64_t v19 = +[NSError errorWithDomain:kAFLocationServiceErrorDomain code:6 userInfo:v18];

    [(ADLocationManager *)self drainLocationFetchRequestsWithPossibleError:v19];
    goto LABEL_21;
  }
  if (v14 == (char *)18)
  {
    double v20 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
    {
      authorizationRequestCompletions = self->_authorizationRequestCompletions;
      long long v22 = v20;
      id v23 = [(NSMutableSet *)authorizationRequestCompletions count];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADLocationManager locationManager:didFailWithError:]";
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2048;
      id v35 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s CoreLocation decline presenting authorization prompt with error: %@. This error is intentionally ignored. Currently awaiting requests count: %lu", buf, 0x20u);
    }
    goto LABEL_21;
  }
LABEL_19:
  double v24 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADLocationManager locationManager:didFailWithError:]";
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s LocationService not handling error %{public}@", buf, 0x16u);
  }
LABEL_21:
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v6 lastObject];
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    __int16 v28 = "-[ADLocationManager locationManager:didUpdateLocations:]";
    __int16 v29 = 2113;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  uint64_t v9 = mach_absolute_time();
  kdebug_trace();
  [(ADLocationManager *)self _cancelLocationSLATimer];
  id v10 = +[AFAnalytics sharedAnalytics];
  v25[0] = @"locationTimestamp";
  id v11 = [v7 timestamp];
  [v11 timeIntervalSince1970];
  unsigned int v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v26[0] = v12;
  v25[1] = @"horizontalAccuracy";
  [v7 horizontalAccuracy];
  BOOL v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v26[1] = v13;
  v25[2] = @"refID";
  uint64_t v14 = [(SAGetRequestOrigin *)self->_requestOriginCommand aceId];
  BOOL v15 = (void *)v14;
  CFStringRef v16 = @"NULL";
  if (v14) {
    CFStringRef v16 = (const __CFString *)v14;
  }
  v26[2] = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3, v18);
  [v10 logEventWithType:1929 machAbsoluteTime:v9 context:v17];

  [(ADLocationManager *)self _processUpdatedLocation:v7];
  objc_initWeak((id *)buf, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10018E33C;
  v23[3] = &unk_10050CCD8;
  objc_copyWeak(v24, (id *)buf);
  v24[1] = (id)a2;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10018E47C;
  v21[3] = &unk_100504868;
  objc_copyWeak(v22, (id *)buf);
  v22[1] = (id)a2;
  [(ADLocationManager *)self shiftLocationWithTimeout:v7 timeoutHandler:v23 completion:v21];
  objc_destroyWeak(v22);
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);
}

- (void)peerLocationConnectionSuggestsClearingCachedLocation:(id)a3
{
  id v4 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADLocationManager peerLocationConnectionSuggestsClearingCachedLocation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018E730;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)peerLocationConnection:(id)a3 didReceiveUnsolicitedLocation:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    unsigned int v12 = "-[ADLocationManager peerLocationConnection:didReceiveUnsolicitedLocation:]";
    __int16 v13 = 2113;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  internalQueue = self->_internalQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10018E874;
  v9[3] = &unk_10050E160;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(internalQueue, v9);
}

- (void)_processUpdatedLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(ADLocationManager *)self lastLocation];
  id v6 = self->_requestOriginCommand;
  if ([(ADLocationManager *)self shouldSendLocationToServer:v4 forAceCommand:v6])
  {
    [(ADLocationManager *)self _cancelLocationTimer];
    -[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:](self, "_generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:", v6, v4);
    [(ADLocationManager *)self _clearCompletionState];
  }
  id v7 = v4;
  id v8 = v5;
  uint64_t v9 = v8;
  id v10 = v8;
  if (v7)
  {
    id v10 = v7;
    if (v8)
    {
      if (objc_msgSend(v7, "ad_isNewerThan:", v8)) {
        id v10 = v7;
      }
      else {
        id v10 = v9;
      }
    }
  }
  id v11 = v10;

  [(ADLocationManager *)self setLastLocation:v11];
  [(ADLocationManager *)self updateLocationSnapshot];
}

- (BOOL)_locationUpdateIsCapableOfSucceeding
{
  return 1;
}

- (id)locationForSnapshot
{
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    id v3 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADLocationManager locationForSnapshot]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Using lastShiftedLocation for location snapshot", (uint8_t *)&v9, 0xCu);
    }
    id v4 = [(ADLocationManager *)self lastShiftedLocation];
  }
  else
  {
    id v5 = [(ADLocationManager *)self lastLocation];
    id v6 = AFSiriLogContextLocation;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        int v9 = 136315138;
        id v10 = "-[ADLocationManager locationForSnapshot]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Using lastLocation for location snapshot", (uint8_t *)&v9, 0xCu);
      }
      id v4 = [(ADLocationManager *)self shiftLocationUsingCachedShifterFunction:v5];
    }
    else
    {
      if (v7)
      {
        int v9 = 136315138;
        id v10 = "-[ADLocationManager locationForSnapshot]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s No cached location available to shift for location snapshot", (uint8_t *)&v9, 0xCu);
      }
      id v4 = 0;
    }
  }
  return v4;
}

- (void)_requestLocationForGetRequestOrigin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[ADLocationManager _requestLocationForGetRequestOrigin:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Requesting best location", (uint8_t *)&v13, 0xCu);
  }
  int v9 = (SAGetRequestOrigin *)[v6 copy];
  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = v9;

  id v11 = objc_retainBlock(v7);
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = v11;

  [(ADLocationManager *)self _requestLocationWithBestAccuracy];
}

- (void)_requestLocationWithBestAccuracy
{
  if (!self->_locationTimerSource)
  {
    id v3 = [(ADLocationManager *)self _locationManager];
    [v3 requestLocation];

    if (AFIsNano())
    {
      id v4 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v8 = "-[ADLocationManager _requestLocationWithBestAccuracy]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Asking for location from peer", buf, 0xCu);
      }
      id v5 = [(ADLocationManager *)self _peerLocationConnection];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10018EFBC;
      v6[3] = &unk_100504840;
      v6[4] = self;
      [v5 getBestLocationWithCompletion:v6];
    }
  }
  [(ADLocationManager *)self _scheduleLocationTimerWithTimeout:10.0];
}

- (void)_startMonitoringLocationForGetRequestOrigin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[ADLocationManager _startMonitoringLocationForGetRequestOrigin:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Starting location monitoring", (uint8_t *)&v16, 0xCu);
  }
  int v9 = (SAGetRequestOrigin *)[v6 copy];
  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = v9;

  id v11 = objc_retainBlock(v7);
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = v11;

  [v6 desiredCLAccuracy];
  -[ADLocationManager _startMonitoringLocationWithDesiredAccuracy:](self, "_startMonitoringLocationWithDesiredAccuracy:");
  int v13 = [v6 searchTimeout];
  [v13 doubleValue];
  double v15 = v14;

  if (v15 > 0.0) {
    [(ADLocationManager *)self _scheduleLocationTimerWithTimeout:v15];
  }
}

- (void)_startMonitoringLocationWithDesiredAccuracy:(double)a3
{
  id v5 = +[AFAnalytics sharedAnalytics];
  v11[0] = @"desiredAccuracy";
  id v6 = +[NSNumber numberWithDouble:a3];
  v11[1] = @"refID";
  v12[0] = v6;
  uint64_t v7 = [(SAGetRequestOrigin *)self->_requestOriginCommand aceId];
  id v8 = (void *)v7;
  CFStringRef v9 = @"NULL";
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  v12[1] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v5 logEventWithType:1928 context:v10];

  [(ADLocationManager *)self upgradeAccuracyIfNeeded:a3];
  [(ADLocationManager *)self startLocationUpdateSession];
  [(ADLocationManager *)self setLastLocation:0];
  [(ADLocationManager *)self _scheduleLocationSLATimer];
}

- (void)_scheduleLocationTimerWithTimeout:(double)a3
{
  [(ADLocationManager *)self _cancelLocationTimer];
  id v5 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "-[ADLocationManager _scheduleLocationTimerWithTimeout:]";
    __int16 v14 = 2048;
    double v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Scheduling location timer for %lf", buf, 0x16u);
  }
  id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
  locationTimerSource = self->_locationTimerSource;
  self->_locationTimerSource = v6;

  id v8 = self->_locationTimerSource;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v10 = self->_locationTimerSource;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10018F578;
  v11[3] = &unk_10050D8C0;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_locationTimerSource);
}

- (void)_cancelLocationTimer
{
  locationTimerSource = self->_locationTimerSource;
  if (locationTimerSource)
  {
    id v4 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ADLocationManager _cancelLocationTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Canceling location timer", (uint8_t *)&v6, 0xCu);
      locationTimerSource = self->_locationTimerSource;
    }
    dispatch_source_cancel(locationTimerSource);
    id v5 = self->_locationTimerSource;
    self->_locationTimerSource = 0;
  }
}

- (void)_scheduleLocationSLATimer
{
  if (AFIsInternalInstall())
  {
    locationSLATimerSource = self->_locationSLATimerSource;
    id v4 = AFSiriLogContextLocation;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
    if (locationSLATimerSource)
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315138;
        int v13 = "-[ADLocationManager _scheduleLocationSLATimer]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Already waiting for a response", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315394;
        int v13 = "-[ADLocationManager _scheduleLocationSLATimer]";
        __int16 v14 = 2048;
        uint64_t v15 = 0x3FBD70A3D70A3D71;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Scheduling location-SLA timer for %lf", buf, 0x16u);
      }
      int v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
      uint64_t v7 = self->_locationSLATimerSource;
      self->_locationSLATimerSource = v6;

      id v8 = self->_locationSLATimerSource;
      dispatch_time_t v9 = dispatch_time(0, 115000000);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      id v10 = self->_locationSLATimerSource;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10018FA04;
      handler[3] = &unk_10050E138;
      void handler[4] = self;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume((dispatch_object_t)self->_locationSLATimerSource);
    }
  }
}

- (void)_triggerLocationABCForSubtype:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SAGetRequestOrigin *)self->_requestOriginCommand aceId];
  int v6 = (void *)v5;
  if (v5)
  {
    CFStringRef v15 = @"refID";
    uint64_t v16 = v5;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    uint64_t v7 = &__NSDictionary0__struct;
  }
  id v8 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    id v10 = "-[ADLocationManager _triggerLocationABCForSubtype:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s SERIOUS PROBLEM FETCHING LOCATION %@ %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_cancelLocationSLATimer
{
  locationSLATimerSource = self->_locationSLATimerSource;
  if (locationSLATimerSource)
  {
    id v4 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ADLocationManager _cancelLocationSLATimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Canceling Location-SLA timer", (uint8_t *)&v6, 0xCu);
      locationSLATimerSource = self->_locationSLATimerSource;
    }
    dispatch_source_cancel(locationSLATimerSource);
    uint64_t v5 = self->_locationSLATimerSource;
    self->_locationSLATimerSource = 0;
  }
}

- (void)_clearCompletionState
{
  id updateCompletion = self->_updateCompletion;
  self->_id updateCompletion = 0;

  requestOriginCommand = self->_requestOriginCommand;
  self->_requestOriginCommand = 0;
}

- (void)_generateLocationUnknownResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationTimedOutResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationWiFiOffResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationDeniedResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateLocationDisabledResponseForGetRequestOriginCommand:(id)a3 completion:(id)a4
{
}

- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withStatus:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v8 = (void (**)(id, id))a5;
    id v9 = a4;
    id v10 = a3;
    id v15 = (id)objc_opt_new();
    [v15 setStatus:v9];

    [(ADLocationManager *)self currentState];
    id v12 = +[NSNumber numberWithInt:v11 == 0];
    [v15 setPreciseLocationEnabled:v12];

    __int16 v13 = [v10 aceId];
    [v15 setRefId:v13];

    __int16 v14 = [v10 desiredAccuracy];

    [v15 setDesiredAccuracy:v14];
    v8[2](v8, v15);
  }
}

- (void)_generateResponseForGetRequestOriginCommand:(id)a3 withUnshiftedLocation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    id v12 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      double v24 = "-[ADLocationManager _generateResponseForGetRequestOriginCommand:withUnshiftedLocation:completion:]";
      __int16 v25 = 2113;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Attempting to shift from location: %{private}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100190104;
    v19[3] = &unk_1005047F0;
    objc_copyWeak(v22, (id *)buf);
    v22[1] = (id)a2;
    id v13 = v9;
    id v20 = v13;
    id v14 = v11;
    id v21 = v14;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100190210;
    v15[3] = &unk_100504818;
    objc_copyWeak(v18, (id *)buf);
    v18[1] = (id)a2;
    id v16 = v13;
    id v17 = v14;
    [(ADLocationManager *)self shiftLocationWithTimeout:v10 timeoutHandler:v19 completion:v15];

    objc_destroyWeak(v18);
    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)shiftLocationWithTimeout:(id)a3 timeoutHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADLocationManager shiftLocationWithTimeout:timeoutHandler:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Starting location shifting routine", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001906AC;
  block[3] = &unk_10050CA58;
  p_long long buf = &buf;
  id v14 = v9;
  id v20 = v14;
  dispatch_after(v12, internalQueue, block);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100190780;
  v16[3] = &unk_1005047C8;
  id v18 = &buf;
  id v15 = v10;
  id v17 = v15;
  [(ADLocationManager *)self shiftLocation:v8 completion:v16];

  _Block_object_dispose(&buf, 8);
}

- (void)shiftLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, void))a4;
  if ([v6 referenceFrame] == 2)
  {
    id v8 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v23 = "-[ADLocationManager shiftLocation:completion:]";
      id v9 = "%s Location is already shifted";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  [v6 coordinate];
  double v11 = v10;
  double v13 = v12;
  [v6 horizontalAccuracy];
  double v15 = v14;
  if ((+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", v11, v13) & 1) == 0)
  {
    id v8 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v23 = "-[ADLocationManager shiftLocation:completion:]";
      id v9 = "%s Location shifting is not needed";
      goto LABEL_8;
    }
LABEL_9:
    v7[2](v7, v6, 0);
    goto LABEL_10;
  }
  id v16 = [(ADLocationManager *)self _locationShifter];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100190A20;
  v19[3] = &unk_100504780;
  id v20 = v6;
  id v21 = v7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100190B9C;
  v17[3] = &unk_10050D440;
  id v18 = v21;
  objc_msgSend(v16, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v19, &stru_1005047A0, v17, self->_internalQueue, v11, v13, v15);

LABEL_10:
}

- (id)shiftLocationUsingCachedShifterFunction:(id)a3
{
  id v4 = a3;
  if ([v4 referenceFrame] == 2) {
    goto LABEL_5;
  }
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;
  double v28 = v5;
  double v29 = v7;
  [v4 horizontalAccuracy];
  double v10 = v9;
  double v27 = v9;
  if ((+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", v6, v8) & 1) == 0)
  {
LABEL_5:
    id v24 = v4;
  }
  else
  {
    double v11 = [(ADLocationManager *)self _locationShifter];
    unsigned int v12 = objc_msgSend(v11, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", &v28, &v27, v6, v8, v10);

    if (v12)
    {
      double v13 = v27;
      CLLocationDegrees v14 = v28;
      CLLocationDegrees v15 = v29;
      id v16 = v4;
      CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v14, v15);
      id v18 = objc_alloc((Class)CLLocation);
      [v16 altitude];
      double v20 = v19;
      [v16 verticalAccuracy];
      double v22 = v21;
      uint64_t v23 = [v16 timestamp];

      id v24 = objc_msgSend(v18, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v23, 2, v17.latitude, v17.longitude, v20, v13, v22);
    }
    else
    {
      id v26 = AFSiriLogContextLocation;
      if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        double v31 = "-[ADLocationManager shiftLocationUsingCachedShifterFunction:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s Cache-based location shifting failed", buf, 0xCu);
      }
      id v24 = 0;
    }
  }

  return v24;
}

- (void)navStatusChanged:(id)a3
{
  externalQueue = self->_externalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100190FA8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(externalQueue, block);
}

- (id)_locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    id v4 = (GEOLocationShifter *)objc_opt_new();
    double v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (id)_peerLocationConnection
{
  peerLocationConnection = self->_peerLocationConnection;
  if (!peerLocationConnection)
  {
    id v4 = [[ADPeerLocationConnection alloc] initWithDelegate:self];
    double v5 = self->_peerLocationConnection;
    self->_peerLocationConnection = v4;

    peerLocationConnection = self->_peerLocationConnection;
  }
  return peerLocationConnection;
}

- (id)_locationManager
{
  locationManager = self->_locationManager;
  if (!locationManager)
  {
    id v4 = objc_alloc((Class)CLLocationManager);
    double v5 = AFEffectiveSiriBundlePathForLocation();
    double v6 = (CLLocationManager *)[v4 initWithEffectiveBundlePath:v5 delegate:self onQueue:self->_internalQueue];
    double v7 = self->_locationManager;
    self->_locationManager = v6;

    [(CLLocationManager *)self->_locationManager registerAsLocationClient];
    double v8 = self->_locationManager;
    LODWORD(v4) = +[CLLocationManager locationServicesEnabled];
    id v9 = (id)[(CLLocationManager *)v8 authorizationStatus];
    id v10 = [(CLLocationManager *)v8 accuracyAuthorization];

    -[ADLocationManager setCurrentState:](self, "setCurrentState:", v4 | ((void)v9 << 32), v10);
    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)setLocationSentToServer:(id)a3
{
  p_locationSentToServerLock = &self->_locationSentToServerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_locationSentToServerLock);
  double v6 = (CLLocation *)[v5 copy];

  locationSentToServer = self->_locationSentToServer;
  self->_locationSentToServer = v6;

  os_unfair_lock_unlock(p_locationSentToServerLock);
}

- (CLLocation)locationSentToServer
{
  p_locationSentToServerLock = &self->_locationSentToServerLock;
  os_unfair_lock_lock(&self->_locationSentToServerLock);
  id v4 = [(CLLocation *)self->_locationSentToServer copy];
  os_unfair_lock_unlock(p_locationSentToServerLock);
  return (CLLocation *)v4;
}

- (void)setLastShiftedLocation:(id)a3
{
  p_lastShiftedLocationLock = &self->_lastShiftedLocationLock;
  id v5 = a3;
  os_unfair_lock_lock(p_lastShiftedLocationLock);
  double v6 = (CLLocation *)[v5 copy];

  lastShiftedLocation = self->_lastShiftedLocation;
  self->_lastShiftedLocation = v6;

  os_unfair_lock_unlock(p_lastShiftedLocationLock);
}

- (CLLocation)lastShiftedLocation
{
  p_lastShiftedLocationLock = &self->_lastShiftedLocationLock;
  os_unfair_lock_lock(&self->_lastShiftedLocationLock);
  id v4 = [(CLLocation *)self->_lastShiftedLocation copy];
  os_unfair_lock_unlock(p_lastShiftedLocationLock);
  return (CLLocation *)v4;
}

- (void)setLastLocation:(id)a3
{
  p_lastLocationLock = &self->_lastLocationLock;
  id v5 = a3;
  os_unfair_lock_lock(p_lastLocationLock);
  double v6 = (CLLocation *)[v5 copy];

  lastLocation = self->_lastLocation;
  self->_lastLocation = v6;

  os_unfair_lock_unlock(p_lastLocationLock);
}

- (CLLocation)lastLocation
{
  p_lastLocationLock = &self->_lastLocationLock;
  os_unfair_lock_lock(&self->_lastLocationLock);
  id v4 = [(CLLocation *)self->_lastLocation copy];
  os_unfair_lock_unlock(p_lastLocationLock);
  return (CLLocation *)v4;
}

- (CLLocation)knownLocation
{
  if (self->_isSiriLocationServicesPromptingEnabled) {
    [(ADLocationManager *)self lastShiftedLocation];
  }
  else {
  uint64_t v2 = [(ADLocationManager *)self lastLocation];
  }
  return (CLLocation *)v2;
}

- (void)dealloc
{
  id v3 = AFSiriLogContextLocation;
  if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v9 = "-[ADLocationManager dealloc]";
    __int16 v10 = 2048;
    double v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  id v4 = +[NSError errorWithDomain:kAFLocationServiceErrorDomain code:0 userInfo:0];
  [(ADLocationManager *)self drainAuthorizationRequestCompletionsWithPossibleError:v4];
  [(ADLocationManager *)self drainLocationFetchRequestsWithPossibleError:v4];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:AFPreferencesNavStatusDidChangeNotification object:0];

  if (!self->_doNotClearLocationManagerDelegateForUnitTests) {
    [(CLLocationManager *)self->_locationManager setDelegate:0];
  }
  [(ADLocationManager *)self _cancelLocationTimer];
  locationUpdateSessionTeardownTimer = self->_locationUpdateSessionTeardownTimer;
  if (locationUpdateSessionTeardownTimer) {
    dispatch_source_cancel(locationUpdateSessionTeardownTimer);
  }

  v7.receiver = self;
  v7.super_class = (Class)ADLocationManager;
  [(ADLocationManager *)&v7 dealloc];
}

- (ADLocationManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ADLocationManager;
  id v6 = [(ADLocationManager *)&v32 init];
  if (v6)
  {
    objc_super v7 = AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v34 = "-[ADLocationManager initWithSerialQueue:]";
      __int16 v35 = 2048;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    dispatch_group_t v8 = dispatch_group_create();
    id v9 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v8;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 12));
    if (AFIsNano())
    {
      [v6 _peerLocationConnection];
    }
    *((void *)v6 + 19) = 0;
    *((_DWORD *)v6 + 40) = 0;
    *((unsigned char *)v6 + 195) = 1;
    objc_storeStrong((id *)v6 + 6, a3);
    __int16 v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v12 = dispatch_queue_create("ADLocationManager", v11);
    double v13 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v12;

    *((unsigned char *)v6 + 193) = 1;
    *((unsigned char *)v6 + 194) = AFMapsNavigationStatusIsActive();
    uint64_t v14 = objc_opt_new();
    CLLocationDegrees v15 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v14;

    id v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v6 selector:"navStatusChanged:" name:AFPreferencesNavStatusDidChangeNotification object:0];

    CLLocationCoordinate2D v17 = +[AFContextDonationService defaultService];
    [v17 registerContextTransformer:v6 forType:AFDeviceContextKeyLocation];

    id v18 = *((id *)v6 + 1);
    double v19 = +[ADQueueMonitor sharedMonitor];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100191914;
    v30[3] = &unk_10050C458;
    id v31 = v18;
    id v20 = v18;
    [v19 addQueue:v20 heartBeatInterval:v30 timeoutInterval:5.0 timeoutHandler:5.0];

    *((unsigned char *)v6 + 128) = +[AFFeatureFlags isSiriLocationServicesPromptingEnabled];
    *((unsigned char *)v6 + 224) = 0;
    *((_DWORD *)v6 + 57) = 0;
    *((void *)v6 + 29) = 0;
    uint64_t v21 = +[NSMutableSet set];
    double v22 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v21;

    uint64_t v23 = +[NSMutableSet set];
    id v24 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v23;

    *((void *)v6 + 23) = 0;
    __int16 v25 = *((void *)v6 + 1);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100191A30;
    v28[3] = &unk_10050E138;
    id v26 = (CLLocationAccuracy *)v6;
    double v29 = v26;
    dispatch_async(v25, v28);
    v26[21] = kCLLocationAccuracyThreeKilometers;
    if (AFIsHorseman() && (AFHasGPS() & 1) == 0) {
      v26[21] = kCLLocationAccuracyHundredMeters;
    }
  }
  return (ADLocationManager *)v6;
}

- (void)fetchLocationAuthorization:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->_isSiriLocationServicesPromptingEnabled)
  {
    objc_super v7 = (void *)AFSiriLogContextLocation;
    if (os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_ERROR))
    {
      double v11 = v7;
      dispatch_queue_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[ADLocationManager fetchLocationAuthorization:]";
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Fetching location authorization via %@ is not supported when location service prompting feature is enabled", buf, 0x16u);

      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_4;
    }
    if (v6)
    {
LABEL_4:
      internalQueue = self->_internalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100191C34;
      block[3] = &unk_10050D0D0;
      id v16 = v6;
      dispatch_async(internalQueue, block);
      id v9 = v16;
LABEL_7:
    }
  }
  else if (v5)
  {
    __int16 v10 = self->_internalQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100191C4C;
    v13[3] = &unk_10050E188;
    v13[4] = self;
    id v14 = v5;
    dispatch_async(v10, v13);
    id v9 = v14;
    goto LABEL_7;
  }
LABEL_8:
}

+ (void)prepareForAssistantEnablementInBackground
{
  unsigned int v2 = +[AFFeatureFlags isSiriLocationServicesPromptingEnabled];
  id v3 = AFSiriLogContextLocation;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextLocation, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v6 = 136315138;
      objc_super v7 = "+[ADLocationManager prepareForAssistantEnablementInBackground]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s prepareForAssistantEnablementInBackground is not available when location service prompting feature is enabled, TCC guardflow is in control of location authorization", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      int v6 = 136315138;
      objc_super v7 = "+[ADLocationManager prepareForAssistantEnablementInBackground]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Preparing location subsystem for Siri...", (uint8_t *)&v6, 0xCu);
    }
    id v5 = dispatch_get_global_queue(25, 0);
    dispatch_async(v5, &stru_100504938);
  }
}

@end