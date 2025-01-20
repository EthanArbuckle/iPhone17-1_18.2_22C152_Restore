@interface FSClient
+ (id)installedExtensionsWithError:(id *)a3;
+ (void)fetchInstalledExtensionsWithCompletionHandler:(id)a3;
+ (void)initialize;
- (FSClient)init;
- (FSClientTaskUpdateHandler)fsClientTaskUpdateHandler;
- (NSXPCConnection)conn;
- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)cancelTask:(id)a3 replyHandler:(id)a4;
- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7;
- (void)currentContainers:(id)a3;
- (void)currentContainersSync:(id)a3;
- (void)currentResourceIDs:(id)a3;
- (void)currentResourceIDsSync:(id)a3;
- (void)currentTasks:(id)a3;
- (void)currentTasksSync:(id)a3;
- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6;
- (void)deactivateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6;
- (void)dealloc;
- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8;
- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7;
- (void)getFSProgressForTask:(id)a3 replyHandler:(id)a4;
- (void)handleInvalidated;
- (void)init;
- (void)installedExtensionWithShortName:(id)a3 synchronous:(BOOL)a4 replyHandler:(id)a5;
- (void)installedExtensions:(id)a3;
- (void)installedExtensionsForUser:(id *)a3 replyHandler:(id)a4;
- (void)installedExtensionsSync:(id)a3;
- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 synchronousReplyHandler:(id)a6;
- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6;
- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5;
- (void)probeResourceSync:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5;
- (void)setConn:(id)a3;
- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5;
- (void)setFsClientTaskUpdateHandler:(id)a3;
- (void)setTaskUpdateHandler:(id)a3 replyHandler:(id)a4;
- (void)setupHandlers;
- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7;
- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6;
- (void)validateVolumeName:(id)a3 usingBundle:(id)a4 volumeID:(id)a5 replyHandler:(id)a6;
@end

@implementation FSClient

+ (void)initialize
{
}

- (void)setupHandlers
{
  objc_initWeak(&location, self);
  conn = self->_conn;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__FSClient_setupHandlers__block_invoke;
  v7[3] = &unk_26530B130;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)conn setInterruptionHandler:v7];
  v4 = self->_conn;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__FSClient_setupHandlers__block_invoke_3;
  v5[3] = &unk_26530B130;
  objc_copyWeak(&v6, &location);
  [(NSXPCConnection *)v4 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __25__FSClient_setupHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__FSClient_setupHandlers__block_invoke_2;
    block[3] = &unk_26530B5D8;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __25__FSClient_setupHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

void __25__FSClient_setupHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__FSClient_setupHandlers__block_invoke_4;
    block[3] = &unk_26530B5D8;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __25__FSClient_setupHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

- (void)handleInvalidated
{
  v2 = self;
  objc_sync_enter(v2);
  fsClientTaskUpdateHandler = v2->_fsClientTaskUpdateHandler;
  if (fsClientTaskUpdateHandler)
  {
    id v6 = [(FSClientTaskUpdateHandler *)fsClientTaskUpdateHandler taskHandler];
    [(FSClientTaskUpdateHandler *)v2->_fsClientTaskUpdateHandler setTaskHandler:0];
  }
  else
  {
    id v6 = 0;
  }
  objc_sync_exit(v2);

  v4 = v6;
  if (v6)
  {
    v5 = fs_errorForPOSIXError(4);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v5);

    v4 = v6;
  }
}

