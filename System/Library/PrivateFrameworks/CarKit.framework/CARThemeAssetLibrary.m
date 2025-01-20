@interface CARThemeAssetLibrary
- (CARThemeAssetLibrary)initWithVehicle:(id)a3;
- (CARThemeAssetLibraryObserverProxy)observerProxy;
- (NSString)assetIdentifier;
- (NSUUID)vehicleIdentifier;
- (NSXPCConnection)serviceConnection;
- (OS_dispatch_queue)queue;
- (id)_setupServiceConnection;
- (void)_queue_applyOverrideAsset:(id)a3;
- (void)_queue_findCurrentAssetWithCompletion:(id)a3;
- (void)_queue_startObserving;
- (void)_queue_stopObserving;
- (void)addObserver:(id)a3;
- (void)findCurrentAssetWithCompletion:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation CARThemeAssetLibrary

- (CARThemeAssetLibrary)initWithVehicle:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CARThemeAssetLibrary;
  v5 = [(CARThemeAssetLibrary *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    vehicleIdentifier = v5->_vehicleIdentifier;
    v5->_vehicleIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 clusterAssetIdentifier];
    assetIdentifier = v5->_assetIdentifier;
    v5->_assetIdentifier = (NSString *)v8;

    if (!v5->_assetIdentifier)
    {
      v10 = CarThemeAssetsLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CARThemeAssetLibrary initWithVehicle:]();
      }
    }
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.carkit.theme_asset_library", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_alloc_init(CARThemeAssetLibraryObserverProxy);
    observerProxy = v5->_observerProxy;
    v5->_observerProxy = v14;

    [(CARThemeAssetLibraryObserverProxy *)v5->_observerProxy setAssetLibrary:v5];
    uint64_t v16 = [(CARThemeAssetLibrary *)v5 _setupServiceConnection];
    serviceConnection = v5->_serviceConnection;
    v5->_serviceConnection = (NSXPCConnection *)v16;

    v18 = [(CARThemeAssetLibrary *)v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__CARThemeAssetLibrary_initWithVehicle___block_invoke;
    block[3] = &unk_1E5E3A938;
    v21 = v5;
    dispatch_async(v18, block);
  }
  return v5;
}

uint64_t __40__CARThemeAssetLibrary_initWithVehicle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startObserving");
}

- (void)invalidate
{
  v3 = [(CARThemeAssetLibrary *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CARThemeAssetLibrary_invalidate__block_invoke;
  block[3] = &unk_1E5E3A938;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __34__CARThemeAssetLibrary_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_stopObserving");
  id v2 = [*(id *)(a1 + 32) serviceConnection];
  [v2 invalidate];
}

- (id)_setupServiceConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.theme-asset-library" options:4096];
  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03197A0];
  [v3 setRemoteObjectInterface:v4];
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F031AA58];
  [v3 setExportedInterface:v5];
  uint64_t v6 = [(CARThemeAssetLibrary *)self observerProxy];
  [v3 setExportedObject:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke;
  v10[3] = &unk_1E5E3A938;
  v10[4] = self;
  [v3 setInterruptionHandler:v10];
  [v3 setInvalidationHandler:&__block_literal_global_6];
  v7 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit theme asset library service", v9, 2u);
  }

  [v3 resume];
  return v3;
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke(uint64_t a1)
{
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_cold_1(v2);
  }

  v3 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_87;
  block[3] = &unk_1E5E3A938;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_87(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerProxy];
  v3 = [v2 observers];
  int v4 = [v3 hasObservers];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_queue_startObserving");
  }
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2()
{
  v0 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2_cold_1(v0);
  }
}

- (void)findCurrentAssetWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(CARThemeAssetLibrary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CARThemeAssetLibrary_findCurrentAssetWithCompletion___block_invoke;
  v7[3] = &unk_1E5E3AC38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__CARThemeAssetLibrary_findCurrentAssetWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_findCurrentAssetWithCompletion:", *(void *)(a1 + 40));
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(CARThemeAssetLibrary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CARThemeAssetLibrary_addObserver___block_invoke;
  v7[3] = &unk_1E5E3A800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __36__CARThemeAssetLibrary_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerProxy];
  v3 = [v2 observers];
  char v4 = [v3 hasObservers];

  v5 = [*(id *)(a1 + 32) observerProxy];
  id v6 = [v5 observers];
  [v6 registerObserver:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_queue_startObserving");
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(CARThemeAssetLibrary *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CARThemeAssetLibrary_removeObserver___block_invoke;
  v7[3] = &unk_1E5E3A800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__CARThemeAssetLibrary_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observerProxy];
  v3 = [v2 observers];
  int v4 = [v3 hasObservers];

  v5 = [*(id *)(a1 + 32) observerProxy];
  id v6 = [v5 observers];
  [v6 unregisterObserver:*(void *)(a1 + 40)];

  if (v4)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_queue_stopObserving");
  }
}

