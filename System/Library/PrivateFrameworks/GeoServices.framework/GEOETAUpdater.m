@interface GEOETAUpdater
- (BOOL)_shouldStartConditionalETARequest;
- (BOOL)allowRequests;
- (BOOL)requestInProgress;
- (BOOL)shouldUpdateTrafficOnRoute;
- (BOOL)shouldUseConditionalRequest;
- (GEOApplicationAuditToken)auditToken;
- (GEOComposedRoute)route;
- (GEOETAUpdater)init;
- (GEOETAUpdater)initWithRoute:(id)a3 waypoints:(id)a4 routeAttributes:(id)a5;
- (GEOETAUpdaterDelegate)delegate;
- (GEOLocation)userLocation;
- (GEORouteAttributes)routeAttributes;
- (GEORouteMatch)routeMatch;
- (NSArray)waypoints;
- (NSData)directionsResponseID;
- (NSString)requestingAppIdentifier;
- (double)_calculateNextTransitionTime;
- (double)debugTimeWindowDuration;
- (double)requestInterval;
- (id)_updateOrCreateRequest:(id)a3;
- (id)currentStep;
- (id)destination;
- (unint64_t)maxAlternateRoutesCount;
- (void)_addRouteAttributesToRequest:(id)a3 completion:(id)a4;
- (void)_clearTimer;
- (void)_continueUpdateRequests;
- (void)_sendRequest:(id)a3;
- (void)_startConditionalConnectionETARequest;
- (void)_startStateWaitingForBestTimeStart:(id)a3;
- (void)_trafficRequest:(id)a3 finished:(id)a4;
- (void)_updateRequest:(id)a3;
- (void)cancelRequest;
- (void)dealloc;
- (void)requestUpdate;
- (void)reset;
- (void)setAllowRequests:(BOOL)a3;
- (void)setAuditToken:(id)a3;
- (void)setDebugTimeWindowDuration:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionsResponseID:(id)a3;
- (void)setMaxAlternateRoutesCount:(unint64_t)a3;
- (void)setRequestInterval:(double)a3;
- (void)setRequestingAppIdentifier:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRouteMatch:(id)a3;
- (void)setShouldUpdateTrafficOnRoute:(BOOL)a3;
- (void)setShouldUseConditionalRequest:(BOOL)a3;
- (void)setUserLocation:(id)a3;
- (void)setWaypoints:(id)a3;
- (void)startUpdateRequests;
- (void)stopUpdateRequests;
@end

@implementation GEOETAUpdater

- (GEOETAUpdater)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOETAUpdater;
  v2 = [(GEOETAUpdater *)&v8 init];
  if (v2)
  {
    uint64_t v3 = GEOApplicationIdentifierOrProcessName();
    requestingAppIdentifier = v2->_requestingAppIdentifier;
    v2->_requestingAppIdentifier = (NSString *)v3;

    *(_WORD *)&v2->_allowRequests = 257;
    v2->_shouldUpdateTrafficOnRoute = 1;
    v2->_requestInterval = 270.0;
    v2->_maxAlternateRoutesCount = 0;
    v5 = objc_alloc_init(GEOCommonOptions);
    commonOptions = v2->_commonOptions;
    v2->_commonOptions = v5;

    [(GEOCommonOptions *)v2->_commonOptions setIncludeTravelTimeAggressive:1];
    [(GEOCommonOptions *)v2->_commonOptions setIncludeTravelTimeConservative:1];
    [(GEOCommonOptions *)v2->_commonOptions setIncludeTravelTimeEstimate:1];
    [(GEOCommonOptions *)v2->_commonOptions setExcludeGuidance:1];
  }
  return v2;
}

- (GEOETAUpdater)initWithRoute:(id)a3 waypoints:(id)a4 routeAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(GEOETAUpdater *)self init];
  v12 = v11;
  if (v11)
  {
    [(GEOETAUpdater *)v11 setRoute:v8];
    [(GEOETAUpdater *)v12 setWaypoints:v9];
    [(GEOETAUpdater *)v12 setRouteAttributes:v10];
  }

  return v12;
}

