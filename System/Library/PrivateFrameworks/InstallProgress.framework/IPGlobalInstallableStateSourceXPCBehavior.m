@interface IPGlobalInstallableStateSourceXPCBehavior
- (IPGlobalInstallableStateSourceXPCBehavior)initWithXPCConnectionProvider:(id)a3 stateStreamSource:(id)a4 queue:(id)a5;
- (id)_installableStateSourcesForStates:(id)a3;
- (id)_queue_asyncProxyWithErrorHandler:(id)a3;
- (id)_queue_connectedConnection;
- (id)_queue_makeExtantStateSourcesForGlobalSource:(id)a3 error:(id *)a4;
- (id)_queue_makeInstallingStateSourcesForGlobalSource:(id)a3 error:(id *)a4;
- (id)_queue_syncProxyWithErrorHandler:(id)a3;
- (id)currentProgressForIdentity:(id)a3 error:(id *)a4;
- (void)_queue_connectedConnection;
- (void)_queue_noteInstallBeganForIdentity:(id)a3;
- (void)_queue_registerAsProgressObserverIfNecessary;
- (void)_queue_resumeStateStreamSourceIfNecessary;
- (void)_queue_sendStateSourceAvailableForIdentity:(id)a3;
- (void)_queue_sendStateSourceUnavailableForIdentity:(id)a3;
- (void)addObserver:(id)a3;
- (void)installableForIdentity:(id)a3 progressChanged:(id)a4;
- (void)installableForIdentity:(id)a3 progressEndedForReason:(unint64_t)a4;
- (void)makeExtantStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4;
- (void)makeInstallingStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4;
- (void)registerProgressSource:(id)a3;
- (void)registerStateSource:(id)a3;
- (void)removeObserver:(id)a3;
- (void)serverActionBarrierForTesting;
- (void)stateUpdateStreamSource:(id)a3 updateMessageReceived:(id)a4;
- (void)unregisterProgressSource:(id)a3;
- (void)unregisterStateSource:(id)a3;
@end

@implementation IPGlobalInstallableStateSourceXPCBehavior

- (IPGlobalInstallableStateSourceXPCBehavior)initWithXPCConnectionProvider:(id)a3 stateStreamSource:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)IPGlobalInstallableStateSourceXPCBehavior;
  v11 = [(IPGlobalInstallableStateSourceXPCBehavior *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stateStreamSource, a4);
    [(IPStateUpdateStreamSource *)v12->_stateStreamSource setDelegate:v12];
    uint64_t v13 = [v8 copy];
    id connectionProvider = v12->_connectionProvider;
    v12->_id connectionProvider = (id)v13;

    objc_storeStrong((id *)&v12->_q, a5);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.InstallProgress.GISSXPCB.callout", v15);
    calloutQueue = v12->_calloutQueue;
    v12->_calloutQueue = (OS_dispatch_queue *)v16;

    currentConnection = v12->_currentConnection;
    v12->_currentConnection = 0;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    registeredStateSources = v12->_registeredStateSources;
    v12->_registeredStateSources = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    registeredProgressSources = v12->_registeredProgressSources;
    v12->_registeredProgressSources = v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:1];
    stateUpdateObservers = v12->_stateUpdateObservers;
    v12->_stateUpdateObservers = (NSHashTable *)v23;
  }
  return v12;
}

- (void)registerStateSource:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke;
  v7[3] = &unk_26538F700;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(q, v7);
}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = _IPDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_252AA9000, v2, OS_LOG_TYPE_DEFAULT, "registering state source %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) collationKey];
  v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [*(id *)(*(void *)(a1 + 40) + 32) setObject:v5 forKey:v4];
  }
  [v5 addObject:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "_queue_resumeStateStreamSourceIfNecessary");
  id v6 = *(NSObject **)(*(void *)(a1 + 40) + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7;
  block[3] = &unk_26538F930;
  id v8 = *(id *)(a1 + 32);
  dispatch_async(v6, block);
}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v3 = [v2 currentStateWithError:&v6];
  id v4 = v6;
  if (v3)
  {
    [*(id *)(a1 + 32) notifyOfUpdate:v3];
  }
  else
  {
    v5 = _IPClientLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7_cold_1();
    }
  }
}

