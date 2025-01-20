@interface _COStateManagerConnectionProvider
- (NSXPCConnection)stateManagerServiceConnection;
@end

@implementation _COStateManagerConnectionProvider

- (NSXPCConnection)stateManagerServiceConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_stateManagerServiceConnection;
  if (!v3)
  {
    if (!v2->_stateManagerServiceConnection)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.coordination.state" options:4096];
      stateManagerServiceConnection = v2->_stateManagerServiceConnection;
      v2->_stateManagerServiceConnection = (NSXPCConnection *)v4;
    }
    objc_initWeak(&location, v2);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __66___COStateManagerConnectionProvider_stateManagerServiceConnection__block_invoke;
    v11 = &unk_264444AB8;
    objc_copyWeak(&v12, &location);
    v6 = (void *)MEMORY[0x21D4BD7F0](&v8);
    -[NSXPCConnection setInterruptionHandler:](v2->_stateManagerServiceConnection, "setInterruptionHandler:", v6, v8, v9, v10, v11);
    [(NSXPCConnection *)v2->_stateManagerServiceConnection setInvalidationHandler:v6];
    v3 = v2->_stateManagerServiceConnection;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
}

@end