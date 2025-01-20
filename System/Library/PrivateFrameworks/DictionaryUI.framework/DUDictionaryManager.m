@interface DUDictionaryManager
+ (id)assetManager;
- (BOOL)_hasDefinitionForTerm:(id)a3;
- (DUDictionaryManager)init;
- (NSArray)availableDefinitionDictionaries;
- (id)_allAvailableDefinitionDictionaries;
- (id)_availableDictionaryAssets;
- (id)_definitionValuesForTerm:(id)a3;
- (int64_t)_compareOrderOfDictionary:(id)a3 withDictionary:(id)a4;
- (void)_downloadDictionaryAssetCatalogWithTimeout:(int64_t)a3 completion:(id)a4;
- (void)_migrateInstalledStateForNewDictionaries:(id)a3;
@end

@implementation DUDictionaryManager

- (id)_allAvailableDefinitionDictionaries
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v26 = [(DUDictionaryManager *)self _availableDictionaryAssets];
  v27 = [MEMORY[0x263EFF960] preferredLanguages];
  if (v26)
  {
    v2 = [MEMORY[0x263EFF980] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v3 = v26;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v44 != v5) {
            objc_enumerationMutation(v3);
          }
          v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v8 = [v7 _formatVersion];
          if (v8 == MEMORY[0x237DB70A0]())
          {
            v9 = [[DUDefinitionDictionary alloc] initWithAsset:v7];
            if (v9)
            {
              if ([v7 state] != 1) {
                [(DUDefinitionDictionary *)v9 setActivated:1];
              }
              v10 = [v7 attributes];
              [(DUDefinitionDictionary *)v9 setPreferredOrder:MEMORY[0x237DB70D0](v10, v27)];

              [v2 addObject:v9];
            }
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v4);
    }

    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke;
    v42[3] = &unk_264BDBB40;
    v42[4] = self;
    [v2 sortUsingComparator:v42];
  }
  else
  {
    v2 = 0;
  }
  [v2 _filteredArrayOfObjectsPassingTest:&__block_literal_global_456];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_3;
        v33[3] = &unk_264BDBB88;
        v33[4] = v14;
        v33[5] = &v38;
        v15 = [v2 _filteredArrayOfObjectsPassingTest:v33];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v47 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v16);
              }
              [v2 removeObject:*(void *)(*((void *)&v29 + 1) + 8 * k)];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v47 count:16];
          }
          while (v17);
        }

        v20 = [v14 rawAsset];
        if (![v16 count] && objc_msgSend(v20, "state") == 3)
        {
          [v2 removeObject:v14];
          uint64_t v21 = [v20 purgeSync];
          *((unsigned char *)v39 + 24) = 1;
          v22 = [v20 attributes];
          v23 = [v22 objectForKeyedSubscript:@"DictionaryIdentifier"];
          NSLog(&cfstr_DictionaryuiAl.isa, v23, v21);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v11);
  }

  if (self->_initiallyEmptyAssets && [v2 count] && !objc_msgSend(obj, "count"))
  {
    [(DUDictionaryManager *)self _migrateInstalledStateForNewDictionaries:v2];
    self->_initiallyEmptyAssets = 0;
  }
  objc_storeStrong((id *)&self->_availableDefinitionDictionaries, v2);
  _Block_object_dispose(&v38, 8);

  return v2;
}

- (id)_availableDictionaryAssets
{
  id v3 = objc_alloc(MEMORY[0x263F55950]);
  uint64_t v4 = [(DUDictionaryManager *)self _dictionaryAssetType];
  uint64_t v5 = (void *)[v3 initWithType:v4];

  [v5 returnTypes:2];
  [v5 setDoNotBlockBeforeFirstUnlock:1];
  uint64_t v6 = [v5 queryMetaDataSync];
  if (v6)
  {
    NSLog(&cfstr_DictionaryuiDu.isa, v6);
    v7 = 0;
  }
  else
  {
    v7 = [v5 results];
  }

  return v7;
}

- (DUDictionaryManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUDictionaryManager;
  v2 = [(DUDictionaryManager *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(DUDictionaryManager *)v2 _allAvailableDefinitionDictionaries];
    availableDefinitionDictionaries = v3->_availableDefinitionDictionaries;
    v3->_availableDefinitionDictionaries = (NSArray *)v4;

    v3->_initiallyEmptyAssets = [(NSArray *)v3->_availableDefinitionDictionaries count] == 0;
  }
  return v3;
}

