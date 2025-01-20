@interface SOExtensionFinder
- (SOExtensionFinder)init;
- (id)_soExtensionsForExtensions:(id)a3;
- (void)beginMatchingExtensionsWithCompletion:(id)a3;
- (void)endMatchingExtensions;
- (void)findExtensionWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)findExtensionsWithCompletion:(id)a3;
@end

@implementation SOExtensionFinder

- (SOExtensionFinder)init
{
  v6.receiver = self;
  v6.super_class = (Class)SOExtensionFinder;
  v2 = [(SOExtensionFinder *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AppSSO.extension-finder-queue", 0);
    extensionFinderQueue = v2->_extensionFinderQueue;
    v2->_extensionFinderQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)findExtensionsWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOExtensionFinder findExtensionsWithCompletion:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  extensionFinderQueue = self->_extensionFinderQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke;
  v8[3] = &unk_26432A4B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(extensionFinderQueue, v8);
}

void __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08800];
  uint64_t v15 = *MEMORY[0x263F07FF8];
  v16[0] = @"com.apple.AppSSO.idp-extension";
  dispatch_queue_t v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v10 = 0;
  id v4 = [v2 extensionsWithMatchingAttributes:v3 error:&v10];
  id v5 = v10;

  objc_super v6 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1();
  }

  if (v5)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _soExtensionsForExtensions:v4];
  }
  v8 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "findExtensionsWithCompletion: %{public}@, error: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v5);
  }
}

- (void)findExtensionWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SOExtensionFinder findExtensionWithBundleIdentifier:completion:]";
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %@", buf, 0x20u);
  }

  extensionFinderQueue = self->_extensionFinderQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__SOExtensionFinder_findExtensionWithBundleIdentifier_completion___block_invoke;
  block[3] = &unk_26432A4E0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(extensionFinderQueue, block);
}

void __66__SOExtensionFinder_findExtensionWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08800];
  uint64_t v3 = *MEMORY[0x263F07FE0];
  v22[0] = *MEMORY[0x263F07FF8];
  v22[1] = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  v23[0] = @"com.apple.AppSSO.idp-extension";
  v23[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v17 = 0;
  id v6 = [v2 extensionsWithMatchingAttributes:v5 error:&v17];
  id v7 = v17;

  v8 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1();
  }

  if (v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) _soExtensionsForExtensions:v6];
  }
  if ([v9 count] == 1)
  {
    id v10 = [v9 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v11 = [v9 count];
    id SOErrorHelperClass_5 = getSOErrorHelperClass_5();
    if (v11) {
      [NSString stringWithFormat:@"More than one IdP extension with bundle ID: %@", *(void *)(a1 + 32)];
    }
    else {
    id v13 = [NSString stringWithFormat:@"No valid IdP extension with bundle ID: %@", *(void *)(a1 + 32)];
    }
    uint64_t v14 = [SOErrorHelperClass_5 internalErrorWithMessage:v13];

    id v10 = 0;
    id v7 = (id)v14;
  }
  id v15 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_2185C9000, v15, OS_LOG_TYPE_DEFAULT, "findExtensionWithBundleIdentifier: %{public}@, error: %{public}@", buf, 0x16u);
  }

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v10, v7);
  }
}

- (void)beginMatchingExtensionsWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[SOExtensionFinder beginMatchingExtensionsWithCompletion:]";
    __int16 v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (self->_matchingContext)
  {
    id v6 = SO_LOG_SOExtensionFinder();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SOExtensionFinder beginMatchingExtensionsWithCompletion:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    if (v4)
    {
      uint64_t v14 = [getSOErrorHelperClass_5() silentInternalErrorWithMessage:@"Extension matching is already in progress, ignoring request"];
      v4[2](v4, 0, v14);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v15 = (void *)MEMORY[0x263F08800];
    uint64_t v22 = *MEMORY[0x263F07FF8];
    v23 = @"com.apple.AppSSO.idp-extension";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke;
    v19[3] = &unk_26432ADF0;
    objc_copyWeak(&v21, (id *)buf);
    __int16 v20 = v4;
    id v17 = [v15 beginMatchingExtensionsWithAttributes:v16 completion:v19];
    id matchingContext = self->_matchingContext;
    self->_id matchingContext = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_2();
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained[1];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_17;
    v21[3] = &unk_26432A580;
    id v22 = v6;
    v23 = v9;
    id v24 = v5;
    id v25 = *(id *)(a1 + 32);
    dispatch_async(v10, v21);

    uint64_t v11 = v22;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20)
  {
    uint64_t v11 = [getSOErrorHelperClass_5() silentInternalErrorWithMessage:@"Extension matching deallocated, request failed"];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_17(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = 0;
  }
  else
  {
    v2 = [*(id *)(a1 + 40) _soExtensionsForExtensions:*(void *)(a1 + 48)];
  }
  uint64_t v3 = SO_LOG_SOExtensionFinder();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "beginMatchingExtensionsWithCompletion: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v2, *(void *)(a1 + 32));
  }
}

- (void)endMatchingExtensions
{
}

- (id)_soExtensionsForExtensions:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [SOExtension alloc];
        uint64_t v12 = -[SOExtension initWithExtension:](v11, "initWithExtension:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_extensionFinderQueue, 0);
}

void __50__SOExtensionFinder_findExtensionsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "extensionsWithMatchingAttributes: %{public}@, error: %{public}@");
}

- (void)beginMatchingExtensionsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__SOExtensionFinder_beginMatchingExtensionsWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_2185C9000, v0, v1, "beginMatchingExtensionsWithAttributes: %{public}@, error: %{public}@");
}

@end