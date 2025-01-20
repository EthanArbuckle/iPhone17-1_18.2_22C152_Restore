@interface CXCallControllerHostConnection
- (BOOL)hasPushToTalkBackgroundMode;
- (BOOL)hasVoIPBackgroundMode;
- (BOOL)isChannelTransactionRequestPermitted;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXCallControllerHostConnection)init;
- (CXCallControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4;
- (CXCallControllerHostConnectionDelegate)delegate;
- (CXCallControllerVendorProtocol)remoteObjectProxy;
- (NSSet)capabilities;
- (NSString)applicationIdentifier;
- (NSString)description;
- (NSURL)bundleURL;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (void)addOrUpdateCall:(id)a3;
- (void)dealloc;
- (void)removeCall:(id)a3;
- (void)requestCalls:(id)a3;
- (void)requestTransaction:(id)a3 reply:(id)a4;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasPushToTalkBackgroundMode:(BOOL)a3;
- (void)setHasVoIPBackgroundMode:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CXCallControllerHostConnection

- (CXCallControllerHostConnection)init
{
  return 0;
}

- (CXCallControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CXCallControllerHostConnection;
  v9 = [(CXCallControllerHostConnection *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    uint64_t v11 = objc_msgSend(v7, "cx_applicationIdentifier");
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v7, "cx_capabilities");
    capabilities = v10->_capabilities;
    v10->_capabilities = (NSSet *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForConnection:", v7);
    uint64_t v16 = [v15 URL];
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v16;

    v10->_hasVoIPBackgroundMode = [v15 containsBackgroundModeOptions:1];
    v10->_hasPushToTalkBackgroundMode = [v15 containsBackgroundModeOptions:2];
    objc_storeStrong((id *)&v10->_connection, a3);
    [(NSXPCConnection *)v10->_connection setExportedObject:v10];
    v18 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callControllerHostInterface");
    [(NSXPCConnection *)v10->_connection setExportedInterface:v18];

    v19 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callControllerVendorInterface");
    [(NSXPCConnection *)v10->_connection setRemoteObjectInterface:v19];

    objc_initWeak(&location, v10);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke;
    v24[3] = &unk_1E5CADED0;
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v10->_connection setInterruptionHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_3;
    v22[3] = &unk_1E5CADED0;
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v10->_connection setInvalidationHandler:v22];
    [(NSXPCConnection *)v10->_connection resume];
    v20 = CXDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_1A6E3A000, v20, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v10;
}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for call controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 callControllerHostConnectionInvalidated:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXCallControllerHostConnection;
  [(CXCallControllerHostConnection *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CXCallControllerHostConnection *)self hasVoIPBackgroundMode];
  uint64_t v6 = [(CXCallControllerHostConnection *)self applicationIdentifier];
  uint64_t v7 = [(CXCallControllerHostConnection *)self bundleURL];
  id v8 = [(CXCallControllerHostConnection *)self capabilities];
  v9 = [v3 stringWithFormat:@"<%@ %p hasVoIPBackgroundMode=%d applicationIdentifier=%@ bundleURL=%@ capabilities=%@", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BOOL)isPermittedToUsePublicAPI
{
  if ([(CXCallControllerHostConnection *)self isPermittedToUsePrivateAPI]) {
    return 1;
  }

  return [(CXCallControllerHostConnection *)self hasVoIPBackgroundMode];
}

- (BOOL)isPermittedToUsePrivateAPI
{
  v2 = [(CXCallControllerHostConnection *)self capabilities];
  char v3 = [v2 containsObject:@"private-controller-api"];

  return v3;
}

- (BOOL)isChannelTransactionRequestPermitted
{
  if ([(CXCallControllerHostConnection *)self isPermittedToUsePrivateAPI]) {
    return 1;
  }

  return [(CXCallControllerHostConnection *)self hasPushToTalkBackgroundMode];
}

- (CXCallControllerVendorProtocol)remoteObjectProxy
{
  v2 = [(CXCallControllerHostConnection *)self connection];
  char v3 = [v2 remoteObjectProxy];

  return (CXCallControllerVendorProtocol *)v3;
}

- (void)addOrUpdateCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallControllerHostConnection *)self remoteObjectProxy];
  [v5 addOrUpdateCall:v4];
}

- (void)removeCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallControllerHostConnection *)self remoteObjectProxy];
  [v5 removeCall:v4];
}

- (void)requestCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallControllerHostConnection *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallControllerHostConnection_requestCalls___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__CXCallControllerHostConnection_requestCalls___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callControllerHostConnection:*(void *)(a1 + 32) requestCalls:*(void *)(a1 + 40)];
}

- (void)requestTransaction:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallControllerHostConnection *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CXCallControllerHostConnection_requestTransaction_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__CXCallControllerHostConnection_requestTransaction_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 callControllerHostConnection:*(void *)(a1 + 32) requestTransaction:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (CXCallControllerHostConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXCallControllerHostConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)hasPushToTalkBackgroundMode
{
  return self->_hasPushToTalkBackgroundMode;
}

- (void)setHasPushToTalkBackgroundMode:(BOOL)a3
{
  self->_hasPushToTalkBackgroundMode = a3;
}

- (BOOL)hasVoIPBackgroundMode
{
  return self->_hasVoIPBackgroundMode;
}

- (void)setHasVoIPBackgroundMode:(BOOL)a3
{
  self->_hasVoIPBackgroundMode = a3;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end