@interface AXLTClient
- (AXLTClient)init;
- (BOOL)startTranscribing:(int64_t)a3 client:(id)a4 callbackBlock:(id)a5 error:(id *)a6;
- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 callbackBlock:(id)a6 error:(id *)a7;
- (BOOL)stopTranscribing:(int64_t)a3 client:(id)a4 error:(id *)a5;
- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 error:(id *)a6;
- (NSMutableDictionary)dataReceivers;
- (NSXPCConnection)serviceConnection;
- (OS_dispatch_queue)clientQueue;
- (void)initializeServiceConnection;
- (void)pingServiceWithHandler:(id)a3;
- (void)registerForTranscriptionIfNecessary;
- (void)setClientQueue:(id)a3;
- (void)setDataReceivers:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)transcribedData:(id)a3;
@end

@implementation AXLTClient

- (AXLTClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXLTClient;
  v2 = [(AXLTClient *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(AXLTClient *)v2 initializeServiceConnection];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accessibility.liveTranscriptionClient.clientQueue", v4);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    dataReceivers = v3->_dataReceivers;
    v3->_dataReceivers = (NSMutableDictionary *)v7;
  }
  return v3;
}

- (void)initializeServiceConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.accessibility.LiveTranscriptionService"];
  [(AXLTClient *)self setServiceConnection:v3];

  v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFEAF18];
  dispatch_queue_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_startTranscriptionWithRequestType_clientPID_withReply_ argumentIndex:1 ofReply:1];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_stopTranscriptionWithRequestType_clientPID_withReply_ argumentIndex:1 ofReply:1];

  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_filterTranscriptionForApps_ argumentIndex:0 ofReply:0];

  objc_super v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v10 forSelector:sel_startTranscriptionWithRequestType_targetPID_clientPID_withReply_ argumentIndex:1 ofReply:1];

  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v11 forSelector:sel_stopTranscriptionWithRequestType_targetPID_clientPID_withReply_ argumentIndex:1 ofReply:1];

  v12 = [(AXLTClient *)self serviceConnection];
  [v12 setRemoteObjectInterface:v4];

  v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFE9458];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v14 forSelector:sel_transcribedData_ argumentIndex:0 ofReply:0];

  v15 = [(AXLTClient *)self serviceConnection];
  [v15 setExportedInterface:v13];

  v16 = [(AXLTClient *)self serviceConnection];
  [v16 setExportedObject:self];

  v17 = [(AXLTClient *)self serviceConnection];
  [v17 resume];

  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__AXLTClient_initializeServiceConnection__block_invoke;
  v20[3] = &unk_264E39B08;
  objc_copyWeak(&v21, &location);
  v18 = [(AXLTClient *)self serviceConnection];
  [v18 setInterruptionHandler:v20];

  v19 = [(AXLTClient *)self serviceConnection];
  [v19 setInvalidationHandler:&__block_literal_global_5];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __41__AXLTClient_initializeServiceConnection__block_invoke(uint64_t a1)
{
  v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23C242000, v2, OS_LOG_TYPE_INFO, "LiveTranscriptionService interrupted, re-initializing connection", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initializeServiceConnection];
  [WeakRetained registerForTranscriptionIfNecessary];
}

void __41__AXLTClient_initializeServiceConnection__block_invoke_302()
{
  v0 = AXLogLiveTranscription();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23C242000, v0, OS_LOG_TYPE_INFO, "LiveTranscriptionService invalidated", v1, 2u);
  }
}

- (void)registerForTranscriptionIfNecessary
{
  id v7 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_23C242000, a4, OS_LOG_TYPE_ERROR, "unable to register for transcription: %@", a1, 0xCu);
}

- (BOOL)startTranscribing:(int64_t)a3 client:(id)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return [(AXLTClient *)self startTranscribing:a3 targetPID:0xFFFFFFFFLL client:a4 callbackBlock:a5 error:a6];
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 callbackBlock:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  v48[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  v14 = AXLogLiveTranscription();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = [v12 UUIDString];
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v15;
    _os_log_impl(&dword_23C242000, v14, OS_LOG_TYPE_INFO, "startTranscribing request: %ld, targetPID: %d, client: %@", buf, 0x1Cu);
  }
  if (!v13)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263F07F80];
    v48[0] = @"callback handler is nil";
    v20 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a7 = [v19 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:1 userInfo:v20];

LABEL_10:
    BOOL v23 = 0;
    goto LABEL_17;
  }
  if (!v12)
  {
    id v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v45 = *MEMORY[0x263F07F80];
    v46 = @"client uuid is nil";
    v22 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a7 = [v21 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:3 userInfo:v22];

    goto LABEL_10;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  v16 = [(AXLTClient *)self serviceConnection];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke;
  v37[3] = &unk_264E39B30;
  v37[4] = buf;
  v37[5] = &v38;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v37];

  if (*((unsigned char *)v39 + 24))
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 1;
    uint64_t v18 = getpid();
    if (v9 == -1)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_316;
      v31[3] = &unk_264E39B58;
      v31[4] = buf;
      v31[5] = &v33;
      [v17 startTranscriptionWithRequestType:a3 clientPID:v18 withReply:v31];
    }
    else
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314;
      v32[3] = &unk_264E39B58;
      v32[4] = buf;
      v32[5] = &v33;
      [v17 startTranscriptionWithRequestType:a3 targetPID:v9 clientPID:v18 withReply:v32];
    }
    if (*((unsigned char *)v34 + 24))
    {
      v24 = [[AXLTTranscribedDataReceiver alloc] initWithRequestType:a3 targetPID:v9 handler:v13 audioInfoBlock:&__block_literal_global_321];
      v25 = [(AXLTClient *)self clientQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_2;
      block[3] = &unk_264E39BA0;
      block[4] = self;
      id v29 = v12;
      v30 = v24;
      v26 = v24;
      dispatch_sync(v25, block);
    }
    *a7 = *(id *)(*(void *)&buf[8] + 40);
    BOOL v23 = *((unsigned char *)v34 + 24) != 0;
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v23 = 0;
    *a7 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v38, 8);
