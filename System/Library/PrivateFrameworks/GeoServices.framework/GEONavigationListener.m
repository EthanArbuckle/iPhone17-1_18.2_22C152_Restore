@interface GEONavigationListener
- (BOOL)isResumingMultipointRoute;
- (GEOLocation)lastLocation;
- (GEONavigationListener)init;
- (GEONavigationListener)initWithQueue:(id)a3;
- (GEONavigationListener)initWithQueue:(id)a3 wantsRoutes:(BOOL)a4;
- (GEONavigationListenerDelegate)delegate;
- (NSString)currentRoadName;
- (NSString)description;
- (id)activeRouteDetailsDataUpdatedHandler;
- (id)guidanceStateUpdatedHandler;
- (id)navigationVoiceVolumeUpdatedHandler;
- (id)positionFromDestinationUpdatedHandler;
- (id)positionFromManeuverUpdatedHandler;
- (id)positionFromSignUpdatedHandler;
- (id)rideSelectionsUpdatedHandler;
- (id)routeSummaryUpdatedHandler;
- (id)stepIndexUpdatedHandler;
- (id)transitSummaryUpdatedHandler;
- (uint64_t)_notifyWithNavigationVoiceVolume:(uint64_t)result;
- (uint64_t)_notifyWithPositionFromDestination:(double)a3;
- (uint64_t)_notifyWithPositionFromManeuver:(double)a3;
- (uint64_t)_notifyWithPositionFromSign:(double)a3;
- (uint64_t)_notifyWithStepIndex:(uint64_t)result;
- (unint64_t)navigationState;
- (void)_close;
- (void)_connectToDaemonIfNeeded;
- (void)_notifyWithActiveRouteDetailsData:(uint64_t)a1;
- (void)_notifyWithGuidanceState:(uint64_t)a1;
- (void)_notifyWithRideSelections:(uint64_t)a1;
- (void)_notifyWithRouteSummary:(uint64_t)a1;
- (void)_notifyWithStepNameInfo:(uint64_t)a1;
- (void)_notifyWithTransitSummary:(uint64_t)a1;
- (void)currentRoadNameUpdated:(id)a3;
- (void)dealloc;
- (void)didArriveAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)didResumeNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)didUpdateETA:(id)a3;
- (void)didUpdateLocation:(id)a3 routeMatchedCoordinate:(id)a4;
- (void)didUpdateRoute:(id)a3;
- (void)didUpdateTrafficForCurrentRoute:(id)a3;
- (void)navigationStateChanged:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5;
- (void)navigationUpdatedWithVoiceVolumeData:(id)a3;
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
- (void)routeSummaryUpdatedWithActiveRouteDetailsData:(id)a3;
- (void)routeSummaryUpdatedWithGuidanceStateData:(id)a3;
- (void)routeSummaryUpdatedWithNavigationRouteSummaryData:(id)a3;
- (void)routeSummaryUpdatedWithPositionFromDestinationData:(id)a3;
- (void)routeSummaryUpdatedWithPositionFromManeuverData:(id)a3;
- (void)routeSummaryUpdatedWithPositionFromSignData:(id)a3;
- (void)routeSummaryUpdatedWithRideSelectionData:(id)a3;
- (void)routeSummaryUpdatedWithStepIndexData:(id)a3;
- (void)routeSummaryUpdatedWithStepNameInfoData:(id)a3;
- (void)routeSummaryUpdatedWithTransitSummaryData:(id)a3;
- (void)setActiveRouteDetailsDataUpdatedHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGuidanceStateUpdatedHandler:(id)a3;
- (void)setNavigationVoiceVolumeUpdatedHandler:(id)a3;
- (void)setPositionFromDestinationUpdatedHandler:(id)a3;
- (void)setPositionFromManeuverUpdatedHandler:(id)a3;
- (void)setPositionFromSignUpdatedHandler:(id)a3;
- (void)setRideSelectionsUpdatedHandler:(id)a3;
- (void)setRouteSummaryUpdatedHandler:(id)a3;
- (void)setStepIndexUpdatedHandler:(id)a3;
- (void)setTransitSummaryUpdatedHandler:(id)a3;
@end

