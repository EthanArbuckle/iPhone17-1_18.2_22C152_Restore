@interface ATAssetManager
+ (id)sharedInstance;
- (ATAssetManager)init;
- (BOOL)dataclassIsEmpty:(id)a3;
- (BOOL)isEmpty;
- (id)_assetForDataclass:(id)a3 withIdentifier:(id)a4;
- (id)allDataclasses;
- (id)assetForDataclass:(id)a3 identifier:(id)a4;
- (id)assetForStoreID:(int64_t)a3;
- (id)assetProgressForAllDataclasses;
- (id)assets;
- (id)assetsForDataclasses:(id)a3;
- (id)bypassedRestoresForDataclass:(id)a3;
- (id)completedStoreAssets;
- (id)legacyAssetsForDataClass:(id)a3;
- (id)restoreAssetsForDataclass:(id)a3;
- (id)restoreAssetsForDataclasses:(id)a3;
- (id)storeAssetsForDataclass:(id)a3;
- (unint64_t)awaitingStoreCompletion;
- (unint64_t)completedAssetCountForDataClasses:(id)a3;
- (unint64_t)currentAsset;
- (unint64_t)currentAssetForDataclass:(id)a3;
- (unint64_t)remainingRestoreAssetCountForDataClasses:(id)a3;
- (unint64_t)remainingSyncAssetCountForDataClasses:(id)a3;
- (unint64_t)totalAssetCount;
- (unint64_t)totalAssetCountForDataClasses:(id)a3;
- (unint64_t)totalAssetCountForDataclass:(id)a3;
- (void)_addAssets:(id)a3 forDataClass:(id)a4;
- (void)_dumpStatusInformation;
- (void)_finishAsset:(id)a3 forDataClass:(id)a4;
- (void)_finishDataClassIfDone:(id)a3;
- (void)_loadAssetClients;
- (void)_updateAsset:(id)a3 withProgress:(float)a4;
- (void)addObserver:(id)a3;
- (void)cancelAssetForDataClass:(id)a3 withIdentifier:(id)a4;
- (void)dealloc;
- (void)enqueueLegacyAssetsForDataClass:(id)a3;
- (void)mapStoreIDToAsset:(id)a3;
- (void)prioritizeAssetForDataClass:(id)a3 withIdentifier:(id)a4;
- (void)removeObserver:(id)a3;
- (void)reset;
@end

@implementation ATAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalSource, 0);
  objc_storeStrong((id *)&self->_completedStoreAssets, 0);
  objc_storeStrong((id *)&self->_assetsByStoreID, 0);
  objc_storeStrong((id *)&self->_assetsByDataclass, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_totalAssetCountByDataClass, 0);
  objc_storeStrong((id *)&self->_remainingAssetsByDataClass, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_legacyAssetClients, 0);
  objc_storeStrong((id *)&self->_assetClients, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isEmpty
{
  return ![(NSMutableArray *)self->_assets count]
      && [(NSMutableArray *)self->_completedStoreAssets count] == 0;
}

- (BOOL)dataclassIsEmpty:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v12, 0, sizeof(v12));
  v5 = self->_completedStoreAssets;
  if ([(NSMutableArray *)v5 countByEnumeratingWithState:v12 objects:v13 count:16])
  {
    v6 = objc_msgSend(**((id **)&v12[0] + 1), "dataclass", *(void *)&v12[0]);
    char v7 = [v6 isEqualToString:v4];

    char v8 = v7 ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  v9 = [(NSMutableDictionary *)self->_assetsByDataclass objectForKey:v4];
  if ([v9 count]) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8;
  }

  return v10;
}

