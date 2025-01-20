@interface HPSAccessorySettingService
- (BOOL)hasOptedToHH2;
- (BOOL)isMigrationToHH2Complete;
- (HPSAccessorySettingService)init;
- (HPSAccessorySettingService)initWithConnectionProvider:(id)a3 delegate:(id)a4;
- (HPSAccessorySettingService)initWithDelegate:(id)a3;
- (HPSAccessorySettingServiceConnectionProvider)provider;
- (HPSAccessorySettingServiceDelegate)delegate;
- (NSDictionary)heldAssertions;
- (NSDictionary)keyPaths;
- (NSXPCConnection)xpcConnection;
- (id)keyPathsAvailability;
- (id)settingForKeyPath:(id)a3;
- (id)updateSettingForKeyPath:(id)a3 setting:(id)a4;
- (id)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4;
- (int)notifyRegisterToken;
- (void)_handleConnectionInterrupted;
- (void)aggregateAllSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)aggregateAllSettingsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)fetchAllSettingsWithCompletionHandler:(id)a3;
- (void)getAllSettingsWithCompletionHandler:(id)a3;
- (void)getKeyPathsAvailabilityWithCompletionHandler:(id)a3;
- (void)getKeyPathsWithCompletionHandler:(id)a3;
- (void)heldAssertionsWithCompletionHandler:(id)a3;
- (void)isSettingAvailableForKeyPath:(id)a3 completionHandler:(id)a4;
- (void)mergeSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4;
- (void)optedToHH2WithCompletionHandler:(id)a3;
- (void)overrideOptedToHH2State:(BOOL)a3;
- (void)reconcileSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMigrationToHH2Complete:(BOOL)a3;
- (void)setNotifyRegisterToken:(int)a3;
- (void)setXpcConnection:(id)a3;
- (void)settingForKeyPath:(id)a3 completionHandler:(id)a4;
- (void)settingsForKeyPaths:(id)a3 completionHandler:(id)a4;
- (void)startXPCConnection;
- (void)updateSettingForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5;
- (void)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5;
@end

@implementation HPSAccessorySettingService

- (HPSAccessorySettingService)initWithConnectionProvider:(id)a3 delegate:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id obj = a4;
  v41.receiver = self;
  v41.super_class = (Class)HPSAccessorySettingService;
  v6 = [(HPSAccessorySettingService *)&v41 init];
  if (v6)
  {
    v7 = _HPSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[HPSAccessorySettingService initWithConnectionProvider:delegate:]";
      _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v6->_notifyRegisterToken = -1;
    objc_storeWeak((id *)&v6->_delegate, obj);
    uint64_t v8 = [v31 accessorySettingServiceConnection];
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v8;

    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F107BE0];
    v33 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0FACA8];
    v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v30, "setWithObjects:", v29, v28, v27, v26, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
    [v10 setClasses:v19 forSelector:sel_settingsForKeyPaths_completionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v19 forSelector:sel_aggregateSettingsInScope_completionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v19 forSelector:sel_reconcileSettingsInScope_withCompletionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v19 forSelector:sel_mergeSettingsInScope_withCompletionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v19 forSelector:sel_updateSettingForKeyPath_setting_completionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v19 forSelector:sel_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler_ argumentIndex:0 ofReply:1];
    [v33 setClasses:v19 forSelector:sel_notifyDidUpdateSetting_forKeyPath_ argumentIndex:0 ofReply:0];
    [v33 setClasses:v19 forSelector:sel_didUpdateHH2State_ argumentIndex:0 ofReply:0];
    objc_initWeak((id *)buf, v6);
    v20 = v6->_xpcConnection;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke;
    v39[3] = &unk_264E898F8;
    objc_copyWeak(&v40, (id *)buf);
    [(NSXPCConnection *)v20 setInterruptionHandler:v39];
    v21 = v6->_xpcConnection;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_392;
    v37[3] = &unk_264E898F8;
    objc_copyWeak(&v38, (id *)buf);
    [(NSXPCConnection *)v21 setInvalidationHandler:v37];
    v22 = [[HPAccessorySettingServiceMediator alloc] initWithInterface:v6];
    [(NSXPCConnection *)v6->_xpcConnection setExportedObject:v22];
    [(NSXPCConnection *)v6->_xpcConnection setRemoteObjectInterface:v10];
    [(NSXPCConnection *)v6->_xpcConnection setExportedInterface:v33];
    [(NSXPCConnection *)v6->_xpcConnection resume];
    [(HPSAccessorySettingService *)v6 startXPCConnection];
    if ([(HPSAccessorySettingService *)v6 notifyRegisterToken] == -1)
    {
      int out_token = 0;
      id v23 = MEMORY[0x263EF83A0];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_394;
      handler[3] = &unk_264E89BF0;
      objc_copyWeak(&v35, (id *)buf);
      uint32_t v24 = notify_register_dispatch("com.apple.homepodsettingsd.ready", &out_token, MEMORY[0x263EF83A0], handler);

      if (!v24) {
        [(HPSAccessorySettingService *)v6 setNotifyRegisterToken:out_token];
      }
      objc_destroyWeak(&v35);
    }

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_392(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_392_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInterrupted];
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_394(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _HPSLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D144000, v2, OS_LOG_TYPE_DEFAULT, "Received notification that homepodsettingsd daemon is ready", buf, 2u);
    }

    [WeakRetained startXPCConnection];
    uint64_t v3 = [WeakRetained delegate];
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      uint64_t v5 = [WeakRetained delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = _HPSLoggingFacility();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "Inform clients that homepodsettingsd is reconnected and ready!", v9, 2u);
        }

        uint64_t v8 = [WeakRetained delegate];
        [v8 didReconnect];
      }
    }
  }
}

