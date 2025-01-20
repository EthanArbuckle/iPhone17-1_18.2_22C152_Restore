@interface NavdTTLCacheEntry
- (BOOL)_loadFromBackingStore;
- (BOOL)hasHandlerForClientInfo:(id)a3;
- (BOOL)localUpdatesOnly;
- (NSString)traceName;
- (NavdTTLCacheEntry)initWithKey:(id)a3 cacheOperationQueue:(id)a4 cache:(id)a5;
- (NavdTTLCacheEntry)initWithRowId:(int64_t)a3 refreshTimestamp:(double)a4 state:(int64_t)a5 cacheOperationQueue:(id)a6 cache:(id)a7;
- (double)_nextTimerIntervalForValue:(id)a3;
- (double)refreshTimestamp;
- (id)blockIfShouldUpdateForTimestamp:(double)a3 locationFuture:(id)a4;
- (int64_t)rowId;
- (int64_t)state;
- (unint64_t)handlerCount;
- (void)_clearLoadedValues;
- (void)_recievedUpdatedHypothesis:(id)a3 updateRefreshTimeStamp:(BOOL)a4;
- (void)_saveEntry;
- (void)_setState:(int64_t)a3;
- (void)_updateWithLocation:(id)a3;
- (void)callHandlersWithHypothesis:(id)a3;
- (void)clientDisplayedUINotification:(unint64_t)a3;
- (void)removeHandlerForClientInfo:(id)a3;
- (void)setHandler:(id)a3 forClient:(id)a4;
- (void)setLocalUpdatesOnlyForClientInfo:(id)a3;
- (void)setTraceName:(id)a3;
- (void)subsumePendingEntry:(id)a3;
@end

@implementation NavdTTLCacheEntry

- (NavdTTLCacheEntry)initWithRowId:(int64_t)a3 refreshTimestamp:(double)a4 state:(int64_t)a5 cacheOperationQueue:(id)a6 cache:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NavdTTLCacheEntry;
  v14 = [(NavdTTLCacheEntry *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_rowId = a3;
    v14->_state = a5;
    v14->_refreshTimestamp = a4;
    objc_storeWeak((id *)&v14->_cacheOperationQueue, v12);
    objc_storeStrong((id *)&v15->_cache, a7);
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientInfoStates = v15->_clientInfoStates;
    v15->_clientInfoStates = v16;
  }
  return v15;
}

- (NavdTTLCacheEntry)initWithKey:(id)a3 cacheOperationQueue:(id)a4 cache:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NavdTTLCacheEntry *)self initWithRowId:-1 refreshTimestamp:3 state:v11 cacheOperationQueue:v10 cache:CFAbsoluteTimeGetCurrent()];

  if (v12) {
    objc_storeStrong((id *)&v12->_key, a3);
  }

  return v12;
}

- (id)blockIfShouldUpdateForTimestamp:(double)a3 locationFuture:(id)a4
{
  id v7 = a4;
  int64_t v8 = [(NavdTTLCacheEntry *)self state];
  if (v8 == 1)
  {
    [(NavdTTLCacheEntry *)self _setState:2];
    objc_storeStrong((id *)&self->_locationFuture, a4);
  }
  else if (!v8)
  {
    [(NavdTTLCacheEntry *)self refreshTimestamp];
    if (v9 > a3) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [(NavdTTLCacheEntry *)self _setState:v10];
    objc_storeStrong((id *)&self->_locationFuture, a4);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000464F0;
    v14[3] = &unk_100088EE0;
    v14[4] = self;
    id v11 = objc_retainBlock(v14);
    id v12 = objc_retainBlock(v11);

    goto LABEL_9;
  }
  id v12 = 0;
LABEL_9:

  return v12;
}

- (unint64_t)handlerCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_clientInfoStates count];
}

- (void)setHandler:(id)a3 forClient:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_clientInfoStates objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(NavdClientInfoState);
    [(NSMutableDictionary *)self->_clientInfoStates setObject:v7 forKeyedSubscript:v6];
  }
  [(NavdClientInfoState *)v7 setHandler:v8];
}