- (FSClient)init
{
  uint64_t v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy__2;
  v21[3] = __Block_byref_object_dispose__2;
  id v22 = 0;
  v19.receiver = self;
  v19.super_class = (Class)FSClient;
  v2 = [(FSClient *)&v19 init];
  if (!v2)
  {
    v9 = 0;
LABEL_12:
    v2 = v2;

    v11 = v2;
    goto LABEL_13;
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.filesystems.fskitd" options:4096];
  conn = v2->_conn;
  v2->_conn = (NSXPCConnection *)v3;

  if (v2->_conn)
  {
    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2700064F0];
    [(NSXPCConnection *)v2->_conn setRemoteObjectInterface:v5];

    [(FSClient *)v2 setupHandlers];
    [(NSXPCConnection *)v2->_conn resume];
    id v6 = objc_alloc_init(FSClientTaskUpdateHandler);
    fsClientTaskUpdateHandler = v2->_fsClientTaskUpdateHandler;
    v2->_fsClientTaskUpdateHandler = v6;

    id v8 = v2->_conn;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __16__FSClient_init__block_invoke;
    v18[3] = &unk_26530B770;
    v18[4] = &v20;
    v9 = [(NSXPCConnection *)v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __16__FSClient_init__block_invoke_2;
    v17[3] = &unk_26530B770;
    v17[4] = &v20;
    [v9 switchToFSKit:v17];
    if (*(void *)(v21[0] + 40))
    {

      v10 = fskit_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(FSClient *)(uint64_t)v21 init];
      }

      v2 = 0;
    }
    else
    {
      v12 = fskit_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_24DDB2000, v12, OS_LOG_TYPE_DEFAULT, "Setting remote protocol to all XPC", v16, 2u);
      }

      v13 = +[FSKitConstants FSAllClientXPCProtocols];
      [(NSXPCConnection *)v2->_conn setRemoteObjectInterface:v13];

      v14 = +[FSKitConstants FSClientHostXPCProtocol];
      [(NSXPCConnection *)v2->_conn setExportedInterface:v14];

      [(NSXPCConnection *)v2->_conn setExportedObject:v2->_fsClientTaskUpdateHandler];
    }
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __16__FSClient_init__block_invoke(uint64_t a1, void *a2)
{
}

void __16__FSClient_init__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)dealloc
{
  conn = self->_conn;
  if (conn)
  {
    [(NSXPCConnection *)conn invalidate];
    v4 = self->_conn;
    self->_conn = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FSClient;
  [(FSClient *)&v5 dealloc];
}

+ (void)fetchInstalledExtensionsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 installedExtensions:v3];
}

+ (id)installedExtensionsWithError:(id *)a3
{
  id v4 = objc_opt_new();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__FSClient_installedExtensionsWithError___block_invoke;
  v7[3] = &unk_26530B850;
  void v7[4] = &v14;
  v7[5] = &v8;
  [v4 installedExtensionsSync:v7];
  *a3 = (id) v15[5];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __41__FSClient_installedExtensionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConn:(id)a3
{
}

- (FSClientTaskUpdateHandler)fsClientTaskUpdateHandler
{
  return (FSClientTaskUpdateHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFsClientTaskUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsClientTaskUpdateHandler, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)installedExtensions:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__FSClient_Private__installedExtensions___block_invoke;
  v11[3] = &unk_26530B198;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__FSClient_Private__installedExtensions___block_invoke_2;
  v9[3] = &unk_26530B878;
  id v10 = v6;
  id v8 = v6;
  [v7 installedExtensions:v9];
}

uint64_t __41__FSClient_Private__installedExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__FSClient_Private__installedExtensions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installedExtensionsSync:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__FSClient_Private__installedExtensionsSync___block_invoke;
  v11[3] = &unk_26530B198;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__FSClient_Private__installedExtensionsSync___block_invoke_2;
  v9[3] = &unk_26530B878;
  id v10 = v6;
  id v8 = v6;
  [v7 installedExtensions:v9];
}

uint64_t __45__FSClient_Private__installedExtensionsSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__FSClient_Private__installedExtensionsSync___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installedExtensionsForUser:(id *)a3 replyHandler:(id)a4
{
  id v6 = a4;
  conn = self->_conn;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke;
  v15[3] = &unk_26530B198;
  id v8 = v6;
  id v16 = v8;
  v9 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke_2;
  v13[3] = &unk_26530B878;
  id v14 = v8;
  long long v10 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v10;
  id v11 = v8;
  [v9 installedExtensionsForAuditToken:v12 replyHandler:v13];
}

