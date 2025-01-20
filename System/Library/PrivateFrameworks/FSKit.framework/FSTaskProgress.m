@interface FSTaskProgress
+ (void)constructFromListener:(id)a3 description:(id)a4 replyHandler:(id)a5;
- (FSTaskDescription)initialDescription;
- (FSTaskProgress)initWithProgress:(id)a3 description:(id)a4;
- (NSProgress)progress;
- (NSXPCConnection)ourConn;
- (void)dealloc;
- (void)setOurConn:(id)a3;
@end

@implementation FSTaskProgress

- (FSTaskProgress)initWithProgress:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FSTaskProgress;
  v9 = [(FSTaskProgress *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_initialDescription, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_ourConn invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FSTaskProgress;
  [(FSTaskProgress *)&v3 dealloc];
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (FSTaskDescription)initialDescription
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 16, 1);
}

- (NSXPCConnection)ourConn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOurConn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConn, 0);
  objc_storeStrong((id *)&self->_initialDescription, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

+ (void)constructFromListener:(id)a3 description:(id)a4 replyHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v8];
  objc_super v12 = +[FSKitConstants FSTaskProgressXPCProtocol];
  [v11 setRemoteObjectInterface:v12];

  [v11 resume];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke;
  v23[3] = &unk_26530B4D0;
  v25 = &v27;
  id v26 = a1;
  id v13 = v10;
  id v24 = v13;
  v14 = [v11 remoteObjectProxyWithErrorHandler:v23];
  v15 = [v14 getProgress:&__block_literal_global_3];
  [v15 setCancellationHandler:&__block_literal_global_30];
  [v15 setPausingHandler:&__block_literal_global_32];
  v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v15 completedUnitCount];
    int v18 = [v15 totalUnitCount];
    int v19 = [v15 isFinished];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v32 = v17;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v18;
    __int16 v33 = 1024;
    int v34 = v19;
    _os_log_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEFAULT, "Progress from getProgress %u units of %u, isFinished %d", buf, 0x14u);
  }

  v20 = [[FSTaskProgress alloc] initWithProgress:v15 description:v9];
  [(FSTaskProgress *)v20 setOurConn:v11];
  id v21 = a1;
  objc_sync_enter(v21);
  if (!*((_DWORD *)v28 + 6))
  {
    (*((void (**)(id, FSTaskProgress *, void))v13 + 2))(v13, v20, 0);
    v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v32 = v20;
      _os_log_impl(&dword_24DDB2000, v22, OS_LOG_TYPE_DEFAULT, "normnal blockReply just did fire, passed rv %@", buf, 0xCu);
    }

    *((_DWORD *)v28 + 6) = 1;
  }
  objc_sync_exit(v21);

  _Block_object_dispose(&v27, 8);
}

void __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_24DDB2000, v4, OS_LOG_TYPE_DEFAULT, "remote proxy object error %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = *(id *)(a1 + 48);
  objc_sync_enter(v5);
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_24DDB2000, v6, OS_LOG_TYPE_DEFAULT, "remote proxy blockReply about to fire", (uint8_t *)&v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  objc_sync_exit(v5);
}

void __74__FSTaskProgress_Project__constructFromListener_description_replyHandler___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = fskit_std_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "getProgress returned error %@";
      v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_24DDB2000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "getProgress returned success";
    v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

@end