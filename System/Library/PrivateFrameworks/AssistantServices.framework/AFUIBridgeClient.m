@interface AFUIBridgeClient
- (AFUIBridgeClient)initWithDelegate:(id)a3;
- (AFUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (AFUIBridgeClientDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_connection;
- (id)_uiBridgeService;
- (id)_uiBridgeServiceWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)preheat;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)siriDismissed;
- (void)siriPrompted;
- (void)siriWillPrompt;
- (void)startAttending;
- (void)stopAttendingWithReason:(unint64_t)a3;
@end

@implementation AFUIBridgeClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (AFUIBridgeClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFUIBridgeClientDelegate *)WeakRetained;
}

- (void)stopAttendingWithReason:(unint64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AFUIBridgeClient_stopAttendingWithReason___block_invoke;
  block[3] = &unk_1E5929BD0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __44__AFUIBridgeClient_stopAttendingWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained _uiBridgeService];
    [v3 stopAttendingWithReason:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)startAttending
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AFUIBridgeClient_startAttending__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__AFUIBridgeClient_startAttending__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained _uiBridgeService];
    char v3 = objc_opt_respondsToSelector();

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 _uiBridgeService];
      [v4 startAttending];

      id WeakRetained = v5;
    }
  }
}

- (void)siriPrompted
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__AFUIBridgeClient_siriPrompted__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__AFUIBridgeClient_siriPrompted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained _uiBridgeService];
    [v2 siriPrompted];

    id WeakRetained = v3;
  }
}

- (void)siriWillPrompt
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__AFUIBridgeClient_siriWillPrompt__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__AFUIBridgeClient_siriWillPrompt__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained _uiBridgeService];
    char v3 = objc_opt_respondsToSelector();

    id WeakRetained = v5;
    if (v3)
    {
      id v4 = [v5 _uiBridgeService];
      [v4 siriWillPrompt];

      id WeakRetained = v5;
    }
  }
}

- (void)siriDismissed
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__AFUIBridgeClient_siriDismissed__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __33__AFUIBridgeClient_siriDismissed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained _uiBridgeService];
    [v2 siriDismissed];

    id WeakRetained = v3;
  }
}

- (void)preheat
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__AFUIBridgeClient_preheat__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __27__AFUIBridgeClient_preheat__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained _uiBridgeService];
    [v2 preheat];

    id WeakRetained = v3;
  }
}

- (id)_uiBridgeServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIBridgeClient *)self _connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_uiBridgeService
{
  v2 = [(AFUIBridgeClient *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    id v4 = +[AFInstanceContext defaultContext];
    id v5 = [v4 createXPCConnectionWithMachServiceName:@"com.apple.assistant.request-dispatcher.uibridge-service" options:0];
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    v7 = self->_xpcConnection;
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEE9FC08];
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    v9 = self->_xpcConnection;
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEE9FE20];
    [(NSXPCConnection *)v9 setExportedInterface:v10];

    v11 = self->_xpcConnection;
    v12 = [[AFUIBridgeServiceProxy alloc] initWithClient:self];
    [(NSXPCConnection *)v11 setExportedObject:v12];

    [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
    objc_initWeak(&location, self);
    v13 = self->_xpcConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31__AFUIBridgeClient__connection__block_invoke;
    v18[3] = &unk_1E592B978;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v18];
    v14 = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__AFUIBridgeClient__connection__block_invoke_2;
    v16[3] = &unk_1E592B978;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v14 setInterruptionHandler:v16];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __31__AFUIBridgeClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFUIBridgeClient _connection]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s UIBridge Connection Invalidated", buf, 0xCu);
  }
  id v3 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__AFUIBridgeClient__connection__block_invoke_67;
    block[3] = &unk_1E592B978;
    objc_copyWeak(&v8, v3);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
  }
}

void __31__AFUIBridgeClient__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[AFUIBridgeClient _connection]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s UIBridge Connection Interrupted", buf, 0xCu);
  }
  id v3 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__AFUIBridgeClient__connection__block_invoke_69;
    block[3] = &unk_1E592B978;
    objc_copyWeak(&v8, v3);
    dispatch_async(v6, block);
    objc_destroyWeak(&v8);
  }
}

void __31__AFUIBridgeClient__connection__block_invoke_69(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[1] invalidate];
    id v2 = v3[1];
    v3[1] = 0;

    id WeakRetained = v3;
  }
}

void __31__AFUIBridgeClient__connection__block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFUIBridgeClient;
  [(AFUIBridgeClient *)&v3 dealloc];
}

- (AFUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUIBridgeClient;
  id v8 = [(AFUIBridgeClient *)&v14 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.siri.uibridge-client", v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    objc_storeWeak((id *)&v8->_delegate, v6);
  }

  return v8;
}

- (AFUIBridgeClient)initWithDelegate:(id)a3
{
  return [(AFUIBridgeClient *)self initWithDelegate:a3 delegateQueue:MEMORY[0x1E4F14428]];
}

@end