uint64_t __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__FSClient_Private__installedExtensionsForUser_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installedExtensionWithShortName:(id)a3 synchronous:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = v8;
  conn = self->_conn;
  if (v5)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke;
    v21[3] = &unk_26530B198;
    id v11 = &v22;
    id v22 = v8;
    id v12 = a3;
    uint64_t v13 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v21];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_2;
    v19[3] = &unk_26530B198;
    id v11 = &v20;
    id v20 = v8;
    id v14 = a3;
    uint64_t v13 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v19];
  }
  v15 = (void *)v13;

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_3;
  v17[3] = &unk_26530B8A0;
  id v18 = v9;
  id v16 = v9;
  [v15 installedExtensionWithShortName:a3 replyHandler:v17];
}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__FSClient_Private__installedExtensionWithShortName_synchronous_replyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentTasks:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__FSClient_Private__currentTasks___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v8];
  [v7 currentTasks:v6];
}

uint64_t __34__FSClient_Private__currentTasks___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentTasksSync:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__FSClient_Private__currentTasksSync___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 currentTasks:v6];
}

uint64_t __38__FSClient_Private__currentTasksSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentResourceIDs:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__FSClient_Private__currentResourceIDs___block_invoke;
  v11[3] = &unk_26530B198;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__FSClient_Private__currentResourceIDs___block_invoke_2;
  v9[3] = &unk_26530B878;
  id v10 = v6;
  id v8 = v6;
  [v7 currentResourceIDs:v9];
}

uint64_t __40__FSClient_Private__currentResourceIDs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__FSClient_Private__currentResourceIDs___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentResourceIDsSync:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__FSClient_Private__currentResourceIDsSync___block_invoke;
  v11[3] = &unk_26530B198;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__FSClient_Private__currentResourceIDsSync___block_invoke_2;
  v9[3] = &unk_26530B878;
  id v10 = v6;
  id v8 = v6;
  [v7 currentResourceIDs:v9];
}

uint64_t __44__FSClient_Private__currentResourceIDsSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__FSClient_Private__currentResourceIDsSync___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentContainers:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__FSClient_Private__currentContainers___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v8];
  [v7 currentContainers:v6];
}

uint64_t __39__FSClient_Private__currentContainers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)currentContainersSync:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__FSClient_Private__currentContainersSync___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v8];
  [v7 currentContainers:v6];
}

uint64_t __43__FSClient_Private__currentContainersSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v10 = v8;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke_2;
  v15[3] = &unk_26530B8C8;
  id v16 = v10;
  id v14 = v10;
  [v13 probeResource:v12 usingBundle:v11 replyHandler:v15];
}

uint64_t __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__FSClient_Private__probeResource_usingBundle_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)probeResource:(id)a3 usingBundle:(id)a4 auditToken:(id *)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__FSClient_Private__probeResource_usingBundle_auditToken_replyHandler___block_invoke;
  v18[3] = &unk_26530B198;
  id v19 = v10;
  id v12 = v10;
  id v13 = a4;
  id v14 = a3;
  v15 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v18];
  long long v16 = *(_OWORD *)&a5->var0[4];
  v17[0] = *(_OWORD *)a5->var0;
  v17[1] = v16;
  [v15 probeResource:v14 usingBundle:v13 auditToken:v17 replyHandler:v12];
}

uint64_t __71__FSClient_Private__probeResource_usingBundle_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)probeResourceSync:(id)a3 usingBundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v10 = v8;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke_2;
  v15[3] = &unk_26530B8C8;
  id v16 = v10;
  id v14 = v10;
  [v13 probeResource:v12 usingBundle:v11 replyHandler:v15];
}

uint64_t __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__FSClient_Private__probeResourceSync_usingBundle_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  conn = self->_conn;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke;
  v25[3] = &unk_26530B198;
  id v15 = v13;
  id v26 = v15;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v25];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke_2;
  v22[3] = &unk_26530B8F0;
  id v23 = v12;
  id v24 = v15;
  id v20 = v12;
  id v21 = v15;
  [v19 checkResource:v18 usingBundle:v17 options:v16 connection:v20 replyHandler:v22];
}

uint64_t __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__FSClient_Private__checkResource_usingBundle_options_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 didStart];
}

