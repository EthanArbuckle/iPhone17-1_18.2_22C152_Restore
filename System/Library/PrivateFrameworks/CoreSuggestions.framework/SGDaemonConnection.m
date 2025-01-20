@interface SGDaemonConnection
+ (BOOL)usingSyncXPC;
+ (void)_useSyncXPCWithBlock:(id)a3;
- (SGDaemonConnection)initWithMachServiceName:(id)a3 xpcInterface:(id)a4;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)waitUntilReturn:(id)a3 withTimeout:(double)a4 error:(id *)a5;
- (id)xpcConnection;
- (void)_callAbortBlocks;
- (void)_connectToServer;
- (void)addConnectionInterruptedHandler:(id)a3;
- (void)dealloc;
- (void)disconnect;
@end

@implementation SGDaemonConnection

void __35__SGDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[13];
  if (!v3)
  {
    [v2 _connectToServer];
    v3 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (void)_connectToServer
{
  v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v3, OS_LOG_TYPE_DEBUG, "SGDaemonConnection _connectToRemoteSuggestionsService", (uint8_t *)location, 2u);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_machServiceName options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:self->_xpcInterface];
  location[0] = 0;
  objc_initWeak(location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SGDaemonConnection__connectToServer__block_invoke;
  v11[3] = &unk_1E5B90550;
  objc_copyWeak(&v12, location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v11];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __38__SGDaemonConnection__connectToServer__block_invoke_6;
  v9 = &unk_1E5B90550;
  objc_copyWeak(&v10, location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:&v6];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

+ (BOOL)usingSyncXPC
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKeyedSubscript:@"SGSyncXPC"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[SGDaemonConnection usingSyncXPC];
  uint64_t v6 = (void *)MEMORY[0x1A6265250]();
  if (v5)
  {
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v12 = 0;
      _os_log_debug_impl(&dword_1A4D8C000, v7, OS_LOG_TYPE_DEBUG, "SGDaemonConnection providing sync XPC remote object proxy", v12, 2u);
    }

    v8 = [(SGDaemonConnection *)self xpcConnection];
    uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    v8 = [(SGDaemonConnection *)self xpcConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }
  id v10 = (void *)v9;

  return v10;
}

- (SGDaemonConnection)initWithMachServiceName:(id)a3 xpcInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDaemonConnection;
  v8 = [(SGDaemonConnection *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    machServiceName = v8->_machServiceName;
    v8->_machServiceName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_xpcInterface, a4);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.suggestions.daemon.connectlock", 0);
    connectLock = v8->_connectLock;
    v8->_connectLock = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    abortBlocks = v8->_abortBlocks;
    v8->_abortBlocks = (NSMutableArray *)v13;

    pthread_mutex_init(&v8->_abortLock, 0);
  }

  return v8;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1A6265250]();
  id v6 = [(SGDaemonConnection *)self xpcConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v7;
}

