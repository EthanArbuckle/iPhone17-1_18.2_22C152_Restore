@interface DRSubscriptionManager
+ (id)sharedInstance;
- (BOOL)_hasInitializedSubscriptionForTeamID:(id)a3 cachedConfigOut:(id *)a4 errorOut:(id *)a5;
- (DRSubscriptionManager)init;
- (NSMutableDictionary)perTeamIdConfigState;
- (NSMutableDictionary)perTeamIdMonitors;
- (NSMutableSet)inFlightSubscriptionRequests;
- (OS_dispatch_queue)accessQueue;
- (id)_configFromEvent:(id)a3 teamIdOut:(id *)a4;
- (void)_broadcastErrorForTeamID:(id)a3 error:(id)a4;
- (void)_completeSubscriptionRequestForTeamID:(id)a3 config:(id)a4 event:(id)a5;
- (void)_processNewEvent:(id)a3;
- (void)_requestSubscriptionToTeamIDStream:(id)a3;
- (void)_unsubscribeFromStreamWithTeamID:(id)a3;
- (void)addMonitor:(id)a3;
- (void)removeMonitor:(id)a3;
@end

@implementation DRSubscriptionManager

- (id)_configFromEvent:(id)a3 teamIdOut:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  *a4 = 0;
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    v7 = [NSString stringWithUTF8String:string];
    v8 = xpc_dictionary_get_string(v5, "teamID");
    if (v8)
    {
      v9 = [NSString stringWithUTF8String:v8];
      if ([v7 isEqualToString:v9])
      {
        size_t length = 0;
        data = xpc_dictionary_get_data(v5, "configData", &length);
        if (data)
        {
          v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
          if (v11)
          {
            id v20 = 0;
            v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v20];
            v13 = v20;
            if (v12)
            {
              *a4 = v9;
              id v14 = v12;
            }
            else
            {
              v17 = DPLogHandle_ConfigMonitorError();
              if (os_signpost_enabled(v17))
              {
                v18 = @"Unknown";
                if (v13) {
                  v18 = (__CFString *)v13;
                }
                *(_DWORD *)buf = 138543618;
                v23 = v9;
                __int16 v24 = 2114;
                v25 = v18;
                _os_signpost_emit_with_name_impl(&dword_1DC01F000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Malformed Config data for teamID %{public}@ with error %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            v13 = DPLogHandle_ConfigMonitorError();
            if (os_signpost_enabled(v13))
            {
              *(_DWORD *)buf = 138543362;
              v23 = v9;
              _os_signpost_emit_with_name_impl(&dword_1DC01F000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Event for teamID %{public}@ does not have valid config data", buf, 0xCu);
            }
            v12 = 0;
          }
        }
        else
        {
          v16 = DPLogHandle_ConfigMonitor();
          if (os_signpost_enabled(v16))
          {
            *(_DWORD *)buf = 138543362;
            v23 = v9;
            _os_signpost_emit_with_name_impl(&dword_1DC01F000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoActiveConfig", "No active config for teamID %{public}@", buf, 0xCu);
          }

          v12 = 0;
          *a4 = v9;
        }
        goto LABEL_30;
      }
      v15 = DPLogHandle_ConfigMonitorError();
      if (os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v7;
        __int16 v24 = 2114;
        v25 = v9;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Event name %{public}@ doesn't match teamID %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v9 = DPLogHandle_ConfigMonitorError();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Got an object with no teamID value", buf, 2u);
      }
    }
    v12 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v7 = DPLogHandle_ConfigMonitorError();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidEventObject", "Got an object with no name", buf, 2u);
  }
  v12 = 0;
LABEL_31:

  return v12;
}

void __29__DRSubscriptionManager_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _processNewEvent:v3];
}

- (BOOL)_hasInitializedSubscriptionForTeamID:(id)a3 cachedConfigOut:(id *)a4 errorOut:(id *)a5
{
  id v8 = a3;
  v9 = [(DRSubscriptionManager *)self perTeamIdConfigState];
  v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      id v12 = 0;
      *a5 = v11;
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];

      *a5 = 0;
      if (v10 == v13) {
        id v12 = 0;
      }
      else {
        id v12 = v10;
      }
    }
  }
  else
  {
    id v12 = 0;
    *a5 = 0;
  }
  *a4 = v12;

  return v10 != 0;
}

