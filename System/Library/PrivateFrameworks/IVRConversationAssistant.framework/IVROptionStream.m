@interface IVROptionStream
- (BOOL)getOptionStream:(id)a3 error:(id *)a4;
- (BOOL)initializeConnection;
- (BOOL)startOptionStream;
- (BOOL)stopOptionStream;
- (BOOL)userSelectedDTMFOption:(id)a3;
- (IVROptionStream)init;
- (NSXPCConnection)serviceConnection;
- (OS_dispatch_queue)clientQueue;
- (void)dealloc;
- (void)setClientQueue:(id)a3;
- (void)setServiceConnection:(id)a3;
@end

@implementation IVROptionStream

- (IVROptionStream)init
{
  v7.receiver = self;
  v7.super_class = (Class)IVROptionStream;
  v2 = [(IVROptionStream *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(IVROptionStream *)v2 initializeConnection];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ivrconversationassistant.clientQueue", 0);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(IVROptionStream *)self serviceConnection];

  if (v3)
  {
    dispatch_queue_t v4 = [(IVROptionStream *)self serviceConnection];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)IVROptionStream;
  [(IVROptionStream *)&v5 dealloc];
}

- (BOOL)initializeConnection
{
  v3 = IVRCADefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2529B4000, v3, OS_LOG_TYPE_INFO, "IVRConversationAssistant XPC connection setup begin", (uint8_t *)buf, 2u);
  }

  dispatch_queue_t v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.IVRConversationAssistantXPC"];
  [(IVROptionStream *)self setServiceConnection:v4];

  objc_super v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702DDA50];
  v6 = [(IVROptionStream *)self serviceConnection];
  [v6 setRemoteObjectInterface:v5];

  objc_super v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702DD6F0];
  v8 = [(IVROptionStream *)self serviceConnection];
  [v8 setExportedInterface:v7];

  v9 = [(IVROptionStream *)self serviceConnection];
  [v9 setExportedObject:self];

  v10 = [(IVROptionStream *)self serviceConnection];
  [v10 resume];

  objc_initWeak(buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__IVROptionStream_initializeConnection__block_invoke;
  v16[3] = &unk_265385808;
  objc_copyWeak(&v17, buf);
  v11 = [(IVROptionStream *)self serviceConnection];
  [v11 setInterruptionHandler:v16];

  v12 = [(IVROptionStream *)self serviceConnection];
  [v12 setInvalidationHandler:&__block_literal_global];

  v13 = IVRCADefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2529B4000, v13, OS_LOG_TYPE_INFO, "IVRConversationAssistant XPC connection setup done", v15, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  return 1;
}

void __39__IVROptionStream_initializeConnection__block_invoke(uint64_t a1)
{
  v2 = IVRCADefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__IVROptionStream_initializeConnection__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initializeConnection];
}

void __39__IVROptionStream_initializeConnection__block_invoke_15()
{
  v0 = IVRCADefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __39__IVROptionStream_initializeConnection__block_invoke_15_cold_1(v0);
  }
}

- (BOOL)startOptionStream
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = IVRCADefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2529B4000, v3, OS_LOG_TYPE_INFO, "startOptionStream request received", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  dispatch_queue_t v4 = [(IVROptionStream *)self serviceConnection];
  objc_super v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__IVROptionStream_startOptionStream__block_invoke;
  v10[3] = &unk_265385850;
  v10[4] = buf;
  [v5 startOptionStreamWithReply:v10];

  v6 = IVRCADefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = v12[24];
    *(_DWORD *)v15 = 67109120;
    int v16 = v7;
    _os_log_impl(&dword_2529B4000, v6, OS_LOG_TYPE_INFO, "startOptionStream request isSuccess=%{BOOL}d", v15, 8u);
  }

  uint8_t v8 = v12[24];
  _Block_object_dispose(buf, 8);
  return v8;
}

