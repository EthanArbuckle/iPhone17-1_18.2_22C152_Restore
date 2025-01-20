@interface MSAutosave
+ (id)autosave;
+ (id)log;
- (BOOL)hasAutosavedMessageWithIdentifier:(id)a3;
- (MSAutosave)init;
- (MSAutosave)initWithRemoteObjectInterface:(id)a3;
- (NSHashTable)activeAutosaveSessions;
- (id)autosavedMessageDataWithIdentifier:(id)a3;
- (id)newConnectionForInterface:(id)a3;
- (void)_getRemoteAutosaveSessionForIdentifier:(id)a3 completion:(id)a4;
- (void)_handleInterruptedConnection;
- (void)autosaveMessageData:(id)a3 replacingIdentifier:(id)a4 completion:(id)a5;
- (void)autosaveSessionForIdentifier:(id)a3 completion:(id)a4;
- (void)getIdleAutosaves:(id)a3;
- (void)removeAutosavedMessageWithIdentifier:(id)a3;
- (void)setActiveAutosaveSessions:(id)a3;
@end

@implementation MSAutosave

- (void).cxx_destruct
{
}

+ (id)autosave
{
  v2 = objc_alloc_init(MSAutosave);

  return v2;
}

- (MSAutosave)init
{
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C607428];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_getIdleAutosaves_ argumentIndex:0 ofReply:1];

  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C607488];
  [v3 setInterface:v7 forSelector:sel_autosaveSessionForIdentifier_completion_ argumentIndex:0 ofReply:1];
  v12.receiver = self;
  v12.super_class = (Class)MSAutosave;
  v8 = [(MSXPCService *)&v12 initWithRemoteObjectInterface:v3];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    activeAutosaveSessions = v8->_activeAutosaveSessions;
    v8->_activeAutosaveSessions = (NSHashTable *)v9;
  }
  return v8;
}

- (void)getIdleAutosaves:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__MSAutosave_getIdleAutosaves___block_invoke;
  v7[3] = &unk_264242F90;
  id v5 = v4;
  id v8 = v5;
  v6 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v7];
  [v6 getIdleAutosaves:v5];
}

- (id)newConnectionForInterface:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSAutosave;
  id v4 = [(MSXPCService *)&v9 newConnectionForInterface:a3];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__MSAutosave_newConnectionForInterface___block_invoke;
  v6[3] = &unk_264242FE0;
  objc_copyWeak(&v7, &location);
  [v4 setInterruptionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __17__MSAutosave_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

void __17__MSAutosave_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (MSAutosave)initWithRemoteObjectInterface:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSAutosave;
  return [(MSXPCService *)&v4 initWithRemoteObjectInterface:a3];
}

- (BOOL)hasAutosavedMessageWithIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F3B398] promise];
  v6 = [v5 errorOnlyCompletionHandlerAdapter];
  id v7 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v6];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__MSAutosave_hasAutosavedMessageWithIdentifier___block_invoke;
  v18[3] = &unk_264242F18;
  id v8 = v5;
  id v19 = v8;
  [v7 hasAutosavedMessageWithIdentifier:v4 completion:v18];
  objc_super v9 = [v8 future];
  id v17 = 0;
  v10 = [v9 resultWithTimeout:&v17 error:5.0];
  id v11 = v17;

  if (v11)
  {
    objc_super v12 = +[MSAutosave log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v11, "ef_publicDescription");
      [(MSAutosave *)v13 hasAutosavedMessageWithIdentifier:v12];
    }
  }
  int v14 = [v10 BOOLValue];
  v15 = +[MSAutosave log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v4;
    __int16 v22 = 1024;
    int v23 = v14;
    _os_log_impl(&dword_215471000, v15, OS_LOG_TYPE_INFO, "hasAutosavedMessageWithIdentifier %{public}@ returns %{BOOL}d", buf, 0x12u);
  }

  return v14;
}

void __48__MSAutosave_hasAutosavedMessageWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  objc_msgSend(v2, "finishWithResult:");
}

