@interface DACLifecycleManager
- (DACLifecycleManager)initWithDelegate:(id)a3 queue:(id)a4;
- (id)_remoteInterfaceWithErrorHandler:(uint64_t)a1;
- (id)requestActivationOfActivity:(id)a3 requester:(id)a4;
- (void)_activateAssertionForActivity:(void *)a3 withChangeMarker:;
- (void)_removeAssertion:(void *)a3 forActivity:;
- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4;
- (void)activityListChanged:(id)a3;
- (void)dealloc;
- (void)enumerateLifecycleInfo:(id)a3;
- (void)lifecycleStateOfActivity:(id)a3 result:(id)a4;
- (void)registerActivity:(id)a3;
- (void)requestDeactivationOfActivity:(id)a3 requester:(id)a4;
- (void)roleChanged:(id)a3;
- (void)unregisterActivity:(id)a3;
@end

@implementation DACLifecycleManager

- (DACLifecycleManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)DACLifecycleManager;
  v8 = [(DACLifecycleManager *)&v28 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.DeviceActivityConductor.DACLifecycleManager.delegate", v10, v7);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.DeviceActivityConductor.DACLifecycleManager", v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[DACDeviceRole unknownRole];
    role = v9->_role;
    v9->_role = (DACDeviceRole *)v16;

    v18 = objc_alloc_init(DACActivityList);
    activityList = v9->_activityList;
    v9->_activityList = v18;

    *(_WORD *)&v9->_shouldAttemptReconnect = 0;
    v9->_resetNotifyToken = -1;
    v9->_subscriptionActive = 0;
    uint64_t v20 = [MEMORY[0x263EFF9C0] set];
    registeredActivities = v9->_registeredActivities;
    v9->_registeredActivities = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    assertions = v9->_assertions;
    v9->_assertions = (NSMutableDictionary *)v22;

    v24 = v9->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__DACLifecycleManager_initWithDelegate_queue___block_invoke;
    block[3] = &unk_264BDCC08;
    v27 = v9;
    dispatch_async(v24, block);
  }
  return v9;
}

void __46__DACLifecycleManager_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 56));
  }
  else {
    id WeakRetained = 0;
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_resetNotifyToken)) {
    notify_cancel(self->_resetNotifyToken);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DACLifecycleManager;
  [(DACLifecycleManager *)&v4 dealloc];
}

- (void)registerActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__DACLifecycleManager_registerActivity___block_invoke;
  v7[3] = &unk_264BDC9E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __40__DACLifecycleManager_registerActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_6;
  }
  if (!*(unsigned char *)(v2 + 10)) {
    goto LABEL_4;
  }
  objc_initWeak(&location, (id)v2);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __40__DACLifecycleManager_registerActivity___block_invoke_2;
  v10 = &unk_264BDCC30;
  objc_copyWeak(&v11, &location);
  id v4 = -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v3, &v7);
  objc_msgSend(v4, "registerActivity:", *(void *)(a1 + 40), v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
LABEL_4:
  }
    v5 = *(void **)(v2 + 64);
  else {
LABEL_6:
  }
    v5 = 0;
  return [v5 addObject:*(void *)(a1 + 40)];
}

