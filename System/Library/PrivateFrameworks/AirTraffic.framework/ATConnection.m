@interface ATConnection
- (ATConnection)init;
- (ATConnectionDelegate)delegate;
- (BOOL)getDataRestoreIsComplete;
- (BOOL)isSyncing:(BOOL *)a3 automatically:(BOOL *)a4 wirelessly:(BOOL *)a5;
- (id)getAssetMetrics;
- (id)restoreDeviceWithIdentifier:(id)a3;
- (void)_handleDisconnect;
- (void)_sendStatusRegistrationWithCompletion:(id)a3;
- (void)cancelSync;
- (void)clearSyncData;
- (void)connection:(id)a3 updatedAssets:(id)a4;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)connectionWasInterrupted:(id)a3;
- (void)dealloc;
- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3;
- (void)keepATCAlive:(BOOL)a3;
- (void)lowBatteryNotification;
- (void)openDeviceMessageLink;
- (void)openDeviceMessageLinkWithPriority:(int)a3;
- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4;
- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4;
- (void)registerForAssetProgressForDataclass:(id)a3;
- (void)registerForStatus;
- (void)requestKeybagSyncToPairedDevice;
- (void)requestSyncForLibrary:(id)a3;
- (void)requestSyncForPairedDeviceWithPriority:(int)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterForStatus;
@end

@implementation ATConnection

- (void)setDelegate:(id)a3
{
}

uint64_t __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke_146(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __43__ATConnection_connection_updatedProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 connection:*(void *)(a1 + 32) updatedProgress:*(void *)(a1 + 40)];
  }
}

void __41__ATConnection_connection_updatedAssets___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 connection:*(void *)(a1 + 32) updatedAssets:*(void *)(a1 + 40)];
  }
}

- (ATConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATConnectionDelegate *)WeakRetained;
}

- (ATConnection)init
{
  v32.receiver = self;
  v32.super_class = (Class)ATConnection;
  id v2 = [(ATConnection *)&v32 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x263EF83A0];
    id v4 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __20__ATConnection_init__block_invoke;
    handler[3] = &unk_264281180;
    objc_copyWeak(&v30, &location);
    notify_register_dispatch("com.apple.atc.started", &v2->_atcRunningToken, v3, handler);

    uint64_t state64 = 0;
    notify_get_state(v2->_atcRunningToken, &state64);
    if (state64) {
      v2->_atcRunning = 1;
    }
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    registeredDataclasses = v2->_registeredDataclasses;
    v2->_registeredDataclasses = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v7;

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C71A180];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v9];

    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7176F0];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    [v10 setClasses:v16 forSelector:sel_connection_updatedProgress_ argumentIndex:1 ofReply:0];

    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    [v10 setClasses:v19 forSelector:sel_connection_updatedAssets_ argumentIndex:1 ofReply:0];

    [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v10];
    v20 = [MEMORY[0x263F54F60] proxyWithObject:v2 protocol:&unk_26C7176F0];
    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v20];

    v21 = v2->_xpcConnection;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __20__ATConnection_init__block_invoke_106;
    v26[3] = &unk_2642811A8;
    objc_copyWeak(&v27, &location);
    [(NSXPCConnection *)v21 setInterruptionHandler:v26];
    v22 = v2->_xpcConnection;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __20__ATConnection_init__block_invoke_108;
    v24[3] = &unk_2642811A8;
    objc_copyWeak(&v25, &location);
    [(NSXPCConnection *)v22 setInvalidationHandler:v24];
    [(NSXPCConnection *)v2->_xpcConnection resume];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)connection:(id)a3 updatedAssets:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__ATConnection_connection_updatedAssets___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__ATConnection_connection_updatedProgress___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (void)registerForAssetProgressForDataclass:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_registeredDataclasses, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->_registeredDataclasses addObject:v4];
    if (self->_atcRunning) {
      [(ATConnection *)self _sendStatusRegistrationWithCompletion:&__block_literal_global_148];
    }
    else {
      [(ATConnection *)self connection:self updatedAssets:MEMORY[0x263EFFA68]];
    }
  }
}

- (void)_sendStatusRegistrationWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    registeredDataclasses = self->_registeredDataclasses;
    if (self->_registerForStatus) {
      uint64_t v7 = "enabled";
    }
    else {
      uint64_t v7 = "disabled";
    }
    *(_DWORD *)buf = 136315394;
    v19 = v7;
    __int16 v20 = 2114;
    v21 = registeredDataclasses;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "sending async registration %s message, dataclasses %{public}@", buf, 0x16u);
  }

  xpcConnection = self->_xpcConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke;
  v16[3] = &unk_2642811F0;
  id v9 = v4;
  id v17 = v9;
  v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
  v11 = self->_registeredDataclasses;
  uint64_t v12 = [NSNumber numberWithBool:self->_registerForStatus];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke_146;
  v14[3] = &unk_2642811F0;
  id v15 = v9;
  id v13 = v9;
  [v10 registerForStatusOfDataclasses:v11 enabled:v12 withCompletion:v14];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registeredDataclasses, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)connectionWasInterrupted:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ATConnection_connectionWasInterrupted___block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__ATConnection_connectionWasInterrupted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 connectionWasInterrupted:*(void *)(a1 + 32)];
  }
}

