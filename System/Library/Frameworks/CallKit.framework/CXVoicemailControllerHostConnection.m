@interface CXVoicemailControllerHostConnection
- (BOOL)isPermittedToUsePrivateAPI;
- (CXVoicemailControllerHostConnection)init;
- (CXVoicemailControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4;
- (CXVoicemailControllerHostConnectionDelegate)delegate;
- (CXVoicemailControllerVendorProtocol)remoteObjectProxy;
- (NSSet)capabilities;
- (NSString)applicationIdentifier;
- (NSString)description;
- (NSURL)bundleURL;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (void)addOrUpdateVoicemails:(id)a3;
- (void)dealloc;
- (void)removeVoicemails:(id)a3;
- (void)requestTransaction:(id)a3 reply:(id)a4;
- (void)requestVoicemails:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundleURL:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation CXVoicemailControllerHostConnection

- (CXVoicemailControllerHostConnection)init
{
  return 0;
}

- (CXVoicemailControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CXVoicemailControllerHostConnection;
  v9 = [(CXVoicemailControllerHostConnection *)&v33 init];
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

    if (v10->_applicationIdentifier
      && [(CXVoicemailControllerHostConnection *)v10 isPermittedToUsePrivateAPI])
    {
      objc_storeStrong((id *)&v10->_connection, a3);
      [(NSXPCConnection *)v10->_connection setExportedObject:v10];
      v18 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailControllerHostInterface");
      [(NSXPCConnection *)v10->_connection setExportedInterface:v18];

      v19 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailControllerVendorInterface");
      [(NSXPCConnection *)v10->_connection setRemoteObjectInterface:v19];

      objc_initWeak(&location, v10);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke;
      v30[3] = &unk_1E5CADED0;
      objc_copyWeak(&v31, &location);
      [(NSXPCConnection *)v10->_connection setInterruptionHandler:v30];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_3;
      v28[3] = &unk_1E5CADED0;
      objc_copyWeak(&v29, &location);
      [(NSXPCConnection *)v10->_connection setInvalidationHandler:v28];
      [(NSXPCConnection *)v10->_connection resume];
      v20 = CXDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v10;
        _os_log_impl(&dword_1A6E3A000, v20, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      v21 = CXDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = (CXVoicemailControllerHostConnection *)objc_opt_class();
        v24 = v10->_applicationIdentifier;
        v25 = v10->_bundleURL;
        v26 = v10->_capabilities;
        *(_DWORD *)buf = 138413314;
        v35 = v23;
        __int16 v36 = 2112;
        v37 = v24;
        __int16 v38 = 2112;
        v39 = v25;
        __int16 v40 = 2112;
        v41 = v26;
        __int16 v42 = 2112;
        id v43 = v7;
        v27 = v23;
        _os_log_error_impl(&dword_1A6E3A000, v21, OS_LOG_TYPE_ERROR, "Denying creation of %@ with applicationIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x34u);
      }
      v10 = 0;
    }
  }
  return v10;
}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

uint64_t __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for voicemail controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4;
  block[3] = &unk_1E5CADD30;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async(v2, block);
}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for voicemail controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) delegate];
  [v4 voicemailControllerHostConnectionInvalidated:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXVoicemailControllerHostConnection;
  [(CXVoicemailControllerHostConnection *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(CXVoicemailControllerHostConnection *)self applicationIdentifier];
  uint64_t v6 = [(CXVoicemailControllerHostConnection *)self bundleURL];
  uint64_t v7 = [(CXVoicemailControllerHostConnection *)self capabilities];
  id v8 = [v3 stringWithFormat:@"<%@ %p applicationIdentifier=%@ bundleURL=%@ capabilities=%@", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  v2 = [(CXVoicemailControllerHostConnection *)self capabilities];
  char v3 = [v2 containsObject:@"private-voicemail-controller-api"];

  return v3;
}

- (CXVoicemailControllerVendorProtocol)remoteObjectProxy
{
  v2 = [(CXVoicemailControllerHostConnection *)self connection];
  char v3 = [v2 remoteObjectProxy];

  return (CXVoicemailControllerVendorProtocol *)v3;
}

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailControllerHostConnection *)self remoteObjectProxy];
  [v5 addOrUpdateVoicemails:v4];
}

- (void)removeVoicemails:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailControllerHostConnection *)self remoteObjectProxy];
  [v5 removeVoicemails:v4];
}

- (void)requestVoicemails:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailControllerHostConnection *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CXVoicemailControllerHostConnection_requestVoicemails___block_invoke;
  v7[3] = &unk_1E5CADD78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__CXVoicemailControllerHostConnection_requestVoicemails___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 voicemailControllerHostConnection:*(void *)(a1 + 32) requestVoicemails:*(void *)(a1 + 40)];
}

- (void)requestTransaction:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXVoicemailControllerHostConnection *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CXVoicemailControllerHostConnection_requestTransaction_reply___block_invoke;
  block[3] = &unk_1E5CADDA0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __64__CXVoicemailControllerHostConnection_requestTransaction_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 voicemailControllerHostConnection:*(void *)(a1 + 32) requestTransaction:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
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

- (CXVoicemailControllerHostConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXVoicemailControllerHostConnectionDelegate *)WeakRetained;
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