@interface CNLaunchServices
- (CNLaunchServices)init;
- (CNLaunchServices)initWithAdapter:(id)a3;
- (CNLaunchServicesAdapter)adapter;
- (OS_os_log)log;
- (id)applicationForBundleIdentifier:(id)a3;
- (id)applicationsAvailableForDefaultAppCategory:(unint64_t)a3;
- (id)applicationsAvailableForHandlingURLScheme:(id)a3;
- (id)applicationsForUserActivityType:(id)a3;
- (id)defaultApplicationForDefaultAppCategory:(unint64_t)a3;
- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)openUserActivityData:(id)a3 inApplication:(id)a4 completionHandler:(id)a5;
- (void)setAdapter:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation CNLaunchServices

- (CNLaunchServices)init
{
  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v4 = [[CNLaunchServicesLocalAdapter alloc] initWithApplicationWorkspace:v3];
  v5 = [(CNLaunchServices *)self initWithAdapter:v4];

  return v5;
}

- (CNLaunchServices)initWithAdapter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNLaunchServices;
  v6 = [(CNLaunchServices *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    os_log_t v8 = os_log_create("com.apple.contacts.contactsfoundation", "launchservices");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)applicationsAvailableForHandlingURLScheme:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 future];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke;
  v12[3] = &unk_1E569FBD8;
  v12[4] = self;
  [v6 addFailureBlock:v12];

  v7 = [(CNLaunchServices *)self adapter];
  os_log_t v8 = [(CNPromise *)v5 completionHandlerAdapter];
  [v7 applicationsAvailableForHandlingURLScheme:v4 withReply:v8];

  v9 = [(CNPromise *)v5 future];
  v10 = [v9 result:0];

  return v10;
}

void __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1();
  }
}

- (id)applicationsForUserActivityType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 future];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__CNLaunchServices_applicationsForUserActivityType___block_invoke;
  v12[3] = &unk_1E569FBD8;
  v12[4] = self;
  [v6 addFailureBlock:v12];

  v7 = [(CNLaunchServices *)self adapter];
  os_log_t v8 = [(CNPromise *)v5 completionHandlerAdapter];
  [v7 applicationsForUserActivityType:v4 withReply:v8];

  v9 = [(CNPromise *)v5 future];
  v10 = [v9 result:0];

  return v10;
}

void __52__CNLaunchServices_applicationsForUserActivityType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__CNLaunchServices_applicationsForUserActivityType___block_invoke_cold_1();
  }
}

- (id)applicationsAvailableForDefaultAppCategory:(unint64_t)a3
{
  id v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 future];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__CNLaunchServices_applicationsAvailableForDefaultAppCategory___block_invoke;
  v13[3] = &unk_1E569FBD8;
  v13[4] = self;
  [v6 addFailureBlock:v13];

  v7 = [(CNLaunchServices *)self adapter];
  os_log_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  v9 = [(CNPromise *)v5 completionHandlerAdapter];
  [v7 applicationsAvailableForDefaultAppCategory:v8 withReply:v9];

  v10 = [(CNPromise *)v5 future];
  v11 = [v10 result:0];

  return v11;
}

void __63__CNLaunchServices_applicationsAvailableForDefaultAppCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__CNLaunchServices_applicationsAvailableForDefaultAppCategory___block_invoke_cold_1();
  }
}

- (id)defaultApplicationForDefaultAppCategory:(unint64_t)a3
{
  id v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 future];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__CNLaunchServices_defaultApplicationForDefaultAppCategory___block_invoke;
  v17[3] = &unk_1E569FBD8;
  v17[4] = self;
  [v6 addFailureBlock:v17];

  v7 = [(CNLaunchServices *)self adapter];
  os_log_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  v9 = [(CNPromise *)v5 completionHandlerAdapter];
  [v7 defaultApplicationForDefaultAppCategory:v8 withReply:v9];

  v10 = [(CNPromise *)v5 future];
  id v16 = 0;
  v11 = [v10 resultWithTimeout:&v16 error:0.5];
  id v12 = v16;
  v13 = off_1EE025F60((uint64_t)&__block_literal_global_4_4, v11);

  if (+[CNFoundationError isTimeoutError:v12])
  {
    v14 = [(CNLaunchServices *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CNLaunchServices defaultApplicationForDefaultAppCategory:](v14);
    }
  }

  return v13;
}

