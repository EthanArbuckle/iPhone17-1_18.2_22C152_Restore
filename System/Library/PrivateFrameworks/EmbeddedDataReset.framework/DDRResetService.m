@interface DDRResetService
+ (id)sharedInstance;
- (BOOL)invalidated;
- (NSHashTable)obervers;
- (NSXPCConnection)dataResetXPCConnection;
- (NSXPCConnection)observerNonLaunchingXPCConnection;
- (OS_dispatch_queue)observerQueue;
- (int)currentResetState;
- (int64_t)mode;
- (os_unfair_lock_s)lock;
- (void)addOberver:(id)a3;
- (void)didBeginDataResetWithMode:(int64_t)a3;
- (void)didCompleteDataResetMode:(int64_t)a3 withError:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)notifyClientsOfResetFailedWithErrorCode:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)resetWithRequest:(id)a3 completion:(id)a4;
- (void)setCurrentResetState:(int)a3;
- (void)setDataResetXPCConnection:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMode:(int64_t)a3;
- (void)setObervers:(id)a3;
- (void)setObserverNonLaunchingXPCConnection:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)willBeginDataResetWithMode:(int64_t)a3;
@end

@implementation DDRResetService

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DDRResetService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_dataResetService;
  return v2;
}

uint64_t __33__DDRResetService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_dataResetService;
  sharedInstance_dataResetService = (uint64_t)v1;

  [(id)sharedInstance_dataResetService setCurrentResetState:0];
  v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  [(id)sharedInstance_dataResetService setObervers:v3];

  [(id)sharedInstance_dataResetService setInvalidated:0];
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.devicedatareset.observer", 0);
  [(id)sharedInstance_dataResetService setObserverQueue:v4];

  v5 = (void *)sharedInstance_dataResetService;
  return [v5 setLock:0];
}

- (void)addOberver:(id)a3
{
  id v4 = a3;
  v5 = [(DDRResetService *)self observerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__DDRResetService_addOberver___block_invoke;
  v7[3] = &unk_264501050;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __30__DDRResetService_addOberver___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) obervers];
    uint64_t v5 = *(void *)(a1 + 40);
    int v17 = 138412802;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "adding observer %@ to array: %@, self = %@", (uint8_t *)&v17, 0x20u);
  }
  if (*(void *)(a1 + 32))
  {
    id v6 = [*(id *)(a1 + 40) obervers];
    char v7 = [v6 containsObject:*(void *)(a1 + 32)];

    if ((v7 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 40) obervers];
      uint64_t v9 = [v8 count];

      if (!v9)
      {
        v10 = [*(id *)(a1 + 40) observerNonLaunchingXPCConnection];
        v11 = [v10 remoteObjectProxy];
        [v11 connect];
      }
      v12 = [*(id *)(a1 + 40) obervers];
      [v12 addObject:*(void *)(a1 + 32)];

      v13 = DDRLogForCategory(3uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        v15 = [*(id *)(a1 + 40) obervers];
        uint64_t v16 = *(void *)(a1 + 40);
        int v17 = 138412802;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_impl(&dword_21F061000, v13, OS_LOG_TYPE_DEFAULT, "added observer %@ to array: %@, self = %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDRResetService *)self observerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__DDRResetService_removeObserver___block_invoke;
  v7[3] = &unk_264501050;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __34__DDRResetService_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) obervers];
    int v12 = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "removing observer %@ from array: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) obervers];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    char v7 = [*(id *)(a1 + 40) obervers];
    [v7 removeObject:*(void *)(a1 + 32)];

    id v8 = [*(id *)(a1 + 40) obervers];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [*(id *)(*(void *)(a1 + 40) + 32) invalidate];
      uint64_t v10 = *(void *)(a1 + 40);
      v11 = *(void **)(v10 + 32);
      *(void *)(v10 + 32) = 0;
    }
  }
}

- (NSXPCConnection)observerNonLaunchingXPCConnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DDRResetService *)self obervers];
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_21F061000, v3, OS_LOG_TYPE_DEFAULT, "Observer table in observerNonLaunchingXPCConnection: %@", buf, 0xCu);
  }
  observerNonLaunchingXPCConnection = self->_observerNonLaunchingXPCConnection;
  if (!observerNonLaunchingXPCConnection)
  {
    int v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.devicedatareset.DeviceDataResetObservationService.NonLaunching" options:4096];
    char v7 = self->_observerNonLaunchingXPCConnection;
    self->_observerNonLaunchingXPCConnection = v6;

    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0A50E8];
    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection setRemoteObjectInterface:v8];
    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection setExportedObject:self];
    uint64_t v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0A4750];
    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection setExportedInterface:v9];

    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke;
    v17[3] = &unk_264501078;
    objc_copyWeak(&v18, (id *)buf);
    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection setInvalidationHandler:v17];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    __int16 v14 = __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke_58;
    v15 = &unk_264501078;
    objc_copyWeak(&v16, (id *)buf);
    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection setInterruptionHandler:&v12];
    uint64_t v10 = [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection _xpcConnection];
    xpc_connection_set_non_launching();

    [(NSXPCConnection *)self->_observerNonLaunchingXPCConnection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);

    observerNonLaunchingXPCConnection = self->_observerNonLaunchingXPCConnection;
  }
  return observerNonLaunchingXPCConnection;
}

