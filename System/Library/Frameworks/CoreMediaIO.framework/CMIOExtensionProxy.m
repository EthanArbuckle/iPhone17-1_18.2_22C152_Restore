@interface CMIOExtensionProxy
+ (id)proxyWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5;
- (BOOL)isInvalidated;
- (CMIOExtensionProxy)initWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5;
- (OS_xpc_object)endpoint;
- (OS_xpc_object)proxyEndpoint;
- (void)addConnection:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)proxyContextHasBeenInvalidated:(id)a3;
- (void)proxyStreamHasStarted;
- (void)proxyStreamsHaveStopped:(int)a3;
@end

@implementation CMIOExtensionProxy

+ (id)proxyWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEndpoint:a3 extensionPID:*(void *)&a4 delegate:a5];

  return v5;
}

- (CMIOExtensionProxy)initWithEndpoint:(id)a3 extensionPID:(int)a4 delegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v24.receiver = self;
    v24.super_class = (Class)CMIOExtensionProxy;
    v8 = [(CMIOExtensionProxy *)&v24 init];
    if (v8)
    {
      v9 = CMIOLog();
      v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        unsigned int v12 = v8[12];
        *(_DWORD *)buf = 136315907;
        v26 = v11;
        __int16 v27 = 1024;
        int v28 = 769;
        __int16 v29 = 2080;
        v30 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]";
        __int16 v31 = 1025;
        unsigned int v32 = v12;
        _os_log_impl(&dword_2432B6000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d:%s creating proxy for pid [%{private}d]", buf, 0x22u);
      }
      objc_initWeak((id *)buf, v8);
      v8[2] = 0;
      *((void *)v8 + 3) = a3;
      v13 = xpc_connection_create(0, 0);
      *((void *)v8 + 2) = v13;
      *((void *)v8 + 4) = xpc_endpoint_create(v13);
      *((void *)v8 + 5) = a5;
      v8[12] = a4;
      v8[13] = 0;
      *((void *)v8 + 7) = objc_alloc_init(MEMORY[0x263EFF980]);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      global_queue = dispatch_get_global_queue(21, 0);
      v16 = dispatch_queue_create_with_target_V2("com.apple.cmio.CMIOExtensionProxyQueue", v14, global_queue);
      *((void *)v8 + 8) = v16;
      v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, v16);
      *((void *)v8 + 9) = v17;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke;
      handler[3] = &unk_26517C8A0;
      objc_copyWeak(&v23, (id *)buf);
      handler[4] = v8;
      dispatch_source_set_event_handler(v17, handler);
      dispatch_source_set_timer(*((dispatch_source_t *)v8 + 9), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*((dispatch_object_t *)v8 + 9));
      *((unsigned char *)v8 + 80) = 0;
      [*((id *)v8 + 5) updateStreamingState:0 forProxyFrontedPID:v8[12]];
      v18 = (_xpc_connection_s *)*((void *)v8 + 2);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke_122;
      v20[3] = &unk_26517C798;
      objc_copyWeak(&v21, (id *)buf);
      xpc_connection_set_event_handler(v18, v20);
      xpc_connection_activate(*((xpc_connection_t *)v8 + 2));
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid argument"];
    return 0;
  }
  return (CMIOExtensionProxy *)v8;
}