- (void)removeHandlerForClientInfo:(id)a3
{
  id v5 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clientInfoStates, "objectForKeyedSubscript:");
  if (v4)
  {
    [(NSMutableDictionary *)self->_clientInfoStates removeObjectForKey:v5];
    if ([v4 localUpdatesOnly]) {
      --self->_localOnlyUpdatesCount;
    }
  }
}

- (BOOL)hasHandlerForClientInfo:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clientInfoStates objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)localUpdatesOnly
{
  id localOnlyUpdatesCount = self->_localOnlyUpdatesCount;
  return localOnlyUpdatesCount == [(NSMutableDictionary *)self->_clientInfoStates count];
}

- (void)setLocalUpdatesOnlyForClientInfo:(id)a3
{
  BOOL v4 = [(NSMutableDictionary *)self->_clientInfoStates objectForKeyedSubscript:a3];
  if (v4)
  {
    id v5 = v4;
    if (([v4 localUpdatesOnly] & 1) == 0)
    {
      [v5 setLocalUpdatesOnly:1];
      ++self->_localOnlyUpdatesCount;
    }
  }

  _objc_release_x1();
}

- (void)callHandlersWithHypothesis:(id)a3
{
}

- (void)clientDisplayedUINotification:(unint64_t)a3
{
  if ([(NavdTTLCacheEntry *)self _loadFromBackingStore])
  {
    id v5 = [(GEORouteHypothesisValue *)self->_value monitor];
    [v5 clientDisplayedUINotification:a3];

    [(NavdTTLCacheEntry *)self _saveEntry];
    [(NavdTTLCacheEntry *)self _clearLoadedValues];
  }
}

- (BOOL)_loadFromBackingStore
{
  v3 = [(NavdTTLCachePrivate *)self->_cache loadEntryForRowId:[(NavdTTLCacheEntry *)self rowId]];
  id v4 = [v3 count];
  if (v4 == (id)2)
  {
    id v5 = [v3 objectAtIndex:0];
    key = self->_key;
    self->_key = v5;

    id v7 = [v3 objectAtIndex:1];
    value = self->_value;
    self->_value = v7;
  }
  return v4 == (id)2;
}

- (void)_clearLoadedValues
{
  key = self->_key;
  self->_key = 0;

  value = self->_value;
  self->_value = 0;
}

- (void)_updateWithLocation:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  if ((id)[(NavdTTLCacheEntry *)self state] == (id)2) {
    uint64_t v6 = [(NavdTTLCacheEntry *)self localUpdatesOnly] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v8 = @"NO";
    int64_t rowId = self->_rowId;
    if (v6) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 134218243;
    *(void *)&buf[4] = rowId;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "About to process rowId %lld. AllowServer is %{private}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v33 = 0;
  if ([(NavdTTLCacheEntry *)self _loadFromBackingStore])
  {
    dispatch_group_enter(v5);
    [v4 coordinate];
    double v11 = v10;
    [v4 coordinate];
    id v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v11, v12);
    objc_initWeak(location, self);
    v14 = [(GEORouteHypothesisValue *)self->_value monitor];
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100046D1C;
    v26 = &unk_10008C380;
    objc_copyWeak(&v29, location);
    v28 = buf;
    char v30 = v6;
    v27 = v5;
    [v14 updateLocation:v13 allowServer:v6 hypothesisHandler:&v23];

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }
  v15 = +[GEONavdDefaults sharedInstance];
  [v15 updateTimeout];
  dispatch_time_t v17 = dispatch_walltime(0, (uint64_t)(v16 * 1000000000.0));

  if (dispatch_group_wait(v5, v17))
  {
    v18 = self;
    objc_sync_enter(v18);
    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      objc_super v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Timed out while waiting for updateLocation.", (uint8_t *)location, 2u);
      }

      dispatch_group_leave(v5);
      *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
      id v20 = objc_alloc_init((Class)GEORouteHypothesis);
      v21 = GEOErrorDomain();
      v22 = +[NSError errorWithDomain:v21 code:-19 userInfo:0];
      [v20 _setError:v22];

      [(NavdTTLCacheEntry *)v18 _recievedUpdatedHypothesis:v20 updateRefreshTimeStamp:1];
    }
    objc_sync_exit(v18);
  }
  _Block_object_dispose(buf, 8);
}

