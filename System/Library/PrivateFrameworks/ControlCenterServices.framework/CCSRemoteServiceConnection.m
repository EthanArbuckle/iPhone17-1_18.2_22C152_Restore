@interface CCSRemoteServiceConnection
- (CCSRemoteServiceConnection)init;
- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4;
- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4;
- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3;
- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5;
- (void)requestIconElementState:(id)a3 completionHandler:(id)a4;
- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3;
- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation CCSRemoteServiceConnection

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_2645B6448;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_36;
  v7[3] = &unk_2645B65D8;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  [v4 setVisibility:v5 forModuleWithIdentifier:v6 completionHandler:v7];
}

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (![v9 length])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 142, @"Invalid parameter not satisfying: %@", @"[identifier length] > 0" object file lineNumber description];
  }
  id v11 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.setVisibility", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2645B6560;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  BOOL v18 = a3;
  id v12 = v10;
  id v13 = v9;
  os_activity_apply(v11, block);
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_36(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2_37;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (CCSRemoteServiceConnection)init
{
  v18.receiver = self;
  v18.super_class = (Class)CCSRemoteServiceConnection;
  uint64_t v2 = [(CCSRemoteServiceConnection *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ControlCenter.RemoteServiceConnection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ControlCenter.RemoteServiceConnection.callout", v6);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.controlcenter.remoteservice" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v9;

    id v11 = v2->_connection;
    char v12 = CCSRemoteServiceServerInterface();
    [(NSXPCConnection *)v11 setRemoteObjectInterface:v12];

    id v13 = v2->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __34__CCSRemoteServiceConnection_init__block_invoke;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = v13;
    [(NSXPCConnection *)v13 setInterruptionHandler:v17];
    v14 = v2->_connection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __34__CCSRemoteServiceConnection_init__block_invoke_4;
    v16[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v16[4] = v13;
    [(NSXPCConnection *)v14 setInvalidationHandler:v16];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __34__CCSRemoteServiceConnection_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_221518000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __34__CCSRemoteServiceConnection_init__block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_221518000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    char v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 59, @"Invalid parameter not satisfying: %@", @"[identifier length] > 0" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 60, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.getEnabledStateOfModule", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2645B6420;
  void block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  os_activity_apply(v9, block);
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_2645B6448;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_19;
  v6[3] = &unk_2645B6498;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 getEnabledStateOfModuleWithIdentifier:v5 completionHandler:v6];
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_2645B6420;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_19(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2_20;
  v4[3] = &unk_2645B6470;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_2_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 78, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  uint64_t v6 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.requestAvailableModuleIdentifiersWithCompletionHandler", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke;
  block[3] = &unk_2645B64C0;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  os_activity_apply(v6, block);
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_2645B64E8;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_22;
  v6[3] = &unk_2645B6538;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 requestAvailableModuleIdentifiersWithCompletionHandler:v6];
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_2645B64C0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3_cold_1();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2_23;
  block[3] = &unk_2645B6510;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_2_23(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (![v9 length])
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 98, @"Invalid parameter not satisfying: %@", @"[identifier length] > 0" object file lineNumber description];
  }
  id v11 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.requestEnableModule", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke;
  block[3] = &unk_2645B6560;
  void block[4] = self;
  id v16 = v9;
  BOOL v18 = a4;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  os_activity_apply(v11, block);
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2;
  v9[3] = &unk_2645B6588;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_31;
  v7[3] = &unk_2645B65D8;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  [v4 requestEnableModuleWithIdentifier:v6 force:v5 completionHandler:v7];
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3;
  v6[3] = &unk_2645B6560;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3_cold_1();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_31(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2_32;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_2_32(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    char v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CCSRemoteServiceConnection.m", 120, @"Invalid parameter not satisfying: %@", @"[identifier length] > 0" object file lineNumber description];
  }
  id v9 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.requestDisableModule", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2645B6420;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  os_activity_apply(v9, block);
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_2645B6448;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_34;
  v6[3] = &unk_2645B65D8;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 requestDisableModuleWithIdentifier:v5 completionHandler:v6];
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_2645B6420;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2_35;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_2_35(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_2645B6420;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3_cold_1();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 40));
  }
  return result;
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.presentModuleWithIdentifier", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke;
  v15[3] = &unk_2645B6600;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  os_activity_apply(v11, v15);
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2;
  v9[3] = &unk_2645B6628;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_38;
  v7[3] = &unk_2645B65D8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  [v4 presentModuleWithIdentifier:v5 options:v6 completionHandler:v7];
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3;
  v6[3] = &unk_2645B6600;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3_cold_1();
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 48));
  }
  return result;
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_38(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2_39;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_2_39(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.handleIconElementRequest", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke;
  block[3] = &unk_2645B6420;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2;
  v8[3] = &unk_2645B6448;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_40;
  v6[3] = &unk_2645B65D8;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 handleIconElementRequest:v5 completionHandler:v6];
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3;
  block[3] = &unk_2645B6420;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3_cold_1(a1, v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_40(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2_41;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_2_41(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.handleControlCenterOperationType", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke;
  block[3] = &unk_2645B6650;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  os_activity_apply(v7, block);
}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2;
  v9[3] = &unk_2645B64E8;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_42;
  v7[3] = &unk_2645B65D8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  [v4 handleControlCenterOperationType:v6 completionHandler:v7];
}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3;
  v6[3] = &unk_2645B64C0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_42(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2_43;
  block[3] = &unk_2645B65B0;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_2_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.requestIconElementState", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke;
  block[3] = &unk_2645B66C8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  os_activity_apply(v8, block);
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2;
  v8[3] = &unk_2645B64E8;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 48);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_44;
  v6[3] = &unk_2645B66A0;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 requestIconElementState:v5 completionHandler:v6];
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3;
  v6[3] = &unk_2645B64C0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2_45;
  block[3] = &unk_2645B6678;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_2_45(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_221518000, "com.apple.ControlCenter.RemoteServiceConnection.resetToDefaultLayout", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke;
  v7[3] = &unk_2645B64C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_2645B66F0;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_47;
  v4[3] = &unk_2645B6718;
  id v5 = *(id *)(a1 + 40);
  [v3 resetToDefaultLayoutWithCompletionHandler:v4];
}

void __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_3;
  v5[3] = &unk_2645B64C0;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
    __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_3_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_47(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_2_48;
  block[3] = &unk_2645B65B0;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_2_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __86__CCSRemoteServiceConnection_getEnabledStateOfModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_221518000, v0, v1, "Error getting enabled state of module with identifier='%{public}@', error='%{public}@'", v2, v3, v4, v5, v6);
}

