@interface CSSSRXPCClient
- (CSSSRXPCClient)init;
- (CSSSRXPCClientDelegate)delegate;
- (NSXPCConnection)ssrConnection;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (id)_getRemoteServiceProxyObject;
- (id)remoteObjectProxy;
- (void)_createClientConnection;
- (void)dealloc;
- (void)didFinishSpeakerRecognition:(id)a3;
- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setSsrConnection:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)startXPCConnection;
@end

@implementation CSSSRXPCClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ssrConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSsrConnection:(id)a3
{
}

- (NSXPCConnection)ssrConnection
{
  return self->_ssrConnection;
}

- (void)setDelegate:(id)a3
{
}

- (CSSSRXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSSRXPCClientDelegate *)WeakRetained;
}

- (void)didFinishSpeakerRecognition:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSSSRXPCClient didFinishSpeakerRecognition:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CSSSRXPCClient_didFinishSpeakerRecognition___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __46__CSSSRXPCClient_didFinishSpeakerRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 didFinishSpeakerRecognition:*(void *)(a1 + 40)];
  }
}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E4F5D180];
  v6 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[CSSSRXPCClient didReceiveSpeakerRecognitionScoreCard:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__CSSSRXPCClient_didReceiveSpeakerRecognitionScoreCard___block_invoke;
    v9[3] = &unk_1E658D4B0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(queue, v9);
  }
  else
  {
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[CSSSRXPCClient didReceiveSpeakerRecognitionScoreCard:]";
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s scoreCard is nil!", buf, 0xCu);
    }
  }
}

void __56__CSSSRXPCClient_didReceiveSpeakerRecognitionScoreCard___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 didReceiveSpeakerRecognitionScoreCard:*(void *)(a1 + 40)];
  }
}

- (void)_createClientConnection
{
  char v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.corespeechd.ssr.service" options:4096];
  ssrConnection = self->_ssrConnection;
  self->_ssrConnection = v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2405B58];
  [(NSXPCConnection *)self->_ssrConnection setRemoteObjectInterface:v5];

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23DE350];
  [(NSXPCConnection *)self->_ssrConnection setExportedInterface:v6];

  [(NSXPCConnection *)self->_ssrConnection setExportedObject:self];
  [(NSXPCConnection *)self->_ssrConnection _setQueue:self->_xpcConnectionQueue];
  objc_initWeak(&location, self);
  id v7 = self->_ssrConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke;
  v11[3] = &unk_1E658C420;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v7 setInterruptionHandler:v11];
  v8 = self->_ssrConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_2;
  v9[3] = &unk_1E658C420;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->_ssrConnection resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __41__CSSSRXPCClient__createClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    char v3 = v2;
    id v4 = [WeakRetained ssrConnection];
    v5 = [WeakRetained ssrConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSSSRXPCClient _createClientConnection]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained ssrConnection];

    if (v6)
    {
      id v7 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_19;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

void __41__CSSSRXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    char v3 = v2;
    id v4 = [WeakRetained ssrConnection];
    v5 = [WeakRetained ssrConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSSSRXPCClient _createClientConnection]_block_invoke_2";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained ssrConnection];

    if (v6)
    {
      id v7 = [WeakRetained queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__CSSSRXPCClient__createClientConnection__block_invoke_20;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __41__CSSSRXPCClient__createClientConnection__block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSsrConnection:0];
}

uint64_t __41__CSSSRXPCClient__createClientConnection__block_invoke_19(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ssrConnection];
  [v2 invalidate];

  char v3 = *(void **)(a1 + 32);
  return [v3 setSsrConnection:0];
}

- (id)_getRemoteServiceProxyObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_ssrConnection)
  {
    id v4 = (os_log_t *)MEMORY[0x1E4F5D180];
    v5 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    ssrConnection = self->_ssrConnection;
    if (ssrConnection
      || ([(CSSSRXPCClient *)self _createClientConnection],
          (ssrConnection = self->_ssrConnection) != 0))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__CSSSRXPCClient__getRemoteServiceProxyObject__block_invoke;
      v12[3] = &unk_1E658C9D8;
      v12[4] = self;
      id v7 = [(NSXPCConnection *)ssrConnection synchronousRemoteObjectProxyWithErrorHandler:v12];
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = v7;
    }
    else
    {
      __int16 v11 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v14 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s ERR: SSR ssrConnection is nil", buf, 0xCu);
      }
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = 0;
    }

    id remoteObjectProxy = self->_remoteObjectProxy;
  }
  id v9 = remoteObjectProxy;
  return v9;
}

void __46__CSSSRXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      id v7 = v4;
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v10 = 136315650;
      __int16 v11 = "-[CSSSRXPCClient _getRemoteServiceProxyObject]_block_invoke";
      __int16 v12 = 2050;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s ERR: SSR Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;
  }
}

- (void)startXPCConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CSSSRXPCClient_startXPCConnection__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CSSSRXPCClient_startXPCConnection__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _getRemoteServiceProxyObject];
  [v1 startXPCConnection];
}

- (void)dealloc
{
  [(CSSSRXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSSSRXPCClient;
  [(CSSSRXPCClient *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_ssrConnection invalidate];
  ssrConnection = self->_ssrConnection;
  self->_ssrConnection = 0;
}

- (CSSSRXPCClient)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CSSSRXPCClient;
  v2 = [(CSSSRXPCClient *)&v13 init];
  if (!v2)
  {
LABEL_5:
    __int16 v11 = v2;
    goto LABEL_9;
  }
  CSLogInitIfNeeded();
  uint64_t v3 = [MEMORY[0x1E4F5D450] getSerialQueue:@"com.apple.CoreSpeech.Connection.SSR.Client" qualityOfService:33];
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  uint64_t v5 = [MEMORY[0x1E4F5D450] getSerialQueue:@"com.apple.CoreSpeech.Connection.SSR" qualityOfService:33];
  xpcConnectionQueue = v2->_xpcConnectionQueue;
  v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;

  uint64_t v7 = [(CSSSRXPCClient *)v2 _getRemoteServiceProxyObject];
  id remoteObjectProxy = v2->_remoteObjectProxy;
  v2->_id remoteObjectProxy = (id)v7;

  id v9 = *MEMORY[0x1E4F5D180];
  int v10 = *MEMORY[0x1E4F5D180];
  if (v2->_remoteObjectProxy)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[CSSSRXPCClient init]";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Successfully created SSR connection", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[CSSSRXPCClient init]";
    _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s SSR Remote Object Proxy is nil", buf, 0xCu);
  }
  __int16 v11 = 0;
LABEL_9:

  return v11;
}

@end