void __40__DACLifecycleManager_registerActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = DACLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity registration - %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (id)_remoteInterfaceWithErrorHandler:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = (id *)(a1 + 56);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    v5 = [WeakRetained remoteObjectProxyWithErrorHandler:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)unregisterActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__DACLifecycleManager_unregisterActivity___block_invoke;
  v7[3] = &unk_264BDC9E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__DACLifecycleManager_unregisterActivity___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __42__DACLifecycleManager_unregisterActivity___block_invoke_2;
  __int16 v9 = &unk_264BDCC30;
  objc_copyWeak(&v10, &location);
  id v3 = -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v2, &v6);
  objc_msgSend(v3, "unregisterActivity:", *(void *)(a1 + 40), v6, v7, v8, v9);
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[8];
  }
  v5 = v4;
  [v5 removeObject:*(void *)(a1 + 40)];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__DACLifecycleManager_unregisterActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v6 = DACLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity unregistration - %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)lifecycleStateOfActivity:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke;
  block[3] = &unk_264BDCCE8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[6];
  }
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(NSObject **)(v4 + 32);
  }
  else {
    v5 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke_2;
  block[3] = &unk_264BDCCE8;
  id v10 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) stateOfActivity:*(void *)(a1 + 40)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)enumerateLifecycleInfo:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_queue_t v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke;
  block[3] = &unk_264BDC9B8;
  void block[4] = self;
  void block[5] = &v11;
  dispatch_sync(queue, block);
  id v6 = (void *)v12[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke_2;
  v8[3] = &unk_264BDCD10;
  id v7 = v4;
  id v9 = v7;
  [v6 enumerate:v8];

  _Block_object_dispose(&v11, 8);
}

void __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 48);
  }
  else {
    uint64_t v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestActivationOfActivity:(id)a3 requester:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke;
  v13[3] = &unk_264BDCB40;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke(uint64_t a1)
{
  v58[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 24));
    objc_initWeak(&location, (id)v2);
    uint64_t v36 = 0;
    v37 = (id *)&v36;
    uint64_t v38 = 0x3042000000;
    v39 = __Block_byref_object_copy__16;
    v40 = __Block_byref_object_dispose__17;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    v34 = __Block_byref_object_dispose__1;
    id v35 = 0;
    id v6 = [DACActivityAssertion alloc];
    *(void *)&long long from = MEMORY[0x263EF8330];
    *((void *)&from + 1) = 3221225472;
    v54 = __55__DACLifecycleManager__assertionForActivity_requester___block_invoke;
    v55 = &unk_264BDCD60;
    objc_copyWeak(v58, &location);
    v56 = &v36;
    v57 = &v30;
    id v7 = [(DACActivityAssertion *)v6 _initWithActivity:v4 requester:v5 changeMarker:0 relinquishHandler:&from];
    objc_storeWeak(v37 + 5, v7);
    uint64_t v8 = [v7 changeMarker];
    id v9 = (void *)v31[5];
    v31[5] = v8;

    id v10 = *(id *)(v2 + 72);
    id v11 = [v10 objectForKey:v4];

    if (!v11)
    {
      id v11 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
      id v12 = *(id *)(v2 + 72);
      [v12 setObject:v11 forKey:v4];
    }
    [v11 addPointer:v7];
    uint64_t v13 = DACLogForCategory(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v11 count];
      id v15 = *(id *)(v2 + 72);
      uint64_t v16 = [v15 count];
      *(_DWORD *)buf = 134219010;
      uint64_t v44 = v2;
      __int16 v45 = 2048;
      uint64_t v46 = v14;
      __int16 v47 = 2048;
      uint64_t v48 = v16;
      __int16 v49 = 2048;
      id v50 = v7;
      __int16 v51 = 2114;
      id v52 = v4;
      _os_log_impl(&dword_2330F4000, v13, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after creating %p for %{public}@", buf, 0x34u);
    }
    objc_destroyWeak(v58);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v7;

  uint64_t v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) changeMarker];
  uint64_t v20 = *(unsigned char **)(a1 + 32);
  if (v20 && v20[10])
  {
    objc_initWeak((id *)&from, v20);
    uint64_t v21 = *(void *)(a1 + 32);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke_10;
    v28[3] = &unk_264BDCC30;
    objc_copyWeak(&v29, (id *)&from);
    id v22 = -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v21, v28);
    [v22 requestActivationOfActivity:*(void *)(a1 + 40) requester:*(void *)(a1 + 48) changeMarker:v19];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)&from);
  }
  else
  {
    v23 = DACLogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      LODWORD(from) = 138543362;
      *(void *)((char *)&from + 4) = v24;
      _os_log_impl(&dword_2330F4000, v23, OS_LOG_TYPE_INFO, "offline activation of %{public}@", (uint8_t *)&from, 0xCu);
    }

    -[DACLifecycleManager _activateAssertionForActivity:withChangeMarker:](*(void *)(a1 + 32), *(void **)(a1 + 40), v19);
    uint64_t v25 = *(void *)(a1 + 32);
    if (v25) {
      v26 = *(void **)(v25 + 48);
    }
    else {
      v26 = 0;
    }
    v27 = (void *)[v26 copy];
    [v27 addActivity:*(void *)(a1 + 40) requester:*(void *)(a1 + 48) changeMarker:v19];
    [*(id *)(a1 + 32) activityListChanged:v27];
  }
}

