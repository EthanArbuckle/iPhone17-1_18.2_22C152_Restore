@interface NavdProactiveLocalProxy
- (NavdProactiveLocalProxy)init;
- (id)_getLastLocationSafely;
- (id)_q_createLocationOperationWithLocationFuture:(id)a3;
- (void)_createActivityForNextRefreshInTimeInterval:(double)a3;
- (void)_processEntriesBeforeTimeStamp:(double)a3 osTransaction:(id)a4;
- (void)_processEntriesBeforeTimeStamp:(double)a3 withLocation:(id)a4 osTransaction:(id)a5;
- (void)_q_ProcessEntriesBeforeTimeStamp:(double)a3 withLocation:(id)a4 osTransaction:(id)a5;
- (void)_q_finishProcessingEntriesWithOsTransaction:(id)a3;
- (void)_q_startProcessingEntries;
- (void)_refreshCacheEntriesIfNeededOrForced:(BOOL)a3 osTransaction:(id)a4;
- (void)_setLastLocationSafely:(id)a3;
- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5;
- (void)forceCacheRefresh;
- (void)locationLeecher:(id)a3 errorLeechingLocation:(id)a4;
- (void)locationLeecher:(id)a3 receivedLocation:(id)a4;
- (void)nextRefreshActivityFired;
- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4;
- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4;
- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3;
- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6;
- (void)statusWithCallback:(id)a3;
- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5;
@end

@implementation NavdProactiveLocalProxy

- (id)_getLastLocationSafely
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100034650;
  v10 = sub_100034660;
  id v11 = 0;
  lastLocationQueue = self->_lastLocationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000042C8;
  v5[3] = &unk_100089438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lastLocationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)locationLeecher:(id)a3 receivedLocation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[GEONavdDefaults sharedInstance];
  [v6 minimumTimeIntervalToConsiderLeechedLocationInSeconds];
  double v8 = v7;

  v9 = +[GEONavdDefaults sharedInstance];
  [v9 minimumDistanceToConsiderLeechedLocationInMeters];
  double v11 = v10;

  if (v8 >= 0.0 && v11 >= 0.0)
  {
    v12 = [(NavdProactiveLocalProxy *)self _getLastLocationSafely];
    if (v12)
    {
      [v5 distanceFromLocation:v12];
      double v14 = fabs(v13);
    }
    else
    {
      double v14 = 0.0;
    }
    if (self->_lastLeechedLocationRefresh)
    {
      v15 = +[NSDate date];
      [v15 timeIntervalSinceDate:self->_lastLeechedLocationRefresh];
      double v17 = v16;

      if (!v12) {
        goto LABEL_18;
      }
    }
    else
    {
      double v17 = 1.79769313e308;
      if (!v12) {
        goto LABEL_18;
      }
    }
    BOOL v18 = v17 <= v8 || v14 <= v11;
    if (v18
      || ([v5 horizontalAccuracy],
          double v20 = v19,
          [v12 horizontalAccuracy],
          v20 >= v21)
      && ([v5 horizontalAccuracy],
          double v23 = v22,
          [v12 horizontalAccuracy],
          v14 <= v23 + v24))
    {
      GEOFindOrCreateLog();
      v25 = (NavdOsTransaction *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138478339;
        double v31 = *(double *)&v5;
        __int16 v32 = 2048;
        double v33 = v14;
        __int16 v34 = 2048;
        double v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, &v25->super, OS_LOG_TYPE_DEBUG, "Not using leeched location: %{private}@ (moved %f) (timeElapsed %f)", (uint8_t *)&v30, 0x20u);
      }
      goto LABEL_23;
    }
