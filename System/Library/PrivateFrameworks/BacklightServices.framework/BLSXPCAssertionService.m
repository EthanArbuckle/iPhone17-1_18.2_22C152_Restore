@interface BLSXPCAssertionService
+ (id)defaultEndpoint;
- (BLSXPCAssertionService)init;
- (BLSXPCAssertionService)initWithEndpoint:(id)a3;
- (id)_queue_assertionForIdentifier:(uint64_t)a1;
- (void)_queue_acquireAssertion:(void *)a3 withRemoteTarget:;
- (void)_queue_reconnectAssertions;
- (void)_queue_removeAssertionForIdentifier:(uint64_t)a1;
- (void)_queue_setAssertion:(void *)a3 forIdentifier:;
- (void)acquireAssertion:(id)a3;
- (void)assertion:(id)a3 failedToAcquireWithError:(id)a4;
- (void)assertionAcquired:(id)a3;
- (void)assertionDidCancel:(id)a3 withError:(id)a4;
- (void)assertionPaused:(id)a3;
- (void)assertionResumed:(id)a3;
- (void)assertionWillCancel:(id)a3;
- (void)cancelAssertion:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)enqueueRemoteRequest:(uint64_t)a1;
- (void)invalidate;
- (void)queue_assertionResponder:(void *)a3 didFailToAcquireWithBLSError:;
- (void)replaceWithService:(id)a3;
- (void)restartAssertionTimeoutTimer:(id)a3;
@end

@implementation BLSXPCAssertionService

+ (id)defaultEndpoint
{
  v2 = (void *)MEMORY[0x1E4F50BB8];
  v3 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v4 = +[BLSXPCAssertionServiceSpecification identifier];
  v5 = [v2 endpointForMachName:v3 service:v4 instance:0];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F50BB8];
    v9 = +[BLSXPCAssertionServiceSpecification identifier];
    id v7 = [v8 nullEndpointForService:v9 instance:0];
  }

  return v7;
}

- (BLSXPCAssertionService)init
{
  v3 = +[BLSXPCAssertionService defaultEndpoint];
  v4 = [(BLSXPCAssertionService *)self initWithEndpoint:v3];

  return v4;
}

- (BLSXPCAssertionService)initWithEndpoint:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Bsserviceconne.isa);
  if (!v5)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BLSXPCAssertionService initWithEndpoint:](a2);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B55E6960);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[BLSXPCAssertionService initWithEndpoint:](a2);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B55E69C4);
  }

  v33.receiver = self;
  v33.super_class = (Class)BLSXPCAssertionService;
  v6 = [(BLSXPCAssertionService *)&v33 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    queue_assertions = v7->_queue_assertions;
    v7->_queue_assertions = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    queue_assertionsToReacquire = v7->_queue_assertionsToReacquire;
    v7->_queue_assertionsToReacquire = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
    connection = v7->_connection;
    v7->_connection = (BSServiceConnection *)v12;

    v14 = +[BLSXPCAssertionServiceSpecification serviceQuality];
    v15 = [MEMORY[0x1E4F4F730] serial];
    v16 = objc_msgSend(v15, "serviceClass:relativePriority:", objc_msgSend(v14, "serviceClass"), objc_msgSend(v14, "relativePriority"));
    v17 = (void *)BSDispatchQueueCreate();

    objc_storeStrong((id *)&v7->_requestQueue, v17);
    objc_initWeak(&location, v7);
    v18 = v7->_connection;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __43__BLSXPCAssertionService_initWithEndpoint___block_invoke;
    v27[3] = &unk_1E6107228;
    id v19 = v14;
    id v28 = v19;
    id v20 = v17;
    id v29 = v20;
    v21 = v7;
    v30 = v21;
    objc_copyWeak(&v31, &location);
    [(BSServiceConnection *)v18 configureConnection:v27];
    [(BSServiceConnection *)v7->_connection activate];
    v22 = bls_assertions_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v24 = v7->_connection;
      *(_DWORD *)buf = 134218498;
      v35 = v21;
      __int16 v36 = 2114;
      v37 = v24;
      __int16 v38 = 2114;
      id v39 = v5;
      _os_log_debug_impl(&dword_1B55DE000, v22, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __43__BLSXPCAssertionService_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setServiceQuality:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(a1 + 40)];
  v4 = +[BLSXPCAssertionServiceSpecification interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 48)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__BLSXPCAssertionService_initWithEndpoint___block_invoke_2;
  v5[3] = &unk_1E61071E0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v3 setInterruptionHandler:v5];
  [v3 setInvalidationHandler:&__block_literal_global_0];
  objc_destroyWeak(&v6);
}

