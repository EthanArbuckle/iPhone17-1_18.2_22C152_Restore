@interface SKANInteropService
+ (SKANInteropService)sharedInstance;
+ (id)interface;
- (void)getImpressionsForApp:(id)a3 completionHandler:(id)a4;
- (void)storePostbacks:(id)a3 completionHandler:(id)a4;
- (void)storeSkannerEvents:(id)a3 advertisedItemID:(id)a4 completionHandler:(id)a5;
@end

@implementation SKANInteropService

+ (id)interface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C158];
}

+ (SKANInteropService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SKANInteropService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D64D8 != -1) {
    dispatch_once(&qword_1EB4D64D8, block);
  }
  v2 = (void *)_MergedGlobals_34;
  return (SKANInteropService *)v2;
}

void __36__SKANInteropService_sharedInstance__block_invoke(uint64_t a1)
{
  v1 = (id *)objc_alloc(*(Class *)(a1 + 32));
  v2 = +[ASDServiceBroker defaultBroker];
  id v5 = v2;
  if (v1)
  {
    v6.receiver = v1;
    v6.super_class = (Class)SKANInteropService;
    v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
    v1 = v3;
    if (v3) {
      objc_storeStrong(v3 + 1, v2);
    }
  }

  v4 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v1;
}

- (void)getImpressionsForApp:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v6;
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting skan impressions for adamID: %{public}@", buf, 0x16u);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke;
  v13[3] = &unk_1E58B3ED0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getSKANInteropServiceWithCompletionHandler:v13];
}

void __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke_2;
    v7[3] = &unk_1E58B2CB8;
    id v8 = *(id *)(a1 + 40);
    v4 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v4 getImpressionsForApp:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeSkannerEvents:(id)a3 advertisedItemID:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v12 = v22;
    _os_log_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Storing SKanner events from BD", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke;
  v17[3] = &unk_1E58B3EF8;
  id v19 = v9;
  id v20 = v10;
  id v18 = v8;
  id v14 = v9;
  id v15 = v8;
  id v16 = v10;
  [(ASDServiceBroker *)serviceBroker getSKANInteropServiceWithCompletionHandler:v17];
}

void __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke_2;
    v7[3] = &unk_1E58B2CB8;
    id v8 = *(id *)(a1 + 48);
    v4 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v4 storeSkannerEvents:*(void *)(a1 + 32) advertisedItemID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    int v5 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storePostbacks:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v9 = v17;
    _os_log_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Storing postbacks from BD", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__SKANInteropService_storePostbacks_completionHandler___block_invoke;
  v13[3] = &unk_1E58B3ED0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v6;
  id v12 = v7;
  [(ASDServiceBroker *)serviceBroker getSKANInteropServiceWithCompletionHandler:v13];
}

void __55__SKANInteropService_storePostbacks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SKANInteropService_storePostbacks_completionHandler___block_invoke_2;
    v7[3] = &unk_1E58B2CB8;
    id v8 = *(id *)(a1 + 40);
    v4 = [a2 remoteObjectProxyWithErrorHandler:v7];
    [v4 storePostbacks:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    int v5 = ASDLogHandleForCategory(32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __55__SKANInteropService_storePostbacks_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end