LABEL_17:

  return v23;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_2(v6);
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_316(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_2(v6);
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) dataReceivers];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)stopTranscribing:(int64_t)a3 client:(id)a4 error:(id *)a5
{
  return [(AXLTClient *)self stopTranscribing:a3 targetPID:0xFFFFFFFFLL client:a4 error:a5];
}

- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  v38[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  v11 = AXLogLiveTranscription();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 UUIDString];
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v12;
    _os_log_impl(&dword_23C242000, v11, OS_LOG_TYPE_INFO, "stopTranscribing request: %ld, targetPID: %d, client: %@", buf, 0x1Cu);
  }
  if (v10)
  {
    id v13 = [(AXLTClient *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke;
    block[3] = &unk_264E398D8;
    block[4] = self;
    id v33 = v10;
    dispatch_sync(v13, block);

    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy_;
    uint64_t v35 = __Block_byref_object_dispose_;
    id v36 = 0;
    v14 = [(AXLTClient *)self serviceConnection];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_2;
    v27[3] = &unk_264E39B30;
    v27[4] = buf;
    v27[5] = &v28;
    v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v27];

    if (*((unsigned char *)v29 + 24))
    {
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 1;
      uint64_t v16 = getpid();
      if (v7 == -1)
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_323;
        v21[3] = &unk_264E39B58;
        v21[4] = buf;
        v21[5] = &v23;
        [v15 stopTranscriptionWithRequestType:a3 clientPID:v16 withReply:v21];
      }
      else
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322;
        v22[3] = &unk_264E39B58;
        v22[4] = buf;
        v22[5] = &v23;
        [v15 stopTranscriptionWithRequestType:a3 targetPID:v7 clientPID:v16 withReply:v22];
      }
      *a6 = *(id *)(*(void *)&buf[8] + 40);
      BOOL v19 = *((unsigned char *)v24 + 24) != 0;
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      BOOL v19 = 0;
      *a6 = *(id *)(*(void *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F07F80];
    v38[0] = @"client uuid is nil";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    *a6 = [v17 errorWithDomain:@"com.apple.accessibility.LiveTranscription" code:3 userInfo:v18];

    BOOL v19 = 0;
  }

  return v19;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataReceivers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_2(v6);
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_323(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v7 = AXLogLiveTranscription();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_2(v6);
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)pingServiceWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXLTClient *)self serviceConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__AXLTClient_pingServiceWithHandler___block_invoke;
  v12[3] = &unk_264E39BC8;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];

  uint64_t v8 = getpid();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__AXLTClient_pingServiceWithHandler___block_invoke_324;
  v10[3] = &unk_264E39BF0;
  id v11 = v6;
  id v9 = v6;
  [v7 pingFromClient:v8 withReply:v10];
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__AXLTClient_pingServiceWithHandler___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_324(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogLiveTranscription();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __37__AXLTClient_pingServiceWithHandler___block_invoke_324_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transcribedData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXLTClient *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__AXLTClient_transcribedData___block_invoke;
  v7[3] = &unk_264E398D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __30__AXLTClient_transcribedData___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = AXLogLiveTranscription();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__AXLTClient_transcribedData___block_invoke_cold_1(a1, v2);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "dataReceivers", 0);
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 requestType];
        if (v10 == [*(id *)(a1 + 32) requestType])
        {
          id v11 = [v9 callbackBlock];
          v11[2](v11, *(void *)(a1 + 32));
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (NSMutableDictionary)dataReceivers
{
  return self->_dataReceivers;
}

- (void)setDataReceivers:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataReceivers, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "unable to get service object: %@", v4, v5, v6, v7, v8);
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "registered to get transcription data", v2, v3, v4, v5, v6);
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_314_cold_2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "unable to start transcription: %@", v4, v5, v6, v7, v8);
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23C242000, v0, v1, "unregistered to get transcription data", v2, v3, v4, v5, v6);
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_322_cold_2(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "unable to stop transcription: %@", v4, v5, v6, v7, v8);
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_23C242000, v2, v3, "unable to get service object: %@", v4, v5, v6, v7, v8);
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_324_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23C242000, v0, OS_LOG_TYPE_DEBUG, "Response: %@", v1, 0xCu);
}

void __30__AXLTClient_transcribedData___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) transcribedText];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_23C242000, a2, OS_LOG_TYPE_DEBUG, "received data with text: %@", v4, 0xCu);
}

@end