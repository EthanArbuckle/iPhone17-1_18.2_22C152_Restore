@interface DRSTaskingEventPublisher
+ (BOOL)_isFirst;
- (DRSConfigPersistedStore)configStore;
- (DRSTaskingEventPublisher)initWithConfigStore:(id)a3;
- (NSMutableSet)subscribers;
- (OS_dispatch_queue)workQueue;
- (OS_xpc_event_publisher)publisher;
- (id)_activeConfigForTeamID:(id)a3 errorOut:(id *)a4;
- (void)_addSubscriber:(unint64_t)a3 descriptor:(id)a4 isOldSubscriber:(BOOL)a5;
- (void)_publishNotification:(id)a3 config:(id)a4;
- (void)_removeSubscriber:(unint64_t)a3;
- (void)publishConfigUpdateForTeamID:(id)a3 state:(unsigned __int8)a4 config:(id)a5;
- (void)publishCurrentConfigForTeamID:(id)a3;
@end

@implementation DRSTaskingEventPublisher

- (id)_activeConfigForTeamID:(id)a3 errorOut:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"(state == %u) AND (teamID == %@)", 2, v6];
  v8 = [(DRSTaskingEventPublisher *)self configStore];
  v9 = [v8 configMetadatasForPredicate:v7 sortDescriptors:0 fetchLimit:0 errorOut:a4];

  if (*a4)
  {
    v10 = DPLogHandle_ServiceEventPublisherError();
    if (os_signpost_enabled(v10))
    {
      id v11 = *a4;
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = (uint64_t)v6;
      __int16 v31 = 2114;
      id v32 = v11;
      v12 = "ConfigMetadataForStateTeamFailed";
      v13 = "Could not fetch active configs metadatas for teamID %{public}@ due to error %{public}@";
LABEL_4:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, 0x16u);
      goto LABEL_5;
    }
    goto LABEL_5;
  }
  if (v9 && [v9 count])
  {
    if ((unint64_t)[v9 count] < 2)
    {
      v10 = [v9 firstObject];
      v19 = [v10 config];
      v14 = v19;
      if (v19)
      {
        id v20 = v19;
      }
      else
      {
        v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v25 = *MEMORY[0x263F08320];
        v26 = @"Metadata with nil config";
        v22 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *a4 = [v21 errorWithDomain:@"DRSTaskingEventPublisherError" code:0 userInfo:v22];

        v23 = DPLogHandle_ServiceEventPublisherError();
        if (os_signpost_enabled(v23))
        {
          v24 = [v10 configUUID];
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = (uint64_t)v6;
          __int16 v31 = 2114;
          id v32 = v24;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ActiveMetadataMissingConfig", "Metadata for teamID %{public}@ (%{public}@) missing config", buf, 0x16u);
        }
      }

      goto LABEL_6;
    }
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28 = @"More than 1 active config";
    v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *a4 = [v15 errorWithDomain:@"DRSTaskingEventPublisherError" code:0 userInfo:v16];

    v10 = DPLogHandle_ServiceEventPublisherError();
    if (os_signpost_enabled(v10))
    {
      uint64_t v17 = [v9 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = v17;
      __int16 v31 = 2114;
      id v32 = v6;
      v12 = "MultipleActiveConfigs";
      v13 = "Found %lu active configs for teamID %{public}@";
      goto LABEL_4;
    }
LABEL_5:
    v14 = 0;
LABEL_6:

    goto LABEL_13;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)_publishNotification:(id)a3 config:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = [v6 teamID];
  xpc_dictionary_set_string(v8, "teamID", (const char *)[v9 UTF8String]);

  if (!v7) {
    goto LABEL_4;
  }
  id v25 = 0;
  v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v25];
  id v11 = v25;
  if (v10)
  {
    id v12 = v10;
    xpc_dictionary_set_data(v8, "configData", (const void *)[v12 bytes], objc_msgSend(v12, "length"));

LABEL_4:
    v13 = DPLogHandle_ServiceEventPublisher();
    if (os_signpost_enabled(v13))
    {
      uint64_t v14 = [v6 token];
      v15 = [v6 teamID];
      uint64_t v16 = [v7 configUUID];
      uint64_t v17 = (void *)v16;
      v18 = @"(None)";
      *(_DWORD *)buf = 134349570;
      uint64_t v27 = v14;
      if (v16) {
        v18 = (__CFString *)v16;
      }
      __int16 v28 = 2114;
      v29 = v15;
      __int16 v30 = 2114;
      __int16 v31 = v18;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigNotification", "Notifying subscription %{public}#llx with team ID %{public}@ of current config %{public}@", buf, 0x20u);
    }
    id v11 = [(DRSTaskingEventPublisher *)self publisher];
    [v6 token];
    xpc_event_publisher_fire();
    goto LABEL_14;
  }
  v19 = DPLogHandle_ServiceEventPublisherError();
  if (os_signpost_enabled(v19))
  {
    id v20 = [v7 configUUID];
    v21 = [v7 teamID];
    uint64_t v22 = [v11 localizedDescription];
    v23 = (void *)v22;
    v24 = @"Unknown";
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = (uint64_t)v20;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    __int16 v28 = 2114;
    v29 = v21;
    __int16 v30 = 2114;
    __int16 v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigSerializationFailed", "Could not serialize config %{public}@ with teamID %{public}@ due to error %{public}@", buf, 0x20u);
  }