void __43__BLSXPCAssertionService_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSXPCAssertionService _queue_reconnectAssertions]((uint64_t)WeakRetained);
}

- (void)_queue_reconnectAssertions
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v21 = _os_activity_create(&dword_1B55DE000, "BLSXPCAssertionService Reconnect", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v21, &state);
    v2 = bls_assertions_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = a1;
      _os_log_impl(&dword_1B55DE000, v2, OS_LOG_TYPE_DEFAULT, "%p Reconnect assertions", buf, 0xCu);
    }

    [*(id *)(a1 + 16) activate];
    id v3 = *(void **)(a1 + 32);
    v4 = [*(id *)(a1 + 24) objectEnumerator];
    id v5 = [v4 allObjects];
    [v3 addObjectsFromArray:v5];

    id v6 = [*(id *)(a1 + 32) allObjects];
    [*(id *)(a1 + 24) removeAllObjects];
    v22 = [*(id *)(a1 + 16) remoteTarget];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v12 = [v11 identifier];
          [v11 setIdentifier:0];
          uint64_t v13 = [v11 acquisitionState];
          unint64_t v14 = v13;
          if ((unint64_t)(v13 - 1) >= 2)
          {
            if (!v13)
            {
              id v19 = bls_assertions_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218498;
                uint64_t v29 = a1;
                __int16 v30 = 2114;
                id v31 = v11;
                __int16 v32 = 2114;
                objc_super v33 = v12;
                _os_log_impl(&dword_1B55DE000, v19, OS_LOG_TYPE_INFO, "%p %{public}@ oldIdentifier=%{public}@ is no longer acquired when handling the reconnection event, ignoring", buf, 0x20u);
              }
            }
          }
          else
          {
            v15 = [v11 identifier];
            BOOL v16 = v15 == 0;

            if (!v16)
            {
              id v20 = bls_assertions_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218498;
                uint64_t v29 = a1;
                __int16 v30 = 2114;
                id v31 = v11;
                __int16 v32 = 2114;
                objc_super v33 = v12;
                _os_log_impl(&dword_1B55DE000, v20, OS_LOG_TYPE_INFO, "%p %{public}@ oldIdentifier=%{public}@ has a new identifier, ignoring", buf, 0x20u);
              }

              goto LABEL_24;
            }
            v17 = bls_assertions_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = NSStringFromBLSAssertionAcquisitionState(v14);
              *(_DWORD *)buf = 134218498;
              uint64_t v29 = a1;
              __int16 v30 = 2048;
              id v31 = v11;
              __int16 v32 = 2114;
              objc_super v33 = v18;
              _os_log_impl(&dword_1B55DE000, v17, OS_LOG_TYPE_INFO, "%p Reacquiring assertion %p for state %{public}@", buf, 0x20u);
            }
            -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:](a1, v11, v22);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_24:

    os_activity_scope_leave(&state);
  }
}