- (void)_activateAssertionForActivity:(void *)a3 withChangeMarker:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    id v7 = [*(id *)(a1 + 72) objectForKey:v5];
    if ([v7 count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        id v9 = (void *)[v7 pointerAtIndex:v8];
        id v10 = objc_initWeak(&location, v9);
        if (v9)
        {
          id v11 = [v9 changeMarker];
          int v12 = [v6 isEqual:v11];

          if (v12) {
            break;
          }
        }

        objc_destroyWeak(&location);
        if (++v8 >= (unint64_t)[v7 count]) {
          goto LABEL_7;
        }
      }
      uint64_t v14 = [v9 state];
      id v15 = DACLogForCategory(2);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          uint64_t v17 = [v9 state];
          *(_DWORD *)buf = 134219010;
          uint64_t v20 = a1;
          __int16 v21 = 2048;
          id v22 = v9;
          __int16 v23 = 2048;
          uint64_t v24 = v17;
          __int16 v25 = 2114;
          id v26 = v5;
          __int16 v27 = 2114;
          id v28 = v6;
          _os_log_impl(&dword_2330F4000, v15, OS_LOG_TYPE_DEFAULT, "%p not activating assertion %p in invalid state %lu for %{public}@ with %{public}@", buf, 0x34u);
        }
      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v20 = a1;
          __int16 v21 = 2048;
          id v22 = v9;
          __int16 v23 = 2114;
          uint64_t v24 = (uint64_t)v5;
          __int16 v25 = 2114;
          id v26 = v6;
          _os_log_impl(&dword_2330F4000, v15, OS_LOG_TYPE_DEFAULT, "%p activating assertion %p for %{public}@ with %{public}@", buf, 0x2Au);
        }

        [v9 setState:1];
      }

      objc_destroyWeak(&location);
    }
    else
    {
LABEL_7:
      uint64_t v13 = DACLogForCategory(2);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v20 = a1;
        __int16 v21 = 2114;
        id v22 = v5;
        __int16 v23 = 2114;
        uint64_t v24 = (uint64_t)v6;
        _os_log_error_impl(&dword_2330F4000, v13, OS_LOG_TYPE_ERROR, "%p no assertion for %{public}@ with %{public}@ to activate", buf, 0x20u);
      }
    }
  }
}