- (void)_setState:(int64_t)a3
{
  [(NavdTTLCacheEntry *)self willChangeValueForKey:@"state"];
  GEOFindOrCreateLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int64_t rowId = self->_rowId;
    unint64_t state = self->_state;
    if (state >= 5)
    {
      CFStringRef v8 = +[NSString stringWithFormat:@"(unknown: %lu)", self->_state];
    }
    else
    {
      CFStringRef v8 = *(&off_10008C3A0 + state);
    }
    id v9 = v8;
    if ((unint64_t)a3 >= 5)
    {
      double v10 = +[NSString stringWithFormat:@"(unknown: %lu)", a3];
    }
    else
    {
      double v10 = *(&off_10008C3A0 + a3);
    }
    *(_DWORD *)buf = 134218499;
    int64_t v12 = rowId;
    __int16 v13 = 2113;
    id v14 = v9;
    __int16 v15 = 2113;
    double v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Changing state of rowId %lld from %{private}@ to %{private}@", buf, 0x20u);
  }
  self->_unint64_t state = a3;
  [(NavdTTLCacheEntry *)self didChangeValueForKey:@"state"];
}

- (double)_nextTimerIntervalForValue:(id)a3
{
  id v3 = a3;
  id v4 = +[GEONavdDefaults sharedInstance];
  unsigned __int8 v5 = [v4 useConservativeDepartureForRefreshTimer];

  uint64_t v6 = [v3 currentHypothesis];
  id v7 = v6;
  if (v5) {
    [v6 conservativeDepartureDate];
  }
  else {
  CFStringRef v8 = [v6 suggestedDepartureDate];
  }

  id v9 = [v3 currentHypothesis];
  unsigned int v10 = [v9 transportType];
  double v11 = +[GEONavdDefaults sharedInstance];
  int64_t v12 = v11;
  if (v10 == 1) {
    id v13 = [v11 refreshEquationLowestFrequencyTransit];
  }
  else {
    id v13 = [v11 refreshEquationLowestFrequency];
  }
  unint64_t v14 = (unint64_t)v13;

  __int16 v15 = +[GEONavdDefaults sharedInstance];
  id v16 = [v15 refreshEquationHighestFrequency];

  dispatch_time_t v17 = [v3 currentHypothesis];

  if (v17)
  {
    [v8 timeIntervalSinceReferenceDate];
    double v19 = (v18 - CFAbsoluteTimeGetCurrent()) / 60.0;
    double v20 = exp(-(v19 / (double)v14 * (v19 / (double)v14)));
    double v21 = ((double)v14 - (double)(v14 - (unint64_t)v16) * v20) * 60.0;
    v22 = +[GEONavdDefaults sharedInstance];
    [v22 maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds];
    double v24 = v23;

    if (v21 >= v24) {
      double v24 = v21;
    }
    v25 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 134218496;
      double v29 = v21 / 60.0;
      __int16 v30 = 2048;
      double v31 = v19;
      __int16 v32 = 2048;
      double v33 = v20;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "calculated refresh interval in minutes: %f, deltaT in minutes: %f, exp: %f", (uint8_t *)&v28, 0x20u);
    }
  }
  else
  {
    v25 = +[GEONavdDefaults sharedInstance];
    [v25 refreshTimeIntervalToUseIfError];
    double v24 = v26;
  }

  return v24;
}

