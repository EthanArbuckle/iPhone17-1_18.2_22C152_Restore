@interface GEOTransitRouteUpdateRequester
+ (id)sharedInstance;
- (NSHashTable)updaters;
- (NSMutableSet)processedRequests;
- (double)initialDelay;
- (double)requestInterval;
- (id)_requestsForUpdaters:(id)a3;
- (id)_uuidsForRequests:(id)a3;
- (id)initPrivate;
- (void)_cancelAllRequestsIfNeeded;
- (void)_cancelUpdateTimer;
- (void)_handleResponse:(id)a3 andError:(id)a4 forRequest:(id)a5;
- (void)_processRequests;
- (void)_purgeAllObjects;
- (void)_removeRequestsIfApplicable:(id)a3;
- (void)_scheduleUpdateTimerWithInterval:(double)a3;
- (void)_sendRequestForRequests:(id)a3;
- (void)registerRouteUpdater:(id)a3;
- (void)setInitialDelay:(double)a3;
- (void)setRequestInterval:(double)a3;
- (void)unregisterRouteUpdater:(id)a3;
@end

@implementation GEOTransitRouteUpdateRequester

+ (id)sharedInstance
{
  if (qword_1EB29F638 != -1) {
    dispatch_once(&qword_1EB29F638, &__block_literal_global_25);
  }
  v2 = (void *)_MergedGlobals_195;

  return v2;
}

void __48__GEOTransitRouteUpdateRequester_sharedInstance__block_invoke()
{
  id v0 = [[GEOTransitRouteUpdateRequester alloc] initPrivate];
  v1 = (void *)_MergedGlobals_195;
  _MergedGlobals_195 = (uint64_t)v0;
}

- (id)initPrivate
{
  v12.receiver = self;
  v12.super_class = (Class)GEOTransitRouteUpdateRequester;
  v2 = [(GEOTransitRouteUpdateRequester *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_updatersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    updaters = v3->_updaters;
    v3->_updaters = (NSHashTable *)v4;

    v3->_processedRequestsLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
    processedRequests = v3->_processedRequests;
    v3->_processedRequests = (NSMutableSet *)v6;

    v3->_inflightRequestsLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:5];
    inflightRequests = v3->_inflightRequests;
    v3->_inflightRequests = (NSMutableSet *)v8;

    *(_OWORD *)&v3->_maxRetries = xmmword_18A62D260;
    v10 = v3;
  }

  return v3;
}

- (double)initialDelay
{
  double result = self->_initialDelay;
  if (fabs(result) < 0.000001)
  {
    double result = GEOConfigGetDouble(GeoServicesConfig_RealtimeTransitInitialUpdateDelay, (uint64_t)off_1E9114968);
    self->_initialDelay = result;
    if (fabs(result) < 0.000001)
    {
      self->_initialDelay = 15.0;
      return 15.0;
    }
  }
  return result;
}

- (double)requestInterval
{
  double result = self->_requestInterval;
  if (fabs(result) < 0.000001)
  {
    [(GEOTransitRouteUpdateRequester *)self initialDelay];
    self->_requestInterval = result;
  }
  return result;
}

- (void)_purgeAllObjects
{
  [(GEOTransitRouteUpdateRequester *)self _cancelAllRequestsIfNeeded];
  [(GEOTransitRouteUpdateRequester *)self _cancelUpdateTimer];
  os_unfair_lock_lock(&self->_updatersLock);
  [(NSHashTable *)self->_updaters removeAllObjects];
  os_unfair_lock_unlock(&self->_updatersLock);
  os_unfair_lock_lock(&self->_processedRequestsLock);
  [(NSMutableSet *)self->_processedRequests removeAllObjects];
  os_unfair_lock_unlock(&self->_processedRequestsLock);
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  [(NSMutableSet *)self->_inflightRequests removeAllObjects];

  os_unfair_lock_unlock(&self->_inflightRequestsLock);
}

