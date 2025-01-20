@interface MSPNavigationListener
- (BOOL)_currentlyArrivedAtWaypoint;
- (BOOL)_isCompatibleTransportType:(int)a3;
- (BOOL)_updateArrivalTimeAndDistance:(id)a3;
- (BOOL)_updateLocation:(id)a3 withRouteMatchedCoordinate:(id)a4;
- (BOOL)_updateTraffic:(id)a3;
- (BOOL)_updateWaypointsIfNeeded:(id)a3;
- (BOOL)isCompatibleNavigationType;
- (BOOL)isCompatibleTransportType;
- (BOOL)isInNavigatingState;
- (GEOSharedNavState)currentState;
- (MSPNavigationListener)init;
- (MSPNavigationListenerDelegate)delegate;
- (NSString)description;
- (NSString)navigationSessionIdentifier;
- (int)_analyticsPipelineTransportModeForGEOTransportType:(int)a3;
- (int)_currentTransportType;
- (int)_referenceFrameForDestination:(id)a3;
- (void)_checkStateIsReady;
- (void)_clearArrivedState;
- (void)_initPendingStateIfNeeded;
- (void)_initPendingStateIfNeededWithTransportType:(int)a3 isResumingMultipointRoute:(BOOL)a4;
- (void)_performDelegateNotificationBlockIfReady:(id)a3;
- (void)_updateCurrentWaypointIndexFromArrivalTimeInfo:(id)a3;
- (void)_updateRoute:(id)a3;
- (void)_updateTransaction;
- (void)_updateTransportTypeFromCurrentState;
- (void)dealloc;
- (void)navigationListener:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5;
- (void)navigationListener:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)navigationListener:(id)a3 didUpdateETA:(id)a4;
- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4;
- (void)navigationListener:(id)a3 didUpdateLocation:(id)a4 routeMatchedCoordinate:(id)a5;
- (void)navigationListener:(id)a3 didUpdateRoute:(id)a4;
- (void)navigationListener:(id)a3 didUpdateTrafficForCurrentRoute:(id)a4;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSPNavigationListener

- (MSPNavigationListener)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MSPNavigationListener;
  v2 = [(MSPNavigationListener *)&v8 init];
  if (v2)
  {
    v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380675;
      v10 = "-[MSPNavigationListener init]";
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[NavListener] %{private}s", buf, 0xCu);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F64770]);
    uint64_t v5 = [v4 initWithQueue:MEMORY[0x1E4F14428] wantsRoutes:1];
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = (GEONavigationListener *)v5;

    [(GEONavigationListener *)v2->_navigationListener setDelegate:v2];
  }
  return v2;
}

- (void)_initPendingStateIfNeeded
{
  uint64_t v3 = [(MSPNavigationListener *)self _currentTransportType];
  uint64_t v4 = [(GEONavigationListener *)self->_navigationListener isResumingMultipointRoute];

  [(MSPNavigationListener *)self _initPendingStateIfNeededWithTransportType:v3 isResumingMultipointRoute:v4];
}

- (void)_initPendingStateIfNeededWithTransportType:(int)a3 isResumingMultipointRoute:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    objc_super v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, no delegate";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (self->_state)
  {
    objc_super v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, we already have one";
LABEL_16:
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (![(MSPNavigationListener *)self isInNavigatingState])
  {
    objc_super v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "MSPNavigationListener not creating state, not navigating";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v5 == 4 || ![(MSPNavigationListener *)self _isCompatibleTransportType:v5])
  {
    objc_super v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E617E740[(int)v5];
      }
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "MSPNavigationListener not creating state, unknown or incompatible transport type: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  v10 = (GEOSharedNavState *)objc_alloc_init(MEMORY[0x1E4F64A38]);
  state = self->_state;
  self->_state = v10;

  v12 = [(MSPNavigationListener *)self navigationSessionIdentifier];
  [(GEOSharedNavState *)self->_state setGroupIdentifier:v12];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
  v13 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if v5 < 7 && ((0x6Fu >> v5))
    {
      v14 = off_1E617E708[(int)v5];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener create state for transport type: %@ isResumingMultipointRoute: %d", buf, 0x12u);
  }
  [(GEOSharedNavState *)self->_state setTransportType:v5];
  [(GEOSharedNavState *)self->_state setProtocolVersion:1];
  [(GEOSharedNavState *)self->_state setClosed:0];
  [(GEOSharedNavState *)self->_state setArrived:[(MSPNavigationListener *)self _currentlyArrivedAtWaypoint]];
  [(GEOSharedNavState *)self->_state setResumed:v4];
  self->_postedStateIsReady = 0;
  v16 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "MSPNavigationListener requesting current guidance, route, ETA and current step...", buf, 2u);
  }

  [(GEONavigationListener *)self->_navigationListener requestGuidanceState];
  [(GEONavigationListener *)self->_navigationListener requestRoute];
  [(GEONavigationListener *)self->_navigationListener requestETAUpdate];
  [(GEONavigationListener *)self->_navigationListener requestStepIndex];
