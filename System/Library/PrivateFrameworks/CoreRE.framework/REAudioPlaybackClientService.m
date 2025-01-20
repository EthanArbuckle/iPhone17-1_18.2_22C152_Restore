@interface REAudioPlaybackClientService
- (BOOL)connected;
- (REAudioPlaybackClientService)initWithXPCEndpoint:(id)a3 queue:(id)a4 service:(id)a5;
- (unint64_t)connectionIdentifier;
- (void)didReceiveConnectionIdentifier:(unint64_t)a3;
- (void)mediaServicesLost;
- (void)mediaServicesReset;
- (void)streamToken:(unint64_t)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
@end

@implementation REAudioPlaybackClientService

- (REAudioPlaybackClientService)initWithXPCEndpoint:(id)a3 queue:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)REAudioPlaybackClientService;
  v11 = [(REAudioPlaybackClientService *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_service, a5);
    id v13 = objc_alloc_init(MEMORY[0x263F08D98]);
    [v13 _setEndpoint:v8];
    uint64_t v14 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v13];
    connection = v12->_connection;
    v12->_connection = (NSXPCConnection *)v14;

    [(NSXPCConnection *)v12->_connection setExportedObject:v12];
    v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E752B80];
    [(NSXPCConnection *)v12->_connection setExportedInterface:v16];

    v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E752880];
    [(NSXPCConnection *)v12->_connection setRemoteObjectInterface:v17];

    [(NSXPCConnection *)v12->_connection _setQueue:v9];
    objc_initWeak(&location, v12);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke;
    v22[3] = &unk_264BE3388;
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v12->_connection setInterruptionHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke_125;
    v20[3] = &unk_264BE3388;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v12->_connection setInvalidationHandler:v20];
    atomic_store(0, &v12->_connectionIdentifier.__a_.__a_value);
    [(NSXPCConnection *)v12->_connection resume];
    v18 = [(NSXPCConnection *)v12->_connection remoteObjectProxy];
    [v18 start];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v12;
}

void __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)*re::audioLogObjects((re *)WeakRetained);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    v5 = WeakRetained;
    __int16 v6 = 2048;
    uint64_t v7 = [WeakRetained connectionIdentifier];
    _os_log_impl(&dword_233120000, v2, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ connection %llu with service was interrupted", (uint8_t *)&v4, 0x16u);
  }

  if (WeakRetained && ([WeakRetained[3] isCancelled] & 1) == 0)
  {
    uint64_t v3 = [WeakRetained[3] audioService];
    (*(void (**)(uint64_t))(*(void *)v3 + 64))(v3);
  }
}

void __66__REAudioPlaybackClientService_initWithXPCEndpoint_queue_service___block_invoke_125(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)*re::audioLogObjects((re *)WeakRetained);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    v5 = WeakRetained;
    __int16 v6 = 2048;
    uint64_t v7 = [WeakRetained connectionIdentifier];
    _os_log_impl(&dword_233120000, v2, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ connection %llu with service was invalidated", (uint8_t *)&v4, 0x16u);
  }

  if (WeakRetained && ([WeakRetained[3] isCancelled] & 1) == 0)
  {
    uint64_t v3 = [WeakRetained[3] audioService];
    (*(void (**)(uint64_t))(*(void *)v3 + 64))(v3);
  }
}

- (void)didReceiveConnectionIdentifier:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (atomic_load(&self->_connectionIdentifier.__a_.__a_value))
  {
    __int16 v6 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
      int v10 = 138412802;
      v11 = self;
      __int16 v12 = 2048;
      unint64_t v13 = v7;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_error_impl(&dword_233120000, v6, OS_LOG_TYPE_ERROR, "AudioPlaybackClientService %@ cannot change connection identifier from %llu to %llu", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    atomic_store(a3, &self->_connectionIdentifier.__a_.__a_value);
    uint64_t v8 = *re::audioLogObjects((re *)self);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_233120000, v8, OS_LOG_TYPE_DEFAULT, "AudioPlaybackClientService %@ received connection identifier %llu", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)streamToken:(unint64_t)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (![(_REAudioManagerCancellable *)self->_service isCancelled])
  {
    __int16 v6 = *(void (**)(void))(*(void *)[(_REAudioManagerCancellable *)self->_service audioService] + 688);
    v6();
  }
}

- (void)mediaServicesLost
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = (re *)[(_REAudioManagerCancellable *)self->_service isCancelled];
  if ((v3 & 1) == 0)
  {
    int v4 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      unint64_t v7 = self;
      _os_log_impl(&dword_233120000, v4, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackClientService %@ received media services lost notification from host.", (uint8_t *)&v6, 0xCu);
    }
    v5 = [(_REAudioManagerCancellable *)self->_service audioService];
    (*((void (**)(AudioService *))v5->var0 + 9))(v5);
  }
}

- (void)mediaServicesReset
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = (re *)[(_REAudioManagerCancellable *)self->_service isCancelled];
  if ((v3 & 1) == 0)
  {
    int v4 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      unint64_t v7 = self;
      _os_log_impl(&dword_233120000, v4, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackClientService %@ received media services reset notification from host.", (uint8_t *)&v6, 0xCu);
    }
    v5 = [(_REAudioManagerCancellable *)self->_service audioService];
    (*((void (**)(AudioService *))v5->var0 + 10))(v5);
  }
}

- (unint64_t)connectionIdentifier
{
  return atomic_load(&self->_connectionIdentifier.__a_.__a_value);
}

- (BOOL)connected
{
  unint64_t v2 = atomic_load(&self->_connectionIdentifier.__a_.__a_value);
  return v2 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end