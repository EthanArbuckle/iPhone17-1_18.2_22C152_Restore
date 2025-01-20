@interface GEOOfflineService
+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3;
+ (GEOOfflineService)shared;
+ (GEOOfflineService)sharedNoCreate;
+ (id)stateManagerClass;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)canUseOfflineForCoordinateRegion:(id)a3;
- ($BD055F43A5DF7FBAA8066526AB28D3ED)state;
- (BOOL)isUsingOffline;
- (GEOOfflineService)initWithPreferredAuditToken:(id)a3;
- (GEOOfflineServiceDelegate)delegate;
- (id)_mapViewToUse;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (id)initWithSubscriptionManager:(id *)a1 preferredAuditToken:(void *)a2;
- (uint64_t)_preferredStateForRegion:(void *)a3 inState:(double)a4 withSubscriptions:(double)a5;
- (uint64_t)_setStateNeedsUpdate;
- (uint64_t)_stateIsolated;
- (unint64_t)offlineRegionCount;
- (void)_fetchCurrentState;
- (void)_goActiveOnQueue;
- (void)_goInactiveOnQueue:(int)a3 canWait:;
- (void)_setState:(uint64_t)a1 ifStateIs:(unsigned int)a2;
- (void)_startCheckingConnectivity;
- (void)_stopCheckingConnectivity;
- (void)_switchToState:(int)a3 waitForReply:;
- (void)_updateSubscribedRegions;
- (void)dealloc;
- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4;
- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4 device:(unsigned __int8)a5;
- (void)delegatePrefersMode:(unsigned __int8)a3;
- (void)delegatePrefersMode:(unsigned __int8)a3 device:(unsigned __int8)a4;
- (void)mapView:(id)a3 viewPortUpdated:(id)a4;
- (void)mapView:(id)a3 viewPortUpdated:(id)a4 showingGrid:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerMapView:(id)a3 withPriority:(double)a4;
- (void)removeDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStateAuto;
- (void)setStateForcedOffline;
- (void)setStateNeedsUpdate;
- (void)setSuggestedState:(void *)a1;
- (void)shutdownService;
- (void)startServiceIfEnabled;
- (void)unregisterMapView:(id)a3;
@end

@implementation GEOOfflineService

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && MEMORY[0x18C1213B0](v3) == MEMORY[0x1E4F14590])
  {
    v5 = WeakRetained[10];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_3;
    v6[3] = &unk_1E53D8998;
    v7 = WeakRetained;
    id v8 = v3;
    dispatch_async(v5, v6);
  }
}

+ (GEOOfflineService)sharedNoCreate
{
  return (GEOOfflineService *)(id)_MergedGlobals_238;
}

uint64_t __40__GEOOfflineService_setStateNeedsUpdate__block_invoke(uint64_t a1)
{
  return -[GEOOfflineService _setStateNeedsUpdate](*(void *)(a1 + 32));
}

+ ($BD055F43A5DF7FBAA8066526AB28D3ED)activeStateForCohortId:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([+[GEOOfflineService stateManagerClass]() isCohortAllowed:v3]
      && [+[GEOOfflineService stateManagerClass]() isOfflineAvailable])
    {
      v4 = +[GEOApplicationAuditToken currentProcessAuditToken];
      v5 = [v4 offlineCohortId];
      int v6 = [v5 isEqualToString:v3];

      if (v6
        && (+[GEOOfflineService sharedNoCreate],
            (v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = v7;
        v9.var0 = [v7 state];
      }
      else
      {
        v9.var0 = [+[GEOOfflineService stateManagerClass]() activeStateForCohortId:v3];
      }
    }
    else
    {
      v9.var0 = 513;
    }
  }
  else
  {
    v9.var0 = 0;
  }

  return ($BD055F43A5DF7FBAA8066526AB28D3ED)v9.var0;
}

+ (id)stateManagerClass
{
  self;
  v0 = (void *)_stateManagerClass;
  if (!_stateManagerClass)
  {
    self;
    v0 = objc_opt_class();
    _stateManagerClass = (uint64_t)v0;
  }

  return v0;
}

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    if (+[GEOXPCMessage canDecodeFromXPCDictionary:v2])
    {
      id v25 = 0;
      id v3 = +[GEOXPCMessage decodeFromXPCDictionary:v2 error:&v25];
      id v4 = v25;
      v5 = v4;
      if (v3 && !v4)
      {
        -[GEOOfflineService setSuggestedState:]((void *)v1, [v3 currentState]);
LABEL_44:

        goto LABEL_45;
      }
      v18 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v35 = 138412546;
        *(void *)&v35[4] = v3;
        *(_WORD *)&v35[12] = 2112;
        *(void *)&v35[14] = v5;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v35, 0x16u);
      }
LABEL_33:

      goto LABEL_44;
    }
    if (+[GEOXPCMessage canDecodeFromXPCDictionary:v2])
    {
      id v6 = v2;
      id v31 = 0;
      v7 = +[GEOXPCMessage decodeFromXPCDictionary:v6 error:&v31];
      id v8 = v31;
      $BD055F43A5DF7FBAA8066526AB28D3ED v9 = v8;
      if (!v7 || v8)
      {
        v21 = GEOGetOfflineServiceLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v35 = 138412546;
          *(void *)&v35[4] = v7;
          *(_WORD *)&v35[12] = 2112;
          *(void *)&v35[14] = v9;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v35, 0x16u);
        }
      }
      else
      {
        id v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__43;
        v29 = __Block_byref_object_dispose__43;
        id v30 = 0;
        *(void *)v35 = MEMORY[0x1E4F143A8];
        *(void *)&v35[8] = 3221225472;
        *(void *)&v35[16] = __41__GEOOfflineService__procesStateChanged___block_invoke;
        v36 = &unk_1E53D7BD8;
        uint64_t v37 = v1;
        id v38 = v7;
        v39 = &v25;
        geo_isolate_sync_data();
        v10 = GEOGetOfflineServiceLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          GEOOfflineStateAsString(*(unsigned int *)(v1 + 60));
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = GEOOfflineStateAsString(*(unsigned int *)(v1 + 56));
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEFAULT, "Received new state: %{public}@, savedState: %{public}@", buf, 0x16u);
        }
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __41__GEOOfflineService__procesStateChanged___block_invoke_145;
        v33 = &unk_1E53D79D8;
        uint64_t v34 = v1;
        dispatch_async(MEMORY[0x1E4F14428], buf);
        v13 = (void (**)(void))v26[5];
        if (v13) {
          v13[2]();
        }

        _Block_object_dispose(&v25, 8);
      }
    }
    else
    {
      if (+[GEOXPCMessage canDecodeFromXPCDictionary:v2])
      {
        id v25 = 0;
        id v3 = +[GEOXPCMessage decodeFromXPCDictionary:v2 error:&v25];
        id v14 = v25;
        v5 = v14;
        if (v3 && !v14)
        {
          int v15 = [v3 isSubscribed];
          v16 = GEOGetOfflineServiceLog();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            if (v17)
            {
              *(_WORD *)v35 = 0;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEFAULT, "geod said hello, starting service", v35, 2u);
            }

            -[GEOOfflineService _goActiveOnQueue](v1);
            -[GEOOfflineService setSuggestedState:]((void *)v1, [v3 currentState]);
          }
          else
          {
            if (v17)
            {
              uint64_t v22 = *(void *)(v1 + 8);
              v23 = "Shutdown";
              if (v22 == 1) {
                v23 = "Inactive";
              }
              if (v22 == 2) {
                v24 = "Active";
              }
              else {
                v24 = v23;
              }
              *(_DWORD *)v35 = 136315138;
              *(void *)&v35[4] = v24;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEFAULT, "geod said goodbye, deactivating service if needed (current state is %s)", v35, 0xCu);
            }

            if (*(void *)(v1 + 8) == 2) {
              -[GEOOfflineService _goInactiveOnQueue:canWait:](v1, 1, 1);
            }
            *(void *)v35 = MEMORY[0x1E4F143A8];
            *(void *)&v35[8] = 3221225472;
            *(void *)&v35[16] = __52__GEOOfflineService__processSubscribedStateChanged___block_invoke;
            v36 = &unk_1E53D79D8;
            uint64_t v37 = v1;
            geo_isolate_sync_data();
          }
          goto LABEL_44;
        }
        v18 = GEOGetOfflineServiceLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v35 = 138412546;
          *(void *)&v35[4] = v3;
          *(_WORD *)&v35[12] = 2112;
          *(void *)&v35[14] = v5;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Error decoding message: \"%@\" - %@", v35, 0x16u);
        }
        goto LABEL_33;
      }
      v19 = (void *)MEMORY[0x18C121170](v2);
      v20 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v35 = 136315138;
        *(void *)&v35[4] = v19;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Received unrecognized message: %s", v35, 0xCu);
      }

      free(v19);
    }
  }
LABEL_45:
}

