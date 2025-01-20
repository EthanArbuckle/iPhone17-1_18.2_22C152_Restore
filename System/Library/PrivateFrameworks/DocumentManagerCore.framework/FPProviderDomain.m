@interface FPProviderDomain
@end

@implementation FPProviderDomain

void __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v5, "allValues", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v13 supportsEnumeration]
            && [v13 isEnabled]
            && (*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
          {
            v14 = *(void **)(a1 + 32);
            v15 = [v13 providerID];
            [v14 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __81__FPProviderDomain_DOCDomainCache__allowedFileProviderBundleIdentifiersFiltered___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "Error while trying to search sources. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end