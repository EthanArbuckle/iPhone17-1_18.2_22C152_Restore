@interface ACHBackCompatMonthlyChallengeListener
- (ACHBackCompatMonthlyChallengeListener)initWithProfile:(id)a3 templateStore:(id)a4;
- (ACHTemplateStore)templateStore;
- (BOOL)_readAndSaveBackCompatDefinitions;
- (HDProfile)profile;
- (NSDictionary)injectedKeyValuePairs;
- (id)_definitionsFromKeyValuePairs:(id)a3;
- (id)readTemplatesBlock;
- (void)_protectedNanoUserDefaultsDidSyncWithNotification:(id)a3;
- (void)_readAndSaveBackCompatDefinitions;
- (void)daemonReady:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)setInjectedKeyValuePairs:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReadTemplatesBlock:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation ACHBackCompatMonthlyChallengeListener

- (ACHBackCompatMonthlyChallengeListener)initWithProfile:(id)a3 templateStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHBackCompatMonthlyChallengeListener;
  v8 = [(ACHBackCompatMonthlyChallengeListener *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeWeak((id *)&v9->_templateStore, v7);
    v10 = [v6 daemon];
    [v10 registerForDaemonReady:v9];
  }
  return v9;
}

- (void)daemonReady:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 addObserver:self selector:sel__protectedNanoUserDefaultsDidSyncWithNotification_ name:*MEMORY[0x263F43068] object:0];

  v5 = [(ACHBackCompatMonthlyChallengeListener *)self profile];
  id v6 = [v5 database];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACHBackCompatMonthlyChallengeListener_daemonReady___block_invoke;
  v7[3] = &unk_264515DB8;
  v7[4] = self;
  [v6 performWhenDataProtectedByFirstUnlockIsAvailable:v7];
}

void __53__ACHBackCompatMonthlyChallengeListener_daemonReady___block_invoke(uint64_t a1)
{
  v2 = ACHLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F5DA000, v2, OS_LOG_TYPE_DEFAULT, "Trying to read dynamic definitions because data protected by first unlock is now available.", buf, 2u);
  }

  int v3 = [*(id *)(a1 + 32) _readAndSaveBackCompatDefinitions];
  v4 = ACHLogDefault();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic definitions saved, not observing protected data.", v8, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "Dynamic definitions read failed, observing protected data changes.", v7, 2u);
    }

    v4 = [*(id *)(a1 + 32) profile];
    id v6 = [v4 database];
    [v6 addProtectedDataObserver:*(void *)(a1 + 32)];
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = ACHLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Protected data available and dynamic definitions never read, trying to read and save.", buf, 2u);
    }

    BOOL v6 = [(ACHBackCompatMonthlyChallengeListener *)self _readAndSaveBackCompatDefinitions];
    id v7 = ACHLogDefault();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions saved, removing protected data observation.", buf, 2u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__ACHBackCompatMonthlyChallengeListener_database_protectedDataDidBecomeAvailable___block_invoke;
      block[3] = &unk_264515DB8;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions read failed, will try again on next protected data availability.", buf, 2u);
      }
    }
  }
}

void __82__ACHBackCompatMonthlyChallengeListener_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) profile];
  v2 = [v3 database];
  [v2 removeProtectedDataObserver:*(void *)(a1 + 32)];
}

- (void)_protectedNanoUserDefaultsDidSyncWithNotification:(id)a3
{
  v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F43058]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = objc_msgSend(v5, "hk_firstObjectPassingTest:", &__block_literal_global_10);
    if (v6)
    {
      id v7 = ACHLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic definitions synced, creating and writing templates.", v8, 2u);
      }

      [(ACHBackCompatMonthlyChallengeListener *)self _readAndSaveBackCompatDefinitions];
    }
  }
}

uint64_t __91__ACHBackCompatMonthlyChallengeListener__protectedNanoUserDefaultsDidSyncWithNotification___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"HKAchievementType"];
}