- (void)_goActiveOnQueue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    if (*(void *)(a1 + 8) != 2)
    {
      id v2 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = "Shutdown";
        uint64_t v5 = *(void *)(a1 + 8);
        uint64_t v4 = *(void *)(a1 + 16);
        if (v5 == 1) {
          id v3 = "Inactive";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v22 = v4;
        __int16 v23 = 2082;
        if (v5 == 2) {
          id v3 = "Active";
        }
        v24 = v3;
        __int16 v25 = 2082;
        v26 = "Inactive";
        _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "Starting service with preferred audit token: %@. switching from %{public}s -> %{public}s", buf, 0x20u);
      }

      *(void *)(a1 + 8) = 1;
      objc_initWeak((id *)buf, (id)a1);
      if (*(_DWORD *)(a1 + 40) == -1)
      {
        id v6 = *(NSObject **)(a1 + 80);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke;
        handler[3] = &unk_1E53DD2C0;
        objc_copyWeak(&v20, (id *)buf);
        notify_register_dispatch("GEODaemonDidStartDarwinNotification", (int *)(a1 + 40), v6, handler);
        objc_destroyWeak(&v20);
      }
      -[GEOOfflineService _switchToState:waitForReply:]((void *)a1, 2, 1);
      v7 = GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
      id v8 = *(NSObject **)(a1 + 80);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_2;
      v17[3] = &unk_1E53DD2C0;
      objc_copyWeak(&v18, (id *)buf);
      notify_register_dispatch(v7, (int *)(a1 + 44), v8, v17);
      $BD055F43A5DF7FBAA8066526AB28D3ED v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_3;
      v15[3] = &unk_1E53E30C8;
      objc_copyWeak(&v16, (id *)buf);
      uint64_t v10 = [v9 addObserverForName:@"GEOOfflineAvailabilityChangedNotification" object:0 queue:0 usingBlock:v15];
      id v11 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v10;

      GEOConfigGetDouble(GeoOfflineConfig_CohortStateTTL, (uint64_t)off_1E91156E8);
      uint64_t v12 = geo_dispatch_timer_create_on_qos();
      v13 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v12;

      dispatch_activate(*(dispatch_object_t *)(a1 + 96));
      -[GEOOfflineService _updateSubscribedRegions](a1);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      LODWORD(v9) = WeakRetained == 0;

      if (v9) {
        -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)a1);
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

uint64_t __39__GEOOfflineService__fetchCurrentState__block_invoke_119(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 60) = [*(id *)(a1 + 40) currentState];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = [*(id *)(a1 + 40) savedState];
  *(_DWORD *)(v3 + 56) = result;
  return result;
}

- (void)_updateSubscribedRegions
{
  if (a1)
  {
    uint64_t v2 = dispatch_group_create();
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    dispatch_group_enter(v2);
    uint64_t v4 = *(void **)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 80);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke;
    v13[3] = &unk_1E53E3230;
    id v14 = v2;
    uint64_t v15 = a1;
    id v6 = v3;
    id v16 = v6;
    v7 = v2;
    [v4 fetchAllSubscriptionsWithCallbackQueue:v5 completionHandler:v13];
    id v8 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke_131;
    block[3] = &unk_1E53D8998;
    id v11 = v6;
    uint64_t v12 = a1;
    id v9 = v6;
    dispatch_group_notify(v7, v8, block);
  }
}

- (void)_switchToState:(int)a3 waitForReply:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = a1[1];
    id v8 = "Shutdown";
    if (v7 == 1) {
      id v9 = "Inactive";
    }
    else {
      id v9 = "Shutdown";
    }
    if (v7 == 2) {
      uint64_t v10 = "Active";
    }
    else {
      uint64_t v10 = v9;
    }
    if (a2 == 1) {
      id v8 = "Inactive";
    }
    if (a2 == 2) {
      id v8 = "Active";
    }
    *(_DWORD *)buf = 136446722;
    __int16 v25 = v10;
    if (a3) {
      id v11 = "YES";
    }
    else {
      id v11 = "NO";
    }
    __int16 v26 = 2082;
    uint64_t v27 = v8;
    __int16 v28 = 2080;
    v29 = v11;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Switching from state: %{public}s -> %{public}s, willWait: %s", buf, 0x20u);
  }

  uint64_t v12 = [[GEOOfflineServiceStateSubscribeRequest alloc] initWithTraits:0 auditToken:a1[2] throttleToken:0];
  [(GEOOfflineServiceStateSubscribeRequest *)v12 setSubscribe:a2 != 0];
  uint64_t v13 = a1[20];
  if (a3)
  {
    uint64_t v14 = a1[10];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__GEOOfflineService__switchToState_waitForReply___block_invoke;
    v20[3] = &unk_1E53E3208;
    v21 = v12;
    uint64_t v22 = a1;
    uint64_t v23 = a2;
    [(GEOXPCRequest *)v21 send:v13 withReply:v14 handler:v20];
  }
  else
  {
    [(GEOXPCRequest *)v12 send:a1[20]];
    uint64_t v15 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = "Shutdown";
      uint64_t v17 = a1[1];
      if (v17 == 1) {
        id v18 = "Inactive";
      }
      else {
        id v18 = "Shutdown";
      }
      if (v17 == 2) {
        v19 = "Active";
      }
      else {
        v19 = v18;
      }
      if (a2 == 1) {
        id v16 = "Inactive";
      }
      if (a2 == 2) {
        id v16 = "Active";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v25 = v19;
      __int16 v26 = 2082;
      uint64_t v27 = v16;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Switched state %{public}s -> %{public}s", buf, 0x16u);
    }

    a1[1] = a2;
  }
}

- (void)_startCheckingConnectivity
{
  if (a1)
  {
    dispatch_assert_queue_V2(a1[10]);
    if (!a1[13] && GEOConfigGetDouble(GeoOfflineConfig_CheckConnectivityInterval, (uint64_t)off_1E9115938) != 0.0)
    {
      objc_initWeak(&location, a1);
      objc_copyWeak(&v4, &location);
      uint64_t v2 = geo_dispatch_timer_create_on_qos();
      dispatch_queue_t v3 = a1[13];
      a1[13] = (dispatch_queue_t)v2;

      dispatch_activate(a1[13]);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __35__GEOOfflineService__stateIsolated__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 32) = *(_DWORD *)(*(void *)(result + 32) + 60);
  return result;
}

void __27__GEOOfflineService_shared__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[GEOEntitlements currentProcessEntitlement:@"com.apple.geoservices.offline.cohort-id"];
  if (v2
    || ([MEMORY[0x1E4F28B50] mainBundle],
        dispatch_queue_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 bundleIdentifier],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2))
  {
    if ([+[GEOOfflineService stateManagerClass]() isCohortAllowed:v2])
    {
      id v4 = -[GEOOfflineService initWithSubscriptionManager:preferredAuditToken:]((id *)objc_alloc(*(Class *)(a1 + 32)), 0);
      uint64_t v5 = (void *)_MergedGlobals_238;
      _MergedGlobals_238 = (uint64_t)v4;
    }
    else
    {
      id v6 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v7 = 138543362;
        id v8 = v2;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_FAULT, "Attempt to use offline service with non-allowlisted cohort ID: %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v2 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Attempt to use offline service with no cohort ID specified", (uint8_t *)&v7, 2u);
    }
  }
}

- (id)initWithSubscriptionManager:(id *)a1 preferredAuditToken:(void *)a2
{
  id v4 = a2;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)GEOOfflineService;
    uint64_t v5 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = v5;
    if (v5)
    {
      v5[7] = 0;
      v5[15] = 0;
      *((unsigned char *)v5 + 136) = 0;
      uint64_t v6 = geo_dispatch_queue_create();
      id v7 = a1[10];
      a1[10] = (id)v6;

      id v8 = objc_alloc_init(GEOMapDataSubscriptionManager);
      id v9 = a1[8];
      a1[8] = v8;

      uint64_t v10 = geo_isolater_create();
      id v11 = a1[14];
      a1[14] = (id)v10;

      uint64_t v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      id v13 = a1[19];
      a1[19] = (id)v12;

      a1[5] = (id)-1;
      objc_storeStrong(a1 + 2, a2);
      objc_initWeak(&location, a1);
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"OfflineService:%p", a1);
      id v15 = a1[10];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke;
      v22[3] = &unk_1E53D79D8;
      id v16 = a1;
      uint64_t v23 = v16;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke_2;
      v20[3] = &unk_1E53DF960;
      objc_copyWeak(&v21, &location);
      uint64_t v17 = +[GEOXPCConnection createServerConnectionFor:23 debugIdentifier:v14 queue:v15 reconnectBlock:v22 eventHandler:v20];
      id v18 = v16[20];
      v16[20] = (id)v17;

      [v16[20] setReconnectAutomatically:1];
      GEORegisterPListStateCaptureLegacy();
      a1 = v16;
      objc_destroyWeak(&v21);

      objc_destroyWeak(&location);
    }
  }

  return a1;
}