void __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke(uint64_t a1)
{
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "ObserverXPCConnection invalidated at DDRResetService!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyClientsOfResetFailedWithErrorCode:4099];
}

void __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke_58(uint64_t a1)
{
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "ObserverXPCConnection interrupted at DDRResetService!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyClientsOfResetFailedWithErrorCode:4097];
}

- (NSXPCConnection)dataResetXPCConnection
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(DDRResetService *)self obervers];
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_21F061000, v3, OS_LOG_TYPE_DEFAULT, "Observer table in dataResetXPCConnection: %@", buf, 0xCu);
  }
  dataResetXPCConnection = self->_dataResetXPCConnection;
  if (!dataResetXPCConnection)
  {
    int v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.devicedatareset.DeviceDataResetService" options:4096];
    char v7 = self->_dataResetXPCConnection;
    self->_dataResetXPCConnection = v6;

    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0A5148];
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    [v8 setClasses:v12 forSelector:sel_resetDataWithRequest_completion_ argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_dataResetXPCConnection setRemoteObjectInterface:v8];
    [(NSXPCConnection *)self->_dataResetXPCConnection setExportedObject:self];
    uint64_t v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0A4680];
    [(NSXPCConnection *)self->_dataResetXPCConnection setExportedInterface:v13];

    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__DDRResetService_dataResetXPCConnection__block_invoke;
    v17[3] = &unk_264501078;
    objc_copyWeak(&v18, (id *)buf);
    [(NSXPCConnection *)self->_dataResetXPCConnection setInvalidationHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__DDRResetService_dataResetXPCConnection__block_invoke_72;
    v15[3] = &unk_264501078;
    objc_copyWeak(&v16, (id *)buf);
    [(NSXPCConnection *)self->_dataResetXPCConnection setInterruptionHandler:v15];
    [(NSXPCConnection *)self->_dataResetXPCConnection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);

    dataResetXPCConnection = self->_dataResetXPCConnection;
  }
  return dataResetXPCConnection;
}

void __41__DDRResetService_dataResetXPCConnection__block_invoke(uint64_t a1)
{
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "DataResetConnection invalidated at DDRResetService!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyClientsOfResetFailedWithErrorCode:4099];
}

void __41__DDRResetService_dataResetXPCConnection__block_invoke_72(uint64_t a1)
{
  v2 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F061000, v2, OS_LOG_TYPE_DEFAULT, "DataResetConnection interrupted at DDRResetService!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyClientsOfResetFailedWithErrorCode:4097];
}

- (void)notifyClientsOfResetFailedWithErrorCode:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataResetXPCConnection = self->_dataResetXPCConnection;
  self->_dataResetXPCConnection = 0;

  if ([(DDRResetService *)self currentResetState] == 1)
  {
    char v7 = DDRLogForCategory(3uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21F061000, v7, OS_LOG_TYPE_DEFAULT, "Notifying clients of failed reset in framework", v9, 2u);
    }

    [(DDRResetService *)self setCurrentResetState:2];
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicedatareset.errorDomain.ddrservice" code:a3 userInfo:0];
    [(DDRResetService *)self didCompleteDataResetMode:[(DDRResetService *)self mode] withError:v8 completion:0];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)resetWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  -[DDRResetService setMode:](self, "setMode:", [v6 mode]);
  [(DDRResetService *)self setCurrentResetState:1];
  if ([(DDRResetService *)self mode])
  {
    id v8 = DDRLogForCategory(3uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v6 mode];
      uint64_t v10 = [v6 options];
      int v11 = [v10 hideProgress];
      uint64_t v12 = [v6 options];
      int v13 = [v12 eraseDataPlan];
      __int16 v14 = [v6 reason];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      LOWORD(v30) = 2112;
      *(void *)((char *)&v30 + 2) = v14;
      _os_log_impl(&dword_21F061000, v8, OS_LOG_TYPE_DEFAULT, "Reset mode: %ld, hide progress:%d, erase data plan: %d, reason: %@", buf, 0x22u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&long long v30 = __Block_byref_object_copy_;
    *((void *)&v30 + 1) = __Block_byref_object_dispose_;
    id v31 = 0;
    v15 = [(DDRResetService *)self dataResetXPCConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __47__DDRResetService_resetWithRequest_completion___block_invoke;
    v22[3] = &unk_2645010A0;
    v22[4] = self;
    v24 = buf;
    id v16 = v7;
    id v23 = v16;
    int v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v22];

    if (v17 && !*(void *)(*(void *)&buf[8] + 40))
    {
      id v18 = DDRLogForCategory(3uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(DDRResetService *)self obervers];
        *(_DWORD *)v25 = 138412546;
        v26 = v19;
        __int16 v27 = 2112;
        v28 = self;
        _os_log_impl(&dword_21F061000, v18, OS_LOG_TYPE_DEFAULT, "Observer table in resetWithRequest: %@, self = %@", v25, 0x16u);
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __47__DDRResetService_resetWithRequest_completion___block_invoke_75;
      v20[3] = &unk_2645010C8;
      v20[4] = self;
      id v21 = v16;
      [v17 resetDataWithRequest:v6 completion:v20];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(DDRResetService *)self setCurrentResetState:2];
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __47__DDRResetService_resetWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21F061000, v5, OS_LOG_TYPE_DEFAULT, "Connection to daemon failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) setCurrentResetState:2];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

void __47__DDRResetService_resetWithRequest_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21F061000, v4, OS_LOG_TYPE_DEFAULT, "Completed data reset", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 32) setCurrentResetState:2];
}