- (void)unregisterStateSource:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__IPGlobalInstallableStateSourceXPCBehavior_unregisterStateSource___block_invoke;
  v7[3] = &unk_26538F700;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(q, v7);
}

void __67__IPGlobalInstallableStateSourceXPCBehavior_unregisterStateSource___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _IPDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_252AA9000, v2, OS_LOG_TYPE_DEFAULT, "unregistering state source %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) collationKey];
  v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v4];
  [v5 removeObject:*(void *)(a1 + 32)];
  if (![v5 count]) {
    [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v4];
  }
}

- (void)registerProgressSource:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke;
  block[3] = &unk_26538F7F0;
  id v8 = v4;
  id v9 = self;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(q, block);
  dispatch_async((dispatch_queue_t)self->_calloutQueue, (dispatch_block_t)v12[5]);

  _Block_object_dispose(&v11, 8);
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v2 = _IPDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_252AA9000, v2, OS_LOG_TYPE_DEFAULT, "registering progress source %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_registerAsProgressObserverIfNecessary");
  id v4 = [*(id *)(a1 + 32) installableStateSource];
  BOOL v5 = [v4 installableType] == 1;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) installableStateSource];
    uint64_t v7 = [v6 launchServicesIdentity];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__8;
    v41 = __Block_byref_object_dispose__9;
    id v42 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__8;
    v34 = __Block_byref_object_dispose__9;
    id v35 = 0;
    id v8 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_10;
    v29[3] = &unk_26538F958;
    v29[4] = &buf;
    id v9 = objc_msgSend(v8, "_queue_syncProxyWithErrorHandler:", v29);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2;
    v28[3] = &unk_26538F980;
    v28[4] = &buf;
    v28[5] = &v30;
    [v9 getProgressForIdentity:v7 completion:v28];

    uint64_t v10 = (void *)v31[5];
    if (v10)
    {
      if ([v10 installPhase] != 6)
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2_14;
        v24[3] = &unk_26538F890;
        id v25 = *(id *)(a1 + 32);
        objc_super v26 = &v30;
        uint64_t v18 = MEMORY[0x2533C8180](v24);
        uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
        v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(&buf, 8);

        v21 = _IPDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_252AA9000, v21, OS_LOG_TYPE_DEFAULT, "really registering progress source", (uint8_t *)&buf, 2u);
        }

        uint64_t v7 = [*(id *)(a1 + 32) collationKey];
        v22 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v7];
        if (!v22)
        {
          v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
          [*(id *)(*(void *)(a1 + 40) + 40) setObject:v22 forKey:v7];
        }
        [v22 addObject:*(void *)(a1 + 32)];

        goto LABEL_18;
      }
      uint64_t v11 = _IPClientLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)v36 = 138412290;
        uint64_t v37 = v12;
        _os_log_impl(&dword_252AA9000, v11, OS_LOG_TYPE_DEFAULT, "current progress for %@ was complete on resumption; synthesizing end event and not registering",
          v36,
          0xCu);
      }

      uint64_t v13 = v27;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_13;
      v27[3] = &unk_26538F930;
      v27[4] = *(id *)(a1 + 32);
      uint64_t v14 = MEMORY[0x2533C8180](v27);
    }
    else
    {
      v15 = _IPClientLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_cold_1();
      }

      uint64_t v13 = v23;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_15;
      v23[3] = &unk_26538F930;
      v23[4] = *(id *)(a1 + 32);
      uint64_t v14 = MEMORY[0x2533C8180](v23);
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v14;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&buf, 8);

LABEL_18:
  }
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_10(uint64_t a1, void *a2)
{
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithReason:1];
}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_2_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyOfUpdate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithReason:2];
}

- (void)unregisterProgressSource:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__IPGlobalInstallableStateSourceXPCBehavior_unregisterProgressSource___block_invoke;
  v7[3] = &unk_26538F700;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(q, v7);
}