+ (GEOOfflineService)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__GEOOfflineService_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (qword_1EB29FBC8 != -1) {
    dispatch_once(&qword_1EB29FBC8, block);
  }
  uint64_t v2 = (void *)_MergedGlobals_238;

  return (GEOOfflineService *)v2;
}

void *__39__GEOOfflineService_setSuggestedState___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = result[6] != *(void *)(result[4] + 120);
  *(void *)(result[4] + 120) = result[6];
  return result;
}

void __69__GEOOfflineService_initWithSubscriptionManager_preferredAuditToken___block_invoke(uint64_t a1)
{
}

void __42__GEOOfflineService_startServiceIfEnabled__block_invoke(uint64_t a1)
{
}

- (void)mapView:(id)a3 viewPortUpdated:(id)a4
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v7 + 24)) {
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
  }

  _Block_object_dispose(&v6, 8);
}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke_131(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134349056;
    uint64_t v36 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Fetched %{public}llu offline subscriptions", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [*(id *)(*(void *)(a1 + 40) + 72) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
        uint64_t v10 = *(void *)(a1 + 40);
        if (v9)
        {
          id v11 = *(void **)(v9 + 16);
          if (!v10) {
            goto LABEL_11;
          }
LABEL_10:
          [v11 removeObserver:v10 forKeyPath:@"loadState" context:_KVOContext_0];
          goto LABEL_11;
        }
        id v11 = 0;
        if (v10) {
          goto LABEL_10;
        }
LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v14) {
    goto LABEL_29;
  }
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
      uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
      uint64_t v19 = *(void *)(a1 + 40);
      if (v18)
      {
        id v20 = *(void **)(v18 + 16);
        if (!v19) {
          goto LABEL_24;
        }
LABEL_23:
        [v20 addObserver:v19 forKeyPath:@"loadState" options:0 context:_KVOContext_0];
        goto LABEL_24;
      }
      id v20 = 0;
      if (v19) {
        goto LABEL_23;
      }
LABEL_24:
      ++v17;
    }
    while (v15 != v17);
    uint64_t v21 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    uint64_t v15 = v21;
  }
  while (v21);
LABEL_29:

  uint64_t v22 = [*(id *)(a1 + 32) copy];
  uint64_t v23 = *(void *)(a1 + 40);
  v24 = *(void **)(v23 + 72);
  *(void *)(v23 + 72) = v22;

  -[GEOOfflineService setStateNeedsUpdate](*(void *)(a1 + 40));
}

void __39__GEOOfflineService__fetchCurrentState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v23 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "Unable to fetch to offline state: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    __int16 v8 = -[GEOOfflineService _stateIsolated](*(void *)(a1 + 32));
    if ((_BYTE)v8) {
      BOOL v9 = (v8 & 0xFF00) == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      id v10 = v5;
      long long v25 = v10;
      geo_isolate_sync_data();
      id v11 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = GEOOfflineStateAsString(*(unsigned int *)(*(void *)(a1 + 32) + 60));
        id v13 = GEOOfflineStateAsString(*(unsigned int *)(*(void *)(a1 + 32) + 56));
        GEOOfflineSuggestedStateAsString([v10 currentSuggestedState]);
        uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        long long v27 = v14;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEFAULT, "Fetched current state: %{public}@, savedState: %{public}@, suggestion: %{public}@", buf, 0x20u);
      }
    }
    -[GEOOfflineService setSuggestedState:](*(void **)(a1 + 32), [v5 currentSuggestedState]);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v27 = __Block_byref_object_copy__43;
    long long v28 = __Block_byref_object_dispose__43;
    id v29 = 0;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    geo_isolate_sync_data();
    uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
    if (v22) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))(v22 + 16))(v22, v15, v16, v17, v18, v19, v20, v21, v24, 3221225472, __39__GEOOfflineService__fetchCurrentState__block_invoke_120);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)setSuggestedState:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    __int16 v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    geo_isolate_sync_data();
    if (*((unsigned char *)v8 + 24))
    {
      id v4 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        GEOOfflineSuggestedStateAsString(a2);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        id v6 = GEOOfflineStateAsString([a1 state]);
        *(_DWORD *)buf = 138543618;
        id v12 = v5;
        __int16 v13 = 2114;
        uint64_t v14 = v6;
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEFAULT, "Got updated suggestion: %{public}@ current state is: %{public}@", buf, 0x16u);
      }
      -[GEOOfflineService setStateNeedsUpdate]((uint64_t)a1);
    }
    _Block_object_dispose(&v7, 8);
  }
}

- (uint64_t)_stateIsolated
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2810000000;
  id v6 = "";
  int v7 = 0;
  geo_isolate_sync_data();
  uint64_t v1 = *((unsigned int *)v4 + 8);
  _Block_object_dispose(&v3, 8);
  return v1;
}

- (void)setStateNeedsUpdate
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__GEOOfflineService_setStateNeedsUpdate__block_invoke;
    block[3] = &unk_1E53D79D8;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __49__GEOOfflineService__switchToState_waitForReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    __int16 v13 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [*(id *)(a1 + 32) subscribe];
      uint64_t v15 = "unsubscribe";
      if (v14) {
        uint64_t v15 = "subscribe";
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v17 = "Shutdown";
      if (v16 == 1) {
        uint64_t v17 = "Inactive";
      }
      int v24 = 136446978;
      long long v25 = v15;
      uint64_t v18 = "Active";
      __int16 v26 = 2114;
      long long v27 = v7;
      __int16 v28 = 2082;
      if (v16 != 2) {
        uint64_t v18 = v17;
      }
      id v29 = v18;
      __int16 v30 = 2082;
      long long v31 = "Inactive";
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Unable to %{public}s to offline state: %{public}@. Switched state %{public}s -> %{public}s", (uint8_t *)&v24, 0x2Au);
    }

    *(void *)(*(void *)(a1 + 40) + 8) = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    int v9 = [v5 subscribed];
    if (v9 == [*(id *)(a1 + 32) subscribe])
    {
      *(void *)(*(void *)(a1 + 40) + 8) = *(void *)(a1 + 48);
    }
    else
    {
      int v10 = [v5 subscribed];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      if (v10)
      {
        if (v12)
        {
          *(void *)(v11 + 8) = v12;
          if (*(void *)(a1 + 48) == 1) {
            -[GEOOfflineService _goActiveOnQueue](*(void *)(a1 + 40));
          }
        }
        else
        {
          *(void *)(v11 + 8) = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            LOWORD(v24) = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: subscribed when trying to shutdown", (uint8_t *)&v24, 2u);
          }
        }
      }
      else if (v12)
      {
        *(void *)(v11 + 8) = 1;
      }
      else
      {
        *(void *)(v11 + 8) = 0;
      }
    }
    uint64_t v19 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = "Shutdown";
      if (v8 == 1) {
        uint64_t v21 = "Inactive";
      }
      else {
        uint64_t v21 = "Shutdown";
      }
      if (v8 == 2) {
        uint64_t v21 = "Active";
      }
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v22 == 1) {
        uint64_t v20 = "Inactive";
      }
      if (v22 == 2) {
        uint64_t v20 = "Active";
      }
      int v24 = 136446466;
      long long v25 = v21;
      __int16 v26 = 2082;
      long long v27 = v20;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Switched state %{public}s -> %{public}s", (uint8_t *)&v24, 0x16u);
    }

    if (*(void *)(a1 + 48) == 2)
    {
      uint64_t v23 = *(void **)(a1 + 40);
      if (v23[1] == 2) {
        -[GEOOfflineService _fetchCurrentState](v23);
      }
    }
  }
}

- (void)_fetchCurrentState
{
  if (a1)
  {
    uint64_t v2 = [[GEOOfflineServiceStateFetchStateRequest alloc] initWithTraits:0 auditToken:a1[2] throttleToken:0];
    uint64_t v3 = a1[20];
    uint64_t v4 = a1[10];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__GEOOfflineService__fetchCurrentState__block_invoke;
    v5[3] = &unk_1E53E31E0;
    v5[4] = a1;
    [(GEOXPCRequest *)v2 send:v3 withReply:v4 handler:v5];
  }
}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Unable to fetch subscriptions: %{public}@", buf, 0xCu);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v12 dataTypes] & 0x400) != 0)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          __int16 v13 = *(void **)(*(void *)(a1 + 40) + 64);
          int v14 = [v12 identifier];
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 80);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __45__GEOOfflineService__updateSubscribedRegions__block_invoke_127;
          v17[3] = &unk_1E53DC048;
          void v17[4] = v12;
          id v18 = *(id *)(a1 + 48);
          id v19 = *(id *)(a1 + 32);
          [v13 fetchStateForSubscriptionWithIdentifier:v14 callbackQueue:v15 completionHandler:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __33__GEOOfflineService_setStateAuto__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStateAuto];
}

