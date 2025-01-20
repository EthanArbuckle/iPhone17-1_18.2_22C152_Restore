@interface COCompanionLinkClient
- (BOOL)isInvalidated;
- (BOOL)usingOnDemandConnection;
- (COCompanionLinkClient)initWithCompanionLinkClient:(id)a3;
- (COCompanionLinkClientFactory)factory;
- (NSError)activationError;
- (NSMutableSet)registeredEventIDs;
- (NSMutableSet)registeredRequestIDs;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)rapport;
- (id)activationHandler;
- (id)activeDevices;
- (id)destinationDevice;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)disconnectHandler;
- (id)errorFlagsChangedHandler;
- (id)eventIDRegistrationCompletion;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)localDevice;
- (id)localDeviceUpdatedHandler;
- (id)requestIDRegistrationCompletion;
- (id)stateUpdatedHandler;
- (unint64_t)controlFlags;
- (unint64_t)errorFlags;
- (unint64_t)flags;
- (void)_withLock:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)didActivateWithError:(id)a3;
- (void)didChangeErrorFlags;
- (void)didDisconnect;
- (void)didInterrupt;
- (void)didInvalidate;
- (void)didUpdateState;
- (void)invalidate;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setActivationError:(id)a3;
- (void)setActivationHandler:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorFlagsChangedHandler:(id)a3;
- (void)setEventIDRegistrationCompletion:(id)a3;
- (void)setFactory:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalDeviceUpdatedHandler:(id)a3;
- (void)setRequestIDRegistrationCompletion:(id)a3;
- (void)setStateUpdatedHandler:(id)a3;
@end

@implementation COCompanionLinkClient

- (COCompanionLinkClient)initWithCompanionLinkClient:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COCompanionLinkClient;
  v6 = [(COCompanionLinkClient *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_isInvalidated = 0;
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x263EF83A0]);
    objc_storeStrong((id *)&v7->_rapport, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    registeredEventIDs = v7->_registeredEventIDs;
    v7->_registeredEventIDs = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    registeredRequestIDs = v7->_registeredRequestIDs;
    v7->_registeredRequestIDs = (NSMutableSet *)v10;

    v12 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v7;
      _os_log_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEFAULT, "%p new link created", buf, 0xCu);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(COCompanionLinkClient *)self registeredRequestIDs];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__COCompanionLinkClient_dealloc__block_invoke;
  v9[3] = &unk_2645CC280;
  v9[4] = self;
  [v3 enumerateObjectsUsingBlock:v9];

  v4 = [(COCompanionLinkClient *)self registeredEventIDs];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__COCompanionLinkClient_dealloc__block_invoke_2;
  v8[3] = &unk_2645CC280;
  v8[4] = self;
  [v4 enumerateObjectsUsingBlock:v8];

  id v5 = [(COCompanionLinkClient *)self factory];
  [v5 removeClient:self];

  v6 = COCoreLogForCategory(18);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = self;
    _os_log_impl(&dword_2217C1000, v6, OS_LOG_TYPE_DEFAULT, "%p link destroyed", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)COCompanionLinkClient;
  [(COCompanionLinkClient *)&v7 dealloc];
}

uint64_t __32__COCompanionLinkClient_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deregisterRequestID:a2];
}

uint64_t __32__COCompanionLinkClient_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deregisterEventID:a2];
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isInvalidated);
  return v2 & 1;
}

- (void)didActivateWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

