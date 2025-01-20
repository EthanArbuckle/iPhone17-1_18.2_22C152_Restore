@interface GEORouteHypothesizer
+ (BOOL)transitTTLSupportedInCurrentCountry;
+ (id)hypothesizerForPlannedDestination:(id)a3;
- (BOOL)_wontHypothesizeAgain;
- (BOOL)unableToFindRouteForOriginalTransportType;
- (BOOL)wakeForDelay;
- (GEOPlannedDestination)plannedDestination;
- (GEORouteHypothesis)currentHypothesis;
- (GEORouteHypothesizer)initWithPlannedDestination:(id)a3;
- (NSError)currentError;
- (double)willBeginHypothesizingInterval;
- (double)willEndHypothesizingInterval;
- (id)description;
- (unint64_t)state;
- (void)_delayStartingWithBGST;
- (void)_delayStartingWithoutXpc;
- (void)_performDelayedStart;
- (void)cancelDelayDispatchTimer;
- (void)dealloc;
- (void)didPostUINotification:(unint64_t)a3;
- (void)onlyPerformLocalUpdates;
- (void)requestRefresh;
- (void)setDoNotWakeForDelay;
- (void)setState:(unint64_t)a3;
- (void)startHypothesizingWithUpdateHandler:(id)a3;
- (void)stopHypothesizing;
@end

@implementation GEORouteHypothesizer

+ (id)hypothesizerForPlannedDestination:(id)a3
{
  id v3 = a3;
  v4 = [[GEORouteHypothesizer alloc] initWithPlannedDestination:v3];

  return v4;
}

+ (BOOL)transitTTLSupportedInCurrentCountry
{
  v2 = +[GEONavdDefaults sharedInstance];
  char v3 = [v2 transitTTLSupported];

  return v3;
}

- (GEORouteHypothesizer)initWithPlannedDestination:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEORouteHypothesizer;
  v6 = [(GEORouteHypothesizer *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_plannedDestination, a3);
    currentHypothesis = v7->_currentHypothesis;
    v7->_currentHypothesis = 0;

    currentError = v7->_currentError;
    v7->_currentError = 0;

    id updateHandler = v7->_updateHandler;
    v7->_id updateHandler = 0;

    uint64_t v11 = geo_isolater_create();
    isolater = v7->_isolater;
    v7->_isolater = (geo_isolater *)v11;

    v7->_wakeForDelay = 1;
    +[GEORouteHypothesizerDelayer checkin];
  }

  return v7;
}

- (double)willBeginHypothesizingInterval
{
  v2 = +[GEONavdDefaults sharedInstance];
  [v2 hypothesisShouldPersistThresholdInSeconds];
  double v4 = -v3;

  return v4;
}

- (double)willEndHypothesizingInterval
{
  v2 = +[GEONavdDefaults sharedInstance];
  [v2 hypothesisShouldPersistThresholdInSeconds];
  double v4 = v3;

  return v4;
}

- (BOOL)wakeForDelay
{
  return self->_wakeForDelay;
}

- (void)setDoNotWakeForDelay
{
  self->_wakeForDelay = 0;
}

- (BOOL)_wontHypothesizeAgain
{
  if ([(GEORouteHypothesizer *)self state] == 4 || [(GEORouteHypothesizer *)self state] == 2) {
    return 1;
  }
  double v4 = [(GEOPlannedDestination *)self->_plannedDestination expirationDate];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = [v4 earlierDate:v5];
  v7 = [(GEOPlannedDestination *)self->_plannedDestination expirationDate];
  BOOL v3 = v6 == v7;

  return v3;
}

- (void)_performDelayedStart
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    double v4 = [(GEOPlannedDestination *)self->_plannedDestination description];
    int v5 = 138477827;
    v6 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Delay activity fired for %{private}@", (uint8_t *)&v5, 0xCu);
  }
  [(GEORouteHypothesizer *)self startHypothesizingWithUpdateHandler:self->_updateHandler];
}

