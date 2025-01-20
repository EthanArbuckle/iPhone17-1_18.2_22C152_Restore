@interface MFMailAccountProxySource
@end

@implementation MFMailAccountProxySource

void __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[MFMailAccountProxy log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(v6, "ef_publicDescription");
      __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke_cold_1(v8, buf, v7);
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = v5;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v13 = [MFMailAccountProxy alloc];
          id v14 = -[MFMailAccountProxy _initWithProperties:](v13, "_initWithProperties:", v12, (void)v15);
          [*(id *)(a1 + 32) addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __58___MFMailAccountProxySource__registerForNotifications_nts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetAccountsChanged:1];
}

void __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "error retrieving account information: %{public}@", buf, 0xCu);
}

@end