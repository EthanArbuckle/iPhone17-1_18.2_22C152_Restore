@interface COCompanionLinkClientFactory
- (BOOL)_isKnownDevice:(id)a3;
- (COCompanionLinkClientFactory)init;
- (COCompanionLinkClientFactory)initWithDispatchQueue:(id)a3;
- (Class)companionLinkClientClass;
- (NSHashTable)locals;
- (NSMapTable)clients;
- (OS_dispatch_queue)dispatchQueue;
- (id)_clientsForRapportClient_unsafe:(id)a3;
- (id)_reuseableRapportClientInClientsList:(id)a3;
- (id)activeDevices;
- (id)companionLinkClientForCurrentDevice;
- (id)companionLinkClientForDevice:(id)a3 withIDSIdentifier:(id)a4;
- (void)_withLock:(id)a3;
- (void)activateCompanionLinkClient:(id)a3;
- (void)didActivate:(id)a3 error:(id)a4;
- (void)didChangeDevice:(id)a3 flags:(unsigned int)a4;
- (void)didChangeErrorFlags:(id)a3;
- (void)didDisconnect:(id)a3;
- (void)didFindDevice:(id)a3;
- (void)didInterrupt:(id)a3;
- (void)didInvalidate:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)didRegisterEventID:(id)a3 client:(id)a4;
- (void)didRegisterRequestID:(id)a3 client:(id)a4;
- (void)didUpdateLocalDevice:(id)a3;
- (void)didUpdateState:(id)a3;
- (void)invalidateCompanionLinkClient:(id)a3;
- (void)removeClient:(id)a3;
- (void)setLocals:(id)a3;
@end

@implementation COCompanionLinkClientFactory

- (COCompanionLinkClientFactory)initWithDispatchQueue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COCompanionLinkClientFactory;
  v6 = [(COCompanionLinkClientFactory *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    locals = v7->_locals;
    v7->_locals = (NSHashTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    clients = v7->_clients;
    v7->_clients = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    activeDevices = v7->_activeDevices;
    v7->_activeDevices = (NSMutableDictionary *)v12;

    v14 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v7;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p companion link factory created", buf, 0xCu);
    }
  }
  return v7;
}

- (COCompanionLinkClientFactory)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global);
  }
  uint64_t v3 = init_queue;
  return [(COCompanionLinkClientFactory *)self initWithDispatchQueue:v3];
}

void __36__COCompanionLinkClientFactory_init__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.coordination.COCompanionLinkClientFactory", attr);
  v2 = (void *)init_queue;
  init_queue = (uint64_t)v1;
}

- (Class)companionLinkClientClass
{
  return (Class)objc_opt_class();
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)activeDevices
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__COCompanionLinkClientFactory_activeDevices__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClientFactory *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __45__COCompanionLinkClientFactory_activeDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  return MEMORY[0x270F9A758]();
}

- (BOOL)_isKnownDevice:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v5 = [v4 idsDeviceIdentifier];
  if (v5)
  {
    v6 = [(COCompanionLinkClientFactory *)self clients];
    uint64_t v7 = [v6 objectForKey:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v7 count] == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = [(COCompanionLinkClientFactory *)self locals];
    uint64_t v23 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v9 = *(void *)v30;
      v24 = v8;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v8);
          }
          v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v12 = [v11 rapport];
          v13 = [v12 activeDevices];

          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v25 + 1) + 8 * j) idsDeviceIdentifier];
                char v19 = [v18 isEqualToString:v5];

                if (v19)
                {

                  BOOL v20 = 1;
                  uint64_t v8 = v24;
                  goto LABEL_24;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v24;
          uint64_t v9 = v22;
        }
        BOOL v20 = 0;
        uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_24:
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (id)_clientsForRapportClient_unsafe:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v6 = [(COCompanionLinkClientFactory *)self locals];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v12 = [v11 rapport];

        if (v12 == v4)
        {
          uint64_t v13 = [v5 arrayByAddingObject:v11];

          id v5 = (id)v13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [(COCompanionLinkClientFactory *)self clients];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v27 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v14);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v17 = objc_msgSend(v14, "objectForKey:", v16, v26);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          do
          {
            for (uint64_t k = 0; k != v19; ++k)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * k);
              id v23 = [v22 rapport];

              if (v23 == v4)
              {
                uint64_t v24 = [v5 arrayByAddingObject:v22];

                id v5 = (id)v24;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v19);
        }
      }
      uint64_t v27 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v27);
  }

  return v5;
}