@implementation GEONavigationListener

void __46__GEONavigationListener_requestTransitSummary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestTransitSummary];
  }
  else
  {
    -[GEONavigationListener _notifyWithTransitSummary:](v1, 0);
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_notifyWithTransitSummary:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateTransitSummary:v7];
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

- (void)_notifyWithRouteSummary:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateRouteSummary:v7];
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

- (void)_notifyWithGuidanceState:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateGuidanceState:v7];
    }
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

void __45__GEONavigationListener_requestGuidanceState__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestGuidanceState];
  }
  else
  {
    -[GEONavigationListener _notifyWithGuidanceState:](v1, 0);
  }
}

void __44__GEONavigationListener_requestRouteSummary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestRouteSummary];
  }
  else
  {
    -[GEONavigationListener _notifyWithRouteSummary:](v1, 0);
  }
}

- (void)requestTransitSummary
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GEONavigationListener_requestTransitSummary__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestRouteSummary
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GEONavigationListener_requestRouteSummary__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestGuidanceState
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEONavigationListener_requestGuidanceState__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (GEONavigationListener)init
{
  result = (GEONavigationListener *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEONavigationListener)initWithQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEONavigationListener;
  uint64_t v6 = [(GEONavigationListener *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_navigationState = 0;
    v7->_transportType = 4;
    objc_initWeak(&location, v7);
    v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "Initializing navigation listener", buf, 2u);
    }

    if (qword_1EB29FCC0 != -1) {
      dispatch_once(&qword_1EB29FCC0, &__block_literal_global_99);
    }
    if (!_MergedGlobals_248)
    {
      v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = [MEMORY[0x1E4F28F80] processInfo];
        v14 = [v13 processName];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v14;
        _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Process '%@' is trying to use the MNNavigationService SPI without the proper entitlement.", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [self _hasNavigationListenerEntitlement]", buf, 2u);
      }
      goto LABEL_20;
    }
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __39__GEONavigationListener_initWithQueue___block_invoke;
    handler[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch("com.apple.GeoServices.navigation.openListenerConnection", &v7->_navigationStartedToken, v5, handler);
    uint64_t state64 = 0;
    uint32_t state = notify_get_state(v7->_navigationStartedToken, &state64);
    if (state)
    {
      p_super = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = state;
        _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "Error getting navigation started state (%u)", buf, 8u);
      }
    }
    else
    {
      v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = state64;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEFAULT, "Navigation started state: %llu", buf, 0xCu);
      }

      if (!state64) {
        goto LABEL_19;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __39__GEONavigationListener_initWithQueue___block_invoke_8;
      v18[3] = &unk_1E53D79D8;
      v19 = v7;
      dispatch_async(v5, v18);
      p_super = &v19->super;
    }

LABEL_19:
    objc_destroyWeak(&v22);
LABEL_20:
    v16 = v7;
    objc_destroyWeak(&location);
  }

  return v7;
}

void __39__GEONavigationListener_initWithQueue___block_invoke(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Received started navigation notification", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained) {
    -[GEONavigationListener _connectToDaemonIfNeeded]((uint64_t)WeakRetained);
  }
}

void __39__GEONavigationListener_initWithQueue___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    -[GEONavigationListener _connectToDaemonIfNeeded](v1);
  }
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating navigation listener.", buf, 2u);
  }

  notify_cancel(self->_navigationStartedToken);
  notify_cancel(self->_navigationStoppedToken);
  -[GEONavigationListener _close]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)GEONavigationListener;
  [(GEONavigationListener *)&v4 dealloc];
}

- (void)_close
{
  if (a1)
  {
    id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Closing XPC connection.", v4, 2u);
    }

    [*(id *)(a1 + 8) invalidate];
    v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

- (void)requestActiveRouteDetailsData
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__GEONavigationListener_requestActiveRouteDetailsData__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__GEONavigationListener_requestActiveRouteDetailsData__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestActiveRouteDetailsData];
  }
  else
  {
    -[GEONavigationListener _notifyWithActiveRouteDetailsData:](v1, 0);
  }
}