void __60__CNLaunchServices_defaultApplicationForDefaultAppCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__CNLaunchServices_defaultApplicationForDefaultAppCategory___block_invoke_cold_1();
  }
}

- (id)applicationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNPromise);
  v6 = [(CNPromise *)v5 future];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke;
  v12[3] = &unk_1E569FBD8;
  v12[4] = self;
  [v6 addFailureBlock:v12];

  v7 = [(CNLaunchServices *)self adapter];
  os_log_t v8 = [(CNPromise *)v5 completionHandlerAdapter];
  [v7 applicationForBundleIdentifier:v4 withReply:v8];

  v9 = [(CNPromise *)v5 future];
  v10 = [v9 result:0];

  return v10;
}

void __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke_cold_1();
  }
}

- (void)openUserActivityData:(id)a3 inApplication:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(CNPromise);
  id v12 = [(CNPromise *)v11 future];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke;
  v23[3] = &unk_1E56A2510;
  id v13 = v8;
  id v24 = v13;
  [v12 addSuccessBlock:v23];

  v14 = [(CNPromise *)v11 future];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke_2;
  v21 = &unk_1E56A0660;
  id v22 = v13;
  id v15 = v13;
  [v14 addFailureBlock:&v18];

  id v16 = [(CNLaunchServices *)self adapter];
  v17 = [(CNPromise *)v11 BOOLErrorCompletionHandlerAdapter];
  [v16 openUserActivityData:v10 inApplication:v9 withReply:v17];
}

uint64_t __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __73__CNLaunchServices_openUserActivityData_inApplication_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)openSensitiveURLInBackground:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(CNPromise);
  id v12 = [(CNPromise *)v11 future];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke;
  v23[3] = &unk_1E56A2510;
  id v13 = v8;
  id v24 = v13;
  [v12 addSuccessBlock:v23];

  v14 = [(CNPromise *)v11 future];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke_2;
  v21 = &unk_1E56A0660;
  id v22 = v13;
  id v15 = v13;
  [v14 addFailureBlock:&v18];

  id v16 = [(CNLaunchServices *)self adapter];
  v17 = [(CNPromise *)v11 BOOLErrorCompletionHandlerAdapter];
  [v16 openSensitiveURLInBackground:v10 withOptions:v9 withReply:v17];
}

uint64_t __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

uint64_t __79__CNLaunchServices_openSensitiveURLInBackground_withOptions_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (CNLaunchServicesAdapter)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_adapter, 0);
}

void __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_19091D000, v0, v1, "Error fetching applicationsAvailableForHandlingURLScheme, %@", v2, v3, v4, v5, v6);
}

void __52__CNLaunchServices_applicationsForUserActivityType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_19091D000, v0, v1, "Error fetching applicationsForUserActivityType, %@", v2, v3, v4, v5, v6);
}

void __63__CNLaunchServices_applicationsAvailableForDefaultAppCategory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_19091D000, v0, v1, "Error fetching applicationsAvailableForDefaultAppCategory, %@", v2, v3, v4, v5, v6);
}

- (void)defaultApplicationForDefaultAppCategory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "Timeout fetching defaultApplicationForDefaultAppCategory", v1, 2u);
}

void __60__CNLaunchServices_defaultApplicationForDefaultAppCategory___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_19091D000, v0, v1, "Error fetching defaultApplicationForDefaultAppCategory, %@", v2, v3, v4, v5, v6);
}

void __51__CNLaunchServices_applicationForBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_19091D000, v0, v1, "Error fetching applicationForBundleIdentifier, %@", v2, v3, v4, v5, v6);
}

@end