@interface BCSConfigurationManager
- (NSXPCConnection)serviceConnection;
- (void)processAppClipImageWithURL:(id)a3 scale:(double)a4 completion:(id)a5;
- (void)setServiceConnection:(id)a3;
- (void)setUpQRCodeControlCenterModuleWithCompletionHandler:(id)a3;
@end

@implementation BCSConfigurationManager

- (void)setUpQRCodeControlCenterModuleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(BCSConfigurationManager *)self serviceConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke;
  v11[3] = &unk_26468B388;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_1;
  v9[3] = &unk_26468B3B0;
  id v10 = v6;
  id v8 = v6;
  [v7 setUpQRCodeControlCenterModuleWithReply:v9];
}

void __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_cold_1(v3);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
}

uint64_t __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSXPCConnection)serviceConnection
{
  serviceConnection = self->_serviceConnection;
  if (serviceConnection)
  {
    id v3 = serviceConnection;
  }
  else
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.BarcodeSupport.Helper"];
    id v6 = self->_serviceConnection;
    self->_serviceConnection = v5;

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D61CB90];
    [(NSXPCConnection *)self->_serviceConnection setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __44__BCSConfigurationManager_serviceConnection__block_invoke;
    id v12 = &unk_26468B110;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_serviceConnection setInvalidationHandler:&v9];
    [(NSXPCConnection *)self->_serviceConnection resume];
    id v3 = self->_serviceConnection;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __44__BCSConfigurationManager_serviceConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServiceConnection:0];
}

- (void)processAppClipImageWithURL:(id)a3 scale:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(BCSConfigurationManager *)self serviceConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke;
  v16[3] = &unk_26468B388;
  id v11 = v8;
  id v17 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_52;
  v14[3] = &unk_26468B3D8;
  id v15 = v11;
  id v13 = v11;
  [v12 processAppClipImageWithURL:v9 scale:v14 reply:a4];
}

void __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_cold_1((uint64_t)v3);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

uint64_t __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_52(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __79__BCSConfigurationManager_setUpQRCodeControlCenterModuleWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  id v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSConfigurationManager: Error getting remote object proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __71__BCSConfigurationManager_processAppClipImageWithURL_scale_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSConfigurationManager: Error getting remote object proxy: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end