void __70__IPGlobalInstallableStateSourceXPCBehavior_unregisterProgressSource___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _IPDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_252AA9000, v2, OS_LOG_TYPE_DEFAULT, "unregistering progress source %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) collationKey];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v4];
  [v5 removeObject:*(void *)(a1 + 32)];
  if (![v5 count]) {
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v4];
  }
}

- (void)_queue_resumeStateStreamSourceIfNecessary
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!self->_stateStreamSourceResumed)
  {
    uint64_t v3 = _IPClientLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      stateStreamSource = self->_stateStreamSource;
      int v5 = 138412290;
      int v6 = stateStreamSource;
      _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "resuming state stream source %@", (uint8_t *)&v5, 0xCu);
    }

    [(IPStateUpdateStreamSource *)self->_stateStreamSource resume];
    self->_stateStreamSourceResumed = 1;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__IPGlobalInstallableStateSourceXPCBehavior_addObserver___block_invoke;
  v7[3] = &unk_26538F700;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(q, v7);
}

uint64_t __57__IPGlobalInstallableStateSourceXPCBehavior_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_resumeStateStreamSourceIfNecessary");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  q = self->_q;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__IPGlobalInstallableStateSourceXPCBehavior_removeObserver___block_invoke;
  v7[3] = &unk_26538F700;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(q, v7);
}

uint64_t __60__IPGlobalInstallableStateSourceXPCBehavior_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)_queue_registerAsProgressObserverIfNecessary
{
}

void __89__IPGlobalInstallableStateSourceXPCBehavior__queue_registerAsProgressObserverIfNecessary__block_invoke(uint64_t a1, void *a2)
{
}

- (id)_queue_connectedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  p_currentConnection = &self->_currentConnection;
  currentConnection = self->_currentConnection;
  if (!currentConnection)
  {
    int v5 = (*((void (**)(void))self->_connectionProvider + 2))();
    [v5 _setQueue:self->_q];
    id v6 = IPClientExportedInterface();
    [v5 setExportedInterface:v6];

    [v5 setExportedObject:self];
    uint64_t v7 = IPServerExportedInterface();
    [v5 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke;
    v12[3] = &unk_26538F9A8;
    objc_copyWeak(&v13, &location);
    [v5 setInterruptionHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16;
    v10[3] = &unk_26538F9A8;
    objc_copyWeak(&v11, &location);
    [v5 setInvalidationHandler:v10];
    objc_storeStrong((id *)p_currentConnection, v5);
    [(NSXPCConnection *)*p_currentConnection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

    currentConnection = *p_currentConnection;
    if (!*p_currentConnection)
    {
      id v8 = _IPClientLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[IPGlobalInstallableStateSourceXPCBehavior _queue_connectedConnection](v8);
      }

      currentConnection = *p_currentConnection;
    }
  }

  return currentConnection;
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = _IPClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_cold_1(v2);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 72) = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = WeakRetained[5];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [v4[5] objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          uint64_t v11 = [v10 count];

          if (v11)
          {
            uint64_t v12 = _IPClientLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v13 = 0;
              _os_log_impl(&dword_252AA9000, v12, OS_LOG_TYPE_DEFAULT, "someone is registered for progress, reconnecting...", v13, 2u);
            }

            objc_msgSend(v4, "_queue_registerAsProgressObserverIfNecessary");
            goto LABEL_16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16(uint64_t a1)
{
  v2 = _IPClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;
  }
}

- (id)_queue_syncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_connectedConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_queue_asyncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_connectedConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_installableStateSourcesForStates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [IPAppStateSource alloc];
        id v13 = objc_msgSend(v11, "identity", (void)v17);
        long long v14 = [(IPAppStateSource *)v12 initWithApplicationIdentity:v13 forStateSourceRegistry:self];
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = (void *)[v5 copy];

  return v15;
}

- (id)_queue_makeExtantStateSourcesForGlobalSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__8;
  long long v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke;
  v12[3] = &unk_26538F958;
  void v12[4] = &v13;
  uint64_t v7 = [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_syncProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19;
  v11[3] = &unk_26538F9D0;
  v11[5] = &v13;
  v11[6] = &v19;
  v11[4] = self;
  [v7 getAllInstallableStates:v11];

  uint64_t v8 = (void *)v20[5];
  if (a4 && !v8)
  {
    *a4 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _IPClientLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) _installableStateSourcesForStates:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = _IPClientLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19_cold_1();
    }
  }
}