- (void)setStateAuto
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2810000000;
  long long v21 = "";
  int v22 = 0;
  geo_isolate_sync_data();
  if (*((unsigned char *)v24 + 24))
  {
    int v3 = *((_DWORD *)v19 + 8);
    if (v3 >= 2u)
    {
      if (v3 == 2) {
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v3;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
    }
    unsigned int v4 = BYTE1(v3);
    if (v4 >= 2)
    {
      if (v4 == 2) {
        goto LABEL_16;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v4;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
      }
    }
LABEL_10:
    int v5 = *((_DWORD *)v19 + 8);
    int v6 = v5;
    if (v5 < 2u) {
      goto LABEL_20;
    }
    if (v5 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v6;
      uint64_t v16 = MEMORY[0x1E4F14500];
      uint64_t v17 = "Unreachable reached: invalid offline mode value %x";
      goto LABEL_28;
    }
    int v7 = BYTE1(v5);
    if (BYTE1(v5) < 2u)
    {
LABEL_20:
      __int16 v13 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = GEOOfflineStateAsString(*((unsigned int *)v19 + 8));
        *(_DWORD *)buf = 138543362;
        id v28 = v14;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEFAULT, "Restoring saved state: %{public}@", buf, 0xCu);
      }
      unsigned int v11 = *((_DWORD *)v19 + 8);
LABEL_23:
      -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v11);
      -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
      goto LABEL_24;
    }
    if (BYTE1(v5) != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v7;
      uint64_t v16 = MEMORY[0x1E4F14500];
      uint64_t v17 = "Unreachable reached: invalid offline reason value %x";
LABEL_28:
      _os_log_fault_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, v17, buf, 8u);
      goto LABEL_20;
    }
LABEL_16:
    uint64_t v8 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      GEOOfflineStateAsString(*((unsigned int *)v19 + 8));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = GEOOfflineStateAsString(0x101uLL);
      *(_DWORD *)buf = 138543618;
      id v28 = v9;
      __int16 v29 = 2114;
      __int16 v30 = v10;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "Saved state was %{public}@. Setting to %{public}@ instead", buf, 0x16u);
    }
    unsigned int v11 = 257;
    *((_DWORD *)v19 + 8) = 257;
    goto LABEL_23;
  }
LABEL_24:
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
}

void __39__GEOOfflineService__fetchCurrentState__block_invoke_120(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

- (uint64_t)_setStateNeedsUpdate
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 80));
    if (!*(void *)(v1 + 88))
    {
      objc_initWeak(location, (id)v1);
      uint64_t v2 = [GEOCoalescingTimer alloc];
      double Double = GEOConfigGetDouble(GeoOfflineConfig_ServiceUpdateMaximumInterval, (uint64_t)off_1E9115998);
      uint64_t v4 = *(void *)(v1 + 80);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __41__GEOOfflineService__setStateNeedsUpdate__block_invoke;
      v8[3] = &unk_1E53D7B90;
      objc_copyWeak(&v9, location);
      uint64_t v5 = [(GEOCoalescingTimer *)v2 initWithCoalescingInterval:v4 deadlineInterval:v8 queue:0.2 callback:Double];
      int v6 = *(void **)(v1 + 88);
      *(void *)(v1 + 88) = v5;

      objc_destroyWeak(&v9);
      objc_destroyWeak(location);
    }
    int v7 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Pushing out state update timer", (uint8_t *)location, 2u);
    }

    return [*(id *)(v1 + 88) scheduleRun];
  }
  return result;
}

void __47__GEOOfflineService__startCheckingConnectivity__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    __int16 v3 = [WeakRetained state];
    uint64_t v2 = v12;
    int v4 = v3;
    if (v3 >= 2u)
    {
      if (v3 == 2)
      {
        int v5 = HIBYTE(v3);
        if (HIBYTE(v3) >= 2u)
        {
          if (HIBYTE(v3) == 2) {
            goto LABEL_12;
          }
          BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
          uint64_t v2 = v12;
          if (v6)
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v5;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", buf, 8u);
            uint64_t v2 = v12;
          }
        }
        int v7 = (void *)v2[20];
        __int16 v13 = @"message";
        *(void *)buf = @"offlinestate.checkConnectivity";
        uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
        id v9 = v7;
        uint64_t v10 = [v8 dictionaryWithObjects:buf forKeys:&v13 count:1];
        [v9 sendDictionary:v10];
      }
      else
      {
        BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
        uint64_t v2 = v12;
        if (!v11) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v4;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
      uint64_t v2 = v12;
    }
  }
LABEL_12:
}

- (BOOL)isUsingOffline
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = [(GEOOfflineService *)self state];
  int v3 = v2;
  if (v2 >= 3u)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4)
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", (uint8_t *)v6, 8u);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = (v2 & 7) == 2;
  }
  return v4;
}

void __41__GEOOfflineService__setStateNeedsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 10));
    int v1 = [WeakRetained state];
    unsigned __int8 v2 = BYTE1(v1);
    if (BYTE1(v1) != 2)
    {
      int v3 = v1;
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__138;
      v52 = __Block_byref_object_dispose__139;
      id v53 = 0;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      uint64_t v38 = 0;
      v39 = (double *)&v38;
      uint64_t v40 = 0x4010000000;
      v41 = "";
      long long v42 = kGEOCoordinateRegionInvalid_0;
      long long v43 = unk_18A637250;
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0;
      uint64_t v30 = 0;
      uint64_t v31 = &v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = 0x10000000000000;
      geo_isolate_sync_data();
      uint64_t v4 = v55[3];
      if (v4)
      {
        if (v49[5])
        {
          if (v4 == 1) {
            int v5 = 1;
          }
          else {
            int v5 = 2;
          }
          if (v5 != *((unsigned __int8 *)v45 + 24))
          {
            BOOL v6 = GEOGetOfflineServiceLog();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
            {
              uint64_t v7 = v49[5];
              GEOOfflineModeAsString(v5);
              id v8 = (id)objc_claimAutoreleasedReturnValue();
              id v9 = GEOOfflineModeAsString(*((unsigned __int8 *)v45 + 24));
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v7;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v8;
              *(_WORD *)&buf[22] = 2114;
              v59 = v9;
              _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "Informing delegate %{public}@ of new suggestion: %{public}@ (was previously informed of %{public}@)", buf, 0x20u);
            }
            geo_isolate_sync_data();
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&buf[16] = __42__GEOOfflineService__updateSuggestedState__block_invoke_2;
            v59 = &unk_1E53E3280;
            id v60 = WeakRetained;
            v61 = &v48;
            int v62 = v5 | 0x100;
            dispatch_async(MEMORY[0x1E4F14428], buf);
          }
          goto LABEL_26;
        }
        double v10 = v39[5];
        if (v10 < -180.0
          || v10 > 180.0
          || (double v11 = v39[4], v11 < -90.0)
          || v11 > 90.0
          || (double v12 = v39[6], v12 < 0.0)
          || v12 > 180.0
          || (double v13 = v39[7], v13 < 0.0)
          || v13 > 360.0)
        {
          uint64_t v17 = GEOGetOfflineServiceLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_INFO, "No delegate available and viewport is invalid, ignoring suggestion", buf, 2u);
          }

          goto LABEL_26;
        }
        int v14 = GEOGetOfflineServiceLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          unint64_t v15 = v35[3];
          if (v15 > 2) {
            uint64_t v16 = "invalid";
          }
          else {
            uint64_t v16 = off_1E53E32D0[v15];
          }
          uint64_t v18 = v31[3];
          uint64_t v19 = *((void *)v39 + 6);
          uint64_t v20 = *((void *)v39 + 7);
          long long v21 = NSString;
          int v22 = [NSString stringWithFormat:@"%+.8f, %+.8f", *((void *)v39 + 4), *((void *)v39 + 5)];
          uint64_t v23 = [v21 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v22, v19, v20];

          *(_DWORD *)buf = 136446723;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2113;
          v59 = v23;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Updating suggestion with map view state \"%{public}s\" with priority %f from viewport: %{private}@", buf, 0x20u);
        }
        uint64_t v24 = v55[3];
        if (!v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Should have been caught by the guard", buf, 2u);
          }
          goto LABEL_26;
        }
        if (v24 == 1)
        {
          unsigned int v28 = 257;
          goto LABEL_40;
        }
        if (v24 == 2
          && [+[GEOOfflineService stateManagerClass]() isOfflineAvailableLocally])
        {
          uint64_t v25 = v39;
          unint64_t v26 = v35[3];
          uint64_t v27 = [*((id *)WeakRetained + 9) allValues];
          unsigned int v28 = -[GEOOfflineService _preferredStateForRegion:inState:withSubscriptions:]((uint64_t)WeakRetained, v26, v27, v25[4], v25[5], v25[6], v25[7]);

LABEL_40:
          if ((_BYTE)v28 && (v28 & 0xFF00) != 0 && (v3 & 0xFFFF00FF | (v2 << 8)) != v28) {
            -[GEOOfflineService _setState:ifStateIs:]((uint64_t)WeakRetained, v28);
          }
        }
      }