LABEL_18:
    v25 = [[NavdOsTransaction alloc] initWithTransactionName:"using leeched location"];
    v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      int v30 = 138478339;
      double v31 = *(double *)&v5;
      __int16 v32 = 2048;
      double v33 = v14;
      __int16 v34 = 2048;
      double v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Using leeched location: %{private}@ (moved %f)  (timeElapsed %f)", (uint8_t *)&v30, 0x20u);
    }

    v27 = +[NSDate date];
    lastLeechedLocationRefresh = self->_lastLeechedLocationRefresh;
    self->_lastLeechedLocationRefresh = v27;

    v29 = +[NSDate distantPast];
    [v29 timeIntervalSinceReferenceDate];
    -[NavdProactiveLocalProxy _processEntriesBeforeTimeStamp:withLocation:osTransaction:](self, "_processEntriesBeforeTimeStamp:withLocation:osTransaction:", v5, v25);

LABEL_23:
    goto LABEL_24;
  }
  v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v30 = 134218240;
    double v31 = v8;
    __int16 v32 = 2048;
    double v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Avoiding an unscheduled hypothesis update (leechedUpdateTimeThreshold = %f) (leechedUpdateDistanceThreshold = %f)", (uint8_t *)&v30, 0x16u);
  }
LABEL_24:
}

- (NavdProactiveLocalProxy)init
{
  v39.receiver = self;
  v39.super_class = (Class)NavdProactiveLocalProxy;
  v2 = [(NavdProactiveLocalProxy *)&v39 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    startedListeningTime = v2->_startedListeningTime;
    v2->_startedListeningTime = (NSDate *)v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    suggestionsHandlers = v2->_suggestionsHandlers;
    v2->_suggestionsHandlers = v5;

    double v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    cacheOperationQueue = v2->_cacheOperationQueue;
    v2->_cacheOperationQueue = v7;

    [(NSOperationQueue *)v2->_cacheOperationQueue setMaxConcurrentOperationCount:1];
    v9 = [[NavdTTLCache alloc] initWithCacheOperationQueue:v2->_cacheOperationQueue localProxy:v2];
    cache = v2->_cache;
    v2->_cache = v9;

    double v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingRouteHypothesisUpdateHandlers = v2->_pendingRouteHypothesisUpdateHandlers;
    v2->_pendingRouteHypothesisUpdateHandlers = v11;

    uint64_t v13 = +[NavdLocationManager sharedInstance];
    locationManager = v2->_locationManager;
    v2->_locationManager = (NavdLocationManager *)v13;

    uint64_t v15 = +[NavdLocationLeecher sharedLeecher];
    locationLeecher = v2->_locationLeecher;
    v2->_locationLeecher = (NavdLocationLeecher *)v15;

    [(NavdLocationLeecher *)v2->_locationLeecher addObserver:v2];
    v2->_numberOfTimesRepeatedProcessing = 0;
    double v17 = objc_alloc_init(NavdServerFormattedStringFormatter);
    +[GEORouteHypothesisMonitor setServerFormattedStringFormatter:v17];
    BOOL v18 = objc_alloc_init(NavdRouteHypothesisUserPreferencesProvider);
    +[GEORouteHypothesisMonitor setUserPreferencesProvider:v18];
    double v19 = +[MNFilePaths navdCacheDirectoryPath];
    uint64_t v20 = [v19 stringByAppendingPathComponent:@"working"];
    launchdKeepAliveFile = v2->_launchdKeepAliveFile;
    v2->_launchdKeepAliveFile = (NSString *)v20;

    unint64_t v22 = [(NavdTTLCache *)v2->_cache count];
    double v23 = +[NSFileManager defaultManager];
    double v24 = v23;
    v25 = v2->_launchdKeepAliveFile;
    if (v22) {
      [v23 createFileAtPath:v25 contents:0 attributes:0];
    }
    else {
      [v23 removeItemAtPath:v25 error:0];
    }

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"forceCacheRefresh" name:NSSystemClockDidChangeNotification object:0];

    v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = v2->_locationManager;
      *(_DWORD *)buf = 138477827;
      v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Local proxy initialized. Location manager: %{private}@", buf, 0xCu);
    }

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.navd.lastLocationQueue", v29);
    lastLocationQueue = v2->_lastLocationQueue;
    v2->_lastLocationQueue = (OS_dispatch_queue *)v30;

    [(NavdLocationLeecher *)v2->_locationLeecher startLeeching];
    __int16 v32 = +[BGSystemTaskScheduler sharedScheduler];
    double v33 = v2->_lastLocationQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100034304;
    v37[3] = &unk_100089130;
    __int16 v34 = v2;
    v38 = v34;
    [v32 registerForTaskWithIdentifier:@"com.apple.navd.nextValueRefreshActivity" usingQueue:v33 launchHandler:v37];

    double v35 = v34;
  }

  return v2;
}