- (void)_notifyWithActiveRouteDetailsData:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateActiveRouteData:v7];
    }
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

- (void)requestStepIndex
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEONavigationListener_requestStepIndex__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__GEONavigationListener_requestStepIndex__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    v3 = [*(id *)(v2 + 8) remoteObjectProxy];
    [v3 requestStepIndex];

    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) remoteObjectProxy];
    [v4 requestStepNameInfo];
  }
  else
  {
    -[GEONavigationListener _notifyWithStepIndex:](v2, 0x7FFFFFFFFFFFFFFFLL);
  }
}

- (uint64_t)_notifyWithStepIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = (id *)(result + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained(v4);
      [v7 navigationListener:v3 didUpdateStepIndex:a2];
    }
    result = *(void *)(v3 + 80);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)requestStepNameInfo
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GEONavigationListener_requestStepNameInfo__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__GEONavigationListener_requestStepNameInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestStepNameInfo];
  }
  else
  {
    -[GEONavigationListener _notifyWithStepNameInfo:](v1, 0);
  }
}

- (void)_notifyWithStepNameInfo:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateStepNameInfo:v6];
    }
  }
}

- (void)requestRideSelections
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__GEONavigationListener_requestRideSelections__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__GEONavigationListener_requestRideSelections__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestRideSelections];
  }
  else
  {
    -[GEONavigationListener _notifyWithRideSelections:](v1, 0);
  }
}

- (void)_notifyWithRideSelections:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 40));
      [v5 navigationListener:a1 didUpdateRideSelections:v7];
    }
    uint64_t v6 = *(void *)(a1 + 88);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

- (void)requestPositionFromSign
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GEONavigationListener_requestPositionFromSign__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __48__GEONavigationListener_requestPositionFromSign__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestPositionFromSign];
  }
  else
  {
    [(GEONavigationListener *)v1 _notifyWithPositionFromSign:-1.0];
  }
}

- (uint64_t)_notifyWithPositionFromSign:(double)a3
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (id *)(result + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v11 = objc_loadWeakRetained(v6);
      objc_msgSend(v11, "navigationListener:didUpdatePositionFromSign:", v5, a2, a3);
    }
    result = *(void *)(v5 + 96);
    if (result)
    {
      id v12 = *(uint64_t (**)(__n128, __n128))(result + 16);
      v9.n128_f64[0] = a2;
      v10.n128_f64[0] = a3;
      return v12(v9, v10);
    }
  }
  return result;
}

- (void)requestPositionFromManeuver
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__GEONavigationListener_requestPositionFromManeuver__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__GEONavigationListener_requestPositionFromManeuver__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestPositionFromManeuver];
  }
  else
  {
    [(GEONavigationListener *)v1 _notifyWithPositionFromManeuver:-1.0];
  }
}

- (uint64_t)_notifyWithPositionFromManeuver:(double)a3
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (id *)(result + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v11 = objc_loadWeakRetained(v6);
      objc_msgSend(v11, "navigationListener:didUpdatePositionFromManeuver:", v5, a2, a3);
    }
    result = *(void *)(v5 + 104);
    if (result)
    {
      id v12 = *(uint64_t (**)(__n128, __n128))(result + 16);
      v9.n128_f64[0] = a2;
      v10.n128_f64[0] = a3;
      return v12(v9, v10);
    }
  }
  return result;
}

- (void)requestPositionFromDestination
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEONavigationListener_requestPositionFromDestination__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__GEONavigationListener_requestPositionFromDestination__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestPositionFromDestination];
  }
  else
  {
    [(GEONavigationListener *)v1 _notifyWithPositionFromDestination:-1.0];
  }
}

- (uint64_t)_notifyWithPositionFromDestination:(double)a3
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (id *)(result + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v11 = objc_loadWeakRetained(v6);
      objc_msgSend(v11, "navigationListener:didUpdatePositionFromDestination:", v5, a2, a3);
    }
    result = *(void *)(v5 + 112);
    if (result)
    {
      id v12 = *(uint64_t (**)(__n128, __n128))(result + 16);
      v9.n128_f64[0] = a2;
      v10.n128_f64[0] = a3;
      return v12(v9, v10);
    }
  }
  return result;
}