- (id)_queue_makeInstallingStateSourcesForGlobalSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__8;
  uint64_t v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__8;
  long long v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke;
  v12[3] = &unk_26538F958;
  void v12[4] = &v19;
  uint64_t v7 = [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_syncProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21;
  v11[3] = &unk_26538F9F8;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = &v13;
  [v7 getActiveInstallations:v11];

  uint64_t v8 = (void *)v14[5];
  if (a4 && !v8)
  {
    *a4 = (id) v20[5];
    uint64_t v8 = (void *)v14[5];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v9;
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _IPClientLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v24 = v6;
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v14 isInstalling])
          {
            uint64_t v15 = [IPAppStateSource alloc];
            long long v16 = [v14 identity];
            long long v17 = [(IPAppStateSource *)v15 initWithApplicationIdentity:v16 forStateSourceRegistry:a1[4]];

            [v8 addObject:v17];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [v8 copy];
    uint64_t v19 = *(void *)(a1[6] + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v7 = v24;
  }
  else
  {
    uint64_t v21 = _IPClientLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21_cold_1();
    }

    uint64_t v22 = *(void *)(a1[5] + 8);
    id v23 = v7;
    id v8 = *(id *)(v22 + 40);
    *(void *)(v22 + 40) = v23;
  }
}

- (void)makeInstallingStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__8;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke;
  block[3] = &unk_26538FA20;
  long long v16 = &v17;
  void block[4] = self;
  id v9 = v6;
  id v15 = v9;
  dispatch_sync(q, block);
  uint64_t v10 = (void *)v18[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke_2;
  v12[3] = &unk_26538FA48;
  id v11 = v7;
  id v13 = v11;
  [v10 enumerateObjectsUsingBlock:v12];

  _Block_object_dispose(&v17, 8);
}

uint64_t __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_makeInstallingStateSourcesForGlobalSource:error:", *(void *)(a1 + 40), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __100__IPGlobalInstallableStateSourceXPCBehavior_makeInstallingStateSourcesForGlobalSource_andEnumerate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)makeExtantStateSourcesForGlobalSource:(id)a3 andEnumerate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__8;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke;
  block[3] = &unk_26538FA20;
  long long v16 = &v17;
  void block[4] = self;
  id v9 = v6;
  id v15 = v9;
  dispatch_sync(q, block);
  uint64_t v10 = (void *)v18[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke_2;
  v12[3] = &unk_26538FA48;
  id v11 = v7;
  id v13 = v11;
  [v10 enumerateObjectsUsingBlock:v12];

  _Block_object_dispose(&v17, 8);
}

uint64_t __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_makeExtantStateSourcesForGlobalSource:error:", *(void *)(a1 + 40), 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __96__IPGlobalInstallableStateSourceXPCBehavior_makeExtantStateSourcesForGlobalSource_andEnumerate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)currentProgressForIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__8;
  uint64_t v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__8;
  id v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke;
  block[3] = &unk_26538FA70;
  void block[4] = self;
  void block[5] = &v26;
  block[6] = &v20;
  dispatch_sync(q, block);
  id v8 = (void *)v27[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_3;
  v12[3] = &unk_26538F980;
  void v12[4] = &v14;
  void v12[5] = &v20;
  [v8 getProgressForIdentity:v6 completion:v12];
  id v9 = (void *)v15[5];
  if (a4 && !v9)
  {
    *a4 = (id) v21[5];
    id v9 = (void *)v15[5];
  }
  id v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_2;
  v6[3] = &unk_26538F958;
  v6[4] = a1[6];
  uint64_t v3 = objc_msgSend(v2, "_queue_syncProxyWithErrorHandler:", v6);
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __78__IPGlobalInstallableStateSourceXPCBehavior_currentProgressForIdentity_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)serverActionBarrierForTesting
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_q);
  q = self->_q;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke;
  block[3] = &unk_26538F930;
  void block[4] = self;
  dispatch_sync(q, block);
}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_syncProxyWithErrorHandler:", &__block_literal_global_24);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 actionBarrier:&__block_literal_global_24];
}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _IPClientLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2_cold_1();
    }
  }
}