void __46__COCompanionLinkClient_didActivateWithError___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(void *)(v2 + 24) & 3) == 1)
  {
    *(void *)(v2 + 24) |= 2uLL;
    v3 = [*(id *)(a1 + 32) activationHandler];
    [*(id *)(a1 + 32) setActivationHandler:0];
    [*(id *)(a1 + 32) setActivationError:*(void *)(a1 + 40)];
    uint64_t v4 = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32) + 72));
    id v5 = (void *)v4;
    if (!*(void *)(a1 + 40)
      && v4
      && ([*(id *)(a1 + 32) rapport],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 activeDevices],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          v7))
    {
      uint64_t v8 = COCoreLogForCategory(18);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = v9;
        __int16 v23 = 2048;
        uint64_t v24 = [v7 count];
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p did activate with %ld devices", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v8 = COCoreLogForCategory(18);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v12;
        _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p did activate", buf, 0xCu);
      }
      id v7 = 0;
    }

    v13 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke_3;
    v16[3] = &unk_2645CDC48;
    id v19 = v3;
    id v17 = *(id *)(a1 + 40);
    id v18 = v7;
    id v20 = v5;
    id v14 = v5;
    id v15 = v7;
    uint64_t v10 = v3;
    dispatch_async(v13, v16);
  }
  else
  {
    uint64_t v10 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v11;
      _os_log_impl(&dword_2217C1000, v10, OS_LOG_TYPE_DEFAULT, "%p not activated yet so ignoring underlying activation", buf, 0xCu);
    }
  }
}

void __46__COCompanionLinkClient_didActivateWithError___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__COCompanionLinkClient_didActivateWithError___block_invoke_2;
  v3[3] = &unk_2645CDC20;
  id v4 = *(id *)(a1 + 56);
  [v2 enumerateObjectsUsingBlock:v3];
}

uint64_t __46__COCompanionLinkClient_didActivateWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didInterrupt
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__COCompanionLinkClient_didInterrupt__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

uint64_t __37__COCompanionLinkClient_didInterrupt__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32) + 32));
  v3 = v2;
  if (v2)
  {
    id v5 = v2;
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), v2);
    v3 = v5;
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)didUpdateState
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__COCompanionLinkClient_didUpdateState__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

uint64_t __39__COCompanionLinkClient_didUpdateState__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(unsigned char *)(v1 + 24) & 8) == 0)
  {
    uint64_t v2 = result;
    v3 = (void *)MEMORY[0x223C8B4A0](*(void *)(v1 + 40));
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
      dispatch_async(*(dispatch_queue_t *)(*(void *)(v2 + 32) + 16), v3);
      id v4 = v5;
    }
    return MEMORY[0x270F9A758](v3, v4);
  }
  return result;
}

- (void)didChangeErrorFlags
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__COCompanionLinkClient_didChangeErrorFlags__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

uint64_t __44__COCompanionLinkClient_didChangeErrorFlags__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(unsigned char *)(v1 + 24) & 8) == 0)
  {
    uint64_t v2 = result;
    v3 = (void *)MEMORY[0x223C8B4A0](*(void *)(v1 + 48));
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
      dispatch_async(*(dispatch_queue_t *)(*(void *)(v2 + 32) + 16), v3);
      id v4 = v5;
    }
    return MEMORY[0x270F9A758](v3, v4);
  }
  return result;
}

- (void)didDisconnect
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__COCompanionLinkClient_didDisconnect__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

uint64_t __38__COCompanionLinkClient_didDisconnect__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 24);
  if ((v2 & 0xC) == 0)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 24) = v2 | 4;
    id v4 = (void *)MEMORY[0x223C8B4A0](*(void *)(*(void *)(result + 32) + 56));
    id v5 = v4;
    if (v4)
    {
      v6 = v4;
      dispatch_async(*(dispatch_queue_t *)(*(void *)(v3 + 32) + 16), v4);
      id v5 = v6;
    }
    return MEMORY[0x270F9A758](v4, v5);
  }
  return result;
}

- (void)didInvalidate
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

void __38__COCompanionLinkClient_didInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 24) & 8) != 0)
  {
    uint64_t v9 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p did secondary invalidation", buf, 0xCu);
    }
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)(v2 + 12));
    *(void *)(*(void *)(a1 + 32) + 24) |= 0xFuLL;
    uint64_t v3 = [*(id *)(a1 + 32) registeredRequestIDs];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke_2;
    v12[3] = &unk_2645CC280;
    v12[4] = *(void *)(a1 + 32);
    [v3 enumerateObjectsUsingBlock:v12];

    id v4 = [*(id *)(a1 + 32) registeredEventIDs];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__COCompanionLinkClient_didInvalidate__block_invoke_3;
    v11[3] = &unk_2645CC280;
    v11[4] = *(void *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v11];

    id v5 = [*(id *)(a1 + 32) registeredEventIDs];
    [v5 removeAllObjects];

    v6 = [*(id *)(a1 + 32) registeredRequestIDs];
    [v6 removeAllObjects];

    id v7 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p did invalidate", buf, 0xCu);
    }

    uint64_t v9 = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32) + 64));
    if (v9) {
      dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), v9);
    }
  }
}