- (id)_reuseableRapportClientInClientsList:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "rapport", (void)v10);
      if ((objc_msgSend(v8, "co_CompanionLinkClientFlags") & 0xC) == 0) {
        break;
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)companionLinkClientForCurrentDevice
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__0;
  long long v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke;
  v8[3] = &unk_2645CB120;
  v8[4] = self;
  v8[5] = &v9;
  [(COCompanionLinkClientFactory *)self _withLock:v8];
  id v3 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)v10[5];
    uint64_t v5 = [v4 rapport];
    *(_DWORD *)buf = 134218496;
    uint64_t v16 = self;
    __int16 v17 = 2048;
    uint64_t v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v5;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p returning %p for current device use riding on %p", buf, 0x20u);
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) locals];
  uint64_t v4 = [*v2 _reuseableRapportClientInClientsList:v3];
  if (!v4)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) companionLinkClientClass];
    id v6 = [*(id *)(a1 + 32) dispatchQueue];
    uint64_t v4 = objc_msgSend(v5, "co_companionLinkClientForDiscoveryOnDispatchQueue:", v6);

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v4);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_2;
    v38[3] = &unk_2645CB080;
    objc_copyWeak(&v39, &location);
    objc_copyWeak(&v40, &from);
    [v4 setInterruptionHandler:v38];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_3;
    v35[3] = &unk_2645CB080;
    objc_copyWeak(&v36, &location);
    objc_copyWeak(&v37, &from);
    [v4 setStateUpdatedHandler:v35];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_4;
    v32[3] = &unk_2645CB080;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    [v4 setErrorFlagsChangedHandler:v32];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_5;
    v29[3] = &unk_2645CB080;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    [v4 setDisconnectHandler:v29];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_6;
    v26[3] = &unk_2645CB080;
    objc_copyWeak(&v27, &location);
    objc_copyWeak(&v28, &from);
    [v4 setInvalidationHandler:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_7;
    v24[3] = &unk_2645CB0A8;
    objc_copyWeak(&v25, &location);
    [v4 setDeviceFoundHandler:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_8;
    v22[3] = &unk_2645CB0A8;
    objc_copyWeak(&v23, &location);
    [v4 setDeviceLostHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_9;
    v20[3] = &unk_2645CB0D0;
    objc_copyWeak(&v21, &location);
    [v4 setDeviceChangedHandler:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_10;
    v18[3] = &unk_2645CB0A8;
    objc_copyWeak(&v19, &location);
    [v4 setLocalDeviceUpdatedHandler:v18];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_11;
    v15[3] = &unk_2645CB0F8;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    [v4 setRequestIDRegistrationCompletion:v15];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_12;
    v12[3] = &unk_2645CB0F8;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    [v4 setEventIDRegistrationCompletion:v12];
    uint64_t v7 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v44 = v8;
      __int16 v45 = 2048;
      v46 = v4;
      __int16 v47 = 2112;
      v48 = v4;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p created new local link %p (%@)", buf, 0x20u);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  uint64_t v9 = [[COCompanionLinkClient alloc] initWithCompanionLinkClient:v4];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setFactory:*(void *)(a1 + 32)];
  [v3 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didInterrupt:v2];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didUpdateState:v2];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didChangeErrorFlags:v2];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didDisconnect:v2];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didInvalidate:v2];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_7(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setValue:0 forKey:@"siriInfo"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didFindDevice:v5];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setValue:0 forKey:@"siriInfo"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didLoseDevice:v5];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [v7 setValue:0 forKey:@"siriInfo"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didChangeDevice:v7 flags:a3];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_10(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setValue:0 forKey:@"siriInfo"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained didUpdateLocalDevice:v5];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_11(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4) {
    [WeakRetained didRegisterRequestID:v6 client:v4];
  }
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_12(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v4;
  if (WeakRetained && v4) {
    [WeakRetained didRegisterEventID:v6 client:v4];
  }
}