void __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = DACLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity activation request - %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)requestDeactivationOfActivity:(id)a3 requester:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke;
  block[3] = &unk_264BDCB68;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke(uint64_t *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = (unsigned char *)a1[4];
  if (v2 && v2[10])
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = a1[4];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke_11;
    uint64_t v19 = &unk_264BDCC30;
    objc_copyWeak(&v20, &location);
    id v4 = -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v3, &v16);
    id v5 = (void *)a1[4];
    if (v5) {
      id v5 = (void *)v5[6];
    }
    id v6 = v5;
    id v7 = objc_msgSend(v6, "changeMarkerForActivity:", a1[5], v16, v17, v18, v19);

    if (!v7)
    {
      uint64_t v8 = DACLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = a1[4];
        uint64_t v15 = a1[5];
        *(_DWORD *)buf = 134218242;
        uint64_t v23 = v14;
        __int16 v24 = 2114;
        uint64_t v25 = v15;
        _os_log_error_impl(&dword_2330F4000, v8, OS_LOG_TYPE_ERROR, "%p requesting deactivation of non-active activity %{public}@", buf, 0x16u);
      }

      id v7 = +[DACChangeMarker missingMarker];
    }
    [v4 requestDeactivationOfActivity:a1[5] requester:a1[6] changeMarker:v7];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = DACLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = a1[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v10;
      _os_log_impl(&dword_2330F4000, v9, OS_LOG_TYPE_INFO, "offline deactivation of %{public}@", buf, 0xCu);
    }

    uint64_t v11 = a1[4];
    if (v11) {
      id v12 = *(void **)(v11 + 48);
    }
    else {
      id v12 = 0;
    }
    id v13 = (void *)[v12 copy];
    [v13 removeActivity:a1[5] requester:a1[6]];
    [(id)a1[4] activityListChanged:v13];
  }
}

void __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = DACLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity deactivation request - %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)activityListChanged:(id)a3
{
  if (self)
  {
    id v5 = self->_activityList;
    id v6 = self->_role;
    id v7 = a3;
    objc_storeStrong((id *)&self->_activityList, a3);
  }
  else
  {
    id v13 = a3;
    id v6 = 0;
    id v5 = 0;
  }
  uint64_t v8 = [a3 changesFromList:v5 includingMetadata:1];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__DACLifecycleManager_activityListChanged___block_invoke;
  v18[3] = &unk_264BDCC58;
  v18[4] = self;
  [v8 enumerate:v18];
  __int16 v9 = [a3 changesFromList:v5 includingMetadata:0];

  delegateQueue = self->_delegateQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__DACLifecycleManager_activityListChanged___block_invoke_14;
  v14[3] = &unk_264BDCB68;
  id v15 = v9;
  uint64_t v16 = self;
  uint64_t v17 = v6;
  uint64_t v11 = v6;
  id v12 = v9;
  dispatch_async(delegateQueue, v14);
}

uint64_t __43__DACLifecycleManager_activityListChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v31 = a2;
  id v3 = [v31 activity];
  if (![v31 state])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      id v5 = *(void **)(v4 + 72);
    }
    else {
      id v5 = 0;
    }
    id v6 = [v5 objectForKey:v3];
    id v7 = [MEMORY[0x263EFF980] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
          id v13 = objc_initWeak((id *)location, v12);
          if (v12 && [v12 state] == 1)
          {
            [v7 addObject:v12];
            uint64_t v14 = *(void *)(a1 + 32);
            if (v14) {
              id v15 = *(NSObject **)(v14 + 32);
            }
            else {
              id v15 = 0;
            }
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __43__DACLifecycleManager_activityListChanged___block_invoke_2;
            block[3] = &unk_264BDCC08;
            id v37 = v12;
            dispatch_async(v15, block);
          }
          objc_destroyWeak((id *)location);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v38 objects:v50 count:16];
        uint64_t v9 = v16;
      }
      while (v16);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v49 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v17);
          }
          -[DACLifecycleManager _removeAssertion:forActivity:](*(void *)(a1 + 32), *(void **)(*((void *)&v32 + 1) + 8 * i), v3);
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v49 count:16];
      }
      while (v18);
    }

    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      id v22 = *(void **)(v21 + 72);
    }
    else {
      id v22 = 0;
    }
    uint64_t v23 = [v22 objectForKey:v3];

    __int16 v24 = DACLogForCategory(2);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = [v23 count];
      __int16 v27 = *(void **)(a1 + 32);
      if (v27) {
        __int16 v27 = (void *)v27[9];
      }
      id v28 = v27;
      uint64_t v29 = [v28 count];

      *(_DWORD *)id location = 134218754;
      *(void *)&location[4] = v25;
      __int16 v43 = 2048;
      uint64_t v44 = v26;
      __int16 v45 = 2048;
      uint64_t v46 = v29;
      __int16 v47 = 2114;
      uint64_t v48 = v3;
      _os_log_impl(&dword_2330F4000, v24, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after deactivation of %{public}@", location, 0x2Au);
    }
  }
  return 1;
}

