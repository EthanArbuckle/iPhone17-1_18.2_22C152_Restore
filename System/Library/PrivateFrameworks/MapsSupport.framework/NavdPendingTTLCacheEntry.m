@interface NavdPendingTTLCacheEntry
- (BOOL)_isFinishedResolvingWaypoints;
- (GEOPlannedDestination)plannedDestination;
- (GEORouteHypothesisRequest)request;
- (NSDictionary)clientInfoStates;
- (NSString)traceName;
- (NavdPendingTTLCacheEntry)initWithDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6 cacheOperationQueue:(id)a7 navdCache:(id)a8;
- (int64_t)state;
- (void)_findWaypointsForKey:(id)a3 currentLocation:(id)a4;
- (void)_finishedResolvingWaypointsForKey:(id)a3;
- (void)_receivedDestinationWaypoint:(id)a3 forKey:(id)a4;
- (void)_receivedErrorWhileResolvingDestinationWaypoint:(id)a3 forKey:(id)a4;
- (void)_receivedErrorWhileResolvingOriginWaypoint:(id)a3 forKey:(id)a4;
- (void)_receivedOriginWaypoint:(id)a3 forKey:(id)a4;
- (void)_setState:(int64_t)a3;
- (void)findWaypointsForKey:(id)a3 handler:(id)a4;
- (void)removePendingStops:(id)a3;
- (void)resolveMapItem:(id)a3;
- (void)setDestinationLocation:(id)a3;
- (void)setLocalUpdatesOnlyForClientInfo:(id)a3;
- (void)setTraceName:(id)a3;
- (void)subsumePendingCacheEntry:(id)a3;
@end

@implementation NavdPendingTTLCacheEntry

- (NavdPendingTTLCacheEntry)initWithDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6 cacheOperationQueue:(id)a7 navdCache:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v40.receiver = self;
  v40.super_class = (Class)NavdPendingTTLCacheEntry;
  v21 = [(NavdPendingTTLCacheEntry *)&v40 init];
  v22 = v21;
  if (v21)
  {
    id v37 = v20;
    objc_storeWeak((id *)&v21->_cacheOperationQueue, v19);
    objc_storeStrong((id *)&v22->_cache, a8);
    v22->_state = 0;
    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientInfoStates = v22->_clientInfoStates;
    v22->_clientInfoStates = v23;

    v25 = objc_alloc_init(NavdClientInfoState);
    [(NavdClientInfoState *)v25 setHandler:v18];
    id v38 = v17;
    [(NavdClientInfoState *)v25 setUuid:v17];
    id v39 = v16;
    [(NSMutableDictionary *)v22->_clientInfoStates setObject:v25 forKeyedSubscript:v16];
    objc_storeStrong((id *)&v22->_plannedDestination, a3);
    id v26 = objc_alloc_init((Class)GEORouteHypothesisRequest);
    objc_msgSend(v26, "setTransportType:", objc_msgSend(v15, "transportType"));
    v27 = [v15 arrivalDate];
    [v27 timeIntervalSinceReferenceDate];
    objc_msgSend(v26, "setArrivalDate:");

    v28 = [v15 expirationDate];
    v29 = [v15 arrivalDate];
    v30 = +[GEONavdDefaults sharedInstance];
    [v30 minimumExpirationOffset];
    v31 = objc_msgSend(v29, "dateByAddingTimeInterval:");

    if (v28)
    {
      if ([v28 compare:v31] != (id)-1)
      {
        id v17 = v38;
LABEL_8:
        id v20 = v37;
        objc_msgSend(v28, "timeIntervalSinceReferenceDate", v37);
        objc_msgSend(v26, "setExpirationDate:");
        request = v22->_request;
        v22->_request = (GEORouteHypothesisRequest *)v26;

        v35 = v22;
        id v16 = v39;
        goto LABEL_9;
      }
      id v33 = v31;
    }
    else
    {
      v28 = [v15 arrivalDate];
      v32 = +[GEONavdDefaults sharedInstance];
      [v32 defaultExpirationOffset];
      objc_msgSend(v28, "dateByAddingTimeInterval:");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v17 = v38;

    v28 = v33;
    goto LABEL_8;
  }
LABEL_9:

  return v22;
}

