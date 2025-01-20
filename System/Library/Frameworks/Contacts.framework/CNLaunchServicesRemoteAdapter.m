@interface CNLaunchServicesRemoteAdapter
+ (id)createConnectionWithInterface:(id)a3;
+ (id)launchServicesAdapterInterface;
+ (id)os_log;
- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4;
- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4;
- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5;
- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5;
@end

@implementation CNLaunchServicesRemoteAdapter

+ (id)os_log
{
  if (os_log_cn_once_token_0_19 != -1) {
    dispatch_once(&os_log_cn_once_token_0_19, &__block_literal_global_127);
  }
  v2 = (void *)os_log_cn_once_object_0_19;

  return v2;
}

uint64_t __39__CNLaunchServicesRemoteAdapter_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.contactsd", "launch-services");
  uint64_t v1 = os_log_cn_once_object_0_19;
  os_log_cn_once_object_0_19 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)launchServicesAdapterInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0AD090];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_applicationsForUserActivityType_withReply_ argumentIndex:0 ofReply:0];

  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_applicationsForUserActivityType_withReply_ argumentIndex:0 ofReply:1];

  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_applicationsForUserActivityType_withReply_ argumentIndex:1 ofReply:1];

  v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_applicationsAvailableForHandlingURLScheme_withReply_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_applicationsAvailableForHandlingURLScheme_withReply_ argumentIndex:0 ofReply:1];

  v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_applicationsAvailableForHandlingURLScheme_withReply_ argumentIndex:1 ofReply:1];

  v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_applicationsAvailableForDefaultAppCategory_withReply_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  [v2 setClasses:v16 forSelector:sel_applicationsAvailableForDefaultAppCategory_withReply_ argumentIndex:0 ofReply:1];

  v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_applicationsAvailableForDefaultAppCategory_withReply_ argumentIndex:1 ofReply:1];

  v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v18 forSelector:sel_defaultApplicationForDefaultAppCategory_withReply_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v2 setClasses:v21 forSelector:sel_defaultApplicationForDefaultAppCategory_withReply_ argumentIndex:0 ofReply:1];

  v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v22 forSelector:sel_defaultApplicationForDefaultAppCategory_withReply_ argumentIndex:1 ofReply:1];

  v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_applicationForBundleIdentifier_withReply_ argumentIndex:0 ofReply:0];

  v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v24 forSelector:sel_applicationForBundleIdentifier_withReply_ argumentIndex:0 ofReply:1];

  v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v25 forSelector:sel_applicationForBundleIdentifier_withReply_ argumentIndex:1 ofReply:1];

  v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_openUserActivityData_inApplication_withReply_ argumentIndex:0 ofReply:0];

  v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v27 forSelector:sel_openUserActivityData_inApplication_withReply_ argumentIndex:1 ofReply:0];

  v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v28 forSelector:sel_openUserActivityData_inApplication_withReply_ argumentIndex:1 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_openSensitiveURLInBackground_withOptions_withReply_ argumentIndex:0 ofReply:0];
  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);
  [v2 setClasses:v33 forSelector:sel_openSensitiveURLInBackground_withOptions_withReply_ argumentIndex:1 ofReply:0];

  [v2 setClass:objc_opt_class() forSelector:sel_openSensitiveURLInBackground_withOptions_withReply_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)createConnectionWithInterface:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMachServiceName:@"com.apple.contactsd.launch-services-proxy" options:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  v9[4] = a1;
  [v6 setInterruptionHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_34;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = a1;
  [v6 setInvalidationHandler:v8];
  [v6 setRemoteObjectInterface:v5];

  [v6 resume];

  return v6;
}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke()
{
  os_log_t v0 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_34()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    uint64_t v2 = @"com.apple.contactsd.launch-services-proxy";
    _os_log_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEFAULT, "Service connection to %@ was invalidated", (uint8_t *)&v1, 0xCu);
  }
}

