@interface MGClientConnectionProvider
- (MGClientConnectionProvider)init;
- (MGClientConnectionProviderDelegateProtocol)delegate;
- (NSXPCConnection)serviceConnection;
- (OS_dispatch_queue)dispatchQueue;
- (id)_createServiceConnection;
- (id)serviceName;
- (int)notifyToken;
- (void)_unsafe_setServiceConnection:(id *)a1;
- (void)_withLock:(os_unfair_lock_s *)a1;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setServiceConnection:(id)a3;
@end

@implementation MGClientConnectionProvider

- (MGClientConnectionProvider)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)MGClientConnectionProvider;
  v2 = [(MGClientConnectionProvider *)&v19 init];
  if (v2)
  {
    v3 = MGLogForCategory(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = v2;
      _os_log_impl(&dword_222D6E000, v3, OS_LOG_TYPE_DEFAULT, "%p connection provider initializing", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.MediaGroups.%p-queue", v2);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], v5);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v2->_notifyToken = -1;
    v9 = [(MGClientConnectionProvider *)v2 serviceName];
    id v10 = [v9 stringByAppendingString:@".ready"];
    v11 = (const char *)[v10 UTF8String];
    v12 = v2->_dispatchQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __34__MGClientConnectionProvider_init__block_invoke;
    handler[3] = &unk_26466E898;
    objc_copyWeak(&v17, &location);
    uint32_t v13 = notify_register_dispatch(v11, &v2->_notifyToken, v12, handler);

    if (v13)
    {
      v14 = MGLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v21 = v2;
        __int16 v22 = 1024;
        uint32_t v23 = v13;
        _os_log_error_impl(&dword_222D6E000, v14, OS_LOG_TYPE_ERROR, "%p connection provider failed to register notification handler (%u)", buf, 0x12u);
      }
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__MGClientConnectionProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = MGLogForCategory(1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_222D6E000, v2, OS_LOG_TYPE_DEFAULT, "%p connection provider received ready notification", (uint8_t *)&v4, 0xCu);
    }

    v3 = [WeakRetained delegate];
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 connectionProviderServiceAvailable:WeakRetained];
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__MGClientConnectionProvider_dealloc__block_invoke;
  v6[3] = &unk_26466E8C0;
  v6[4] = self;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
  int v4 = MGLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_222D6E000, v4, OS_LOG_TYPE_DEFAULT, "%p connection provider deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)MGClientConnectionProvider;
  [(MGClientConnectionProvider *)&v5 dealloc];
}

void __37__MGClientConnectionProvider_dealloc__block_invoke(uint64_t a1)
{
}

- (void)_unsafe_setServiceConnection:(id *)a1
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_super v5 = v4;
  if (a1)
  {
    uint64_t v6 = a1 + 3;
    if (a1[3] != v4 && (objc_msgSend(v4, "isEqual:") & 1) == 0)
    {
      if (*v6)
      {
        [*v6 setInvalidationHandler:0];
        [*v6 setInterruptionHandler:0];
        [*v6 invalidate];
        dispatch_queue_t v7 = MGLogForCategory(1);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = a1[3];
          *(_DWORD *)buf = 134218240;
          __int16 v22 = a1;
          __int16 v23 = 2048;
          id v24 = v8;
          _os_log_impl(&dword_222D6E000, v7, OS_LOG_TYPE_DEFAULT, "%p invalidating connection %p", buf, 0x16u);
        }
      }
      objc_storeStrong(a1 + 3, a2);
      if (*v6)
      {
        objc_initWeak(&location, a1);
        objc_initWeak(&from, a1[3]);
        id v9 = a1[3];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke;
        v16[3] = &unk_26466E938;
        objc_copyWeak(&v17, &location);
        objc_copyWeak(&v18, &from);
        [v9 setInterruptionHandler:v16];
        id v10 = *v6;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke_16;
        v13[3] = &unk_26466E938;
        objc_copyWeak(&v14, &location);
        objc_copyWeak(&v15, &from);
        [v10 setInvalidationHandler:v13];
        v11 = MGLogForCategory(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = a1[3];
          *(_DWORD *)buf = 134218240;
          __int16 v22 = a1;
          __int16 v23 = 2048;
          id v24 = v12;
          _os_log_impl(&dword_222D6E000, v11, OS_LOG_TYPE_DEFAULT, "%p established new connection %p", buf, 0x16u);
        }

        objc_destroyWeak(&v15);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (MGClientConnectionProviderDelegateProtocol)delegate
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__MGClientConnectionProvider_delegate__block_invoke;
  v4[3] = &unk_26466E8E8;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MGClientConnectionProviderDelegateProtocol *)v2;
}

uint64_t __38__MGClientConnectionProvider_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__MGClientConnectionProvider_setDelegate___block_invoke;
  v6[3] = &unk_26466E910;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
}

void __42__MGClientConnectionProvider_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));

  if (v2 != WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id *)(*(void *)(a1 + 40) + 16);
    objc_storeWeak(v5, v4);
  }
}

- (id)serviceName
{
  return @"com.apple.MediaGroups.daemon";
}

- (id)_createServiceConnection
{
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  id v4 = [(MGClientConnectionProvider *)self serviceName];
  id v5 = (void *)[v3 initWithMachServiceName:v4 options:4096];

  return v5;
}

- (NSXPCConnection)serviceConnection
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__MGClientConnectionProvider_serviceConnection__block_invoke;
  v4[3] = &unk_26466E8E8;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __47__MGClientConnectionProvider_serviceConnection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) _createServiceConnection];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(id **)(a1 + 32);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    -[MGClientConnectionProvider _unsafe_setServiceConnection:](v5, v6);
  }
}

- (void)setServiceConnection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__MGClientConnectionProvider_setServiceConnection___block_invoke;
  v6[3] = &unk_26466E910;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
}

void __51__MGClientConnectionProvider_setServiceConnection___block_invoke(uint64_t a1)
{
}

void __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = MGLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      id v7 = WeakRetained;
      _os_log_error_impl(&dword_222D6E000, v4, OS_LOG_TYPE_ERROR, "%p service interrupted!", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained setServiceConnection:0];
    if (v3)
    {
      id v5 = [WeakRetained delegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v5 connectionProvider:WeakRetained serviceLost:v3];
      }
    }
  }
}

void __59__MGClientConnectionProvider__unsafe_setServiceConnection___block_invoke_16(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = MGLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134217984;
      id v7 = WeakRetained;
      _os_log_error_impl(&dword_222D6E000, v4, OS_LOG_TYPE_ERROR, "%p invalidated connection!", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained setServiceConnection:0];
    if (v3)
    {
      id v5 = [WeakRetained delegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v5 connectionProvider:WeakRetained serviceLost:v3];
      }
    }
  }
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end