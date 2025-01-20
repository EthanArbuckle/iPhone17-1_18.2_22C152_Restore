@interface LiveFSClient
+ (id)interfaceForListeners;
+ (id)newConnectionForService:(id)a3;
+ (id)supportDirURL:(unint64_t)a3 forURL:(id)a4 daemonPrefName:(id)a5 error:(id *)a6;
- (id)forgetVolume:(id)a3 withFlags:(unsigned int)a4;
- (id)initConnectionForService:(id)a3;
- (id)listenerForVolume:(id)a3 error:(id *)a4;
- (id)terminateDevice:(id)a3;
- (id)volumes:(id *)a3;
- (void)dealloc;
- (void)listenerForVolume:(id)a3 completionHandler:(id)a4;
- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation LiveFSClient

- (id)initConnectionForService:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LiveFSClient;
  v5 = [(LiveFSClient *)&v10 init];
  if (v5
    && (connectionForServiceURL(v4, 1),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        conn = v5->conn,
        v5->conn = (NSXPCConnection *)v6,
        conn,
        !v5->conn))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dealloc
{
  conn = self->conn;
  if (conn)
  {
    [(NSXPCConnection *)conn invalidate];
    id v4 = self->conn;
    self->conn = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)LiveFSClient;
  [(LiveFSClient *)&v5 dealloc];
}

+ (id)newConnectionForService:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initConnectionForService:v4];

  return v5;
}

- (id)volumes:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  conn = self->conn;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __24__LiveFSClient_volumes___block_invoke;
  v9[3] = &unk_264DC7548;
  v9[4] = &v10;
  objc_super v5 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __24__LiveFSClient_volumes___block_invoke_2;
  v8[3] = &unk_264DC7638;
  v8[4] = &v16;
  [v5 listVolumes:v8];
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __24__LiveFSClient_volumes___block_invoke(uint64_t a1, void *a2)
{
}

void __24__LiveFSClient_volumes___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)listenerForVolume:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke;
  aBlock[3] = &unk_264DC76B0;
  id v21 = &v29;
  id v8 = v6;
  id v19 = v8;
  v22 = &v23;
  id v9 = v7;
  id v20 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v11 = (void *)v24[5];
  v24[5] = (uint64_t)v10;

  conn = self->conn;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2_11;
  v16[3] = &unk_264DC75C0;
  id v13 = v9;
  id v17 = v13;
  uint64_t v14 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v16];
  id v15 = (void *)v30[5];
  v30[5] = v14;

  (*(void (**)(void))(v24[5] + 16))();
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

void __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2;
  v5[3] = &unk_264DC7688;
  int v9 = a2;
  uint64_t v8 = *(void *)(a1 + 56);
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [v3 listenerForVolume:v6 reply:v5];
}

void __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  int v8 = *(_DWORD *)(a1 + 56);
  if (v6)
  {
    int v9 = [v6 domain];
    BOOL v10 = v9 == (void *)*MEMORY[0x263F08438] && [v7 code] == 35;
  }
  else
  {
    BOOL v10 = 0;
  }
  v11 = livefs_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v5;
    __int16 v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_23AB0B000, v11, OS_LOG_TYPE_DEFAULT, "ListenerForVolume looper got listener %@ e %@", buf, 0x16u);
  }

  if (v8 < 9 && v10)
  {
    int v13 = v8 + 1;
    dispatch_time_t v14 = dispatch_time(0, 50000000);
    id v15 = dispatch_get_global_queue(2, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_6;
    v23[3] = &unk_264DC7660;
    v23[4] = *(void *)(a1 + 48);
    int v24 = v13;
    dispatch_after(v14, v15, v23);
  }
  else
  {
    if (v10)
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F07F70];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v25 = *MEMORY[0x263F08068];
      uint64_t v26 = v18;
      id v19 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v20 = [v16 errorWithDomain:v17 code:0x7FFFFFFFFFFFFFFFLL userInfo:v19];

      id v7 = (void *)v20;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = 0;
}

uint64_t __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(unsigned int *)(a1 + 40));
}

uint64_t __52__LiveFSClient_listenerForVolume_completionHandler___block_invoke_2_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)listenerForVolume:(id)a3 error:(id *)a4
{
  id v19 = a4;
  v36[1] = *MEMORY[0x263EF8340];
  id v20 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  conn = self->conn;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __40__LiveFSClient_listenerForVolume_error___block_invoke;
  v22[3] = &unk_264DC76D8;
  v22[4] = &v29;
  v22[5] = &v23;
  id v6 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v22];
  unsigned int v7 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = (void *)*MEMORY[0x263F08438];
  while (1)
  {
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __40__LiveFSClient_listenerForVolume_error___block_invoke_2;
    v21[3] = &unk_264DC7700;
    v21[4] = &v29;
    v21[5] = &v23;
    objc_msgSend(v6, "listenerForVolume:reply:", v20, v21, v19);
    BOOL v10 = (void *)v24[5];
    if (!v10) {
      break;
    }
    v11 = [v10 domain];
    if (v11 != v9) {
      goto LABEL_11;
    }
    uint64_t v12 = [(id)v24[5] code];

    if (v7 >= 9 || v12 != 35)
    {
      if (v12 != 35) {
        break;
      }
      dispatch_time_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08068];
      v36[0] = v20;
      v11 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
      uint64_t v15 = [v14 errorWithDomain:*MEMORY[0x263F07F70] code:0x7FFFFFFFFFFFFFFFLL userInfo:v11];
      uint64_t v16 = (void *)v24[5];
      v24[5] = v15;

LABEL_11:
      break;
    }
    ++v7;
    [MEMORY[0x263F08B88] sleepForTimeInterval:0.0500000007];
  }
  if (v19) {
    *id v19 = (id) v24[5];
  }
  id v17 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v17;
}