- (void)dealloc
{
  [(GEOETAUpdater *)self _clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)GEOETAUpdater;
  [(GEOETAUpdater *)&v3 dealloc];
}

- (BOOL)requestInProgress
{
  return self->_currentETARequest != 0;
}

- (void)reset
{
  objc_super v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "resetting", v4, 2u);
  }

  [(GEOETAUpdater *)self cancelRequest];
  [(GEOETAUpdater *)self _clearTimer];
  [(GEOETAUpdater *)self _continueUpdateRequests];
}

- (void)_clearTimer
{
  objc_super v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Removing timer", v5, 2u);
  }

  [(NSTimer *)self->_etaIdleTimer invalidate];
  etaIdleTimer = self->_etaIdleTimer;
  self->_etaIdleTimer = 0;
}

- (void)requestUpdate
{
  if (!self->_currentETARequest)
  {
    id v3 = [(GEOETAUpdater *)self _updateOrCreateRequest:0];
    [(GEOETAUpdater *)self _sendRequest:v3];
  }
}

- (void)cancelRequest
{
  if (self->_currentETARequest)
  {
    id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Clearing current ETA request", v7, 2u);
    }

    v4 = +[GEOETARequester sharedRequester];
    [v4 cancelRequest:self->_currentETARequest];

    currentETARequest = self->_currentETARequest;
    self->_currentETARequest = 0;

    etaRoute = self->_etaRoute;
    self->_etaRoute = 0;
  }
}

- (void)startUpdateRequests
{
  self->_etaState = 1;
  [(GEOETAUpdater *)self _continueUpdateRequests];
}

- (void)stopUpdateRequests
{
  id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Stopping update requests", v4, 2u);
  }

  self->_etaState = 0;
  [(GEOETAUpdater *)self reset];
}

- (void)setRoute:(id)a3
{
  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    routeMatch = self->_routeMatch;
    self->_routeMatch = 0;

    v5 = v7;
  }
}

- (id)destination
{
  return [(NSArray *)self->_waypoints lastObject];
}

- (void)_updateRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setRequestingAppId:self->_requestingAppIdentifier];
  v5 = +[GEOUserSession sharedInstance];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __32__GEOETAUpdater__updateRequest___block_invoke;
  v29[3] = &unk_1E53DC588;
  id v6 = v4;
  id v30 = v6;
  [v5 shortSessionValues:v29];

  [v6 setCurrentUserLocation:self->_userLocation];
  [v6 setDirectionsResponseID:self->_directionsResponseID];
  [v6 setCommonOptions:self->_commonOptions];
  [v6 setMaxAlternateRouteCount:LODWORD(self->_maxAlternateRoutesCount)];
  v7 = +[GEOExperimentConfiguration sharedConfiguration];
  id v8 = [v7 _mapsAbClientMetadata];
  id v9 = [v8 clientDatasetMetadata];
  [v6 setAbClientMetadata:v9];

  if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1E9111D68))
  {
    [v6 clearWaypointTypeds];
    id v10 = [(GEOETAUpdater *)self waypoints];
    v11 = [(GEOETAUpdater *)self waypoints];
    v12 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v17), "geoWaypointTyped", (void)v25);
          [v6 addWaypointTyped:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v15);
    }
    v19 = v13;
  }
  else
  {
    [v6 clearDestinationWaypointTypeds];
    v19 = [(GEOETAUpdater *)self destination];
    id v13 = [v19 geoWaypointTyped];
    [v6 addDestinationWaypointTyped:v13];
  }

  v20 = +[GEOPlatform sharedPlatform];
  v21 = [v20 clientCapabilities];
  [v6 setClientCapabilities:v21];

  v22 = [v6 clientCapabilities];
  [v22 updateWithETATrafficUpdateRequest:v6];

  v23 = objc_alloc_init(GEOComposedETARoute);
  etaRoute = self->_etaRoute;
  self->_etaRoute = v23;

  [(GEOComposedETARoute *)self->_etaRoute prepareForRequest:v6 route:self->_route routeMatch:self->_routeMatch targetLegIndex:0x7FFFFFFFFFFFFFFFLL state:0];
}

