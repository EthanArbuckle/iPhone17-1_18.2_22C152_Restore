@interface SHShazamKitServiceConnection
- (NSXPCConnection)connection;
- (SHShazamKitServiceConnection)initWithConnectionProvider:(id)a3;
- (SHShazamKitServiceConnectionClient)shazamKitClient;
- (SHShazamKitServiceConnectionProvider)connectionProvider;
- (id)delegate;
- (id)matcherDelegateErrorHandlerForSignature:(id)a3;
- (os_unfair_lock_s)connectionLock;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4;
- (void)attachDefaultConnectionHandlers;
- (void)dealloc;
- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4;
- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4;
- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
- (void)tearDownConnection;
@end

@implementation SHShazamKitServiceConnection

- (void)dealloc
{
  [(SHShazamKitServiceConnection *)self tearDownConnection];
  v3.receiver = self;
  v3.super_class = (Class)SHShazamKitServiceConnection;
  [(SHShazamKitServiceConnection *)&v3 dealloc];
}

- (SHShazamKitServiceConnection)initWithConnectionProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHShazamKitServiceConnection;
  v6 = [(SHShazamKitServiceConnection *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(SHShazamKitServiceConnectionClient);
    shazamKitClient = v6->_shazamKitClient;
    v6->_shazamKitClient = v7;

    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v6->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)delegate
{
  v2 = [(SHShazamKitServiceConnection *)self shazamKitClient];
  objc_super v3 = [v2 delegate];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SHShazamKitServiceConnection *)self shazamKitClient];
  [v5 setDelegate:v4];
}

- (NSXPCConnection)connection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    id v4 = [(SHShazamKitServiceConnection *)self connectionProvider];
    id v5 = [v4 shazamKitServiceConnection];
    connection = self->_connection;
    self->_connection = v5;

    v7 = [(SHShazamKitServiceConnection *)self shazamKitClient];
    [(NSXPCConnection *)self->_connection setExportedObject:v7];

    [(SHShazamKitServiceConnection *)self attachDefaultConnectionHandlers];
    [(NSXPCConnection *)self->_connection resume];
  }
  os_unfair_lock_unlock(p_connectionLock);
  v8 = self->_connection;

  return v8;
}

- (void)attachDefaultConnectionHandlers
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke;
  v5[3] = &unk_2646EF838;
  objc_copyWeak(&v6, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke_3;
  v3[3] = &unk_2646EF838;
  objc_copyWeak(&v4, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = sh_log_object();
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

void __63__SHShazamKitServiceConnection_attachDefaultConnectionHandlers__block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = sh_log_object();
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
    v8[2] = __50__SHShazamKitServiceConnection_tearDownConnection__block_invoke;
    v8[3] = &unk_2646EF920;
    v9 = v4;
    id v6 = v4;
    [(NSXPCConnection *)v5 scheduleSendBarrierBlock:v8];
    uint64_t v7 = self->_connection;
    self->_connection = 0;
  }
}

uint64_t __50__SHShazamKitServiceConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)matcherDelegateErrorHandlerForSignature:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__SHShazamKitServiceConnection_matcherDelegateErrorHandlerForSignature___block_invoke;
  aBlock[3] = &unk_2646EFAA8;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __72__SHShazamKitServiceConnection_matcherDelegateErrorHandlerForSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v4 = objc_loadWeakRetained(&to);
  id v5 = [v4 delegate];
  int v6 = [v5 conformsToProtocol:&unk_26D7E6DE0];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(&to);
    v8 = [v7 delegate];

    id v9 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:v3];
    id v10 = objc_loadWeakRetained(&to);
    v11 = +[SHMatcherResponse errorResponseForSignature:*(void *)(a1 + 32) error:v9];
    [v8 matcher:v10 didProduceResponse:v11];
  }
  objc_destroyWeak(&to);
}

- (void)prepareMatcherForRequestID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SHShazamKitServiceConnection *)self connection];
  id v9 = objc_opt_new();
  id v10 = [(SHShazamKitServiceConnection *)self matcherDelegateErrorHandlerForSignature:v9];
  v11 = [v8 remoteObjectProxyWithErrorHandler:v10];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__SHShazamKitServiceConnection_prepareMatcherForRequestID_completionHandler___block_invoke;
  v13[3] = &unk_2646EF948;
  id v14 = v6;
  id v12 = v6;
  [v11 prepareMatcherForRequestID:v7 completionHandler:v13];
}

