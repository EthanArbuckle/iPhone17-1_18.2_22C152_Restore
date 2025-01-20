@interface MUPlaceExtensionDiscoveryManager
- (BOOL)canShowExtensionReservation;
- (BOOL)isPerformingDiscovery;
- (BOOL)isReservationProviderAppInstalled;
- (MUPlaceExtensionDiscoveryManager)initWithExtensionDataItems:(id)a3 amsResultProvider:(id)a4;
- (id)discoveryResultForDataItem:(id)a3;
- (void)_loadAppLockupExtensionGroupsUsingAppIdentifiers:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_performExtensionDiscoveryUsingExtensionGroups:(id)a3 usingAppIdentifiers:(id)a4 completion:(id)a5;
- (void)performExtensionDiscoveryWithOptions:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
@end

@implementation MUPlaceExtensionDiscoveryManager

- (MUPlaceExtensionDiscoveryManager)initWithExtensionDataItems:(id)a3 amsResultProvider:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MUPlaceExtensionDiscoveryManager;
  v9 = [(MUPlaceExtensionDiscoveryManager *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionDataItems, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extensionsByAppIds = v10->_extensionsByAppIds;
    v10->_extensionsByAppIds = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    vendorIdsByAppIds = v10->_vendorIdsByAppIds;
    v10->_vendorIdsByAppIds = v13;

    objc_storeStrong((id *)&v10->_amsResultProvider, a4);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "vendorIdentifier", (void)v25);
          v22 = v10->_vendorIdsByAppIds;
          v23 = [v20 appBundleIdentifier];
          [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }
  }
  return v10;
}

- (id)discoveryResultForDataItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 appBundleIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self->_extensionDiscoveryResults;
    id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "vendorIdentifier", (void)v16);
          v13 = [v4 vendorIdentifier];
          char v14 = [v12 isEqual:v13];

          if (v14)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)performExtensionDiscoveryWithOptions:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if (v10)
  {
    if (!v9)
    {
      id v9 = (id)MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
    }
    if ([(NSMutableDictionary *)self->_extensionsByAppIds count])
    {
      v12 = (void *)[(NSArray *)self->_extensionDiscoveryResults copy];
      v10[2](v10, v12, 0);
    }
    else
    {
      v13 = MUMap(self->_extensionDataItems, &__block_literal_global_36);
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_2;
      v15[3] = &unk_1E5750768;
      id v9 = v9;
      id v16 = v9;
      long long v18 = v10;
      objc_copyWeak(&v19, &location);
      id v14 = v13;
      id v17 = v14;
      [(MUPlaceExtensionDiscoveryManager *)self _loadAppLockupExtensionGroupsUsingAppIdentifiers:v14 options:v8 completion:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appBundleIdentifier];
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E57502D8;
    id v18 = *(id *)(a1 + 48);
    id v17 = v6;
    dispatch_async(v7, block);

    id WeakRetained = v18;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_4;
      v10[3] = &unk_1E5750740;
      uint64_t v9 = *(void *)(a1 + 40);
      id v11 = *(id *)(a1 + 32);
      id v14 = *(id *)(a1 + 48);
      id v12 = 0;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      id v13 = WeakRetained;
      [WeakRetained _performExtensionDiscoveryUsingExtensionGroups:v5 usingAppIdentifiers:v9 completion:v10];
      objc_destroyWeak(&v15);
    }
  }
}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_5;
    block[3] = &unk_1E57502D8;
    id v18 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

    id v7 = v18;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_6;
      v15[3] = &unk_1E5750718;
      void v15[4] = WeakRetained;
      uint64_t v9 = MUMap(v5, v15);
      v10 = (void *)v7[4];
      v7[4] = v9;

      id v11 = *(NSObject **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_7;
      v13[3] = &unk_1E57502D8;
      id v12 = *(id *)(a1 + 56);
      v13[4] = *(void *)(a1 + 48);
      id v14 = v12;
      dispatch_async(v11, v13);
    }
  }
}

uint64_t __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

MUPlaceExtensionDiscoveryResult *__98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MUPlaceExtensionDiscoveryResult alloc];
  id v5 = [v3 bestExtensionToUse];
  id v6 = [v3 appStoreApp];
  id v7 = *(void **)(*(void *)(a1 + 32) + 16);
  id v8 = [v3 appIdentifier];

  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  v10 = [(MUPlaceExtensionDiscoveryResult *)v4 initWithExtension:v5 appStoreApp:v6 vendorIdentifier:v9];

  return v10;
}