- (void)statusWithCallback:(id)a3
{
  id v4 = a3;
  if (self->_valueRefreshTimeStamp == 0.0)
  {
    uint64_t v6 = @"None";
  }
  else
  {
    id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v6 = +[NSDateFormatter localizedStringFromDate:v5 dateStyle:1 timeStyle:2];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003449C;
  v10[3] = &unk_10008AE88;
  double v11 = v6;
  id v12 = v4;
  v10[4] = self;
  double v7 = v6;
  id v8 = v4;
  v9 = +[NSBlockOperation blockOperationWithBlock:v10];
  [(NSOperationQueue *)self->_cacheOperationQueue addOperation:v9];
}

- (void)_setLastLocationSafely:(id)a3
{
  id v4 = a3;
  lastLocationQueue = self->_lastLocationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003463C;
  v7[3] = &unk_1000891A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lastLocationQueue, v7);
}

- (void)_refreshCacheEntriesIfNeededOrForced:(BOOL)a3 osTransaction:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)+[NSDate distantFuture]);
  }
  else
  {
    id v7 = a4;
    double AbsoluteTime = CFAbsoluteTimeGetCurrent();
  }
  [(NavdProactiveLocalProxy *)self _processEntriesBeforeTimeStamp:a4 osTransaction:AbsoluteTime];
}

- (id)_q_createLocationOperationWithLocationFuture:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSBlockOperation);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000347A8;
  v8[3] = &unk_1000891A8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 addExecutionBlock:v8];

  return v5;
}

- (void)_q_ProcessEntriesBeforeTimeStamp:(double)a3 withLocation:(id)a4 osTransaction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v38 = DefaultLoggingSubsystem;
  double v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    id v12 = +[NSDateFormatter localizedStringFromDate:v11 dateStyle:1 timeStyle:3];
    *(_DWORD *)buf = 138478083;
    id v63 = v12;
    __int16 v64 = 2113;
    id v65 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Processing all entries before %{private}@ (with location %{private}@)", buf, 0x16u);
  }
  [(NavdProactiveLocalProxy *)self _q_startProcessingEntries];
  uint64_t v13 = objc_alloc_init(NavdLocationFuture);
  double v14 = v13;
  v40 = v9;
  v41 = v8;
  if (v8)
  {
    [(NavdLocationFuture *)v13 fulfillWithLocation:v8];
    [(NavdProactiveLocalProxy *)self _setLastLocationSafely:v8];
    objc_super v39 = 0;
  }
  else
  {
    objc_super v39 = [(NavdProactiveLocalProxy *)self _q_createLocationOperationWithLocationFuture:v13];
  }
  uint64_t v15 = v14;
  double v16 = +[NSMutableArray array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  double v17 = self->_cache;
  id v18 = [(NavdTTLCache *)v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
  v42 = v15;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v56;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v56 != v20) {
          objc_enumerationMutation(v17);
        }
        unint64_t v22 = [*(id *)(*((void *)&v55 + 1) + 8 * i) blockIfShouldUpdateForTimestamp:v15 locationFuture:a3];
        double v23 = v22;
        if (v22)
        {
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_100035034;
          v53[3] = &unk_10008AEB0;
          id v54 = v22;
          double v24 = +[NSBlockOperation blockOperationWithBlock:v53];
          [v16 addObject:v24];

          uint64_t v15 = v42;
        }
      }
      id v19 = [(NavdTTLCache *)v17 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v19);
  }

  if (v39)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v25 = v16;
    id v26 = [v25 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v50;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * (void)j) addDependency:v39];
        }
        id v27 = [v25 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v27);
    }

    uint64_t v15 = v42;
  }
  dispatch_queue_t v30 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v31 = [v16 count];
    *(_DWORD *)buf = 134217984;
    id v63 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%lu entries to process", buf, 0xCu);
  }

  if ([v16 count])
  {
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100035044;
    v47[3] = &unk_1000891A8;
    v47[4] = self;
    id v48 = v40;
    __int16 v32 = +[NSBlockOperation blockOperationWithBlock:v47];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = v16;
    id v34 = [v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          [v32 addDependency:*(void *)(*((void *)&v43 + 1) + 8 * (void)k)];
        }
        id v35 = [v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
      }
      while (v35);
    }

    uint64_t v15 = v42;
    if (v39) {
      [(NSOperationQueue *)self->_cacheOperationQueue addOperation:v39];
    }
    [(NSOperationQueue *)self->_cacheOperationQueue addOperations:v33 waitUntilFinished:0];
    [(NSOperationQueue *)self->_cacheOperationQueue addOperation:v32];
  }
  else
  {
    [(NavdProactiveLocalProxy *)self _q_finishProcessingEntriesWithOsTransaction:v40];
  }
}