void __40__LiveFSClient_listenerForVolume_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __40__LiveFSClient_listenerForVolume_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (id)interfaceForListeners
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EE24B38];
}

- (id)forgetVolume:(id)a3 withFlags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v13 = 0;
  dispatch_time_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  conn = self->conn;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__LiveFSClient_forgetVolume_withFlags___block_invoke;
  v12[3] = &unk_264DC7548;
  v12[4] = &v13;
  uint64_t v8 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__LiveFSClient_forgetVolume_withFlags___block_invoke_2;
  v11[3] = &unk_264DC7548;
  v11[4] = &v13;
  [v8 ejectVolume:v6 usingFlags:v4 reply:v11];
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __39__LiveFSClient_forgetVolume_withFlags___block_invoke(uint64_t a1, void *a2)
{
}

void __39__LiveFSClient_forgetVolume_withFlags___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)terminateDevice:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_time_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  conn = self->conn;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32__LiveFSClient_terminateDevice___block_invoke;
  v10[3] = &unk_264DC7548;
  v10[4] = &v11;
  id v6 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__LiveFSClient_terminateDevice___block_invoke_2;
  v9[3] = &unk_264DC7548;
  v9[4] = &v11;
  [v6 ejectDisk:v4 usingFlags:1 reply:v9];
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __32__LiveFSClient_terminateDevice___block_invoke(uint64_t a1, void *a2)
{
}

void __32__LiveFSClient_terminateDevice___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  conn = self->conn;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke;
  v19[3] = &unk_264DC75C0;
  id v12 = v10;
  id v20 = v12;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke_2;
  v17[3] = &unk_264DC75C0;
  id v18 = v12;
  id v16 = v12;
  [v15 unlockVolume:v14 password:v13 saveToKeychain:v6 completionHandler:v17];
}

uint64_t __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__LiveFSClient_unlockVolume_password_saveToKeychain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)supportDirURL:(unint64_t)a3 forURL:(id)a4 daemonPrefName:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = (void *)MEMORY[0x263F08850];
  id v11 = a4;
  id v12 = [v10 defaultManager];
  char v25 = 0;
  id v24 = 0;
  id v13 = [v12 URLForDirectory:a3 inDomain:1 appropriateForURL:v11 create:1 error:&v24];

  id v14 = v24;
  if (!v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:]();
    }
    id v16 = 0;
    if (a6) {
      goto LABEL_20;
    }
LABEL_10:
    id v20 = 0;
    goto LABEL_21;
  }
  uint64_t v15 = [NSURL fileURLWithPath:v9 relativeToURL:v13];
  if (v15)
  {
    id v16 = v15;
    id v17 = [v15 path];
    int v18 = [v12 fileExistsAtPath:v17 isDirectory:&v25];

    if (v18)
    {
      if (!v25)
      {
        getNSErrorFromLiveFSErrno(20);
        id v19 = (id)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:]();
        }
        goto LABEL_19;
      }
LABEL_16:
      id v16 = v16;
      id v20 = v16;
      goto LABEL_21;
    }
    id v23 = v14;
    int v21 = [v12 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v23];
    id v19 = v23;

    if (v21)
    {
      id v14 = v19;
      goto LABEL_16;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:].cold.4();
    }
  }
  else
  {
    getNSErrorFromLiveFSErrno(12);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LiveFSClient supportDirURL:forURL:daemonPrefName:error:]();
    }
    id v16 = 0;
  }
LABEL_19:
  id v14 = v19;
  if (!a6) {
    goto LABEL_10;
  }
LABEL_20:
  id v14 = v14;
  id v20 = 0;
  *a6 = v14;
LABEL_21:

  return v20;
}

- (void).cxx_destruct
{
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error getting location %lu: %{public}@", v0, 0x16u);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error getting %lu/%{public}@: %{public}@", v0, 0x20u);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%lu/%{public}@ exists but is not a directory", v0, 0x16u);
}

+ (void)supportDirURL:forURL:daemonPrefName:error:.cold.4()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error creating %lu/%{public}@: %{public}@", v0, 0x20u);
}

@end