- (void)requestNavigationVoiceVolume
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__GEONavigationListener_requestNavigationVoiceVolume__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__GEONavigationListener_requestNavigationVoiceVolume__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    id v2 = [*(id *)(v1 + 8) remoteObjectProxy];
    [v2 requestNavigationVoiceVolume];
  }
  else
  {
    -[GEONavigationListener _notifyWithNavigationVoiceVolume:](v1, 0);
  }
}

- (uint64_t)_notifyWithNavigationVoiceVolume:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    char v4 = (id *)(result + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained(v4);
      [v7 navigationListener:v3 didUpdateNavigationVoiceVolume:a2];
    }
    result = *(void *)(v3 + 120);
    if (result)
    {
      char v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)_connectToDaemonIfNeeded
{
  if (qword_1EB29FCC0 != -1) {
    dispatch_once(&qword_1EB29FCC0, &__block_literal_global_99);
  }
  if (_MergedGlobals_248)
  {
    if (!*(void *)(a1 + 8))
    {
      id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Opening XPC connection.", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, (id)a1);
      uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.navigationListener" options:0];
      char v4 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v3;

      uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED80E3D8];
      [*(id *)(a1 + 8) setRemoteObjectInterface:v5];

      char v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7B8840];
      [*(id *)(a1 + 8) setExportedInterface:v6];

      [*(id *)(a1 + 8) setExportedObject:a1];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke;
      v14[3] = &unk_1E53D7B90;
      objc_copyWeak(&v15, buf);
      [*(id *)(a1 + 8) setInterruptionHandler:v14];
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_103;
      id v12 = &unk_1E53D7B90;
      objc_copyWeak(&v13, buf);
      [*(id *)(a1 + 8) setInvalidationHandler:&v9];
      objc_msgSend(*(id *)(a1 + 8), "resume", v9, v10, v11, v12);
      id v7 = [*(id *)(a1 + 8) remoteObjectProxy];
      [v7 setWantsRoutes:*(unsigned __int8 *)(a1 + 32)];

      char v8 = [*(id *)(a1 + 8) remoteObjectProxy];
      [v8 requestUpdates];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(buf);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [self _hasNavigationListenerEntitlement]", (uint8_t *)buf, 2u);
  }
}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained requestGuidanceState];
    [v4 requestTransitSummary];
    [v4 requestRouteSummary];
    [v4 requestActiveRouteDetailsData];
    [v4 requestStepIndex];
    [v4 requestRideSelections];
    [v4 requestPositionFromSign];
    [v4 requestPositionFromManeuver];
    [v4 requestPositionFromDestination];
    [v4 requestNavigationVoiceVolume];
    v4[169] = 1;
  }
}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_103(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated.", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_104;
    block[3] = &unk_1E53D79D8;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __49__GEONavigationListener__connectToDaemonIfNeeded__block_invoke_104(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)navigationStateChanged:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__GEONavigationListener_navigationStateChanged_transportType_isResumingMultipointRoute___block_invoke;
  block[3] = &unk_1E53E49D0;
  block[4] = self;
  void block[5] = a3;
  int v7 = a4;
  BOOL v8 = a5;
  dispatch_async(queue, block);
}