LABEL_26:
      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v44, 8);
      _Block_object_dispose(&v48, 8);

      _Block_object_dispose(&v54, 8);
    }
  }
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)state
{
  if ([+[GEOOfflineService stateManagerClass]() isOfflineAvailable])
  {
    return ($BD055F43A5DF7FBAA8066526AB28D3ED)-[GEOOfflineService _stateIsolated]((uint64_t)self);
  }
  else
  {
    return ($BD055F43A5DF7FBAA8066526AB28D3ED)513;
  }
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_2_38()
{
  id v0 = +[GEOUtilityService sharedService];
  [v0 sendHeartbeat];
}

void __33__GEOOfflineService_setStateAuto__block_invoke(void *a1)
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = (_DWORD *)a1[4];
  int v3 = v2[15];
  if ((_BYTE)v3) {
    BOOL v4 = (v3 & 0xFF00) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    objc_initWeak(location, v2);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__GEOOfflineService_setStateAuto__block_invoke_2;
    v14[3] = &unk_1E53D7B90;
    objc_copyWeak(&v15, location);
    uint64_t v5 = [v14 copy];
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
    return;
  }
  int v8 = v3;
  if (v3 >= 2u)
  {
    if (v3 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        return;
      }
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v8;
      double v12 = MEMORY[0x1E4F14500];
      double v13 = "Unreachable reached: invalid offline mode value %x";
LABEL_19:
      _os_log_fault_impl(&dword_188D96000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)location, 8u);
      return;
    }
    int v9 = BYTE1(v3);
    if (BYTE1(v3) >= 2u)
    {
      if (BYTE1(v3) == 2)
      {
        *(_DWORD *)(*(void *)(a1[5] + 8) + 32) = v2[14];
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
        return;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 67109120;
        HIDWORD(location[0]) = v9;
        double v12 = MEMORY[0x1E4F14500];
        double v13 = "Unreachable reached: invalid offline reason value %x";
        goto LABEL_19;
      }
    }
  }
}

void __45__GEOOfflineService_mapView_viewPortUpdated___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v6 = v2;
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 40));
    long long v3 = *(_OWORD *)(a1 + 72);
    *((_OWORD *)v6 + 2) = *(_OWORD *)(a1 + 56);
    *((_OWORD *)v6 + 3) = v3;
    v6[3] = CFAbsoluteTimeGetCurrent();
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    if (WeakRetained)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      uint64_t v5 = -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 == *(void **)(a1 + 40);
    }
    unsigned __int8 v2 = v6;
  }
}

- (id)_mapViewToUse
{
  id WeakRetained = a1;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    goto LABEL_38;
  }
  geo_assert_isolated();
  if ((unint64_t)[WeakRetained[19] count] <= 1)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
    goto LABEL_38;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = WeakRetained[19];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v3)
  {

    uint64_t v5 = 0;
    goto LABEL_36;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v24;
  double v8 = 2.22507386e-308;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(v2);
      }
      double v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(WeakRetained[19], "objectForKey:", v10, (void)v23);
      double v12 = (double *)v11;
      if (!v5)
      {
LABEL_22:
        if (v12) {
          double v13 = v12[1];
        }
        else {
          double v13 = 0.0;
        }
LABEL_24:
        id v18 = v10;

        uint64_t v19 = v12;
        uint64_t v5 = v19;
        uint64_t v6 = v18;
        double v8 = v13;
        goto LABEL_25;
      }
      if (v11)
      {
        double v13 = *(double *)(v11 + 8);
        if (v13 > v8) {
          goto LABEL_24;
        }
        int v14 = v5 + 3;
        double v15 = *(double *)(v11 + 24) - v5[3];
      }
      else
      {
        double v13 = 0.0;
        if (v8 < 0.0) {
          goto LABEL_24;
        }
        int v14 = v5 + 3;
        double v15 = 0.0 - v5[3];
      }
      if (v15 < 0.0) {
        double v15 = -v15;
      }
      if (v15 >= GEOConfigGetDouble(GeoOfflineConfig_MapViewUpdateMaxDeltaToUseSpan, (uint64_t)off_1E9115A38))
      {
        if (v12) {
          double v17 = v12[3];
        }
        else {
          double v17 = 0.0;
        }
        if (v17 > *v14) {
          goto LABEL_22;
        }
      }
      else
      {
        if (v12) {
          double v16 = v12[6] * v12[7];
        }
        else {
          double v16 = 0.0;
        }
        if (v16 < v5[6] * v5[7]) {
          goto LABEL_22;
        }
      }
LABEL_25:

      ++v9;
    }
    while (v4 != v9);
    uint64_t v20 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v4 = v20;
  }
  while (v20);

  if (v6)
  {
    id WeakRetained = v6;
    long long v21 = WeakRetained;
    goto LABEL_37;
  }
LABEL_36:
  id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 18);
  long long v21 = 0;
LABEL_37:

LABEL_38:

  return WeakRetained;
}

- (void)startServiceIfEnabled
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEOOfflineService_startServiceIfEnabled__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)registerMapView:(id)a3 withPriority:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v9 = 141558530;
    *(void *)&v9[4] = 1752392040;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "registering map view: %{mask.hash}@ at %f", v9, 0x20u);
  }

  *(void *)uint64_t v9 = self->_applicationStateIsolater;
  _geo_isolate_lock_data();
  double v8 = [(NSMapTable *)self->_registeredMapViews objectForKey:v6];
  if (v8
    || (double v8 = objc_alloc_init(_GEOOfflineServiceMapViewMetaData),
        [(NSMapTable *)self->_registeredMapViews setObject:v8 forKey:v6],
        v8))
  {
    v8->priority = a4;
  }
  _geo_isolate_unlock();
}

void __57__GEOOfflineService_mapView_viewPortUpdated_showingGrid___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v7 = v2;
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 40));
    long long v3 = *(_OWORD *)(a1 + 72);
    *((_OWORD *)v7 + 2) = *(_OWORD *)(a1 + 56);
    *((_OWORD *)v7 + 3) = v3;
    v7[3] = CFAbsoluteTimeGetCurrent();
    uint64_t v4 = 1;
    if (*(unsigned char *)(a1 + 88)) {
      uint64_t v4 = 2;
    }
    *((void *)v7 + 2) = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    if (WeakRetained)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      id v6 = -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6 == *(void **)(a1 + 40);
    }
    id v2 = v7;
  }
}

- (void)mapView:(id)a3 viewPortUpdated:(id)a4 showingGrid:(BOOL)a5
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = a3;
  geo_isolate_sync_data();
  if (*((unsigned char *)v8 + 24)) {
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
  }

  _Block_object_dispose(&v7, 8);
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[GEOOfflineService _switchToState:waitForReply:](WeakRetained, WeakRetained[1], 1);
    id WeakRetained = v2;
  }
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[GEOOfflineService _updateSubscribedRegions]((uint64_t)WeakRetained);
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v7 = [WeakRetained state];
    double v8 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v3 userInfo];
      char v10 = GEOOfflineStateAsString(v7);
      *(_DWORD *)buf = 138543618;
      double v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "Offline availability updated (%{public}@). Changing state to: %{public}@", buf, 0x16u);
    }
    id v11 = [v3 userInfo];
    __int16 v12 = [v11 objectForKeyedSubscript:@"overall_changed"];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__GEOOfflineService__goActiveOnQueue__block_invoke_36;
      block[3] = &unk_1E53D7B90;
      objc_copyWeak(&v15, v4);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v15);
    }
  }
}

void __37__GEOOfflineService__goActiveOnQueue__block_invoke_36(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"GEOOfflineStateChangedNotification" object:WeakRetained];
}

- (GEOOfflineService)initWithPreferredAuditToken:(id)a3
{
  return (GEOOfflineService *)-[GEOOfflineService initWithSubscriptionManager:preferredAuditToken:]((id *)&self->super.isa, a3);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t serviceState = self->_serviceState;
  if (serviceState)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = "Shutdown";
      if (serviceState == 1) {
        uint64_t v4 = "Inactive";
      }
      if (serviceState == 2) {
        uint64_t v4 = "Active";
      }
      *(_DWORD *)buf = 134218242;
      unsigned int v7 = self;
      __int16 v8 = 2082;
      uint64_t v9 = v4;
      _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "dealloc called on %p while still in %{public}s state", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _serviceState == ServiceStateShutdown", buf, 2u);
    }
    -[GEOOfflineService _goInactiveOnQueue:canWait:]((uint64_t)self, 0, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineService;
  [(GEOOfflineService *)&v5 dealloc];
}