- (void)removeAutosavedMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke;
  v7[3] = &unk_264242F40;
  id v5 = v4;
  id v8 = v5;
  v6 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v7];
  [v6 removeAutosavedMessageWithIdentifier:v5];
}

void __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[MSAutosave log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = objc_msgSend(v3, "ef_publicDescription");
    __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke_cold_1(v5, v6, v7, v4);
  }
}

- (id)autosavedMessageDataWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F3B398] promise];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke;
  v15[3] = &unk_264242F40;
  id v6 = v5;
  id v16 = v6;
  id v7 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke_2;
  v12[3] = &unk_264242F68;
  id v8 = v4;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  [v7 autosavedMessageDataWithIdentifier:v8 completion:v12];
  v10 = [v9 future];

  return v10;
}

uint64_t __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:0 error:a2];
}

void __49__MSAutosave_autosavedMessageDataWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MSAutosave log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v8;
    __int16 v11 = 2048;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_215471000, v7, OS_LOG_TYPE_INFO, "autosavedMessageDataWithIdentifier:%{public}@ returned data: %p, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  [*(id *)(a1 + 40) finishWithResult:v5 error:v6];
}

- (void)autosaveMessageData:(id)a3 replacingIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__MSAutosave_autosaveMessageData_replacingIdentifier_completion___block_invoke;
  v13[3] = &unk_264242F90;
  id v11 = v10;
  id v14 = v11;
  id v12 = [(MSXPCService *)self remoteObjectProxyWithErrorHandler:v13];
  [v12 autosaveMessageData:v8 replacingIdentifier:v9 completion:v11];
}

uint64_t __65__MSAutosave_autosaveMessageData_replacingIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__MSAutosave_getIdleAutosaves___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autosaveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__MSAutosave_autosaveSessionForIdentifier_completion___block_invoke;
  v10[3] = &unk_264242FB8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MSAutosave *)self _getRemoteAutosaveSessionForIdentifier:v9 completion:v10];
}

void __54__MSAutosave_autosaveSessionForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = [[MSAutosaveSession alloc] initWithIdentifier:*(void *)(a1 + 32) remoteSession:v12 remoteService:v7];
    id v11 = [*(id *)(a1 + 40) activeAutosaveSessions];
    [v11 addObject:v10];

    id v9 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __40__MSAutosave_newConnectionForInterface___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruptedConnection];
}

- (void)_handleInterruptedConnection
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_215471000, log, OS_LOG_TYPE_ERROR, "Autosave XPC connection was interrupted. Attempting to reconnect...", v1, 2u);
}

void __42__MSAutosave__handleInterruptedConnection__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v9 && v7)
  {
    [*(id *)(a1 + 32) didReconnectRemoteSession:v9 remoteService:v7];
  }
  else
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"MSMessageAutosaveErrorDomain" code:4 userInfo:0];
    }
    [*(id *)(a1 + 32) remoteSessionDisconnectedWithError:v8];
  }
}

- (void)_getRemoteAutosaveSessionForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSXPCService *)self remoteObjectProxy];
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__MSAutosave__getRemoteAutosaveSessionForIdentifier_completion___block_invoke;
    v10[3] = &unk_264243030;
    id v12 = v7;
    id v11 = v8;
    [v11 autosaveSessionForIdentifier:v6 completion:v10];
  }
  else
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"MSMessageAutosaveErrorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
}

void __64__MSAutosave__getRemoteAutosaveSessionForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((!v6 || v5) && !v5)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"MSMessageAutosaveErrorDomain" code:4 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSHashTable)activeAutosaveSessions
{
  return self->_activeAutosaveSessions;
}

- (void)setActiveAutosaveSessions:(id)a3
{
}

- (void)hasAutosavedMessageWithIdentifier:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_215471000, log, OS_LOG_TYPE_ERROR, "Failed to check for autosaved message. Error: %{public}@", buf, 0xCu);
}

void __51__MSAutosave_removeAutosavedMessageWithIdentifier___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_215471000, log, OS_LOG_TYPE_ERROR, "Removing autosave for identifier (%@) failed with error: %{public}@", buf, 0x16u);
}

@end