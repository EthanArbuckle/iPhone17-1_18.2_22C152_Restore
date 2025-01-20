@interface GEONavigationProxy
- (GEOServerFormattedStepStringFormatter)formatter;
- (void)_clearState;
- (void)_closeNavdConnection;
- (void)_openNavdConnection;
- (void)_sendActiveRouteDetailsData;
- (void)_sendCurrentRoadName;
- (void)_sendGuidanceState;
- (void)_sendLocationAndCoordinate;
- (void)_sendNavigationVoiceVolume;
- (void)_sendPositionFromDestination;
- (void)_sendPositionFromManeuver;
- (void)_sendPositionFromSign;
- (void)_sendRideSelections;
- (void)_sendRouteSummary;
- (void)_sendStepIndex;
- (void)_sendStepNameInfo;
- (void)_sendTransitSummary;
- (void)dealloc;
- (void)setActiveRouteDetailsData:(id)a3;
- (void)setAnnouncementStage:(unint64_t)a3;
- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)setClusteredSectionSelectedRideFromRoute:(id)a3;
- (void)setCurrentRoadName:(id)a3;
- (void)setDestinationName:(id)a3 nextDestinationName:(id)a4;
- (void)setDisplayedStepIndex:(unint64_t)a3;
- (void)setETAUpdate:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setGuidancePromptsEnabled:(BOOL)a3;
- (void)setIsConnectedToCarplay:(BOOL)a3;
- (void)setIsNavigatingInLowGuidance:(BOOL)a3;
- (void)setLastLocation:(id)a3 routeMatchedCoordinate:(id)a4;
- (void)setLocationUnreliable:(BOOL)a3;
- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 navigationType:(int)a5 isResumingMultipointRoute:(BOOL)a6;
- (void)setNavigationState:(int)a3;
- (void)setNavigationVoiceVolume:(int)a3;
- (void)setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4;
- (void)setPositionFromDestination:(id)a3;
- (void)setPositionFromManeuver:(id)a3;
- (void)setPositionFromSign:(id)a3;
- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)setRoute:(id)a3;
- (void)setRouteMatch:(id)a3;
- (void)setStepIndex:(unint64_t)a3;
- (void)setStepNameInfo:(id)a3;
- (void)setTrafficForCurrentRoute:(id)a3;
- (void)startWithDestinationName:(id)a3 nextDestinationName:(id)a4;
- (void)stop;
@end

@implementation GEONavigationProxy

- (void)dealloc
{
  [(GEONavigationProxy *)self _closeNavdConnection];
  [(GEONavigationProxy *)self _clearState];
  v3.receiver = self;
  v3.super_class = (Class)GEONavigationProxy;
  [(GEONavigationProxy *)&v3 dealloc];
}

- (void)startWithDestinationName:(id)a3 nextDestinationName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = GEOGetGEONavigationProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138477827;
    id v19 = v6;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "startDestinationWithName: %{private}@", (uint8_t *)&v18, 0xCu);
  }

  [(GEONavigationProxy *)self _clearState];
  v9 = objc_alloc_init(GEONavigationRouteSummary);
  routeSummary = self->_routeSummary;
  self->_routeSummary = v9;

  v11 = objc_alloc_init(GEONavigationRouteTransitSummary);
  transitRouteSummary = self->_transitRouteSummary;
  self->_transitRouteSummary = v11;

  v13 = objc_alloc_init(GEONavigationGuidanceState);
  guidanceState = self->_guidanceState;
  self->_guidanceState = v13;

  v15 = (NSString *)[v6 copy];
  destinationName = self->_destinationName;
  self->_destinationName = v15;

  [(GEONavigationRouteSummary *)self->_routeSummary setDestinationName:self->_destinationName];
  v17 = (void *)[v7 copy];

  [(GEONavigationRouteSummary *)self->_routeSummary setNextDestinationName:v17];
}

- (void)stop
{
  objc_super v3 = GEOGetGEONavigationProxyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "stop", v4, 2u);
  }

  [(GEONavigationProxy *)self _closeNavdConnection];
  [(GEONavigationProxy *)self _clearState];
}

- (void)setRoute:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (GEOComposedRoute *)a3;
  id v6 = GEOGetGEONavigationProxyLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(GEOComposedRoute *)v5 name];
    v8 = [(GEOComposedRoute *)v5 uniqueRouteID];
    int v13 = 138478083;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEFAULT, "setRoute: %{private}@ | %@", (uint8_t *)&v13, 0x16u);
  }
  if (v5 && self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    [(GEONavigationRouteSummary *)self->_routeSummary updateRoute:v5 destinationName:self->_destinationName];
    [(GEONavigationRouteTransitSummary *)self->_transitRouteSummary updateRoute:v5];
    v9 = [(GEOComposedRoute *)v5 rideSelections];
    v10 = (NSArray *)[v9 copy];
    rideSelections = self->_rideSelections;
    self->_rideSelections = v10;

    [(GEONavigationProxy *)self _sendRouteSummary];
    [(GEONavigationProxy *)self _sendTransitSummary];
    v12 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
    [v12 setRoute:v5];
  }
}