- (void)_delayStartingWithoutXpc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(GEOPlannedDestination *)self->_plannedDestination arrivalDate];
  [(GEORouteHypothesizer *)self willBeginHypothesizingInterval];
  double v4 = objc_msgSend(v3, "dateByAddingTimeInterval:");
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  double v7 = randomJitterForHypothesisWakeup();

  v8 = +[GEONavdDefaults sharedInstance];
  [v8 maximumRefreshIntervalLeeway];
  uint64_t v10 = v9;

  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v17, &location);
  double v11 = v6 + v7;
  v12 = (OS_dispatch_source *)geo_dispatch_timer_create_on_qos();
  delayDispatchTimer = self->_delayDispatchTimer;
  self->_delayDispatchTimer = v12;

  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  objc_super v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(GEOPlannedDestination *)self->_plannedDestination description];
    *(_DWORD *)buf = 138478339;
    v20 = v15;
    __int16 v21 = 2048;
    double v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Too early to hypothesize. Setting up a dispatch_source timer for  %{private}@ with interval %f and leeway %f", buf, 0x20u);
  }
  dispatch_activate((dispatch_object_t)self->_delayDispatchTimer);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __48__GEORouteHypothesizer__delayStartingWithoutXpc__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performDelayedStart];
  [WeakRetained cancelDelayDispatchTimer];
}

- (void)cancelDelayDispatchTimer
{
  delayDispatchTimer = self->_delayDispatchTimer;
  if (delayDispatchTimer)
  {
    dispatch_source_cancel(delayDispatchTimer);
    double v4 = self->_delayDispatchTimer;
    self->_delayDispatchTimer = 0;
  }
}

- (void)_delayStartingWithBGST
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2A0618 != -1) {
    dispatch_once(&qword_1EB2A0618, &__block_literal_global_183);
  }
  BOOL v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    plannedDestination = self->_plannedDestination;
    int v5 = 138477827;
    double v6 = plannedDestination;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Too early to hypothesize. Adding hypothesis to delayer for destination %{private}@", (uint8_t *)&v5, 0xCu);
  }

  [(id)_MergedGlobals_321 delayStartOfHypothesizer:self];
}

void __46__GEORouteHypothesizer__delayStartingWithBGST__block_invoke()
{
  v0 = objc_alloc_init(GEORouteHypothesizerDelayer);
  v1 = (void *)_MergedGlobals_321;
  _MergedGlobals_321 = (uint64_t)v0;
}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _wontHypothesizeAgain] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(void *)(v2 + 48))
    {
      uint64_t v3 = [*(id *)(a1 + 40) copy];
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(void **)(v4 + 48);
      *(void *)(v4 + 48) = v3;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    double v6 = [*(id *)(v2 + 8) arrivalDate];
    [*(id *)(a1 + 32) willBeginHypothesizingInterval];
    uint64_t v7 = objc_msgSend(v6, "dateByAddingTimeInterval:");
    v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [v7 compare:v8];

    if (v9 == 1)
    {
      uint64_t v10 = *(unsigned char **)(a1 + 32);
      if (v10[72])
      {
        [v10 _delayStartingWithBGST];
      }
      else
      {
        [v10 _delayStartingWithoutXpc];
      }
    }
    else
    {
      double v11 = +[GEONavdManager navdManagerClientIdentifier:*(void *)(a1 + 32)];
      v12 = +[GEONavdManager navdManager];
      [v12 openForClient:v11];

      [*(id *)(a1 + 32) setState:1];
      uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 56);
      *(void *)(v14 + 56) = v13;

      uint64_t v16 = +[GEONavdManager navdManager];
      id v17 = [*(id *)(a1 + 32) plannedDestination];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(v18 + 56);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke_2;
      v20[3] = &unk_1E53ED968;
      v20[4] = v18;
      [v16 startMonitoringDestination:v17 forClient:v11 uuid:v19 handler:v20];
    }
  }
}

void __60__GEORouteHypothesizer_startHypothesizingWithUpdateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = [v4 description];
    int v25 = 138477827;
    v26 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Received callback from GEONavdManager with hypothesis %{private}@", (uint8_t *)&v25, 0xCu);
  }
  if ([*(id *)(a1 + 32) _wontHypothesizeAgain])
  {
    [*(id *)(a1 + 32) stopHypothesizing];
  }
  else
  {
    uint64_t v7 = [v4 error];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    if (v7)
    {
      objc_storeStrong((id *)(v12 + 40), v7);
      uint64_t v13 = [v7 domain];
      uint64_t v14 = GEOErrorDomain();
      int v15 = [v13 isEqualToString:v14];

      if (!v15) {
        goto LABEL_16;
      }
      uint64_t v16 = [v7 code];
      uint64_t v17 = [v7 code];
      if (v16 != -1500 && v17 != -1501) {
        goto LABEL_16;
      }
      uint64_t v18 = [v7 userInfo];
      uint64_t v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      v20 = [v19 domain];
      __int16 v21 = GEOErrorDomain();
      if ([v20 isEqualToString:v21])
      {
        uint64_t v22 = [v19 code];

        if (v22 == -8) {
          *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
        }
      }
      else
      {
      }
      if (v16 == -1500) {
        uint64_t v23 = 3;
      }
      else {
LABEL_16:
      }
        uint64_t v23 = 2;
    }
    else
    {
      objc_storeStrong((id *)(v12 + 32), a2);
      uint64_t v23 = 1;
    }
    [*(id *)(a1 + 32) setState:v23];
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 48);
    if (v24) {
      (*(void (**)(void))(v24 + 16))();
    }
  }
}