- (void)initiateAssetDownloadSessionsWithCompletion:(id)a3
{
  id v4 = a3;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke;
  v11[3] = &unk_2642811F0;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke_2;
  v9[3] = &unk_2642811F0;
  id v10 = v6;
  id v8 = v6;
  [v7 initiateAssetDownloadSessionsWithCompletion:v9];
}

uint64_t __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__ATConnection_initiateAssetDownloadSessionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)getDataRestoreIsComplete
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "check data restore state", buf, 2u);
  }

  id v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_183];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ATConnection_getDataRestoreIsComplete__block_invoke_184;
  v6[3] = &unk_264281288;
  v6[4] = &v8;
  [v4 getDataRestoreIsCompleteWithCompletion:v6];

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

void __40__ATConnection_getDataRestoreIsComplete__block_invoke_184(uint64_t a1, void *a2, char a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_ERROR, "check data restore state failed. err=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __40__ATConnection_getDataRestoreIsComplete__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "check data restore state - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getAssetMetrics
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__1249;
  id v13 = __Block_byref_object_dispose__1250;
  id v14 = 0;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "get asset metrics", buf, 2u);
  }

  int v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_180];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ATConnection_getAssetMetrics__block_invoke_181;
  v7[3] = &unk_264281218;
  v7[4] = &v9;
  [v4 getAssetMetricswithCompletion:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __31__ATConnection_getAssetMetrics__block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_ERROR, "get asset metrics failed. err=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __31__ATConnection_getAssetMetrics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "get asset metrics - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)restoreDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1249;
  id v15 = __Block_byref_object_dispose__1250;
  id v16 = 0;
  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__ATConnection_restoreDeviceWithIdentifier___block_invoke;
  v10[3] = &unk_264281260;
  v10[4] = &v11;
  uint64_t v6 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__ATConnection_restoreDeviceWithIdentifier___block_invoke_2;
  v9[3] = &unk_264281260;
  void v9[4] = &v11;
  [v6 restoreFromDeviceWithIdentifier:v4 completion:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __44__ATConnection_restoreDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

void __44__ATConnection_restoreDeviceWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)openDeviceMessageLinkWithPriority:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = v3;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "Open device message link with priority %d", buf, 8u);
  }

  xpcConnection = self->_xpcConnection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke;
  v10[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  int v11 = v3;
  id v7 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke_178;
  v8[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  int v9 = v3;
  [v7 openDeviceMessageLinkWithPriority:v3 withCompletion:v8];
}

void __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Open device message link with priority %d - failed to obtain remote proxy. err=%{public}@", (uint8_t *)v6, 0x12u);
  }
}

void __50__ATConnection_openDeviceMessageLinkWithPriority___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)(a1 + 32);
      v6[0] = 67109378;
      v6[1] = v5;
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "Open device message link with priority %d failed. err=%{public}@", (uint8_t *)v6, 0x12u);
    }
  }
}

- (void)openDeviceMessageLink
{
}

- (BOOL)isSyncing:(BOOL *)a3 automatically:(BOOL *)a4 wirelessly:(BOOL *)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1249;
  v19 = __Block_byref_object_dispose__1250;
  id v20 = 0;
  id v8 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_165];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke_166;
  v14[3] = &unk_264281218;
  void v14[4] = &v15;
  [v8 getSyncStateWithCompletion:v14];

  if (a3)
  {
    uint64_t v9 = [(id)v16[5] objectForKey:@"Syncing"];
    *a3 = [v9 BOOLValue];
  }
  if (a4)
  {
    uint64_t v10 = [(id)v16[5] objectForKey:@"Automatic"];
    *a4 = [v10 BOOLValue];
  }
  if (a5)
  {
    int v11 = [(id)v16[5] objectForKey:@"Wireless"];
    *a5 = [v11 BOOLValue];
  }
  BOOL v12 = v16[5] != 0;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    __int16 v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_ERROR, "failed to get sync state. err=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

void __51__ATConnection_isSyncing_automatically_wirelessly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "isSyncing - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)keepATCAlive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "keep ATC alive, enabled:%d", (uint8_t *)v7, 8u);
  }

  uint64_t v6 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_160];
  [v6 keepATCAlive:v3 withCompletion:&__block_literal_global_163];
}

void __29__ATConnection_keepATCAlive___block_invoke_161(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "keep ATC alive failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __29__ATConnection_keepATCAlive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "keep ATC alive - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)lowBatteryNotification
{
  BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "low battery notification", v5, 2u);
  }

  int v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_155];
  [v4 lowBatteryNotificationWithCompletion:&__block_literal_global_158];
}