- (void)_goInactiveOnQueue:(int)a3 canWait:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1 || *(void *)(a1 + 8) == a2) {
    return;
  }
  id v6 = GEOGetOfflineServiceLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 == 1)
  {
    if (v7)
    {
      __int16 v8 = "NO";
      if (a3) {
        __int16 v8 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = v8;
      uint64_t v9 = "Deactivating service, canWait: %s";
LABEL_12:
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else if (v7)
  {
    uint64_t v10 = "NO";
    if (a3) {
      uint64_t v10 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v36 = v10;
    uint64_t v9 = "Shutting down service, canWait: %s";
    goto LABEL_12;
  }

  -[GEOOfflineService _switchToState:waitForReply:]((void *)a1, a2, a3);
  GEOUnregisterStateCaptureLegacy();
  if (!a2)
  {
    int v11 = *(_DWORD *)(a1 + 40);
    if (v11 != -1)
    {
      notify_cancel(v11);
      *(_DWORD *)(a1 + 40) = -1;
    }
    [*(id *)(a1 + 160) close];
  }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __48__GEOOfflineService__goInactiveOnQueue_canWait___block_invoke;
  uint64_t v32 = &unk_1E53D79D8;
  uint64_t v33 = a1;
  geo_isolate_sync_data();
  int v12 = *(_DWORD *)(a1 + 44);
  if (v12 != -1)
  {
    notify_cancel(v12);
    *(_DWORD *)(a1 + 44) = -1;
  }
  if (*(void *)(a1 + 48))
  {
    int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 removeObserver:*(void *)(a1 + 48)];
  }
  uint64_t v14 = *(NSObject **)(a1 + 96);
  if (v14)
  {
    dispatch_source_cancel(v14);
    id v15 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;
  }
  -[GEOOfflineService _stopCheckingConnectivity](a1);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v16 = objc_msgSend(*(id *)(a1 + 72), "allValues", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * v20);
        if (v21) {
          int v22 = *(void **)(v21 + 16);
        }
        else {
          int v22 = 0;
        }
        [v22 removeObserver:a1 forKeyPath:@"loadState" context:_KVOContext_0];
        ++v20;
      }
      while (v18 != v20);
      uint64_t v23 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
      uint64_t v18 = v23;
    }
    while (v23);
  }

  long long v24 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;
}

uint64_t __48__GEOOfflineService__goInactiveOnQueue_canWait___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = 0;
  return result;
}

- (void)_stopCheckingConnectivity
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    id v2 = *(NSObject **)(a1 + 104);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;
    }
  }
}

- (void)shutdownService
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GEOOfflineService_shutdownService__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__GEOOfflineService_shutdownService__block_invoke(uint64_t a1)
{
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v33[12] = *MEMORY[0x1E4F143B8];
  int subscriptionsChangedNotifyToken = self->_subscriptionsChangedNotifyToken;
  BOOL v5 = self->_daemonLaunchNotifyToken == -1;
  long long v26 = @"daemonLaunch";
  long long v27 = @"subscriptionChange";
  if (v5) {
    id v6 = @"NO";
  }
  else {
    id v6 = @"YES";
  }
  if (subscriptionsChangedNotifyToken == -1) {
    BOOL v7 = @"NO";
  }
  else {
    BOOL v7 = @"YES";
  }
  uint64_t v29 = v6;
  uint64_t v30 = v7;
  long long v28 = @"offlineAvailability";
  if (self->_offlineAvailabilityObserver) {
    __int16 v8 = @"YES";
  }
  else {
    __int16 v8 = @"NO";
  }
  uint64_t v31 = v8;
  v32[0] = @"listeners";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v26 count:3];
  v33[0] = v9;
  v32[1] = @"geodConnected";
  if ([(GEOXPCConnection *)self->_connection isConnected]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  v33[1] = v10;
  v32[2] = @"savedState";
  int v11 = GEOOfflineStateAsString(self->_savedState.raw);
  v33[2] = v11;
  v32[3] = @"state";
  int v12 = GEOOfflineStateAsString(self->_state.raw);
  v33[3] = v12;
  v32[4] = @"numSubscriptions";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSDictionary count](self->_localSubscriptionInfos, "count"));
  uint64_t v14 = (void *)v13;
  heartbeatTimer = self->_heartbeatTimer;
  if (self->_updateCoalescingTimer) {
    double v16 = @"YES";
  }
  else {
    double v16 = @"NO";
  }
  v33[4] = v13;
  v33[5] = v16;
  v32[5] = @"updateTimer";
  v32[6] = @"heartbeatTimer";
  if (heartbeatTimer) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  if (self->_connectivityCheckTimer) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  v33[6] = v17;
  v33[7] = v18;
  v32[7] = @"connectivityTimer";
  v32[8] = @"delegate";
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  v33[8] = v20;
  v32[9] = @"delegateInformedState";
  uint64_t v21 = GEOOfflineModeAsString(self->_delegateInformedMode);
  v33[9] = v21;
  v32[10] = @"suggestedState";
  int v22 = GEOOfflineSuggestedStateAsString(self->_suggestedState);
  v33[10] = v22;
  v32[11] = @"registeredMapViews";
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMapTable count](self->_registeredMapViews, "count"));
  v33[11] = v23;
  long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:12];

  return v24;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __33__GEOOfflineService_setDelegate___block_invoke;
  uint64_t v14 = &unk_1E53DBF38;
  uint64_t v17 = v19;
  id v15 = self;
  id v16 = v4;
  uint64_t v18 = v21;
  geo_isolate_sync_data();
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__GEOOfflineService_setDelegate___block_invoke_2;
  v7[3] = &unk_1E53DC410;
  v7[4] = self;
  id v8 = v16;
  uint64_t v9 = v19;
  uint64_t v10 = v21;
  id v6 = v16;
  dispatch_async(workQueue, v7);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __33__GEOOfflineService_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = WeakRetained != 0;

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  id v4 = *(id *)(a1 + 40);

  if (v3 != v4)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __33__GEOOfflineService_setDelegate___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 8) == 2)
  {
    if (a1[5])
    {
      if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
        -[GEOOfflineService _stopCheckingConnectivity](v2);
      }
    }
    else if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)v2);
    }
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      -[GEOOfflineService _fetchCurrentState]((void *)a1[4]);
      uint64_t v3 = a1[4];
      -[GEOOfflineService _setStateNeedsUpdate](v3);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  void v7[5] = MEMORY[0x1E4F143A8];
  v7[6] = 3221225472;
  v7[7] = __36__GEOOfflineService_removeDelegate___block_invoke;
  v7[8] = &unk_1E53D7BD8;
  v7[9] = self;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  geo_isolate_sync_data();
  if (*((unsigned char *)v11 + 24))
  {
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__GEOOfflineService_removeDelegate___block_invoke_2;
    v7[3] = &unk_1E53D79D8;
    v7[4] = self;
    dispatch_async(workQueue, v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __36__GEOOfflineService_removeDelegate___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 128));
  id v3 = (id)a1[5];

  if (WeakRetained == v3)
  {
    objc_storeWeak((id *)(a1[4] + 128), 0);
    *(unsigned char *)(a1[4] + 136) = 0;
    *(void *)(a1[4] + 120) = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __36__GEOOfflineService_removeDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 8) == 2)
  {
    -[GEOOfflineService _startCheckingConnectivity]((dispatch_queue_t *)result);
    -[GEOOfflineService _fetchCurrentState](*(void **)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 32);
    return -[GEOOfflineService _setStateNeedsUpdate](v3);
  }
  return result;
}

- (GEOOfflineServiceDelegate)delegate
{
  id v5 = self->_applicationStateIsolater;
  _geo_isolate_lock_data();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  _geo_isolate_unlock();

  return (GEOOfflineServiceDelegate *)WeakRetained;
}

- (void)unregisterMapView:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "UNregistering map view: %{mask.hash}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v8 = 0;
  id v6 = v4;
  geo_isolate_sync_data();
  if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __39__GEOOfflineService_unregisterMapView___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 == v3;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(*(void *)(a1 + 40) + 152);

  return [v5 removeObjectForKey:v4];
}

- (void)_setState:(uint64_t)a1 ifStateIs:(unsigned int)a2
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a2 < 2u) {
    goto LABEL_6;
  }
  if (a2 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v31 = 67109120;
      *(_DWORD *)&v31[4] = a2;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", v31, 8u);
    }
LABEL_6:
    if (BYTE1(a2) >= 2u)
    {
      if (BYTE1(a2) == 2) {
        return;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v31 = 67109120;
        *(_DWORD *)&v31[4] = BYTE1(a2);
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline reason value %x", v31, 8u);
      }
    }
  }
  uint64_t v4 = [[GEOOfflineServiceSetStateRequest alloc] initWithTraits:0 auditToken:*(void *)(a1 + 16) throttleToken:0];
  *(void *)uint64_t v31 = 0;
  uint64_t v32 = v31;
  uint64_t v33 = 0x2810000000;
  uint64_t v34 = "";
  int v35 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2810000000;
  v27[3] = "";
  int v28 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __41__GEOOfflineService__setState_ifStateIs___block_invoke;
  id v16 = &unk_1E53E3190;
  unsigned int v22 = a2;
  uint64_t v17 = a1;
  uint64_t v19 = v31;
  char v20 = v27;
  id v5 = v4;
  uint64_t v18 = v5;
  uint64_t v21 = &v23;
  geo_isolate_sync_data();
  if (*((unsigned char *)v24 + 24))
  {
    id v6 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = GEOOfflineStateAsString(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v7;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEFAULT, "Changing state to: %{public}@", buf, 0xCu);
    }
    id v8 = *(id *)(a1 + 160);
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__GEOOfflineService__setState_ifStateIs___block_invoke_115;
    v11[3] = &unk_1E53E31B8;
    unsigned int v12 = a2;
    v11[4] = a1;
    v11[5] = v31;
    [(GEOXPCRequest *)v5 send:v8 withReply:v9 handler:v11];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v31, 8);
}

