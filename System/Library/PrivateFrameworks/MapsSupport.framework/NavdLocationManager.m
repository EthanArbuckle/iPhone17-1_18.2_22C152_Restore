@interface NavdLocationManager
+ (id)sharedInstance;
- (BOOL)_q_isNewLocation:(id)a3 tolerableWithLocation:(id)a4 distance:(double)a5;
- (BOOL)_q_pivotShouldBeUpdatedDistanceToCandidate:(double)a3;
- (BOOL)coarseModeEnabled;
- (NavdLocationManager)init;
- (NavdLocationManager)initWithLocationProvider:(id)a3;
- (double)_q_desiredAccuracyForTransportType:(int)a3 motionType:(unint64_t)a4;
- (double)desiredAccuracy;
- (unint64_t)numberOfRetriesForLocation;
- (void)_q_badCandidateLocation:(id)a3;
- (void)_q_cancelStaleLocationTimer;
- (void)_q_createActivityForLocationUpdate;
- (void)_q_createActivityForStaleLocationUse:(id)a3;
- (void)_q_createActivityToUseStaleLocation:(id)a3 fireAtAbsoluteTime:(double)a4;
- (void)_q_goodCandidateLocation:(id)a3 shouldUpdatePivot:(BOOL)a4;
- (void)_q_locationRefreshActivityFired;
- (void)_q_processCandidateLocation:(id)a3;
- (void)_q_processErrorWhenUpdatingCurrentLocation:(id)a3;
- (void)_q_staleLocationUseActivityFired:(id)a3;
- (void)_q_startLocationUpdate;
- (void)_q_stopLocationUpdate;
- (void)_q_updateDesiredAccuracyBasedOnCadidateDistanceToPivot:(double)a3 candidateDistanceToCurrent:(double)a4;
- (void)dealloc;
- (void)deregisterBackgroundTasks;
- (void)getCurrentLocationWithHandler:(id)a3;
- (void)locationProvider:(id)a3 didReceiveError:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4;
- (void)registerBackgroundTasks;
- (void)setNumberOfRetriesForLocation:(unint64_t)a3;
- (void)startLocationUpdate;
- (void)stopLocationUpdate;
@end

@implementation NavdLocationManager

+ (id)sharedInstance
{
  if (qword_1000A2490 != -1) {
    dispatch_once(&qword_1000A2490, &stru_100089108);
  }
  v2 = (void *)qword_1000A2488;

  return v2;
}

- (NavdLocationManager)init
{
  v3 = +[MNHybridLocationProvider navdInstance];
  v4 = [(NavdLocationManager *)self initWithLocationProvider:v3];

  return v4;
}

- (NavdLocationManager)initWithLocationProvider:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NavdLocationManager;
  v6 = [(NavdLocationManager *)&v17 init];
  if (v6)
  {
    v7 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
    locationShifter = v6->_locationShifter;
    v6->_locationShifter = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    locationHandlers = v6->_locationHandlers;
    v6->_locationHandlers = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("NavdLocationManager", v11);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v12;

    v6->_transportTypeToRequestAccuracyFor = 0;
    objc_storeStrong((id *)&v6->_locationProvider, a3);
    [(NavdLocationProvider *)v6->_locationProvider setDelegate:v6];
    v14 = +[GEONavdDefaults sharedInstance];
    [v14 minimumDistanceToGetLocationUpdatesInMeters];
    -[NavdLocationProvider setDistanceFilter:](v6->_locationProvider, "setDistanceFilter:");

    v15 = +[GEONavdDefaults sharedInstance];
    [v15 locationUpdatesDesiredAccuracyWhileStationaryForDriving];
    -[NavdLocationProvider setDesiredAccuracy:](v6->_locationProvider, "setDesiredAccuracy:");
  }
  return v6;
}

- (void)dealloc
{
  [(NavdLocationManager *)self _q_cancelStaleLocationTimer];
  [(NavdLocationManager *)self deregisterBackgroundTasks];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NavdLocationManager;
  [(NavdLocationManager *)&v4 dealloc];
}