void __88__GEONavigationListener_navigationStateChanged_transportType_isResumingMultipointRoute___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 169))
  {
    *(unsigned char *)(v1 + 169) = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3 == 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == 1;
    }
    if (*(void *)(v1 + 128) != v4 || *(_DWORD *)(v1 + 136) != *(_DWORD *)(a1 + 48))
    {
      uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
        int v13 = 67109376;
        int v14 = v6;
        __int16 v15 = 1024;
        int v16 = v4;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "Changing navigation state from %d to %d", (uint8_t *)&v13, 0xEu);
      }

      *(void *)(*(void *)(a1 + 32) + 128) = v4;
      if (*(void *)(a1 + 40) == 2)
      {
        char v7 = *(unsigned char *)(a1 + 52);
        if (v7)
        {
          BOOL v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v9 = *(unsigned __int8 *)(a1 + 52);
            int v13 = 67109120;
            int v14 = v9;
            _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Resuming multipoint route: %d", (uint8_t *)&v13, 8u);
          }

          char v7 = *(unsigned char *)(a1 + 52);
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 168) = v7;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
        [v12 navigationListener:*(void *)(a1 + 32) didChangeNavigationState:v4 transportType:*(unsigned int *)(a1 + 48)];
      }
    }
    if (!*(void *)(a1 + 40)) {
      -[GEONavigationListener _close](*(void *)(a1 + 32));
    }
  }
}

- (void)didUpdateLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEONavigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke;
  block[3] = &unk_1E53D9680;
  block[4] = self;
  id v10 = v6;
  $212C09783140BCCD23384160D545CE0D v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __66__GEONavigationListener_didUpdateLocation_routeMatchedCoordinate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 152) = *(void *)(a1 + 48);
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(_DWORD *)(a1 + 48);
    double v5 = *(float *)(a1 + 52);
    int v11 = 138478339;
    uint64_t v12 = v3;
    __int16 v13 = 1025;
    int v14 = v4;
    __int16 v15 = 2049;
    double v16 = v5;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Received location: %{private}@\nReceived Route matched coordinate: [%{private}u, %{private}f]", (uint8_t *)&v11, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v9 = v8;
  if (v7)
  {
    [v8 navigationListener:*(void *)(a1 + 32) didUpdateLocation:*(void *)(a1 + 40) routeMatchedCoordinate:*(void *)(a1 + 48)];
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v9 navigationListener:*(void *)(a1 + 32) didUpdateLocation:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateRoute:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__GEONavigationListener_didUpdateRoute___block_invoke;
    v7[3] = &unk_1E53D8998;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
  }
}

void __40__GEONavigationListener_didUpdateRoute___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) name];
    int v7 = 138477827;
    id v8 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Received route: %{private}@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [v6 navigationListener:*(void *)(a1 + 40) didUpdateRoute:*(void *)(a1 + 32)];
  }
}

- (void)didUpdateTrafficForCurrentRoute:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__GEONavigationListener_didUpdateTrafficForCurrentRoute___block_invoke;
    v7[3] = &unk_1E53D8998;
    id v8 = v4;
    uint64_t v9 = self;
    dispatch_async(queue, v7);
  }
}

void __57__GEONavigationListener_didUpdateTrafficForCurrentRoute___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138477827;
    uint64_t v8 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Received traffic update: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [v6 navigationListener:*(void *)(a1 + 40) didUpdateTrafficForCurrentRoute:*(void *)(a1 + 32)];
  }
}

- (void)didArriveAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__GEONavigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke;
    block[3] = &unk_1E53D9680;
    int v11 = self;
    unint64_t v12 = a4;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

void __59__GEONavigationListener_didArriveAtWaypoint_endOfLegIndex___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    int v8 = 138478083;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Received arrival at waypoint: %{private}@ endOfLegIndex: %lu", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1[5] + 40));
    [v7 navigationListener:a1[5] didArriveAtWaypoint:a1[4] endOfLegIndex:a1[6]];
  }
}

- (void)didResumeNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__GEONavigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke;
    block[3] = &unk_1E53D9680;
    uint64_t v11 = self;
    unint64_t v12 = a4;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

void __71__GEONavigationListener_didResumeNavigatingFromWaypoint_endOfLegIndex___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    int v8 = 138478083;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Received resume navigating from waypoint: %{private}@ endOfLegIndex: %lu", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1[5] + 40));
    [v7 navigationListener:a1[5] didResumeNavigatingFromWaypoint:a1[4] endOfLegIndex:a1[6]];
  }
}

- (void)didUpdateETA:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__GEONavigationListener_didUpdateETA___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__GEONavigationListener_didUpdateETA___block_invoke(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Received ETA update", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v5 navigationListener:*(void *)(a1 + 32) didUpdateETA:*(void *)(a1 + 40)];
  }
}