uint64_t __77__SHShazamKitServiceConnection_prepareMatcherForRequestID_completionHandler___block_invoke(uint64_t a1)
{
  v2 = sh_log_object();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_224B4B000, v2, OS_LOG_TYPE_DEBUG, "Prepare recognition request completion handler called", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startRecognitionForRequest:(id)a3
{
  id v9 = a3;
  id v4 = [(SHShazamKitServiceConnection *)self connection];
  id v5 = [v9 signature];
  id v6 = v5;
  if (!v5) {
    id v6 = objc_opt_new();
  }
  id v7 = [(SHShazamKitServiceConnection *)self matcherDelegateErrorHandlerForSignature:v6];
  v8 = [v4 remoteObjectProxyWithErrorHandler:v7];
  [v8 startRecognitionForRequest:v9 completionHandler:&__block_literal_global_8];

  if (!v5) {
}
  }

void __59__SHShazamKitServiceConnection_startRecognitionForRequest___block_invoke()
{
  v0 = sh_log_object();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_224B4B000, v0, OS_LOG_TYPE_DEBUG, "Recognition request completion handler called", v1, 2u);
  }
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(SHShazamKitServiceConnection *)self connection];
  v8 = [v6 signature];
  id v9 = [(SHShazamKitServiceConnection *)self matcherDelegateErrorHandlerForSignature:v8];
  id v10 = [v11 remoteObjectProxyWithErrorHandler:v9];
  [v10 matcher:v7 didProduceResponse:v6];
}

- (void)stopRecognition
{
  id v3 = [(SHShazamKitServiceConnection *)self connection];
  v2 = [v3 remoteObjectProxy];
  [v2 stopRecognition];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v6 = [(SHShazamKitServiceConnection *)self connection];
  id v5 = [v6 remoteObjectProxy];
  [v5 stopRecognitionForRequestID:v4];
}

- (void)_synchronizeSnapshot:(id)a3 startCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke;
  aBlock[3] = &unk_2646EFAD0;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [(SHShazamKitServiceConnection *)self connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 synchronizeSnapshot:v8 startCondition:v7 completionHandler:&__block_literal_global_68];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  int v3 = [v2 conformsToProtocol:&unk_26D7E75B8];

  if (v3)
  {
    id v4 = [WeakRetained delegate];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamKit.ShazamLibrary" code:301 userInfo:0];
    id v6 = [*(id *)(a1 + 32) allItemIdentifiers];
    [v4 _library:WeakRetained didProduceError:v5 failedItemIdentifiers:v6];
  }
}

void __68__SHShazamKitServiceConnection__synchronizeSnapshot_startCondition___block_invoke_2()
{
  v0 = sh_log_object();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_224B4B000, v0, OS_LOG_TYPE_DEFAULT, "Synchronize difference completion handler called", v1, 2u);
  }
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__SHShazamKitServiceConnection__libraryInfoWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v10 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  id v7 = [(SHShazamKitServiceConnection *)self connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  [v8 _libraryInfoWithCompletionHandler:v5];
}

void __66__SHShazamKitServiceConnection__libraryInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamKit.ShazamLibrary" code:301 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__SHShazamKitServiceConnection__queryLibraryWithParameters_completionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(SHShazamKitServiceConnection *)self connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 _queryLibraryWithParameters:v8 completionHandler:v7];
}

void __78__SHShazamKitServiceConnection__queryLibraryWithParameters_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamKit.ShazamLibrary" code:301 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mediaItemsForShazamIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SHShazamKitServiceConnection_mediaItemsForShazamIDs_completionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(SHShazamKitServiceConnection *)self connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 mediaItemsForShazamIDs:v8 completionHandler:v7];
}

void __73__SHShazamKitServiceConnection_mediaItemsForShazamIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hapticsForMediaItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__SHShazamKitServiceConnection_hapticsForMediaItems_completionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(SHShazamKitServiceConnection *)self connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 hapticsForMediaItems:v8 completionHandler:v7];
}

void __71__SHShazamKitServiceConnection_hapticsForMediaItems_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isHapticTrackAvailableForMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SHShazamKitServiceConnection_isHapticTrackAvailableForMediaItem_completionHandler___block_invoke;
  aBlock[3] = &unk_2646EF948;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = _Block_copy(aBlock);
  id v10 = [(SHShazamKitServiceConnection *)self connection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  [v11 isHapticTrackAvailableForMediaItem:v8 completionHandler:v7];
}

void __85__SHShazamKitServiceConnection_isHapticTrackAvailableForMediaItem_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F6C498] errorWithCode:100 underlyingError:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SHShazamKitServiceConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (SHShazamKitServiceConnectionClient)shazamKitClient
{
  return self->_shazamKitClient;
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
  objc_storeStrong((id *)&self->_shazamKitClient, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end