- (void)requestRefresh
{
}

void __38__GEORouteHypothesizer_requestRefresh__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1)
  {
    id v4 = +[GEONavdManager navdManagerClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v2 = +[GEONavdManager navdManager];
    uint64_t v3 = [*(id *)(a1 + 32) plannedDestination];
    [v2 requestRefreshForPlannedDestination:v3 client:v4];
  }
}

- (void)stopHypothesizing
{
}

void __41__GEORouteHypothesizer_stopHypothesizing__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    [v2 cancelDelayDispatchTimer];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v3 = (void *)v2[6];
  v2[6] = 0;

  id v9 = +[GEONavdManager navdManagerClientIdentifier:*(void *)(a1 + 32)];
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    id v4 = +[GEONavdManager navdManager];
    int v5 = [*(id *)(a1 + 32) plannedDestination];
    [v4 stopMonitoringDestination:v5 forClient:v9 uuid:*(void *)(*(void *)(a1 + 32) + 56)];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;
  }
  uint64_t v8 = +[GEONavdManager navdManager];
  [v8 closeForClient:v9];

  if ([*(id *)(a1 + 32) state] != 2) {
    [*(id *)(a1 + 32) setState:4];
  }
}

- (void)onlyPerformLocalUpdates
{
}

void __47__GEORouteHypothesizer_onlyPerformLocalUpdates__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1 || objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    id v4 = +[GEONavdManager navdManagerClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v2 = +[GEONavdManager navdManager];
    uint64_t v3 = [*(id *)(a1 + 32) plannedDestination];
    [v2 onlyPerformLocalUpdatesForPlannedDestination:v3 client:v4];
  }
}

- (void)didPostUINotification:(unint64_t)a3
{
}

void __46__GEORouteHypothesizer_didPostUINotification___block_invoke(uint64_t a1)
{
  id v5 = +[GEONavdManager navdManagerClientIdentifier:*(void *)(a1 + 32)];
  uint64_t v2 = +[GEONavdManager navdManager];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) plannedDestination];
  [v2 didPostUINotification:v3 forDestination:v4 fromClient:v5];
}

- (void)dealloc
{
  if (self->_delayDispatchTimer) {
    [(GEORouteHypothesizer *)self cancelDelayDispatchTimer];
  }
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  if ([(GEORouteHypothesizer *)self state] != 4)
  {
    id v4 = +[GEONavdManager navdManagerClientIdentifier:self];
    id v5 = +[GEONavdManager navdManager];
    [v5 closeForClient:v4];
  }
  uuid = self->_uuid;
  self->_uuid = 0;

  isolater = self->_isolater;
  self->_isolater = 0;

  v8.receiver = self;
  v8.super_class = (Class)GEORouteHypothesizer;
  [(GEORouteHypothesizer *)&v8 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(GEORouteHypothesizer *)self plannedDestination];
  unint64_t v5 = [(GEORouteHypothesizer *)self state];
  if (v5 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = off_1E53ED988[v5];
  }
  if (self->_unableToFindRouteForOriginalTransportType) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  objc_super v8 = [(GEORouteHypothesizer *)self currentHypothesis];
  id v9 = [v3 stringWithFormat:@"{\n\tDestination: %@\n\tState: %@\n\tUnableToFindRouteForOriginalTransportType: %@\n\tHypothesis:%@\n}\n", v4, v6, v7, v8];

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (GEORouteHypothesis)currentHypothesis
{
  return self->_currentHypothesis;
}

- (GEOPlannedDestination)plannedDestination
{
  return self->_plannedDestination;
}

- (NSError)currentError
{
  return self->_currentError;
}

- (BOOL)unableToFindRouteForOriginalTransportType
{
  return self->_unableToFindRouteForOriginalTransportType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDispatchTimer, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_currentHypothesis, 0);

  objc_storeStrong((id *)&self->_plannedDestination, 0);
}

@end