uint64_t __38__COCompanionLinkClient_didInvalidate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deregisterRequestID:a2];
}

uint64_t __38__COCompanionLinkClient_didInvalidate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deregisterEventID:a2];
}

- (unint64_t)flags
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__COCompanionLinkClient_flags__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__COCompanionLinkClient_flags__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__23;
  uint64_t v9 = __Block_byref_object_dispose__23;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__COCompanionLinkClient_dispatchQueue__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (OS_dispatch_queue *)v2;
}

void __38__COCompanionLinkClient_dispatchQueue__block_invoke(uint64_t a1)
{
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__COCompanionLinkClient_setDispatchQueue___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

void __42__COCompanionLinkClient_setDispatchQueue___block_invoke(uint64_t a1)
{
}

- (id)interruptionHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_interruptionHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  id v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__COCompanionLinkClient_interruptionHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 32));
  return MEMORY[0x270F9A758]();
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setInterruptionHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __48__COCompanionLinkClient_setInterruptionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)stateUpdatedHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_stateUpdatedHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__COCompanionLinkClient_stateUpdatedHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 40));
  return MEMORY[0x270F9A758]();
}

- (void)setStateUpdatedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setStateUpdatedHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __48__COCompanionLinkClient_setStateUpdatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)errorFlagsChangedHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__COCompanionLinkClient_errorFlagsChangedHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __49__COCompanionLinkClient_errorFlagsChangedHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 48));
  return MEMORY[0x270F9A758]();
}

- (void)setErrorFlagsChangedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__COCompanionLinkClient_setErrorFlagsChangedHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __53__COCompanionLinkClient_setErrorFlagsChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)disconnectHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__COCompanionLinkClient_disconnectHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __42__COCompanionLinkClient_disconnectHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 56));
  return MEMORY[0x270F9A758]();
}

- (void)setDisconnectHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_setDisconnectHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __46__COCompanionLinkClient_setDisconnectHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  *(void *)(v3 + 56) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)invalidationHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__COCompanionLinkClient_invalidationHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __44__COCompanionLinkClient_invalidationHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 64));
  return MEMORY[0x270F9A758]();
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_setInvalidationHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __48__COCompanionLinkClient_setInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)deviceFoundHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__COCompanionLinkClient_deviceFoundHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __43__COCompanionLinkClient_deviceFoundHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 72));
  return MEMORY[0x270F9A758]();
}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__COCompanionLinkClient_setDeviceFoundHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __47__COCompanionLinkClient_setDeviceFoundHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 72);
  *(void *)(v3 + 72) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)deviceLostHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__COCompanionLinkClient_deviceLostHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __42__COCompanionLinkClient_deviceLostHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 80));
  return MEMORY[0x270F9A758]();
}

- (void)setDeviceLostHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__COCompanionLinkClient_setDeviceLostHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __46__COCompanionLinkClient_setDeviceLostHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)localDeviceUpdatedHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__COCompanionLinkClient_localDeviceUpdatedHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __50__COCompanionLinkClient_localDeviceUpdatedHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 88));
  return MEMORY[0x270F9A758]();
}

- (void)setLocalDeviceUpdatedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__COCompanionLinkClient_setLocalDeviceUpdatedHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __54__COCompanionLinkClient_setLocalDeviceUpdatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 88);
  *(void *)(v3 + 88) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)deviceChangedHandler
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__COCompanionLinkClient_deviceChangedHandler__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  uint64_t v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __45__COCompanionLinkClient_deviceChangedHandler__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 96));
  return MEMORY[0x270F9A758]();
}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__COCompanionLinkClient_setDeviceChangedHandler___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