- (void)checkResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  conn = self->_conn;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke;
  v29[3] = &unk_26530B198;
  id v17 = v15;
  id v30 = v17;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v29];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2;
  v26[3] = &unk_26530B8F0;
  id v27 = v14;
  id v28 = v17;
  long long v22 = *(_OWORD *)&a6->var0[4];
  v25[0] = *(_OWORD *)a6->var0;
  v25[1] = v22;
  id v23 = v14;
  id v24 = v17;
  [v21 checkResource:v20 usingBundle:v19 options:v18 auditToken:v25 connection:v23 replyHandler:v26];
}

uint64_t __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__FSClient_Private__checkResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 didStart];
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 connection:(id)a6 replyHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  conn = self->_conn;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  _OWORD v25[2] = __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke;
  v25[3] = &unk_26530B198;
  id v15 = v13;
  id v26 = v15;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v25];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke_2;
  v22[3] = &unk_26530B8F0;
  id v23 = v12;
  id v24 = v15;
  id v20 = v12;
  id v21 = v15;
  [v19 formatResource:v18 usingBundle:v17 options:v16 connection:v20 replyHandler:v22];
}

uint64_t __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__FSClient_Private__formatResource_usingBundle_options_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 didStart];
}

- (void)formatResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 connection:(id)a7 replyHandler:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  conn = self->_conn;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke;
  v29[3] = &unk_26530B198;
  id v17 = v15;
  id v30 = v17;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v29];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2;
  v26[3] = &unk_26530B8F0;
  id v27 = v14;
  id v28 = v17;
  long long v22 = *(_OWORD *)&a6->var0[4];
  v25[0] = *(_OWORD *)a6->var0;
  v25[1] = v22;
  id v23 = v14;
  id v24 = v17;
  [v21 formatResource:v20 usingBundle:v19 options:v18 auditToken:v25 connection:v23 replyHandler:v26];
}

uint64_t __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__FSClient_Private__formatResource_usingBundle_options_auditToken_connection_replyHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 didStart];
}

- (void)setTaskUpdateHandler:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v9 = v7;
  id v18 = v9;
  id v10 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke_2;
  v14[3] = &unk_26530B918;
  BOOL v11 = v6 != 0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v12 = v9;
  id v13 = v6;
  [v10 setTaskUpdateInterest:v11 replyHandler:v14];
}

uint64_t __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __55__FSClient_Private__setTaskUpdateHandler_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!v3)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    [*(id *)(*(void *)(a1 + 32) + 16) setTaskHandler:*(void *)(a1 + 40)];
    objc_sync_exit(v4);

    id v3 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }
  return MEMORY[0x270F9A758](v5, v3);
}

- (void)getFSProgressForTask:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  conn = self->_conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke;
  v14[3] = &unk_26530B198;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  _OWORD v12[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_2;
  v12[3] = &unk_26530B968;
  id v13 = v8;
  id v11 = v8;
  [v10 getProgressPortForTask:v9 replyHandler:v12];
}

uint64_t __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_3;
    v7[3] = &unk_26530B940;
    id v8 = *(id *)(a1 + 32);
    +[FSTaskProgress constructFromListener:a2 description:a3 replyHandler:v7];
  }
}

uint64_t __55__FSClient_Private__getFSProgressForTask_replyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelTask:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  conn = self->_conn;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__FSClient_Private__cancelTask_replyHandler___block_invoke;
  v11[3] = &unk_26530B198;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v11];
  [v10 cancelTask:v9 replyHandler:v8];
}

