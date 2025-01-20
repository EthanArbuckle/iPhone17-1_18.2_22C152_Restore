@interface CLKWatchFaceLibraryServer
+ (id)sharedInstance;
- (void)_clearConnection;
- (void)_queue_setupConnectionIfNeeded;
- (void)dealloc;
- (void)openWatchFaceURLWithBookmarkData:(id)a3 sourceApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)validateFaceType:(id)a3 faceBundleId:(id)a4 completionHandler:(id)a5;
@end

@implementation CLKWatchFaceLibraryServer

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CLKWatchFaceLibraryServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedServer;

  return v2;
}

uint64_t __43__CLKWatchFaceLibraryServer_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance___sharedServer = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(CLKWatchFaceLibraryServer *)self _clearConnection];
  v3.receiver = self;
  v3.super_class = (Class)CLKWatchFaceLibraryServer;
  [(CLKWatchFaceLibraryServer *)&v3 dealloc];
}

- (void)_queue_setupConnectionIfNeeded
{
  if (!self->_connection)
  {
    objc_super v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.ClockKit.CLKWatchFaceLibrary"];
    connection = self->_connection;
    self->_connection = v3;

    v5 = self->_connection;
    v6 = CLKWatchFaceLibraryServerInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v7 = self->_connection;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __59__CLKWatchFaceLibraryServer__queue_setupConnectionIfNeeded__block_invoke;
    v11 = &unk_26440DAC8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:&v8];
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &__block_literal_global_0, v8, v9, v10, v11);
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __59__CLKWatchFaceLibraryServer__queue_setupConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)openWatchFaceURLWithBookmarkData:(id)a3 sourceApplicationBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CLKWatchFaceLibraryServer *)self _queue_setupConnectionIfNeeded];
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_26440DAF0;
  id v15 = v8;
  id v12 = v8;
  v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 openWatchFaceURLWithBookmarkData:v10 sourceApplicationBundleIdentifier:v9 completionHandler:v12];
}

void __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CLKLoggingObjectForDomain(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validateFaceType:(id)a3 faceBundleId:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(CLKWatchFaceLibraryServer *)self _queue_setupConnectionIfNeeded];
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke;
  v14[3] = &unk_26440DAF0;
  id v15 = v8;
  id v12 = v8;
  v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  [v13 validateFaceType:v10 faceBundleId:v9 completionHandler:v12];
}

void __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = CLKLoggingObjectForDomain(9);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __114__CLKWatchFaceLibraryServer_openWatchFaceURLWithBookmarkData_sourceApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "openWatchFaceURLWithBookmarkData: Error: %@", (uint8_t *)&v2, 0xCu);
}

void __77__CLKWatchFaceLibraryServer_validateFaceType_faceBundleId_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "validateFaceType: faceBundleId: Error: %@", (uint8_t *)&v2, 0xCu);
}

@end