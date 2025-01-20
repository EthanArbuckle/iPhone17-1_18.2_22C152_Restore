@interface REAudioPlaybackHostingService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_xpc_object)endpoint;
- (REAudioPlaybackHostingService)init;
- (id)didConnectBlock;
- (id)didDisconnectBlock;
- (unint64_t)clientCount;
- (void)connectionIdentifier:(unint64_t)a3 streamToken:(unint64_t)a4 didChangeFromState:(unint64_t)a5 toState:(unint64_t)a6;
- (void)connectionIdentifierLostMediaServices:(unint64_t)a3;
- (void)connectionIdentifierResetMediaServices:(unint64_t)a3;
- (void)setDidConnectBlock:(id)a3;
- (void)setDidDisconnectBlock:(id)a3;
@end

@implementation REAudioPlaybackHostingService

- (REAudioPlaybackHostingService)init
{
  v11.receiver = self;
  v11.super_class = (Class)REAudioPlaybackHostingService;
  v2 = [(REAudioPlaybackHostingService *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D88] anonymousListener];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AudioPlaybackHosting service queue", v5);
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clients = v2->_clients;
    v2->_clients = v8;

    v2->_connectionIdentifierCounter = 0;
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (OS_xpc_object)endpoint
{
  v2 = [(NSXPCListener *)self->_listener endpoint];
  uint64_t v3 = [v2 _endpoint];

  return (OS_xpc_object *)v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_queue_t v6 = (re *)[v5 processIdentifier];
  int v7 = (int)v6;
  unint64_t v8 = self->_connectionIdentifierCounter + 1;
  self->_unint64_t connectionIdentifierCounter = v8;
  unint64_t connectionIdentifierCounter = v8;
  v10 = (void *)v8;
  while (!v10)
  {
LABEL_5:
    v10 = (void *)connectionIdentifierCounter++;
    self->_unint64_t connectionIdentifierCounter = connectionIdentifierCounter;
    if (v10 == (void *)v8)
    {
      v14 = *re::audioLogObjects(v6);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, "Playback hosting service cannot generate a unique connection identifier. Rejecting connection", buf, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_17;
    }
  }
  clients = self->_clients;
  v12 = [NSNumber numberWithUnsignedLongLong:v10];
  v13 = [(NSMutableDictionary *)clients objectForKey:v12];

  if (v13)
  {
    unint64_t connectionIdentifierCounter = self->_connectionIdentifierCounter;
    goto LABEL_5;
  }
  v16 = [v5 valueForEntitlement:@"application-identifier"];
  v17 = *re::audioLogObjects(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v39 = v7;
    *(_WORD *)&v39[4] = 2048;
    *(void *)&v39[6] = v10;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_233120000, v17, OS_LOG_TYPE_DEFAULT, "Accepting new playback hosting connection from client pid %d, assigning connection identifier %llu, application identifier %@", buf, 0x1Cu);
  }
  v18 = [[REAudioPlaybackHostingClientObject alloc] initWithConnection:v5 connectionIdentifier:v10];
  v19 = [v5 valueForEntitlement:@"com.apple.re.should-redact-sensitive-info-from-logs"];
  [(REAudioPlaybackHostingClientObject *)v18 setShouldRedactSensitiveInfoFromLogs:v19 != 0];

  v20 = (re *)[(REAudioPlaybackHostingClientObject *)v18 shouldRedactSensitiveInfoFromLogs];
  if (v20)
  {
    v21 = *re::audioLogObjects(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v39 = v10;
      _os_log_impl(&dword_233120000, v21, OS_LOG_TYPE_DEFAULT, "Setting shouldRedactSensitiveInfoFromLogs for client=%llu to true.", buf, 0xCu);
    }
  }
  v22 = [(REAudioPlaybackHostingService *)self didConnectBlock];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v24 = [(REAudioPlaybackHostingService *)self didConnectBlock];
    ((void (**)(void, void *, BOOL))v24)[2](v24, v10, [(REAudioPlaybackHostingClientObject *)v18 shouldRedactSensitiveInfoFromLogs]);
  }
  [v5 setExportedObject:v18];
  v25 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E752880];
  [v5 setExportedInterface:v25];

  v26 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E752B80];
  [v5 setRemoteObjectInterface:v26];

  [v5 _setQueue:self->_serviceQueue];
  objc_initWeak((id *)buf, self);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke;
  v36[3] = &unk_264BE3310;
  objc_copyWeak(v37, (id *)buf);
  v37[1] = v10;
  [v5 setInterruptionHandler:v36];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_84;
  v34[3] = &unk_264BE3310;
  objc_copyWeak(v35, (id *)buf);
  v35[1] = v10;
  [v5 setInvalidationHandler:v34];
  serviceQueue = self->_serviceQueue;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_85;
  v30[3] = &unk_264BE3338;
  v30[4] = self;
  v31 = v18;
  v33 = v10;
  id v32 = v5;
  v28 = v18;
  dispatch_sync(serviceQueue, v30);

  objc_destroyWeak(v35);
  objc_destroyWeak(v37);
  objc_destroyWeak((id *)buf);

  BOOL v15 = 1;
