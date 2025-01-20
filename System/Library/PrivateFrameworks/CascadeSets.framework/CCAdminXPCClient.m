@interface CCAdminXPCClient
+ (id)wrappedCompletion:(id)a3 retainingClient:(id)a4;
+ (void)removeSetsRootDirectory:(id)a3;
+ (void)triggerMaintenanceActivity:(id)a3 completion:(id)a4;
- (CCAdminXPCClient)initWithClientId:(id)a3 activity:(id)a4;
- (void)shouldDeferCurrentActivity:(id)a3;
@end

@implementation CCAdminXPCClient

+ (id)wrappedCompletion:(id)a3 retainingClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke;
  v11[3] = &unk_26527A530;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  v9 = (void *)MEMORY[0x24C5B1320](v11);

  return v9;
}

uint64_t __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke(uint64_t a1, int a2)
{
  v4 = __biome_log_for_category();
  id v5 = v4;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_1(a1, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_2(a1, a2, v5);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)triggerMaintenanceActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  id v8 = [v6 activityName];
  id v10 = (id)[v7 initWithClientId:v8 activity:v6];

  v9 = [(id)objc_opt_class() wrappedCompletion:v5 retainingClient:v10];

  [v10 serviceRequest:1 completion:v9 usingBlock:&__block_literal_global_5];
}

uint64_t __58__CCAdminXPCClient_triggerMaintenanceActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startMaintenanceActivity:");
}

+ (void)removeSetsRootDirectory:(id)a3
{
  id v3 = a3;
  id v5 = (id)[objc_alloc((Class)objc_opt_class()) initWithClientId:@"removeSetsRootDirectory" activity:0];
  v4 = [(id)objc_opt_class() wrappedCompletion:v3 retainingClient:v5];

  [v5 serviceRequest:1 completion:v4 usingBlock:&__block_literal_global_4];
}

uint64_t __44__CCAdminXPCClient_removeSetsRootDirectory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSetsRootDirectory:");
}

- (CCAdminXPCClient)initWithClientId:(id)a3 activity:(id)a4
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F29E40];
  v12.receiver = self;
  v12.super_class = (Class)CCAdminXPCClient;
  v9 = [(CCXPCClient *)&v12 initWithRemoteObjectInterface:&unk_26FDDAF08 exportedInterface:&unk_26FDD5940 serviceName:@"com.apple.SetStoreUpdateService" clientId:a3 interruptionCode:5 invalidationCode:4 useCase:v8];
  id v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_activity, a4);
  }

  return v10;
}

- (void)shouldDeferCurrentActivity:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    activity = self->_activity;
    uint64_t v8 = v4;
    if (activity)
    {
      uint64_t v6 = [(BMXPCActivity *)activity didDefer];
      v4 = v8;
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
    v4[2](v4, v7);
  }

  MEMORY[0x270F9A790]();
}

- (void).cxx_destruct
{
}

void __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Successfully completed client activity: %@", (uint8_t *)&v3, 0xCu);
}

void __54__CCAdminXPCClient_wrappedCompletion_retainingClient___block_invoke_cold_2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Failed to complete client activity (serviceResult: %u): %@", (uint8_t *)v4, 0x12u);
}

@end