- (id)xpcConnection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9562;
  id v10 = __Block_byref_object_dispose__9563;
  id v11 = 0;
  connectLock = self->_connectLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SGDaemonConnection_xpcConnection__block_invoke;
  v5[3] = &unk_1E5B90578;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_abortBlocks, 0);
  objc_storeStrong((id *)&self->_connectLock, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (void)addConnectionInterruptedHandler:(id)a3
{
  p_abortLock = &self->_abortLock;
  id v5 = a3;
  pthread_mutex_lock(p_abortLock);
  abortBlocks = self->_abortBlocks;
  id v7 = (void *)MEMORY[0x1A62654A0](v5);

  [(NSMutableArray *)abortBlocks addObject:v7];

  pthread_mutex_unlock(p_abortLock);
}

- (id)waitUntilReturn:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (uint64_t)fmax(a4 * 1000000000.0, 1.0);
  if (fabs(a4 * 1000000000.0) == INFINITY) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9;
  id v11 = dispatch_group_create();
  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("SGDaemonConnection-waitUntilReturn", v12);

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__9562;
  v60 = __Block_byref_object_dispose__9563;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__9562;
  v54 = __Block_byref_object_dispose__9563;
  id v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  dispatch_group_enter(v11);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke;
  v40[3] = &unk_1E5B905E8;
  v14 = v13;
  v41 = v14;
  v43 = &v46;
  v44 = &v56;
  v45 = &v50;
  v15 = v11;
  v42 = v15;
  objc_super v16 = (void *)MEMORY[0x1A62654A0](v40);
  if (v10)
  {
    dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);
    if (v17)
    {
      v18 = v17;
      dispatch_time_t v19 = dispatch_time(0, v10);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_12;
      handler[3] = &unk_1E5B90610;
      v38 = self;
      v39 = &v46;
      v37 = v15;
      dispatch_source_set_event_handler(v18, handler);
      dispatch_resume(v18);

      goto LABEL_10;
    }
    v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v20, OS_LOG_TYPE_FAULT, "Could not create timeoutTimer", buf, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  v18 = 0;
LABEL_10:
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_13;
  v33 = &unk_1E5B90638;
  id v21 = v8;
  id v34 = v21;
  id v22 = v16;
  id v35 = v22;
  +[SGDaemonConnection _useSyncXPCWithBlock:&v30];
  if (v10) {
    dispatch_time_t v23 = dispatch_time(0, v10);
  }
  else {
    dispatch_time_t v23 = -1;
  }
  if (dispatch_group_wait(v15, v23) || *((unsigned char *)v47 + 24))
  {
    v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v63 = v10 / 0xF4240;
      _os_log_impl(&dword_1A4D8C000, v24, OS_LOG_TYPE_INFO, "SGDaemonConnection remote call taking longer than %llu milliseconds(s). Returning empty result with timeout error.", buf, 0xCu);
    }

    *((unsigned char *)v47 + 24) = 1;
    if (os_variant_has_internal_diagnostics())
    {
      v25 = sgLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(MEMORY[0x1E4F29060], "callStackSymbols", v30, v31, v32, v33, v34);
        *(_DWORD *)buf = 138412290;
        unint64_t v63 = (unint64_t)v26;
        _os_log_impl(&dword_1A4D8C000, v25, OS_LOG_TYPE_INFO, "SGDaemonConnection %@", buf, 0xCu);
      }
    }
  }
  if (v18) {
    dispatch_source_cancel(v18);
  }
  if (*((unsigned char *)v47 + 24))
  {
    incrementKeyWithSuffix(@"apicalls.all.timedout");
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:10 userInfo:0];
      id v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    if (a5) {
      *a5 = (id) v51[5];
    }
    if (v51[5]) {
      v28 = @"apicalls.all.errored";
    }
    else {
      v28 = @"apicalls.all.succeeded";
    }
    incrementKeyWithSuffix(v28);
    id v27 = (id)v57[5];
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);

  return v27;
}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_2;
  block[3] = &unk_1E5B905C0;
  long long v16 = *(_OWORD *)(a1 + 56);
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_12(uint64_t a1)
{
  intptr_t v2 = dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0);
  id v3 = sgLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v3, OS_LOG_TYPE_INFO, "SGDaemonConnection remote call timed out. Disconnecting XPC...", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 40) disconnect];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A4D8C000, v3, OS_LOG_TYPE_INFO, "(SGDaemonConnection dispatch timer triggered just as task finished.)", v5, 2u);
    }
  }
}

uint64_t __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      intptr_t v2 = sgLogHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_error_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_ERROR, "SGDaemonConnection Error! %@", (uint8_t *)&v4, 0xCu);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (id)remoteObjectProxy
{
  return [(SGDaemonConnection *)self remoteObjectProxyWithErrorHandler:&__block_literal_global_9601];
}

- (void)_callAbortBlocks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_abortLock = &self->_abortLock;
  pthread_mutex_lock(&self->_abortLock);
  int v4 = (void *)[(NSMutableArray *)self->_abortBlocks copy];
  [(NSMutableArray *)self->_abortBlocks removeAllObjects];
  pthread_mutex_unlock(p_abortLock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __38__SGDaemonConnection__connectToServer__block_invoke(uint64_t a1)
{
  intptr_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v4 = 0;
    _os_log_error_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_ERROR, "SGDaemonConnection got an interrupt", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callAbortBlocks];
}

void __38__SGDaemonConnection__connectToServer__block_invoke_6(uint64_t a1)
{
  intptr_t v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v2, OS_LOG_TYPE_DEBUG, "SGDaemonConnection connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callAbortBlocks];
}

- (void)disconnect
{
  connectLock = self->_connectLock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SGDaemonConnection_disconnect__block_invoke;
  block[3] = &unk_1E5B90528;
  void block[4] = self;
  dispatch_sync(connectLock, block);
}

void __32__SGDaemonConnection_disconnect__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;
}

- (void)dealloc
{
  [(SGDaemonConnection *)self disconnect];
  pthread_mutex_destroy(&self->_abortLock);
  v3.receiver = self;
  v3.super_class = (Class)SGDaemonConnection;
  [(SGDaemonConnection *)&v3 dealloc];
}

+ (void)_useSyncXPCWithBlock:(id)a3
{
  objc_super v3 = (void (**)(void))a3;
  int v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [v4 threadDictionary];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"SGSyncXPC"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0) {
    uint64_t v8 = [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SGSyncXPC"];
  }
  uint64_t v9 = (void *)MEMORY[0x1A6265250](v8);
  long long v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_DEBUG, "SGDaemonConnection beginning sync XPC block", buf, 2u);
  }

  v3[2](v3);
  long long v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v14 = 0;
    _os_log_debug_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_DEBUG, "SGDaemonConnection ending sync XPC block", v14, 2u);
  }

  if ((v7 & 1) == 0)
  {
    long long v12 = [MEMORY[0x1E4F29060] currentThread];
    long long v13 = [v12 threadDictionary];
    [v13 removeObjectForKey:@"SGSyncXPC"];
  }
}

@end