void __38__ATConnection_lowBatteryNotification__block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "low battery notification failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __38__ATConnection_lowBatteryNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "low battery notification - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clearSyncData
{
  BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "clear sync data", v5, 2u);
  }

  int v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_150];
  [v4 clearSyncDataWithCompletion:&__block_literal_global_153];
}

void __29__ATConnection_clearSyncData__block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "clear sync data failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __29__ATConnection_clearSyncData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "clear sync data - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __54__ATConnection__sendStatusRegistrationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "sending async registration - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)unregisterForStatus
{
  if (self->_registerForStatus)
  {
    self->_registerForStatus = 0;
    if (self->_atcRunning) {
      [(ATConnection *)self _sendStatusRegistrationWithCompletion:&__block_literal_global_143];
    }
  }
}

- (void)registerForStatus
{
  if (!self->_registerForStatus)
  {
    self->_registerForStatus = 1;
    if (self->_atcRunning) {
      [(ATConnection *)self _sendStatusRegistrationWithCompletion:&__block_literal_global_141];
    }
  }
}

- (void)purgePartialAsset:(id)a3 forDataclass:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_2164B1000, v8, OS_LOG_TYPE_DEFAULT, "purge partial asset:%{public}@ for data class:%{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_136];
  [v9 purgePartialAsset:v6 forDataclass:v7 withCompletion:&__block_literal_global_139];
}

void __47__ATConnection_purgePartialAsset_forDataclass___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "purge partial asset failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __47__ATConnection_purgePartialAsset_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "purge partial asset - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)prioritizeAsset:(id)a3 forDataclass:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_2164B1000, v8, OS_LOG_TYPE_DEFAULT, "prioritize asset - %{public}@ %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_131];
  [v9 prioritizeAsset:v6 forDataclass:v7 withCompletion:&__block_literal_global_134];
}

void __45__ATConnection_prioritizeAsset_forDataclass___block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "prioritize asset failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __45__ATConnection_prioritizeAsset_forDataclass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "prioritize asset - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)cancelSync
{
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "Cancel sync", v5, 2u);
  }

  int v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_126];
  [v4 cancelSyncWithCompletion:&__block_literal_global_129];
}

void __26__ATConnection_cancelSync__block_invoke_127(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "cancel sync failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __26__ATConnection_cancelSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "cancel sync - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestKeybagSyncToPairedDevice
{
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "requesting keybag sync to paired device", v5, 2u);
  }

  int v4 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_121];
  [v4 requestKeybagSyncToPairedDeviceWithCompletion:&__block_literal_global_124];
}

void __47__ATConnection_requestKeybagSyncToPairedDevice__block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "requesting keybag sync to paired device failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __47__ATConnection_requestKeybagSyncToPairedDevice__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "requesting keybag sync to paired device - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestSyncForPairedDeviceWithPriority:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "sync request for paired device", v7, 2u);
  }

  uint64_t v6 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_116];
  [v6 requestSyncForPairedDeviceWithPriority:v3 withCompletion:&__block_literal_global_119];
}

void __55__ATConnection_requestSyncForPairedDeviceWithPriority___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "request sync for paired device failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __55__ATConnection_requestSyncForPairedDeviceWithPriority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "request sync for paired device - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestSyncForLibrary:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "Sync request for library %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(NSXPCConnection *)self->_xpcConnection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1270];
  [v6 requestSyncForLibrary:v4 withCompletion:&__block_literal_global_114];
}

void __38__ATConnection_requestSyncForLibrary___block_invoke_112(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "request sync for library failed. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __38__ATConnection_requestSyncForLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "request sync for library - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_handleDisconnect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained connectionWasInterrupted:self];
  }
}

- (void)dealloc
{
  int atcRunningToken = self->_atcRunningToken;
  if (atcRunningToken)
  {
    notify_cancel(atcRunningToken);
    self->_int atcRunningToken = 0;
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection invalidate];
    id v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ATConnection;
  [(ATConnection *)&v6 dealloc];
}

void __20__ATConnection_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "Got ATC startup notification", buf, 2u);
    }

    uint64_t state64 = 0;
    uint32_t state = notify_get_state(a2, &state64);
    if (state || !state64)
    {
      int v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        uint32_t v12 = state;
        __int16 v13 = 2048;
        uint64_t v14 = state64;
        _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_DEFAULT, "Error getting state - startupState %u, state %llu", buf, 0x12u);
      }

      WeakRetained[36] = 0;
    }
    else if (WeakRetained[36])
    {
      objc_super v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_DEFAULT, "Not sending status registration", buf, 2u);
      }
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __20__ATConnection_init__block_invoke_2;
      v8[3] = &unk_264281158;
      uint64_t v9 = WeakRetained;
      [v9 _sendStatusRegistrationWithCompletion:v8];
    }
  }
}

void __20__ATConnection_init__block_invoke_106(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_2164B1000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDisconnect];
}

void __20__ATConnection_init__block_invoke_108(uint64_t a1)
{
  id v2 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_2164B1000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDisconnect];
}

void __20__ATConnection_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "sending async registration finished with err=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 36) = 1;
}

@end