void __32__GEOETAUpdater__updateRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", a2, a3);
  [*(id *)(a1 + 32) setSessionRelativeTimestamp:a6];
  if (a10)
  {
    uint64_t v15 = objc_alloc_init(GEOPrivacyMetadata);
    [*(id *)(a1 + 32) setPrivacyMetadata:v15];

    uint64_t v16 = [*(id *)(a1 + 32) privacyMetadata];
    [v16 setIsUnderageAccount:a8];

    id v17 = [*(id *)(a1 + 32) privacyMetadata];
    [v17 setIsManagedAccount:a9];
  }
}

- (void)_addRouteAttributesToRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__GEOETAUpdater__addRouteAttributesToRequest_completion___block_invoke;
    v10[3] = &unk_1E53E5A30;
    id v11 = v6;
    id v12 = v8;
    [(GEORouteAttributes *)routeAttributes buildRouteAttributesForETAUpdateRequest:v11 queue:MEMORY[0x1E4F14428] result:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __57__GEOETAUpdater__addRouteAttributesToRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v7 = a3;
  [v5 setRouteAttributes:a2];
  id v6 = v7;
  if (a2) {
    id v6 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6);
}

- (void)setRouteMatch:(id)a3
{
}

- (void)_startStateWaitingForBestTimeStart:(id)a3
{
  [(GEOETAUpdater *)self _clearTimer];
  if (self->_etaState)
  {
    [(GEOETAUpdater *)self _currentTime];
    self->_lastETARequestTime = v4;
    if (self->_allowRequests)
    {
      if ([(GEOETAUpdater *)self _shouldStartConditionalETARequest])
      {
        self->_etaState = 2;
        [(GEOETAUpdater *)self _startConditionalConnectionETARequest];
      }
      else
      {
        self->_etaState = 3;
        id v5 = [(GEOETAUpdater *)self _updateOrCreateRequest:0];
        [(GEOETAUpdater *)self _sendRequest:v5];
      }
    }
    else
    {
      [(GEOETAUpdater *)self _continueUpdateRequests];
    }
  }
}

- (void)_startConditionalConnectionETARequest
{
  id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Queue conditional connection ETA Request", buf, 2u);
  }

  double v4 = objc_alloc_init(GEOETATrafficUpdateRequest);
  objc_storeStrong((id *)&self->_currentETARequest, v4);
  [(GEOETAUpdater *)self _updateRequest:v4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke;
  v22[3] = &unk_1E53D9070;
  v22[4] = self;
  id v5 = (void *)MEMORY[0x18C120660](v22);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_17;
  v19[3] = &unk_1E53E5A80;
  v19[4] = self;
  id v6 = v4;
  v20 = v6;
  id v21 = v5;
  id v7 = v5;
  id v8 = (void *)MEMORY[0x18C120660](v19);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_3;
  v17[3] = &unk_1E53E5AA8;
  v17[4] = self;
  v18 = v6;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x18C120660](v17);
  double debugTimeWindowDuration = self->_debugTimeWindowDuration;
  if (debugTimeWindowDuration == 0.0) {
    double debugTimeWindowDuration = 420.0 - self->_requestInterval;
  }
  id v12 = [[GEODataConditionalConnectionProperties alloc] initWithWorkload:1000 timeWindowDuration:debugTimeWindowDuration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained etaUpdater:self willSendETATrafficUpdateRequest:self->_currentETARequest];

  uint64_t v14 = +[GEOETARequester sharedRequester];
  currentETARequest = self->_currentETARequest;
  uint64_t v16 = [(GEOETAUpdater *)self auditToken];
  [v14 startRequest:currentETARequest connectionProperties:v12 auditToken:v16 throttleToken:0 callbackQueue:MEMORY[0x1E4F14428] willSendRequest:v8 finished:v10 networkActivity:0 error:v7];
}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Could not complete ETA request %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;

  [*(id *)(a1 + 32) _currentTime];
  *(void *)(*(void *)(a1 + 32) + 112) = v9;
  [*(id *)(a1 + 32) _continueUpdateRequests];
}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 80);
    *(_DWORD *)buf = 67109120;
    int v17 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Send conditional connection ETA Request, ETA state: %i", buf, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 72);
  *(void *)(v8 + 72) = 0;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_18;
  v12[3] = &unk_1E53DE848;
  int v10 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  id v14 = v3;
  id v15 = *(id *)(a1 + 48);
  id v11 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80))
  {
    *(void *)(v2 + 80) = 3;
    [*(id *)(a1 + 32) _currentTime];
    *(void *)(*(void *)(a1 + 32) + 112) = v3;
    double v4 = [*(id *)(a1 + 32) _updateOrCreateRequest:*(void *)(a1 + 40)];
    uint64_t v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_2;
    v8[3] = &unk_1E53E5A58;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v9 = v4;
    id v6 = v4;
    [v5 _addRouteAttributesToRequest:v6 completion:v8];
  }
  else
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(v4 + 16);
  }
  v5();
}