LABEL_17:

  return v15;
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 138412546;
      v12 = v3;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl(&dword_233120000, v4, OS_LOG_TYPE_DEFAULT, "REAudioPlaybackHostingService %@ removing interrupted connection %llu", (uint8_t *)&v11, 0x16u);
    }
    dispatch_queue_t v6 = [(re *)v3 didDisconnectBlock];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      unint64_t v8 = [(re *)v3 didDisconnectBlock];
      v8[2](v8, *(void *)(a1 + 40));
    }
    v9 = (void *)*((void *)v3 + 2);
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v9 removeObjectForKey:v10];
  }
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_84(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 138412546;
      v12 = v3;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl(&dword_233120000, v4, OS_LOG_TYPE_DEFAULT, "REAudioPlaybackHostingService %@ removing invalidated connection %llu", (uint8_t *)&v11, 0x16u);
    }
    dispatch_queue_t v6 = [(re *)v3 didDisconnectBlock];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      unint64_t v8 = [(re *)v3 didDisconnectBlock];
      v8[2](v8, *(void *)(a1 + 40));
    }
    v9 = (void *)*((void *)v3 + 2);
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v9 removeObjectForKey:v10];
  }
}

void __68__REAudioPlaybackHostingService_listener_shouldAcceptNewConnection___block_invoke_85(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  objc_msgSend(v3, "setObject:forKey:", v2);

  [*(id *)(a1 + 48) resume];
  id v5 = [*(id *)(a1 + 48) remoteObjectProxy];
  [v5 didReceiveConnectionIdentifier:*(void *)(a1 + 56)];
}

- (void)connectionIdentifier:(unint64_t)a3 streamToken:(unint64_t)a4 didChangeFromState:(unint64_t)a5 toState:(unint64_t)a6
{
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__REAudioPlaybackHostingService_connectionIdentifier_streamToken_didChangeFromState_toState___block_invoke;
  block[3] = &unk_264BE3360;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_sync(serviceQueue, block);
}

void __93__REAudioPlaybackHostingService_connectionIdentifier_streamToken_didChangeFromState_toState___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        dispatch_queue_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "unsignedLongLongValue", (void)v10) == a1[5])
        {
          BOOL v7 = [*(id *)(a1[4] + 16) objectForKey:v6];
          unint64_t v8 = [v7 connection];
          v9 = [v8 remoteObjectProxy];
          [v9 streamToken:a1[6] didChangeFromState:a1[7] toState:a1[8]];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)connectionIdentifierLostMediaServices:(unint64_t)a3
{
  serviceQueue = self->_serviceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__REAudioPlaybackHostingService_connectionIdentifierLostMediaServices___block_invoke;
  v4[3] = &unk_264BE2C48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serviceQueue, v4);
}

void __71__REAudioPlaybackHostingService_connectionIdentifierLostMediaServices___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v17;
    *(void *)&long long v4 = 138412546;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v8 = (re *)objc_msgSend(v7, "unsignedLongLongValue", v15, (void)v16);
        if (v8 == *(re **)(a1 + 40))
        {
          v9 = *re::audioLogObjects(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            uint64_t v11 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v15;
            uint64_t v21 = v10;
            __int16 v22 = 2048;
            uint64_t v23 = v11;
            _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackHostingService %@ notifying connection %llu that media services lost.", buf, 0x16u);
          }
          long long v12 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7];
          long long v13 = [v12 connection];
          uint64_t v14 = [v13 remoteObjectProxy];
          [v14 mediaServicesLost];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v3);
  }
}

- (void)connectionIdentifierResetMediaServices:(unint64_t)a3
{
  serviceQueue = self->_serviceQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__REAudioPlaybackHostingService_connectionIdentifierResetMediaServices___block_invoke;
  v4[3] = &unk_264BE2C48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serviceQueue, v4);
}

void __72__REAudioPlaybackHostingService_connectionIdentifierResetMediaServices___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v17;
    *(void *)&long long v4 = 138412546;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v8 = (re *)objc_msgSend(v7, "unsignedLongLongValue", v15, (void)v16);
        if (v8 == *(re **)(a1 + 40))
        {
          v9 = *re::audioLogObjects(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            uint64_t v11 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v15;
            uint64_t v21 = v10;
            __int16 v22 = 2048;
            uint64_t v23 = v11;
            _os_log_impl(&dword_233120000, v9, OS_LOG_TYPE_DEFAULT, "[RE/MediaServices] AudioPlaybackHostingService %@ notifying connection %llu that media services reset.", buf, 0x16u);
          }
          long long v12 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7];
          long long v13 = [v12 connection];
          uint64_t v14 = [v13 remoteObjectProxy];
          [v14 mediaServicesReset];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v3);
  }
}

- (unint64_t)clientCount
{
  return [(NSMutableDictionary *)self->_clients count];
}

- (id)didConnectBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidConnectBlock:(id)a3
{
}

- (id)didDisconnectBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDidDisconnectBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didDisconnectBlock, 0);
  objc_storeStrong(&self->_didConnectBlock, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end