- (void)installableForIdentity:(id)a3 progressChanged:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v8 = _IPClientLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_252AA9000, v8, OS_LOG_TYPE_DEFAULT, "Installable for identity %@ progress changed to %@", buf, 0x16u);
  }

  uint64_t v9 = [(NSMutableDictionary *)self->_registeredProgressSources objectForKey:v6];
  id v10 = [v9 allObjects];
  id v11 = (void *)[v10 copy];

  if ([v11 count])
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressChanged___block_invoke;
    block[3] = &unk_26538FAB8;
    id v15 = v11;
    id v16 = v7;
    id v17 = v6;
    dispatch_async(calloutQueue, block);

    id v13 = v15;
  }
  else
  {
    id v13 = _IPClientLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_252AA9000, v13, OS_LOG_TYPE_DEFAULT, "No observers to notify of progress to %@", buf, 0xCu);
    }
  }
}

void __84__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6++), "notifyOfUpdate:", *(void *)(a1 + 40), (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }

  id v7 = _IPClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_252AA9000, v7, OS_LOG_TYPE_DEFAULT, "Notified observers of update to %@", buf, 0xCu);
  }
}

- (void)installableForIdentity:(id)a3 progressEndedForReason:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  id v7 = _IPClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    _os_log_impl(&dword_252AA9000, v7, OS_LOG_TYPE_DEFAULT, "Installable for identity %@ progress ended with reason %llu", buf, 0x16u);
  }

  uint64_t v8 = [(NSMutableDictionary *)self->_registeredProgressSources objectForKey:v6];
  long long v9 = [v8 allObjects];

  [(NSMutableDictionary *)self->_registeredProgressSources removeObjectForKey:v6];
  if ([v9 count])
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressEndedForReason___block_invoke;
    block[3] = &unk_26538FAE0;
    id v13 = v9;
    unint64_t v15 = a4;
    id v14 = v6;
    dispatch_async(calloutQueue, block);

    long long v11 = v13;
  }
  else
  {
    long long v11 = _IPClientLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_252AA9000, v11, OS_LOG_TYPE_DEFAULT, "No observers to notify of finish of %@", buf, 0xCu);
    }
  }
}

void __91__IPGlobalInstallableStateSourceXPCBehavior_installableForIdentity_progressEndedForReason___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6++), "finishWithReason:", *(void *)(a1 + 48), (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }

  id v7 = _IPClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_252AA9000, v7, OS_LOG_TYPE_DEFAULT, "Notified observers of finish of %@", buf, 0xCu);
  }
}

- (void)_queue_noteInstallBeganForIdentity:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  uint64_t v5 = _IPClientLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "Install began for %@", buf, 0xCu);
  }

  uint64_t v6 = [(NSMutableDictionary *)self->_registeredStateSources objectForKey:v4];
  id v7 = [v6 allObjects];

  if ([v7 count])
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__IPGlobalInstallableStateSourceXPCBehavior__queue_noteInstallBeganForIdentity___block_invoke;
    block[3] = &unk_26538F930;
    id v10 = v7;
    dispatch_async(calloutQueue, block);
  }
}

void __80__IPGlobalInstallableStateSourceXPCBehavior__queue_noteInstallBeganForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "noteInstallStarted", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_queue_sendStateSourceAvailableForIdentity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_q);
  uint64_t v5 = [(NSHashTable *)self->_stateUpdateObservers allObjects];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke;
  v17[3] = &unk_26538FB08;
  id v6 = v4;
  id v18 = v6;
  unint64_t v19 = self;
  long long v7 = (void *)MEMORY[0x2533C8180](v17);
  calloutQueue = self->_calloutQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke_2;
  v12[3] = &unk_26538FB30;
  id v13 = v5;
  uint64_t v14 = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(calloutQueue, v12);
}