- (void)routeSummaryUpdatedWithNavigationRouteSummaryData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    id v5 = [[GEONavigationRouteSummary alloc] initWithData:v4];
  }
  else {
    id v5 = 0;
  }
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v12 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "received navigation route summary:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__GEONavigationListener_routeSummaryUpdatedWithNavigationRouteSummaryData___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  __int16 v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __75__GEONavigationListener_routeSummaryUpdatedWithNavigationRouteSummaryData___block_invoke(uint64_t a1)
{
}

- (void)routeSummaryUpdatedWithTransitSummaryData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    id v5 = [[GEONavigationRouteTransitSummary alloc] initWithData:v4];
  }
  else {
    id v5 = 0;
  }
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v12 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "received transit summary:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__GEONavigationListener_routeSummaryUpdatedWithTransitSummaryData___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  __int16 v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __67__GEONavigationListener_routeSummaryUpdatedWithTransitSummaryData___block_invoke(uint64_t a1)
{
}

- (void)routeSummaryUpdatedWithGuidanceStateData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    id v5 = [[GEONavigationGuidanceState alloc] initWithData:v4];
  }
  else {
    id v5 = 0;
  }
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    id v12 = v4;
    __int16 v13 = 2113;
    int v14 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEFAULT, "received guidance state data: %p | state: %{private}@", buf, 0x16u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__GEONavigationListener_routeSummaryUpdatedWithGuidanceStateData___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  __int16 v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __66__GEONavigationListener_routeSummaryUpdatedWithGuidanceStateData___block_invoke(uint64_t a1)
{
}

- (void)routeSummaryUpdatedWithActiveRouteDetailsData:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "received active route details data", buf, 2u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__GEONavigationListener_routeSummaryUpdatedWithActiveRouteDetailsData___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __71__GEONavigationListener_routeSummaryUpdatedWithActiveRouteDetailsData___block_invoke(uint64_t a1)
{
}

- (void)routeSummaryUpdatedWithStepIndexData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  [a3 getBytes:&v7 length:8];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v7;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "received step index: %lu", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GEONavigationListener_routeSummaryUpdatedWithStepIndexData___block_invoke;
  block[3] = &unk_1E53D79B0;
  void block[4] = self;
  void block[5] = v7;
  dispatch_async(queue, block);
}

uint64_t __62__GEONavigationListener_routeSummaryUpdatedWithStepIndexData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithStepIndex:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)routeSummaryUpdatedWithStepNameInfoData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    id v5 = [[GEONameInfo alloc] initWithData:v4];
  }
  else {
    id v5 = 0;
  }
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = v5;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "received step name info:%{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__GEONavigationListener_routeSummaryUpdatedWithStepNameInfoData___block_invoke;
  v9[3] = &unk_1E53D8998;
  v9[4] = self;
  uint64_t v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __65__GEONavigationListener_routeSummaryUpdatedWithStepNameInfoData___block_invoke(uint64_t a1)
{
}

- (void)routeSummaryUpdatedWithPositionFromSignData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0uLL;
  [a3 getBytes:&v9 length:16];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [NSString stringWithFormat:@"{%.3f meters, %.3f seconds}", *((void *)&v9 + 1), (void)v9];
    *(_DWORD *)buf = 138477827;
    uint64_t v11 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "received position from sign: %{private}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__GEONavigationListener_routeSummaryUpdatedWithPositionFromSignData___block_invoke;
  block[3] = &unk_1E53D7FE8;
  void block[4] = self;
  long long v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __69__GEONavigationListener_routeSummaryUpdatedWithPositionFromSignData___block_invoke(uint64_t a1)
{
  return [(GEONavigationListener *)*(void *)(a1 + 32) _notifyWithPositionFromSign:*(double *)(a1 + 48)];
}

