@interface SHShazamKitUIServiceConnection
- (NSXPCConnection)connection;
- (SHShazamKitUIServiceConnection)initWithConnectionProvider:(id)a3;
- (SHShazamKitUIServiceConnectionProvider)connectionProvider;
- (os_unfair_lock_s)connectionLock;
- (void)attachDefaultConnectionHandlers;
- (void)dealloc;
- (void)presentMediaItem:(id)a3 completionHandler:(id)a4;
- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5;
- (void)presentMediaLibraryWithCompletionHandler:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)tearDownConnection;
@end

@implementation SHShazamKitUIServiceConnection

- (void)dealloc
{
  [(SHShazamKitUIServiceConnection *)self tearDownConnection];
  v3.receiver = self;
  v3.super_class = (Class)SHShazamKitUIServiceConnection;
  [(SHShazamKitUIServiceConnection *)&v3 dealloc];
}

- (SHShazamKitUIServiceConnection)initWithConnectionProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHShazamKitUIServiceConnection;
  v6 = [(SHShazamKitUIServiceConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v7->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSXPCConnection)connection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    v4 = [(SHShazamKitUIServiceConnection *)self connectionProvider];
    id v5 = [v4 shazamKitUIServiceConnection];
    connection = self->_connection;
    self->_connection = v5;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(SHShazamKitUIServiceConnection *)self attachDefaultConnectionHandlers];
    [(NSXPCConnection *)self->_connection resume];
  }
  os_unfair_lock_unlock(p_connectionLock);
  v7 = self->_connection;

  return v7;
}

- (void)attachDefaultConnectionHandlers
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke;
  v5[3] = &unk_2646EF838;
  objc_copyWeak(&v6, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke_3;
  v3[3] = &unk_2646EF838;
  objc_copyWeak(&v4, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = shcore_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_224B4B000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service interruption handler %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 tearDownConnection];
}

void __65__SHShazamKitUIServiceConnection_attachDefaultConnectionHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = shcore_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_224B4B000, v2, OS_LOG_TYPE_ERROR, "Fired XPC service invalidation handler %@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 tearDownConnection];
}

- (void)tearDownConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setExportedObject:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
    id v4 = self->_connection;
    int v5 = self->_connection;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__SHShazamKitUIServiceConnection_tearDownConnection__block_invoke;
    v8[3] = &unk_2646EF920;
    objc_super v9 = v4;
    id v6 = v4;
    [(NSXPCConnection *)v5 scheduleSendBarrierBlock:v8];
    uint64_t v7 = self->_connection;
    self->_connection = 0;
  }
}

uint64_t __52__SHShazamKitUIServiceConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)presentMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__SHShazamKitUIServiceConnection_presentMediaItem_completionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  objc_super v9 = _Block_copy(aBlock);
  v10 = [(SHShazamKitUIServiceConnection *)self connection];
  v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 presentMediaItem:v8 completionHandler:v7];
}

void __69__SHShazamKitUIServiceConnection_presentMediaItem_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __90__SHShazamKitUIServiceConnection_presentMediaItem_presentationSettings_completionHandler___block_invoke;
  v19 = &unk_2646EF738;
  id v20 = v8;
  id v21 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = a4;
  id v13 = _Block_copy(&v16);
  v14 = [(SHShazamKitUIServiceConnection *)self connection];
  v15 = [v14 remoteObjectProxyWithErrorHandler:v13];
  [v15 presentMediaItem:v10 presentationSettings:v12 completionHandler:v11];
}

void __90__SHShazamKitUIServiceConnection_presentMediaItem_presentationSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) webURL];
  (*(void (**)(uint64_t, void, void *, id))(v3 + 16))(v3, 0, v4, v5);
}

- (void)presentMediaLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SHShazamKitUIServiceConnection_presentMediaLibraryWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v10 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  id v7 = [(SHShazamKitUIServiceConnection *)self connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 presentMediaLibraryWithCompletionHandler:v5];
}

void __75__SHShazamKitUIServiceConnection_presentMediaLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SHShazamKitUIServiceConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProvider, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end