- (void)_q_startProcessingEntries
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Started processing entries", v3, 2u);
  }
}

- (void)_q_finishProcessingEntriesWithOsTransaction:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Finished processing entries", (uint8_t *)&v28, 2u);
  }

  [(NavdTTLCache *)self->_cache nextRefreshTimeStamp];
  if (v6 < 0.0)
  {
    id v7 = +[NSFileManager defaultManager];
    [v7 removeItemAtPath:self->_launchdKeepAliveFile error:0];

    goto LABEL_17;
  }
  double v8 = v6 - CFAbsoluteTimeGetCurrent();
  if (v8 > 0.0)
  {
    self->_unint64_t numberOfTimesRepeatedProcessing = 0;
LABEL_16:
    [(NavdProactiveLocalProxy *)self _createActivityForNextRefreshInTimeInterval:v8];
    goto LABEL_17;
  }
  unint64_t v9 = self->_numberOfTimesRepeatedProcessing + 1;
  self->_unint64_t numberOfTimesRepeatedProcessing = v9;
  double v10 = +[GEONavdDefaults sharedInstance];
  id v11 = [v10 maximumNumberOfProcessingLoopRepeats];

  if (v9 >= (unint64_t)v11)
  {
    unint64_t numberOfTimesRepeatedProcessing = self->_numberOfTimesRepeatedProcessing;
    uint64_t v15 = +[GEONavdDefaults sharedInstance];
    unint64_t v16 = numberOfTimesRepeatedProcessing - (void)[v15 maximumNumberOfProcessingLoopRepeats];

    double v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = self->_numberOfTimesRepeatedProcessing - 1;
      int v28 = 134217984;
      unint64_t v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "refresh timestamp was in the past and we already scheduled %ld repeated refreshes so falling back to error time interval", (uint8_t *)&v28, 0xCu);
    }

    id v19 = +[GEONavdDefaults sharedInstance];
    [v19 refreshTimeIntervalBackoffBase];
    long double v21 = v20;

    unint64_t v22 = +[GEONavdDefaults sharedInstance];
    [v22 refreshTimeIntervalToUseIfError];
    double v24 = pow(v21, (double)v16) * v23;

    id v25 = +[GEONavdDefaults sharedInstance];
    [v25 refreshTimeIntervalBackoffMax];
    double v27 = v26;

    if (v24 >= v27) {
      double v8 = v27;
    }
    else {
      double v8 = v24;
    }
    goto LABEL_16;
  }
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v13 = self->_numberOfTimesRepeatedProcessing;
    int v28 = 134217984;
    unint64_t v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "refresh timestamp was in the past, so scheduling another update (%ld times in a row).", (uint8_t *)&v28, 0xCu);
  }

  [(NavdProactiveLocalProxy *)self _processEntriesBeforeTimeStamp:v4 osTransaction:CFAbsoluteTimeGetCurrent()];