- (DRSubscriptionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)DRSubscriptionManager;
  v2 = [(DRSubscriptionManager *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DRSubscriptionManager access queue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    perTeamIdMonitors = v2->_perTeamIdMonitors;
    v2->_perTeamIdMonitors = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    perTeamIdConfigState = v2->_perTeamIdConfigState;
    v2->_perTeamIdConfigState = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    inFlightSubscriptionRequests = v2->_inFlightSubscriptionRequests;
    v2->_inFlightSubscriptionRequests = (NSMutableSet *)v9;

    objc_initWeak(&location, v2);
    id v11 = [(DRSubscriptionManager *)v2 accessQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __29__DRSubscriptionManager_init__block_invoke;
    v13[3] = &unk_1E6C2ADE8;
    objc_copyWeak(&v14, &location);
    xpc_set_event_stream_handler("com.apple.diagnosticpipeline.taskingevents", v11, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_completeSubscriptionRequestForTeamID:(id)a3 config:(id)a4 event:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(DRSubscriptionManager *)self inFlightSubscriptionRequests];
  [v9 removeObject:v7];

  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  id v11 = v10;
  id v12 = [(DRSubscriptionManager *)self perTeamIdConfigState];
  [v12 setObject:v11 forKeyedSubscript:v7];

  v13 = [(DRSubscriptionManager *)self perTeamIdMonitors];
  id v14 = [v13 objectForKey:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19++), "_handleCurrentConfig:error:forceBroadcast:", v8, 0, 1, (void)v21);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v17);
  }

  id v20 = DPLogHandle_ConfigMonitor();
  if (os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v7;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EstablishedNewSubscription", "Successfully established subscription for %{public}@", buf, 0xCu);
  }
}

- (void)_requestSubscriptionToTeamIDStream:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DPLogHandle_ConfigMonitor();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StreamSubscribeRequest", "Subscribing to teamID %{public}@ event stream", buf, 0xCu);
  }

  v6 = [(DRSubscriptionManager *)self inFlightSubscriptionRequests];
  [v6 addObject:v4];

  id v7 = v4;
  [v7 UTF8String];
  uint64_t v8 = xpc_copy_event();
  if (v8)
  {
    xpc_object_t v9 = (xpc_object_t)v8;
    id v10 = DPLogHandle_ConfigMonitorError();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PreExistingSubscription", "Already subscribed for teamID %{public}@. Requesting a refresh of state", buf, 0xCu);
    }

    id v20 = 0;
    char v11 = _DPCRequestTeamIDBroadcast(v7, &v20);
    id v12 = (__CFString *)v20;
    if ((v11 & 1) == 0)
    {
      v13 = DPLogHandle_ConfigMonitorError();
      if (os_signpost_enabled(v13))
      {
        id v14 = @"Unknown";
        if (v12) {
          id v14 = v12;
        }
        *(_DWORD *)buf = 138543618;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v14;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestError", "Request to re-broadcast teamID %{public}@ failed due to error: %{public}@", buf, 0x16u);
      }

      if (!v12)
      {
        id v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        long long v22 = @"Unknown error";
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        id v12 = [v15 errorWithDomain:@"DRConfigMonitorError" code:0 userInfo:v16];

        uint64_t v17 = [(DRSubscriptionManager *)self perTeamIdConfigState];
        [v17 setObject:v12 forKeyedSubscript:v7];
      }
      [(DRSubscriptionManager *)self _broadcastErrorForTeamID:v7 error:v12];
    }
  }
  else
  {
    uint64_t v18 = DPLogHandle_ConfigMonitor();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewStreamSubscribe", "Subscribing to teamID %{public}@ event stream (no previously existing subscription)", buf, 0xCu);
    }

    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    id v19 = v7;
    xpc_dictionary_set_string(v9, "teamID", (const char *)[v19 UTF8String]);
    [v19 UTF8String];
    xpc_set_event();
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_manager;

  return v2;
}

void __39__DRSubscriptionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DRSubscriptionManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

  v2 = DPLogHandle_ConfigMonitor();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)dispatch_queue_t v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriptionManagerSingletonInit", (const char *)&unk_1DC03206D, v3, 2u);
  }
}

- (void)_processNewEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = 0;
  uint64_t v5 = [(DRSubscriptionManager *)self _configFromEvent:v4 teamIdOut:&v29];
  id v6 = v29;
  if (v6)
  {
    id v27 = 0;
    id v28 = 0;
    BOOL v7 = [(DRSubscriptionManager *)self _hasInitializedSubscriptionForTeamID:v6 cachedConfigOut:&v28 errorOut:&v27];
    id v8 = v28;
    id v9 = v27;
    if (v7)
    {
      if (v5)
      {
        id v10 = v5;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F1CA98] null];
      }
      v13 = v10;
      id v14 = [(DRSubscriptionManager *)self perTeamIdConfigState];
      [v14 setObject:v13 forKeyedSubscript:v6];

      id v15 = [(DRSubscriptionManager *)self perTeamIdMonitors];
      uint64_t v16 = [v15 objectForKey:v6];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "_handleCurrentConfig:error:forceBroadcast:", v5, 0, 0, (void)v23);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v19);
      }

      long long v22 = DPLogHandle_ConfigMonitor();
      if (os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138543362;
        id v32 = v6;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingEvent", "Successfully processed an event for already established subscription for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      [(DRSubscriptionManager *)self _completeSubscriptionRequestForTeamID:v6 config:v5 event:v4];
    }
  }
  else
  {
    char v11 = (void *)MEMORY[0x1E0198330](v4);
    id v12 = DPLogHandle_ConfigMonitor();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 136446210;
      id v32 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingEventFailed", "Failed to process event %{public}s", buf, 0xCu);
    }

    if (v11) {
      free(v11);
    }
  }
}