- (void)registerBackgroundTasks
{
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B9D0;
  v5[3] = &unk_100089130;
  v5[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.navd.locationRefreshActivity" usingQueue:serialQueue launchHandler:v5];
}

- (void)deregisterBackgroundTasks
{
  id v2 = +[BGSystemTaskScheduler sharedScheduler];
  [v2 deregisterTaskWithIdentifier:@"com.apple.navd.locationRefreshActivity"];
}

- (void)_q_startLocationUpdate
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    locationProvider = self->_locationProvider;
    int v10 = 138477827;
    v11 = locationProvider;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Asking the NavdLocationManager for a location: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  self->_updatingLocations = 1;
  [(NavdLocationManager *)self registerBackgroundTasks];
  if (!self->_inUseAssertion)
  {
    id v5 = +[CLLocationManager inUseAssertionForNavd];
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v5;
  }
  v7 = +[MNHybridLocationProvider navdInstance];
  [v7 setDelegate:self];

  v8 = +[MNHybridLocationProvider navdInstance];
  [v8 setMode:0];

  v9 = +[MNHybridLocationProvider navdInstance];
  [v9 startUpdatingLocation];
}

- (void)startLocationUpdate
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC34;
  block[3] = &unk_100088EE0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_q_stopLocationUpdate
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopping location updates", v9, 2u);
  }

  objc_super v4 = +[NavdLocationLeecher sharedLeecher];
  id v5 = +[MNHybridLocationProvider navdInstance];
  [v5 setDelegate:v4];

  v6 = +[MNHybridLocationProvider navdInstance];
  [v6 setMode:1];

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    [(CLInUseAssertion *)inUseAssertion invalidate];
    v8 = self->_inUseAssertion;
    self->_inUseAssertion = 0;
  }
  self->_updatingLocations = 0;
}

- (void)stopLocationUpdate
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BDA8;
  block[3] = &unk_100088EE0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (double)desiredAccuracy
{
  [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
  return result;
}

- (BOOL)coarseModeEnabled
{
  return [(NavdLocationProvider *)self->_locationProvider coarseModeEnabled];
}

- (void)getCurrentLocationWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BE68;
    v7[3] = &unk_100089158;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
}

- (BOOL)_q_isNewLocation:(id)a3 tolerableWithLocation:(id)a4 distance:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[GEONavdDefaults sharedInstance];
  [v9 minimumDistanceToCompareAgainstLocationAccuracy];
  double v11 = v10;

  if (v11 >= a5)
  {
    BOOL v15 = 1;
  }
  else
  {
    [v8 horizontalAccuracy];
    double v13 = v12;
    [v7 horizontalAccuracy];
    if (v13 >= v14) {
      double v14 = v13;
    }
    BOOL v15 = v14 <= a5;
  }

  return v15;
}

- (BOOL)_q_pivotShouldBeUpdatedDistanceToCandidate:(double)a3
{
  [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
  if (v5 < a3) {
    return 1;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = [(CLLocation *)self->_pivotLocation timestamp];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = Current - v8;
  double v10 = +[GEONavdDefaults sharedInstance];
  [v10 locationFreshnessThreshold];
  BOOL v12 = v9 > v11;

  return v12;
}

- (double)_q_desiredAccuracyForTransportType:(int)a3 motionType:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  switch(a3)
  {
    case 0:
    case 3:
      if (a4 == 1)
      {
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyForDriving];
      }
      else
      {
        if (a4) {
          goto LABEL_11;
        }
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyWhileStationaryForDriving];
      }
      goto LABEL_20;
    case 1:
      if (a4 == 1)
      {
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyForTransit];
      }
      else
      {
        if (a4) {
          goto LABEL_11;
        }
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyWhileStationaryForTransit];
      }
      goto LABEL_20;
    case 2:
      if (a4 == 1)
      {
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyForWalking];
        goto LABEL_20;
      }
      if (!a4)
      {
        id v7 = +[GEONavdDefaults sharedInstance];
        [v7 locationUpdatesDesiredAccuracyWhileStationaryForWalking];
LABEL_20:
        double v12 = v8;

        return v12;
      }
LABEL_11:
      GEOFindOrCreateLog();
      double v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (v5 >= 7)
        {
          double v10 = +[NSString stringWithFormat:@"(unknown: %i)", v5];
        }
        else
        {
          double v10 = *(&off_1000891F0 + (int)v5);
        }
        *(_DWORD *)buf = 138543618;
        double v14 = v10;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unsupported transport type when calculating desired accuracy: %{public}@ (motion type was %lu)", buf, 0x16u);
      }
      [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
      return result;
    default:
      goto LABEL_11;
  }
}