- (void)_cancelAllRequestsIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_inflightRequestsLock = &self->_inflightRequestsLock;
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_inflightRequests copy];
  [(NSMutableSet *)self->_inflightRequests removeAllObjects];
  os_unfair_lock_unlock(p_inflightRequestsLock);
  self->_requestInterval = 0.0;
  if ([v4 count])
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [v4 count];
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "cancelling %lu requests", buf, 0xCu);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          objc_super v12 = +[GEOTransitUpdateRequester sharedRequester];
          [v12 cancelTransitRouteUpdateRequest:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)registerRouteUpdater:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138477827;
      id v7 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "registering Updater %{private}@", (uint8_t *)&v6, 0xCu);
    }

    [(GEOTransitRouteUpdateRequester *)self _cancelAllRequestsIfNeeded];
    os_unfair_lock_lock(&self->_updatersLock);
    [(NSHashTable *)self->_updaters addObject:v4];
    os_unfair_lock_unlock(&self->_updatersLock);
    if ([v4 isActive])
    {
      [(GEOTransitRouteUpdateRequester *)self requestInterval];
      -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](self, "_scheduleUpdateTimerWithInterval:");
    }
  }
}

- (void)unregisterRouteUpdater:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138477827;
      id v8 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "unregistering Updater %{private}@", (uint8_t *)&v7, 0xCu);
    }

    int v6 = [v4 requests];
    [(GEOTransitRouteUpdateRequester *)self _removeRequestsIfApplicable:v6];

    os_unfair_lock_lock(&self->_updatersLock);
    [(NSHashTable *)self->_updaters removeObject:v4];
    os_unfair_lock_unlock(&self->_updatersLock);
  }
}

- (void)_scheduleUpdateTimerWithInterval:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (self->_updateTimer)
    {
      v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = [(NSTimer *)self->_updateTimer fireDate];
        *(_DWORD *)buf = 138412290;
        double v19 = *(double *)&v6;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "cancelling updated scheduled for %@", buf, 0xCu);
      }
      [(NSTimer *)self->_updateTimer invalidate];
      updateTimer = self->_updateTimer;
      self->_updateTimer = 0;
    }
    int BOOL = GEOConfigGetBOOL(GeoServicesConfig_SuppressTransitRealtimeUpdates, (uint64_t)off_1E9114DA8);
    uint64_t v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (BOOL)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "suppressing timer due to debug setting", buf, 2u);
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
        *(_DWORD *)buf = 134218242;
        double v19 = a3;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "scheduling update in %#.1lfs at %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      objc_super v12 = (void *)MEMORY[0x1E4F1CB00];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_8;
      v15[3] = &unk_1E53DA300;
      objc_copyWeak(&v16, (id *)buf);
      long long v13 = [v12 scheduledTimerWithTimeInterval:0 repeats:v15 block:a3];
      long long v14 = self->_updateTimer;
      self->_updateTimer = v13;

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke;
    block[3] = &unk_1E53D79B0;
    block[4] = self;
    *(double *)&block[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleUpdateTimerWithInterval:*(double *)(a1 + 40)];
}

void __67__GEOTransitRouteUpdateRequester__scheduleUpdateTimerWithInterval___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && WeakRetained[7] == v3)
  {
    int v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8[0] = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "performing scheduled update", (uint8_t *)v8, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)v5 + 6);
    [v5[4] removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)v5 + 6);
    id v7 = v5[7];
    v5[7] = 0;

    [v5 _processRequests];
  }
}

- (void)_cancelUpdateTimer
{
  if (self->_updateTimer)
  {
    id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "cancelling scheduled update", v5, 2u);
    }

    [(NSTimer *)self->_updateTimer invalidate];
    updateTimer = self->_updateTimer;
    self->_updateTimer = 0;
  }
}

- (void)_processRequests
{
  [(GEOTransitRouteUpdateRequester *)self _cancelUpdateTimer];
  id v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "processing current requests", buf, 2u);
  }

  os_unfair_lock_lock(&self->_updatersLock);
  id v4 = [(NSHashTable *)self->_updaters allObjects];
  v5 = [(GEOTransitRouteUpdateRequester *)self _requestsForUpdaters:v4];

  os_unfair_lock_unlock(&self->_updatersLock);
  int v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
  os_unfair_lock_lock(&self->_processedRequestsLock);
  [v6 minusSet:self->_processedRequests];
  os_unfair_lock_unlock(&self->_processedRequestsLock);
  os_unfair_lock_lock(&self->_inflightRequestsLock);
  [v6 minusSet:self->_inflightRequests];
  os_unfair_lock_unlock(&self->_inflightRequestsLock);
  if ([v6 count])
  {
    [(GEOTransitRouteUpdateRequester *)self _sendRequestForRequests:v6];
  }
  else
  {
    id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "no requests to process", v8, 2u);
    }
  }
}

