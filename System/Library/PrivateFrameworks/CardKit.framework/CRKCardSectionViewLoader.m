@interface CRKCardSectionViewLoader
@end

@implementation CRKCardSectionViewLoader

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v34 = a1;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!v5 && v6 && WeakRetained)
  {
    v32 = WeakRetained;
    [WeakRetained[3] addObject:v6];
    v9 = [v6 viewConfigurations];
    v10 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      uint64_t v12 = [v9 count];
      uint64_t v13 = *(void *)(v34 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v13;
      _os_log_impl(&dword_224F73000, v11, OS_LOG_TYPE_DEFAULT, "Successfully loaded %lu card section views configurations from provider\n    Provider: %@", buf, 0x16u);
    }
    id v33 = v6;
    v14 = [v6 providerIdentifier];
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [v21 _setProviderIdentifier:v14];
          v22 = +[CRKCardSectionViewController cardSectionViewControllerForViewConfiguration:v21];
          [v21 _setCardKitCardSectionViewController:v22];

          v23 = [v21 cardSection];

          if (v23)
          {
            v24 = [v21 cardSection];
            v25 = [v24 cardSectionIdentifier];
            [v15 setObject:v21 forKey:v25];
          }
          else
          {
            v26 = *MEMORY[0x263F31630];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
            {
              uint64_t v27 = *(void *)(v34 + 32);
              *(_DWORD *)buf = 138412546;
              uint64_t v41 = (uint64_t)v21;
              __int16 v42 = 2112;
              uint64_t v43 = v27;
              _os_log_error_impl(&dword_224F73000, v26, OS_LOG_TYPE_ERROR, "Card section view configuration does not have a card section; dropping\n"
                "    Configuration: %@\n"
                "    Provider: %@",
                buf,
                0x16u);
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v18);
    }

    v8 = v32;
    [v32[1] setObject:v15 forKey:v14];

    id v6 = v33;
  }
  else
  {
    v28 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_cold_1(v34, v28);
    }
  }
  uint64_t v29 = *(void *)(*(void *)(v34 + 48) + 8);
  if (v5) {
    BOOL v30 = *(unsigned char *)(v29 + 24) == 0;
  }
  else {
    BOOL v30 = 0;
  }
  char v31 = !v30;
  *(unsigned char *)(v29 + 24) = v31;
  dispatch_group_leave(*(dispatch_group_t *)(v34 + 40));
}

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v20 = a1;
    obuint64_t j = [*(id *)(a1 + 32) resolvedCardSections];
    uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v7 = WeakRetained[3];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0
                  && [v12 vetoDisplayOfCardSection:v6])
                {
                  uint64_t v13 = (void *)*MEMORY[0x263F31630];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
                  {
                    v14 = v13;
                    id v15 = [v12 providerIdentifier];
                    *(_DWORD *)buf = 138412802;
                    v32 = v6;
                    __int16 v33 = 2112;
                    uint64_t v34 = v12;
                    __int16 v35 = 2112;
                    long long v36 = v15;
                    _os_log_impl(&dword_224F73000, v14, OS_LOG_TYPE_DEFAULT, "Vetoing card section view display on behalf of provider\n    Card section: %@\n    Provider: %@\n    Provider identifier: %@", buf, 0x20u);
                  }
                  id v16 = WeakRetained[2];
                  uint64_t v17 = [v12 providerIdentifier];
                  uint64_t v18 = [v6 cardSectionIdentifier];
                  [v16 setObject:v17 forKey:v18];

                  goto LABEL_20;
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v37 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }
LABEL_20:
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v4);
    }

    objc_storeStrong(WeakRetained + 5, *(id *)(v20 + 32));
    uint64_t v19 = *(void *)(v20 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void))(v19 + 16))(v19, *(unsigned __int8 *)(*(void *)(*(void *)(v20 + 48) + 8) + 24));
    }
  }
}

uint64_t __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = [v8 cardSectionViewLoader:*(void *)(a1 + 32) compareCardSectionViewProviderOne:v5 providerTwo:v6];

    if (v9)
    {
      uint64_t v10 = (id)*MEMORY[0x263F31630];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v9 == -1) {
          v11 = v6;
        }
        else {
          v11 = v5;
        }
        if (v9 == -1) {
          uint64_t v12 = v5;
        }
        else {
          uint64_t v12 = v6;
        }
        uint64_t v13 = [v11 providerIdentifier];
        v14 = [v12 providerIdentifier];
        uint64_t v15 = *(void *)(a1 + 40);
        int v20 = 138412802;
        v21 = v13;
        __int16 v22 = 2112;
        long long v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v15;
        _os_log_impl(&dword_224F73000, v10, OS_LOG_TYPE_DEFAULT, "Delegate prefers %@ to %@ in terms of display priority for card section: %@", (uint8_t *)&v20, 0x20u);
      }
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (objc_opt_respondsToSelector()) {
    unint64_t v16 = [v5 displayPriorityForCardSection:*(void *)(a1 + 40)];
  }
  else {
    unint64_t v16 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    unint64_t v17 = [v6 displayPriorityForCardSection:*(void *)(a1 + 40)];
  }
  else {
    unint64_t v17 = 0;
  }
  uint64_t v18 = 1;
  if (v16 <= v17) {
    uint64_t v18 = -1;
  }
  if (v16 == v17) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v18;
  }
LABEL_24:

  return v9;
}

BOOL __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [a2 providerIdentifier];
  id v5 = [v3 objectForKey:v4];

  id v6 = [*(id *)(a1 + 40) cardSectionIdentifier];
  id v7 = [v5 objectForKey:v6];

  return v7 != 0;
}

void __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_224F73000, a2, OS_LOG_TYPE_ERROR, "Failed to load card section views from provider\n    Provider: %@", (uint8_t *)&v3, 0xCu);
}

@end