@interface IPServerXPCTransport
+ (id)defaultXPCTransport;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IPServerXPCTransport)initWithListener:(id)a3;
- (IPServerXPCTransportDelegate)delegate;
- (OS_dispatch_queue)serviceQueue;
- (void)clientDisconnected:(id)a3;
- (void)disseminateProgressEndForIdenitty:(id)a3 reason:(unint64_t)a4;
- (void)disseminateProgressUpdateForIdentity:(id)a3 currentProgress:(id)a4;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation IPServerXPCTransport

+ (id)defaultXPCTransport
{
  if (defaultXPCTransport_onceToken != -1) {
    dispatch_once(&defaultXPCTransport_onceToken, &__block_literal_global_102);
  }
  v2 = (void *)defaultXPCTransport_transport;

  return v2;
}

void __43__IPServerXPCTransport_defaultXPCTransport__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.InstallProgress.xpc"];
  v0 = [[IPServerXPCTransport alloc] initWithListener:v2];
  v1 = (void *)defaultXPCTransport_transport;
  defaultXPCTransport_transport = (uint64_t)v0;
}

- (IPServerXPCTransport)initWithListener:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IPServerXPCTransport;
  v6 = [(IPServerXPCTransport *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clients = v7->_clients;
    v7->_clients = v8;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.InstallProgress.IPServerXPCTransport.%p", v7);
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
    serviceQueue = v7->_serviceQueue;
    v7->_serviceQueue = (OS_dispatch_queue *)v13;

    [v5 setDelegate:v7];
    [v5 _setQueue:v7->_serviceQueue];
  }
  return v7;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)resume
{
}

- (void)disseminateProgressUpdateForIdentity:(id)a3 currentProgress:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_clients;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "sendUpdateForIdentity:currentProgress:", v6, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)disseminateProgressEndForIdenitty:(id)a3 reason:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = self->_clients;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "sendProgressEndForIdentity:reason:", v6, a4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v7 = [WeakRetained transport:self shouldAcceptConnection:v5];

  if (v7)
  {
    uint64_t v8 = [[IPXPCClient alloc] initWithConnection:v5 serviceQueue:self->_serviceQueue];
    [(NSMutableSet *)self->_clients addObject:v8];
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v10 = [v9 transport:self requestDelegateForClient:v8];
    [(IPXPCClient *)v8 setDelegate:v10];

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 transport:self acceptedClient:v8];

    [(IPXPCClient *)v8 resume];
  }
  else
  {
    long long v12 = _IPServerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_252AA9000, v12, OS_LOG_TYPE_DEFAULT, "Rejecting connection %@.", (uint8_t *)&v14, 0xCu);
    }
  }
  return v7;
}

- (void)clientDisconnected:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_clients containsObject:v4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained transport:self clientDisconnected:v4];

    [(NSMutableSet *)self->_clients removeObject:v4];
  }
  else
  {
    id v6 = _IPServerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[IPServerXPCTransport clientDisconnected:](v6);
    }
  }
}

- (IPServerXPCTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPServerXPCTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)clientDisconnected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_252AA9000, log, OS_LOG_TYPE_FAULT, "unknown client disconnected!", v1, 2u);
}

@end