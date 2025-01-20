@interface MTRPluginServer
+ (id)sharedInstance;
- (BOOL)_deliverMessageToDelegate:(id)a3 homeUUID:(id)a4;
- (BOOL)addClientConnection:(id)a3;
- (BOOL)handleIncomingMessage:(id)a3;
- (BOOL)isRunning;
- (BOOL)removeClientConnection:(id)a3;
- (BOOL)startWithDelegate:(id)a3 queue:(id)a4;
- (BOOL)stop;
- (MTRPluginServer)init;
- (MTRPluginServerDelegate)delegate;
- (NSMutableSet)_clientConnections;
- (NSSet)clientConnections;
- (OS_dispatch_queue)delegateQueue;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)set_clientConnections:(id)a3;
@end

@implementation MTRPluginServer

+ (id)sharedInstance
{
  if (sharedInstance_creation_1 != -1) {
    dispatch_once(&sharedInstance_creation_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sInstance_1;
  return v2;
}

uint64_t __33__MTRPluginServer_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_1 = objc_alloc_init(MTRPluginServer);
  return MEMORY[0x270F9A758]();
}

- (MTRPluginServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRPluginServer;
  v2 = [(MTRPluginServer *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    [(MTRPluginServer *)v2 set_clientConnections:v3];

    v4 = v2;
  }

  return v2;
}

- (BOOL)startWithDelegate:(id)a3 queue:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting MTRPluginServer: %p", (uint8_t *)&v9, 0xCu);
  }
  [(MTRPluginServer *)self setDelegate:v6];
  [(MTRPluginServer *)self setDelegateQueue:v7];
  [(MTRPluginServer *)self setRunning:1];

  return 1;
}

- (BOOL)stop
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = self;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Stopping MTRPluginServer: %p", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(MTRPluginServer *)self _clientConnections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(MTRPluginServer *)self setRunning:0];
  [(MTRPluginServer *)self setDelegate:0];
  [(MTRPluginServer *)self setDelegateQueue:0];
  v8 = [MEMORY[0x263EFF9C0] set];
  [(MTRPluginServer *)self set_clientConnections:v8];

  return 1;
}

- (NSSet)clientConnections
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(MTRPluginServer *)v2 _clientConnections];
  uint64_t v5 = [v3 setWithSet:v4];

  objc_sync_exit(v2);
  return (NSSet *)v5;
}

- (BOOL)addClientConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Adding client connection: %@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v5 = [(MTRPluginServer *)self _clientConnections];
    char v6 = [v5 containsObject:v4];

    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Ignoring, already added", (uint8_t *)&v9, 2u);
      }
    }
    else
    {
      uint64_t v7 = [(MTRPluginServer *)self _clientConnections];
      [v7 addObject:v4];
    }
  }

  return v4 != 0;
}

- (BOOL)removeClientConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Removing client connection: %@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v5 = [(MTRPluginServer *)self _clientConnections];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      uint64_t v7 = [(MTRPluginServer *)self _clientConnections];
      [v7 removeObject:v4];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " => Ignoring, not present", (uint8_t *)&v9, 2u);
    }
  }

  return v4 != 0;
}

- (BOOL)_deliverMessageToDelegate:(id)a3 homeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTRPluginServer *)self isRunning]
    && ([(MTRPluginServer *)self delegate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    id v10 = [(MTRPluginServer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MTRPluginServer__deliverMessageToDelegate_homeUUID___block_invoke;
    block[3] = &unk_2653E6908;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v10, block);

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __54__MTRPluginServer__deliverMessageToDelegate_homeUUID___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    id v4 = [v2 delegate];
    uint64_t v5 = a1[6];
    *(_DWORD *)buf = 138413058;
    v16 = v2;
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Delivering message: %@ to delegate: %@ homeUUID: %@", buf, 0x2Au);
  }
  id v7 = (void *)a1[4];
  id v6 = a1 + 4;
  v8 = [v7 delegate];
  uint64_t v9 = v6[1];
  uint64_t v10 = v6[2];
  id v14 = 0;
  int v11 = [v8 sendMessage:v9 homeUUID:v10 error:&v14];
  id v12 = v14;

  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __54__MTRPluginServer__deliverMessageToDelegate_homeUUID___block_invoke_cold_1(v6, (uint64_t)v12);
  }
}

- (BOOL)handleIncomingMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x25A290B70]();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Received incoming HMFMessage %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = +[MTRPluginProtobufOverModernTransport sharedInstance];
  [v6 dispatchIncomingMessage:v4];

  return 1;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSMutableSet)_clientConnections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_clientConnections:(id)a3
{
}

- (MTRPluginServerDelegate)delegate
{
  return (MTRPluginServerDelegate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->__clientConnections, 0);
}

void __54__MTRPluginServer__deliverMessageToDelegate_homeUUID___block_invoke_cold_1(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ *** Failed to sendMessage with error: %@", (uint8_t *)&v3, 0x16u);
}

@end