- (void)setETAUpdate:(id)a3
{
  p_timeAndDistanceInfo = (GEOArrivalTimeAndDistanceInfo **)a3;
  id v6 = (GEOArrivalTimeAndDistanceInfo *)p_timeAndDistanceInfo;
  if (p_timeAndDistanceInfo)
  {
    p_timeAndDistanceInfo = &self->_timeAndDistanceInfo;
    if (self->_timeAndDistanceInfo != v6)
    {
      v8 = v6;
      objc_storeStrong((id *)p_timeAndDistanceInfo, a3);
      id v7 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
      [v7 setETAUpdate:v8];
    }
  }

  MEMORY[0x1F4181820](p_timeAndDistanceInfo);
}

- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 navigationType:(int)a5 isResumingMultipointRoute:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v11 = GEOGetGEONavigationProxyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a3;
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEFAULT, "setNavigationSessionState: %d", (uint8_t *)v14, 8u);
  }

  if (a3)
  {
    [(GEONavigationProxy *)self _openNavdConnection];
    v12 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
    [v12 setNavigationSessionState:a3 transportType:v8 isResumingMultipointRoute:v6];

    [(GEONavigationGuidanceState *)self->_guidanceState setNavigationType:v7];
    [(GEONavigationGuidanceState *)self->_guidanceState setTrackedTransportType:v8];
  }
  else
  {
    int v13 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
    [v13 setNavigationSessionState:0 transportType:v8 isResumingMultipointRoute:v6];

    [(GEONavigationGuidanceState *)self->_guidanceState setNavigationType:v7];
    [(GEONavigationGuidanceState *)self->_guidanceState setTrackedTransportType:v8];
    [(GEONavigationProxy *)self _closeNavdConnection];
  }
}

- (void)setNavigationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(GEONavigationGuidanceState *)self->_guidanceState navigationState] != a3)
  {
    [(GEONavigationGuidanceState *)self->_guidanceState setNavigationState:v3];
    [(GEONavigationProxy *)self _sendGuidanceState];
  }
}

- (void)setLastLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  uint64_t v7 = (GEOLocation *)a3;
  if (self->_lastLocation != v7)
  {
    uint64_t v8 = v7;
    objc_storeStrong((id *)&self->_lastLocation, a3);
    self->_matchedCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a4;
    [(GEONavigationProxy *)self _sendLocationAndCoordinate];
    uint64_t v7 = v8;
  }
}

- (void)setLocationUnreliable:(BOOL)a3
{
  if (self->_locationUnreliable != a3) {
    self->_locationUnreliable = a3;
  }
}

- (void)setTrafficForCurrentRoute:(id)a3
{
  navdConnection = self->_navdConnection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)navdConnection remoteObjectProxy];
  [v5 updateTrafficForCurrentRoute:v4];
}

- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  navdConnection = self->_navdConnection;
  id v6 = a3;
  id v7 = [(NSXPCConnection *)navdConnection remoteObjectProxy];
  [v7 setArrivedAtWaypoint:v6 endOfLegIndex:a4];
}

- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6 = a3;
  [(GEONavigationProxy *)self _sendRouteSummary];
  id v7 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  [v7 setResumedNavigatingFromWaypoint:v6 endOfLegIndex:a4];
}

- (void)setRouteMatch:(id)a3
{
  id v5 = (GEORouteMatch *)a3;
  routeMatch = self->_routeMatch;
  p_routeMatch = &self->_routeMatch;
  if (routeMatch != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_routeMatch, a3);
    id v5 = v8;
  }
}

- (void)setDestinationName:(id)a3 nextDestinationName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    destinationName = self->_destinationName;
    if (!destinationName || ![(NSString *)destinationName isEqualToString:v13])
    {
      uint64_t v8 = (NSString *)[v13 copy];
      v9 = self->_destinationName;
      self->_destinationName = v8;

      [(GEONavigationRouteSummary *)self->_routeSummary setDestinationName:self->_destinationName];
    }
  }
  v10 = [(GEONavigationRouteSummary *)self->_routeSummary nextDestinationName];
  char v11 = [v10 isEqualToString:v6];

  if ((v11 & 1) == 0)
  {
    v12 = (void *)[v6 copy];
    [(GEONavigationRouteSummary *)self->_routeSummary setNextDestinationName:v12];
  }
}

