@interface ASDInstallWebAttributionService
+ (ASDInstallWebAttributionService)sharedInstance;
+ (id)interface;
- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
@end

@implementation ASDInstallWebAttributionService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C1B8];
}

+ (ASDInstallWebAttributionService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ASDInstallWebAttributionService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D64E8 != -1) {
    dispatch_once(&qword_1EB4D64E8, block);
  }
  v2 = (void *)_MergedGlobals_35;
  return (ASDInstallWebAttributionService *)v2;
}

void __49__ASDInstallWebAttributionService_sharedInstance__block_invoke(uint64_t a1)
{
  v1 = (id *)objc_alloc(*(Class *)(a1 + 32));
  v2 = +[ASDServiceBroker defaultBroker];
  id v5 = v2;
  if (v1)
  {
    v6.receiver = v1;
    v6.super_class = (Class)ASDInstallWebAttributionService;
    v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
    v1 = v3;
    if (v3) {
      objc_storeStrong(v3 + 1, v2);
    }
  }

  v4 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v1;
}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = [v6 sourceWebRegistrableDomain];
    v12 = [v6 appAdamId];
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding install attribution params from web from domain: %{public}@ for adamID: %{public}@", buf, 0x20u);
  }
  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke;
  v16[3] = &unk_1E58B3F20;
  id v17 = v6;
  id v18 = v7;
  id v14 = v6;
  id v15 = v7;
  [(ASDServiceBroker *)serviceBroker getInstallWebAttributionServiceWithCompletionHandler:v16];
}

void __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v6 = [a2 remoteObjectProxyWithErrorHandler:v9];
    [v6 addInstallWebAttributionParamsWithConfig:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error getting install web attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting install web attribution service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end