uint64_t __43__DACLifecycleManager_activityListChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:2];
}

- (void)_removeAssertion:(void *)a3 forActivity:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a2);
  id v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 24);
    dispatch_assert_queue_V2(v6);

    id v7 = *(id *)(a1 + 72);
    id v8 = [v7 objectForKey:v5];

    for (unint64_t i = 0; ; ++i)
    {
      if (i >= [v8 count]) {
        goto LABEL_7;
      }
      id v10 = (id)[v8 pointerAtIndex:i];
      id v11 = objc_initWeak((id *)v26, v10);
      id v12 = objc_loadWeakRetained(&location);
      BOOL v13 = v10 == v12;

      objc_destroyWeak((id *)v26);
      if (v13) {
        break;
      }
    }
    if (i == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_7:
      uint64_t v14 = DACLogForCategory(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v23 = objc_loadWeakRetained(&location);
        *(_DWORD *)uint64_t v26 = 134218498;
        *(void *)&v26[4] = a1;
        __int16 v27 = 2048;
        uint64_t v28 = (uint64_t)v23;
        __int16 v29 = 2114;
        unint64_t v30 = (unint64_t)v5;
        _os_log_error_impl(&dword_2330F4000, v14, OS_LOG_TYPE_ERROR, "%p unable to locate assertion %p for %{public}@", v26, 0x20u);
      }
      goto LABEL_13;
    }
    id v15 = DACLogForCategory(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v24 = objc_loadWeakRetained(&location);
      *(_DWORD *)uint64_t v26 = 134218754;
      *(void *)&v26[4] = a1;
      __int16 v27 = 2048;
      uint64_t v28 = (uint64_t)v24;
      __int16 v29 = 2048;
      unint64_t v30 = i;
      __int16 v31 = 2114;
      id v32 = v5;
      _os_log_debug_impl(&dword_2330F4000, v15, OS_LOG_TYPE_DEBUG, "%p removing assertion %p at %lu for %{public}@", v26, 0x2Au);
    }
    [v8 removePointerAtIndex:i];
LABEL_13:
    if ([v8 count])
    {
      uint64_t v16 = DACLogForCategory(2);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v8 count];
        id v18 = *(id *)(a1 + 72);
        uint64_t v19 = [v18 count];
        *(_DWORD *)uint64_t v26 = 134218754;
        *(void *)&v26[4] = a1;
        __int16 v27 = 2048;
        uint64_t v28 = v17;
        __int16 v29 = 2048;
        unint64_t v30 = v19;
        __int16 v31 = 2114;
        id v32 = v5;
        _os_log_impl(&dword_2330F4000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions remain for %{public}@", v26, 0x2Au);
      }
    }
    else
    {
      id v20 = *(id *)(a1 + 72);
      [v20 removeObjectForKey:v5];

      uint64_t v16 = DACLogForCategory(2);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = *(id *)(a1 + 72);
        uint64_t v22 = [v21 count];
        *(_DWORD *)uint64_t v26 = 134218498;
        *(void *)&v26[4] = a1;
        __int16 v27 = 2048;
        uint64_t v28 = v22;
        __int16 v29 = 2114;
        unint64_t v30 = (unint64_t)v5;
        _os_log_impl(&dword_2330F4000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu unique assertions after last assertion removal for %{public}@", v26, 0x20u);
      }
    }
  }
  objc_destroyWeak(&location);
}

