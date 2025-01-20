@interface CSSiriAudioMessageRequestClient
- (CSSiriAudioMessageRequestClient)init;
- (NSString)xpcConnectionUUIDString;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (void)dealloc;
- (void)forceReleaseAllAudioMessageRetainLock;
- (void)getAudioFileWithRequestId:(id)a3 completion:(id)a4;
- (void)releaseAudioMessageRetainLockFromRequestId:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcConnectionUUIDString:(id)a3;
@end

@implementation CSSiriAudioMessageRequestClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)forceReleaseAllAudioMessageRetainLock
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CSSiriAudioMessageRequestClient_forceReleaseAllAudioMessageRetainLock__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __72__CSSiriAudioMessageRequestClient_forceReleaseAllAudioMessageRetainLock__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _service];
  [v1 forceReleaseAllAudioMessageRetainLock];
}

- (void)releaseAudioMessageRetainLockFromRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CSSiriAudioMessageRequestClient_releaseAudioMessageRetainLockFromRequestId___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __78__CSSiriAudioMessageRequestClient_releaseAudioMessageRetainLockFromRequestId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  [v2 releaseAudioMessageRetainLockFromRequestId:*(void *)(a1 + 40)];
}

- (void)getAudioFileWithRequestId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke;
  block[3] = &unk_1E658D198;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _service];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke_2;
  v4[3] = &unk_1E658D170;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 getAudioFileWithRequestId:v3 completion:v4];
}

uint64_t __72__CSSiriAudioMessageRequestClient_getAudioFileWithRequestId_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_service
{
  id v2 = [(CSSiriAudioMessageRequestClient *)self _connection];
  uint64_t v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    id v7 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSSiriAudioMessageRequestClient _connection]";
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    id v8 = [(CSSiriAudioMessageRequestClient *)self _newConnection];
    id v9 = self->_xpcConnection;
    self->_xpcConnection = v8;

    objc_initWeak((id *)buf, self);
    id v10 = self->_xpcConnectionUUIDString;
    v11 = self->_xpcConnection;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__CSSiriAudioMessageRequestClient__connection__block_invoke;
    v22[3] = &unk_1E658D148;
    objc_copyWeak(&v24, (id *)buf);
    id v12 = v10;
    v23 = v12;
    [(NSXPCConnection *)v11 setInterruptionHandler:v22];
    id v13 = self->_xpcConnection;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __46__CSSiriAudioMessageRequestClient__connection__block_invoke_5;
    v19 = &unk_1E658D148;
    objc_copyWeak(&v21, (id *)buf);
    v14 = v12;
    v20 = v14;
    [(NSXPCConnection *)v13 setInvalidationHandler:&v16];
    [(NSXPCConnection *)self->_xpcConnection resume];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);

    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __46__CSSiriAudioMessageRequestClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (os_log_t *)MEMORY[0x1E4F5D180];
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = @"com.apple.siri.audio_message_service.xpc";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v13, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained xpcConnectionUUIDString];
    LOBYTE(v6) = [v6 isEqualToString:v7];

    if (v6)
    {
      [v5[3] invalidate];
      id v8 = v5[3];
      v5[3] = 0;
    }
    else
    {
      os_log_t v9 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = *(__CFString **)(a1 + 32);
        v11 = v9;
        id v12 = [v5 xpcConnectionUUIDString];
        int v13 = 136315650;
        v14 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

void __46__CSSiriAudioMessageRequestClient__connection__block_invoke_5(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (os_log_t *)MEMORY[0x1E4F5D180];
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
    __int16 v14 = 2112;
    __int16 v15 = @"com.apple.siri.audio_message_service.xpc";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained xpcConnectionUUIDString];
    LOBYTE(v6) = [v6 isEqualToString:v7];

    if ((v6 & 1) == 0)
    {
      os_log_t v8 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v9 = *(__CFString **)(a1 + 32);
        id v10 = v8;
        v11 = [v5 xpcConnectionUUIDString];
        int v12 = 136315650;
        int v13 = "-[CSSiriAudioMessageRequestClient _connection]_block_invoke";
        __int16 v14 = 2112;
        __int16 v15 = v9;
        __int16 v16 = 2112;
        __int16 v17 = v11;
        _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (id)_newConnection
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.siri.audio_message_service.xpc" options:0];
  id v4 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2405CD8];
  [v3 setRemoteObjectInterface:v4];

  [v3 _setQueue:self->_queue];
  return v3;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSSiriAudioMessageRequestClient dealloc]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s deallocated", buf, 0xCu);
  }
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)CSSiriAudioMessageRequestClient;
  [(CSSiriAudioMessageRequestClient *)&v4 dealloc];
}

- (CSSiriAudioMessageRequestClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSSiriAudioMessageRequestClient;
  id v2 = [(CSSiriAudioMessageRequestClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("CSSiriAudioMessageRequestClient Queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end