- (void)applicationsForUserActivityType:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() launchServicesAdapterInterface];
  uint64_t v10 = [v8 createConnectionWithInterface:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke;
  v12[3] = &unk_1E56B49B0;
  v12[4] = self;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 applicationsForUserActivityType:v7 withReply:v6];

  [v10 invalidate];
}

void __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)applicationsAvailableForHandlingURLScheme:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() launchServicesAdapterInterface];
  uint64_t v10 = [v8 createConnectionWithInterface:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__CNLaunchServicesRemoteAdapter_applicationsAvailableForHandlingURLScheme_withReply___block_invoke;
  v12[3] = &unk_1E56B49B0;
  v12[4] = self;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 applicationsAvailableForHandlingURLScheme:v7 withReply:v6];

  [v10 invalidate];
}

void __85__CNLaunchServicesRemoteAdapter_applicationsAvailableForHandlingURLScheme_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)applicationsAvailableForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() launchServicesAdapterInterface];
  uint64_t v10 = [v8 createConnectionWithInterface:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__CNLaunchServicesRemoteAdapter_applicationsAvailableForDefaultAppCategory_withReply___block_invoke;
  v12[3] = &unk_1E56B49B0;
  v12[4] = self;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 applicationsAvailableForDefaultAppCategory:v7 withReply:v6];

  [v10 invalidate];
}

void __86__CNLaunchServicesRemoteAdapter_applicationsAvailableForDefaultAppCategory_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)defaultApplicationForDefaultAppCategory:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() launchServicesAdapterInterface];
  uint64_t v10 = [v8 createConnectionWithInterface:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__CNLaunchServicesRemoteAdapter_defaultApplicationForDefaultAppCategory_withReply___block_invoke;
  v12[3] = &unk_1E56B49B0;
  v12[4] = self;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 defaultApplicationForDefaultAppCategory:v7 withReply:v6];

  [v10 invalidate];
}

void __83__CNLaunchServicesRemoteAdapter_defaultApplicationForDefaultAppCategory_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)applicationForBundleIdentifier:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() launchServicesAdapterInterface];
  uint64_t v10 = [v8 createConnectionWithInterface:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__CNLaunchServicesRemoteAdapter_applicationForBundleIdentifier_withReply___block_invoke;
  v12[3] = &unk_1E56B49B0;
  v12[4] = self;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v12];
  [v11 applicationForBundleIdentifier:v7 withReply:v6];

  [v10 invalidate];
}

void __74__CNLaunchServicesRemoteAdapter_applicationForBundleIdentifier_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  v12 = [(id)objc_opt_class() launchServicesAdapterInterface];
  v13 = [v11 createConnectionWithInterface:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__CNLaunchServicesRemoteAdapter_openUserActivityData_inApplication_withReply___block_invoke;
  v15[3] = &unk_1E56B49B0;
  v15[4] = self;
  v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 openUserActivityData:v10 inApplication:v9 withReply:v8];

  [v13 invalidate];
}

void __78__CNLaunchServicesRemoteAdapter_openUserActivityData_inApplication_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  v12 = [(id)objc_opt_class() launchServicesAdapterInterface];
  v13 = [v11 createConnectionWithInterface:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__CNLaunchServicesRemoteAdapter_openSensitiveURLInBackground_withOptions_withReply___block_invoke;
  v15[3] = &unk_1E56B49B0;
  v15[4] = self;
  v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v14 openSensitiveURLInBackground:v10 withOptions:v9 withReply:v8];

  [v13 invalidate];
}

void __84__CNLaunchServicesRemoteAdapter_openSensitiveURLInBackground_withOptions_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1();
  }
}

void __63__CNLaunchServicesRemoteAdapter_createConnectionWithInterface___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__CNLaunchServicesRemoteAdapter_applicationsForUserActivityType_withReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Error: could not obtain service proxy %@", v2, v3, v4, v5, v6);
}

@end