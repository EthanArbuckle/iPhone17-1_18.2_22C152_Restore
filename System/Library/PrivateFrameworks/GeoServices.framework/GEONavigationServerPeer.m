@interface GEONavigationServerPeer
- (BOOL)hasEntitlement;
- (BOOL)wantsRoutes;
- (GEONavigationServer)delegate;
- (void)dealloc;
- (void)requestActiveRouteDetailsData;
- (void)requestETAUpdate;
- (void)requestGuidanceState;
- (void)requestNavigationVoiceVolume;
- (void)requestPositionFromDestination;
- (void)requestPositionFromManeuver;
- (void)requestPositionFromSign;
- (void)requestRideSelections;
- (void)requestRoute;
- (void)requestRouteSummary;
- (void)requestStepIndex;
- (void)requestStepNameInfo;
- (void)requestTransitSummary;
- (void)requestUpdates;
- (void)setDelegate:(id)a3;
- (void)setHasEntitlement:(BOOL)a3;
- (void)setWantsRoutes:(BOOL)a3;
@end

@implementation GEONavigationServerPeer

- (void)requestRoute
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement && self->_wantsRoutes)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Route requested from: %@", (uint8_t *)&v5, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _requestRouteWithPeer:self];
  }
}

- (void)requestETAUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement && self->_wantsRoutes)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "ETA requested from: %@", (uint8_t *)&v5, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained _requestETAWithPeer:self];
  }
}

- (void)requestRouteSummary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "route summary requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestRouteSummaryWithPeer:self];
  }
}

- (void)requestTransitSummary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "transit summary requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestTransitSummaryWithPeer:self];
  }
}

- (void)requestGuidanceState
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "guidance state requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestGuidanceStateWithPeer:self];
  }
}

- (void)requestActiveRouteDetailsData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "active route details data requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestActiveRouteDetailsDataWithPeer:self];
  }
}

- (void)requestStepIndex
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "step index requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestStepIndexWithPeer:self];
  }
}

- (void)requestStepNameInfo
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "step name info requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestStepNameInfoWithPeer:self];
  }
}

- (void)requestRideSelections
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "selected ride option requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestRideSelectionsWithPeer:self];
  }
}

- (void)requestPositionFromSign
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "position from sign requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestPositionFromSignWithPeer:self];
  }
}

- (void)requestPositionFromManeuver
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "position from maneuver requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestPositionFromManeuverWithPeer:self];
  }
}

- (void)requestPositionFromDestination
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "position from destination requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestPositionFromDestinationWithPeer:self];
  }
}

- (void)requestNavigationVoiceVolume
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_hasEntitlement)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v6 = 138477827;
      id v7 = WeakRetained;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "navigation voice volume requested from navigation peer and delegate:%{private}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 _requestNavigationVoiceVolumeWithPeer:self];
  }
}

- (void)requestUpdates
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v5 = 138477827;
    id v6 = WeakRetained;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Does nothing but makes the connection alive. Updates requested from navigation peer and delegate:%{private}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setWantsRoutes:(BOOL)a3
{
  self->_wantsRoutes = a3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(GEONavdClientInfo *)self->super._clientInfo description];
    *(_DWORD *)buf = 138477827;
    uint64_t v7 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "deallocating peer:%{private}@", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEONavigationServerPeer;
  [(GEONavigationServerPeer *)&v5 dealloc];
}

- (GEONavigationServer)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEONavigationServer *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasEntitlement
{
  return self->_hasEntitlement;
}

- (void)setHasEntitlement:(BOOL)a3
{
  self->_hasEntitlement = a3;
}

- (BOOL)wantsRoutes
{
  return self->_wantsRoutes;
}

- (void).cxx_destruct
{
}

@end