- (void)invalidate
{
  id v3 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21F061000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate current connection to devicedataresetd", v5, 2u);
  }

  self->_invalidated = 1;
  dataResetXPCConnection = self->_dataResetXPCConnection;
  if (dataResetXPCConnection) {
    [(NSXPCConnection *)dataResetXPCConnection invalidate];
  }
}

- (void)willBeginDataResetWithMode:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F061000, v5, OS_LOG_TYPE_DEFAULT, "Broadcast willBeginDataResetWithMode to observers in framework", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(DDRResetService *)self obervers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = DDRLogForCategory(3uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v19 = v11;
          _os_log_impl(&dword_21F061000, v12, OS_LOG_TYPE_DEFAULT, "Data reset willbegin delegate oberver: %@", buf, 0xCu);
        }

        if (objc_opt_respondsToSelector())
        {
          int v13 = DDRLogForCategory(3uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v19 = v11;
            _os_log_impl(&dword_21F061000, v13, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to willBeginDataResetWithMode", buf, 0xCu);
          }

          [v11 resetService:self willBeginDataResetWithMode:a3];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)didBeginDataResetWithMode:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F061000, v5, OS_LOG_TYPE_DEFAULT, "Broadcast didBeginDataResetWithMode to observers in framework", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(DDRResetService *)self obervers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = DDRLogForCategory(3uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v19 = v11;
          _os_log_impl(&dword_21F061000, v12, OS_LOG_TYPE_DEFAULT, "Data reset didbegin delegate oberver: %@", buf, 0xCu);
        }

        if (objc_opt_respondsToSelector())
        {
          int v13 = DDRLogForCategory(3uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v19 = v11;
            _os_log_impl(&dword_21F061000, v13, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to didBeginDataResetWithMode", buf, 0xCu);
          }

          [v11 resetService:self didBeginDataResetWithMode:a3];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)didCompleteDataResetMode:(int64_t)a3 withError:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v16 = a5;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v6 = DDRLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F061000, v6, OS_LOG_TYPE_DEFAULT, "Data reset completion delegate call back in framework", buf, 2u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [(DDRResetService *)self obervers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = DDRLogForCategory(3uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v11;
          _os_log_impl(&dword_21F061000, v12, OS_LOG_TYPE_DEFAULT, "Data reset completion delegate oberver: %@", buf, 0xCu);
        }

        if (objc_opt_respondsToSelector())
        {
          int v13 = DDRLogForCategory(3uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v11;
            _os_log_impl(&dword_21F061000, v13, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to didCompleteDataResetMode", buf, 0xCu);
          }

          uint64_t v14 = MEMORY[0x263EF8330];
          ++*((_DWORD *)v27 + 6);
          v19[0] = v14;
          v19[1] = 3221225472;
          v19[2] = __65__DDRResetService_didCompleteDataResetMode_withError_completion___block_invoke;
          v19[3] = &unk_2645010F0;
          uint64_t v21 = &v26;
          id v20 = v16;
          [v11 resetService:self didCompleteDataResetMode:a3 withError:v17 completion:v19];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v26, 8);
}

uint64_t __65__DDRResetService_didCompleteDataResetMode_withError_completion___block_invoke(uint64_t result)
{
  if (!--*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)setDataResetXPCConnection:(id)a3
{
}

- (void)setObserverNonLaunchingXPCConnection:(id)a3
{
}

- (int)currentResetState
{
  return self->_currentResetState;
}

- (void)setCurrentResetState:(int)a3
{
  self->_currentResetState = a3;
}

- (NSHashTable)obervers
{
  return self->_obervers;
}

- (void)setObervers:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_obervers, 0);
  objc_storeStrong((id *)&self->_observerNonLaunchingXPCConnection, 0);
  objc_storeStrong((id *)&self->_dataResetXPCConnection, 0);
}

@end