uint64_t __49__COCompanionLinkClient_setDeviceChangedHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 96);
  *(void *)(v3 + 96) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setRequestIDRegistrationCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke;
  v6[3] = &unk_2645CDC98;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(COCompanionLinkClient *)self _withLock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_2;
  v5[3] = &unk_2645CDC70;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = MEMORY[0x223C8B4A0](v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  objc_destroyWeak(&v7);
}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_3;
    v6[3] = &unk_2645CB1E8;
    id v8 = &v9;
    v6[4] = WeakRetained;
    id v7 = v3;
    [v5 _withLock:v6];
    if (*((unsigned char *)v10 + 24)) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __60__COCompanionLinkClient_setRequestIDRegistrationCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredRequestIDs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (id)requestIDRegistrationCompletion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__COCompanionLinkClient_requestIDRegistrationCompletion__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  id v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __56__COCompanionLinkClient_requestIDRegistrationCompletion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 104));
  return MEMORY[0x270F9A758]();
}

- (void)setEventIDRegistrationCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke;
  v6[3] = &unk_2645CDC98;
  v6[4] = self;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(COCompanionLinkClient *)self _withLock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_2;
  v5[3] = &unk_2645CDC70;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  uint64_t v2 = MEMORY[0x223C8B4A0](v5);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  objc_destroyWeak(&v7);
}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_3;
    v6[3] = &unk_2645CB1E8;
    id v8 = &v9;
    v6[4] = WeakRetained;
    id v7 = v3;
    [v5 _withLock:v6];
    if (*((unsigned char *)v10 + 24)) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __58__COCompanionLinkClient_setEventIDRegistrationCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredEventIDs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (id)eventIDRegistrationCompletion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__6;
  uint64_t v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__COCompanionLinkClient_eventIDRegistrationCompletion__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COCompanionLinkClient *)self _withLock:v4];
  id v2 = (void *)MEMORY[0x223C8B4A0](v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __54__COCompanionLinkClient_eventIDRegistrationCompletion__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x223C8B4A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 112));
  return MEMORY[0x270F9A758]();
}

- (id)localDevice
{
  id v2 = [(COCompanionLinkClient *)self rapport];
  id v3 = [v2 localDevice];

  return v3;
}

- (id)destinationDevice
{
  id v2 = [(COCompanionLinkClient *)self rapport];
  id v3 = [v2 destinationDevice];

  return v3;
}

- (id)activeDevices
{
  id v3 = [(COCompanionLinkClient *)self factory];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 activeDevices];
  }
  else
  {
    id v6 = [(COCompanionLinkClient *)self rapport];
    uint64_t v5 = [v6 activeDevices];
  }
  return v5;
}

- (unint64_t)controlFlags
{
  id v2 = [(COCompanionLinkClient *)self rapport];
  unint64_t v3 = [v2 controlFlags];

  return v3;
}

- (void)setControlFlags:(unint64_t)a3
{
  if (([(COCompanionLinkClient *)self flags] & 3) == 0)
  {
    id v5 = [(COCompanionLinkClient *)self rapport];
    [v5 setControlFlags:a3];
  }
}

- (BOOL)usingOnDemandConnection
{
  id v2 = [(COCompanionLinkClient *)self rapport];
  char v3 = [v2 usingOnDemandConnection];

  return v3;
}

- (unint64_t)errorFlags
{
  id v2 = [(COCompanionLinkClient *)self rapport];
  unint64_t v3 = [v2 errorFlags];

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__COCompanionLinkClient_activateWithCompletion___block_invoke;
  v6[3] = &unk_2645CBA10;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COCompanionLinkClient *)self _withLock:v6];
}

void __48__COCompanionLinkClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    id v5 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v6;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p activating already activated link", buf, 0xCu);
    }

    id v7 = [*(id *)(a1 + 32) activationError];
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__COCompanionLinkClient_activateWithCompletion___block_invoke_9;
    v10[3] = &unk_2645CB170;
    id v9 = *(id *)(a1 + 40);
    id v11 = v7;
    id v12 = v9;
    id v4 = v7;
    dispatch_async(v8, v10);
  }
  else
  {
    id v2 = COCoreLogForCategory(18);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v3;
      _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p activating", buf, 0xCu);
    }

    *(void *)(*(void *)(a1 + 32) + 24) |= 1uLL;
    [*(id *)(a1 + 32) setActivationHandler:*(void *)(a1 + 40)];
    id v4 = [*(id *)(a1 + 32) factory];
    [v4 activateCompanionLinkClient:*(void *)(a1 + 32)];
  }
}