- (void)_queue_findCurrentAssetWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CARThemeAssetLibrary *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CARThemeAssetLibrary *)self vehicleIdentifier];
  v7 = [(CARThemeAssetLibrary *)self assetIdentifier];
  id v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "findCurrentAsset vehicleID: %@ assetID: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    v9 = [(CARThemeAssetLibrary *)self serviceConnection];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke;
    v15[3] = &unk_1E5E3AC60;
    v15[4] = self;
    id v10 = v4;
    id v16 = v10;
    v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_89;
    v12[3] = &unk_1E5E3ACB0;
    v12[4] = self;
    id v13 = v7;
    id v14 = v10;
    objc_msgSend(v11, "service_currentAssetsForVehicleIdentifier:reply:", v6, v12);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5E3AC38;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_89(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_90;
  block[3] = &unk_1E5E3AC88;
  id v13 = v5;
  id v14 = v6;
  id v8 = a1[5];
  id v9 = a1[4];
  id v15 = v8;
  id v16 = v9;
  id v17 = a1[6];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_90(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v18 = 138543618;
    id v19 = v3;
    __int16 v20 = 2114;
    uint64_t v21 = v4;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "_currentAssetForVehicleIdentifier active asset: %{public}@, stagedAsset: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  if (!v5) {
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;
  uint64_t v7 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "latest asset in asset library: %@", (uint8_t *)&v18, 0xCu);
  }

  if (v6)
  {
    id v8 = [v6 version];
  }
  else
  {
    id v8 = [[CARThemeAssetVersion alloc] initWithIdentifier:*(void *)(a1 + 48) iOSContentVersion:@"0" accessoryContentVersion:&unk_1F0318050];
  }
  id v9 = v8;
  id v10 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "checking for override asset", (uint8_t *)&v18, 2u);
  }

  id v11 = +[CARThemeAssetOverrider overrideAssetNewerThanAssetVersion:v9];
  if (v11)
  {
    dispatch_queue_t v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, "prepared override asset %@", (uint8_t *)&v18, 0xCu);
    }

    id v13 = v11;
    objc_msgSend(*(id *)(a1 + 56), "_queue_applyOverrideAsset:", v13);
    id v6 = v13;
  }
  id v14 = *(void **)(a1 + 32);
  if (!v14) {
    id v14 = v6;
  }
  id v15 = v14;
  id v16 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v15;
    _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_INFO, "_currentAssetForVehicleIdentifier using asset %@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
  }
}

- (void)_queue_applyOverrideAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(CARThemeAssetLibrary *)self queue];
  dispatch_assert_queue_V2(v5);

  id v8 = [(CARThemeAssetLibrary *)self serviceConnection];
  id v6 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_99];
  uint64_t v7 = [(CARThemeAssetLibrary *)self vehicleIdentifier];
  objc_msgSend(v6, "service_applyOverrideAsset:forVehicleIdentifier:reply:", v4, v7, &__block_literal_global_102);
}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();
  }
}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_100()
{
  v0 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEFAULT, "applied override asset", v1, 2u);
  }
}

- (void)_queue_startObserving
{
  uint64_t v3 = [(CARThemeAssetLibrary *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(CARThemeAssetLibrary *)self serviceConnection];
  id v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_104];
  objc_msgSend(v4, "service_startObservingWithReply:", &__block_literal_global_107);
}

void __45__CARThemeAssetLibrary__queue_startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();
  }
}

void __45__CARThemeAssetLibrary__queue_startObserving__block_invoke_105()
{
  v0 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEFAULT, "started observing theme asset library", v1, 2u);
  }
}

- (void)_queue_stopObserving
{
  uint64_t v3 = [(CARThemeAssetLibrary *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(CARThemeAssetLibrary *)self serviceConnection];
  id v4 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_109];
  objc_msgSend(v4, "service_stopObservingWithReply:", &__block_literal_global_112);
}

void __44__CARThemeAssetLibrary__queue_stopObserving__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1();
  }
}

void __44__CARThemeAssetLibrary__queue_stopObserving__block_invoke_110()
{
  v0 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB00000, v0, OS_LOG_TYPE_DEFAULT, "stopped observing theme asset library", v1, 2u);
  }
}

- (NSUUID)vehicleIdentifier
{
  return self->_vehicleIdentifier;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CARThemeAssetLibraryObserverProxy)observerProxy
{
  return self->_observerProxy;
}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_observerProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
}

- (void)initWithVehicle:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "no clusterAssetIdentifier for vehicle %@", v2, v3, v4, v5, v6);
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "interrupted connection to CARThemeAssetService", v1, 2u);
}

void __47__CARThemeAssetLibrary__setupServiceConnection__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "invalidated connection to CARThemeAssetService", v1, 2u);
}

void __62__CARThemeAssetLibrary__queue_findCurrentAssetWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__CARThemeAssetLibrary__queue_applyOverrideAsset___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "failed to connect to theme asset library service %@", v2, v3, v4, v5, v6);
}

@end