- (void)setStateForcedOffline
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  char v6 = 0;
  geo_isolate_sync_data();
  if (*((unsigned char *)v4 + 24)) {
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, 0x10202u);
  }
  _Block_object_dispose(&v3, 8);
}

void __42__GEOOfflineService_setStateForcedOffline__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  if (v2[15]) {
    BOOL v3 = (v2[15] & 0xFF00) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    objc_initWeak(&location, v2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__GEOOfflineService_setStateForcedOffline__block_invoke_2;
    v7[3] = &unk_1E53D7B90;
    objc_copyWeak(&v8, &location);
    uint64_t v4 = [v7 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __42__GEOOfflineService_setStateForcedOffline__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStateForcedOffline];
}

- (void)delegatePrefersMode:(unsigned __int8)a3
{
}

- (void)delegatePrefersMode:(unsigned __int8)a3 device:(unsigned __int8)a4
{
  int v4 = a4;
  int v5 = a3;
  BOOL v7 = [(GEOOfflineService *)self delegate];

  if (v7)
  {
    if (v4) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v5 == 2;
    }
    int v9 = (v4 << 16) | 0x100;
    if (v8) {
      int v9 = 65792;
    }
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v9 | v5);
    geo_isolate_sync_data();
  }
}

uint64_t __48__GEOOfflineService_delegatePrefersMode_device___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 136) = *(unsigned char *)(result + 40);
  return result;
}

- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4
{
}

- (void)delegate:(id)a3 prefersMode:(unsigned __int8)a4 device:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  id v9 = [(GEOOfflineService *)self delegate];

  if (v9 == v8)
  {
    if (v5) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v6 == 2;
    }
    int v11 = (v5 << 16) | 0x100;
    if (v10) {
      int v11 = 65792;
    }
    -[GEOOfflineService _setState:ifStateIs:]((uint64_t)self, v11 | v6);
    geo_isolate_sync_data();
  }
}

uint64_t __49__GEOOfflineService_delegate_prefersMode_device___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 136) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __41__GEOOfflineService__setState_ifStateIs___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(*(void *)(result + 32) + 60);
  if (v1 != *(_DWORD *)(result + 72))
  {
    uint64_t v2 = result;
    *(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 32) = v1;
    *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 32) = *(_DWORD *)(*(void *)(result + 32) + 56);
    uint64_t v3 = *(void *)(result + 32);
    int v4 = *(_DWORD *)(v3 + 60);
    int v5 = v4;
    if (v4 >= 2u)
    {
      if (v4 != 2)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_10;
        }
        LODWORD(v10) = 67109120;
        HIDWORD(v10) = v5;
        BOOL v7 = MEMORY[0x1E4F14500];
        id v8 = "Unreachable reached: invalid offline mode value %x";
        goto LABEL_14;
      }
      int v6 = BYTE1(v4);
      if (BYTE1(v4) >= 2u)
      {
        if (BYTE1(v4) == 2)
        {
LABEL_11:
          *(_DWORD *)(v3 + 60) = *(_DWORD *)(v2 + 72);
          objc_msgSend(*(id *)(v2 + 40), "setState:", *(unsigned int *)(*(void *)(v2 + 32) + 60), v10, v11);
          uint64_t result = [*(id *)(v2 + 40) setSavedState:*(unsigned int *)(*(void *)(v2 + 32) + 56)];
          *(unsigned char *)(*(void *)(*(void *)(v2 + 64) + 8) + 24) = 1;
          return result;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          LODWORD(v10) = 67109120;
          HIDWORD(v10) = v6;
          BOOL v7 = MEMORY[0x1E4F14500];
          id v8 = "Unreachable reached: invalid offline reason value %x";
LABEL_14:
          _os_log_fault_impl(&dword_188D96000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 8u);
        }
      }
    }
LABEL_10:
    *(_DWORD *)(*(void *)(v2 + 32) + 56) = *(_DWORD *)(*(void *)(v2 + 32) + 60);
    uint64_t v3 = *(void *)(v2 + 32);
    goto LABEL_11;
  }
  return result;
}

void __41__GEOOfflineService__setState_ifStateIs___block_invoke_115(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = GEOOfflineStateAsString(*(unsigned int *)(a1 + 48));
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Failed to change state to: %{public}@ - %{public}@", buf, 0x16u);
    }
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __41__GEOOfflineService__setState_ifStateIs___block_invoke_116;
    uint64_t v11 = &unk_1E53D7C00;
    long long v12 = *(_OWORD *)(a1 + 32);
    geo_isolate_sync_data();
  }
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v8, v9, v10, v11, v12);
  [v7 postNotificationName:@"GEOOfflineStateChangedNotification" object:*(void *)(a1 + 32)];
}

uint64_t __41__GEOOfflineService__setState_ifStateIs___block_invoke_116(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 60) = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 32);
  *(_DWORD *)(*(void *)(result + 32) + 56) = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 32);
  return result;
}

- (unint64_t)offlineRegionCount
{
  if (self->_state.var0.device == 1) {
    return [(NSDictionary *)self->_localSubscriptionInfos count];
  }
  else {
    return 0;
  }
}

void __45__GEOOfflineService__updateSubscribedRegions__block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)char v20 = 141558530;
      *(void *)&void v20[4] = 1752392040;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v9;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Unable to fetch state for subscription: %{mask.hash}@ - %{public}@", v20, 0x20u);
    }
  }
  uint64_t v10 = [_GEOLocalOfflineSubscriptionInfo alloc];
  uint64_t v11 = [*(id *)(a1 + 32) region];
  id v12 = v11;
  id v13 = v6;
  if (v10)
  {
    *(void *)char v20 = v10;
    *(void *)&v20[8] = _GEOLocalOfflineSubscriptionInfo;
    uint64_t v14 = (_GEOLocalOfflineSubscriptionInfo *)objc_msgSendSuper2((objc_super *)v20, sel_init);
    uint64_t v10 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_region, v11);
      objc_storeStrong((id *)&v10->_state, a2);
      v10->_rect.origin.x = GEOMapRectForMapRegion(v12);
      v10->_rect.origin.y = v15;
      v10->_rect.size.width = v16;
      v10->_rect.size.height = v17;
    }
  }

  uint64_t v18 = *(void **)(a1 + 40);
  uint64_t v19 = [*(id *)(a1 + 32) identifier];
  [v18 setObject:v10 forKeyedSubscript:v19];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_KVOContext_0 == a6)
  {
    -[GEOOfflineService setStateNeedsUpdate]((uint64_t)self);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GEOOfflineService;
    -[GEOOfflineService observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __42__GEOOfflineService__updateSuggestedState__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 120);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = WeakRetained;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 136);
    int v5 = -[GEOOfflineService _mapViewToUse](*(id **)(a1 + 32));
    if (v5)
    {
      uint64_t v9 = v5;
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v5];
      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
        long long v8 = *(_OWORD *)(v6 + 48);
        *(_OWORD *)(v7 + 32) = *(_OWORD *)(v6 + 32);
        *(_OWORD *)(v7 + 48) = v8;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(v6 + 16);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(v6 + 8);
      }

      int v5 = v9;
    }
  }
}

uint64_t __42__GEOOfflineService__updateSuggestedState__block_invoke_141(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 136) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __42__GEOOfflineService__updateSuggestedState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) offlineService:*(void *)(a1 + 32) wouldLikeToSwitchToState:*(unsigned int *)(a1 + 48)];
}