- (void)_setState:(int64_t)a3
{
  [(NavdPendingTTLCacheEntry *)self willChangeValueForKey:@"state"];
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t state = self->_state;
    if (state >= 3)
    {
      v7 = +[NSString stringWithFormat:@"(unknown: %lu)", self->_state];
    }
    else
    {
      v7 = off_100089E58[state];
    }
    v8 = v7;
    if ((unint64_t)a3 >= 3)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %lu)", a3];
    }
    else
    {
      v9 = off_100089E58[a3];
    }
    *(_DWORD *)buf = 138478083;
    v11 = v8;
    __int16 v12 = 2113;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Changing state of start monitoring job from %{private}@ to %{private}@", buf, 0x16u);
  }
  self->_unint64_t state = a3;
  [(NavdPendingTTLCacheEntry *)self didChangeValueForKey:@"state"];
}

- (void)setDestinationLocation:(id)a3
{
}

- (void)setLocalUpdatesOnlyForClientInfo:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clientInfoStates objectForKeyedSubscript:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 setLocalUpdatesOnly:1];
    v3 = v4;
  }
}

- (void)removePendingStops:(id)a3
{
  id v4 = a3;
  clientInfoStates = self->_clientInfoStates;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026A04;
  v10[3] = &unk_100089D48;
  id v11 = v4;
  id v6 = v4;
  v7 = [(NSMutableDictionary *)clientInfoStates keysOfEntriesPassingTest:v10];
  v8 = self->_clientInfoStates;
  v9 = [v7 allObjects];
  [(NSMutableDictionary *)v8 removeObjectsForKeys:v9];
}

- (void)subsumePendingCacheEntry:(id)a3
{
  clientInfoStates = self->_clientInfoStates;
  id v4 = [a3 clientInfoStates];
  [(NSMutableDictionary *)clientInfoStates addEntriesFromDictionary:v4];
}

- (void)findWaypointsForKey:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_state == 1)
  {
    [(NavdPendingTTLCacheEntry *)self _setState:2];
    id v8 = [v7 copy];
    id findWaypointsHandler = self->_findWaypointsHandler;
    self->_id findWaypointsHandler = v8;

    v10 = +[NavdLocationManager sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026C74;
    v14[3] = &unk_100089D98;
    v14[4] = self;
    id v15 = v6;
    [v10 getCurrentLocationWithHandler:v14];
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t state = self->_state;
      if (state >= 3)
      {
        v13 = +[NSString stringWithFormat:@"(unknown: %lu)", self->_state];
      }
      else
      {
        v13 = off_100089E58[state];
      }
      *(_DWORD *)buf = 138543362;
      id v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "findWaypointsForKey:handler: may have been called twice on same Entry.  Was in state %{public}@ when it was called.  Returning.", buf, 0xCu);
    }
  }
}

- (void)_findWaypointsForKey:(id)a3 currentLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 coordinate];
  double v9 = v8;
  [v7 coordinate];
  id v11 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v9, v10);
  __int16 v12 = [v6 request];
  v13 = [v12 destinationLocation];

  [v13 coordinate];
  GEOCalculateDistance();
  double v15 = v14;
  GEOConfigGetDouble();
  double v17 = v16;
  [v7 horizontalAccuracy];
  if (v15 >= v17 + v18)
  {
    v28 = +[GEOMapService sharedService];
    v29 = objc_msgSend(v28, "navd_defaultTraitsForNavd");
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002714C;
    v37[3] = &unk_100089DE8;
    v37[4] = self;
    id v30 = v6;
    id v38 = v30;
    id v31 = +[GEOComposedWaypoint composedWaypointForCurrentLocation:v11 traits:v29 completionHandler:v37 networkActivityHandler:0];

    v32 = +[GEOMapService sharedService];
    id v33 = objc_msgSend(v32, "navd_defaultTraitsForNavd");
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002732C;
    v35[3] = &unk_100089DE8;
    v35[4] = self;
    id v36 = v30;
    id v34 = +[GEOComposedWaypoint composedWaypointForMapItem:v13 traits:v33 clientAttributes:0 completionHandler:v35 networkActivityHandler:0];
  }
  else
  {
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      [v7 horizontalAccuracy];
      *(_DWORD *)buf = 134218240;
      objc_super v40 = v20;
      __int16 v41 = 2048;
      double v42 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Distance between source and destination is less than the location accuracy: %f plus addendum: %f", buf, 0x16u);
    }

    [v7 horizontalAccuracy];
    v22 = +[NSString stringWithFormat:@"Distance between source and destination is less than the location accuracy: %f plus addendum: %f", v21, *(void *)&v17];
    v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      objc_super v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{private}@", buf, 0xCu);
    }

    v24 = +[NSError GEOErrorWithCode:-10 reason:v22];
    objc_storeStrong((id *)&self->_originWaypointError, v24);
    originWaypoint = self->_originWaypoint;
    self->_originWaypoint = 0;

    destinationWaypoint = self->_destinationWaypoint;
    self->_destinationWaypoint = 0;

    destinationWaypointError = self->_destinationWaypointError;
    self->_destinationWaypointError = v24;

    [(NavdPendingTTLCacheEntry *)self _finishedResolvingWaypointsForKey:v6];
  }
}

