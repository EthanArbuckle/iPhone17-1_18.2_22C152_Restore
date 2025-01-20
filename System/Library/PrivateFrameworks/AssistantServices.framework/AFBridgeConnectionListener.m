@interface AFBridgeConnectionListener
- (AFBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6;
- (AFBridgeConnectionListenerDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)bridgeName;
- (void)notifyClientWithBlock:(id)a3;
- (void)resumeConnectionWithBridgeProxy:(id)a3;
- (void)setBridgeName:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AFBridgeConnectionListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bridgeName, 0);
  objc_storeStrong(&self->_bridgeProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AFBridgeConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFBridgeConnectionListenerDelegate *)WeakRetained;
}

- (void)setBridgeName:(id)a3
{
}

- (NSString)bridgeName
{
  return self->_bridgeName;
}

- (void)notifyClientWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AFBridgeConnectionListener_notifyClientWithBlock___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__AFBridgeConnectionListener_notifyClientWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];

    v3 = (void *)AFSiriLogContextDaemon;
    BOOL v4 = os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        v5 = *(void **)(*(void *)(a1 + 32) + 32);
        id v6 = v3;
        v7 = [v5 remoteObjectProxy];
        int v11 = 136315394;
        v12 = "-[AFBridgeConnectionListener notifyClientWithBlock:]_block_invoke";
        __int16 v13 = 2112;
        v14 = v7;
        _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Sending a message to remote object: %@", (uint8_t *)&v11, 0x16u);

LABEL_7:
      }
    }
    else if (v4)
    {
      id v8 = *(void **)(*(void *)(a1 + 32) + 32);
      id v6 = v3;
      int v11 = 136315394;
      v12 = "-[AFBridgeConnectionListener notifyClientWithBlock:]_block_invoke";
      __int16 v13 = 1026;
      LODWORD(v14) = [v8 processIdentifier];
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s RemoteObjectProxy is nil for client PID (%{public}d)", (uint8_t *)&v11, 0x12u);
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

- (void)resumeConnectionWithBridgeProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__AFBridgeConnectionListener_resumeConnectionWithBridgeProxy___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__AFBridgeConnectionListener_resumeConnectionWithBridgeProxy___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = AFSiriLogContextDaemon;
  if (*(void *)(v2 + 56))
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(v2 + 64);
      uint64_t v5 = *(void *)(v2 + 40);
      int v7 = 136315650;
      id v8 = "-[AFBridgeConnectionListener resumeConnectionWithBridgeProxy:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s Resuming AFBridgeConnectionListener for bridge: %@, service: %@", (uint8_t *)&v7, 0x20u);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(v2 + 8) resume];
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(v2 + 40);
    int v7 = 136315394;
    id v8 = "-[AFBridgeConnectionListener resumeConnectionWithBridgeProxy:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Bridge proxy not passed for listener: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    machServiceName = self->_machServiceName;
    *(_DWORD *)buf = 136315394;
    v27 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]";
    __int16 v28 = 2112;
    v29 = machServiceName;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Incoming connection request for: %@", buf, 0x16u);
  }
  uint64_t v10 = [v7 valueForEntitlement:self->_machServiceName];

  if (v10)
  {
    [v7 setExportedInterface:self->_exportedInterface];
    [v7 setExportedObject:self->_bridgeProxy];
    [v7 setRemoteObjectInterface:self->_remoteInterface];
    int v11 = [v7 processIdentifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_1E5929AC8;
    int v25 = v11;
    v24[4] = self;
    [v7 setInvalidationHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v22[3] = &unk_1E5929AC8;
    int v23 = v11;
    v22[4] = self;
    [v7 setInterruptionHandler:v22];
    queue = self->_queue;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_3;
    v19 = &unk_1E592C710;
    v20 = self;
    id v13 = v7;
    id v21 = v13;
    dispatch_async(queue, &v16);
    objc_msgSend(v13, "resume", v16, v17, v18, v19, v20);
  }
  else
  {
    v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Entitlement missing on incoming connection request", buf, 0xCu);
    }
  }

  return v10 != 0;
}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s AFBridgeConnectionListener connection invalidated (client pid=%d)", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  [v4 connectionInvalidated];
}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[AFBridgeConnectionListener listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s AFBridgeConnectionListener connection interrupted (client pid=%d)", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  [v4 connectionInterrupted];
}

void __65__AFBridgeConnectionListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
}

- (AFBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)AFBridgeConnectionListener;
  uint64_t v15 = [(AFBridgeConnectionListener *)&v23 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bridgeName, a3);
    objc_storeStrong((id *)&v16->_machServiceName, a4);
    objc_storeStrong((id *)&v16->_exportedInterface, a5);
    objc_storeStrong((id *)&v16->_remoteInterface, a6);
    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("AFBridgeConnectionListener", v17);

    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v12];
    listener = v16->_listener;
    v16->_listener = (NSXPCListener *)v20;

    [(NSXPCListener *)v16->_listener setDelegate:v16];
  }

  return v16;
}

@end