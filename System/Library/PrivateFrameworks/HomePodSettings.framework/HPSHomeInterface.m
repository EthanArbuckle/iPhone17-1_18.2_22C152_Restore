@interface HPSHomeInterface
+ (id)connectionError;
- (BOOL)connectionValid;
- (HPSHomeInterface)initWithDelegate:(id)a3;
- (HPSettingsConnectionInterfaceDelegate)delegate;
- (NSXPCConnection)hpsConnection;
- (void)_accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4;
- (void)dealloc;
- (void)getAirPlaySettings:(id)a3;
- (void)getCurrentHomeAttribute:(id)a3 completion:(id)a4;
- (void)getHomeAccessoryAttribute:(id)a3 completion:(id)a4;
- (void)getHomeKitCachedSettings:(id)a3;
- (void)handleConnectionInterrupted;
- (void)handleConnectionInvalidated;
- (void)isAutomaticSoftwareUpdateEnabled:(id)a3;
- (void)isHomeKitSyncComplete:(id)a3;
- (void)setConnectionValid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHpsConnection:(id)a3;
- (void)startConnection;
@end

@implementation HPSHomeInterface

- (HPSHomeInterface)initWithDelegate:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id obj = a3;
  v31.receiver = self;
  v31.super_class = (Class)HPSHomeInterface;
  v4 = [(HPSHomeInterface *)&v31 init];
  if (v4)
  {
    v5 = _HPSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[HPSHomeInterface initWithDelegate:]";
      _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v4->_delegate, obj);
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.homepodsettings.server" options:4096];
    hpsConnection = v4->_hpsConnection;
    v4->_hpsConnection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F107B20];
    [(NSXPCConnection *)v4->_hpsConnection setRemoteObjectInterface:v8];

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0FABA8];
    [(NSXPCConnection *)v4->_hpsConnection setExportedInterface:v9];

    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v25, "setWithObjects:", v24, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v19 = [(NSXPCConnection *)v4->_hpsConnection remoteObjectInterface];
    [v19 setClasses:v18 forSelector:sel_getHomeKitCachedSettings_ argumentIndex:0 ofReply:1];

    objc_initWeak((id *)buf, v4);
    v20 = v4->_hpsConnection;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __37__HPSHomeInterface_initWithDelegate___block_invoke;
    v29[3] = &unk_264E898F8;
    objc_copyWeak(&v30, (id *)buf);
    [(NSXPCConnection *)v20 setInterruptionHandler:v29];
    v21 = v4->_hpsConnection;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __37__HPSHomeInterface_initWithDelegate___block_invoke_341;
    v27[3] = &unk_264E898F8;
    objc_copyWeak(&v28, (id *)buf);
    [(NSXPCConnection *)v21 setInvalidationHandler:v27];
    v4->_connectionValid = v4->_hpsConnection != 0;
    v22 = [[HPSHomeInterfaceMediator alloc] initWithInterface:v4];
    [(NSXPCConnection *)v4->_hpsConnection setExportedObject:v22];
    [(NSXPCConnection *)v4->_hpsConnection resume];
    [(HPSHomeInterface *)v4 startConnection];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  return v4;
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__HPSHomeInterface_initWithDelegate___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInterrupted];
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_341(uint64_t a1)
{
  v2 = _HPSLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__HPSHomeInterface_initWithDelegate___block_invoke_341_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInvalidated];
}

- (void)startConnection
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _HPSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[HPSHomeInterface startConnection]";
    _os_log_impl(&dword_23D144000, v3, OS_LOG_TYPE_DEFAULT, "%s Invoked on HPSHomeInterface XPCClient!", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(NSXPCConnection *)self->_hpsConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  [v4 startConnection];
}

void __35__HPSHomeInterface_startConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _HPSLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __35__HPSHomeInterface_startConnection__block_invoke_cold_1(v2);
    }
  }
}