- (void)invalidate
{
  [(BSServiceConnection *)self->_connection invalidate];
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (id)_queue_assertionForIdentifier:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v4 = [*(id *)(a1 + 24) objectForKey:v3];
    if (!v4)
    {
      uint64_t v5 = bls_assertions_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 24);
        int v8 = 134218498;
        uint64_t v9 = a1;
        __int16 v10 = 2112;
        id v11 = v3;
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_error_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_ERROR, "%p could not find assertion:%@; %@",
          (uint8_t *)&v8,
          0x20u);
      }

      [*(id *)(a1 + 24) removeObjectForKey:v3];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_queue_setAssertion:(void *)a3 forIdentifier:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    [*(id *)(a1 + 24) setObject:v5 forKey:v6];
    uint64_t v7 = bls_assertions_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218498;
      uint64_t v9 = a1;
      __int16 v10 = 2114;
      id v11 = v5;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_debug_impl(&dword_1B55DE000, v7, OS_LOG_TYPE_DEBUG, "%p set assertion:%{public}@ for identifier:%{public}@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)_queue_removeAssertionForIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v4 = bls_assertions_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(BLSXPCAssertionService *)a1 _queue_removeAssertionForIdentifier:v4];
    }

    [*(id *)(a1 + 24) removeObjectForKey:v3];
  }
}

- (void)enqueueRemoteRequest:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__BLSXPCAssertionService_enqueueRemoteRequest___block_invoke;
    v6[3] = &unk_1E6107250;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __47__BLSXPCAssertionService_enqueueRemoteRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_queue_acquireAssertion:(void *)a3 withRemoteTarget:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v7 = [v5 identifier];
    int v8 = bls_assertions_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = v5;
        __int16 v24 = 2114;
        long long v25 = v7;
        _os_log_debug_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_DEBUG, "%p assertion:%{public}@ already has identifier:%{public}@", buf, 0x20u);
      }

      -[BLSXPCAssertionService _queue_setAssertion:forIdentifier:](a1, v5, v7);
      [v6 acquireAssertion:v7];
    }
    else
    {
      if (v9) {
        -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:](a1, (uint64_t)v5, v8);
      }

      __int16 v10 = [v5 descriptor];
      id v19 = 0;
      id v11 = [v6 acquireAssertionForDescriptor:v10 error:&v19];
      id v12 = v19;

      if (v11)
      {
        [v5 setIdentifier:v11];
        -[BLSXPCAssertionService _queue_setAssertion:forIdentifier:](a1, v5, v11);
      }
      if (v12)
      {
        int v13 = [v12 isBSServiceConnectionError];
        uint64_t v14 = bls_assertions_log();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_msgSend(v12, "bls_loggingString");
            *(_DWORD *)buf = 134218498;
            uint64_t v21 = a1;
            __int16 v22 = 2114;
            id v23 = v5;
            __int16 v24 = 2114;
            long long v25 = v18;
            _os_log_error_impl(&dword_1B55DE000, v15, OS_LOG_TYPE_ERROR, "%p assertion:%{public}@ failed to acquire with connection error:%{public}@", buf, 0x20u);
          }
          BOOL v16 = [v5 identifier];

          if (!v16) {
            [*(id *)(a1 + 32) addObject:v5];
          }
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v17 = objc_msgSend(v12, "bls_loggingString");
            *(_DWORD *)buf = 134218498;
            uint64_t v21 = a1;
            __int16 v22 = 2114;
            id v23 = v5;
            __int16 v24 = 2114;
            long long v25 = v17;
            _os_log_impl(&dword_1B55DE000, v15, OS_LOG_TYPE_INFO, "%p assertion:%{public}@ failed to acquire with error:%{public}@", buf, 0x20u);
          }
          -[BLSXPCAssertionService queue_assertionResponder:didFailToAcquireWithBLSError:](a1, v5, v12);
        }
      }
    }
  }
}

- (void)queue_assertionResponder:(void *)a3 didFailToAcquireWithBLSError:
{
  id v8 = a2;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 8);
    id v6 = a3;
    dispatch_assert_queue_V2(v5);
    id v7 = [v8 identifier];
    if (v7) {
      -[BLSXPCAssertionService _queue_removeAssertionForIdentifier:](a1, v7);
    }
    [*(id *)(a1 + 32) removeObject:v8];
    [v8 serviceFailedToAcquireWithError:v6];
  }
}