LABEL_18:
}

- (void)_checkStateIsReady
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = WeakRetained;
  if (self->_state)
  {
    if (!self->_postedStateIsReady && WeakRetained != 0)
    {
      v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener checking state...", buf, 2u);
      }

      v7 = [(GEOSharedNavState *)self->_state destinationInfo];
      if (!v7 || ![(GEOSharedNavState *)self->_state waypointInfosCount]) {
        goto LABEL_17;
      }
      objc_super v8 = [(GEOSharedNavState *)self->_state etaInfo];
      if (![v8 hasEtaTimestamp]
        || ([(GEOSharedNavState *)self->_state hasTransportType] & 1) == 0)
      {

LABEL_17:
        goto LABEL_18;
      }
      int v9 = [(GEOSharedNavState *)self->_state hasCurrentWaypointIndex];

      if (v9)
      {
        v7 = [(GEONavigationListener *)self->_navigationListener lastLocation];
        [(MSPNavigationListener *)self _updateLocation:v7 withRouteMatchedCoordinate:*MEMORY[0x1E4F64198]];
        v10 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [(GEOSharedNavState *)self->_state transportType];
          if (v11 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = off_1E617E740[(int)v11];
          }
          state = self->_state;
          v14 = v12;
          v15 = [(GEOSharedNavState *)state etaInfos];
          v16 = [(GEOSharedNavState *)self->_state destinationName];
          uint64_t v17 = [(GEOSharedNavState *)self->_state waypointInfosCount];

          *(_DWORD *)buf = 138413314;
          __int16 v19 = v12;
          __int16 v20 = 2112;
          uint64_t v21 = v15;
          __int16 v22 = 2112;
          v23 = v16;
          __int16 v24 = 2048;
          uint64_t v25 = v17;
          __int16 v26 = 2112;
          v27 = v7;
          _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener has required info (transportType: %@, ETAs: %@, destination: %@, %lu waypoints), optional (location: %@)", buf, 0x34u);
        }
        self->_postedStateIsReady = 1;
        [v4 navigationListenerIsReady:self];
        goto LABEL_17;
      }
    }
  }
LABEL_18:
}

- (NSString)navigationSessionIdentifier
{
  navigationSessionIdentifier = self->_navigationSessionIdentifier;
  if (!navigationSessionIdentifier)
  {
    BOOL v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
    v6 = self->_navigationSessionIdentifier;
    self->_navigationSessionIdentifier = v5;

    navigationSessionIdentifier = self->_navigationSessionIdentifier;
  }

  return navigationSessionIdentifier;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    state = self->_state;
    self->_state = 0;

    self->_postedStateIsReady = 0;
  }
  objc_storeWeak((id *)&self->_delegate, obj);
  [(MSPNavigationListener *)self _updateTransaction];
  [(MSPNavigationListener *)self _initPendingStateIfNeeded];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPNavigationListener dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[NavListener] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPNavigationListener;
  [(MSPNavigationListener *)&v4 dealloc];
}

- (GEOSharedNavState)currentState
{
  return self->_state;
}

- (BOOL)isInNavigatingState
{
  return [(GEONavigationListener *)self->_navigationListener navigationState] == 2;
}