void __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    int v4 = *((unsigned __int8 *)WeakRetained + 80);
    v5 = CMIOLog();
    v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315650;
          v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          __int16 v9 = 1024;
          int v10 = 786;
          __int16 v11 = 2080;
          unsigned int v12 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]_block_invoke";
          _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s update stream state timer fired while active, updating streaming state to NO", (uint8_t *)&v7, 0x1Cu);
        }
      }
      *((unsigned char *)v3 + 80) = 0;
      [*(id *)(*(void *)(a1 + 32) + 40) updateStreamingState:0 forProxyFrontedPID:*(unsigned int *)(*(void *)(a1 + 32) + 48)];
      dispatch_source_set_timer(v3[9], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      __int16 v9 = 1024;
      int v10 = 792;
      __int16 v11 = 2080;
      unsigned int v12 = "-[CMIOExtensionProxy initWithEndpoint:extensionPID:delegate:]_block_invoke";
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s update stream state timer fired while not active, not updating streaming state", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __61__CMIOExtensionProxy_initWithEndpoint_extensionPID_delegate___block_invoke_122(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v5 = WeakRetained;
    BOOL v4 = MEMORY[0x245679950](a2) == MEMORY[0x263EF86F0];
    id WeakRetained = v5;
    if (v4)
    {
      [v5 addConnection:a2];
      id WeakRetained = v5;
    }
  }
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CMIOModuleLogLevel_once_0 != -1) {
    dispatch_once(&CMIOModuleLogLevel_once_0, &__block_literal_global_195);
  }
  if (CMIOModuleLogLevel_cmioLevel_0 >= 1)
  {
    v3 = CMIOLog();
    if (v3)
    {
      BOOL v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315907;
        __int16 v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        __int16 v12 = 1024;
        int v13 = 816;
        __int16 v14 = 2080;
        v15 = "-[CMIOExtensionProxy dealloc]";
        __int16 v16 = 2113;
        v17 = self;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s %{private}@", buf, 0x26u);
      }
    }
  }
  id v5 = CMIOLog();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      int extensionPID = self->_extensionPID;
      *(_DWORD *)buf = 136315907;
      __int16 v11 = v7;
      __int16 v12 = 1024;
      int v13 = 818;
      __int16 v14 = 2080;
      v15 = "-[CMIOExtensionProxy dealloc]";
      __int16 v16 = 1025;
      LODWORD(v17) = extensionPID;
      _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] cancelling update stream state timer", buf, 0x22u);
    }
  }
  dispatch_source_cancel((dispatch_source_t)self->_updateStreamStateTimer);

  v9.receiver = self;
  v9.super_class = (Class)CMIOExtensionProxy;
  [(CMIOExtensionProxy *)&v9 dealloc];
}

- (OS_xpc_object)endpoint
{
  v2 = self->_endpoint;

  return v2;
}

- (OS_xpc_object)proxyEndpoint
{
  v2 = self->_proxyEndpoint;

  return v2;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_invalidated = 1;
    BOOL v4 = (void *)[(NSMutableArray *)self->_contexts copy];
    [(NSMutableArray *)self->_contexts removeAllObjects];
    os_unfair_lock_unlock(p_lock);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) invalidate];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    xpc_connection_cancel(self->_listener);
  }
}

- (void)addConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  xpc_connection_t v5 = xpc_connection_create_from_endpoint(self->_endpoint);
  uint64_t v6 = [[CMIOExtensionProxyContext alloc] initWithConnection:a3 serverConnection:v5 queue:0 delegate:self];
  xpc_release(v5);
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_contexts addObject:v6];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v7 = CMIOLog();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 136316163;
        long long v11 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        __int16 v12 = 1024;
        int v13 = 882;
        __int16 v14 = 2080;
        v15 = "-[CMIOExtensionProxy addConnection:]";
        __int16 v16 = 1025;
        pid_t pid = xpc_connection_get_pid((xpc_connection_t)a3);
        __int16 v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_2432B6000, v8, OS_LOG_TYPE_INFO, "%s:%d:%s New proxy [%{private}d] %@", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  else
  {
    long long v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionProxy addConnection:]();
    }
  }
}

- (void)proxyStreamHasStarted
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  updateStreamStateQueue = self->_updateStreamStateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CMIOExtensionProxy_proxyStreamHasStarted__block_invoke;
  block[3] = &unk_26517BF28;
  block[4] = self;
  dispatch_sync(updateStreamStateQueue, block);
  BOOL v4 = CMIOLog();
  if (v4)
  {
    xpc_connection_t v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
      int extensionPID = self->_extensionPID;
      int activeStreams = self->_activeStreams;
      *(_DWORD *)buf = 136316163;
      long long v11 = v6;
      __int16 v12 = 1024;
      int v13 = 897;
      __int16 v14 = 2080;
      v15 = "-[CMIOExtensionProxy proxyStreamHasStarted]";
      __int16 v16 = 1025;
      int v17 = extensionPID;
      __int16 v18 = 1024;
      int v19 = activeStreams;
      _os_log_impl(&dword_2432B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activeStreams %d", buf, 0x28u);
    }
  }
}