- (void)setCurrentRoadName:(id)a3
{
  id v4 = (NSString *)a3;
  currentRoadName = self->_currentRoadName;
  if (currentRoadName != v4)
  {
    v9 = v4;
    BOOL v6 = [(NSString *)currentRoadName isEqualToString:v4];
    id v4 = v9;
    if (!v6)
    {
      id v7 = (NSString *)[(NSString *)v9 copy];
      uint64_t v8 = self->_currentRoadName;
      self->_currentRoadName = v7;

      [(GEONavigationProxy *)self _sendCurrentRoadName];
      id v4 = v9;
    }
  }
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  if (self->_guidancePromptsEnabled != a3) {
    self->_guidancePromptsEnabled = a3;
  }
}

- (void)setActiveRouteDetailsData:(id)a3
{
  objc_storeStrong((id *)&self->_activeRouteDetailsData, a3);
  [(GEONavigationProxy *)self _sendActiveRouteDetailsData];

  [(GEONavigationProxy *)self _sendRideSelections];
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
  [(GEONavigationProxy *)self _sendStepIndex];
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  if (self->_displayedStepIndex != a3) {
    self->_displayedStepIndex = a3;
  }
}

- (void)setStepNameInfo:(id)a3
{
  objc_storeStrong((id *)&self->_stepNameInfo, a3);

  [(GEONavigationProxy *)self _sendStepNameInfo];
}

- (void)setClusteredSectionSelectedRideFromRoute:(id)a3
{
  id v4 = [a3 rideSelections];
  id v5 = (NSArray *)[v4 copy];
  rideSelections = self->_rideSelections;
  self->_rideSelections = v5;

  [(GEONavigationProxy *)self _sendRideSelections];
}

- (void)setPositionFromSign:(id)a3
{
  self->_positionFromSign = ($5ED2722C8710615E66118753FC41CC89)a3;
  [(GEONavigationProxy *)self _sendPositionFromSign];
}

- (void)setPositionFromManeuver:(id)a3
{
  self->_positionFromManeuver = ($5ED2722C8710615E66118753FC41CC89)a3;
  [(GEONavigationProxy *)self _sendPositionFromManeuver];
}

- (void)setPositionFromDestination:(id)a3
{
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)a3;
  [(GEONavigationProxy *)self _sendPositionFromDestination];
}

- (void)setAnnouncementStage:(unint64_t)a3
{
  if (self->_announcementStage != a3) {
    self->_announcementStage = a3;
  }
}

- (void)setNextAnnouncementStage:(unint64_t)a3 timeUntilNextAnnouncement:(double)a4
{
  self->_nextAnnouncementStage = a3;
  self->_timeUntilNextAnnouncement = a4;
}

- (void)setNavigationVoiceVolume:(int)a3
{
  self->_navigationVoiceVolume = a3;
  [(GEONavigationProxy *)self _sendNavigationVoiceVolume];
}

- (void)setIsNavigatingInLowGuidance:(BOOL)a3
{
  if (self->_isNavigatingInLowGuidance != a3) {
    self->_isNavigatingInLowGuidance = a3;
  }
}

- (void)setIsConnectedToCarplay:(BOOL)a3
{
  if (self->_isConnectedToCarplay != a3) {
    self->_isConnectedToCarplay = a3;
  }
}

- (void)_clearState
{
  destinationName = self->_destinationName;
  self->_destinationName = 0;

  route = self->_route;
  self->_route = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  routeMatch = self->_routeMatch;
  self->_routeMatch = 0;

  routeSummary = self->_routeSummary;
  self->_routeSummary = 0;

  transitRouteSummary = self->_transitRouteSummary;
  self->_transitRouteSummary = 0;

  guidanceState = self->_guidanceState;
  self->_guidanceState = 0;

  activeRouteDetailsData = self->_activeRouteDetailsData;
  self->_activeRouteDetailsData = 0;

  rideSelections = self->_rideSelections;
  self->_rideSelections = 0;

  self->_locationUnreliable = 0;
  *(int64x2_t *)&self->_stepIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  stepNameInfo = self->_stepNameInfo;
  self->_stepNameInfo = 0;

  self->_positionFromSign = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_positionFromManeuver = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_positionFromDestination = ($5ED2722C8710615E66118753FC41CC89)GEOArrivalTimeAndDistanceInvalid;
  self->_announcementStage = 0;
  self->_nextAnnouncementStage = 0;
  self->_timeUntilNextAnnouncement = 1.79769313e308;
  self->_navigationVoiceVolume = 0;
}