- (id)_requestsForUpdaters:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "requests", (void)v13);
          [v4 unionSet:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v11;
}

- (void)_sendRequestForRequests:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  if ([v36 count])
  {
    p_updatersLock = &self->_updatersLock;
    os_unfair_lock_lock(&self->_updatersLock);
    val = self;
    id v5 = [(NSHashTable *)self->_updaters allObjects];
    os_unfair_lock_unlock(p_updatersLock);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v51 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v9 isActive])
          {
            id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
            uint64_t v11 = [v9 requests];
            objc_super v12 = (void *)[v10 initWithSet:v11];

            [v12 intersectSet:v36];
            if ([v12 count])
            {
              long long v13 = [v9 delegate];
              char v14 = objc_opt_respondsToSelector();

              if (v14)
              {
                long long v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  uint64_t v56 = (uint64_t)v9;
                  __int16 v57 = 2113;
                  uint64_t v58 = (uint64_t)v12;
                  _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "notifying %{private}@ will request %{private}@", buf, 0x16u);
                }

                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke;
                block[3] = &unk_1E53D8998;
                block[4] = v9;
                id v49 = v12;
                dispatch_async(MEMORY[0x1E4F14428], block);
              }
              long long v16 = [v9 delegate];
              char v17 = objc_opt_respondsToSelector();

              if (v17)
              {
                uint64_t v18 = [(GEOTransitRouteUpdateRequester *)val _uuidsForRequests:v12];
                double v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  uint64_t v56 = (uint64_t)v9;
                  __int16 v57 = 2113;
                  uint64_t v58 = (uint64_t)v18;
                  _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "notifying %{private}@ will update %{private}@", buf, 0x16u);
                }

                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_15;
                v46[3] = &unk_1E53D8998;
                v46[4] = v9;
                id v47 = v18;
                id v20 = v18;
                dispatch_async(MEMORY[0x1E4F14428], v46);
              }
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v6);
    }

    os_unfair_lock_lock(&val->_inflightRequestsLock);
    [(NSMutableSet *)val->_inflightRequests unionSet:v36];
    os_unfair_lock_unlock(&val->_inflightRequestsLock);
    v21 = [v36 allObjects];
    uint64_t v22 = +[GEOTransitRouteUpdateRequest mergedTransitRouteUpdateRequests:v21];

    v23 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [v36 count];
      uint64_t v25 = [v22 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v56 = v24;
      __int16 v57 = 2048;
      uint64_t v58 = v25;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "merged %lu requests into %lu", buf, 0x16u);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v37 = v22;
    uint64_t v26 = [v37 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v43;
      v28 = (void *)MEMORY[0x1E4F14428];
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v37);
          }
          v30 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v31 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = [v30 routeIdentifiers];
            *(_DWORD *)buf = 138477827;
            uint64_t v56 = (uint64_t)v32;
            _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_INFO, "sending request for routes %{private}@", buf, 0xCu);
          }
          objc_initWeak((id *)buf, val);
          v33 = +[GEOTransitUpdateRequester sharedRequester];
          id v34 = v28;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_17;
          v40[3] = &unk_1E53DB1F8;
          objc_copyWeak(&v41, (id *)buf);
          v40[4] = v30;
          [v33 startTransitRouteUpdateRequest:v30 auditToken:0 throttleToken:0 queue:v28 networkActivity:0 completion:v40];

          objc_destroyWeak(&v41);
          objc_destroyWeak((id *)buf);
        }
        uint64_t v26 = [v37 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v26);
    }

    v35 = obj;
  }
  else
  {
    v35 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_DEBUG, "no requests to make", buf, 2u);
    }
  }
}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitRouteUpdater:*(void *)(a1 + 32) willSendRequests:*(void *)(a1 + 40)];
}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_15(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transitRouteUpdater:*(void *)(a1 + 32) willUpdateTransitForRouteIDs:*(void *)(a1 + 40)];
}