- (unint64_t)completedAssetCountForDataClasses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(ATAssetManager *)self totalAssetCountForDataClasses:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        v5 -= [v11 count];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)totalAssetCountForDataClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [(NSMutableDictionary *)self->_totalAssetCountByDataClass objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v7 += [v10 unsignedIntegerValue];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)remainingRestoreAssetCountForDataClasses:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v11 = -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v10, 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              v7 += [*(id *)(*((void *)&v17 + 1) + 8 * j) isRestore];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)remainingSyncAssetCountForDataClasses:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0x1E4F1C000uLL;
    uint64_t v8 = @"File";
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      uint64_t v24 = v5;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(*(id *)(v7 + 2424), "arrayWithObjects:", @"Photo", @"MessagePart", @"Book", @"VoiceMemo", v8, 0);
        char v13 = [v12 containsObject:v11];

        if (v13)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v14 = [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:v11];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = v9;
            long long v18 = self;
            long long v19 = v8;
            unint64_t v20 = v7;
            uint64_t v21 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(v14);
                }
                v6 += [*(id *)(*((void *)&v26 + 1) + 8 * i) isRestore] ^ 1;
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v16);
            unint64_t v7 = v20;
            uint64_t v8 = v19;
            self = v18;
            uint64_t v9 = v17;
            uint64_t v5 = v24;
          }
        }
        else
        {
          uint64_t v14 = [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:v11];
          v6 += [v14 count];
        }

        ++v10;
      }
      while (v10 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)restoreAssetsForDataclasses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ATAssetManager restoreAssetsForDataclass:](self, "restoreAssetsForDataclass:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)assetsForDataclasses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)bypassedRestoresForDataclass:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 isEqualToString:@"Media"])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = -[NSMutableDictionary objectForKey:](self->_assetsByDataclass, "objectForKey:", v4, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 isRestore]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (id)restoreAssetsForDataclass:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = -[NSMutableDictionary objectForKey:](self->_remainingAssetsByDataClass, "objectForKey:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 isRestore]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)storeAssetsForDataclass:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"Application", @"Book", @"Media", 0);
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(NSMutableDictionary *)self->_assetsByDataclass objectForKey:v4];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 isDownload]
            && (![v13 bypassStore]
             || [v13 isRestore]
             && [v4 isEqualToString:@"Media"]))
          {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (id)completedStoreAssets
{
  return self->_completedStoreAssets;
}

- (id)allDataclasses
{
  return (id)[(NSMutableDictionary *)self->_assetsByDataclass allKeys];
}

- (id)assets
{
  v2 = (void *)[(NSMutableArray *)self->_assets mutableCopy];

  return v2;
}

- (id)assetForDataclass:(id)a3 identifier:(id)a4
{
  assetsByDataclass = self->_assetsByDataclass;
  id v6 = a4;
  int v7 = [(NSMutableDictionary *)assetsByDataclass objectForKey:a3];
  uint64_t v8 = [v7 assetForIdentifier:v6];

  return v8;
}

- (id)assetForStoreID:(int64_t)a3
{
  assetsByStoreID = self->_assetsByStoreID;
  id v4 = [NSNumber numberWithLongLong:a3];
  uint64_t v5 = [(NSMutableDictionary *)assetsByStoreID objectForKey:v4];

  return v5;
}

- (void)mapStoreIDToAsset:(id)a3
{
  assetsByStoreID = self->_assetsByStoreID;
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "storePID"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)assetsByStoreID setObject:v5 forKey:v6];
}

- (unint64_t)awaitingStoreCompletion
{
  return [(NSMutableArray *)self->_completedStoreAssets count];
}

- (unint64_t)currentAssetForDataclass:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATAssetManager *)self totalAssetCountForDataclass:v4];
  id v6 = [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:v4];

  unint64_t v7 = v5 - [v6 count] + 1;
  return v7;
}

- (unint64_t)currentAsset
{
  return self->_completedAssets + 1;
}