- (void)_openNavdConnection
{
  if (!self->_navdConnection)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navigationServer" options:0];
    navdConnection = self->_navdConnection;
    self->_navdConnection = v3;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED80E708];
    [(NSXPCConnection *)self->_navdConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)self->_navdConnection _setQueue:MEMORY[0x1E4F14428]];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__GEONavigationProxy__openNavdConnection__block_invoke;
    v8[3] = &unk_1E53D7B90;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_navdConnection setInterruptionHandler:v8];
    BOOL v6 = GEOGetGEONavigationProxyLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEFAULT, "Opening XPC connection.", v7, 2u);
    }

    [(NSXPCConnection *)self->_navdConnection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __41__GEONavigationProxy__openNavdConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _sendRouteSummary];
    [v2 _sendTransitSummary];
    [v2 _sendGuidanceState];
    [v2 _sendActiveRouteDetailsData];
    [v2 _sendRideSelections];
    [v2 _sendStepIndex];
    [v2 _sendStepNameInfo];
    [v2 _sendPositionFromDestination];
    [v2 _sendPositionFromSign];
    [v2 _sendPositionFromManeuver];
    [v2 _sendNavigationVoiceVolume];
    id WeakRetained = v2;
  }
}

- (void)_closeNavdConnection
{
  navdConnection = self->_navdConnection;
  if (navdConnection)
  {
    [(NSXPCConnection *)navdConnection setInterruptionHandler:0];
    id v4 = GEOGetGEONavigationProxyLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEFAULT, "Closing XPC connection.", v6, 2u);
    }

    [(NSXPCConnection *)self->_navdConnection invalidate];
    id v5 = self->_navdConnection;
    self->_navdConnection = 0;
  }
}

- (void)_sendRouteSummary
{
  id v4 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  uint64_t v3 = [(GEONavigationRouteSummary *)self->_routeSummary data];
  [v4 setRouteSummaryWithNavigationRouteSummaryData:v3];
}

- (void)_sendTransitSummary
{
  id v4 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  uint64_t v3 = [(GEONavigationRouteTransitSummary *)self->_transitRouteSummary data];
  [v4 setRouteSummaryWithTransitSummaryData:v3];
}

- (void)_sendGuidanceState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOGetGEONavigationProxyLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    guidanceState = self->_guidanceState;
    int v7 = 138477827;
    uint64_t v8 = guidanceState;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "_sendGuidanceState: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  BOOL v6 = [(GEONavigationGuidanceState *)self->_guidanceState data];
  [v5 setRouteSummaryWithGuidanceStateData:v6];
}

- (void)_sendCurrentRoadName
{
  id v3 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  [v3 setCurrentRoadName:self->_currentRoadName];
}

- (void)_sendLocationAndCoordinate
{
  id v3 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  [v3 setLocation:self->_lastLocation routeMatchedCoordinate:*(void *)&self->_matchedCoordinate];
}

- (void)_sendStepIndex
{
  unint64_t stepIndex = self->_stepIndex;
  id v2 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&stepIndex length:8];
  [v2 setRouteSummaryWithStepIndexData:v3];
}

- (void)_sendStepNameInfo
{
  id v4 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [(GEONameInfo *)self->_stepNameInfo data];
  [v4 setRouteSummaryWithStepNameInfoData:v3];
}

- (void)_sendRideSelections
{
  id v4 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_rideSelections requiringSecureCoding:1 error:0];
  [v4 setRouteSummaryWithRideSelectionsData:v3];
}

- (void)_sendActiveRouteDetailsData
{
  id v3 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  [v3 setRouteSummaryWithActiveRouteDetailsData:self->_activeRouteDetailsData];
}

- (void)_sendPositionFromSign
{
  id v2 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  [v2 setRouteSummaryWithPositionFromSignData:v3];
}

- (void)_sendPositionFromManeuver
{
  id v2 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  [v2 setRouteSummaryWithPositionFromManeuverData:v3];
}

- (void)_sendPositionFromDestination
{
  id v2 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  [v2 setRouteSummaryWithPositionFromDestinationData:v3];
}

- (void)_sendNavigationVoiceVolume
{
  id v4 = [(NSXPCConnection *)self->_navdConnection remoteObjectProxy];
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_navigationVoiceVolume length:4];
  [v4 setNavigationVoiceVolumeWithData:v3];
}

- (GEOServerFormattedStepStringFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceInfo, 0);
  objc_storeStrong((id *)&self->_transitRouteSummary, 0);
  objc_storeStrong((id *)&self->_routeSummary, 0);
  objc_storeStrong((id *)&self->_stepNameInfo, 0);
  objc_storeStrong((id *)&self->_rideSelections, 0);
  objc_storeStrong((id *)&self->_activeRouteDetailsData, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);

  objc_storeStrong((id *)&self->_navdConnection, 0);
}

@end