LABEL_17:
}

- (void)_processEntriesBeforeTimeStamp:(double)a3 osTransaction:(id)a4
{
}

- (void)_processEntriesBeforeTimeStamp:(double)a3 withLocation:(id)a4 osTransaction:(id)a5
{
  double v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000354C0;
  unint64_t v13 = &unk_10008AED8;
  double v17 = a3;
  double v14 = self;
  id v15 = a4;
  id v16 = a5;
  id v7 = v16;
  id v8 = v15;
  unint64_t v9 = +[NSBlockOperation blockOperationWithBlock:&v10];
  objc_msgSend(v9, "setQueuePriority:", 4, v10, v11, v12, v13, v14);
  [(NSOperationQueue *)self->_cacheOperationQueue addOperation:v9];
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [[NavdOsTransaction alloc] initWithTransactionName:"startMonitoringDestination"];
  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v33 = v10;
    __int16 v34 = 2113;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Start monitoring destination: %{private}@, clientID: %{private}@", buf, 0x16u);
  }

  unint64_t v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  double v24 = sub_1000356E0;
  id v25 = &unk_10008AF00;
  double v26 = self;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  dispatch_queue_t v30 = v14;
  id v31 = v13;
  id v16 = v13;
  double v17 = v14;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  long double v21 = +[NSBlockOperation blockOperationWithBlock:&v22];
  -[NSOperationQueue addOperation:](self->_cacheOperationQueue, "addOperation:", v21, v22, v23, v24, v25, v26);
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[NavdOsTransaction alloc] initWithTransactionName:"requestRefreshForPlannedDestination"];
  unint64_t v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v23 = v6;
    __int16 v24 = 2113;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request Refresh for destination: %{private}@, clientID: %{private}@", buf, 0x16u);
  }

  double v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1000358C0;
  double v17 = &unk_100089DC0;
  id v18 = self;
  id v19 = v6;
  id v20 = v7;
  long double v21 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = +[NSBlockOperation blockOperationWithBlock:&v14];
  -[NSOperationQueue addOperation:](self->_cacheOperationQueue, "addOperation:", v13, v14, v15, v16, v17, v18);
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[NavdOsTransaction alloc] initWithTransactionName:"onlyPerformLocalUpdatesForDestination"];
  unint64_t v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v23 = v6;
    __int16 v24 = 2113;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Only perform local updates for destination: %{private}@, clientID: %{private}@", buf, 0x16u);
  }

  double v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100035A9C;
  double v17 = &unk_100089DC0;
  id v18 = self;
  id v19 = v6;
  id v20 = v7;
  long double v21 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = +[NSBlockOperation blockOperationWithBlock:&v14];
  -[NSOperationQueue addOperation:](self->_cacheOperationQueue, "addOperation:", v13, v14, v15, v16, v17, v18);
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[NavdOsTransaction alloc] initWithTransactionName:"stopMonitoringDestination"];
  id v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v25 = v8;
    __int16 v26 = 2113;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Stop monitoring destination for destination:%{private}@, for client id: %{private}@", buf, 0x16u);
  }

  id v13 = +[NSFileManager defaultManager];
  [v13 createFileAtPath:self->_launchdKeepAliveFile contents:0 attributes:0];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100035CD4;
  v19[3] = &unk_100088FA8;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  double v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  id v18 = +[NSBlockOperation blockOperationWithBlock:v19];
  [(NSOperationQueue *)self->_cacheOperationQueue addOperation:v18];
}

