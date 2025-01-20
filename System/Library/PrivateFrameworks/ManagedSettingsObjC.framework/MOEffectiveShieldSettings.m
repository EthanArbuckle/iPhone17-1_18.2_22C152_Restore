@interface MOEffectiveShieldSettings
+ (id)configurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6;
+ (id)configurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 error:(id *)a5;
+ (id)configurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6;
+ (id)newConnection;
+ (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6;
+ (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6;
- (MOEffectiveArray)applications;
- (MOEffectiveArray)webDomains;
- (MOEffectiveCategoryShieldPolicy)applicationCategoryPolicy;
- (MOEffectiveCategoryShieldPolicy)webDomainCategoryPolicy;
- (MOEffectiveSettingsStore)store;
- (MOEffectiveShieldSettings)init;
@end

@implementation MOEffectiveShieldSettings

- (MOEffectiveShieldSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveShieldSettings;
  v2 = [(MOEffectiveShieldSettings *)&v6 init];
  uint64_t v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

+ (id)newConnection
{
  id v2 = +[MOManagedSettingsAgentConnection newConnection];
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  objc_super v6 = __42__MOEffectiveShieldSettings_newConnection__block_invoke;
  v7 = &unk_1E61CBE28;
  objc_copyWeak(&v8, &location);
  [v2 setInterruptionHandler:&v4];
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __42__MOEffectiveShieldSettings_newConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (MOEffectiveArray)applications
{
  id v2 = [(MOEffectiveShieldSettings *)self store];
  uint64_t v3 = [v2 shield];
  uint64_t v4 = [v3 applications];

  uint64_t v5 = +[MOShieldSettingsGroup applicationsMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [MOEffectiveArray alloc];
  id v8 = [v4 allObjects];
  v9 = [v6 allObjects];
  v10 = [(MOEffectiveArray *)v7 initWithValue:v8 defaultValue:v9];

  return v10;
}

- (MOEffectiveCategoryShieldPolicy)applicationCategoryPolicy
{
  id v2 = [(MOEffectiveShieldSettings *)self store];
  uint64_t v3 = [v2 shield];
  uint64_t v4 = [v3 applicationCategories];

  uint64_t v5 = +[MOShieldSettingsGroup applicationCategoriesMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [[MOEffectiveCategoryShieldPolicy alloc] initWithValue:v4 defaultValue:v6];
  return v7;
}

- (MOEffectiveArray)webDomains
{
  id v2 = [(MOEffectiveShieldSettings *)self store];
  uint64_t v3 = [v2 shield];
  uint64_t v4 = [v3 webDomains];

  uint64_t v5 = +[MOShieldSettingsGroup webDomainsMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [MOEffectiveArray alloc];
  id v8 = [v4 allObjects];
  v9 = [v6 allObjects];
  v10 = [(MOEffectiveArray *)v7 initWithValue:v8 defaultValue:v9];

  return v10;
}

- (MOEffectiveCategoryShieldPolicy)webDomainCategoryPolicy
{
  id v2 = [(MOEffectiveShieldSettings *)self store];
  uint64_t v3 = [v2 shield];
  uint64_t v4 = [v3 webDomainCategories];

  uint64_t v5 = +[MOShieldSettingsGroup webDomainCategoriesMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [[MOEffectiveCategoryShieldPolicy alloc] initWithValue:v4 defaultValue:v6];
  return v7;
}

+ (id)configurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v13 = (void *)[a1 newConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke;
  v19[3] = &unk_1E61CBE78;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  v23 = &v31;
  v24 = &v25;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v13 withRetryCount:1 proxyHandler:v19];
  if (a6 && !v32[5]) {
    *a6 = (id) v26[5];
  }
  [v13 invalidate];
  id v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke_2;
    v10[3] = &unk_1E61CBE50;
    long long v11 = *(_OWORD *)(a1 + 56);
    [a2 fetchConfigurationForBundleIdentifier:v7 categoryIdentifier:v8 categoryName:v9 replyHandler:v10];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

void __100__MOEffectiveShieldSettings_configurationForBundleIdentifier_categoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v5 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

+ (id)configurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  uint64_t v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v10 = (void *)[a1 newConnection];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke;
  v18 = &unk_1E61CBEA0;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v21 = &v29;
  id v22 = &v23;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v10 withRetryCount:1 proxyHandler:&v15];
  if (a5 && !v30[5]) {
    *a5 = (id) v24[5];
  }
  objc_msgSend(v10, "invalidate", v15, v16, v17, v18);
  id v13 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke_2;
    v9[3] = &unk_1E61CBE50;
    long long v10 = *(_OWORD *)(a1 + 48);
    [a2 fetchConfigurationForCategoryIdentifier:v7 categoryName:v8 replyHandler:v9];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
}

void __83__MOEffectiveShieldSettings_configurationForCategoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v5 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

+ (id)configurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  id v13 = (void *)[a1 newConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke;
  v19[3] = &unk_1E61CBE78;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  uint64_t v23 = &v31;
  v24 = &v25;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v13 withRetryCount:1 proxyHandler:v19];
  if (a6 && !v32[5]) {
    *a6 = (id) v26[5];
  }
  [v13 invalidate];
  id v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke_2;
    v10[3] = &unk_1E61CBE50;
    long long v11 = *(_OWORD *)(a1 + 56);
    [a2 fetchConfigurationForWebDomain:v7 categoryIdentifier:v8 categoryName:v9 replyHandler:v10];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

void __93__MOEffectiveShieldSettings_configurationForWebDomain_categoryIdentifier_categoryName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = [v7 unarchivedObjectOfClass:v8 fromData:v5 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

+ (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[a1 newConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __96__MOEffectiveShieldSettings_handleAction_bundleIdentifier_categoryIdentifier_completionHandler___block_invoke;
  id v20 = &unk_1E61CBEC8;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  int64_t v24 = a3;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v13 withRetryCount:1 proxyHandler:&v17];
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20);
}

uint64_t __96__MOEffectiveShieldSettings_handleAction_bundleIdentifier_categoryIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 handleAction:a1[7] bundleIdentifier:a1[4] categoryIdentifier:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

+ (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)[a1 newConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__MOEffectiveShieldSettings_handleAction_categoryIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E61CBEF0;
  id v15 = v9;
  int64_t v16 = a3;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v10 withRetryCount:1 proxyHandler:v13];
  [v10 invalidate];
}

uint64_t __79__MOEffectiveShieldSettings_handleAction_categoryIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 handleAction:a1[6] categoryIdentifier:a1[4] replyHandler:a1[5]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
}

+ (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[a1 newConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __89__MOEffectiveShieldSettings_handleAction_webDomain_categoryIdentifier_completionHandler___block_invoke;
  id v20 = &unk_1E61CBEC8;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  int64_t v24 = a3;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  +[MOXPCRemoteObjectProxy synchronousProxyFromConnection:v13 withRetryCount:1 proxyHandler:&v17];
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20);
}

uint64_t __89__MOEffectiveShieldSettings_handleAction_webDomain_categoryIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2) {
    return [a2 handleAction:a1[7] webDomain:a1[4] categoryIdentifier:a1[5] replyHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (MOEffectiveSettingsStore)store
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end