uint64_t __45__FSClient_Private__cancelTask_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateVolumeName:(id)a3 usingBundle:(id)a4 volumeID:(id)a5 replyHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  id v13 = v9;
  uint64_t v14 = [v13 UTF8String];
  id v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:]";
    __int16 v33 = 2080;
    uint64_t v34 = v14;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_debug_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEBUG, "%s:start:%s:%@:%@", buf, 0x2Au);
  }

  if ([v10 isEqualToString:@"com.apple.fskit.exfat"])
  {
    if ((unint64_t)[v13 lengthOfBytesUsingEncoding:10] <= 0x16)
    {
      id v16 = 0;
      BOOL v17 = 1;
      id v18 = "\"*/:<>?\\|";
      goto LABEL_18;
    }
LABEL_8:
    id v16 = @"Volume name exceeds 11 characters";
    goto LABEL_34;
  }
  if ([v10 isEqualToString:@"com.apple.fskit.msdos"])
  {
    if ((unint64_t)[v13 lengthOfBytesUsingEncoding:4] > 0xB) {
      goto LABEL_8;
    }
    id v16 = 0;
    BOOL v17 = 1;
    id v18 = "\"*+,./:;<=>?[\\]|";
  }
  else
  {
    if ([v10 isEqualToString:@"com.apple.fskit.apfs"])
    {
      if ((unint64_t)[v13 length] <= 0x100) {
        goto LABEL_28;
      }
      id v16 = @"Volume name exceeds 256 characters";
      goto LABEL_34;
    }
    if (![v10 isEqualToString:@"com.apple.fskit.hfs"])
    {
      id v24 = fskit_std_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:]();
      }

      id v16 = @"Unknown bundle";
      goto LABEL_34;
    }
    unint64_t v19 = [v13 length];
    BOOL v17 = v19 < 0x100;
    if (v19 >= 0x100) {
      id v16 = @"Volume name exceeds 255 characters";
    }
    else {
      id v16 = 0;
    }
    id v18 = "/:";
  }
LABEL_18:
  if ([v13 length])
  {
    uint64_t v20 = 0;
    while (1)
    {
      unsigned int v21 = *(unsigned __int8 *)(v14 + v20);
      if (v21 == 32 && v20 == 0) {
        break;
      }
      if (v21 < 0x20 || strchr(v18, v21))
      {
        id v16 = @"Volume name contains invalid characters";
        goto LABEL_34;
      }
      if ([v13 length] <= (unint64_t)++v20) {
        goto LABEL_27;
      }
    }
    id v16 = @"Volume name starts with a space";
    goto LABEL_34;
  }
LABEL_27:
  if (v17)
  {
LABEL_28:
    id v23 = 0;
    goto LABEL_37;
  }
LABEL_34:
  v25 = fskit_std_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[FSClient(Private) validateVolumeName:usingBundle:volumeID:replyHandler:]();
  }

  id v26 = (void *)MEMORY[0x263F087E8];
  uint64_t v27 = *MEMORY[0x263F08438];
  uint64_t v29 = *MEMORY[0x263F08338];
  id v30 = v16;
  id v28 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v23 = [v26 errorWithDomain:v27 code:22 userInfo:v28];

LABEL_37:
  v12[2](v12, v23);
}

- (void)activateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __67__FSClient_Private__activateVolume_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 activateVolume:v15 shortName:v14 options:v13 replyHandler:v12];
}

uint64_t __67__FSClient_Private__activateVolume_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v14 = +[FSTaskOption optionWithoutValue:@"-f"];
  if (v12)
  {
    id v15 = [v12 options];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __69__FSClient_Private__deactivateVolume_shortName_options_replyHandler___block_invoke;
    unint64_t v19 = &unk_26530B990;
    id v20 = v14;
    unsigned int v21 = &v22;
    [v15 enumerateObjectsUsingBlock:&v16];
  }
  -[FSClient deactivateVolume:shortName:numericOptions:replyHandler:](self, "deactivateVolume:shortName:numericOptions:replyHandler:", v10, v11, v23[3], v13, v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);
}

uint64_t __69__FSClient_Private__deactivateVolume_shortName_options_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1uLL;
  }
  return result;
}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 synchronousReplyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __76__FSClient_Private__loadResource_shortName_options_synchronousReplyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(NSXPCConnection *)conn synchronousRemoteObjectProxyWithErrorHandler:v17];
  [v16 loadResource:v15 shortName:v14 options:v13 replyHandler:v12];
}

uint64_t __76__FSClient_Private__loadResource_shortName_options_synchronousReplyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __65__FSClient_Private__loadResource_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 loadResource:v15 shortName:v14 options:v13 replyHandler:v12];
}

uint64_t __65__FSClient_Private__loadResource_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__FSClient_Private__loadResource_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_26530B198;
  id v22 = v12;
  id v14 = v12;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v21];
  long long v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  [v18 loadResource:v17 usingBundle:v16 options:v15 auditToken:v20 replyHandler:v14];
}