- (BOOL)isCompatibleNavigationType
{
  if ([(GEONavigationListener *)self->_navigationListener navigationState] == 2)
  {
    int v3 = [(GEONavigationGuidanceState *)self->_guidanceState hasNavigationType];
    if (v3) {
      LOBYTE(v3) = [(GEONavigationGuidanceState *)self->_guidanceState navigationType] == 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCompatibleTransportType
{
  uint64_t v3 = [(MSPNavigationListener *)self _currentTransportType];

  return [(MSPNavigationListener *)self _isCompatibleTransportType:v3];
}

- (BOOL)_isCompatibleTransportType:(int)a3
{
  if ([(GEONavigationListener *)self->_navigationListener navigationState] != 2) {
    return 0;
  }
  if ((a3 - 1) > 5) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = qword_1B886DA38[a3 - 1];
  }

  return MSPSharedTripSharingSupportedForTransportType(v4);
}

- (int)_currentTransportType
{
  if (![(GEONavigationGuidanceState *)self->_guidanceState hasTrackedTransportType])return 4; {
  guidanceState = self->_guidanceState;
  }

  return [(GEONavigationGuidanceState *)guidanceState trackedTransportType];
}

- (BOOL)_currentlyArrivedAtWaypoint
{
  int v3 = [(GEONavigationGuidanceState *)self->_guidanceState hasNavigationState];
  if (v3) {
    LOBYTE(v3) = ([(GEONavigationGuidanceState *)self->_guidanceState navigationState] & 0xFFFFFFFE) == 6;
  }
  return v3;
}

- (void)_updateRoute:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state = self->_state;
  if (state)
  {
    if (([(GEOSharedNavState *)state hasReferenceFrame] & 1) == 0)
    {
      v6 = [v4 destination];
      [(GEOSharedNavState *)self->_state setReferenceFrame:[(MSPNavigationListener *)self _referenceFrameForDestination:v6]];
    }
    [(GEOSharedNavState *)self->_state updateRouteInfoFromComposedRoute:v4];
    uint64_t v7 = MSPGetSharedTripNavEventsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_super v8 = [(GEOSharedNavState *)self->_state mspDescription];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEBUG, "_updateRoute %@", (uint8_t *)&v9, 0xCu);
    }
    [(MSPNavigationListener *)self _checkStateIsReady];
  }
}

- (BOOL)_updateTraffic:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_state) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(GEOSharedNavState *)self->_state mspDescription];
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "_updateTraffic %@", (uint8_t *)&v9, 0xCu);
  }
  BOOL v7 = [(GEOSharedNavState *)self->_state updateFromTraffic:v4];

  return v7;
}

- (BOOL)_updateLocation:(id)a3 withRouteMatchedCoordinate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = v6;
  if (self->_state)
  {
    objc_super v8 = [v6 latLng];

    if (v8)
    {
      int v9 = [(GEOSharedNavState *)self->_state lastLocation];
      v10 = [(GEOSharedNavState *)self->_state lastLocation];
      uint64_t v11 = [v10 coordinate];

      v12 = [v7 latLng];
      if ([v11 isEqual:v12])
      {
        [v9 matchedCoordinate];
        char v13 = GEOPolylineCoordinateEqual();

        if (v13)
        {
          BOOL v14 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
      }
      id v15 = objc_alloc_init(MEMORY[0x1E4F64A20]);
      v16 = [v7 latLng];
      [v15 setCoordinate:v16];

      if (GEOPolylineCoordinateIsValid())
      {
        [v15 setMatchedCoordinateIndex:a4];
        *(float *)&double v17 = a4.var1;
        [v15 setMatchedCoordinateOffset:v17];
      }
      [(GEOSharedNavState *)self->_state setLastLocation:v15];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
      v18 = MSPGetSharedTripNavEventsLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = [(GEOSharedNavState *)self->_state mspDescription];
        int v21 = 138412290;
        __int16 v22 = v19;
        _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEBUG, "_updateLocation %@", (uint8_t *)&v21, 0xCu);
      }
      BOOL v14 = 1;
      goto LABEL_13;
    }
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)_updateWaypointsIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = 0;
  if (v4)
  {
    state = self->_state;
    if (state)
    {
      if ([(GEOSharedNavState *)state updateWaypointsFromComposedRoute:v4])
      {
        BOOL v7 = MSPGetSharedTripNavEventsLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v8 = [v4 waypoints];
          int v9 = [v8 valueForKey:@"name"];
          int v11 = 138477827;
          v12 = v9;
          _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener waypoints updated %{private}@", (uint8_t *)&v11, 0xCu);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        BOOL v5 = 1;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }

  return v5;
}

- (void)_updateCurrentWaypointIndexFromArrivalTimeInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_state)
  {
    uint64_t v4 = [a3 legIndex];
    if ([(GEOSharedNavState *)self->_state hasCurrentWaypointIndex])
    {
      if ([(GEOSharedNavState *)self->_state currentWaypointIndex] != v4)
      {
        BOOL v5 = MSPGetSharedTripNavEventsLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v6 = [(GEOSharedNavState *)self->_state currentWaypointIndex];
          int v8 = 134218240;
          uint64_t v9 = v6;
          __int16 v10 = 2048;
          uint64_t v11 = v4;
          _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "_updateETA: update current waypoint %lu -> %lu", (uint8_t *)&v8, 0x16u);
        }

        [(GEOSharedNavState *)self->_state setCurrentWaypointIndex:v4];
        [(GEOSharedNavState *)self->_state setArrived:0];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_17];
      }
    }
    else
    {
      BOOL v7 = MSPGetSharedTripNavEventsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        uint64_t v9 = v4;
        _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "_updateETA: setting initial waypoint index: %lu", (uint8_t *)&v8, 0xCu);
      }

      [(GEOSharedNavState *)self->_state setCurrentWaypointIndex:v4];
      [(MSPNavigationListener *)self _checkStateIsReady];
    }
  }
}