uint64_t __48__COCompanionLinkClient_activateWithCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidate
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__COCompanionLinkClient_invalidate__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COCompanionLinkClient *)self _withLock:v2];
}

void __35__COCompanionLinkClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = COCoreLogForCategory(18);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 8) != 0)
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p ignoring attempt to invalidate", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p invalidating", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 32) factory];
    [v3 invalidateCompanionLinkClient:*(void *)(a1 + 32)];
  }
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke;
  v17[3] = &unk_2645CAE80;
  v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  [(COCompanionLinkClient *)self _withLock:v17];
  id v12 = [(COCompanionLinkClient *)self rapport];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_2;
  v14[3] = &unk_2645CDCE8;
  objc_copyWeak(&v16, &location);
  id v13 = v10;
  id v15 = v13;
  [v12 registerEventID:v11 options:v9 handler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredEventIDs];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_3;
    block[3] = &unk_2645CDCC0;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __57__COCompanionLinkClient_registerEventID_options_handler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deregisterEventID:(id)a3
{
  id v4 = a3;
  id v5 = [(COCompanionLinkClient *)self rapport];
  [v5 deregisterEventID:v4];
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke;
  v17[3] = &unk_2645CAE80;
  v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  [(COCompanionLinkClient *)self _withLock:v17];
  id v12 = [(COCompanionLinkClient *)self rapport];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_2;
  v14[3] = &unk_2645CDD10;
  objc_copyWeak(&v16, &location);
  id v13 = v10;
  id v15 = v13;
  [v12 registerRequestID:v11 options:v9 handler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredRequestIDs];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained dispatchQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_3;
    v13[3] = &unk_2645CDC48;
    id v16 = *(id *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v17 = v9;
    dispatch_async(v12, v13);
  }
}

uint64_t __59__COCompanionLinkClient_registerRequestID_options_handler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

- (void)deregisterRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(COCompanionLinkClient *)self rapport];
  [v5 deregisterRequestID:v4];
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(COCompanionLinkClient *)self rapport];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke;
  v16[3] = &unk_2645CB3E0;
  objc_copyWeak(&v18, &location);
  id v15 = v13;
  id v17 = v15;
  [v14 sendEventID:v10 event:v11 options:v12 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke_2;
    v7[3] = &unk_2645CB170;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __62__COCompanionLinkClient_sendEventID_event_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(COCompanionLinkClient *)self rapport];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke;
  v16[3] = &unk_2645CDD38;
  objc_copyWeak(&v18, &location);
  id v15 = v13;
  id v17 = v15;
  [v14 sendRequestID:v10 request:v11 options:v12 responseHandler:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained dispatchQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke_2;
    v13[3] = &unk_2645CB520;
    id v17 = *(id *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, v13);
  }
}

uint64_t __71__COCompanionLinkClient_sendRequestID_request_options_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (COCompanionLinkClientFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  return (COCompanionLinkClientFactory *)WeakRetained;
}

- (void)setFactory:(id)a3
{
}

- (RPCompanionLinkClient)rapport
{
  return self->_rapport;
}

- (NSError)activationError
{
  return self->_activationError;
}

- (void)setActivationError:(id)a3
{
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (NSMutableSet)registeredEventIDs
{
  return self->_registeredEventIDs;
}

- (NSMutableSet)registeredRequestIDs
{
  return self->_registeredRequestIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredRequestIDs, 0);
  objc_storeStrong((id *)&self->_registeredEventIDs, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong((id *)&self->_activationError, 0);
  objc_storeStrong((id *)&self->_rapport, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong(&self->_eventIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_requestIDRegistrationCompletion, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_localDeviceUpdatedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end