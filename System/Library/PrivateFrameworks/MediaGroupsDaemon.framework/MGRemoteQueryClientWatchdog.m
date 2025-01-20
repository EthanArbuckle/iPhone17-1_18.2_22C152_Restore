@interface MGRemoteQueryClientWatchdog
+ (id)watchdogForTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6;
- (MGRemoteQueryClient)ping;
- (MGRemoteQueryClientTarget)target;
- (MGRemoteQueryClientWatchdogDelegate)delegate;
- (NSString)description;
- (NSURLSession)session;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)timer;
- (id)_initWithTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6;
- (id)pingClient;
- (void)_pingFinished:(BOOL)a3;
- (void)_pingStart;
- (void)_timerCancel;
- (void)_timerFired;
- (void)_timerInit;
- (void)_timerReschedule;
- (void)_withPingLock:(id)a3;
- (void)clientInvalidated:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)reset;
- (void)setPing:(id)a3;
@end

@implementation MGRemoteQueryClientWatchdog

+ (id)watchdogForTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithTarget:v13 dispatchQueue:v12 delegate:v11 usingSession:v10];

  return v14;
}

- (id)_initWithTarget:(id)a3 dispatchQueue:(id)a4 delegate:(id)a5 usingSession:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MGRemoteQueryClientWatchdog;
  v15 = [(MGRemoteQueryClientWatchdog *)&v21 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    v15->_pingLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_target, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeWeak(p_isa + 5, v13);
    objc_storeStrong(p_isa + 6, a6);
    v17 = [p_isa dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__MGRemoteQueryClientWatchdog__initWithTarget_dispatchQueue_delegate_usingSession___block_invoke;
    block[3] = &unk_26485E378;
    v20 = p_isa;
    dispatch_async(v17, block);
  }
  return p_isa;
}

uint64_t __83__MGRemoteQueryClientWatchdog__initWithTarget_dispatchQueue_delegate_usingSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerInit];
}

- (void)dealloc
{
  [(MGRemoteQueryClientWatchdog *)self _timerCancel];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClientWatchdog;
  [(MGRemoteQueryClientWatchdog *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MGRemoteQueryClientWatchdog *)self target];
  v7 = [(MGRemoteQueryClientWatchdog *)self timer];
  v8 = [(MGRemoteQueryClientWatchdog *)self pingClient];
  v9 = [v3 stringWithFormat:@"<%@: %p, _target = %@, _timer = %p, _ping = %@>", v5, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)reset
{
  objc_super v3 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__MGRemoteQueryClientWatchdog_reset__block_invoke;
  block[3] = &unk_26485E378;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__MGRemoteQueryClientWatchdog_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerReschedule];
}

- (id)pingClient
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__MGRemoteQueryClientWatchdog_pingClient__block_invoke;
  v4[3] = &unk_26485E5A8;
  v4[4] = self;
  v4[5] = &v5;
  [(MGRemoteQueryClientWatchdog *)self _withPingLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __41__MGRemoteQueryClientWatchdog_pingClient__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) ping];
  return MEMORY[0x270F9A758]();
}

- (void)_timerInit
{
  objc_super v3 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);

  objc_storeStrong((id *)&self->_timer, v5);
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __41__MGRemoteQueryClientWatchdog__timerInit__block_invoke;
  v9 = &unk_26485E5D0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, &v6);
  [(MGRemoteQueryClientWatchdog *)self _timerReschedule];
  dispatch_resume(v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__MGRemoteQueryClientWatchdog__timerInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _timerFired];
    id WeakRetained = v2;
  }
}

- (void)_timerReschedule
{
  objc_super v3 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  source = [(MGRemoteQueryClientWatchdog *)self timer];
  dispatch_time_t v4 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_timerCancel
{
  id v2 = [(MGRemoteQueryClientWatchdog *)self timer];
  if (v2)
  {
    objc_super v3 = v2;
    dispatch_source_cancel(v2);
    id v2 = v3;
  }
}

- (void)_timerFired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_time_t v4 = MGLogForCategory(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v5 = [(MGRemoteQueryClientWatchdog *)self target];
    int v6 = 134218242;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_229257000, v4, OS_LOG_TYPE_DEFAULT, "%p watchdog fired, pinging target %@", (uint8_t *)&v6, 0x16u);
  }
  [(MGRemoteQueryClientWatchdog *)self _pingStart];
}