uint64_t __54__GEOETAUpdater__startConditionalConnectionETARequest__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _trafficRequest:*(void *)(a1 + 40) finished:a2];
}

- (id)_updateOrCreateRequest:(id)a3
{
  uint64_t v4 = (GEOETATrafficUpdateRequest *)a3;
  if (!v4) {
    uint64_t v4 = objc_alloc_init(GEOETATrafficUpdateRequest);
  }
  objc_storeStrong((id *)&self->_currentETARequest, v4);
  [(GEOETAUpdater *)self _updateRequest:v4];

  return v4;
}

- (void)_sendRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[GEOExperimentConfiguration sharedConfiguration];
  id v6 = [v5 _mapsAbClientMetadata];
  uint64_t v7 = [v6 clientDatasetMetadata];
  [v4 setAbClientMetadata:v7];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __30__GEOETAUpdater__sendRequest___block_invoke;
  v21[3] = &unk_1E53E5AA8;
  v21[4] = self;
  id v8 = v4;
  id v22 = v8;
  id v9 = (void *)MEMORY[0x18C120660](v21);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __30__GEOETAUpdater__sendRequest___block_invoke_2;
  v20[3] = &unk_1E53D9070;
  v20[4] = self;
  id v10 = (void *)MEMORY[0x18C120660](v20);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__GEOETAUpdater__sendRequest___block_invoke_25;
  v14[3] = &unk_1E53E5AD0;
  id v11 = v10;
  id v16 = v11;
  objc_copyWeak(&v18, &location);
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v17 = v13;
  [(GEOETAUpdater *)self _addRouteAttributesToRequest:v12 completion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __30__GEOETAUpdater__sendRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _trafficRequest:*(void *)(a1 + 40) finished:a2];
}

void __30__GEOETAUpdater__sendRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "Could not complete ETA request %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained etaUpdater:*(void *)(a1 + 32) receivedError:v3];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v10 etaUpdaterRequestCompleted:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) _continueUpdateRequests];
}

void __30__GEOETAUpdater__sendRequest___block_invoke_25(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      uint64_t v5 = [WeakRetained delegate];
      [v5 etaUpdater:v9 willSendETATrafficUpdateRequest:*(void *)(a1 + 32)];

      +[GEONavdPowerLogManager _powerLogWithEventName:@"SendingETARequest"];
      id v6 = +[GEOETARequester sharedRequester];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v9 auditToken];
      [v6 startRequest:v7 connectionProperties:0 auditToken:v8 throttleToken:0 callbackQueue:MEMORY[0x1E4F14428] willSendRequest:0 finished:*(void *)(a1 + 48) networkActivity:0 error:*(void *)(a1 + 40)];

      id WeakRetained = v9;
    }
  }
}

- (void)_trafficRequest:(id)a3 finished:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109120;
    v15[1] = [v5 status];
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Response ETARouteStatus : %i", (uint8_t *)v15, 8u);
  }

  currentETARequest = self->_currentETARequest;
  self->_currentETARequest = 0;

  if ([v5 status]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = [(GEOComposedETARoute *)self->_etaRoute updateForResponse:v5 route:self->_route];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained etaUpdater:self receivedETATrafficUpdateResponse:v5 etaRoute:self->_etaRoute];

  etaRoute = self->_etaRoute;
  self->_etaRoute = 0;

  if (v8)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 etaUpdaterUpdatedETA:self];
  }
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 etaUpdaterRequestCompleted:self];
  }
  [(GEOETAUpdater *)self _continueUpdateRequests];
}