void __43__DACLifecycleManager_activityListChanged___block_invoke_14(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
    }
    else {
      id WeakRetained = 0;
    }
    id v4 = WeakRetained;
    [WeakRetained lifecycleChanged:*(void *)(a1 + 32) deviceRole:*(void *)(a1 + 48)];
  }
}

- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4
{
}

- (void)roleChanged:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_role, a3);
    activityList = self->_activityList;
  }
  else
  {
    activityList = 0;
  }
  id v7 = activityList;
  id v8 = [MEMORY[0x263EFF980] array];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __35__DACLifecycleManager_roleChanged___block_invoke;
  v15[3] = &unk_264BDCC58;
  id v9 = v8;
  id v16 = v9;
  [(DACActivityList *)v7 enumerate:v15];
  id v10 = [[DACLifecycleChangelist alloc] _initWithLifecycleInfoArray:v9];
  if ([v10 count])
  {
    delegateQueue = self->_delegateQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__DACLifecycleManager_roleChanged___block_invoke_2;
    v12[3] = &unk_264BDCB68;
    v12[4] = self;
    id v13 = v10;
    id v14 = v5;
    dispatch_async(delegateQueue, v12);
  }
}

uint64_t __35__DACLifecycleManager_roleChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __35__DACLifecycleManager_roleChanged___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = WeakRetained;
  [WeakRetained lifecycleChanged:a1[5] deviceRole:a1[6]];
}

void __55__DACLifecycleManager__assertionForActivity_requester___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DACLifecycleManager__assertionForActivity_requester___block_invoke_2;
    block[3] = &unk_264BDCD38;
    void block[4] = WeakRetained;
    long long v13 = *(_OWORD *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

void __55__DACLifecycleManager__assertionForActivity_requester___block_invoke_2(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[7] + 8) + 40));
  id v4 = *(void **)(*(void *)(a1[8] + 8) + 40);
  id v5 = (void *)a1[5];
  id v6 = (void *)a1[6];
  id v23 = WeakRetained;
  objc_initWeak(&location, WeakRetained);
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  if (v2)
  {
    id v10 = *(id *)(v2 + 24);
    dispatch_assert_queue_V2(v10);

    id v11 = objc_loadWeakRetained(&location);
    -[DACLifecycleManager _removeAssertion:forActivity:](v2, v11, v8);

    id v12 = *(id *)(v2 + 72);
    long long v13 = [v12 objectForKey:v8];

    id v14 = DACLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      id v16 = *(id *)(v2 + 72);
      uint64_t v17 = [v16 count];
      id v18 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      __int16 v27 = (void *)v17;
      __int16 v28 = 2048;
      id v29 = v18;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_2330F4000, v14, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after relinquish of %p for %{public}@", buf, 0x34u);
    }
    if ([v13 count] || *(unsigned char *)(v2 + 10))
    {
      objc_initWeak(&from, (id)v2);
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __85__DACLifecycleManager__assertionRelinquished_withChangeMarker_forActivity_requester___block_invoke;
      __int16 v27 = &unk_264BDCC30;
      objc_copyWeak((id *)&v28, &from);
      uint64_t v19 = -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v2, buf);
      [v19 relinquishAssertionOfActivity:v8 requester:v9 changeMarker:v7];

      objc_destroyWeak((id *)&v28);
      objc_destroyWeak(&from);
    }
    else
    {
      id v20 = DACLogForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v8;
        _os_log_impl(&dword_2330F4000, v20, OS_LOG_TYPE_INFO, "%p offline relinquish of %{public}@", buf, 0x16u);
      }

      id v21 = *(id *)(v2 + 48);
      uint64_t v22 = (void *)[v21 copy];

      [v22 removeActivity:v8 requester:v9];
      [(id)v2 activityListChanged:v22];
    }
  }

  objc_destroyWeak(&location);
}

void __85__DACLifecycleManager__assertionRelinquished_withChangeMarker_forActivity_requester___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = DACLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_2330F4000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity relinquish request - %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_registeredActivities, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_activityList, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end