- (void)nextRefreshActivityFired
{
  uint64_t v3 = [[NavdOsTransaction alloc] initWithTransactionName:"refreshActivityFired"];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Value refresh activity fired", v9, 2u);
  }

  id v5 = +[BGSystemTaskScheduler sharedScheduler];
  [v5 deregisterTaskWithIdentifier:@"com.apple.navd.nextValueRefreshActivity"];

  self->_valueRefreshTimeStamp = 0.0;
  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = +[GEONavdDefaults sharedInstance];
  [v7 minimumTimerTimeStampFudge];
  [(NavdProactiveLocalProxy *)self _processEntriesBeforeTimeStamp:v3 osTransaction:Current + v8];
}

- (void)_createActivityForNextRefreshInTimeInterval:(double)a3
{
  id v5 = +[GEONavdDefaults sharedInstance];
  [v5 maximumRefreshIntervalLeeway];
  double v7 = v6;

  if (v7 >= a3) {
    double v7 = a3;
  }
  double v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "creating next refresh activity with interval %f and leeway %f", buf, 0x16u);
  }

  id v9 = +[BGSystemTaskScheduler sharedScheduler];
  [v9 deregisterTaskWithIdentifier:@"com.apple.navd.nextValueRefreshActivity"];

  self->_valueRefreshTimeStamp = CFAbsoluteTimeGetCurrent() + a3;
  id v10 = sub_100044E9C(@"com.apple.navd.nextValueRefreshActivity", 1, a3, v7);
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = v7;
    __int16 v22 = 2048;
    double v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Registering next value refresh XPC activity triggered (timer: (%f), graceperiod: (%f), delay: (%f)", buf, 0x20u);
  }

  id v12 = +[BGSystemTaskScheduler sharedScheduler];
  id v17 = 0;
  unsigned __int8 v13 = [v12 submitTaskRequest:v10 error:&v17];
  double v14 = (__CFString *)v17;

  if ((v13 & 1) == 0)
  {
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(double *)&CFStringRef v16 = COERCE_DOUBLE(@"Unknown");
      if (v14) {
        CFStringRef v16 = v14;
      }
      *(_DWORD *)buf = 138412290;
      double v19 = *(double *)&v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to submit background system task with error: %@", buf, 0xCu);
    }
  }
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [[NavdOsTransaction alloc] initWithTransactionName:"postUiNotification"];
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218499;
    unint64_t v22 = a3;
    __int16 v23 = 2113;
    id v24 = v8;
    __int16 v25 = 2113;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Post UI Notification %lu for destination %{private}@ clientId %{private}@", buf, 0x20u);
  }

  cacheOperationQueue = self->_cacheOperationQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003623C;
  v16[3] = &unk_10008AF28;
  double v19 = v10;
  unint64_t v20 = a3;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unsigned __int8 v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(NSOperationQueue *)cacheOperationQueue addOperationWithBlock:v16];
}

- (void)forceCacheRefresh
{
  uint64_t v3 = [[NavdOsTransaction alloc] initWithTransactionName:"forceCacheRefresh"];
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Forcing cache refresh", v5, 2u);
  }

  [(NavdProactiveLocalProxy *)self _refreshCacheEntriesIfNeededOrForced:1 osTransaction:v3];
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
}

- (void)locationLeecher:(id)a3 errorLeechingLocation:(id)a4
{
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138477827;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Error leeching location: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationQueue, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_suggestionsHandlers, 0);
  objc_storeStrong((id *)&self->_suggestedDestinations, 0);
  objc_storeStrong((id *)&self->_lastLeechedLocationRefresh, 0);
  objc_storeStrong((id *)&self->_launchdKeepAliveFile, 0);
  objc_storeStrong((id *)&self->_locationLeecher, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_pendingRouteHypothesisUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_cacheOperationQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_startedListeningTime, 0);
}

@end