void __98__MUPlaceExtensionDiscoveryManager_performExtensionDiscoveryWithOptions_callbackQueue_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_loadAppLockupExtensionGroupsUsingAppIdentifiers:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  amsResultProvider = self->_amsResultProvider;
  id v12 = (void *)[v8 copy];
  uint64_t v13 = MEMORY[0x1E4F14428];
  id v14 = MEMORY[0x1E4F14428];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke;
  v17[3] = &unk_1E574EBB8;
  id v15 = v10;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  id v16 = v8;
  id v18 = v16;
  [(MUAMSResultProvider *)amsResultProvider fetchResultsForBundleIds:v12 options:v9 callbackQueue:v13 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke_2;
      v8[3] = &unk_1E5750790;
      id v9 = *(id *)(a1 + 32);
      id v7 = MUMap(v5, v8);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

_MUExtensionGroup *__104__MUPlaceExtensionDiscoveryManager__loadAppLockupExtensionGroupsUsingAppIdentifiers_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 iOSBundleIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4
    && ([v3 iOSBundleIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v7))
  {
    id v8 = [_MUExtensionGroup alloc];
    id v9 = [v3 iOSBundleIdentifier];
    id v10 = [(_MUExtensionGroup *)v8 initWithAppIdentifier:v9];

    [(_MUExtensionGroup *)v10 setAppStoreApp:v3];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_performExtensionDiscoveryUsingExtensionGroups:(id)a3 usingAppIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F31128] lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifiers:v9];
  objc_initWeak(&location, self);
  id v12 = (void *)MEMORY[0x1E4F31128];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__MUPlaceExtensionDiscoveryManager__performExtensionDiscoveryUsingExtensionGroups_usingAppIdentifiers_completion___block_invoke;
  v17[3] = &unk_1E57507B8;
  id v13 = v10;
  id v19 = v13;
  id v14 = v8;
  id v18 = v14;
  objc_copyWeak(&v20, &location);
  id v15 = [v12 managerWithExtensionLookupPolicy:v11 updateHandler:v17];
  extensionManager = self->_extensionManager;
  self->_extensionManager = v15;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __114__MUPlaceExtensionDiscoveryManager__performExtensionDiscoveryUsingExtensionGroups_usingAppIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MUGetPlaceExtensionDiscoveryManagerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v6;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_ERROR, "Failed to discover the extension with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if ([v5 count])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v30 = a1;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = *(id *)(a1 + 32);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v38 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v14 = v5;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v34 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  objc_msgSend(v13, "addExtensionIfMatchedAppIdentifier:", *(void *)(*((void *)&v33 + 1) + 8 * j), v30);
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v16);
            }

            id v19 = [v13 bestExtensionToUse];
            if (v19)
            {
              [v32 addObject:v19];
              id v20 = (void *)WeakRetained[3];
              uint64_t v21 = [v19 _containingAppIdentifer];
              [v20 setObject:v19 forKey:v21];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v10);
      }

      if ([v32 count])
      {
        uint64_t v22 = *(void *)(v30 + 40);
        v23 = (void *)[*(id *)(v30 + 32) copy];
        (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
      }
      else
      {
        long long v27 = MUGetPlaceExtensionDiscoveryManagerLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1931EA000, v27, OS_LOG_TYPE_INFO, "We have no non-ui extensions, so early return", buf, 2u);
        }

        long long v28 = (void *)MEMORY[0x1E4F28C58];
        objc_super v29 = GEOErrorDomain();
        v23 = [v28 errorWithDomain:v29 code:-8 userInfo:0];

        (*(void (**)(void, void, void *))(*(void *)(v30 + 40) + 16))(*(void *)(v30 + 40), 0, v23);
      }
      id v6 = 0;
    }
  }
  else
  {
    v24 = MUGetPlaceExtensionDiscoveryManagerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v24, OS_LOG_TYPE_INFO, "There are no extensions installed.  Early return.", buf, 2u);
    }

    uint64_t v25 = *(void *)(a1 + 40);
    long long v26 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, void *, void))(v25 + 16))(v25, v26, 0);
  }
}

- (BOOL)isPerformingDiscovery
{
  return self->_performingDiscovery;
}

- (BOOL)canShowExtensionReservation
{
  return self->_canShowExtensionReservation;
}

- (BOOL)isReservationProviderAppInstalled
{
  return self->_reservationProviderAppInstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_extensionDiscoveryResults, 0);
  objc_storeStrong((id *)&self->_extensionsByAppIds, 0);
  objc_storeStrong((id *)&self->_vendorIdsByAppIds, 0);
  objc_storeStrong((id *)&self->_extensionDataItems, 0);
}

@end