LABEL_14:
}

- (void)publishConfigUpdateForTeamID:(id)a3 state:(unsigned __int8)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(DRSTaskingEventPublisher *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__DRSTaskingEventPublisher_publishConfigUpdateForTeamID_state_config___block_invoke;
  v13[3] = &unk_263FCA1B0;
  unsigned __int8 v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

void __70__DRSTaskingEventPublisher_publishConfigUpdateForTeamID_state_config___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = DPLogHandle_ServiceEventPublisher();
  if (os_signpost_enabled(v2))
  {
    v3 = DRConfigStringForState();
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishConfigUpdate", "Publishing new config state: %{public}@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "subscribers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 teamID];
        int v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

        if (v11) {
          [*(id *)(a1 + 32) _publishNotification:v9 config:*(void *)(a1 + 48)];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)publishCurrentConfigForTeamID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DRSTaskingEventPublisher *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__DRSTaskingEventPublisher_publishCurrentConfigForTeamID___block_invoke;
  v7[3] = &unk_263FC9D08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__DRSTaskingEventPublisher_publishCurrentConfigForTeamID___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = DPLogHandle_ServiceEventPublisher();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishCurrentConfig", "Publishing current config for teamID: %{public}@", buf, 0xCu);
  }

  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [*(id *)(a1 + 40) subscribers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int v11 = [v10 teamID];
        int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

        if (v12) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v14 = *(void *)(a1 + 32);
    long long v13 = *(void **)(a1 + 40);
    id v27 = 0;
    long long v15 = [v13 _activeConfigForTeamID:v14 errorOut:&v27];
    id v16 = v27;
    if (v16)
    {
      uint64_t v17 = DPLogHandle_ServiceEventPublisher();
      if (os_signpost_enabled(v17))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v18;
        __int16 v35 = 2114;
        id v36 = v16;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublishCurrentConfigError", "Error getting config for teamID: %{public}@: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v17 = v4;
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(a1 + 40), "_publishNotification:config:", *(void *)(*((void *)&v23 + 1) + 8 * j), v15, (void)v23);
          }
          uint64_t v20 = [v17 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }
        while (v20);
      }
    }
  }
}

+ (BOOL)_isFirst
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DRSTaskingEventPublisher__isFirst__block_invoke;
  block[3] = &unk_263FC97E8;
  block[4] = &v5;
  if (_isFirst_onceToken != -1) {
    dispatch_once(&_isFirst_onceToken, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__DRSTaskingEventPublisher__isFirst__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (DRSTaskingEventPublisher)initWithConfigStore:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(id)objc_opt_class() _isFirst])
  {
    v28.receiver = self;
    v28.super_class = (Class)DRSTaskingEventPublisher;
    uint64_t v6 = [(DRSTaskingEventPublisher *)&v28 init];
    if (v6)
    {
      dispatch_queue_t v7 = dispatch_queue_create("DRSTaskingEventPublisher work queue", 0);
      workQueue = v6->_workQueue;
      v6->_workQueue = (OS_dispatch_queue *)v7;

      uint64_t v9 = [MEMORY[0x263EFF9C0] set];
      subscribers = v6->_subscribers;
      v6->_subscribers = (NSMutableSet *)v9;

      objc_storeStrong((id *)&v6->_configStore, a3);
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      int v12 = [(DRSTaskingEventPublisher *)v6 workQueue];
      uint64_t v13 = xpc_event_publisher_create();
      publisher = v6->_publisher;
      v6->_publisher = (OS_xpc_event_publisher *)v13;

      objc_initWeak(&location, v6);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v30 = 0x2020000000;
      char v31 = 1;
      long long v15 = [(DRSTaskingEventPublisher *)v6 publisher];
      uint64_t v24 = MEMORY[0x263EF8330];
      long long v25 = v11;
      objc_copyWeak(&v26, &location);
      xpc_event_publisher_set_handler();

      id v16 = [(DRSTaskingEventPublisher *)v6 publisher];
      xpc_event_publisher_set_error_handler();

      uint64_t v17 = [(DRSTaskingEventPublisher *)v6 publisher];
      xpc_event_publisher_activate();

      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      objc_destroyWeak(&v26);

      _Block_object_dispose(&buf, 8);
      objc_destroyWeak(&location);
    }
    uint64_t v18 = DPLogHandle_ServiceEventPublisher();
    if (os_signpost_enabled(v18))
    {
      uint64_t v19 = [(DRSTaskingEventPublisher *)v6 subscribers];
      uint64_t v20 = [v19 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublisherInitialized", "Publisher initialization completed (%lu subscribers)", (uint8_t *)&buf, 0xCu);
    }
    self = v6;
    uint64_t v21 = self;
  }
  else
  {
    uint64_t v22 = DPLogHandle_ServiceEventPublisher();
    if (os_signpost_enabled(v22))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThereCanBeOnlyOnePublisher", "Only one publisher can be instantiated in a given process lifetime", (uint8_t *)&buf, 2u);
    }

    uint64_t v21 = 0;
  }

  return v21;
}