- (unint64_t)totalAssetCountForDataclass:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_totalAssetCountByDataClass objectForKey:a3];
  unint64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (void)_dumpStatusInformation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    assets = self->_assets;
    completedStoreAssets = self->_completedStoreAssets;
    int v6 = 138543618;
    unint64_t v7 = assets;
    __int16 v8 = 2114;
    uint64_t v9 = completedStoreAssets;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_INFO, "SIGUSR1 (assets): %{public}@\n (completed store):%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_assetForDataclass:(id)a3 withIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "identifier", (void)v15);
        int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_updateAsset:(id)a3 withProgress:(float)a4
{
  id v6 = a3;
  id v7 = (void *)[(NSHashTable *)self->_observers copy];
  id v8 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__ATAssetManager__updateAsset_withProgress___block_invoke;
  v11[3] = &unk_1E6B87B00;
  id v12 = v7;
  int v13 = self;
  id v14 = v6;
  float v15 = a4;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

void __44__ATAssetManager__updateAsset_withProgress___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 56);
          objc_msgSend(v7, "assetManager:didUpdateAsset:withProgress:", *(void *)(a1 + 40), *(void *)(a1 + 48), v8, (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_finishDataClassIfDone:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_allAssets count])
  {
    if ((unint64_t)[(NSMutableSet *)self->_allAssets count] <= 5)
    {
      uint64_t v4 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        allAssets = self->_allAssets;
        int v6 = 138543362;
        id v7 = allAssets;
        _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_DEFAULT, "remaining assets: %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  else
  {
    [(ATAssetManager *)self reset];
  }
}

- (void)_finishAsset:(id)a3 forDataClass:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v25 = [(ATAssetManager *)self currentAssetForDataclass:v7];
    __int16 v26 = 2048;
    unint64_t v27 = [(ATAssetManager *)self totalAssetCountForDataclass:v7];
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "finished asset %lu/%lu for %{public}@", buf, 0x20u);
  }

  long long v9 = [MEMORY[0x1E4F47890] sharedInstance];
  id v23 = v6;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  [v9 installCompleteForAssets:v10];

  long long v11 = [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:v7];
  [v11 removeObject:v6];
  [(NSMutableSet *)self->_allAssets removeObject:v6];
  long long v12 = (void *)[(NSHashTable *)self->_observers copy];
  int v13 = dispatch_get_global_queue(0, 0);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __44__ATAssetManager__finishAsset_forDataClass___block_invoke;
  long long v19 = &unk_1E6B88BB8;
  id v20 = v12;
  uint64_t v21 = self;
  id v22 = v6;
  id v14 = v6;
  id v15 = v12;
  dispatch_async(v13, &v16);

  -[ATAssetManager _finishDataClassIfDone:](self, "_finishDataClassIfDone:", v7, v16, v17, v18, v19);
}

void __44__ATAssetManager__finishAsset_forDataClass___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
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
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "assetManager:didFinishAsset:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_addAssets:(id)a3 forDataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(NSMutableDictionary *)self->_remainingAssetsByDataClass objectForKey:v7];
  if (v8)
  {
    long long v9 = v8;
    [v8 addObjectsFromArray:v6];
  }
  else
  {
    long long v9 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    [(NSMutableDictionary *)self->_remainingAssetsByDataClass setObject:v9 forKey:v7];
  }
  [(NSMutableSet *)self->_allAssets addObjectsFromArray:v6];
  long long v10 = [(NSMutableDictionary *)self->_totalAssetCountByDataClass objectForKey:v7];
  uint64_t v11 = [v10 integerValue];
  uint64_t v12 = [v6 count] + v11;
  totalAssetCountByDataClass = self->_totalAssetCountByDataClass;
  id v14 = [NSNumber numberWithUnsignedInteger:v12];
  [(NSMutableDictionary *)totalAssetCountByDataClass setObject:v14 forKey:v7];

  id v15 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__ATAssetManager__addAssets_forDataClass___block_invoke;
  v18[3] = &unk_1E6B88B68;
  id v19 = v15;
  id v20 = self;
  id v17 = v15;
  dispatch_async(v16, v18);
}

void __42__ATAssetManager__addAssets_forDataClass___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
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
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "assetManagerDidUpdate:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_loadAssetClients
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_legacyAssetClients)
  {
    id v2 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = +[ATClientController sharedInstance];
    uint64_t v4 = [v3 allClients];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
          {
            long long v10 = [v9 supportedDataclasses];
            long long v11 = [v10 objectAtIndex:0];

            [(NSDictionary *)v2 setObject:v9 forKey:v11];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    legacyAssetClients = self->_legacyAssetClients;
    self->_legacyAssetClients = v2;
  }
}

