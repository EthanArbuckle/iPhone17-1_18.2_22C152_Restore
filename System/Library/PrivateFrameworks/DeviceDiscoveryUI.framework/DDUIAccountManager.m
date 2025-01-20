@interface DDUIAccountManager
@end

@implementation DDUIAccountManager

void __58___DDUIAccountManager_altDsidForiCloudAccount_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) iCloudToAltDSIDDictionary];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __65___DDUIAccountManager_nameComponentsForiCloudAccount_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) iCloudToNameComponentsDictionary];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __68___DDUIAccountManager__updateMemberDataForiCloudAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = [v3 altDSID];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v6 = [WeakRetained iCloudToAltDSIDDictionary];
    [v6 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];

    id v11 = objc_alloc_init(MEMORY[0x263F08A68]);
    v7 = [v3 firstName];
    [v11 setGivenName:v7];

    v8 = [v3 lastName];

    [v11 setFamilyName:v8];
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = [v9 iCloudToNameComponentsDictionary];
    [v10 setObject:v11 forKeyedSubscript:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create((const char *)*MEMORY[0x263F39800], "core");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
    }

    [*(id *)(a1 + 32) setEnabled:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v5, "members", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) appleID];
        int v14 = [v13 isEqualToString:*(void *)(a1 + 40)];

        if (v14)
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:
}

void __69___DDUIAccountManager__findMemberForiCloudAccount_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24CAF4000, a2, OS_LOG_TYPE_ERROR, "There was an error fetching from the family circle %@", (uint8_t *)&v2, 0xCu);
}

@end