- (id)companionLinkClientForDevice:(id)a3 withIDSIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  id v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke;
  uint64_t v18 = &unk_2645CB148;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v21 = self;
  uint64_t v22 = &v23;
  [(COCompanionLinkClientFactory *)self _withLock:&v15];
  uint64_t v10 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)v24[5];
    long long v12 = objc_msgSend(v11, "rapport", v15, v16, v17, v18, v19);
    *(_DWORD *)buf = 134218496;
    id v30 = self;
    __int16 v31 = 2048;
    long long v32 = v11;
    __int16 v33 = 2048;
    id v34 = v12;
    _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p returning %p for device use riding on %p", buf, 0x20u);
  }
  id v13 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) idsDeviceIdentifier];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:@"idsDeviceIdentifier"];
  }
  id v4 = [*(id *)(a1 + 48) clients];
  id v5 = [v4 objectForKey:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 48) _reuseableRapportClientInClientsList:v5];
  if (!v6)
  {
    if (!v5)
    {
      id v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      [v4 setObject:v5 forKey:*(void *)(a1 + 40)];
    }
    id v7 = (void *)[*(id *)(a1 + 48) companionLinkClientClass];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 48) dispatchQueue];
    id v6 = objc_msgSend(v7, "co_companionLinkClientToDevice:dispatchQueue:", v8, v9);

    objc_initWeak(&location, *(id *)(a1 + 48));
    objc_initWeak(&from, v6);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_2;
    v27[3] = &unk_2645CB080;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(&v29, &from);
    [v6 setInterruptionHandler:v27];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_3;
    v24[3] = &unk_2645CB080;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, &from);
    [v6 setStateUpdatedHandler:v24];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_4;
    v21[3] = &unk_2645CB080;
    objc_copyWeak(&v22, &location);
    objc_copyWeak(&v23, &from);
    [v6 setErrorFlagsChangedHandler:v21];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_5;
    v18[3] = &unk_2645CB080;
    objc_copyWeak(&v19, &location);
    objc_copyWeak(&v20, &from);
    [v6 setDisconnectHandler:v18];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_6;
    v15[3] = &unk_2645CB080;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    [v6 setInvalidationHandler:v15];
    uint64_t v10 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v11;
      __int16 v34 = 2048;
      uint64_t v35 = v6;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p created new device link %p (%@)", buf, 0x20u);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  long long v12 = [[COCompanionLinkClient alloc] initWithCompanionLinkClient:v6];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFactory:*(void *)(a1 + 48)];
  [v5 addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didInterrupt:v2];
  }
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didUpdateState:v2];
  }
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didChangeErrorFlags:v2];
  }
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didDisconnect:v2];
  }
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2) {
    [WeakRetained didInvalidate:v2];
  }
}

- (void)didFindDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v4 = [v14 idsDeviceIdentifier];

  if (v4)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__0;
    id v29 = __Block_byref_object_dispose__0;
    id v30 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __46__COCompanionLinkClientFactory_didFindDevice___block_invoke;
    v22[3] = &unk_2645CAED0;
    void v22[4] = self;
    id v5 = v14;
    id v23 = v5;
    uint64_t v24 = &v25;
    [(COCompanionLinkClientFactory *)self _withLock:v22];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = (id)v26[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 deviceFoundHandler];
          if (v11 && ([v10 flags] & 0xA) == 2)
          {
            long long v12 = [v10 dispatchQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __46__COCompanionLinkClientFactory_didFindDevice___block_invoke_14;
            block[3] = &unk_2645CB170;
            id v17 = v11;
            id v16 = v5;
            dispatch_async(v12, block);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v31 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    uint64_t v13 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(COCompanionLinkClientFactory *)(uint64_t)self didFindDevice:v13];
    }
  }
}