- (double)_calculateNextTransitionTime
{
  double requestInterval = self->_requestInterval;
  id v4 = [(GEOComposedRoute *)self->_route routeAttributes];
  int v5 = [v4 hasTimepoint];

  double v6 = 0.0;
  if (v5)
  {
    double v14 = 0.0;
    uint64_t v15 = 0;
    uint64_t v7 = [(GEOComposedRoute *)self->_route routeAttributes];
    BOOL v8 = v7;
    if (v7)
    {
      [v7 timepoint];
    }
    else
    {
      uint64_t v13 = 0;
      double v14 = 0.0;
      uint64_t v15 = 0;
    }

    [(GEOETAUpdater *)self _currentTime];
    double v6 = v14 - v9;
  }
  if (v6 >= requestInterval + 72000.0)
  {
    id v11 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Delaying ETA requests until near to departure..", (uint8_t *)&v13, 2u);
    }

    return v6 + -72000.0;
  }
  else if (self->_lastETARequestTime > 0.0)
  {
    [(GEOETAUpdater *)self _currentTime];
    return requestInterval - (v10 - self->_lastETARequestTime);
  }
  return requestInterval;
}

- (void)_continueUpdateRequests
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_etaState)
  {
    [(GEOETAUpdater *)self _clearTimer];
    [(GEOETAUpdater *)self _calculateNextTransitionTime];
    double v4 = v3;
    int v5 = GEOFindOrCreateLog("com.apple.GeoServices", "ETAUpdates");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134217984;
      double v9 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Starting Idle State transition time %f", (uint8_t *)&v8, 0xCu);
    }

    double v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__startStateWaitingForBestTimeStart_ selector:0 userInfo:0 repeats:v4];
    etaIdleTimer = self->_etaIdleTimer;
    self->_etaIdleTimer = v6;
  }
}

- (BOOL)_shouldStartConditionalETARequest
{
  return self->_shouldUseConditionalRequest;
}

- (id)currentStep
{
  routeMatch = self->_routeMatch;
  if (routeMatch)
  {
    routeMatch = -[GEOComposedRoute stepAtIndex:](self->_route, "stepAtIndex:", [routeMatch stepIndex]);
  }

  return routeMatch;
}

- (GEOETAUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOETAUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)requestingAppIdentifier
{
  return self->_requestingAppIdentifier;
}

- (void)setRequestingAppIdentifier:(id)a3
{
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEOLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (NSData)directionsResponseID
{
  return self->_directionsResponseID;
}

- (void)setDirectionsResponseID:(id)a3
{
}

- (BOOL)allowRequests
{
  return self->_allowRequests;
}

- (void)setAllowRequests:(BOOL)a3
{
  self->_allowRequests = a3;
}

- (BOOL)shouldUseConditionalRequest
{
  return self->_shouldUseConditionalRequest;
}

- (void)setShouldUseConditionalRequest:(BOOL)a3
{
  self->_shouldUseConditionalRequest = a3;
}

- (BOOL)shouldUpdateTrafficOnRoute
{
  return self->_shouldUpdateTrafficOnRoute;
}

- (void)setShouldUpdateTrafficOnRoute:(BOOL)a3
{
  self->_shouldUpdateTrafficOnRoute = a3;
}

- (double)requestInterval
{
  return self->_requestInterval;
}

- (void)setRequestInterval:(double)a3
{
  self->_double requestInterval = a3;
}

- (double)debugTimeWindowDuration
{
  return self->_debugTimeWindowDuration;
}

- (void)setDebugTimeWindowDuration:(double)a3
{
  self->_double debugTimeWindowDuration = a3;
}

- (unint64_t)maxAlternateRoutesCount
{
  return self->_maxAlternateRoutesCount;
}

- (void)setMaxAlternateRoutesCount:(unint64_t)a3
{
  self->_maxAlternateRoutesCount = a3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsResponseID, 0);
  objc_storeStrong((id *)&self->_etaIdleTimer, 0);
  objc_storeStrong((id *)&self->_etaRoute, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_currentETARequest, 0);
  objc_storeStrong((id *)&self->_requestingAppIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end