uint64_t __43__CMIOExtensionProxy_proxyStreamHasStarted__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 52);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 80))
  {
    v3 = CMIOLog();
    if (v3)
    {
      BOOL v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        xpc_connection_t v5 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
        int v8 = 136315907;
        long long v9 = v5;
        __int16 v10 = 1024;
        int v11 = 891;
        __int16 v12 = 2080;
        int v13 = "-[CMIOExtensionProxy proxyStreamHasStarted]_block_invoke";
        __int16 v14 = 1025;
        int v15 = v6;
        _os_log_impl(&dword_2432B6000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] canceling update stream state timer", (uint8_t *)&v8, 0x22u);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
    dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 72), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v1 = *(void *)(a1 + 32);
  }
  return [*(id *)(v1 + 40) updateStreamingState:1 forProxyFrontedPID:*(unsigned int *)(v1 + 48)];
}

- (void)proxyStreamsHaveStopped:(int)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3 >= 1)
  {
    xpc_connection_t v5 = CMIOLog();
    if (v5)
    {
      int v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
        int extensionPID = self->_extensionPID;
        int activeStreams = self->_activeStreams;
        *(_DWORD *)buf = 136316419;
        __int16 v14 = v7;
        __int16 v15 = 1024;
        int v16 = 906;
        __int16 v17 = 2080;
        __int16 v18 = "-[CMIOExtensionProxy proxyStreamsHaveStopped:]";
        __int16 v19 = 1025;
        int v20 = extensionPID;
        __int16 v21 = 1024;
        int v22 = activeStreams;
        __int16 v23 = 1024;
        int v24 = a3;
        _os_log_impl(&dword_2432B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activeStreams %d will loose %d", buf, 0x2Eu);
      }
    }
    updateStreamStateQueue = self->_updateStreamStateQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__CMIOExtensionProxy_proxyStreamsHaveStopped___block_invoke;
    v11[3] = &unk_26517C8C8;
    v11[4] = self;
    int v12 = a3;
    dispatch_sync(updateStreamStateQueue, v11);
  }
}

void __46__CMIOExtensionProxy_proxyStreamsHaveStopped___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 52);
  if (v2 >= 1)
  {
    int v4 = *(_DWORD *)(a1 + 40);
    BOOL v5 = __OFSUB__(v2, v4);
    int v6 = v2 - v4;
    if (v6 < 0 != v5) {
      int v6 = 0;
    }
    *(_DWORD *)(v1 + 52) = v6;
    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v7 + 52) && !*(unsigned char *)(v7 + 80))
    {
      *(unsigned char *)(v7 + 80) = 1;
      int v8 = CMIOLog();
      if (v8)
      {
        long long v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
          int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
          int v14 = 136315907;
          __int16 v15 = v10;
          __int16 v16 = 1024;
          int v17 = 917;
          __int16 v18 = 2080;
          __int16 v19 = "-[CMIOExtensionProxy proxyStreamsHaveStopped:]_block_invoke";
          __int16 v20 = 1025;
          int v21 = v11;
          _os_log_impl(&dword_2432B6000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d:%s [%{private}d] activating update stream state timer", (uint8_t *)&v14, 0x22u);
        }
      }
      int v12 = *(NSObject **)(*(void *)(a1 + 32) + 72);
      dispatch_time_t v13 = dispatch_time(0, 2000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

- (void)proxyContextHasBeenInvalidated:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_contexts removeObject:a3];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)addConnection:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProxy.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s Failed to instantiate CMIOExtensionProxyContext", v2, v3, v4, v5, v6);
}

@end