- (HPSAccessorySettingService)initWithDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[HPSAccessorySettingService initWithDelegate:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s Delegate %@", (uint8_t *)&v9, 0x16u);
  }

  char v6 = objc_alloc_init(_HPSAccessorySettingServiceConnectionProvider);
  uint64_t v7 = [(HPSAccessorySettingService *)self initWithConnectionProvider:v6 delegate:v4];

  return v7;
}

- (HPSAccessorySettingService)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[HPSAccessorySettingService init]";
    _os_log_impl(&dword_23D144000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc_init(_HPSAccessorySettingServiceConnectionProvider);
  uint64_t v5 = [(HPSAccessorySettingService *)self initWithConnectionProvider:v4 delegate:0];

  return v5;
}

- (void)startXPCConnection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[HPSAccessorySettingService startXPCConnection]";
    _os_log_impl(&dword_23D144000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [(HPSAccessorySettingService *)self xpcConnection];
  uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_2];
  [v5 startXPCConnection];
}

void __48__HPSAccessorySettingService_startXPCConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__HPSAccessorySettingService_startXPCConnection__block_invoke_cold_1(v2, v3);
  }
}

- (void)dealloc
{
  if ([(HPSAccessorySettingService *)self notifyRegisterToken] != -1) {
    notify_cancel([(HPSAccessorySettingService *)self notifyRegisterToken]);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  uint64_t v3 = [(HPSAccessorySettingService *)self xpcConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HPSAccessorySettingService;
  [(HPSAccessorySettingService *)&v4 dealloc];
}

- (void)updateSettingForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  __int16 v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]";
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:v8])
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25 = @"Keypath not supported for updating value";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"com.apple.homepodsettings" code:10 userInfo:v14];

    v10[2](v10, MEMORY[0x263EFFA68], v15);
  }
  else
  {
    uint64_t v16 = [(HPSAccessorySettingService *)self xpcConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke;
    v22[3] = &unk_264E89940;
    uint64_t v17 = v10;
    id v23 = v17;
    uint64_t v18 = [v16 remoteObjectProxyWithErrorHandler:v22];
    v19 = +[HPSHomeKitSettingHelper compatibleWriteSetting:v9];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_409;
    v20[3] = &unk_264E89C18;
    v21 = v17;
    [v18 updateSettingForKeyPath:v8 setting:v19 completionHandler:v20];

    uint64_t v15 = v23;
  }
}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_409(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = +[HPSHomeKitSettingHelper compatibleReadResults:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  __int16 v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[HPSAccessorySettingService updateSettingWithoutSynchronizationForKeyPath:setting:completionHandler:]";
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:v8])
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25 = @"Keypath not supported for updating value";
    uint64_t v14 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"com.apple.homepodsettings" code:10 userInfo:v14];

    v10[2](v10, MEMORY[0x263EFFA68], v15);
  }
  else
  {
    uint64_t v16 = [(HPSAccessorySettingService *)self xpcConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke;
    v22[3] = &unk_264E89940;
    uint64_t v17 = v10;
    id v23 = v17;
    uint64_t v18 = [v16 remoteObjectProxyWithErrorHandler:v22];
    v19 = +[HPSHomeKitSettingHelper compatibleWriteSetting:v9];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_411;
    v20[3] = &unk_264E89C18;
    v21 = v17;
    [v18 updateSettingWithoutSynchronizationForKeyPath:v8 setting:v19 completionHandler:v20];

    uint64_t v15 = v23;
  }
}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_411(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = +[HPSHomeKitSettingHelper compatibleReadResults:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (id)updateSettingForKeyPath:(id)a3 setting:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[HPSAccessorySettingService updateSettingForKeyPath:setting:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  id v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:v6])
  {
    v10 = [(HPSAccessorySettingService *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke;
    v18[3] = &unk_264E89C40;
    v18[4] = buf;
    __int16 v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];
    id v12 = +[HPSHomeKitSettingHelper compatibleWriteSetting:v7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_412;
    v17[3] = &unk_264E89C68;
    v17[4] = buf;
    [v11 updateSettingForKeyPath:v6 setting:v12 completionHandler:v17];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20 = @"Keypath not supported for updating value";
    v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v14 = [v13 errorWithDomain:@"com.apple.homepodsettings" code:10 userInfo:v10];
    __int16 v11 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v14;
  }

  id v15 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_412(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _HPSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "Results: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
}

- (id)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[HPSAccessorySettingService updateSettingWithoutSynchronizationForKeyPath:setting:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  id v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:v6])
  {
    int v10 = [(HPSAccessorySettingService *)self xpcConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke;
    v18[3] = &unk_264E89C40;
    v18[4] = buf;
    id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];
    uint64_t v12 = +[HPSHomeKitSettingHelper compatibleWriteSetting:v7];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_413;
    v17[3] = &unk_264E89C68;
    v17[4] = buf;
    [v11 updateSettingWithoutSynchronizationForKeyPath:v6 setting:v12 completionHandler:v17];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20 = @"Keypath not supported for updating value";
    int v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v14 = [v13 errorWithDomain:@"com.apple.homepodsettings" code:10 userInfo:v10];
    id v11 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v14;
  }

  id v15 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_413(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _HPSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "Results: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
}

- (void)settingsForKeyPaths:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    v20 = "-[HPSAccessorySettingService settingsForKeyPaths:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  int v10 = _HPSLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[HPSAccessorySettingService settingsForKeyPaths:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_23D144000, v10, OS_LOG_TYPE_DEFAULT, "%s KeyPaths %@", buf, 0x16u);
  }

  id v11 = [(HPSAccessorySettingService *)self xpcConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke;
  v17[3] = &unk_264E89940;
  id v12 = v7;
  id v18 = v12;
  uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_414;
  v15[3] = &unk_264E89C90;
  id v16 = v12;
  id v14 = v12;
  [v13 settingsForKeyPaths:v6 completionHandler:v15];
}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_414(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[HPSHomeKitSettingHelper compatibleReadResults:a2];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

- (void)settingForKeyPath:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v22 = "-[HPSAccessorySettingService settingForKeyPath:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  id v20 = v6;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  id v11 = _HPSLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "-[HPSAccessorySettingService settingForKeyPath:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_23D144000, v11, OS_LOG_TYPE_DEFAULT, "%s KeyPath %@", buf, 0x16u);
  }

  id v12 = [(HPSAccessorySettingService *)self xpcConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke;
  v18[3] = &unk_264E89940;
  id v13 = v7;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_416;
  v16[3] = &unk_264E89C90;
  id v17 = v13;
  id v15 = v13;
  [v14 settingsForKeyPaths:v10 completionHandler:v16];
}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_416(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = [v3 setting];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = +[HPSHomeKitSettingHelper compatibleReadSetting:v4];

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v3 error];
    id v6 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)settingForKeyPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[HPSAccessorySettingService settingForKeyPath:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v7 = [(HPSAccessorySettingService *)self xpcConnection];
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_418];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_419;
  v11[3] = &unk_264E89CB8;
  v11[4] = buf;
  [v8 settingForKeyPath:v4 completionHandler:v11];

  id v9 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1();
  }
}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_419(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _HPSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1();
    }
  }
  uint64_t v8 = +[HPSHomeKitSettingHelper compatibleReadSetting:v5];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)isSettingAvailableForKeyPath:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v17 = "-[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]";
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  int v10 = _HPSLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_23D144000, v10, OS_LOG_TYPE_DEFAULT, "%s KeyPath %@", buf, 0x16u);
  }

  id v11 = [(HPSAccessorySettingService *)self xpcConnection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke;
  v14[3] = &unk_264E89940;
  id v15 = v7;
  id v12 = v7;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v14];
  [v13 isSettingAvailableForKeyPath:v6 completionHandler:v12];
}