- (void)acquireAssertion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__BLSXPCAssertionService_acquireAssertion___block_invoke;
  v6[3] = &unk_1E6107278;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v6);
}

void __43__BLSXPCAssertionService_acquireAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAcquired])
  {
    id v4 = bls_assertions_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__BLSXPCAssertionService_acquireAssertion___block_invoke_cold_1();
    }
  }
  else
  {
    -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:](*(void *)(a1 + 40), *(void **)(a1 + 32), v3);
  }
}

- (void)cancelAssertion:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke;
  v10[3] = &unk_1E61072A0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v10);
}

void __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = bls_assertions_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 40) identifier];
  [v3 cancelAssertion:v5 withError:*(void *)(a1 + 48)];
}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke;
  v6[3] = &unk_1E6107278;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v6);
}

void __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = bls_assertions_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke_cold_1();
  }

  id v5 = [*(id *)(a1 + 40) identifier];
  [v3 restartAssertionTimeoutTimer:v5];
}

- (void)replaceWithService:(id)a3
{
}

- (void)assertion:(id)a3 failedToAcquireWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v8 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v6);
  id v9 = bls_assertions_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218754;
    id v11 = self;
    __int16 v12 = 2114;
    int v13 = v8;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_debug_impl(&dword_1B55DE000, v9, OS_LOG_TYPE_DEBUG, "%p failed to acquire assertion:%{public}@ with identifier:%{public}@ server error:%{public}@", (uint8_t *)&v10, 0x2Au);
  }

  if (v8) {
    -[BLSXPCAssertionService queue_assertionResponder:didFailToAcquireWithBLSError:]((uint64_t)self, v8, v7);
  }
}

- (void)assertionAcquired:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v5 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  id v6 = bls_assertions_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2114;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_debug_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEBUG, "%p acquired assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  [v5 serviceDidAcquire];
}

- (void)assertionWillCancel:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v5 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  id v6 = bls_assertions_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2114;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_debug_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEBUG, "%p will cancel assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  [v5 serviceWillCancel];
}

- (void)assertionDidCancel:(id)a3 withError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v8 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v6);
  __int16 v9 = bls_assertions_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218754;
    __int16 v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_debug_impl(&dword_1B55DE000, v9, OS_LOG_TYPE_DEBUG, "%p did cancel assertion:%{public}@ with identifier:%{public}@ error:%{public}@", (uint8_t *)&v10, 0x2Au);
  }

  [v8 serviceDidCancelWithError:v7];
  -[BLSXPCAssertionService _queue_removeAssertionForIdentifier:]((uint64_t)self, v6);
}

- (void)assertionPaused:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v5 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  id v6 = bls_assertions_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2114;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_debug_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEBUG, "%p paused assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  [v5 serviceDidPause];
}

- (void)assertionResumed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  id v5 = -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  id v6 = bls_assertions_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2114;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_debug_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEBUG, "%p resumed assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  [v5 serviceDidResume];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_assertionsToReacquire, 0);
  objc_storeStrong((id *)&self->_queue_assertions, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (void)initWithEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithEndpoint:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_removeAssertionForIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 24) objectForKey:a2];
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  int v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_DEBUG, "%p remove assertion:%{public}@ for identifier:%{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)_queue_acquireAssertion:(os_log_t)log withRemoteTarget:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1B55DE000, log, OS_LOG_TYPE_DEBUG, "%p acquiringAssertionForDescriptor %{public}@", (uint8_t *)&v3, 0x16u);
}

void __43__BLSXPCAssertionService_acquireAssertion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_ERROR, "%p already aquired:%{public}@, ignoring", v1, 0x16u);
}

void __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_DEBUG, "%p tell remote to cancel assertion:%{public}@", v1, 0x16u);
}

void __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B55DE000, v0, OS_LOG_TYPE_DEBUG, "%p tell remote to restart timeout timer for assertion:%{public}@", v1, 0x16u);
}

@end