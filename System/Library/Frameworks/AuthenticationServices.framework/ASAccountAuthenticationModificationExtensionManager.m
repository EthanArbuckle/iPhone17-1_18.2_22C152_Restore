@interface ASAccountAuthenticationModificationExtensionManager
@end

@implementation ASAccountAuthenticationModificationExtensionManager

uint64_t __69___ASAccountAuthenticationModificationExtensionManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

void __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_2;
    block[3] = &unk_2643954B8;
    block[4] = WeakRetained;
    id v11 = v6;
    id v12 = v5;
    dispatch_async(v9, block);
  }
}

void __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_2(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 40) != 0;
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _endExtensionDiscovery];
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_resume(v2);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 48));
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_3;
    v3[3] = &unk_264395780;
    v3[4] = *(void *)(a1 + 32);
    [MEMORY[0x263F665A0] getAllApprovedSharedWebCredentialsEntries:v3];
  }
}

uint64_t __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:a2];
}

void __129___ASAccountAuthenticationModificationExtensionManager__buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v24 = a1;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x263F01868];
        v9 = [v7 _plugIn];
        v10 = [v9 containingUrl];
        id v11 = [v8 applicationProxyForBundleURL:v10];
        id v12 = [v11 bundleIdentifier];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v13 = [*(id *)(v24 + 40) objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              [v2 setObject:v7 forKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * j)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v15);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  uint64_t v18 = *(void *)(v24 + 32);
  v19 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v2;
  id v20 = v2;

  dispatch_resume(*(dispatch_object_t *)(*(void *)(v24 + 32) + 16));
  v21 = *(id **)(v24 + 32);
  v22 = [v21[6] array];
  [v21 _notifyObservers:v22];
}

void __93___ASAccountAuthenticationModificationExtensionManager_extensionForDomain_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 56)) {
      [WeakRetained _beginExtensionDiscovery];
    }
    uint64_t v3 = [MEMORY[0x263F66570] domainByStrippingSubdomainWildcardPrefixIfNecessary:*(void *)(a1 + 32)];
    uint64_t v4 = objc_msgSend(v3, "safari_highLevelDomainFromHost");

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v7[4] objectForKeyedSubscript:v4];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __74___ASAccountAuthenticationModificationExtensionManager_addChangeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (result == 1)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _beginExtensionDiscovery];
  }
  return result;
}

uint64_t __77___ASAccountAuthenticationModificationExtensionManager_removeChangeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _endExtensionDiscovery];
  }
  return result;
}

void __73___ASAccountAuthenticationModificationExtensionManager__notifyObservers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "accountModificationExtensionManagerExtensionListDidChange:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end