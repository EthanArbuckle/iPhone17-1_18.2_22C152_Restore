@interface CMContinuityCaptureXPCServerCCD
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CMContinuityCaptureXPCServerCCD)init;
- (void)_enumerateConnectionsWithBlock:(id)a3;
- (void)disconnectSession;
- (void)pauseSessionForEvent:(int64_t)a3;
- (void)prepareForPullConversation:(id)a3;
- (void)requestContinuityCaptureUIConfiguration:(id)a3;
- (void)resumeStreamingForEvent:(int64_t)a3;
- (void)skipPlacementStep;
- (void)startListeningWithDelegate:(id)a3;
- (void)tearDownShieldUI;
- (void)updateClientsWithConfiguration:(id)a3;
@end

@implementation CMContinuityCaptureXPCServerCCD

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_13);
  }
  v2 = (void *)_sharedListener;
  return v2;
}

uint64_t __49__CMContinuityCaptureXPCServerCCD_sharedInstance__block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  _sharedListener = objc_alloc_init(CMContinuityCaptureXPCServerCCD);
  return MEMORY[0x270F9A758]();
}

- (CMContinuityCaptureXPCServerCCD)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureXPCServerCCD;
  v2 = [(CMContinuityCaptureXPCServerCCD *)&v10 init];
  if (v2)
  {
    if (dword_268850F68)
    {
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v17 = v4;
      long long v18 = v4;
      long long v16 = v4;
      long long v14 = v4;
      long long v15 = v4;
      long long v12 = v4;
      long long v13 = v4;
      long long v11 = v4;
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(@"com.apple.continuitycapture.listener.xpcconnection", "UTF8String", v8, v9);
    uint64_t v5 = FigDispatchQueueCreateWithPriority();
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)startListeningWithDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (dword_268850F68)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v6;
    long long v21 = v6;
    long long v18 = v6;
    long long v19 = v6;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_delegate, v4);
  if (!self->_connections)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connections = self->_connections;
    self->_connections = v7;

    self->_connectionsLock._os_unfair_lock_opaque = 0;
  }
  serviceListener = self->_serviceListener;
  if (!serviceListener)
  {
    objc_super v10 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.continuitycaptured"];
    long long v11 = self->_serviceListener;
    self->_serviceListener = v10;

    [(NSXPCListener *)self->_serviceListener setDelegate:self];
    serviceListener = self->_serviceListener;
  }
  [(NSXPCListener *)serviceListener resume];
}

- (void)tearDownShieldUI
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (dword_268850F68)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = v4;
    long long v14 = v4;
    long long v11 = v4;
    long long v12 = v4;
    long long v9 = v4;
    long long v10 = v4;
    long long v7 = v4;
    long long v8 = v4;
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[CMContinuityCaptureXPCServerCCD _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", &__block_literal_global_17, v5, v6);
}

void __51__CMContinuityCaptureXPCServerCCD_tearDownShieldUI__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteObjectProxy];
  [v2 tearDownShield];
}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  id v4 = a3;
  if (dword_268850F68)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestContinuityCaptureUIConfiguration:v4];
}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  if (dword_268850F68)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained resumeStreamingForEvent:a3];
}

- (void)pauseSessionForEvent:(int64_t)a3
{
  if (dword_268850F68)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pauseSessionForEvent:a3];
}

- (void)updateClientsWithConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (dword_268850F68)
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v18 = v6;
    long long v19 = v6;
    long long v16 = v6;
    long long v17 = v6;
    long long v14 = v6;
    long long v15 = v6;
    long long v12 = v6;
    long long v13 = v6;
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__CMContinuityCaptureXPCServerCCD_updateClientsWithConfiguration___block_invoke;
  v8[3] = &unk_264C9A4B8;
  id v9 = v4;
  id v7 = v4;
  [(CMContinuityCaptureXPCServerCCD *)self _enumerateConnectionsWithBlock:v8];
}

void __66__CMContinuityCaptureXPCServerCCD_updateClientsWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 sessionDidUpdateWithConfiguration:*(void *)(a1 + 32)];
}

- (void)disconnectSession
{
  if (dword_268850F68)
  {
    id v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained disconnectSession];
}

- (void)skipPlacementStep
{
  if (dword_268850F68)
  {
    id v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained skipPlacementStep];
}

- (void)prepareForPullConversation:(id)a3
{
  id v4 = a3;
  if (dword_268850F68)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained prepareForPullConversation:v4];
}

- (void)_enumerateConnectionsWithBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  os_unfair_lock_lock(&self->_connectionsLock);
  uint64_t v5 = (void *)[(NSMutableArray *)self->_connections copy];
  os_unfair_lock_unlock(&self->_connectionsLock);
  if (dword_268850F68)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v26 = v7;
    long long v27 = v7;
    long long v24 = v7;
    long long v25 = v7;
    long long v22 = v7;
    long long v23 = v7;
    long long v20 = v7;
    long long v21 = v7;
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v10);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  long long v6 = (NSXPCListener *)a3;
  id v7 = a4;
  serviceListener = self->_serviceListener;
  if (serviceListener == v6)
  {
    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E975578];
    [v7 setExportedInterface:v9];

    [v7 setExportedObject:self];
    uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E973DB0];
    [v7 setRemoteObjectInterface:v10];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v7);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_264C9A4E0;
    objc_copyWeak(&v24, &location);
    objc_copyWeak(&v25, &from);
    uint64_t v11 = (void *)MEMORY[0x237DFB780](v23);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_2;
    v21[3] = &unk_264C9A508;
    id v12 = v11;
    id v22 = v12;
    [v7 setInvalidationHandler:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_3;
    v19[3] = &unk_264C9A508;
    id v13 = v12;
    id v20 = v13;
    [v7 setInterruptionHandler:v19];
    xpcConnectionQueue = self->_xpcConnectionQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_4;
    v16[3] = &unk_264C99120;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    dispatch_async(xpcConnectionQueue, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return serviceListener == v6;
}

void __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    [*((id *)WeakRetained + 1) removeObject:v2];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }
}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    [*(id *)&v3[2]._os_unfair_lock_opaque addObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3 + 4);
    [*(id *)(a1 + 32) _setQueue:*(void *)&v3[8]._os_unfair_lock_opaque];
    [*(id *)(a1 + 32) resume];
    if (dword_268850F68)
    {
      int v13 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      id v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v20 = v5;
      long long v21 = v5;
      long long v18 = v5;
      long long v19 = v5;
      long long v16 = v5;
      long long v17 = v5;
      long long v14 = v5;
      long long v15 = v5;
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (CMContinuityCaptureXPCConnectionHasEntitlement(*(void **)(a1 + 32), @"com.apple.continuitycapture.shieldUI"))
    {
      if (dword_268850F68)
      {
        int v13 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        long long v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v20 = v7;
        long long v21 = v7;
        long long v18 = v7;
        long long v19 = v7;
        long long v16 = v7;
        long long v17 = v7;
        long long v14 = v7;
        long long v15 = v7;
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v8 = objc_loadWeakRetained((id *)&v3[10]);
      [v8 shieldDidConnect];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_81;
    v11[3] = &unk_264C9A530;
    v11[4] = v3;
    -[os_unfair_lock_s requestContinuityCaptureUIConfiguration:](v3, "requestContinuityCaptureUIConfiguration:", v11, v9, v10);
  }
}

uint64_t __70__CMContinuityCaptureXPCServerCCD_listener_shouldAcceptNewConnection___block_invoke_81(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateClientsWithConfiguration:a2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end