void __46__COCompanionLinkClientFactory_didFindDevice___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v13 = 134218242;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p informing locals of found %@", (uint8_t *)&v13, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) locals];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = *(void **)(v9 + 16);
  long long v12 = [v10 idsDeviceIdentifier];
  [v11 setObject:v10 forKey:v12];
}

uint64_t __46__COCompanionLinkClientFactory_didFindDevice___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didLoseDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__0;
  id v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  id v14 = a3;
  uint64_t v4 = [v14 idsDeviceIdentifier];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke;
    v22[3] = &unk_2645CAED0;
    void v22[4] = self;
    id v6 = v14;
    id v23 = v6;
    uint64_t v24 = &v25;
    [(COCompanionLinkClientFactory *)self _withLock:v22];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = (id)v26[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v12 = [v11 deviceLostHandler];
          if (v12 && ([v11 flags] & 0xA) == 2)
          {
            int v13 = [v11 dispatchQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke_15;
            block[3] = &unk_2645CB170;
            id v17 = v12;
            id v16 = v6;
            dispatch_async(v13, block);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
      }
      while (v8);
    }
  }
  _Block_object_dispose(&v25, 8);
}

void __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 134218242;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p informing locals of lost %@", (uint8_t *)&v12, 0x16u);
  }

  BOOL v5 = [*(id *)(a1 + 32) locals];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v11 = [v9 idsDeviceIdentifier];
  [v10 removeObjectForKey:v11];
}

uint64_t __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didChangeDevice:(id)a3 flags:(unsigned int)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__0;
  uint64_t v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  __int16 v31 = __Block_byref_object_copy__0;
  uint64_t v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke;
  v24[3] = &unk_2645CB198;
  id v26 = &v34;
  void v24[4] = self;
  id v15 = v6;
  id v25 = v15;
  uint64_t v27 = &v28;
  [(COCompanionLinkClientFactory *)self _withLock:v24];
  if (v35[5])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = (id)v29[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v12 = [v11 deviceChangedHandler];
          if (v12 && ([v11 flags] & 0xA) == 2)
          {
            uint64_t v13 = [v11 dispatchQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke_16;
            block[3] = &unk_2645CB1C0;
            id v18 = v12;
            id v17 = v15;
            unsigned int v19 = a4;
            dispatch_async(v13, block);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v40 count:16];
      }
      while (v8);
    }
  }
  else
  {
    __int16 v14 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p device updated which wasn't in our active list. Treating as found device %@", buf, 0x16u);
    }

    [(COCompanionLinkClientFactory *)self didFindDevice:v15];
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) idsDeviceIdentifier];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (v4)
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = [v7 idsDeviceIdentifier];
    [v8 setObject:v7 forKey:v9];
  }
  id v13 = [*(id *)(a1 + 32) locals];
  uint64_t v10 = [v13 allObjects];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

uint64_t __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (void)didUpdateLocalDevice:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke;
  v20[3] = &unk_2645CAED0;
  void v20[4] = self;
  id v5 = v4;
  id v21 = v5;
  long long v22 = &v23;
  [(COCompanionLinkClientFactory *)self _withLock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)v24[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 localDeviceUpdatedHandler];
        if (v11 && ([v10 flags] & 0xA) == 2)
        {
          int v12 = [v10 dispatchQueue];
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_17;
          v13[3] = &unk_2645CB170;
          id v15 = v11;
          id v14 = v5;
          dispatch_async(v12, v13);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v23, 8);
}

