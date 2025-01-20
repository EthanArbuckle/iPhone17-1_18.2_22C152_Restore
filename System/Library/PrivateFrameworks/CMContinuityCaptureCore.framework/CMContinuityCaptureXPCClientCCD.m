@interface CMContinuityCaptureXPCClientCCD
+ (id)sharedInstance;
- (CMContinuityCaptureXPCClientCCD)init;
- (id)_service;
- (void)connectToContinuityCaptureServerWithDelegate:(id)a3;
- (void)disconnectSession;
- (void)pauseSessionForEvent:(int64_t)a3;
- (void)prepareForPullConversation:(id)a3;
- (void)requestContinuityCaptureUIConfiguration:(id)a3;
- (void)resumeStreamingForEvent:(int64_t)a3;
- (void)serverXPCConnectionInterrupted;
- (void)sessionDidUpdateWithConfiguration:(id)a3;
- (void)skipPlacementStep;
- (void)tearDownShield;
@end

@implementation CMContinuityCaptureXPCClientCCD

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_21);
  }
  v2 = (void *)_sharedClient;
  return v2;
}

uint64_t __49__CMContinuityCaptureXPCClientCCD_sharedInstance__block_invoke()
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  _sharedClient = objc_alloc_init(CMContinuityCaptureXPCClientCCD);
  return MEMORY[0x270F9A758]();
}

- (CMContinuityCaptureXPCClientCCD)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CMContinuityCaptureXPCClientCCD;
  v2 = [(CMContinuityCaptureXPCClientCCD *)&v8 init];
  if (v2)
  {
    if (dword_268850FA8)
    {
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v15 = v4;
      long long v16 = v4;
      long long v14 = v4;
      long long v12 = v4;
      long long v13 = v4;
      long long v10 = v4;
      long long v11 = v4;
      long long v9 = v4;
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.continuitycapture.remoteuiclient.connection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)sessionDidUpdateWithConfiguration:(id)a3
{
  id v4 = a3;
  if (dword_268850FA8)
  {
    dispatch_queue_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained sessionDidUpdateWithConfiguration:v4];
  }
}

- (void)tearDownShield
{
  if (dword_268850FA8)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  dispatch_queue_t v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained tearDownShield];
  }
}

- (void)serverXPCConnectionInterrupted
{
  if (dword_268850FA8)
  {
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  dispatch_queue_t v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained serverXPCConnectionInterrupted];
  }
}

- (void)requestContinuityCaptureUIConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v5 requestContinuityCaptureUIConfiguration:v4];
}

- (void)resumeStreamingForEvent:(int64_t)a3
{
  id v4 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v4 resumeStreamingForEvent:a3];
}

- (void)pauseSessionForEvent:(int64_t)a3
{
  id v4 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v4 pauseSessionForEvent:a3];
}

- (void)disconnectSession
{
  id v2 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v2 disconnectSession];
}

- (void)skipPlacementStep
{
  id v2 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v2 skipPlacementStep];
}

- (void)prepareForPullConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CMContinuityCaptureXPCClientCCD *)self _service];
  [v5 prepareForPullConversation:v4];
}

- (void)connectToContinuityCaptureServerWithDelegate:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  objc_storeWeak((id *)&self->_delegate, v4);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_connectionQueue);
  connectionQueue = self->_connectionQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke;
  v9[3] = &unk_264C99198;
  objc_copyWeak(&v11, &location);
  v9[4] = self;
  dispatch_semaphore_t v10 = v5;
  v7 = v5;
  dispatch_async(connectionQueue, v9);
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.continuitycaptured" options:4096];
    dispatch_semaphore_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E975578];
    [v4 setRemoteObjectInterface:v5];

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E973DB0];
    [v4 setExportedInterface:v6];

    [v4 setExportedObject:*(void *)(a1 + 32)];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v4);
    [v4 setInvalidationHandler:&__block_literal_global_72];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_3;
    v13[3] = &unk_264C990F8;
    objc_copyWeak(&v14, v2);
    [v4 setInterruptionHandler:v13];
    [WeakRetained[1] invalidate];
    objc_storeStrong(WeakRetained + 1, v4);
    [WeakRetained[1] resume];
    v7 = [WeakRetained _service];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_5;
    v10[3] = &unk_264C9AA80;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 40);
    [v7 requestContinuityCaptureUIConfiguration:v10];

    if (dword_268850FA8)
    {
      dispatch_time_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v9;
      long long v23 = v9;
      long long v20 = v9;
      long long v21 = v9;
      long long v18 = v9;
      long long v19 = v9;
      long long v16 = v9;
      long long v17 = v9;
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained serverXPCConnectionInterrupted];
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    dispatch_semaphore_t v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_4;
    block[3] = &unk_264C990F8;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
  }
}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 3);
    [v3 connectToContinuityCaptureServerWithDelegate:v2];

    id WeakRetained = v3;
  }
}

void __80__CMContinuityCaptureXPCClientCCD_connectToContinuityCaptureServerWithDelegate___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (dword_268850FA8)
    {
      dispatch_semaphore_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v15 = v6;
      long long v16 = v6;
      long long v13 = v6;
      long long v14 = v6;
      long long v11 = v6;
      long long v12 = v6;
      long long v9 = v6;
      long long v10 = v6;
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(WeakRetained, "sessionDidUpdateWithConfiguration:", v3, v7, v8);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)_service
{
  connection = self->_connection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__CMContinuityCaptureXPCClientCCD__service__block_invoke;
  v5[3] = &unk_264C9A968;
  v5[4] = self;
  id v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];
  return v3;
}

void __43__CMContinuityCaptureXPCClientCCD__service__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (dword_268850FA8)
  {
    id v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end