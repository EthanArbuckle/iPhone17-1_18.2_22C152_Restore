@interface GEORouteHypothesisMonitorWalkingDriving
- (BOOL)_checkForArrival:(id)a3 routeMatch:(id)a4;
- (void)_fetchETAWithRouteMatch:(id)a3;
- (void)_recalculateETAWithRouteMatch:(id)a3;
- (void)_sendETARequestWithRouteMatch:(id)a3 updater:(id)a4;
- (void)checkRouteForLocation:(id)a3;
@end

@implementation GEORouteHypothesisMonitorWalkingDriving

- (void)_recalculateETAWithRouteMatch:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  liveETARoute = self->super._liveETARoute;
  if (!liveETARoute) {
    liveETARoute = self->super._route;
  }
  id v6 = liveETARoute;
  if ([(GEORouteHypothesisMonitor *)self supportsLiveTraffic])
  {
    v7 = self->super._liveETARoute;
    if (!v7 || [(GEOComposedETARoute *)v7 hasValidTravelDurations])
    {
      int v8 = 1;
      goto LABEL_11;
    }
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Live ETA route doesn't have valid travel durations. Falling back to static travel durations.", (uint8_t *)&v35, 2u);
    }
  }
  int v8 = 0;
LABEL_11:
  route = self->super._route;
  uint64_t v11 = [v4 routeCoordinate];
  if (v8) {
    v12 = self->super._liveETARoute;
  }
  else {
    v12 = 0;
  }
  [(GEOComposedRoute *)route remainingTimeToEndOfRouteFrom:v11 etaRoute:v12];
  double v14 = v13;
  GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v4 routeCoordinate];
    v18 = GEOPolylineCoordinateAsString(v16, 1, 0, v17);
    v19 = self->super._liveETARoute;
    int v35 = 134218755;
    double v36 = v14;
    __int16 v37 = 2113;
    v38 = v18;
    __int16 v39 = 2048;
    v40 = v19;
    __int16 v41 = 1024;
    int v42 = v8;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Remaining time: %0.1fs | routeCoordinate: %{private}@ | etaRoute: %p | usingLiveTravelDurations: %d", (uint8_t *)&v35, 0x26u);
  }
  objc_msgSend(v6, "_hypothesis_travelDurationAggressiveEstimate");
  double v20 = 0.0;
  if (v21 <= 0.0 || (objc_msgSend(v6, "_hypothesis_travelDurationConservativeEstimate"), v22 <= 0.0))
  {
    double v23 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "_hypothesis_travelDuration");
    double v23 = 0.0;
    if (v24 > 0.0)
    {
      if (v4)
      {
        objc_msgSend(v6, "_hypothesis_travelDuration");
        if (v25 != 0.0)
        {
          objc_msgSend(v6, "_hypothesis_travelDuration");
          double v23 = v14 / v26;
        }
      }
      else
      {
        double v23 = 1.0;
      }
      objc_msgSend(v6, "_hypothesis_travelDurationConservativeEstimate");
      double v33 = v32;
      objc_msgSend(v6, "_hypothesis_travelDurationAggressiveEstimate");
      double v20 = v23 * v33;
      double v23 = v23 * v34;
    }
  }
  v27 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

  if (v28)
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:self->super._arrivalDate sinceDate:-v20];
    GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = _navd_debugDurationAsString(v14);
      int v35 = 138478083;
      double v36 = *(double *)&v31;
      __int16 v37 = 2113;
      v38 = v29;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "Updating ETA along route | ETA with traffic: %{private}@ | Conservative Start Date: %{private}@", (uint8_t *)&v35, 0x16u);
    }
  }
  [(GEORouteHypothesis *)self->super._hypothesis _setError:0];
  [(GEORouteHypothesis *)self->super._hypothesis _updateDepartureAndArrivalSuggestionsForArrivalDate:self->super._arrivalDate travelTimeWithTraffic:[(GEOComposedRoute *)self->super._route transportType] conservativeTravelTime:v14 aggressiveTravelTime:v20 transportType:v23];
}

- (void)_fetchETAWithRouteMatch:(id)a3
{
  id v4 = a3;
  if ([(GEORouteHypothesisMonitor *)self supportsLiveTraffic])
  {
    if (v4) {
      [(GEORouteHypothesisMonitorWalkingDriving *)self _sendETARequestWithRouteMatch:v4 updater:self->super._liveETAUpdater];
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)GEORouteHypothesisMonitorWalkingDriving;
    [(GEORouteHypothesisMonitor *)&v5 _fetchETAWithRouteMatch:v4];
  }
}

- (void)_sendETARequestWithRouteMatch:(id)a3 updater:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    [v7 setRoute:self->super._route];
    destination = self->super._destination;
    v12[0] = self->super._source;
    v12[1] = destination;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v8 setWaypoints:v10];

    [v8 setUserLocation:self->super._lastLocation];
    [v8 setRouteMatch:v6];
    uint64_t v11 = (void *)[(GEORouteAttributes *)self->super._routeAttributes copy];
    [v8 setRouteAttributes:v11];

    [v8 requestUpdate];
  }
}