- (BOOL)_readAndSaveBackCompatDefinitions
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F43218]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v5 = (void *)[v3 initWithCategory:105 domainName:@"DynamicAchievements" profile:WeakRetained];

  id v48 = 0;
  BOOL v6 = [v5 allValuesWithError:&v48];
  id v7 = v48;
  BOOL v8 = [(ACHBackCompatMonthlyChallengeListener *)self injectedKeyValuePairs];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    v10 = [(ACHBackCompatMonthlyChallengeListener *)self injectedKeyValuePairs];
    v11 = v10;
    if (v6) {
      id v12 = (id)objc_msgSend(v6, "hk_dictionaryByAddingEntriesFromDictionary:", v10);
    }
    else {
      BOOL v6 = (void *)[v10 copy];
    }
  }
  if (!v7)
  {
    v13 = [(ACHBackCompatMonthlyChallengeListener *)self _definitionsFromKeyValuePairs:v6];
    v15 = ACHLogDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v13 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Read %lu back-compat dynamic definitions from the key-value store: %@", buf, 0x16u);
    }

    v17 = [v13 hk_map:&__block_literal_global_294];
    if (![v17 count])
    {
      v35 = [(ACHBackCompatMonthlyChallengeListener *)self readTemplatesBlock];

      if (v35)
      {
        v36 = [(ACHBackCompatMonthlyChallengeListener *)self readTemplatesBlock];
        v36[2](v36, MEMORY[0x263EFFA68]);
      }
      v37 = ACHLogDefault();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F5DA000, v37, OS_LOG_TYPE_DEFAULT, "No templates were created from back-compat dynamic definitions.", buf, 2u);
      }

      id v7 = 0;
      goto LABEL_32;
    }
    v18 = ACHLogDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v17 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "Created %lu templates from back-compat dynamic definitions: %@", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__9;
    v53 = __Block_byref_object_dispose__9;
    id v54 = (id)MEMORY[0x263EFFA68];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_295;
    v47[3] = &unk_264516D80;
    v47[4] = buf;
    v20 = objc_msgSend(v17, "hk_map:", v47);
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    v22 = [(ACHBackCompatMonthlyChallengeListener *)self templateStore];
    v23 = [v22 allTemplates];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_2;
    v43[3] = &unk_264516DD0;
    id v39 = v20;
    id v44 = v39;
    v46 = buf;
    id v24 = v21;
    id v45 = v24;
    v25 = objc_msgSend(v23, "hk_map:", v43);

    v26 = (void *)MEMORY[0x263F08A98];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_4;
    v41[3] = &unk_264516648;
    id v27 = v24;
    id v42 = v27;
    v28 = [v26 predicateWithBlock:v41];
    v29 = [v17 filteredArrayUsingPredicate:v28];

    if ([v25 count]
      && ([(ACHBackCompatMonthlyChallengeListener *)self templateStore],
          v30 = objc_claimAutoreleasedReturnValue(),
          id v40 = 0,
          [v30 removeTemplates:v25 error:&v40],
          id v7 = v40,
          v30,
          v7))
    {
      v31 = ACHLogDefault();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v49 = 138412290;
        id v50 = v7;
        _os_log_impl(&dword_21F5DA000, v31, OS_LOG_TYPE_DEFAULT, "Back compat monthly challenge listener failed to remove existing templates: %@", v49, 0xCu);
      }
      char v32 = 0;
    }
    else
    {
      v33 = [(ACHBackCompatMonthlyChallengeListener *)self readTemplatesBlock];

      if (v33)
      {
        v34 = [(ACHBackCompatMonthlyChallengeListener *)self readTemplatesBlock];
        ((void (**)(void, void *))v34)[2](v34, v29);
      }
      if (![v29 count])
      {
        id v7 = 0;
        char v32 = 1;
LABEL_31:

        _Block_object_dispose(buf, 8);
        if ((v32 & 1) == 0)
        {
          BOOL v14 = 0;
          goto LABEL_34;
        }
LABEL_32:
        BOOL v14 = 1;
LABEL_34:

        goto LABEL_35;
      }
      v31 = [(ACHBackCompatMonthlyChallengeListener *)self templateStore];
      [v31 addTemplates:v29];
      id v7 = 0;
      char v32 = 1;
    }

    goto LABEL_31;
  }
  v13 = ACHLogDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    [(ACHBackCompatMonthlyChallengeListener *)(uint64_t)v7 _readAndSaveBackCompatDefinitions];
  }
  BOOL v14 = 0;
LABEL_35:

  return v14;
}

uint64_t __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 template];
}

id __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 uniqueName];
  BOOL v5 = [v4 componentsSeparatedByString:@"_"];

  if ([v5 count] == 3)
  {
    BOOL v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = [v3 uniqueName];
    uint64_t v8 = [v6 arrayByAddingObject:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = NSString;
    id v12 = [v5 objectAtIndexedSubscript:1];
    v13 = [v5 objectAtIndexedSubscript:2];
    BOOL v14 = [v11 stringWithFormat:@"%@_%@", v12, v13];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

id __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (ACHTemplateIsMonthlyChallenge())
  {
    uint64_t v13 = 0;
    BOOL v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__9;
    v17 = __Block_byref_object_dispose__9;
    id v18 = 0;
    v4 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_3;
    v9[3] = &unk_264516DA8;
    id v10 = v3;
    id v12 = &v13;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v5 = (id)v8;
    long long v11 = v8;
    [v4 enumerateObjectsUsingBlock:v9];
    id v6 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 uniqueName];
  int v8 = [v7 containsString:v6];

  if (v8)
  {
    id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndexedSubscript:a3];
    uint64_t v9 = [*(id *)(a1 + 32) uniqueName];
    char v10 = [v9 isEqualToString:v11];

    if (v10) {
      [*(id *)(a1 + 40) addObject:v11];
    }
    else {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
    }
  }
}

uint64_t __74__ACHBackCompatMonthlyChallengeListener__readAndSaveBackCompatDefinitions__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueName];
  LODWORD(v2) = [v2 containsObject:v3];

  return v2 ^ 1;
}

- (id)_definitionsFromKeyValuePairs:(id)a3
{
  id v3 = a3;
  v4 = [v3 allKeys];
  id v5 = objc_msgSend(v4, "hk_filter:", &__block_literal_global_309);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke_2;
  v9[3] = &unk_264516DF8;
  id v10 = v3;
  id v6 = v3;
  id v7 = objc_msgSend(v5, "hk_map:", v9);

  return v7;
}

uint64_t __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"HKAchievementType"];
}

id __71__ACHBackCompatMonthlyChallengeListener__definitionsFromKeyValuePairs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v3 = [MEMORY[0x263F23650] definitionFromData:v2];

  return v3;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  return (ACHTemplateStore *)WeakRetained;
}

- (void)setTemplateStore:(id)a3
{
}

- (id)readTemplatesBlock
{
  return self->_readTemplatesBlock;
}

- (void)setReadTemplatesBlock:(id)a3
{
}

- (NSDictionary)injectedKeyValuePairs
{
  return self->_injectedKeyValuePairs;
}

- (void)setInjectedKeyValuePairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedKeyValuePairs, 0);
  objc_storeStrong(&self->_readTemplatesBlock, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_readAndSaveBackCompatDefinitions
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Failed to read legacy dynamic definitions from key value domain with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end