- (uint64_t)_preferredStateForRegion:(void *)a3 inState:(double)a4 withSubscriptions:(double)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = v13;
  if (!a1 || ![v13 count]) {
    goto LABEL_76;
  }
  id v15 = v14;
  if (![v15 count]) {
    goto LABEL_75;
  }
  double Double = GEOConfigGetDouble(GeoOfflineConfig_CoordinateSpanForLowZoomTiles, (uint64_t)off_1E9115788);
  GEOMapRectForCoordinateRegion(a4, a5, a6, a7);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  long long v24 = (char *)malloc_type_calloc(0x20uLL, [v15 count], 0x92AA8A7uLL);
  uint64_t v25 = (char *)malloc_type_calloc(0x20uLL, [v15 count], 0x76B633A2uLL);
  v106 = v24;
  if (!v24 || (char v26 = v25) == 0)
  {
LABEL_75:

    goto LABEL_76;
  }
  if (a6 <= a7) {
    double v27 = a7;
  }
  else {
    double v27 = a6;
  }
  double v105 = v27;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v28 = v15;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v107 objects:v119 count:16];
  if (!v29)
  {
    unsigned __int8 v33 = 0;
    double v75 = 0.0;
    double v76 = 0.0;
LABEL_41:

    LODWORD(v67) = 0;
    goto LABEL_42;
  }
  uint64_t v30 = v29;
  unint64_t v98 = a2;
  v99 = v14;
  unint64_t v31 = 0;
  unint64_t v32 = 0;
  unsigned __int8 v33 = 0;
  uint64_t v34 = *(void *)v108;
  double v35 = 0.0;
  double v36 = INFINITY;
  double v37 = 0.0;
  double v38 = INFINITY;
  double v102 = v23;
  double v103 = v21;
  double v100 = v19;
  double v101 = v17;
  while (2)
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v108 != v34) {
        objc_enumerationMutation(v28);
      }
      uint64_t v40 = *(void **)(*((void *)&v107 + 1) + 8 * i);
      if (![v40 isLoaded]) {
        continue;
      }
      if (v105 > Double)
      {
        v77 = GEOGetOfflineServiceLog();
        double v76 = 1.0;
        double v75 = 0.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v112 = v105;
          v78 = "Viewport spans %.1f degrees and at least one subscription is loaded.";
          v79 = v77;
          uint32_t v80 = 12;
LABEL_39:
          _os_log_impl(&dword_188D96000, v79, OS_LOG_TYPE_DEBUG, v78, buf, v80);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      objc_msgSend(v40, "rect", Double, v105);
      if (GEOMapRectContainsRect(v41, v42, v43, v44, v17, v19, v21, v23))
      {
        v77 = GEOGetOfflineServiceLog();
        double v76 = 1.0;
        double v75 = 0.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v78 = "Found subscription which fully contains current viewport.";
LABEL_38:
          v79 = v77;
          uint32_t v80 = 2;
          goto LABEL_39;
        }
LABEL_40:
        a2 = v98;
        uint64_t v14 = v99;

        unsigned __int8 v33 = [v40 device];
        goto LABEL_41;
      }
      [v40 rect];
      if (GEOMapRectContainsRect(v17, v19, v21, v23, v45, v46, v47, v48))
      {
        v77 = GEOGetOfflineServiceLog();
        double v76 = 0.0;
        double v75 = 1.0;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v78 = "Found subscription which is fully contained by current viewport.";
          goto LABEL_38;
        }
        goto LABEL_40;
      }
      [v40 rect];
      double v55 = GEOMapRectIntersection(v17, v19, v21, v23, v49, v50, v51, v52);
      double v57 = v56;
      double v58 = v53;
      double v59 = fabs(v56);
      if (fabs(v55) != INFINITY && v59 != INFINITY)
      {
        double v61 = v54;
        if (v53 != 0.0 || v54 != 0.0)
        {
          unsigned __int8 v33 = [v40 device];
          [v40 rect];
          double v38 = GEOMapRectUnion(v38, v36, v37, v35, v62, v63);
          double v36 = v64;
          double v37 = v65;
          double v35 = v66;
          unint64_t v67 = v32 + 1;
          v68 = (double *)&v106[32 * v32];
          double *v68 = v55;
          v68[1] = v57;
          v68[2] = v58;
          v68[3] = v61;
          unint64_t v69 = v31 + 1;
          v70 = &v26[32 * v31];
          [v40 rect];
          *(void *)v70 = v71;
          *((void *)v70 + 1) = v72;
          *((void *)v70 + 2) = v73;
          *((void *)v70 + 3) = v74;
          if (v67 > [v28 count])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: intersectingRectsCount <= subscriptionInfos.count", buf, 2u);
            }

            a2 = v98;
            double v23 = v102;
            double v21 = v103;
            double v19 = v100;
            double v17 = v101;
LABEL_73:
            double v95 = GEOMapRectAreaCoveredByMapRects((uint64_t)v106, v67, v17, v19, v21, v23);
            double v96 = GEOMapRectAreaCoveredByMapRects((uint64_t)v26, v69, v38, v36, v37, v35);
            double v76 = v95 / (v21 * v23);
            double v75 = v95 / v96;
            uint64_t v14 = v99;
            goto LABEL_42;
          }
          if (v69 > [v28 count])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: subscriptionRectsCount <= subscriptionInfos.count", buf, 2u);
            }
            unint64_t v31 = v69;
            unint64_t v32 = v67;
            double v23 = v102;
            double v21 = v103;
            double v19 = v100;
            double v17 = v101;
            goto LABEL_71;
          }
          unint64_t v31 = v69;
          unint64_t v32 = v67;
        }
      }
      double v23 = v102;
      double v21 = v103;
      double v19 = v100;
      double v17 = v101;
    }
    uint64_t v30 = [v28 countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v30) {
      continue;
    }
    break;
  }
LABEL_71:

  if (v32)
  {
    unint64_t v67 = v32;
    unint64_t v69 = v31;
    a2 = v98;
    goto LABEL_73;
  }
  LODWORD(v67) = 0;
  double v75 = 0.0;
  double v76 = 0.0;
  a2 = v98;
  uint64_t v14 = v99;
LABEL_42:
  free(v106);
  free(v26);
  v81 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
  {
    v82 = GEOOfflineDeviceAsString(v33);
    *(_DWORD *)buf = 138544130;
    double v112 = *(double *)&v82;
    __int16 v113 = 1024;
    int v114 = v67;
    __int16 v115 = 1024;
    unsigned int v116 = (v76 * 100.0);
    __int16 v117 = 1024;
    unsigned int v118 = (v75 * 100.0);
    _os_log_impl(&dword_188D96000, v81, OS_LOG_TYPE_INFO, "Subscriptions from device %{public}@ with %u intersecting regions have %u%% coverage and %u%% containment with viewport.", buf, 0x1Eu);
  }
  if (v76 != 0.0 || v75 != 0.0)
  {
    BOOL v85 = v75 == 1.0 || v76 == 1.0;
    if (v85 && v33) {
      goto LABEL_55;
    }
    double v87 = 0.0;
    double v88 = 0.0;
    if (a2 <= 2)
    {
      v89 = *(&off_1E53E32E8 + a2);
      v90 = (uint64_t *)off_1E53E3300[a2];
      v91 = *(&off_1E53E3318 + a2);
      v92 = (uint64_t *)off_1E53E3330[a2];
      double v87 = GEOConfigGetDouble(*v89, *v90);
      double v88 = GEOConfigGetDouble(*v91, *v92);
    }
    double v93 = GEOConfigGetDouble(GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOnline, (uint64_t)off_1E9115748);
    double v94 = GEOConfigGetDouble(GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline, (uint64_t)off_1E9115778);
    if (v33)
    {
      if (v76 <= v87 && v75 <= v88)
      {
        uint64_t v84 = 0;
        if (v76 >= v93 || v75 >= v94) {
          goto LABEL_77;
        }
        int v86 = 257;
LABEL_56:
        uint64_t v84 = v86 & 0xFF00FFFF | (v33 << 16);
        goto LABEL_77;
      }
LABEL_55:
      int v86 = 258;
      goto LABEL_56;
    }
LABEL_76:
    uint64_t v84 = 0;
    goto LABEL_77;
  }
  v83 = GEOGetOfflineServiceLog();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v119 = 0;
    _os_log_impl(&dword_188D96000, v83, OS_LOG_TYPE_DEBUG, "No loaded subscriptions intersect current viewport.", v119, 2u);
  }

  uint64_t v84 = 257;
LABEL_77:

  return v84;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)canUseOfflineForCoordinateRegion:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  unint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_CoverageThresholdModeForHelper, (uint64_t)off_1E91157A8);
  v9.double var0 = [+[GEOOfflineService stateManagerClass]() isOfflineAvailableLocally];
  if (v9.var0)
  {
    uint64_t v10 = [(NSDictionary *)self->_localSubscriptionInfos allValues];
    v11.double var0 = -[GEOOfflineService _preferredStateForRegion:inState:withSubscriptions:]((uint64_t)self, UInteger, v10, v6, v5, var0, var1);

    return v11;
  }
  return v9;
}

uint64_t __52__GEOOfflineService__processSubscribedStateChanged___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = 0;
  return result;
}

void __41__GEOOfflineService__procesStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 60) = [*(id *)(a1 + 40) currentState];
  uint64_t v3 = *(void *)(a1 + 32);
  *(_DWORD *)(v3 + 56) = [*(id *)(a1 + 40) savedState];
  uint64_t v4 = MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  double v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

void __41__GEOOfflineService__procesStateChanged___block_invoke_145(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEOOfflineStateChangedNotification" object:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_registeredMapViews, 0);
  objc_destroyWeak((id *)&self->_latestMapView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationStateIsolater, 0);
  objc_storeStrong((id *)&self->_connectivityCheckTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_updateCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localSubscriptionInfos, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong(&self->_offlineAvailabilityObserver, 0);
  objc_storeStrong(&self->_stateUpdateBlock, 0);

  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
}

@end