void __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getKeyPathsWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v13 = "-[HPSAccessorySettingService getKeyPathsWithCompletionHandler:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  id v7 = [(HPSAccessorySettingService *)self xpcConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke;
  v10[3] = &unk_264E89940;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 getKeyPathsWithCompletionHandler:v8];
}

void __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getKeyPathsAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v13 = "-[HPSAccessorySettingService getKeyPathsAvailabilityWithCompletionHandler:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  id v7 = [(HPSAccessorySettingService *)self xpcConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke;
  v10[3] = &unk_264E89940;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 getKeyPathsAvailabilityWithCompletionHandler:v8];
}

void __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reconcileSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _HPSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[HPSAccessorySettingService reconcileSettingsInScope:withCompletionHandler:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HPSAccessorySettingService *)self xpcConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke;
  v12[3] = &unk_264E89940;
  id v13 = v6;
  id v10 = v6;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 reconcileSettingsInScope:a3 withCompletionHandler:v10];
}

void __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mergeSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _HPSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[HPSAccessorySettingService mergeSettingsInScope:withCompletionHandler:]";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HPSAccessorySettingService *)self xpcConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke;
  v12[3] = &unk_264E89940;
  id v13 = v6;
  id v10 = v6;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 mergeSettingsInScope:a3 withCompletionHandler:v10];
}