void __48__DRSTaskingEventPublisher_initWithConfigStore___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  char v8 = v7;
  if (a2)
  {
    if (a2 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained _removeSubscriber:a3];
    }
    else if (a2 == 2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x21050E380](v7);
    v10 = DPLogHandle_ServiceEventPublisher();
    if (os_signpost_enabled(v10))
    {
      int v13 = 136446210;
      uint64_t v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NewSubscriptionDescriptor", "Descriptor: %{public}s", (uint8_t *)&v13, 0xCu);
    }

    if (v9) {
      free(v9);
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 48));
    [v11 _addSubscriber:a3 descriptor:v8 isOldSubscriber:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
}

void __48__DRSTaskingEventPublisher_initWithConfigStore___block_invoke_45()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = DPLogHandle_ServiceEventPublisherError();
  if (os_signpost_enabled(v0))
  {
    int v3 = 136446210;
    uint64_t v4 = xpc_strerror();
    _os_signpost_emit_with_name_impl(&dword_209E70000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PublisherError", "Publisher error: %{public}s. Crashing.", (uint8_t *)&v3, 0xCu);
  }

  v1 = DPLogHandle_ServiceEventPublisherError();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    uint64_t v2 = xpc_strerror();
    int v3 = 136446210;
    uint64_t v4 = v2;
    _os_log_fault_impl(&dword_209E70000, v1, OS_LOG_TYPE_FAULT, "FATAL ERROR: Tasking event publisher encountered unrecoverable error:%{public}s", (uint8_t *)&v3, 0xCu);
  }

  exit(1);
}

- (void)_addSubscriber:(unint64_t)a3 descriptor:(id)a4 isOldSubscriber:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a4, "teamID");
  if (string)
  {
    uint64_t v9 = string;
    v10 = [DRSTaskingEventSubscriber alloc];
    id v11 = [NSString stringWithUTF8String:v9];
    int v12 = [(DRSTaskingEventSubscriber *)v10 initWithTeamID:v11 token:a3];

    int v13 = [(DRSTaskingEventPublisher *)self subscribers];
    LODWORD(v10) = [v13 containsObject:v12];

    if (v10)
    {
      uint64_t v14 = DPLogHandle_ServiceEventPublisherError();
      if (os_signpost_enabled(v14))
      {
        uint64_t v15 = [v12 teamID];
        *(_DWORD *)long long buf = 138543618;
        long long v25 = v15;
        __int16 v26 = 2048;
        uint64_t v27 = [v12 token];
        id v16 = "DuplicateSubscribers";
        uint64_t v17 = "Tried to add duplicate subscribers: TeamID: %{public}@ token: %#llx";
LABEL_10:
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v18 = [(DRSTaskingEventPublisher *)self subscribers];
      [v18 addObject:v12];

      uint64_t v14 = DPLogHandle_ServiceEventPublisher();
      BOOL v19 = os_signpost_enabled(v14);
      if (!v5)
      {
        if (v19)
        {
          uint64_t v20 = [v12 teamID];
          *(_DWORD *)long long buf = 138543618;
          long long v25 = v20;
          __int16 v26 = 2048;
          uint64_t v27 = [v12 token];
          _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedNewSubscriber", "Added subscriber: TeamID: %{public}@ token: %#llx", buf, 0x16u);
        }
        uint64_t v21 = [v12 teamID];
        uint64_t v23 = 0;
        uint64_t v14 = [(DRSTaskingEventPublisher *)self _activeConfigForTeamID:v21 errorOut:&v23];
        uint64_t v22 = v23;

        if (!v22) {
          [(DRSTaskingEventPublisher *)self _publishNotification:v12 config:v14];
        }
        goto LABEL_15;
      }
      if (v19)
      {
        uint64_t v15 = [v12 teamID];
        *(_DWORD *)long long buf = 138543618;
        long long v25 = v15;
        __int16 v26 = 2048;
        uint64_t v27 = [v12 token];
        id v16 = "InitializedOldSubscriber";
        uint64_t v17 = "Added pre-existing subscriber: TeamID: %{public}@ token: %#llx. No need to broadcast config";
        goto LABEL_10;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  int v12 = DPLogHandle_ServiceEventPublisherError();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingEventDescriptor", "Missing 'teamID' key", buf, 2u);
  }
LABEL_16:
}

- (void)_removeSubscriber:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(DRSTaskingEventPublisher *)self subscribers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if ([v10 token] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_12;
    }
    int v12 = [(DRSTaskingEventPublisher *)self subscribers];
    [v12 removeObject:v11];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v11 = DPLogHandle_ServiceEventPublisherError();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)long long buf = 134349056;
      unint64_t v18 = a3;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubscriberRemovalFailure", "Failed to find a subscriber for token: %{public}#llx", buf, 0xCu);
    }
  }
}

- (NSMutableSet)subscribers
{
  return self->_subscribers;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (DRSConfigPersistedStore)configStore
{
  return self->_configStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configStore, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end