uint64_t __72__MSPNavigationListener__updateCurrentWaypointIndexFromArrivalTimeInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerResumed:a2];
}

- (BOOL)_updateArrivalTimeAndDistance:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state = self->_state;
  if (state)
  {
    if ([(GEOSharedNavState *)state etaInfosCount])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      BOOL v7 = [v4 arrivalTimeInfo];
      int v8 = [v4 arrivalTimeInfo];
      uint64_t v9 = MapsMap(v8, &__block_literal_global_17);
      __int16 v10 = (void *)[v6 initWithObjects:v7 forKeys:v9];

      *(void *)v29 = 0;
      v30 = v29;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      uint64_t v11 = [(GEOSharedNavState *)self->_state etaInfos];
      uint64_t v12 = (void *)[v11 copy];

      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_2;
      __int16 v24 = &unk_1E617E6C8;
      uint64_t v13 = v10;
      uint64_t v28 = v29;
      uint64_t v25 = v13;
      __int16 v26 = self;
      id v27 = v4;
      [v12 enumerateObjectsUsingBlock:&v21];
      if (v30[24])
      {
        objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v21, v22, v23, v24, v25, v26);
        -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
        BOOL v14 = MSPGetSharedTripNavEventsLog();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

        if (v15)
        {
          v16 = MSPGetSharedTripNavEventsLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            double v17 = [(GEOSharedNavState *)self->_state etaInfos];
            v18 = MapsMap(v17, &__block_literal_global_24);
            *(_DWORD *)buf = 138412290;
            v34 = v18;
            _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_DEBUG, "_updateETA complete: %@", buf, 0xCu);
          }
        }
      }
      BOOL v19 = v30[24] != 0;

      _Block_object_dispose(v29, 8);
    }
    else
    {
      uint64_t v13 = MSPGetSharedTripNavEventsLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "_updateETA: we don't have ETAs to fill out, waiting for route update", v29, 2u);
      }
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 legIndex];

  return [v2 numberWithUnsignedInteger:v3];
}