IPAppStateSource *__88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke(uint64_t a1)
{
  id v1 = [[IPAppStateSource alloc] initWithApplicationIdentity:*(void *)(a1 + 32) forStateSourceRegistry:*(void *)(a1 + 40)];

  return v1;
}

void __88__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceAvailableForIdentity___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "globalStateSourceBehavior:stateSourceAvailableForIdentity:withGenerator:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_queue_sendStateSourceUnavailableForIdentity:(id)a3
{
  q = self->_q;
  id v5 = a3;
  dispatch_assert_queue_V2(q);
  uint64_t v6 = [(NSMutableDictionary *)self->_registeredStateSources objectForKey:v5];
  long long v7 = [v6 allObjects];

  [(NSMutableDictionary *)self->_registeredStateSources removeObjectForKey:v5];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceUnavailableForIdentity___block_invoke;
  block[3] = &unk_26538F930;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(calloutQueue, block);
}

void __90__IPGlobalInstallableStateSourceXPCBehavior__queue_sendStateSourceUnavailableForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "noteRemoved", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)stateUpdateStreamSource:(id)a3 updateMessageReceived:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v6 = _IPClientLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_252AA9000, v6, OS_LOG_TYPE_DEFAULT, "received update message %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v7 = [v5 type];
  switch(v7)
  {
    case 4:
      long long v9 = [v5 identity];
      [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_sendStateSourceUnavailableForIdentity:v9];
      goto LABEL_11;
    case 3:
      goto LABEL_7;
    case 1:
      long long v8 = [v5 identity];
      [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_noteInstallBeganForIdentity:v8];

LABEL_7:
      long long v9 = [v5 identity];
      [(IPGlobalInstallableStateSourceXPCBehavior *)self _queue_sendStateSourceAvailableForIdentity:v9];
      goto LABEL_11;
  }
  long long v9 = _IPClientLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v5 type];
    int v11 = 67109120;
    LODWORD(v12) = v10;
    _os_log_impl(&dword_252AA9000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring update message of type %u for now", (uint8_t *)&v11, 8u);
  }
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_stateUpdateObservers, 0);
  objc_storeStrong((id *)&self->_registeredProgressSources, 0);
  objc_storeStrong((id *)&self->_registeredStateSources, 0);
  objc_storeStrong((id *)&self->_currentConnection, 0);
  objc_storeStrong(&self->_connectionProvider, 0);

  objc_storeStrong((id *)&self->_stateStreamSource, 0);
}

void __65__IPGlobalInstallableStateSourceXPCBehavior_registerStateSource___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "Could not fetch installable state source current state: %@", v2, v3, v4, v5, v6);
}

void __68__IPGlobalInstallableStateSourceXPCBehavior_registerProgressSource___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_252AA9000, v1, OS_LOG_TYPE_ERROR, "could not fetch progress data for %@, synthesizing cancel event: %@", v2, 0x16u);
}

- (void)_queue_connectedConnection
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_252AA9000, log, OS_LOG_TYPE_FAULT, "connection provider returned nil!", v1, 2u);
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_252AA9000, log, OS_LOG_TYPE_ERROR, "connection to InstallProgress server interrupted.", v1, 2u);
}

void __71__IPGlobalInstallableStateSourceXPCBehavior__queue_connectedConnection__block_invoke_16_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_252AA9000, log, OS_LOG_TYPE_ERROR, "connection to InstallProgress server invalidated!", v1, 2u);
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "could not fetch all state sources: connection error: %@", v2, v3, v4, v5, v6);
}

void __96__IPGlobalInstallableStateSourceXPCBehavior__queue_makeExtantStateSourcesForGlobalSource_error___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "couldn't get installable states: %@", v2, v3, v4, v5, v6);
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "could not fetch state sources: connection error: %@", v2, v3, v4, v5, v6);
}

void __100__IPGlobalInstallableStateSourceXPCBehavior__queue_makeInstallingStateSourcesForGlobalSource_error___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "could not get state sources: %@", v2, v3, v4, v5, v6);
}

void __74__IPGlobalInstallableStateSourceXPCBehavior_serverActionBarrierForTesting__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_252AA9000, v0, v1, "server action barrier failed: %@", v2, v3, v4, v5, v6);
}

@end