uint64_t __78__FSClient_Private__loadResource_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 shortName:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __67__FSClient_Private__unloadResource_shortName_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 unloadResource:v15 shortName:v14 options:v13 replyHandler:v12];
}

uint64_t __67__FSClient_Private__unloadResource_shortName_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setEnabledStateForIdentifier:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  conn = self->_conn;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__FSClient_Private__setEnabledStateForIdentifier_newState_replyHandler___block_invoke;
  v13[3] = &unk_26530B198;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v13];
  [v12 setEnabledStateForIdentifier:v11 newState:v5 replyHandler:v10];
}

uint64_t __72__FSClient_Private__setEnabledStateForIdentifier_newState_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __69__FSClient_Project__activateVolume_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 activateVolume:v15 usingBundle:v14 options:v13 replyHandler:v12];
}

uint64_t __69__FSClient_Project__activateVolume_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateVolume:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__FSClient_Project__activateVolume_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_26530B198;
  id v22 = v12;
  id v14 = v12;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v21];
  long long v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  [v18 activateVolume:v17 usingBundle:v16 options:v15 auditToken:v20 replyHandler:v14];
}

uint64_t __80__FSClient_Project__activateVolume_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 shortName:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__FSClient_Project__deactivateVolume_shortName_numericOptions_replyHandler___block_invoke;
  v16[3] = &unk_26530B198;
  id v17 = v10;
  id v12 = v10;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v16];
  [v15 deactivateVolume:v14 shortName:v13 numericOptions:a5 replyHandler:v12];
}

uint64_t __76__FSClient_Project__deactivateVolume_shortName_numericOptions_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a7;
  conn = self->_conn;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  _OWORD v20[2] = __89__FSClient_Project__deactivateVolume_usingBundle_numericOptions_auditToken_replyHandler___block_invoke;
  v20[3] = &unk_26530B198;
  id v21 = v12;
  id v14 = v12;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v20];
  long long v18 = *(_OWORD *)&a6->var0[4];
  v19[0] = *(_OWORD *)a6->var0;
  v19[1] = v18;
  [v17 deactivateVolume:v16 usingBundle:v15 numericOptions:a5 auditToken:v19 replyHandler:v14];
}

uint64_t __89__FSClient_Project__deactivateVolume_usingBundle_numericOptions_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deactivateVolume:(id)a3 usingBundle:(id)a4 numericOptions:(unint64_t)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__FSClient_Project__deactivateVolume_usingBundle_numericOptions_replyHandler___block_invoke;
  v16[3] = &unk_26530B198;
  id v17 = v10;
  id v12 = v10;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v16];
  [v15 deactivateVolume:v14 usingBundle:v13 numericOptions:a5 replyHandler:v12];
}

uint64_t __78__FSClient_Project__deactivateVolume_usingBundle_numericOptions_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __67__FSClient_Project__loadResource_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 loadResource:v15 usingBundle:v14 options:v13 replyHandler:v12];
}

uint64_t __67__FSClient_Project__loadResource_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 replyHandler:(id)a6
{
  id v10 = a6;
  conn = self->_conn;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  _OWORD v17[2] = __69__FSClient_Project__unloadResource_usingBundle_options_replyHandler___block_invoke;
  v17[3] = &unk_26530B198;
  id v18 = v10;
  id v12 = v10;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v17];
  [v16 unloadResource:v15 usingBundle:v14 options:v13 replyHandler:v12];
}

uint64_t __69__FSClient_Project__unloadResource_usingBundle_options_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unloadResource:(id)a3 usingBundle:(id)a4 options:(id)a5 auditToken:(id *)a6 replyHandler:(id)a7
{
  id v12 = a7;
  conn = self->_conn;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__FSClient_Project__unloadResource_usingBundle_options_auditToken_replyHandler___block_invoke;
  v21[3] = &unk_26530B198;
  id v22 = v12;
  id v14 = v12;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v21];
  long long v19 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v19;
  [v18 unloadResource:v17 usingBundle:v16 options:v15 auditToken:v20 replyHandler:v14];
}

uint64_t __80__FSClient_Project__unloadResource_usingBundle_options_auditToken_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "Error connecting to fskitd: %@", (uint8_t *)&v3, 0xCu);
}

@end