void __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)heldAssertionsWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v13 = "-[HPSAccessorySettingService heldAssertionsWithCompletionHandler:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  id v7 = [(HPSAccessorySettingService *)self xpcConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke;
  v10[3] = &unk_264E89940;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v9 heldAssertionsWithCompletionHandler:v8];
}

void __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllSettingsWithCompletionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [MEMORY[0x263F08B88] callStackSymbols];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[HPSAccessorySettingService fetchAllSettingsWithCompletionHandler:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke;
  v8[3] = &unk_264E89D30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HPSAccessorySettingService *)self getKeyPathsWithCompletionHandler:v8];
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_264E89CE0;
  v8[4] = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v4 = v10[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_264E89C18;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 settingsForKeyPaths:v4 completionHandler:v6];

  _Block_object_dispose(&v9, 8);
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  id v11 = v4;
  if (v6)
  {
    uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v4];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v10 = v4;
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;
  }
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _HPSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_423;
    v10[3] = &unk_264E89D08;
    id v11 = v8;
    id v9 = v8;
    [v5 enumerateObjectsUsingBlock:v10];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_423(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 setting];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 setting];
    [v4 addObject:v5];
  }
}

- (void)getAllSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E89D30;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HPSAccessorySettingService *)self getKeyPathsWithCompletionHandler:v6];
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_264E89CE0;
  v8[4] = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v4 = v10[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_264E89C18;
  id v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 settingsForKeyPaths:v4 completionHandler:v6];

  _Block_object_dispose(&v9, 8);
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  id v11 = v4;
  if (v6)
  {
    uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v4];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v10 = v4;
    uint64_t v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;
  }
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF980];
  id v4 = a2;
  uint64_t v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_264E89D08;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 setting];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 setting];
    [v4 addObject:v5];
  }
}

- (void)aggregateAllSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HPSAccessorySettingService *)self xpcConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke;
  v13[3] = &unk_264E89940;
  id v8 = v6;
  id v14 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_426;
  v11[3] = &unk_264E89D58;
  id v12 = v8;
  id v10 = v8;
  [v9 aggregateSettingsInScope:a3 completionHandler:v11];
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_426(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
        id v11 = [v4 objectForKey:v9];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_2;
        v14[3] = &unk_264E89D08;
        id v15 = v10;
        id v12 = v10;
        [v11 enumerateObjectsUsingBlock:v14];

        [v3 setObject:v12 forKey:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 setting];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 setting];
    [v4 addObject:v5];
  }
}