- (void)_pingStart
{
  objc_super v3 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__MGRemoteQueryClientWatchdog__pingStart__block_invoke;
  v4[3] = &unk_26485E378;
  v4[4] = self;
  [(MGRemoteQueryClientWatchdog *)self _withPingLock:v4];
}

void __41__MGRemoteQueryClientWatchdog__pingStart__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) ping];

  if (!v2)
  {
    objc_super v3 = +[MGRemoteQueryClientHandlerPing handler];
    int v6 = [*(id *)(a1 + 32) target];
    uint64_t v7 = [*(id *)(a1 + 32) dispatchQueue];
    __int16 v8 = *(void **)(a1 + 32);
    v9 = [v8 session];
    dispatch_source_t v5 = +[MGRemoteQueryClient clientWithHandler:v3 target:v6 dispatchQueue:v7 delegate:v8 usingSession:v9];

    [*(id *)(a1 + 32) setPing:v5];
    uint64_t v10 = MGLogForCategory(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      int v12 = 134218242;
      id v13 = v11;
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_229257000, v10, OS_LOG_TYPE_DEFAULT, "%p watchdog pinging with %@", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_7;
  }
  objc_super v3 = MGLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    dispatch_source_t v5 = [v4 ping];
    int v12 = 134218242;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_229257000, v3, OS_LOG_TYPE_ERROR, "%p watchdog ping already in process with %@", (uint8_t *)&v12, 0x16u);
LABEL_7:
  }
}

- (void)_pingFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_source_t v5 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__MGRemoteQueryClientWatchdog__pingFinished___block_invoke;
  v11[3] = &unk_26485E378;
  v11[4] = self;
  [(MGRemoteQueryClientWatchdog *)self _withPingLock:v11];
  int v6 = MGLogForCategory(6);
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = self;
      _os_log_debug_impl(&dword_229257000, v7, OS_LOG_TYPE_DEBUG, "%p watchdog ping successful", buf, 0xCu);
    }

    [(MGRemoteQueryClientWatchdog *)self _timerReschedule];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(MGRemoteQueryClientWatchdog *)self target];
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p watchdog ping failed for %@", buf, 0x16u);
    }
    __int16 v8 = [(MGRemoteQueryClientWatchdog *)self delegate];
    v9 = v8;
    if (v8) {
      [v8 watchdogFired:self];
    }
  }
}

uint64_t __45__MGRemoteQueryClientWatchdog__pingFinished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPing:0];
}

- (void)_withPingLock:(id)a3
{
  p_pingLock = &self->_pingLock;
  dispatch_time_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_pingLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_pingLock);
}

- (void)clientInvalidated:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(MGRemoteQueryClientWatchdog *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke;
  block[3] = &unk_26485E5F8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke_2;
  v9[3] = &unk_26485E4E0;
  id v12 = &v13;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  [v2 _withPingLock:v9];
  if (*((unsigned char *)v14 + 24))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      id v6 = MGLogForCategory(6);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134218242;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p watchdog ping failed with error %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _pingFinished:v5 == 0];
  }

  _Block_object_dispose(&v13, 8);
}

void __59__MGRemoteQueryClientWatchdog_clientInvalidated_withError___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) ping];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isEqual:v3];
}

- (MGRemoteQueryClient)ping
{
  os_unfair_lock_assert_owner(&self->_pingLock);
  ping = self->_ping;
  return ping;
}

- (void)setPing:(id)a3
{
  uint64_t v7 = (MGRemoteQueryClient *)a3;
  os_unfair_lock_assert_owner(&self->_pingLock);
  ping = self->_ping;
  p_ping = &self->_ping;
  if (ping != v7 && (-[MGRemoteQueryClient isEqual:](v7, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_ping, a3);
  }
  MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (MGRemoteQueryClientTarget)target
{
  return self->_target;
}

- (MGRemoteQueryClientWatchdogDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryClientWatchdogDelegate *)WeakRetained;
}

- (NSURLSession)session
{
  return self->_session;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ping, 0);
}

@end