void __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  BOOL v7 = [NSNumber numberWithUnsignedInteger:a3];
  int v8 = [v6 objectForKeyedSubscript:v7];

  if (v8 || ![v5 hasEtaTimestamp])
  {
    [v5 remainingTime];
    double v13 = v12;
    [v8 remainingTime];
    if (vabdd_f64(v13, v14) >= 0.00999999978)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [v8 remainingTime];
      MNDisplayETAAndRemainingMinutes();
      __int16 v10 = 0;
      [v10 timeIntervalSinceReferenceDate];
      objc_msgSend(v5, "setEtaTimestamp:");
      BOOL v15 = MSPGetSharedTripNavEventsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        [v5 remainingTime];
        uint64_t v17 = v16;
        [v8 remainingTime];
        *(_DWORD *)buf = 134218496;
        uint64_t v20 = a3;
        __int16 v21 = 2048;
        uint64_t v22 = v17;
        __int16 v23 = 2048;
        uint64_t v24 = v18;
        _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "_updateETA: updating waypoint %lu remaining time: %#.1lfs -> %#.1lfs", buf, 0x20u);
      }

      [v8 remainingTime];
      objc_msgSend(v5, "setRemainingTime:");
      if ([*(id *)(*(void *)(a1 + 40) + 32) hasCurrentWaypointIndex]
        && [*(id *)(*(void *)(a1 + 40) + 32) currentWaypointIndex] == a3)
      {
        [*(id *)(a1 + 48) distanceRemainingToEndOfLeg];
        objc_msgSend(v5, "setRemainingDistance:");
      }
      else
      {
        [v5 setRemainingDistance:0.0];
        [v5 setHasRemainingDistance:0];
      }
    }
    else
    {
      __int16 v10 = MSPGetSharedTripNavEventsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = a3;
        _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEBUG, "_updateETA: skipping unchanged waypoint %lu eta", buf, 0xCu);
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v9 = MSPGetSharedTripNavEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = a3;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "_updateETA: clearing passed waypoint %lu etaInfo", buf, 0xCu);
    }

    __int16 v10 = [*(id *)(*(void *)(a1 + 40) + 32) etaInfos];
    id v11 = objc_alloc_init(MEMORY[0x1E4F64A18]);
    [v10 replaceObjectAtIndex:a3 withObject:v11];
  }
}

uint64_t __55__MSPNavigationListener__updateArrivalTimeAndDistance___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 mspDescription];
}

- (void)_updateTransportTypeFromCurrentState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  guidanceState = self->_guidanceState;
  if (guidanceState)
  {
    if ([(GEONavigationGuidanceState *)guidanceState hasTrackedTransportType])
    {
      if (![(GEOSharedNavState *)self->_state hasTransportType]
        || (int v4 = [(GEOSharedNavState *)self->_state transportType],
            v4 != [(GEONavigationGuidanceState *)self->_guidanceState trackedTransportType]))
      {
        id v5 = MSPGetSharedTripNavEventsLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v6 = [(GEOSharedNavState *)self->_state transportType];
          if (v6 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
            BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v7 = off_1E617E740[(int)v6];
          }
          int v8 = v7;
          uint64_t v9 = [(GEONavigationGuidanceState *)self->_guidanceState trackedTransportType];
          if (v9 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
            __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            __int16 v10 = off_1E617E740[(int)v9];
          }
          *(_DWORD *)buf = 138412546;
          double v12 = v8;
          __int16 v13 = 2112;
          double v14 = v10;
          _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "_updateTransportType %@ -> %@", buf, 0x16u);
        }
        [(GEOSharedNavState *)self->_state setTransportType:[(GEONavigationGuidanceState *)self->_guidanceState trackedTransportType]];
      }
    }
  }
}

- (int)_referenceFrameForDestination:(id)a3
{
  id v3 = a3;
  if ([v3 hasMapItemStorage])
  {
    int v4 = [v3 mapItemStorage];
    if ([v4 referenceFrame])
    {
      int v5 = [v4 referenceFrame];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F64670];
      [v4 coordinate];
      if (objc_msgSend(v11, "isLocationShiftRequiredForCoordinate:")) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
    }
    goto LABEL_10;
  }
  if ([v3 hasWaypoint])
  {
    int v4 = [v3 waypoint];
    uint64_t v6 = [v4 waypointLocation];
    BOOL v7 = [v6 location];
    int v8 = [v7 hasReferenceFrame];

    if (v8)
    {
      uint64_t v9 = [v4 waypointLocation];
      __int16 v10 = [v9 location];
      int v5 = [v10 referenceFrame];

LABEL_10:
      goto LABEL_17;
    }
  }
  if ([v3 hasLatLng])
  {
    double v12 = [v3 latLng];
    [v12 lat];
    double v14 = v13;
    uint64_t v15 = [v3 latLng];
    [v15 lng];
    double v17 = v16;

    if (objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v14, v17)) {
      int v5 = 2;
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
LABEL_17:

  return v5;
}