void __36__IVROptionStream_startOptionStream__block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_queue_t v4 = IVRCADefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_2529B4000, v4, OS_LOG_TYPE_INFO, "Starting option stream response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)getOptionStream:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = IVRCADefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2529B4000, v7, OS_LOG_TYPE_INFO, "getOptionStream request received", buf, 2u);
  }

  if (v6)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 1;
    *(void *)buf = 0;
    v27 = buf;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy_;
    v20[4] = __Block_byref_object_dispose_;
    id v21 = 0;
    uint8_t v8 = [(IVROptionStream *)self serviceConnection];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__IVROptionStream_getOptionStream_error___block_invoke;
    v19[3] = &unk_265385878;
    v19[4] = buf;
    v19[5] = &v32;
    v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v19];

    if (*((unsigned char *)v33 + 24))
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __41__IVROptionStream_getOptionStream_error___block_invoke_26;
      v18[3] = &unk_2653858A0;
      v18[4] = &v22;
      v18[5] = buf;
      v18[6] = v20;
      [v9 getOptionStreamWithReply:v18];
      if (*((unsigned char *)v23 + 24))
      {
        v10 = [(IVROptionStream *)self clientQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__IVROptionStream_getOptionStream_error___block_invoke_2;
        block[3] = &unk_2653858C8;
        uint64_t v17 = v20;
        id v16 = v6;
        dispatch_sync(v10, block);

        BOOL v11 = *((unsigned char *)v23 + 24) != 0;
      }
      else
      {
        *a4 = *((id *)v27 + 5);
        BOOL v11 = *((unsigned char *)v23 + 24) != 0;
      }
    }
    else
    {
      BOOL v11 = 0;
      *a4 = *((id *)v27 + 5);
    }

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F07F80];
    v37[0] = @"callback handler is nil";
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    *a4 = [v12 errorWithDomain:@"com.apple.ivrconversationassistant" code:1 userInfo:v13];

    BOOL v11 = 0;
  }

  return v11;
}

void __41__IVROptionStream_getOptionStream_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = IVRCADefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__IVROptionStream_getOptionStream_error___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __41__IVROptionStream_getOptionStream_error___block_invoke_26(void *a1, char a2, void *a3, id obj)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v6 = a3;
  uint8_t v8 = v6;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_2702DC8C8;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
}

void __41__IVROptionStream_getOptionStream_error___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(IVROptionStreamData);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = &stru_2702DC8C8;
  v6[0] = v3;
  dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(IVROptionStreamData *)v2 setOptionStreamData:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)stopOptionStream
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = IVRCADefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2529B4000, v3, OS_LOG_TYPE_INFO, "stopOptionStream request received", buf, 2u);
  }

  *(void *)buf = 0;
  v12 = buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  dispatch_queue_t v4 = [(IVROptionStream *)self serviceConnection];
  uint64_t v5 = [v4 remoteObjectProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__IVROptionStream_stopOptionStream__block_invoke;
  v10[3] = &unk_265385850;
  v10[4] = buf;
  [v5 stopOptionStreamWithReply:v10];

  id v6 = IVRCADefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = v12[24];
    *(_DWORD *)v15 = 67109120;
    int v16 = v7;
    _os_log_impl(&dword_2529B4000, v6, OS_LOG_TYPE_INFO, "startOptionStream request isSuccess=%{BOOL}d", v15, 8u);
  }

  uint8_t v8 = v12[24];
  _Block_object_dispose(buf, 8);
  return v8;
}

void __35__IVROptionStream_stopOptionStream__block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_queue_t v4 = IVRCADefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_2529B4000, v4, OS_LOG_TYPE_INFO, "Stopping option stream response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)userSelectedDTMFOption:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = IVRCADefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2529B4000, v5, OS_LOG_TYPE_INFO, "userSelectedDTMFOption invoked with: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v6 = [(IVROptionStream *)self serviceConnection];
  int v7 = [v6 remoteObjectProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__IVROptionStream_userSelectedDTMFOption___block_invoke;
  v9[3] = &unk_265385850;
  v9[4] = &buf;
  [v7 userSelectedDTMFOption:v4 withReply:v9];

  LOBYTE(v6) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return (char)v6;
}

void __42__IVROptionStream_userSelectedDTMFOption___block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = IVRCADefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_2529B4000, v4, OS_LOG_TYPE_INFO, "userSelectedDTMFOption invoked with response: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __39__IVROptionStream_initializeConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2529B4000, log, OS_LOG_TYPE_ERROR, "IVROptionStream connection interrupted", v1, 2u);
}

void __39__IVROptionStream_initializeConnection__block_invoke_15_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2529B4000, log, OS_LOG_TYPE_ERROR, "IVROptionStream connection invalidated", v1, 2u);
}

void __41__IVROptionStream_getOptionStream_error___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_2529B4000, a2, OS_LOG_TYPE_ERROR, "Unable to get service object: %@", (uint8_t *)&v4, 0xCu);
}

@end