void __58__GEOTransitRouteUpdateRequester__sendRequestForRequests___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([v5 hasRouteUpdateConfiguration])
    {
      uint64_t v8 = [v5 routeUpdateConfiguration];
      int v9 = [v8 hasTtlSeconds];

      if (v9)
      {
        id v10 = [v5 routeUpdateConfiguration];
        double v11 = (double)(unint64_t)[v10 ttlSeconds];

        double Double = GEOConfigGetDouble(GeoServicesConfig_RealtimeTransitUpdateIntervalOverride, (uint64_t)off_1E9114978);
        if (Double > 0.0) {
          double v11 = Double;
        }
        if (v11 != WeakRetained[11])
        {
          long long v13 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = *((void *)WeakRetained + 11);
            int v15 = 134218240;
            uint64_t v16 = v14;
            __int16 v17 = 2048;
            double v18 = v11;
            _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "changing response interval from %#.1lfs to %#.1lfs", (uint8_t *)&v15, 0x16u);
          }

          WeakRetained[11] = v11;
        }
      }
    }
    [WeakRetained _handleResponse:v5 andError:v6 forRequest:*(void *)(a1 + 32)];
  }
}

- (id)_uuidsForRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)MEMORY[0x1E4F1CAD0];
        double v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "allClientRouteIDs", (void)v14);
        objc_super v12 = [v10 setWithArray:v11];
        [v4 unionSet:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_handleResponse:(id)a3 andError:(id)a4 forRequest:(id)a5
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v91 = a5;
  if (v91)
  {
    v90 = [v8 routeUpdates];
    id v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v11 = [v91 routeIdentifiers];
      objc_super v12 = [v90 valueForKey:@"_logDescription"];
      *(_DWORD *)buf = 138478339;
      v124 = v11;
      __int16 v125 = 2113;
      v126 = v12;
      __int16 v127 = 2112;
      id v128 = v9;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "handling response for %{private}@:\nupdates: %{private}@\nerror: %@", buf, 0x20u);
    }
    os_unfair_lock_lock(&self->_updatersLock);
    long long v13 = [(NSHashTable *)self->_updaters allObjects];
    os_unfair_lock_unlock(&self->_updatersLock);
    v98 = self;
    long long v14 = (void *)MEMORY[0x1E4F1CAD0];
    id v122 = v91;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
    long long v16 = +[GEOTransitRouteUpdateRequest splitTransitRouteUpdateRequests:v15];
    uint64_t v17 = [v14 setWithArray:v16];

    os_unfair_lock_lock(&self->_inflightRequestsLock);
    [(NSMutableSet *)self->_inflightRequests minusSet:v17];
    os_unfair_lock_unlock(&self->_inflightRequestsLock);
    double v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v91];
    v101 = [(GEOTransitRouteUpdateRequester *)self _uuidsForRequests:v18];

    id v93 = v8;
    v97 = v9;
    v88 = (void *)v17;
    v89 = v13;
    if (v9)
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v19 = v13;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v114 objects:v121 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v115;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v115 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v114 + 1) + 8 * i);
            if (objc_msgSend(v24, "isActive", v88, v89))
            {
              uint64_t v25 = [v24 delegate];
              char v26 = objc_opt_respondsToSelector();

              if (v26)
              {
                id v27 = objc_alloc(MEMORY[0x1E4F1CA80]);
                v28 = [v24 requests];
                v29 = [(GEOTransitRouteUpdateRequester *)v98 _uuidsForRequests:v28];
                v30 = (void *)[v27 initWithSet:v29];

                [v30 intersectSet:v101];
                if ([v30 count])
                {
                  v31 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138478339;
                    v124 = v24;
                    __int16 v125 = 2113;
                    v126 = v30;
                    __int16 v127 = 2112;
                    id v128 = v97;
                    _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_ERROR, "notifying %{private}@ did fail routeIDs %{private}@ with error: %@", buf, 0x20u);
                  }

                  v32 = [v24 delegate];
                  [v32 transitRouteUpdater:v24 didFailUpdateForRouteIDs:v30 withError:v97];
                }
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v114 objects:v121 count:16];
        }
        while (v21);
      }

      id v9 = v97;
      v33 = [v97 domain];
      id v34 = GEOErrorDomain();
      if ([v33 isEqualToString:v34])
      {
        id v8 = v93;
        if ([v97 code] == -8)
        {

          v35 = v98;
          id v37 = v88;
          id v36 = v89;
        }
        else
        {
          uint64_t v70 = [v97 code];

          BOOL v71 = v70 == -11;
          v35 = v98;
          id v37 = v88;
          id v36 = v89;
          if (!v71) {
            goto LABEL_72;
          }
        }
        unint64_t maxRetries = v35->_maxRetries;
        unint64_t v73 = v35->_numRetries + 1;
        v35->_numRetries = v73;
        if (v73 <= maxRetries)
        {
          [(GEOTransitRouteUpdateRequester *)v35 requestInterval];
          -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](v35, "_scheduleUpdateTimerWithInterval:");
          goto LABEL_72;
        }
        v35->_numRetries = 0;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v74 = v19;
        uint64_t v75 = [v74 countByEnumeratingWithState:&v110 objects:v120 count:16];
        if (v75)
        {
          uint64_t v76 = v75;
          uint64_t v77 = *(void *)v111;
          do
          {
            for (uint64_t j = 0; j != v76; ++j)
            {
              if (*(void *)v111 != v77) {
                objc_enumerationMutation(v74);
              }
              v79 = *(void **)(*((void *)&v110 + 1) + 8 * j);
              if (objc_msgSend(v79, "isActive", v88, v89))
              {
                v80 = [v79 delegate];
                char v81 = objc_opt_respondsToSelector();

                if (v81)
                {
                  id v82 = objc_alloc(MEMORY[0x1E4F1CA80]);
                  v83 = [v79 requests];
                  v84 = [(GEOTransitRouteUpdateRequester *)v98 _uuidsForRequests:v83];
                  v85 = (void *)[v82 initWithSet:v84];

                  [v85 intersectSet:v101];
                  if ([v85 count])
                  {
                    v86 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v79;
                      __int16 v125 = 2113;
                      v126 = v85;
                      _os_log_impl(&dword_188D96000, v86, OS_LOG_TYPE_ERROR, "notifying %{private}@ did timeout routeIDs %{private}@", buf, 0x16u);
                    }

                    v87 = [v79 delegate];
                    [v87 transitRouteUpdater:v79 didTimeoutForRouteIDs:v85];
                  }
                }
              }
            }
            uint64_t v76 = [v74 countByEnumeratingWithState:&v110 objects:v120 count:16];
          }
          while (v76);
        }

        id v8 = v93;
        id v9 = v97;
      }
      else
      {

        id v8 = v93;
      }
    }
    else
    {
      self->_numRetries = 0;
      os_unfair_lock_lock(&self->_processedRequestsLock);
      [(NSMutableSet *)self->_processedRequests unionSet:v17];
      os_unfair_lock_unlock(&self->_processedRequestsLock);
      v92 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v90];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v38 = v13;
      unint64_t v39 = 0x1E4F1C000uLL;
      obuint64_t j = v38;
      uint64_t v40 = [v38 countByEnumeratingWithState:&v106 objects:v119 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v107;
        uint64_t v94 = *(void *)v107;
        do
        {
          uint64_t v43 = 0;
          uint64_t v95 = v41;
          do
          {
            if (*(void *)v107 != v42) {
              objc_enumerationMutation(obj);
            }
            long long v44 = *(void **)(*((void *)&v106 + 1) + 8 * v43);
            if (objc_msgSend(v44, "isActive", v88, v89))
            {
              uint64_t v100 = v43;
              id v45 = objc_alloc(*(Class *)(v39 + 2688));
              v99 = v44;
              v46 = [v44 requests];
              id v47 = [(GEOTransitRouteUpdateRequester *)self _uuidsForRequests:v46];
              v48 = (void *)[v45 initWithSet:v47];

              [v48 intersectSet:v101];
              if ([v48 count])
              {
                id v49 = objc_msgSend(objc_alloc(*(Class *)(v39 + 2688)), "initWithCapacity:", objc_msgSend(v92, "count"));
                long long v102 = 0u;
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                id v50 = v92;
                uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v118 count:16];
                if (v51)
                {
                  uint64_t v52 = v51;
                  uint64_t v53 = *(void *)v103;
                  do
                  {
                    for (uint64_t k = 0; k != v52; ++k)
                    {
                      if (*(void *)v103 != v53) {
                        objc_enumerationMutation(v50);
                      }
                      v55 = *(void **)(*((void *)&v102 + 1) + 8 * k);
                      uint64_t v56 = (void *)MEMORY[0x1E4F29128];
                      __int16 v57 = [v55 routeIdentifier];
                      uint64_t v58 = [v57 clientRouteHandle];
                      v59 = objc_msgSend(v56, "_maps_UUIDWithData:", v58);

                      if ([v48 containsObject:v59]) {
                        [v49 addObject:v55];
                      }
                    }
                    uint64_t v52 = [v50 countByEnumeratingWithState:&v102 objects:v118 count:16];
                  }
                  while (v52);
                }

                id v8 = v93;
                id v9 = 0;
                self = v98;
                unint64_t v39 = 0x1E4F1C000;
                if ([v49 count])
                {
                  uint64_t v60 = v99;
                  v61 = [v99 delegate];
                  char v62 = objc_opt_respondsToSelector();

                  if (v62)
                  {
                    v63 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v99;
                      __int16 v125 = 2113;
                      v126 = v93;
                      _os_log_impl(&dword_188D96000, v63, OS_LOG_TYPE_INFO, "notifying %{private}@ did receive response %{private}@", buf, 0x16u);
                    }

                    uint64_t v60 = v99;
                    v64 = [v99 delegate];
                    [v64 transitRouteUpdater:v99 didReceiveResponse:v93];
                  }
                  v65 = [v60 delegate];
                  char v66 = objc_opt_respondsToSelector();

                  if (v66)
                  {
                    v67 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138478083;
                      v124 = v99;
                      __int16 v125 = 2113;
                      v126 = v48;
                      _os_log_impl(&dword_188D96000, v67, OS_LOG_TYPE_INFO, "notifying %{private}@ did receive updates for %{private}@", buf, 0x16u);
                    }

                    v68 = [v99 delegate];
                    v69 = [v49 allObjects];
                    [v68 transitRouteUpdater:v99 didUpdateTransitRoutes:v69];
                  }
                }
              }
              uint64_t v42 = v94;
              uint64_t v41 = v95;
              uint64_t v43 = v100;
            }
            ++v43;
          }
          while (v43 != v41);
          uint64_t v41 = [obj countByEnumeratingWithState:&v106 objects:v119 count:16];
        }
        while (v41);
      }

      [(GEOTransitRouteUpdateRequester *)self requestInterval];
      -[GEOTransitRouteUpdateRequester _scheduleUpdateTimerWithInterval:](self, "_scheduleUpdateTimerWithInterval:");
    }
    id v37 = v88;
    id v36 = v89;