void __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke(uint64_t a1)
{
  id v2 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) locals];
  uint64_t v4 = [v3 allObjects];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)didInterrupt:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__COCompanionLinkClientFactory_didInterrupt___block_invoke;
  v14[3] = &unk_2645CB1E8;
  long long v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  [(COCompanionLinkClientFactory *)self _withLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v18[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didInterrupt", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __45__COCompanionLinkClientFactory_didInterrupt___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)didUpdateState:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__COCompanionLinkClientFactory_didUpdateState___block_invoke;
  v14[3] = &unk_2645CB1E8;
  long long v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  [(COCompanionLinkClientFactory *)self _withLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v18[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didUpdateState", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __47__COCompanionLinkClientFactory_didUpdateState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)didChangeErrorFlags:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__COCompanionLinkClientFactory_didChangeErrorFlags___block_invoke;
  v14[3] = &unk_2645CB1E8;
  long long v16 = &v17;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  [(COCompanionLinkClientFactory *)self _withLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v18[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didChangeErrorFlags", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __52__COCompanionLinkClientFactory_didChangeErrorFlags___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)didDisconnect:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__COCompanionLinkClientFactory_didDisconnect___block_invoke;
  v14[3] = &unk_2645CB210;
  id v5 = v4;
  long long v16 = self;
  uint64_t v17 = &v18;
  id v15 = v5;
  [(COCompanionLinkClientFactory *)self _withLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didDisconnect", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v24 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __46__COCompanionLinkClientFactory_didDisconnect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)didInvalidate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__COCompanionLinkClientFactory_didInvalidate___block_invoke;
  v14[3] = &unk_2645CB210;
  id v5 = v4;
  long long v16 = self;
  uint64_t v17 = &v18;
  id v15 = v5;
  [(COCompanionLinkClientFactory *)self _withLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didInvalidate", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v24 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __46__COCompanionLinkClientFactory_didInvalidate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 8);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)didActivate:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__COCompanionLinkClientFactory_didActivate_error___block_invoke;
  v17[3] = &unk_2645CB210;
  id v8 = v6;
  uint64_t v19 = self;
  uint64_t v20 = &v21;
  id v18 = v8;
  [(COCompanionLinkClientFactory *)self _withLock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = (id)v22[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "didActivateWithError:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v27 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __50__COCompanionLinkClientFactory_didActivate_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)didRegisterRequestID:(id)a3 client:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__COCompanionLinkClientFactory_didRegisterRequestID_client___block_invoke;
  v19[3] = &unk_2645CB1E8;
  uint64_t v21 = &v22;
  v19[4] = self;
  id v8 = v7;
  id v20 = v8;
  [(COCompanionLinkClientFactory *)self _withLock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = (id)v23[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "requestIDRegistrationCompletion", (void)v15);
        long long v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __60__COCompanionLinkClientFactory_didRegisterRequestID_client___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)didRegisterEventID:(id)a3 client:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__0;
  id v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__COCompanionLinkClientFactory_didRegisterEventID_client___block_invoke;
  v19[3] = &unk_2645CB1E8;
  uint64_t v21 = &v22;
  v19[4] = self;
  id v8 = v7;
  id v20 = v8;
  [(COCompanionLinkClientFactory *)self _withLock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = (id)v23[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "eventIDRegistrationCompletion", (void)v15);
        long long v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __58__COCompanionLinkClientFactory_didRegisterEventID_client___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

- (void)activateCompanionLinkClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(COCompanionLinkClientFactory *)self _withLock:v6];
}

void __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) rapport];
  uint64_t v3 = objc_msgSend(v2, "co_CompanionLinkClientFlags");
  uint64_t v4 = v3;
  if ((v3 & 1) == 0)
  {
    id v5 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v6;
      __int16 v34 = 2048;
      uint64_t v35 = v2;
      __int16 v36 = 2112;
      id v37 = v2;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p activating %p (%@)", buf, 0x20u);
    }

    objc_msgSend(v2, "co_SetCompanionLinkClientFlags:", v4 | 1);
    id v7 = [*(id *)(a1 + 32) destinationDevice];
    if (v7) {
      char v8 = [*(id *)(a1 + 40) _isKnownDevice:v7];
    }
    else {
      char v8 = 0;
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_initWeak(&location, v2);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_18;
    v25[3] = &unk_2645CB238;
    objc_copyWeak(&v27, (id *)buf);
    objc_copyWeak(&v28, &location);
    char v29 = v8;
    id v17 = v7;
    id v26 = v17;
    [v2 activateWithCompletion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
LABEL_21:

    goto LABEL_22;
  }
  if ((v3 & 2) != 0)
  {
    id v9 = COCoreLogForCategory(19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = v2;
      __int16 v36 = 2112;
      id v37 = v2;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p already activated %p (%@)", buf, 0x20u);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", v2);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
LABEL_11:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = [*(id *)(*((void *)&v21 + 1) + 8 * v14) activationError];
        if (v15) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
          if (v12) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      long long v15 = 0;
    }

    long long v16 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_20;
    v18[3] = &unk_2645CAE80;
    id v19 = *(id *)(a1 + 32);
    id v20 = v15;
    id v17 = v15;
    dispatch_async(v16, v18);

    goto LABEL_21;
  }
LABEL_22:
}

void __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_18(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      [WeakRetained didActivate:v4 error:v6];
      if (!v6 && !*(unsigned char *)(a1 + 56) && *(void *)(a1 + 32)) {
        objc_msgSend(WeakRetained, "didFindDevice:");
      }
    }
  }
}

uint64_t __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_20(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didActivateWithError:*(void *)(a1 + 40)];
  if (!*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) usingOnDemandConnection]) {
      [*(id *)(a1 + 32) didUpdateState];
    }
    uint64_t result = [*(id *)(a1 + 32) errorFlags];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 didChangeErrorFlags];
    }
  }
  return result;
}

