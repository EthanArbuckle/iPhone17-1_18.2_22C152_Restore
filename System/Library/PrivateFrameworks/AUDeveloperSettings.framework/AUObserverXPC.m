@interface AUObserverXPC
+ (id)xpcConnectionToDaemon;
+ (void)xpcConnectionToDaemon;
- (AUObserverXPC)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)remoteObject;
- (void)addAccessoryID:(id)a3 assetID:(id)a4;
- (void)clearDropboxForModelNumber:(id)a3 withFusing:(id)a4;
- (void)dealloc;
- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)registerClient:(id)a3;
- (void)removeAccessoryID:(id)a3;
- (void)removeObserver;
- (void)settingsChangedForSerialNumber:(id)a3;
- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)stopMonitoring;
- (void)unregisterClient;
@end

@implementation AUObserverXPC

- (AUObserverXPC)init
{
  v16.receiver = self;
  v16.super_class = (Class)AUObserverXPC;
  v2 = [(AUObserverXPC *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 bundleIdentifier];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F08D88] anonymousListener];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v9;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
    v11 = [(AUObserverXPC *)v2 remoteObject];
    v12 = v2->_uuid;
    v13 = [(NSXPCListener *)v2->_xpcListener endpoint];
    [v11 addObserver:v12 withEndpoint:v13];

    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = 0;
  }
  return v2;
}

- (void)dealloc
{
  [(AUObserverXPC *)self removeObserver];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AUObserverXPC;
  [(AUObserverXPC *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_264838E50;
  id v10 = v5;
  v11 = self;
  v12 = &v13;
  id v7 = v5;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)internalQueue;
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DCD7808];
  [*(id *)(a1 + 32) setExportedInterface:v2];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
  LODWORD(v2) = [*(id *)(a1 + 32) processIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2;
  v6[3] = &__block_descriptor_36_e5_v8__0l;
  int v7 = (int)v2;
  [*(id *)(a1 + 32) setInterruptionHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_60;
  v4[3] = &__block_descriptor_36_e5_v8__0l;
  int v5 = (int)v2;
  [*(id *)(a1 + 32) setInvalidationHandler:v4];
  [*(id *)(a1 + 32) _setQueue:*(void *)(*(void *)(a1 + 40) + 24)];
  [*(id *)(a1 + 32) resume];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) processIdentifier];
    *(_DWORD *)buf = 67109120;
    int v9 = v3;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "New connection from PID %d", buf, 8u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(a1);
  }
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_60(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v2 = *(_DWORD *)(a1 + 32);
    v3[0] = 67109120;
    v3[1] = v2;
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "Connection from PID %d invalidated", (uint8_t *)v3, 8u);
  }
}

- (id)remoteObject
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = +[AUObserverXPC xpcConnectionToDaemon];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  int v5 = self->_xpcConnection;
  if (v5)
  {
    id v6 = [(NSXPCConnection *)v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "-[AUObserverXPC remoteObject]";
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: remoteObject: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __29__AUObserverXPC_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __29__AUObserverXPC_remoteObject__block_invoke_cold_1(a2);
  }
}

+ (id)xpcConnectionToDaemon
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.accessoryupdater.observer" options:4096];
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v3) {
      +[AUObserverXPC xpcConnectionToDaemon]();
    }
    uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DCF84B0];
    [v2 setRemoteObjectInterface:v4];
    [v2 resume];
    id v5 = v2;
  }
  else if (v3)
  {
    +[AUObserverXPC xpcConnectionToDaemon]();
  }

  return v2;
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__AUObserverXPC_registerClient___block_invoke;
  v7[3] = &unk_264838E98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __32__AUObserverXPC_registerClient___block_invoke(uint64_t a1)
{
}

- (void)unregisterClient
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__AUObserverXPC_unregisterClient__block_invoke;
  block[3] = &unk_264838EC0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __33__AUObserverXPC_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)stopMonitoring
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__AUObserverXPC_stopMonitoring__block_invoke;
  block[3] = &unk_264838EC0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __31__AUObserverXPC_stopMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver];
}

- (void)removeObserver
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[AUObserverXPC removeObserver]";
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }
  BOOL v3 = [(AUObserverXPC *)self remoteObject];
  [v3 removeObserver:self->_uuid];

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)clearDropboxForModelNumber:(id)a3 withFusing:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[AUObserverXPC clearDropboxForModelNumber:withFusing:]";
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(AUObserverXPC *)self remoteObject];
  [v6 clearDropboxForModelNumber:v5 withFusing:0];
}

- (void)settingsChangedForSerialNumber:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "-[AUObserverXPC settingsChangedForSerialNumber:]";
    _os_log_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(AUObserverXPC *)self remoteObject];
  [v5 settingsChangedForSerialNumber:v4];
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__AUObserverXPC_addAccessoryID_assetID___block_invoke;
  block[3] = &unk_264838EE8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

void *__40__AUObserverXPC_addAccessoryID_assetID___block_invoke(void *result)
{
  if (*(void *)(result[4] + 40)) {
    return (void *)[*(id *)(result[4] + 40) addAccessoryID:result[5] assetID:result[6]];
  }
  return result;
}

- (void)removeAccessoryID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__AUObserverXPC_removeAccessoryID___block_invoke;
  v7[3] = &unk_264838E98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __35__AUObserverXPC_removeAccessoryID___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 40)) {
    return [*(id *)(*(void *)(result + 32) + 40) removeAccessoryID:*(void *)(result + 40)];
  }
  return result;
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__AUObserverXPC_firmwareUpdateProgressForAccessoryID_assetID_bytesSent_bytesTotal___block_invoke;
  block[3] = &unk_264838F10;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a5;
  unint64_t v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(internalQueue, block);
}

void *__83__AUObserverXPC_firmwareUpdateProgressForAccessoryID_assetID_bytesSent_bytesTotal___block_invoke(void *result)
{
  if (*(void *)(result[4] + 40)) {
    return (void *)[*(id *)(result[4] + 40) firmwareUpdateProgressForAccessoryID:result[5] assetID:result[6] bytesSent:result[7] bytesTotal:result[8]];
  }
  return result;
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__AUObserverXPC_stagingCompleteForAccessoryID_assetID_status___block_invoke;
  v13[3] = &unk_264838F38;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalQueue, v13);
}

void *__62__AUObserverXPC_stagingCompleteForAccessoryID_assetID_status___block_invoke(void *result)
{
  if (*(void *)(result[4] + 40)) {
    return (void *)[*(id *)(result[4] + 40) stagingCompleteForAccessoryID:result[5] assetID:result[6] status:result[7]];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredClient, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __52__AUObserverXPC_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 32);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Connection to PID %d interrupted", (uint8_t *)v2, 8u);
}

void __29__AUObserverXPC_remoteObject__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "-[AUObserverXPC remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to get remote object: %@", (uint8_t *)&v1, 0x16u);
}

+ (void)xpcConnectionToDaemon
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "+[AUObserverXPC xpcConnectionToDaemon]";
  _os_log_error_impl(&dword_2283E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Got xpc connection", (uint8_t *)&v0, 0xCu);
}

@end