- (BOOL)_isFinishedResolvingWaypoints
{
  if (!self->_originWaypoint && !self->_originWaypointError) {
    return 0;
  }
  if (self->_destinationWaypoint) {
    return 1;
  }
  return self->_destinationWaypointError != 0;
}

- (void)_receivedOriginWaypoint:(id)a3 forKey:(id)a4
{
  id v6 = (GEOComposedWaypoint *)a3;
  id v8 = a4;
  originWaypoint = self->_originWaypoint;
  self->_originWaypoint = v6;

  if ([(NavdPendingTTLCacheEntry *)self _isFinishedResolvingWaypoints]) {
    [(NavdPendingTTLCacheEntry *)self _finishedResolvingWaypointsForKey:v8];
  }
}

- (void)_receivedErrorWhileResolvingOriginWaypoint:(id)a3 forKey:(id)a4
{
  id v6 = (NSError *)a3;
  id v8 = a4;
  originWaypointError = self->_originWaypointError;
  self->_originWaypointError = v6;

  if ([(NavdPendingTTLCacheEntry *)self _isFinishedResolvingWaypoints]) {
    [(NavdPendingTTLCacheEntry *)self _finishedResolvingWaypointsForKey:v8];
  }
}

- (void)_receivedDestinationWaypoint:(id)a3 forKey:(id)a4
{
  id v6 = (GEOComposedWaypoint *)a3;
  id v8 = a4;
  destinationWaypoint = self->_destinationWaypoint;
  self->_destinationWaypoint = v6;

  if ([(NavdPendingTTLCacheEntry *)self _isFinishedResolvingWaypoints]) {
    [(NavdPendingTTLCacheEntry *)self _finishedResolvingWaypointsForKey:v8];
  }
}

- (void)_receivedErrorWhileResolvingDestinationWaypoint:(id)a3 forKey:(id)a4
{
  id v6 = (NSError *)a3;
  id v8 = a4;
  destinationWaypointError = self->_destinationWaypointError;
  self->_destinationWaypointError = v6;

  if ([(NavdPendingTTLCacheEntry *)self _isFinishedResolvingWaypoints]) {
    [(NavdPendingTTLCacheEntry *)self _finishedResolvingWaypointsForKey:v8];
  }
}

- (void)_finishedResolvingWaypointsForKey:(id)a3
{
  (*((void (**)(void))self->_findWaypointsHandler + 2))();
  id findWaypointsHandler = self->_findWaypointsHandler;
  self->_id findWaypointsHandler = 0;

  originWaypoint = self->_originWaypoint;
  self->_originWaypoint = 0;

  originWaypointError = self->_originWaypointError;
  self->_originWaypointError = 0;

  destinationWaypoint = self->_destinationWaypoint;
  self->_destinationWaypoint = 0;

  destinationWaypointError = self->_destinationWaypointError;
  self->_destinationWaypointError = 0;
}

- (void)resolveMapItem:(id)a3
{
  id v4 = a3;
  [(NavdPendingTTLCacheEntry *)self _setState:1];
  v5 = +[GEOMapService sharedService];
  id v6 = [(GEOPlannedDestination *)self->_plannedDestination handle];
  id v7 = +[GEOMapService sharedService];
  id v8 = objc_msgSend(v7, "navd_defaultTraitsForNavd");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000278C8;
  v10[3] = &unk_100089E38;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v5 resolveMapItemFromHandle:v6 withTraits:v8 useCache:1 coordinateOnlyRefinement:1 completionHandler:v10];
}

- (GEOPlannedDestination)plannedDestination
{
  return self->_plannedDestination;
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (GEORouteHypothesisRequest)request
{
  return self->_request;
}

- (NSDictionary)clientInfoStates
{
  return &self->_clientInfoStates->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_plannedDestination, 0);
  objc_storeStrong(&self->_findWaypointsHandler, 0);
  objc_storeStrong((id *)&self->_destinationWaypointError, 0);
  objc_storeStrong((id *)&self->_originWaypointError, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
  objc_storeStrong((id *)&self->_originWaypoint, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clientInfoStates, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_destroyWeak((id *)&self->_cacheOperationQueue);
}

@end