- (void)checkRouteForLocation:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  routeMatch = self->super._routeMatch;
  self->super._routeMatch = 0;

  if (self->super._route)
  {
    [(GEOLocation *)self->super._originLocation coordinate];
    double v8 = v7;
    double v10 = v9;
    [v5 coordinate];
    double v12 = v11;
    double v14 = v13;
    double v15 = GEOCalculateDistanceRadius(v8, v10, v11, v13, 6367000.0);
    uint64_t v16 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v36 = 134217984;
      *(double *)__int16 v37 = v15;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "Distance between origin and location is: %.2f", (uint8_t *)&v36, 0xCu);
    }

    p_lastMatchedLocation = &self->super._lastMatchedLocation;
    lastMatchedLocation = self->super._lastMatchedLocation;
    if (lastMatchedLocation)
    {
      [(GEOLocation *)lastMatchedLocation coordinate];
      double v21 = GEOCalculateDistanceRadius(v19, v20, v12, v14, 6367000.0);
      double v22 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v36 = 134217984;
        *(double *)__int16 v37 = v21;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "Distance between location and last matched location is: %.2f", (uint8_t *)&v36, 0xCu);
      }

      double v23 = +[GEONavdDefaults sharedInstance];
      [v23 exitRegionSize];
      BOOL v25 = v21 > v24;

      double v26 = *p_lastMatchedLocation;
    }
    else
    {
      double v26 = 0;
      BOOL v25 = 1;
    }
    *p_lastMatchedLocation = 0;

    v27 = +[GEONavdDefaults sharedInstance];
    [v27 exitRegionSize];
    BOOL v29 = v15 > v28 && v25;

    if (self->super._isTraveling != v29)
    {
      self->super._isTraveling = v29;
      [(GEORouteHypothesisMonitor *)self travelStateChanged];
    }
    v30 = [(GEORouteHypothesisMonitor *)self routeMatchForLocation:v5];
    v31 = self->super._routeMatch;
    self->super._routeMatch = v30;

    if (self->super._routeMatch)
    {
      objc_storeStrong((id *)&self->super._lastMatchedLocation, a3);
      double v32 = self->super._routeMatch;
      if (v32)
      {
        if ([(GEORouteMatch *)v32 isGoodMatch])
        {
          [(GEORouteHypothesisMonitor *)self cancelCurrentRequest];
          [(GEORouteHypothesisMonitor *)self _updateScoreForLocation:v5];
          self->super._BOOL needReroute = 0;
        }
      }
    }
    if ([(GEORouteHypothesisMonitorWalkingDriving *)self _checkForArrival:v5 routeMatch:self->super._routeMatch])
    {
      if (!self->super._hasArrived)
      {
        [(GEORouteHypothesizerAnalyticsStore *)self->super._analyticsStore didArriveWithExpectedArrivalTime:self->super._arrivalDate];
        self->super._BOOL hasArrived = 1;
      }
    }
    else if ([(GEORouteMatch *)self->super._routeMatch isGoodMatch])
    {
      self->super._BOOL hasArrived = 0;
    }
    else
    {
      self->super._BOOL needReroute = 1;
    }
    double v33 = GEOFindOrCreateLog("com.apple.GeoServices", "RouteHypothesisMonitor");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      BOOL hasArrived = self->super._hasArrived;
      BOOL needReroute = self->super._needReroute;
      int v36 = 67109632;
      *(_DWORD *)__int16 v37 = v29;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = hasArrived;
      __int16 v38 = 1024;
      BOOL v39 = needReroute;
      _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_DEBUG, "User traveling? %d. User arrived? %d. Need reroute? %d", (uint8_t *)&v36, 0x14u);
    }
  }
}

- (BOOL)_checkForArrival:(id)a3 routeMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 step];
    double v10 = v9;
    if (v9) {
      BOOL v11 = [v9 maneuverType] == 18
    }
         || [v10 maneuverType] == 33
         || [v10 maneuverType] == 34;
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  if (!self->super._arrivalMapRegion)
  {
    double v12 = [(GEOComposedWaypoint *)self->super._destination geoMapItem];
    objc_msgSend(v12, "_arrivalMapRegionForTransportType:", -[GEORouteHypothesisMonitor transportType](self, "transportType"));
    double v13 = (GEOMapRegion *)objc_claimAutoreleasedReturnValue();
    arrivalMapRegion = self->super._arrivalMapRegion;
    self->super._arrivalMapRegion = v13;
  }
  route = self->super._route;
  [v6 coordinate];
  double v17 = v16;
  double v19 = v18;
  [v8 locationCoordinate];
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [v8 routeCoordinate];
  [v8 distanceFromRoute];
  BOOL v26 = -[GEOComposedRoute checkDrivingArrivalForCoordinate:coordinateOnRoute:routePointIndex:distanceFromRoute:arrivalMapRegion:checkArrivalRadius:checkDistanceAlongRoute:checkRoadAccessPoints:isOnRoute:](route, "checkDrivingArrivalForCoordinate:coordinateOnRoute:routePointIndex:distanceFromRoute:arrivalMapRegion:checkArrivalRadius:checkDistanceAlongRoute:checkRoadAccessPoints:isOnRoute:", v24, self->super._arrivalMapRegion, 1, v11, 0, [v8 isGoodMatch], v17, v19, v21, v23, v25);

  return v26;
}

@end