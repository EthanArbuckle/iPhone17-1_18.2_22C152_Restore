@interface ASDInstallAttribution
+ (id)interface;
+ (id)sharedInstance;
- (ASDInstallAttribution)init;
- (id)_initWithServiceBroker:(id)a3;
- (void)addInstallAttributionParamsWithConfig:(id)a3;
- (void)addInstallAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
- (void)endImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)registerInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4;
- (void)startGhostFetchTaskWithCompletionHandler:(id)a3;
- (void)startImpressionWithConfig:(id)a3 completionHandler:(id)a4;
- (void)startPingbackTaskWithCompletionHandler:(id)a3;
- (void)updateConversionValueForInstallAttributionPingbackForApp:(id)a3 conversionValue:(id)a4 completionHandler:(id)a5;
- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 completionHandler:(id)a6;
- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 lockWindow:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation ASDInstallAttribution

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C3F8];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ASDInstallAttribution_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6588 != -1) {
    dispatch_once(&qword_1EB4D6588, block);
  }
  v2 = (void *)_MergedGlobals_44;
  return v2;
}

uint64_t __39__ASDInstallAttribution_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_44 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDInstallAttribution)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  v4 = [(ASDInstallAttribution *)self _initWithServiceBroker:v3];

  return v4;
}

- (id)_initWithServiceBroker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDInstallAttribution;
  v6 = [(ASDInstallAttribution *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceBroker, a3);
  }

  return v7;
}

- (void)startImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [v6 sourceAppAdamId];
    v10 = [v6 sourceAppBundleId];
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Starting impression as requested from adamID: %{public}@ bundleID: %{public}@", buf, 0x16u);
  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E58B45B8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v14];
}

void __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v6 startAdImpressionWithConfig:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 sourceAppAdamId];
    v10 = [v6 sourceAppBundleId];
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Ending impression as requested from adamID: %{public}@ bundleID: %{public}@", buf, 0x16u);
  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E58B45B8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v14];
}

void __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke_2;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v8];
    [v6 endAdImpressionWithConfig:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startPingbackTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "Starting pingback task", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58B45E0;
  id v9 = v4;
  id v7 = v4;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v8];
}

void __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_18];
    [v6 startPingbackTaskWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)startGhostFetchTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "Starting pingback task", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E58B45E0;
  id v9 = v4;
  id v7 = v4;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v8];
}

void __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
    [v6 startGhostFetchTaskWithCompletionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)addInstallAttributionParamsWithConfig:(id)a3
{
}

void __63__ASDInstallAttribution_addInstallAttributionParamsWithConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Error getting install attribution service: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)addInstallAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 sourceAppBundleId];
    uint64_t v10 = [v6 sourceAppAdamId];
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Adding install attribution params from bundleID: %{public}@ adamID: %{public}@", buf, 0x16u);
  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E58B45B8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v14];
}

void __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 addInstallAttributionParamsWithConfig:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 sourceWebRegistrableDomain];
    id v10 = [v6 appAdamId];
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Adding install attribution params from web from domain: %{public}@ for adamID: %{public}@", buf, 0x16u);
  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E58B45B8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v6;
  id v13 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v14];
}

void __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v6 = [a2 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v6 addInstallWebAttributionParamsWithConfig:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "Registering install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke;
  v12[3] = &unk_1E58B45B8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v12];
}

void __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 registerPingbackForApp:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateConversionValueForInstallAttributionPingbackForApp:(id)a3 conversionValue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_DEFAULT, "Updating conversion value for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke;
  v16[3] = &unk_1E58B4608;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v16];
}

void __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 48);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 updateConversionValueForApp:*(void *)(a1 + 32) conversionValue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v14, OS_LOG_TYPE_DEFAULT, "Updating conversion values for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke;
  v20[3] = &unk_1E58B4630;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v20];
}

void __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 56);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 updatePostbackConversionValuesForApp:*(void *)(a1 + 32) fineConversionValue:*(void *)(a1 + 40) coarseConversionValue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 lockWindow:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF6A000, v16, OS_LOG_TYPE_DEFAULT, "Updating conversion values for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke;
  v22[3] = &unk_1E58B4658;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  BOOL v27 = a6;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v15;
  [(ASDServiceBroker *)serviceBroker getInstallAttributionServiceWithCompletionHandler:v22];
}

void __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 56);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 updatePostbackConversionValuesForApp:*(void *)(a1 + 32) fineConversionValue:*(void *)(a1 + 40) coarseConversionValue:*(void *)(a1 + 48) lockWindow:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end