- (void)_updateTransaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = WeakRetained;
  transaction = self->_transaction;
  if (transaction) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = WeakRetained == 0;
  }
  if (v6)
  {
    if (transaction) {
      BOOL v7 = WeakRetained == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7 && ![(MSPNavigationListener *)self isInNavigatingState])
    {
      int v8 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "MSPNavigationListener not navigating or no delegate, stopping transaction", v12, 2u);
      }

      uint64_t v9 = 0;
      goto LABEL_19;
    }
  }
  else if ([(MSPNavigationListener *)self isInNavigatingState])
  {
    __int16 v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "MSPNavigationListener now navigating with delegate, starting transaction", buf, 2u);
    }

    uint64_t v9 = (OS_os_transaction *)os_transaction_create();
LABEL_19:
    id v11 = self->_transaction;
    self->_transaction = v9;
  }
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    GEONavigationListenerStateAsString();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = off_1E617E740[(int)v5];
    }
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener state change (navigation: %@, transport type: %@)", buf, 0x16u);
  }
  if (a4 == 2)
  {
    [(MSPNavigationListener *)self _updateTransaction];
    [(GEONavigationListener *)self->_navigationListener requestGuidanceState];
    -[MSPNavigationListener _initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:](self, "_initPendingStateIfNeededWithTransportType:isResumingMultipointRoute:", v5, [v8 isResumingMultipointRoute]);
    uint64_t v12 = [(MSPNavigationListener *)self _analyticsPipelineTransportModeForGEOTransportType:v5];
    double v13 = [MEMORY[0x1E4F63E38] sharedData];
    [v13 setMapUiShownActiveNavMode:v12];
  }
  else
  {
    navigationSessionIdentifier = self->_navigationSessionIdentifier;
    self->_navigationSessionIdentifier = 0;

    state = self->_state;
    if (state)
    {
      [(GEOSharedNavState *)state setClosed:1];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v17 = v16;
      -[GEOSharedNavState setClosedTimestamp:](self->_state, "setClosedTimestamp:");
      [(GEOSharedNavState *)self->_state setUpdatedTimestamp:v17];
      [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_29];
    }
    uint64_t v18 = [MEMORY[0x1E4F63E38] sharedData];
    [v18 setMapUiShownActiveNavMode:0];

    BOOL v19 = [MEMORY[0x1E4F63E38] sharedData];
    [v19 setHasMapUiShownActiveNavMode:0];

    [(MSPNavigationListener *)self _updateTransaction];
  }
}

uint64_t __83__MSPNavigationListener_navigationListener_didChangeNavigationState_transportType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerStopped:a2];
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener guidance state change: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(GEONavigationListener *)self->_navigationListener navigationState] == 2) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = 0;
  }
  objc_storeStrong((id *)&self->_guidanceState, v7);
  if (self->_state)
  {
    [(MSPNavigationListener *)self _updateTransportTypeFromCurrentState];
    [(GEOSharedNavState *)self->_state setArrived:[(MSPNavigationListener *)self _currentlyArrivedAtWaypoint]];
    [(MSPNavigationListener *)self _checkStateIsReady];
  }
  else
  {
    [(MSPNavigationListener *)self _initPendingStateIfNeeded];
  }
}

- (void)navigationListener:(id)a3 didUpdateETA:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener ETA update: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = [v5 arrivalTimeInfo];
  int v8 = [v7 firstObject];
  [(MSPNavigationListener *)self _updateCurrentWaypointIndexFromArrivalTimeInfo:v8];

  if ([(MSPNavigationListener *)self _updateArrivalTimeAndDistance:v5]) {
    [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_31];
  }
}

uint64_t __57__MSPNavigationListener_navigationListener_didUpdateETA___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerETAUpdated:a2];
}

- (void)navigationListener:(id)a3 didUpdateLocation:(id)a4 routeMatchedCoordinate:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "MSPNavigationListener location update: %@", (uint8_t *)&v9, 0xCu);
  }

  if ([(MSPNavigationListener *)self _updateLocation:v7 withRouteMatchedCoordinate:a5])
  {
    [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_33];
  }
}

