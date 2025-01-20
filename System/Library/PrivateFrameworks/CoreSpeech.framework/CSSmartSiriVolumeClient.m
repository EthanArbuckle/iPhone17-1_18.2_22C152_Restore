@interface CSSmartSiriVolumeClient
- (CSSmartSiriVolumeClient)init;
- (CSSmartSiriVolumeClientDelegate)delegate;
- (NSXPCConnection)ssvConnection;
- (OS_dispatch_queue)queue;
- (id)_getRemoteServiceProxyObject;
- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4;
- (void)_createClientConnection;
- (void)dealloc;
- (void)didTTSVolumeChangeForReason:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)setSsvConnection:(id)a3;
@end

@implementation CSSmartSiriVolumeClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssvConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSsvConnection:(id)a3
{
}

- (NSXPCConnection)ssvConnection
{
  return self->_ssvConnection;
}

- (void)setDelegate:(id)a3
{
}

- (CSSmartSiriVolumeClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSmartSiriVolumeClientDelegate *)WeakRetained;
}

- (void)_createClientConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.corespeechd.ssv.service" options:4096];
  ssvConnection = self->_ssvConnection;
  self->_ssvConnection = v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2405A38];
  [(NSXPCConnection *)self->_ssvConnection setRemoteObjectInterface:v5];

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23D0388];
  [(NSXPCConnection *)self->_ssvConnection setExportedInterface:v6];

  [(NSXPCConnection *)self->_ssvConnection setExportedObject:self];
  objc_initWeak(&location, self);
  v7 = self->_ssvConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke;
  v11[3] = &unk_1E658C420;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v7 setInterruptionHandler:v11];
  v8 = self->_ssvConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_2;
  v9[3] = &unk_1E658C420;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->_ssvConnection resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained ssvConnection];
    v5 = [WeakRetained ssvConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSSmartSiriVolumeClient _createClientConnection]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained ssvConnection];

    if (v6)
    {
      v7 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_21;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

void __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained ssvConnection];
    v5 = [WeakRetained ssvConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSSmartSiriVolumeClient _createClientConnection]_block_invoke_2";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained ssvConnection];

    if (v6)
    {
      v7 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_22;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSsvConnection:0];
}

uint64_t __50__CSSmartSiriVolumeClient__createClientConnection__block_invoke_21(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ssvConnection];
  [v2 invalidate];

  v3 = *(void **)(a1 + 32);
  return [v3 setSsvConnection:0];
}

- (id)_getRemoteServiceProxyObject
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ssvConnection = self->_ssvConnection;
  if (ssvConnection
    || ([(CSSmartSiriVolumeClient *)self _createClientConnection],
        (ssvConnection = self->_ssvConnection) != 0))
  {
    v4 = [(NSXPCConnection *)ssvConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3603];
  }
  else
  {
    v6 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "-[CSSmartSiriVolumeClient _getRemoteServiceProxyObject]";
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s ERR: SmartSiriVolume ssvConnection is nil", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }
  return v4;
}

void __55__CSSmartSiriVolumeClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = (void *)*MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      uint64_t v5 = [v2 code];
      v6 = [v2 localizedDescription];
      int v7 = 136315650;
      v8 = "-[CSSmartSiriVolumeClient _getRemoteServiceProxyObject]_block_invoke";
      __int16 v9 = 2050;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s ERR: SmartSiriVolume Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)didTTSVolumeChangeForReason:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CSSmartSiriVolumeClient_didTTSVolumeChangeForReason___block_invoke;
  v4[3] = &unk_1E658D3C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __55__CSSmartSiriVolumeClient_didTTSVolumeChangeForReason___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D140];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v9 = 136315394;
    uint64_t v10 = "-[CSSmartSiriVolumeClient didTTSVolumeChangeForReason:]_block_invoke";
    __int16 v11 = 1026;
    int v12 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume didChangeForReason: %{public}d", (uint8_t *)&v9, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      [v8 didSmartSiriVolumeChangeForReason:*(void *)(a1 + 40)];
    }
  }
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CSSmartSiriVolumeClient_setPermanentVolumeOffsetWithDirection___block_invoke;
  v4[3] = &unk_1E658C870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __65__CSSmartSiriVolumeClient_setPermanentVolumeOffsetWithDirection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setPermanentVolumeOffsetWithDirection:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    v4 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[CSSmartSiriVolumeClient setPermanentVolumeOffsetWithDirection:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CSSmartSiriVolumeClient_setSmartSiriVolumeDirection___block_invoke;
  v4[3] = &unk_1E658C870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void __55__CSSmartSiriVolumeClient_setSmartSiriVolumeDirection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 setSmartSiriVolumeDirection:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    v4 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[CSSmartSiriVolumeClient setSmartSiriVolumeDirection:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CSSmartSiriVolumeClient_setSmartSiriVolumePercentage___block_invoke;
  v4[3] = &unk_1E658BDD8;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(queue, v4);
}

void __56__CSSmartSiriVolumeClient_setSmartSiriVolumePercentage___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 40);
    [v2 setSmartSiriVolumePercentage:v3];
  }
  else
  {
    float v5 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSmartSiriVolumeClient setSmartSiriVolumePercentage:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)getVolumeForTTSType:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3612;
  v19 = __Block_byref_object_dispose__3613;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke;
  v11[3] = &unk_1E658AFC8;
  void v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  unint64_t v14 = a3;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  double v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke_3;
    v7[3] = &unk_1E6589BF0;
    uint64_t v5 = *(void *)(a1 + 56);
    v7[4] = *(void *)(a1 + 48);
    [v2 getVolumeForTTSType:v5 withContext:v4 reply:v7];
  }
  else
  {
    id v6 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CSSmartSiriVolumeClient getVolumeForTTSType:withContext:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Remote Object Proxy is nil", buf, 0xCu);
    }
  }
}

void __59__CSSmartSiriVolumeClient_getVolumeForTTSType_withContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[CSSmartSiriVolumeClient getVolumeForTTSType:withContext:]_block_invoke";
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume Failed to get estimate with %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_ssvConnection invalidate];
  ssvConnection = self->_ssvConnection;
  self->_ssvConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSSmartSiriVolumeClient;
  [(CSSmartSiriVolumeClient *)&v4 dealloc];
}

- (CSSmartSiriVolumeClient)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CSSmartSiriVolumeClient;
  id v2 = [(CSSmartSiriVolumeClient *)&v7 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreSpeech.Connection.Listener", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    id v5 = *MEMORY[0x1E4F5D140];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D140], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CSSmartSiriVolumeClient init]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating SmartSiriVolume connection", buf, 0xCu);
    }
  }
  return v2;
}

@end