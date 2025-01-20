@interface FSMessageReceiver
+ (id)receiverForStandardIO:(id)a3;
+ (id)receiverWithDelegate:(id)a3;
+ (id)receiverWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FSMessageReceiver)initWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5;
- (FSMessageReceiverDelegateWrapper)delegateWrapper;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (id)getConnection;
- (void)didStart;
@end

@implementation FSMessageReceiver

- (FSMessageReceiver)initWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FSMessageReceiver;
  v11 = [(FSMessageReceiver *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F08D88] anonymousListener];
    listener = v11->_listener;
    v11->_listener = (NSXPCListener *)v12;

    [(NSXPCListener *)v11->_listener setDelegate:v11];
    uint64_t v14 = [(NSXPCListener *)v11->_listener endpoint];
    endpoint = v11->_endpoint;
    v11->_endpoint = (NSXPCListenerEndpoint *)v14;

    [(NSXPCListener *)v11->_listener resume];
    v16 = [[FSMessageReceiverDelegateWrapper alloc] initWithDelegate:v8 Locale:v9 preferredLanguages:v10];
    delegateWrapper = v11->_delegateWrapper;
    v11->_delegateWrapper = v16;
  }
  return v11;
}

+ (id)receiverWithDelegate:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  v6 = [v4 currentLocale];
  v7 = [MEMORY[0x263EFF960] preferredLanguages];
  id v8 = [a1 receiverWithDelegate:v5 locale:v6 preferredLanguages:v7];

  return v8;
}

+ (id)receiverWithDelegate:(id)a3 locale:(id)a4 preferredLanguages:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithDelegate:v10 locale:v9 preferredLanguages:v8];

  return v11;
}

+ (id)receiverForStandardIO:(id)a3
{
  v4 = +[FSMessageSTDIODelegate delegateWithCompletionHandler:a3];
  id v5 = [a1 receiverWithDelegate:v4];

  return v5;
}

- (id)getConnection
{
  v3 = [[FSMessageConnection alloc] initWithEndpoint:self->_endpoint];
  [(FSMessageConnection *)v3 setReceiver:self];
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FSKitConstants FSTaskOperations];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self->_delegateWrapper];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __56__FSMessageReceiver_listener_shouldAcceptNewConnection___block_invoke;
  uint64_t v14 = &unk_26530B130;
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:&v11];
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  id v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[FSMessageReceiver listener:shouldAcceptNewConnection:](v9);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __56__FSMessageReceiver_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v2 = [WeakRetained delegateWrapper];
    char v3 = objc_opt_respondsToSelector();

    v4 = [v7 delegateWrapper];
    if (v3)
    {
      id v5 = fs_errorForCocoaError(4099);
      [v4 completed:v5 reply:&__block_literal_global_82];
    }
    else
    {
      char v6 = objc_opt_respondsToSelector();

      id WeakRetained = v7;
      if ((v6 & 1) == 0) {
        goto LABEL_7;
      }
      v4 = [v7 delegateWrapper];
      id v5 = fs_errorForCocoaError(4099);
      [v4 completed:v5 replyHandler:&__block_literal_global_84];
    }

    id WeakRetained = v7;
  }
LABEL_7:
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (FSMessageReceiverDelegateWrapper)delegateWrapper
{
  return (FSMessageReceiverDelegateWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)didStart
{
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[FSMessageReceiver listener:shouldAcceptNewConnection:]";
  _os_log_debug_impl(&dword_24DDB2000, log, OS_LOG_TYPE_DEBUG, "%s:connection:accept", (uint8_t *)&v1, 0xCu);
}

@end