- (id)assetProgressForAllDataclasses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_totalAssetCountByDataClass, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self->_totalAssetCountByDataClass;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v10 = [(NSMutableDictionary *)self->_assetsByDataclass objectForKey:v9];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v13 = [(NSMutableDictionary *)self->_totalAssetCountByDataClass objectForKey:v9];
          long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[ATAssetManager currentAssetForDataclass:](self, "currentAssetForDataclass:", v9));
          long long v15 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, @"AssetCount", v14, @"CurrentAssetNum", 0, (void)v17);
          [v3 setObject:v15 forKey:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)totalAssetCount
{
  return [(NSMutableSet *)self->_allAssets count];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ATAssetManager_removeObserver___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __33__ATAssetManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__ATAssetManager_addObserver___block_invoke;
  v7[3] = &unk_1E6B88B68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __30__ATAssetManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

- (void)cancelAssetForDataClass:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ATAssetManager_cancelAssetForDataClass_withIdentifier___block_invoke;
  block[3] = &unk_1E6B88BB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __57__ATAssetManager_cancelAssetForDataClass_withIdentifier___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _assetForDataclass:*(void *)(a1 + 40) withIdentifier:*(void *)(a1 + 48)];
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F47890] sharedInstance];
    v5[0] = v1;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v2 cancelAssets:v3 withCompletion:0];
  }
  else
  {
    id v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_INFO, "not cancel asset because we couldn't find it", v4, 2u);
    }
  }
}

- (void)prioritizeAssetForDataClass:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATAssetManager_prioritizeAssetForDataClass_withIdentifier___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __61__ATAssetManager_prioritizeAssetForDataClass_withIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "prioritizing asset %{public}@:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 48) _assetForDataclass:*(void *)(a1 + 32) withIdentifier:*(void *)(a1 + 40)];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F47890] sharedInstance];
    [v6 prioritizeAsset:v5];

    id v7 = [*(id *)(*(void *)(a1 + 48) + 24) objectForKey:*(void *)(a1 + 32)];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 prioritizeAsset:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v7 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_INFO, "not prioritzing asset because we couldn't find it", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)enqueueLegacyAssetsForDataClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATAssetManager *)self legacyAssetsForDataClass:v4];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke;
  block[3] = &unk_1E6B88BB8;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(queue, block);
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 32) count];
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v35 = v3;
      __int16 v36 = 2114;
      uint64_t v37 = v4;
      _os_log_impl(&dword_1D9A2D000, v2, OS_LOG_TYPE_DEFAULT, "Got %lu assets from %{public}@", buf, 0x16u);
    }

    uint64_t v5 = [MEMORY[0x1E4F4A2A8] sharedInstance];
    uint64_t v33 = *(void *)(a1 + 48);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v5 createAirlockForDataclasses:v6];

    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if (([*(id *)(*(void *)(a1 + 40) + 32) containsObject:v13] & 1) == 0) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      [*(id *)(a1 + 40) _addAssets:v7 forDataClass:*(void *)(a1 + 48)];
      long long v14 = +[ATClientController sharedInstance];
      long long v15 = [v14 clientForDataclass:*(void *)(a1 + 48)];

      long long v16 = [MEMORY[0x1E4F47890] sharedInstance];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_15;
      v26[3] = &unk_1E6B88168;
      id v27 = v15;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_3;
      v22[3] = &unk_1E6B87AD8;
      uint64_t v17 = *(void *)(a1 + 40);
      long long v18 = *(void **)(a1 + 48);
      id v23 = v27;
      uint64_t v24 = v17;
      id v25 = v18;
      id v19 = v27;
      [v16 enqueueAssets:v7 progress:v26 completion:v22];
    }
  }
  else
  {
    long long v20 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    [v20 _finishDataClassIfDone:v21];
  }
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_15(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_2;
    v7[3] = &unk_1E6B88A50;
    id v8 = v6;
    id v9 = v5;
    float v10 = a3;
    dispatch_client_async(v8, v7);
  }
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_4;
    v8[3] = &unk_1E6B88308;
    id v9 = v3;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v10 = v5;
    uint64_t v11 = v6;
    id v12 = v7;
    dispatch_client_async(v4, v8);
  }
  else
  {
    [*(id *)(a1 + 40) _finishAsset:v3 forDataClass:*(void *)(a1 + 48)];
  }
}