- (void)routeSummaryUpdatedWithPositionFromManeuverData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0uLL;
  [a3 getBytes:&v9 length:16];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [NSString stringWithFormat:@"{%.3f meters, %.3f seconds}", *((void *)&v9 + 1), (void)v9];
    *(_DWORD *)buf = 138477827;
    uint64_t v11 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "received position from maneuver: %{private}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__GEONavigationListener_routeSummaryUpdatedWithPositionFromManeuverData___block_invoke;
  block[3] = &unk_1E53D7FE8;
  void block[4] = self;
  long long v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __73__GEONavigationListener_routeSummaryUpdatedWithPositionFromManeuverData___block_invoke(uint64_t a1)
{
  return [(GEONavigationListener *)*(void *)(a1 + 32) _notifyWithPositionFromManeuver:*(double *)(a1 + 48)];
}

- (void)routeSummaryUpdatedWithPositionFromDestinationData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0uLL;
  [a3 getBytes:&v9 length:16];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [NSString stringWithFormat:@"{%.3f meters, %.3f seconds}", *((void *)&v9 + 1), (void)v9];
    *(_DWORD *)buf = 138477827;
    uint64_t v11 = v5;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "received position from destination: %{private}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__GEONavigationListener_routeSummaryUpdatedWithPositionFromDestinationData___block_invoke;
  block[3] = &unk_1E53D7FE8;
  void block[4] = self;
  long long v8 = v9;
  dispatch_async(queue, block);
}

uint64_t __76__GEONavigationListener_routeSummaryUpdatedWithPositionFromDestinationData___block_invoke(uint64_t a1)
{
  return [(GEONavigationListener *)*(void *)(a1 + 32) _notifyWithPositionFromDestination:*(double *)(a1 + 48)];
}

- (void)routeSummaryUpdatedWithRideSelectionData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  long long v8 = objc_msgSend(v5, "setWithObjects:", v7, objc_opt_class(), 0);
  id v17 = 0;
  long long v9 = [v4 unarchivedObjectOfClasses:v8 fromData:v6 error:&v17];

  id v10 = v17;
  if (v10)
  {
    uint64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = v10;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Error decoding ride options: %{private}@", buf, 0xCu);
    }
  }
  uint64_t v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v9;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "received ride options %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__GEONavigationListener_routeSummaryUpdatedWithRideSelectionData___block_invoke;
  block[3] = &unk_1E53D8998;
  void block[4] = self;
  id v16 = v9;
  id v14 = v9;
  dispatch_async(queue, block);
}

void __66__GEONavigationListener_routeSummaryUpdatedWithRideSelectionData___block_invoke(uint64_t a1)
{
}

- (void)navigationUpdatedWithVoiceVolumeData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v8 = 0;
  [a3 getBytes:&v8 length:4];
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = v8;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "received navigation voice volume: %d", buf, 8u);
  }

  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GEONavigationListener_navigationUpdatedWithVoiceVolumeData___block_invoke;
  v6[3] = &unk_1E53D7EA8;
  v6[4] = self;
  int v7 = v8;
  dispatch_async(queue, v6);
}

uint64_t __62__GEONavigationListener_navigationUpdatedWithVoiceVolumeData___block_invoke(uint64_t a1)
{
  return -[GEONavigationListener _notifyWithNavigationVoiceVolume:](*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)currentRoadNameUpdated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "received current road name: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__GEONavigationListener_currentRoadNameUpdated___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __48__GEONavigationListener_currentRoadNameUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = v2;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v7 navigationListener:*(void *)(a1 + 32) didUpdateCurrentRoadName:*(void *)(a1 + 40)];
  }
}

void __58__GEONavigationListener__hasNavigationListenerEntitlement__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    uint64_t v1 = v0;
    CFErrorRef error = 0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.geoservices.navigation_info", &error);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      _MergedGlobals_248 = v5;
      CFRelease(v3);
    }
    else
    {
      id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task", buf, 2u);
      }
    }
    if (error)
    {
      int v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v11 = error;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Error getting entitlement value from security task: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    CFRelease(v1);
  }
  else
  {
    char v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationListener");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Error creating security task", buf, 2u);
    }
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"GEONavigationListener state: %d, startedToken: %d, stoppedToken: %d, interrupted: %d, connection: %@", self->_navigationState, self->_navigationStartedToken, self->_navigationStoppedToken, self->_navigationStateInterrupted, self->_connection];
}