LABEL_72:
  }
}

- (void)_removeRequestsIfApplicable:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    os_unfair_lock_lock(&self->_updatersLock);
    id v5 = [(NSHashTable *)self->_updaters allObjects];
    os_unfair_lock_unlock(&self->_updatersLock);
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v4];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v25 = self;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "requests", v25);
          char v14 = [v13 isEqualToSet:v4];

          if ((v14 & 1) == 0)
          {
            long long v15 = [v12 requests];
            long long v16 = [v15 allObjects];

            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v28;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                  if ([v6 containsObject:v22])
                  {
                    [v6 removeObject:v22];
                    if (![v6 count])
                    {

                      goto LABEL_24;
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            uint64_t v10 = v26;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
        self = v25;
      }
      while (v9);
    }

    v23 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitRouteUpdater");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = [v6 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v24;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "removing %lu processed requests", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_processedRequestsLock);
    [(NSMutableSet *)self->_processedRequests minusSet:v6];
    os_unfair_lock_unlock(&self->_processedRequestsLock);
LABEL_24:
  }
}

- (NSHashTable)updaters
{
  return self->_updaters;
}

- (NSMutableSet)processedRequests
{
  return self->_processedRequests;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (void)setRequestInterval:(double)a3
{
  self->_requestInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_inflightRequests, 0);
  objc_storeStrong((id *)&self->_processedRequests, 0);

  objc_storeStrong((id *)&self->_updaters, 0);
}

@end