- (void)getHomeAccessoryAttribute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    hpsConnection = self->_hpsConnection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke;
    v22[3] = &unk_264E89940;
    uint64_t v10 = v7;
    v23 = v10;
    uint64_t v11 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_344;
    v20[3] = &unk_264E89968;
    v21 = v10;
    [v11 getHomeAccessoryAttribute:v6 completion:v20];

    uint64_t v12 = v23;
  }
  else
  {
    uint64_t v12 = _HPSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface getHomeAccessoryAttribute:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_344(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAirPlaySettings:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __39__HPSHomeInterface_getAirPlaySettings___block_invoke;
    v19[3] = &unk_264E89940;
    id v7 = v4;
    v20 = v7;
    uint64_t v8 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__HPSHomeInterface_getAirPlaySettings___block_invoke_346;
    v17[3] = &unk_264E89990;
    uint64_t v18 = v7;
    [v8 getAirPlaySettings:v17];

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface getAirPlaySettings:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __39__HPSHomeInterface_getAirPlaySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__HPSHomeInterface_getAirPlaySettings___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __39__HPSHomeInterface_getAirPlaySettings___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getHomeKitCachedSettings:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke;
    v19[3] = &unk_264E89940;
    id v7 = v4;
    v20 = v7;
    uint64_t v8 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_348;
    v17[3] = &unk_264E89990;
    uint64_t v18 = v7;
    [v8 getHomeKitCachedSettings:v17];

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface getHomeKitCachedSettings:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_348(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isHomeKitSyncComplete:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke;
    v19[3] = &unk_264E89940;
    id v7 = v4;
    v20 = v7;
    uint64_t v8 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_349;
    v17[3] = &unk_264E899B8;
    uint64_t v18 = v7;
    [v8 isHomeKitSyncComplete:v17];

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface isHomeKitSyncComplete:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_349(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isAutomaticSoftwareUpdateEnabled:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    hpsConnection = self->_hpsConnection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke;
    v19[3] = &unk_264E89940;
    id v7 = v4;
    v20 = v7;
    uint64_t v8 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_351;
    v17[3] = &unk_264E899B8;
    uint64_t v18 = v7;
    [v8 isAutomaticSoftwareUpdateEnabled:v17];

    uint64_t v9 = v20;
  }
  else
  {
    uint64_t v9 = _HPSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface isAutomaticSoftwareUpdateEnabled:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_351(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentHomeAttribute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    hpsConnection = self->_hpsConnection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke;
    v22[3] = &unk_264E89940;
    uint64_t v10 = v7;
    v23 = v10;
    uint64_t v11 = [(NSXPCConnection *)hpsConnection remoteObjectProxyWithErrorHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_352;
    v20[3] = &unk_264E89968;
    v21 = v10;
    [v11 getCurrentHomeAttribute:v6 completion:v20];

    uint64_t v12 = v23;
  }
  else
  {
    uint64_t v12 = _HPSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface getCurrentHomeAttribute:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_352(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)connectionError
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = @"Connection Error";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.homepodsettings" code:0 userInfo:v3];

  return v4;
}

- (void)handleConnectionInvalidated
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D144000, log, OS_LOG_TYPE_ERROR, "Connection delegate is null", v1, 2u);
}

- (void)handleConnectionInterrupted
{
  id v3 = [(HPSHomeInterface *)self delegate];

  if (v3)
  {
    id v5 = [(HPSHomeInterface *)self delegate];
    [v5 connectionInterrupted];
  }
  else
  {
    id v4 = _HPSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HPSHomeInterface handleConnectionInvalidated](v4);
    }
  }
}

- (void)_accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4
{
  v66[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.homepodsettings.HPHomeKitSetupComplete"])
  {
    id v52 = 0;
    id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v52];
    id v8 = v52;
    if (v8)
    {
      uint64_t v9 = _HPSLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[HPSHomeInterface _accessoryDidUpdateAttribute:withContext:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
      v65[0] = @"hasValidHome";
      v32 = objc_msgSend(NSNumber, "numberWithBool:", -[__CFString hasValidHomeLoaded](v7, "hasValidHomeLoaded"));
      v66[0] = v32;
      v65[1] = @"OTAEnabled";
      v33 = objc_msgSend(NSNumber, "numberWithBool:", -[__CFString isAutoSUEnabled](v7, "isAutoSUEnabled"));
      v66[1] = v33;
      v65[2] = @"mediaPeerToPeerEnabled";
      uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[__CFString isMediaPeerToPeerEnabled](v7, "isMediaPeerToPeerEnabled"));
      v66[2] = v34;
      v65[3] = @"minimumMediaUserPrivilege";
      v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString minimumMediaUserPrivilege](v7, "minimumMediaUserPrivilege"));
      v66[3] = v35;
      v36 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
      [v9 postNotificationName:@"com.apple.homepodsettings.HPHomeKitSetupComplete" object:0 userInfo:v36];
    }
    goto LABEL_50;
  }
  if (![v5 isEqualToString:@"com.apple.homepodsettings.deviceReset"])
  {
    if ([v5 isEqualToString:@"com.apple.homepodsettings.airplayP2PAccess"])
    {
      objc_opt_class();
      id v23 = v6;
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      id v25 = v24;

      v26 = (void *)MEMORY[0x263EFFA80];
      if (v25) {
        v26 = v25;
      }
      v27 = v26;

      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      id v28 = @"com.apple.homepodsettings.airplayP2PAccess";
      v61 = @"mediaPeerToPeerEnabled";
      v62 = v27;
      v29 = NSDictionary;
      id v30 = &v62;
      objc_super v31 = &v61;
    }
    else if ([v5 isEqualToString:@"com.apple.homepodsettings.accessoryMoved"])
    {
      objc_opt_class();
      id v37 = v6;
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      v39 = v38;

      v40 = &stru_26F0EFD70;
      if (v39) {
        v40 = v39;
      }
      v27 = v40;

      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      id v28 = @"com.apple.homepodsettings.accessoryMoved";
      v59 = @"roomName";
      v60 = v27;
      v29 = NSDictionary;
      id v30 = &v60;
      objc_super v31 = &v59;
    }
    else if ([v5 isEqualToString:@"com.apple.homepodsettings.airplaySetPassword"])
    {
      objc_opt_class();
      id v43 = v6;
      if (objc_opt_isKindOfClass()) {
        v44 = v43;
      }
      else {
        v44 = 0;
      }
      v45 = v44;

      v46 = &stru_26F0EFD70;
      if (v45) {
        v46 = v45;
      }
      v27 = v46;

      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      id v28 = @"com.apple.homepodsettings.airplaySetPassword";
      v57 = @"airplayPassword";
      v58 = v27;
      v29 = NSDictionary;
      id v30 = &v58;
      objc_super v31 = &v57;
    }
    else
    {
      if (![v5 isEqualToString:@"com.apple.homepodsettings.airplayMinUserPrivilege"])
      {
        if (![v5 isEqualToString:@"com.apple.homepodsettings.autoSUModified"]) {
          goto LABEL_51;
        }
        uint64_t v51 = [v6 BOOLValue];
        id v8 = [MEMORY[0x263F08A00] defaultCenter];
        v53 = @"OTAEnabled";
        id v7 = [NSNumber numberWithBool:v51];
        v54 = v7;
        v41 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        [v8 postNotificationName:@"com.apple.homepodsettings.autoSUModified" object:0 userInfo:v41];
        goto LABEL_34;
      }
      objc_opt_class();
      id v47 = v6;
      if (objc_opt_isKindOfClass()) {
        v48 = v47;
      }
      else {
        v48 = 0;
      }
      id v49 = v48;

      v50 = &unk_26F0F86F8;
      if (v49) {
        v50 = v49;
      }
      v27 = v50;

      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      id v28 = @"com.apple.homepodsettings.airplayMinUserPrivilege";
      v55 = @"minimumMediaUserPrivilege";
      v56 = v27;
      v29 = NSDictionary;
      id v30 = &v56;
      objc_super v31 = &v55;
    }
    id v7 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];

    [v8 postNotificationName:v28 object:0 userInfo:v7];
    goto LABEL_50;
  }
  objc_opt_class();
  id v16 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  id v8 = v17;

  if (v8)
  {
    objc_opt_class();
    uint64_t v18 = [v8 objectForKeyedSubscript:@"device_reset_method"];
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = v19;
    v21 = v20;
    v22 = &stru_26F0EFD70;
    if (v20) {
      v22 = v20;
    }
    id v7 = v22;
  }
  else
  {
    id v7 = &stru_26F0EFD70;
  }
  v41 = [MEMORY[0x263F08A00] defaultCenter];
  v63 = @"device_reset_method";
  v64 = v7;
  v42 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  [v41 postNotificationName:@"com.apple.homepodsettings.deviceReset" object:0 userInfo:v42];