+ (id)assetManager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_availableDefinitionDictionaries;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_hasDefinitionForTerm:", v5, (void)v11))
          {
            LOBYTE(v7) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)_definitionValuesForTerm:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_availableDefinitionDictionaries;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "activated", (void)v15))
        {
          long long v12 = [v11 _definitionValueForTerm:v4];
          long long v13 = v12;
          if (v12 && [v12 foundRecordRefs]) {
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_downloadDictionaryAssetCatalogWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  [v7 setAllowsCellularAccess:1];
  [v7 setDiscretionary:0];
  [v7 setTimeoutIntervalForResource:a3];
  uint64_t v8 = (void *)MEMORY[0x263F55938];
  uint64_t v9 = [(DUDictionaryManager *)self _dictionaryAssetType];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__DUDictionaryManager__downloadDictionaryAssetCatalogWithTimeout_completion___block_invoke;
  v11[3] = &unk_264BDBB18;
  id v12 = v6;
  id v10 = v6;
  [v8 startCatalogDownload:v9 options:v7 then:v11];
}

uint64_t __77__DUDictionaryManager__downloadDictionaryAssetCatalogWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x237DB7190]();
  uint64_t v8 = [*(id *)(a1 + 32) _compareOrderOfDictionary:v5 withDictionary:v6];

  return v8;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 rawAsset];
  uint64_t v3 = [v2 wasLocal];

  return v3;
}

uint64_t __58__DUDictionaryManager__allAvailableDefinitionDictionaries__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) localizedDictionaryName];
  id v5 = [v3 localizedDictionaryName];
  if (([v4 isEqual:v5] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v6 = [v3 rawAsset];
  char v7 = [v6 wasLocal];

  if (v7)
  {
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v3 rawAsset];
  [v8 setAssetToUpgrade:v9];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = 1;
  *(unsigned char *)(v10 + 24) = 1;
LABEL_6:

  return v11;
}

- (int64_t)_compareOrderOfDictionary:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 preferredOrder];
  uint64_t v8 = [v6 preferredOrder];
  if (v7 == -1 && v8 == -1)
  {
    uint64_t v9 = [v5 localizedSortName];
    uint64_t v10 = [v6 localizedSortName];
    uint64_t v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = &stru_26E6B3A00;
    }
    int64_t v13 = [v9 localizedStandardCompare:v12];
  }
  else if (v7 == -1 || v8 == -1)
  {
    if (v7 == -1) {
      int64_t v13 = 1;
    }
    else {
      int64_t v13 = -1;
    }
  }
  else if (v7 > v8)
  {
    int64_t v13 = 1;
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

- (void)_migrateInstalledStateForNewDictionaries:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v4 = objc_alloc(MEMORY[0x263F55928]);
  id v5 = [(DUDictionaryManager *)self _dictionaryAssetType];
  id v6 = (void *)[v4 initWithAssetType:v5];

  [v6 setQueriesLocalAssetInformationOnly:1];
  v27 = v6;
  uint64_t v7 = [v6 runQueryAndReturnError:0];
  if ([v7 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      uint64_t v28 = *(void *)v42;
      long long v29 = v7;
      do
      {
        uint64_t v11 = 0;
        uint64_t v31 = v9;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
          if ([v12 state] == 1)
          {
            v33 = v12;
            uint64_t v34 = v11;
            int64_t v13 = [v12 attributes];
            long long v14 = [v13 objectForKeyedSubscript:@"DictionaryIdentifier"];

            NSLog(&cfstr_DictionaryuiV1.isa, v14);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v15 = v30;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v38;
              while (2)
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v38 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  uint64_t v21 = [v20 rawAsset];
                  v22 = [v21 attributes];
                  v23 = [v22 objectForKeyedSubscript:@"DictionaryIdentifier"];
                  int v24 = [v23 isEqualToString:v14];

                  if (v24)
                  {
                    v25 = [v20 rawAsset];
                    [v20 setAssetToUpgrade:v25];

                    goto LABEL_18;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_18:

            v35[0] = MEMORY[0x263EF8330];
            v35[1] = 3221225472;
            v35[2] = __64__DUDictionaryManager__migrateInstalledStateForNewDictionaries___block_invoke;
            v35[3] = &unk_264BDBBB0;
            id v36 = v14;
            id v26 = v14;
            [v33 purge:v35];

            uint64_t v10 = v28;
            uint64_t v7 = v29;
            uint64_t v9 = v31;
            uint64_t v11 = v34;
          }
          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v9);
    }
  }
}

void __64__DUDictionaryManager__migrateInstalledStateForNewDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_DictionaryuiPu.isa, *(void *)(a1 + 32), a2);
  }
}

- (NSArray)availableDefinitionDictionaries
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end