- (GEONavigationListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEONavigationListenerDelegate *)WeakRetained;
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (id)routeSummaryUpdatedHandler
{
  return self->_routeSummaryUpdatedHandler;
}

- (void)setRouteSummaryUpdatedHandler:(id)a3
{
}

- (id)transitSummaryUpdatedHandler
{
  return self->_transitSummaryUpdatedHandler;
}

- (void)setTransitSummaryUpdatedHandler:(id)a3
{
}

- (id)guidanceStateUpdatedHandler
{
  return self->_guidanceStateUpdatedHandler;
}

- (void)setGuidanceStateUpdatedHandler:(id)a3
{
}

- (id)activeRouteDetailsDataUpdatedHandler
{
  return self->_activeRouteDetailsDataUpdatedHandler;
}

- (void)setActiveRouteDetailsDataUpdatedHandler:(id)a3
{
}

- (id)stepIndexUpdatedHandler
{
  return self->_stepIndexUpdatedHandler;
}

- (void)setStepIndexUpdatedHandler:(id)a3
{
}

- (id)rideSelectionsUpdatedHandler
{
  return self->_rideSelectionsUpdatedHandler;
}

- (void)setRideSelectionsUpdatedHandler:(id)a3
{
}

- (id)positionFromSignUpdatedHandler
{
  return self->_positionFromSignUpdatedHandler;
}

- (void)setPositionFromSignUpdatedHandler:(id)a3
{
}

- (id)positionFromManeuverUpdatedHandler
{
  return self->_positionFromManeuverUpdatedHandler;
}

- (void)setPositionFromManeuverUpdatedHandler:(id)a3
{
}

- (id)positionFromDestinationUpdatedHandler
{
  return self->_positionFromDestinationUpdatedHandler;
}

- (void)setPositionFromDestinationUpdatedHandler:(id)a3
{
}

- (id)navigationVoiceVolumeUpdatedHandler
{
  return self->_navigationVoiceVolumeUpdatedHandler;
}

- (void)setNavigationVoiceVolumeUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRoadName, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong(&self->_navigationVoiceVolumeUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromDestinationUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromManeuverUpdatedHandler, 0);
  objc_storeStrong(&self->_positionFromSignUpdatedHandler, 0);
  objc_storeStrong(&self->_rideSelectionsUpdatedHandler, 0);
  objc_storeStrong(&self->_stepIndexUpdatedHandler, 0);
  objc_storeStrong(&self->_activeRouteDetailsDataUpdatedHandler, 0);
  objc_storeStrong(&self->_guidanceStateUpdatedHandler, 0);
  objc_storeStrong(&self->_transitSummaryUpdatedHandler, 0);
  objc_storeStrong(&self->_routeSummaryUpdatedHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (GEONavigationListener)initWithQueue:(id)a3 wantsRoutes:(BOOL)a4
{
  BOOL v5 = [(GEONavigationListener *)self initWithQueue:a3];
  char v6 = v5;
  if (v5)
  {
    v5->_wantsRoutes = a4;
    id v7 = v5;
  }

  return v6;
}

- (void)requestRoute
{
  if (self->_wantsRoutes)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__GEONavigationListener_Private__requestRoute__block_invoke;
    block[3] = &unk_1E53D79D8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __46__GEONavigationListener_Private__requestRoute__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CFBooleanRef v3 = *(void **)(v2 + 8);
  if (v3)
  {
    id v6 = [v3 remoteObjectProxy];
    [v6 requestRoute];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v6 navigationListener:*(void *)(a1 + 32) didUpdateRoute:0];
  }
}

- (void)requestETAUpdate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GEONavigationListener_Private__requestETAUpdate__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __50__GEONavigationListener_Private__requestETAUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CFBooleanRef v3 = *(void **)(v2 + 8);
  if (v3)
  {
    id v6 = [v3 remoteObjectProxy];
    [v6 requestETAUpdate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    [v6 navigationListener:*(void *)(a1 + 32) didUpdateETA:0];
  }
}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

@end