- (void)_saveEntry
{
  [(NavdTTLCachePrivate *)self->_cache saveValue:self->_value forKey:self->_key];
  self->_int64_t rowId = (int64_t)[(GEORouteHypothesisValue *)self->_value rowId];
  [(GEORouteHypothesisValue *)self->_value valueRefreshTimeStamp];
  self->_refreshTimestamp = v3;
  if (self->_rowId == -1)
  {
    cache = self->_cache;
    key = self->_key;
    value = self->_value;
    [(NavdTTLCachePrivate *)cache removeEntry:self withKey:key value:value];
  }
}

- (void)_recievedUpdatedHypothesis:(id)a3 updateRefreshTimeStamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v8 = [(GEORouteHypothesisValue *)self->_value description];
    int v24 = 138478083;
    id v25 = v6;
    __int16 v26 = 2113;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Calculated new hypothesis: %{private}@\nFor value: %{private}@", (uint8_t *)&v24, 0x16u);
  }
  if (v6)
  {
    id v9 = [(GEORouteHypothesisValue *)self->_value currentHypothesis];
    if (!v9)
    {
      unsigned int v10 = [v6 error];

      if (v10) {
        goto LABEL_7;
      }
      id v9 = +[GEONavdAnalyticsManager sharedManager];
      double v23 = [v9 analyticsReporter];
      [v6 estimatedTravelTime];
      objc_msgSend(v23, "recordInitialTravelTime:");
    }
LABEL_7:
    [(GEORouteHypothesisValue *)self->_value setCurrentHypothesis:v6];
    double v11 = [v6 error];
    id v12 = v6;
    if (v11)
    {
      id v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v24 = 138477827;
        id v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Error while refreshing the value: %{private}@", (uint8_t *)&v24, 0xCu);
      }

      unint64_t v14 = [v11 domain];
      __int16 v15 = GEOErrorDomain();
      if ([v14 isEqualToString:v15])
      {
        id v16 = [v11 code];

        if (v16 == (id)-1501)
        {
          [(GEORouteHypothesisValue *)self->_value setValueRefreshTimeStamp:-1.0];
          [(NavdTTLCachePrivate *)self->_cache removeEntry:self withKey:self->_key value:self->_value];
        }
      }
      else
      {
      }
    }
    else
    {
      +[GEONavdPowerLogManager _powerLogWithEventName:@"ReceivedNewHypothesis"];
      if (v4)
      {
        unsigned __int8 v17 = [(NavdTTLCacheEntry *)self localUpdatesOnly];
        double v18 = -1.0;
        if ((v17 & 1) == 0)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [(NavdTTLCacheEntry *)self _nextTimerIntervalForValue:self->_value];
          double v18 = Current + v20;
        }
        [(GEORouteHypothesisValue *)self->_value setValueRefreshTimeStamp:v18];
        double v21 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          [(GEORouteHypothesisValue *)self->_value valueRefreshTimeStamp];
          int v24 = 134217984;
          id v25 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Value refreshed and timestamp set to: %f", (uint8_t *)&v24, 0xCu);
        }
      }
      [(NavdTTLCacheEntry *)self _saveEntry];
    }
    [(NavdTTLCachePrivate *)self->_cache callHandlers:self->_clientInfoStates withHypothesis:v12];
  }
  [(NavdTTLCacheEntry *)self _clearLoadedValues];
  [(NavdTTLCacheEntry *)self _setState:0];
}

- (void)subsumePendingEntry:(id)a3
{
  clientInfoStates = self->_clientInfoStates;
  unsigned __int8 v5 = [a3 clientInfoStates];
  [(NSMutableDictionary *)clientInfoStates addEntriesFromDictionary:v5];

  self->_id localOnlyUpdatesCount = 0;
  id v6 = self->_clientInfoStates;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047668;
  v7[3] = &unk_1000890E8;
  v7[4] = self;
  [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (int64_t)rowId
{
  return self->_rowId;
}

- (int64_t)state
{
  return self->_state;
}

- (double)refreshTimestamp
{
  return self->_refreshTimestamp;
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_locationFuture, 0);
  objc_storeStrong((id *)&self->_clientInfoStates, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_destroyWeak((id *)&self->_cacheOperationQueue);
}

@end