uint64_t __85__MSPNavigationListener_navigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerLocationUpdated:a2];
}

- (void)navigationListener:(id)a3 didUpdateRoute:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 uniqueRouteID];
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener route update: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  if ([(MSPNavigationListener *)self _updateWaypointsIfNeeded:v5])
  {
    [(MSPNavigationListener *)self _clearArrivedState];
    [(GEOSharedNavState *)self->_state setResumed:0];
    [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_35_0];
  }
  [(MSPNavigationListener *)self _updateRoute:v5];
  int v8 = [v5 traffic];
  [(MSPNavigationListener *)self _updateTraffic:v8];

  [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_37];
}

uint64_t __59__MSPNavigationListener_navigationListener_didUpdateRoute___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerWaypointsUpdated:a2];
}

uint64_t __59__MSPNavigationListener_navigationListener_didUpdateRoute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerRouteUpdated:a2];
}

- (void)navigationListener:(id)a3 didUpdateTrafficForCurrentRoute:(id)a4
{
  id v5 = a4;
  BOOL v6 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener traffic update", v8, 2u);
  }

  BOOL v7 = [(MSPNavigationListener *)self _updateTraffic:v5];
  if (v7) {
    [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_39];
  }
}

uint64_t __76__MSPNavigationListener_navigationListener_didUpdateTrafficForCurrentRoute___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerTrafficUpdated:a2];
}

- (void)navigationListener:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 shortDescription];
    int v12 = 138412546;
    double v13 = v9;
    __int16 v14 = 2048;
    unint64_t v15 = a5;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener did arrive at waypoint: %@ legIndex: %lu", (uint8_t *)&v12, 0x16u);
  }
  [(GEOSharedNavState *)self->_state setArrived:1];
  [(GEOSharedNavState *)self->_state setResumed:0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v11 = v10;
  -[GEOSharedNavState setArrivedTimestamp:](self->_state, "setArrivedTimestamp:");
  [(GEOSharedNavState *)self->_state setUpdatedTimestamp:v11];
  [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_41];
}

uint64_t __78__MSPNavigationListener_navigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerArrived:a2];
}

- (void)navigationListener:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = MSPGetSharedTripNavEventsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2048;
    unint64_t v12 = a5;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "MSPNavigationListener did resume navigating from waypoint: %@ legIndex: %lu", (uint8_t *)&v9, 0x16u);
  }

  [(MSPNavigationListener *)self _clearArrivedState];
  [(GEOSharedNavState *)self->_state setResumed:1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[GEOSharedNavState setUpdatedTimestamp:](self->_state, "setUpdatedTimestamp:");
  [(MSPNavigationListener *)self _performDelegateNotificationBlockIfReady:&__block_literal_global_43];
}

uint64_t __90__MSPNavigationListener_navigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationListenerResumed:a2];
}

- (void)_clearArrivedState
{
  [(GEOSharedNavState *)self->_state setArrived:0];
  [(GEOSharedNavState *)self->_state setArrivedTimestamp:0.0];
  state = self->_state;

  [(GEOSharedNavState *)state setHasArrivedTimestamp:0];
}

- (int)_analyticsPipelineTransportModeForGEOTransportType:(int)a3
{
  if (a3 > 6) {
    return 0;
  }
  else {
    return dword_1B886DA68[a3];
  }
}

- (void)_performDelegateNotificationBlockIfReady:(id)a3
{
  id v5 = (void (**)(id, MSPNavigationListener *, id))a3;
  if (self->_postedStateIsReady
    || ([(MSPNavigationListener *)self _checkStateIsReady], self->_postedStateIsReady))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5[2](v5, self, WeakRetained);
  }
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPNavigationListener;
  int v4 = [(MSPNavigationListener *)&v8 description];
  id v5 = [(GEONavigationListener *)self->_navigationListener description];
  BOOL v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return (NSString *)v6;
}

- (MSPNavigationListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPNavigationListenerDelegate *)WeakRetained;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);

  objc_storeStrong((id *)&self->_navigationListener, 0);
}

@end