void __85__CCSRemoteServiceConnection_requestAvailableModuleIdentifiersWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Error requesting list of module identifiers, error='%{public}@'", v2, v3, v4, v5, v6);
}

void __88__CCSRemoteServiceConnection_requestEnableModuleWithIdentifier_force_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_221518000, v0, OS_LOG_TYPE_ERROR, "Error requesting enabling of module with identifier='%{public}@', error='%{public}@', force='%{public}@'", v1, 0x20u);
}

void __83__CCSRemoteServiceConnection_requestDisableModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_221518000, v0, v1, "Error requesting disabling of module with identifier='%{public}@', error='%{public}@'", v2, v3, v4, v5, v6);
}

void __86__CCSRemoteServiceConnection_setVisibility_forModuleWithIdentifier_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_221518000, v0, v1, "Error requesting support of module with identifier='%{public}@', error='%{public}@'", v2, v3, v4, v5, v6);
}

void __84__CCSRemoteServiceConnection_presentModuleWithIdentifier_options_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_221518000, v0, OS_LOG_TYPE_ERROR, "Error requesting presentation of module with identifier='%{public}@' options=%{public}@}, error='%{public}@'", v1, 0x20u);
}

void __73__CCSRemoteServiceConnection_handleIconElementRequest_completionHandler___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 description];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_221518000, v4, OS_LOG_TYPE_ERROR, "Failed to handle iconElementRequest for request: %@ error=%@", (uint8_t *)&v7, 0x16u);
}

void __81__CCSRemoteServiceConnection_handleControlCenterOperationType_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Failed to handle CCSControlCenterOperationType error=%@", v2, v3, v4, v5, v6);
}

void __72__CCSRemoteServiceConnection_requestIconElementState_completionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Failed to request CCSIconElementState for CCSIconElementRequest error=%@", v2, v3, v4, v5, v6);
}

void __72__CCSRemoteServiceConnection_resetToDefaultLayoutWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_221518000, v0, v1, "Failed to reset Control Center default layout error=%@", v2, v3, v4, v5, v6);
}

@end