- (void)_q_updateDesiredAccuracyBasedOnCadidateDistanceToPivot:(double)a3 candidateDistanceToCurrent:(double)a4
{
  [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
  double v8 = v7;
  BOOL v9 = v7 <= a4 || v7 <= a3;
  double v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218752;
    double v15 = v8;
    __int16 v16 = 2048;
    double v17 = a4;
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2048;
    BOOL v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Current location manager accuracy: %f, distance to last location: %f, distance to pivot location: %f, motionType: %lu", (uint8_t *)&v14, 0x2Au);
  }

  [(NavdLocationManager *)self _q_desiredAccuracyForTransportType:self->_transportTypeToRequestAccuracyFor motionType:v9];
  if (v8 != v11)
  {
    double v12 = v11;
    double v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      double v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Changing accuracy to %f", (uint8_t *)&v14, 0xCu);
    }

    [(NavdLocationProvider *)self->_locationProvider setDesiredAccuracy:v12];
  }
}

- (void)_q_staleLocationUseActivityFired:(id)a3
{
  id v4 = (CLLocation *)a3;
  candidateStaleLocation = self->_candidateStaleLocation;
  v6 = GEOFindOrCreateLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (candidateStaleLocation == v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Stale location use activity fired: Using last received location", buf, 2u);
    }

    double v8 = +[BGSystemTaskScheduler sharedScheduler];
    uint64_t v13 = 0;
    [v8 cancelTaskRequestWithIdentifier:@"com.apple.navd.staleLocationUseActivity" error:&v13];
    uint64_t v9 = v13;

    if (v9)
    {
      double v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unable to cancel the stale location use task request.", v12, 2u);
      }
    }
    [(NavdLocationManager *)self _q_goodCandidateLocation:v4 shouldUpdatePivot:1];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Stale location use activity fired but it appears it is unnecessary to use the stale location.", v11, 2u);
    }
  }
}

- (void)_q_cancelStaleLocationTimer
{
  staleLocationTimer = self->_staleLocationTimer;
  if (staleLocationTimer)
  {
    dispatch_source_cancel(staleLocationTimer);
    staleLocationTimer = self->_staleLocationTimer;
  }
  self->_staleLocationTimer = 0;
}

- (void)_q_createActivityToUseStaleLocation:(id)a3 fireAtAbsoluteTime:(double)a4
{
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current >= a4 + -1.0)
  {
    [(NavdLocationManager *)self _q_staleLocationUseActivityFired:v6];
  }
  else
  {
    double v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      id v21 = v6;
      __int16 v22 = 2048;
      double v23 = a4 - Current;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Too early to use stale location %{private}@.  Scheduling with delay %f.", buf, 0x16u);
    }

    uint64_t v9 = +[GEONavdDefaults sharedInstance];
    [v9 staleLocationUseTimerInterval];
    double v11 = v10;

    double v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_serialQueue);
    staleLocationTimer = self->_staleLocationTimer;
    self->_staleLocationTimer = v12;

    objc_initWeak((id *)buf, self);
    int v14 = self->_staleLocationTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C944;
    handler[3] = &unk_100089180;
    objc_copyWeak(v19, (id *)buf);
    id v18 = v6;
    v19[1] = *(id *)&a4;
    dispatch_source_set_event_handler(v14, handler);
    double v15 = self->_staleLocationTimer;
    dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(v11 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_staleLocationTimer);

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_q_createActivityForStaleLocationUse:(id)a3
{
  id v4 = (CLLocation *)a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "creating an activity for stale location use", v11, 2u);
  }

  candidateStaleLocation = self->_candidateStaleLocation;
  self->_candidateStaleLocation = v4;
  BOOL v7 = v4;

  double v8 = +[GEONavdDefaults sharedInstance];
  [v8 staleLocationUseTimerInterval];
  double v10 = v9;

  [(NavdLocationManager *)self _q_createActivityToUseStaleLocation:v7 fireAtAbsoluteTime:v10 + CFAbsoluteTimeGetCurrent()];
}

- (void)_q_locationRefreshActivityFired
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Location refresh activity fired", buf, 2u);
  }

  [(NavdLocationManager *)self _q_startLocationUpdate];
  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  uint64_t v8 = 0;
  [v4 cancelTaskRequestWithIdentifier:@"com.apple.navd.staleLocationUseActivity" error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Unable to cancel the location use task request.", v7, 2u);
    }
  }
}