- (void)invalidateCompanionLinkClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [(COCompanionLinkClientFactory *)self _withLock:v6];
}

void __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) rapport];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", v2);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_2;
  v14[3] = &unk_2645CB260;
  id v15 = *(id *)(a1 + 32);
  id v4 = [v3 indexesOfObjectsPassingTest:v14];
  id v5 = [v3 objectsAtIndexes:v4];

  uint64_t v6 = [v5 count];
  id v7 = COCoreLogForCategory(19);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v9;
      __int16 v18 = 2048;
      id v19 = v2;
      __int16 v20 = 2112;
      long long v21 = v2;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p already invalidated %p (%@)", buf, 0x20u);
    }

    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_22;
    v12[3] = &unk_2645CB288;
    id v13 = *(id *)(a1 + 32);
    dispatch_async(v10, v12);
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v11;
      __int16 v18 = 2048;
      id v19 = v2;
      __int16 v20 = 2112;
      long long v21 = v2;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p invalidating %p (%@)", buf, 0x20u);
    }

    objc_msgSend(v2, "co_SetCompanionLinkClientFlags:", objc_msgSend(v2, "co_CompanionLinkClientFlags") | 8);
    [v2 invalidate];
  }
}

uint64_t __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return [a2 isInvalidated] ^ 1;
  }
}

uint64_t __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) didInvalidate];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__COCompanionLinkClientFactory_removeClient___block_invoke;
  v6[3] = &unk_2645CAE80;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClientFactory *)self _withLock:v6];
}

void __45__COCompanionLinkClientFactory_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = COCoreLogForCategory(19);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 134218240;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p removing knowledge of %p", (uint8_t *)&v10, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) locals];
  [v5 removeObject:*(void *)(a1 + 40)];

  uint64_t v6 = [*(id *)(a1 + 40) destinationDevice];
  id v7 = [v6 idsDeviceIdentifier];

  if (v7)
  {
    BOOL v8 = [*(id *)(a1 + 32) clients];
    uint64_t v9 = [v8 objectForKey:v7];
    [v9 removeObject:*(void *)(a1 + 40)];
    if (![v9 count]) {
      [v8 removeObjectForKey:v7];
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSHashTable)locals
{
  return self->_locals;
}

- (void)setLocals:(id)a3
{
}

- (NSMapTable)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_locals, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
}

- (void)didFindDevice:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2217C1000, log, OS_LOG_TYPE_ERROR, "%p found device %@ which doesn't have an IDS identifier. Deferring informing locals about this device", (uint8_t *)&v3, 0x16u);
}

void __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%p informing locals of updated %@", (uint8_t *)&v4, 0x16u);
}

@end