LABEL_34:
LABEL_50:

LABEL_51:
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id v3 = [(HPSHomeInterface *)self hpsConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)HPSHomeInterface;
  [(HPSHomeInterface *)&v4 dealloc];
}

- (HPSettingsConnectionInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HPSettingsConnectionInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)hpsConnection
{
  return self->_hpsConnection;
}

- (void)setHpsConnection:(id)a3
{
}

- (BOOL)connectionValid
{
  return self->_connectionValid;
}

- (void)setConnectionValid:(BOOL)a3
{
  self->_connectionValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpsConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__HPSHomeInterface_initWithDelegate___block_invoke_341_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __35__HPSHomeInterface_startConnection__block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)getHomeAccessoryAttribute:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__HPSHomeInterface_getHomeAccessoryAttribute_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)getAirPlaySettings:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__HPSHomeInterface_getAirPlaySettings___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)getHomeKitCachedSettings:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__HPSHomeInterface_getHomeKitCachedSettings___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)isHomeKitSyncComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__HPSHomeInterface_isHomeKitSyncComplete___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)isAutomaticSoftwareUpdateEnabled:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__HPSHomeInterface_isAutomaticSoftwareUpdateEnabled___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)getCurrentHomeAttribute:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__HPSHomeInterface_getCurrentHomeAttribute_completion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23D144000, v2, v3, "%s Error..%@", v4, v5, v6, v7, 2u);
}

- (void)_accessoryDidUpdateAttribute:(uint64_t)a3 withContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end