- (void)_broadcastErrorForTeamID:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(DRSubscriptionManager *)self perTeamIdMonitors];
  id v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) _handleCurrentConfig:0 error:v7 forceBroadcast:1];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addMonitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DRSubscriptionManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__DRSubscriptionManager_addMonitor___block_invoke;
  v7[3] = &unk_1E6C2AE10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __36__DRSubscriptionManager_addMonitor___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) perTeamIdMonitors];
  dispatch_queue_t v3 = [*(id *)(a1 + 40) teamID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v5 = [*(id *)(a1 + 32) perTeamIdMonitors];
    id v6 = [*(id *)(a1 + 40) teamID];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  if (![v4 containsObject:*(void *)(a1 + 40)])
  {
    [v4 addObject:*(void *)(a1 + 40)];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) teamID];
    id v18 = 0;
    id v19 = 0;
    char v12 = [v10 _hasInitializedSubscriptionForTeamID:v11 cachedConfigOut:&v19 errorOut:&v18];
    id v9 = v19;
    id v7 = v18;

    if ((v12 & 1) != 0
      || ([*(id *)(a1 + 32) inFlightSubscriptionRequests],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 40) teamID],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v13 containsObject:v14],
          v14,
          v13,
          (v15 & 1) != 0))
    {
      [*(id *)(a1 + 40) _handleCurrentConfig:v9 error:v7 forceBroadcast:1];
    }
    else
    {
      long long v16 = *(void **)(a1 + 32);
      long long v17 = [*(id *)(a1 + 40) teamID];
      [v16 _requestSubscriptionToTeamIDStream:v17];
    }
    goto LABEL_10;
  }
  id v7 = DPLogHandle_ConfigMonitorError();
  if (os_signpost_enabled(v7))
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v8 teamID];
    *(_DWORD *)buf = 134349314;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RedundantMonitorAdd", "%{public}p with teamID %{public}@ already added to subscription manager", buf, 0x16u);
LABEL_10:
  }
}

- (void)_unsubscribeFromStreamWithTeamID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = DPLogHandle_ConfigMonitor();
  if (os_signpost_enabled(v5))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StreamUnsubscribe", "Unsubscribing from teamID %{public}@ event stream", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(DRSubscriptionManager *)self inFlightSubscriptionRequests];
  [v6 removeObject:v4];

  id v7 = [(DRSubscriptionManager *)self perTeamIdMonitors];
  [v7 removeObjectForKey:v4];

  id v8 = [(DRSubscriptionManager *)self perTeamIdConfigState];
  [v8 removeObjectForKey:v4];

  id v9 = v4;
  [v9 UTF8String];
  xpc_set_event();
}

- (void)removeMonitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DRSubscriptionManager *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__DRSubscriptionManager_removeMonitor___block_invoke;
  v7[3] = &unk_1E6C2AE10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__DRSubscriptionManager_removeMonitor___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) perTeamIdMonitors];
  dispatch_queue_t v3 = [*(id *)(a1 + 40) teamID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    int v10 = DPLogHandle_ConfigMonitor();
    if (os_signpost_enabled(v10))
    {
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = [v11 teamID];
      int v17 = 134349314;
      id v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemoveMonitorFailure_UnknownTeam", "WARNING: Failed to remove %{public}p with teamID %{public}@ (unknown teamID)", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_12;
  }
  if ([v4 containsObject:*(void *)(a1 + 40)])
  {
    [v4 removeObject:*(void *)(a1 + 40)];
    uint64_t v5 = DPLogHandle_ConfigMonitor();
    if (!os_signpost_enabled(v5)) {
      goto LABEL_10;
    }
    id v6 = *(void **)(a1 + 40);
    id v7 = [v6 teamID];
    int v17 = 134349314;
    id v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    id v8 = "RemovedMonitor";
    id v9 = "Remove %{public}p with teamID %{public}@";
  }
  else
  {
    uint64_t v5 = DPLogHandle_ConfigMonitor();
    if (!os_signpost_enabled(v5)) {
      goto LABEL_10;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    id v7 = [v13 teamID];
    int v17 = 134349314;
    id v18 = v13;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    id v8 = "RemoveMonitorFailure_UnknownMonitor";
    id v9 = "WARNING: %{public}p with teamID %{public}@ not tracked";
  }
  _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v8, v9, (uint8_t *)&v17, 0x16u);

LABEL_10:
  long long v14 = [v4 allObjects];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    long long v16 = *(void **)(a1 + 32);
    int v10 = [*(id *)(a1 + 40) teamID];
    [v16 _unsubscribeFromStreamWithTeamID:v10];
LABEL_12:
  }
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableDictionary)perTeamIdMonitors
{
  return self->_perTeamIdMonitors;
}

- (NSMutableDictionary)perTeamIdConfigState
{
  return self->_perTeamIdConfigState;
}

- (NSMutableSet)inFlightSubscriptionRequests
{
  return self->_inFlightSubscriptionRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightSubscriptionRequests, 0);
  objc_storeStrong((id *)&self->_perTeamIdConfigState, 0);
  objc_storeStrong((id *)&self->_perTeamIdMonitors, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end