- (void)aggregateAllSettingsWithCompletionHandler:(id)a3
{
}

- (NSDictionary)keyPaths
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v2 = [(HPSAccessorySettingService *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HPSAccessorySettingService_keyPaths__block_invoke;
  v7[3] = &unk_264E89C40;
  void v7[4] = &v8;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__HPSAccessorySettingService_keyPaths__block_invoke_428;
  v6[3] = &unk_264E89D80;
  void v6[4] = &v8;
  [v3 getKeyPathsWithCompletionHandler:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v4;
}

void __38__HPSAccessorySettingService_keyPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__HPSAccessorySettingService_keyPaths__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA78];
}

void __38__HPSAccessorySettingService_keyPaths__block_invoke_428(uint64_t a1, void *a2)
{
}

- (NSDictionary)heldAssertions
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v2 = [(HPSAccessorySettingService *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HPSAccessorySettingService_heldAssertions__block_invoke;
  v7[3] = &unk_264E89C40;
  void v7[4] = &v8;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HPSAccessorySettingService_heldAssertions__block_invoke_429;
  v6[3] = &unk_264E89D80;
  void v6[4] = &v8;
  [v3 heldAssertionsWithCompletionHandler:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v4;
}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__HPSAccessorySettingService_heldAssertions__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA78];
}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke_429(uint64_t a1, void *a2)
{
}

- (id)keyPathsAvailability
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v2 = [(HPSAccessorySettingService *)self xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke;
  v7[3] = &unk_264E89C40;
  void v7[4] = &v8;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_430;
  v6[3] = &unk_264E89D80;
  void v6[4] = &v8;
  [v3 getKeyPathsAvailabilityWithCompletionHandler:v6];

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA78];
}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_430(uint64_t a1, void *a2)
{
}

- (BOOL)hasOptedToHH2
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v2 = [(HPSAccessorySettingService *)self xpcConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke;
  v6[3] = &unk_264E89C40;
  void v6[4] = &v7;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke_2;
  v5[3] = &unk_264E89DA8;
  v5[4] = &v7;
  [v3 optedToHH2WithCompletionHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)optedToHH2WithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HPSAccessorySettingService *)self xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke;
  v8[3] = &unk_264E89940;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 optedToHH2WithCompletionHandler:v6];
}

void __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HPSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)overrideOptedToHH2State:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HPSAccessorySettingService *)self xpcConnection];
  id v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_433];
  [v4 overrideOptedToHH2State:v3];
}

void __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke_cold_1();
  }
}

- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 description];
    char v10 = [v6 keyPath];
    int v13 = 136315650;
    id v14 = "-[HPSAccessorySettingService notifyDidUpdateSetting:forKeyPath:]";
    __int16 v15 = 2112;
    long long v16 = v9;
    __int16 v17 = 2112;
    long long v18 = v10;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_DEFAULT, "%s Notify Setting %@ updated for keyPath %@ ", (uint8_t *)&v13, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v6)
    {
      id v12 = +[HPSHomeKitSettingHelper compatibleReadSetting:v6];
    }
    else
    {
      id v12 = 0;
    }
    [WeakRetained didUpdateSetting:v12 forKeyPath:v7];
  }
}

- (void)_handleConnectionInterrupted
{
}

- (HPSAccessorySettingServiceConnectionProvider)provider
{
  return self->_provider;
}

- (HPSAccessorySettingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HPSAccessorySettingServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (int)notifyRegisterToken
{
  return self->_notifyRegisterToken;
}

- (void)setNotifyRegisterToken:(int)a3
{
  self->_notifyRegisterToken = a3;
}

- (BOOL)isMigrationToHH2Complete
{
  return self->_migrationToHH2Complete;
}

- (void)setMigrationToHH2Complete:(BOOL)a3
{
  self->_migrationToHH2Complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_392_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__HPSAccessorySettingService_startXPCConnection__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_23D144000, a2, OS_LOG_TYPE_ERROR, "Failed to start Connection. Error = %@", (uint8_t *)&v4, 0xCu);
}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_23D144000, a2, v4, "%s Error %@", (uint8_t *)v5);
}

void __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __38__HPSAccessorySettingService_keyPaths__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

void __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_23D144000, v0, v1, "%s Error %@", v2, v3, v4, v5, 2u);
}

@end