void __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_4(uint64_t a1)
{
  if (![*(id *)(a1 + 32) installStarted])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v5 = [v4 error];
    uint64_t v6 = [*(id *)(a1 + 32) error];
    [v3 assetTransfer:v4 succeeded:v5 == 0 withError:v6];

LABEL_5:
    goto LABEL_6;
  }
  id v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
  }
  else if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 40) assetInstallSucceeded:*(void *)(a1 + 32)];
    goto LABEL_6;
  }
  uint64_t v9 = [*(id *)(a1 + 32) error];
  if (v9)
  {
    id v10 = (void *)v9;
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      id v5 = [v13 error];
      [v12 assetInstallFailed:v13 withError:v5];
      goto LABEL_5;
    }
  }
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_5;
  block[3] = &unk_1E6B88BB8;
  void block[4] = v7;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 56);
  dispatch_async(v8, block);
}

uint64_t __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishAsset:*(void *)(a1 + 40) forDataClass:*(void *)(a1 + 48)];
}

uint64_t __50__ATAssetManager_enqueueLegacyAssetsForDataClass___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) assetTransfer:*(void *)(a1 + 40) updatedProgress:*(float *)(a1 + 48)];
}

- (id)legacyAssetsForDataClass:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__981;
  id v16 = __Block_byref_object_dispose__982;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__ATAssetManager_legacyAssetsForDataClass___block_invoke;
  v9[3] = &unk_1E6B88210;
  id v10 = v4;
  char v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__ATAssetManager_legacyAssetsForDataClass___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[ATClientController sharedInstance];
  id v3 = [v2 clientForDataclass:*(void *)(a1 + 32)];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v3 outstandingAssetTransfersWithDownloadManager:0];
LABEL_9:
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v4;

      goto LABEL_10;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v3 outstandingAssetTransfers];
      goto LABEL_9;
    }
  }
  else
  {
    id v5 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D9A2D000, v5, OS_LOG_TYPE_ERROR, "No ATClient for asset dataClass %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_10:
}

- (void)reset
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  allAssets = self->_allAssets;
  self->_allAssets = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  remainingAssetsByDataClass = self->_remainingAssetsByDataClass;
  self->_remainingAssetsByDataClass = v5;

  uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  totalAssetCountByDataClass = self->_totalAssetCountByDataClass;
  self->_totalAssetCountByDataClass = v7;

  int v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  assets = self->_assets;
  self->_assets = v9;

  uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  assetsByDataclass = self->_assetsByDataclass;
  self->_assetsByDataclass = v11;

  uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  assetsByStoreID = self->_assetsByStoreID;
  self->_assetsByStoreID = v13;

  id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  completedStoreAssets = self->_completedStoreAssets;
  self->_completedStoreAssets = v15;

  self->_completedAssets = 0;
  self->_totalAssetCount = 0;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_signalSource);
  v3.receiver = self;
  v3.super_class = (Class)ATAssetManager;
  [(ATAssetManager *)&v3 dealloc];
}

- (ATAssetManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)ATAssetManager;
  id v2 = [(ATAssetManager *)&v18 init];
  if (v2)
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    dispatch_queue_t v5 = dispatch_queue_create(Name, 0);
    uint64_t v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v8 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v7;

    [v2 _loadAssetClients];
    [v2 reset];
    int v9 = [MEMORY[0x1E4F47890] sharedInstance];
    [v9 addObserver:v2];

    uint64_t v10 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14480], 0x1EuLL, 0, v10);
    uint64_t v12 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v11;

    objc_initWeak(&location, v2);
    uint64_t v13 = *((void *)v2 + 14);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __22__ATAssetManager_init__block_invoke;
    v15[3] = &unk_1E6B886D8;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_resume(*((dispatch_object_t *)v2 + 14));
    signal(30, (void (__cdecl *)(int))1);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (ATAssetManager *)v2;
}

void __22__ATAssetManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dumpStatusInformation];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_990);
  }
  id v2 = (void *)sharedInstance___sharedAssetManager;

  return v2;
}

uint64_t __32__ATAssetManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedAssetManager = objc_alloc_init(ATAssetManager);

  return MEMORY[0x1F41817F8]();
}

@end