- (void)_q_createActivityForLocationUpdate
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "creating an activity for location update", buf, 2u);
  }

  v3 = +[BGSystemTaskScheduler sharedScheduler];
  id v17 = 0;
  [v3 cancelTaskRequestWithIdentifier:@"com.apple.navd.locationRefreshActivity" error:&v17];
  id v4 = v17;

  if (v4)
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Unable to cancel the location use task request.", buf, 2u);
    }
  }
  id v6 = +[GEONavdDefaults sharedInstance];
  [v6 locationUpdateTimerInterval];
  double v8 = v7;

  double v9 = sub_100044E9C(@"com.apple.navd.locationRefreshActivity", 0, v8, v8 * 0.25);
  double v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    double v19 = v8;
    __int16 v20 = 2048;
    double v21 = v8 * 0.25;
    __int16 v22 = 2048;
    double v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Registering Location Background Task triggered (timer: (%f), graceperiod: (%f), delay: (%f)", buf, 0x20u);
  }

  double v11 = +[BGSystemTaskScheduler sharedScheduler];
  id v16 = v4;
  unsigned __int8 v12 = [v11 submitTaskRequest:v9 error:&v16];
  uint64_t v13 = (__CFString *)v16;

  if ((v12 & 1) == 0)
  {
    int v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v15 = @"Unknown";
      if (v13) {
        CFStringRef v15 = v13;
      }
      *(_DWORD *)buf = 138412290;
      double v19 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to submit task with error: %@", buf, 0xCu);
    }
  }
}

- (void)_q_badCandidateLocation:(id)a3
{
  ++self->_numberOfRetriesForLocation;
  [(NavdLocationManager *)self _q_createActivityForStaleLocationUse:a3];
  if (self->_numberOfRetriesForLocation >= 5)
  {
    [(NavdLocationManager *)self _q_stopLocationUpdate];
    self->_numberOfRetriesForLocation = 0;
    [(NavdLocationManager *)self _q_createActivityForLocationUpdate];
  }
}

- (void)_q_goodCandidateLocation:(id)a3 shouldUpdatePivot:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(NavdLocationManager *)self _q_stopLocationUpdate];
  [(NavdLocationManager *)self _q_cancelStaleLocationTimer];
  self->_numberOfRetriesForLocation = 0;
  double v8 = +[BGSystemTaskScheduler sharedScheduler];
  id v23 = 0;
  [v8 cancelTaskRequestWithIdentifier:@"com.apple.navd.staleLocationUseActivity" error:&v23];
  id v9 = v23;

  if (v9)
  {
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Unable to cancel the stale location use task request.", buf, 2u);
    }
  }
  candidateStaleLocation = self->_candidateStaleLocation;
  self->_candidateStaleLocation = 0;

  objc_storeStrong((id *)&self->_currentLocation, a3);
  if (v4) {
    objc_storeStrong((id *)&self->_pivotLocation, a3);
  }
  id v12 = [(NSMutableArray *)self->_locationHandlers copy];
  [(NSMutableArray *)self->_locationHandlers removeAllObjects];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * (void)v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * (void)v17));
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v15);
  }
}

- (void)_q_processCandidateLocation:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = [v4 timestamp];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = Current - v7;
  id v9 = +[GEONavdDefaults sharedInstance];
  [v9 locationFreshnessThreshold];
  double v11 = v10;

  if (v8 >= v11)
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v36 = 138477827;
      *(void *)&v36[4] = v4;
      v28 = "Location is not fresh:%{private}@. \nIgnoring..";
      v29 = v27;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      uint32_t v31 = 12;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v29, v30, v28, v36, v31);
    }
LABEL_17:

LABEL_18:
    -[NavdLocationManager _q_badCandidateLocation:](self, "_q_badCandidateLocation:", v4, *(_OWORD *)v36, *(void *)&v36[16], *(void *)&v37, *(_OWORD *)v38, *(void *)&v38[16]);
    goto LABEL_19;
  }
  pivotLocation = self->_pivotLocation;
  if (!pivotLocation)
  {
    objc_storeStrong((id *)&self->_pivotLocation, self->_currentLocation);
    pivotLocation = self->_pivotLocation;
  }
  [(CLLocation *)pivotLocation distanceFromLocation:v4];
  double v14 = v13;
  [(CLLocation *)self->_currentLocation distanceFromLocation:v4];
  double v16 = v15;
  if (![(NavdLocationManager *)self _q_isNewLocation:v4 tolerableWithLocation:self->_pivotLocation distance:v14]|| ![(NavdLocationManager *)self _q_isNewLocation:v4 tolerableWithLocation:self->_currentLocation distance:v16])
  {
    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v32 = self->_pivotLocation;
      currentLocation = self->_currentLocation;
      *(_DWORD *)v36 = 138478851;
      *(void *)&v36[4] = v32;
      *(_WORD *)&v36[12] = 2113;
      *(void *)&v36[14] = currentLocation;
      *(_WORD *)&v36[22] = 2113;
      double v37 = *(double *)&v4;
      *(_WORD *)v38 = 2048;
      *(double *)&v38[2] = v14;
      *(_WORD *)&v38[10] = 2048;
      *(double *)&v38[12] = v16;
      v28 = "Location accuracy is very bad for calculating distances. _pivotLocation %{private}@, currentLocation %{priva"
            "te}@, candidateLocation %{private}@, distanceToPivot %f, distanceToCurrent %f.  Ignoring this candidate.";
      v29 = v27;
      os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
      uint32_t v31 = 52;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v17 = [(NavdLocationManager *)self _q_pivotShouldBeUpdatedDistanceToCandidate:v14];
  long long v18 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
    *(_DWORD *)v36 = 134218496;
    *(void *)&v36[4] = v19;
    *(_WORD *)&v36[12] = 2048;
    *(double *)&v36[14] = v16;
    *(_WORD *)&v36[22] = 2048;
    double v37 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Current location manager accuracy: %f, distance to current location: %f, distance to pivot location: %f", v36, 0x20u);
  }

  [(NavdLocationManager *)self _q_updateDesiredAccuracyBasedOnCadidateDistanceToPivot:v14 candidateDistanceToCurrent:v16];
  [v4 horizontalAccuracy];
  double v21 = v20;
  [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
  double v23 = v22;
  v24 = GEOFindOrCreateLog();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
  if (v21 > v23)
  {
    if (v25)
    {
      [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
      *(_DWORD *)v36 = 134218243;
      *(void *)&v36[4] = v26;
      *(_WORD *)&v36[12] = 2113;
      *(void *)&v36[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Desired accuracy of %f not achieved in location %{private}@.  Not updating current or pivot location.", v36, 0x16u);
    }

    goto LABEL_18;
  }
  if (v25)
  {
    [(NavdLocationProvider *)self->_locationProvider desiredAccuracy];
    CFStringRef v34 = @"Not updating";
    *(_DWORD *)v36 = 134218499;
    *(void *)&v36[4] = v35;
    *(_WORD *)&v36[12] = 2113;
    if (v17) {
      CFStringRef v34 = @"Updating";
    }
    *(void *)&v36[14] = v4;
    *(_WORD *)&v36[22] = 2113;
    double v37 = *(double *)&v34;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Desired accuracy of %f achieved in location %{private}@.  Updating current location.  %{private}@ pivot location.", v36, 0x20u);
  }

  [(NavdLocationManager *)self _q_goodCandidateLocation:v4 shouldUpdatePivot:v17];
LABEL_19:
}

- (void)_q_processErrorWhenUpdatingCurrentLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error while updating current location:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NavdLocationManager *)self _q_stopLocationUpdate];
  self->_numberOfRetriesForLocation = 0;
  [(NavdLocationManager *)self _q_createActivityForLocationUpdate];
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138478083;
    BOOL v17 = v10;
    __int16 v18 = 2113;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{private}@ received new location: %{private}@", buf, 0x16u);
  }
  locationShifter = self->_locationShifter;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D6F4;
  v13[3] = &unk_1000891D0;
  id v14 = v7;
  double v15 = self;
  id v12 = v7;
  [(GEOLocationShifter *)locationShifter navdShiftLocation:v12 withCompletionHandler:v13];
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138478083;
    double v16 = v10;
    __int16 v17 = 2113;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{private}@ failed with error: %{private}@", buf, 0x16u);
  }
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DA4C;
  v13[3] = &unk_1000891A8;
  void v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async(serialQueue, v13);
}

- (unint64_t)numberOfRetriesForLocation
{
  return self->_numberOfRetriesForLocation;
}

- (void)setNumberOfRetriesForLocation:(unint64_t)a3
{
  self->_numberOfRetriesForLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staleLocationTimer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_locationHandlers, 0);
  objc_storeStrong((id *)&self->_candidateStaleLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_pivotLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);

  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end