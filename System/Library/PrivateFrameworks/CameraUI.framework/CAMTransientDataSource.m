@interface CAMTransientDataSource
- (BOOL)_removeAssetWithUUID:(id)a3;
- (BOOL)isEmpty;
- (CAMTransientDataSource)init;
- (NSHashTable)_observers;
- (NSMutableArray)_assetUUIDs;
- (NSMutableDictionary)_assetsByUUID;
- (NSMutableDictionary)_enqueuedBurstAssetUUIDByBurstIdentifier;
- (NSMutableDictionary)_enqueuedBurstConvertiblesByAssetUUID;
- (NSMutableDictionary)_representativeAssetsByBurstIdentifier;
- (NSSet)existingBurstIdentifiers;
- (NSString)description;
- (id)existingAssetForUUID:(id)a3;
- (id)existingAssetUUIDs;
- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3;
- (id)insertAssetWithConvertible:(id)a3;
- (id)transientAssetMapping;
- (id)transientBurstMapping;
- (id)uuids;
- (int64_t)_nestedPerformChanges;
- (int64_t)_pendingChangeNotifications;
- (void)_notifyObserversOfDataSourceChange;
- (void)_setNestedPerformChanges:(int64_t)a3;
- (void)_setPendingChangeNotifications:(int64_t)a3;
- (void)enqueuePendingBurstAssetWithConvertible:(id)a3;
- (void)performChanges:(id)a3;
- (void)processPendingBurstAssets;
- (void)registerChangeObserver:(id)a3;
- (void)removeAllAssets;
- (void)removeAssetWithUUID:(id)a3;
- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3;
- (void)unregisterChangeObserver:(id)a3;
- (void)updateAssetWithConvertible:(id)a3;
@end

@implementation CAMTransientDataSource

- (CAMTransientDataSource)init
{
  v17.receiver = self;
  v17.super_class = (Class)CAMTransientDataSource;
  v2 = [(CAMTransientDataSource *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->__observers;
    v2->__observers = (NSHashTable *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    assetUUIDs = v2->__assetUUIDs;
    v2->__assetUUIDs = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsByUUID = v2->__assetsByUUID;
    v2->__assetsByUUID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    representativeAssetsByBurstIdentifier = v2->__representativeAssetsByBurstIdentifier;
    v2->__representativeAssetsByBurstIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    enqueuedBurstAssetUUIDByBurstIdentifier = v2->__enqueuedBurstAssetUUIDByBurstIdentifier;
    v2->__enqueuedBurstAssetUUIDByBurstIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    enqueuedBurstConvertiblesByAssetUUID = v2->__enqueuedBurstConvertiblesByAssetUUID;
    v2->__enqueuedBurstConvertiblesByAssetUUID = v13;

    v15 = v2;
  }

  return v2;
}

- (id)existingRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSMutableDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (id)existingAssetForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CAMTransientDataSource *)self _assetsByUUID];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSMutableDictionary)_assetsByUUID
{
  return self->__assetsByUUID;
}

- (id)insertAssetWithConvertible:(id)a3
{
  id v4 = a3;
  v5 = [[CAMTransientAsset alloc] initWithAsset:0 convertible:v4];

  v6 = [(CAMTransientAsset *)v5 uuid];
  v7 = [(CAMTransientAsset *)v5 burstIdentifier];
  v8 = [(CAMTransientDataSource *)self _assetUUIDs];
  v9 = [(CAMTransientDataSource *)self _assetsByUUID];
  [v8 addObject:v6];
  [v9 setObject:v5 forKey:v6];
  if (v7)
  {
    v10 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
    [v10 setObject:v5 forKey:v7];
  }
  if ([(CAMTransientAsset *)v5 mediaType] == 1)
  {
    v11 = @"still image";
  }
  else
  {
    uint64_t v12 = [(CAMTransientAsset *)v5 mediaType];
    v11 = @"unknown";
    if (v12 == 2) {
      v11 = @"video";
    }
  }
  v13 = v11;
  v14 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CAMTransientDataSource insertAssetWithConvertible:]();
  }

  [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
  objc_initWeak(&location, self);
  dispatch_time_t v15 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CAMTransientDataSource_insertAssetWithConvertible___block_invoke;
  block[3] = &unk_263FA0868;
  objc_copyWeak(&v20, &location);
  id v19 = v6;
  id v16 = v6;
  dispatch_after(v15, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v5;
}

- (NSMutableArray)_assetUUIDs
{
  return self->__assetUUIDs;
}

- (void)_notifyObserversOfDataSourceChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(CAMTransientDataSource *)self _nestedPerformChanges] < 1)
  {
    id v4 = [(CAMTransientDataSource *)self _observers];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) transientDataSourceDidChange:self];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int64_t v3 = [(CAMTransientDataSource *)self _pendingChangeNotifications] + 1;
    [(CAMTransientDataSource *)self _setPendingChangeNotifications:v3];
  }
}

- (int64_t)_nestedPerformChanges
{
  return self->__nestedPerformChanges;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)updateAssetWithConvertible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  uint64_t v6 = [v4 burstIdentifier];
  uint64_t v7 = [(CAMTransientDataSource *)self existingAssetForUUID:v5];
  uint64_t v8 = [(CAMTransientDataSource *)self existingRepresentativeAssetForBurstIdentifier:v6];
  long long v9 = [(id)v8 uuid];
  if (v7 | v8)
  {
    if (v8
      && ([(id)v8 uuid],
          long long v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:v5],
          v10,
          (v11 & 1) == 0))
    {
      long long v12 = [(id)v8 creationDate];
      id v19 = [v4 captureDate];
      [(CAMTransientAsset *)v12 timeIntervalSinceDate:v19];
      if (v20 >= 0.0)
      {
        v22 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[CAMTransientDataSource updateAssetWithConvertible:]((uint64_t)v5, v22, v23, v24, v25, v26, v27, v28);
        }
      }
      else
      {
        [(CAMTransientDataSource *)self removeAssetWithUUID:v9];
        id v21 = [(CAMTransientDataSource *)self insertAssetWithConvertible:v4];
      }
    }
    else
    {
      v30 = v9;
      long long v12 = [[CAMTransientAsset alloc] initWithAsset:v7 convertible:v4];
      uint64_t v13 = [(CAMTransientAsset *)v12 uuid];
      uint64_t v14 = [(CAMTransientDataSource *)self _assetsByUUID];
      v29 = (void *)v13;
      [v14 setObject:v12 forKey:v13];
      if ([(CAMTransientAsset *)v12 mediaType] == 1)
      {
        dispatch_time_t v15 = @"still image";
      }
      else
      {
        uint64_t v16 = [(CAMTransientAsset *)v12 mediaType];
        dispatch_time_t v15 = @"unknown";
        if (v16 == 2) {
          dispatch_time_t v15 = @"video";
        }
      }
      objc_super v17 = v15;
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CAMTransientDataSource updateAssetWithConvertible:]();
      }

      [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
      long long v9 = v30;
    }
  }
  else
  {
    long long v12 = (CAMTransientAsset *)os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG)) {
      -[CAMTransientDataSource updateAssetWithConvertible:](&v12->super);
    }
  }
}

- (void)registerChangeObserver:(id)a3
{
}

- (id)uuids
{
  v2 = [(CAMTransientDataSource *)self _assetUUIDs];
  int64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)transientAssetMapping
{
  v2 = [(CAMTransientDataSource *)self _assetsByUUID];
  int64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)transientBurstMapping
{
  v2 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
  int64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(CAMTransientDataSource *)self _nestedPerformChanges])
  {
    [(CAMTransientDataSource *)self _setNestedPerformChanges:[(CAMTransientDataSource *)self _nestedPerformChanges] + 1];
    v4[2](v4);

    int64_t v5 = [(CAMTransientDataSource *)self _nestedPerformChanges] - 1;
    [(CAMTransientDataSource *)self _setNestedPerformChanges:v5];
  }
  else
  {
    [(CAMTransientDataSource *)self _setPendingChangeNotifications:0];
    [(CAMTransientDataSource *)self _setNestedPerformChanges:[(CAMTransientDataSource *)self _nestedPerformChanges] + 1];
    v4[2](v4);

    [(CAMTransientDataSource *)self _setNestedPerformChanges:[(CAMTransientDataSource *)self _nestedPerformChanges] - 1];
    if ([(CAMTransientDataSource *)self _pendingChangeNotifications] >= 1)
    {
      [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
      [(CAMTransientDataSource *)self _setPendingChangeNotifications:0];
    }
  }
}

- (void)_setPendingChangeNotifications:(int64_t)a3
{
  self->__pendingChangeNotifications = a3;
}

- (void)_setNestedPerformChanges:(int64_t)a3
{
  self->__nestedPerformChanges = a3;
}

- (void)removeAssetWithUUID:(id)a3
{
  if ([(CAMTransientDataSource *)self _removeAssetWithUUID:a3])
  {
    [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
  }
}

- (BOOL)_removeAssetWithUUID:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMTransientDataSource *)self existingAssetForUUID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 burstIdentifier];
    uint64_t v8 = [(CAMTransientDataSource *)self _assetUUIDs];
    long long v9 = [(CAMTransientDataSource *)self _assetsByUUID];
    long long v10 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
    [v8 removeObject:v4];
    [v9 removeObjectForKey:v4];
    [v10 removeObjectForKey:v4];
    if (v7)
    {
      char v11 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
      [v11 removeObjectForKey:v7];
      long long v12 = [(CAMTransientDataSource *)self _enqueuedBurstAssetUUIDByBurstIdentifier];
      [v12 removeObjectForKey:v7];
    }
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CAMTransientDataSource _removeAssetWithUUID:]((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    }

LABEL_10:
    goto LABEL_11;
  }
  uint64_t v7 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
  double v20 = [v7 objectForKey:v4];

  if (v20)
  {
    [v7 removeObjectForKey:v4];
    uint64_t v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CAMTransientDataSource _removeAssetWithUUID:]((uint64_t)v4, v8, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v6 != 0;
}

- (NSMutableDictionary)_enqueuedBurstConvertiblesByAssetUUID
{
  return self->__enqueuedBurstConvertiblesByAssetUUID;
}

- (int64_t)_pendingChangeNotifications
{
  return self->__pendingChangeNotifications;
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(CAMTransientDataSource *)self _assetUUIDs];
  uint64_t v6 = [(CAMTransientDataSource *)self _assetsByUUID];
  uint64_t v7 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
  uint64_t v8 = [(CAMTransientDataSource *)self _enqueuedBurstAssetUUIDByBurstIdentifier];
  long long v9 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
  long long v10 = [v3 stringWithFormat:@"<%@ assetUUIDs:%@, assetsByUUID:%@, representativeAssetsByBurstIDs:%@, enquedBurstAssetUUIDByBurstID:%@, enqueuedBurstConvertiblesByAssetUUID:%@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEmpty
{
  v2 = [(CAMTransientDataSource *)self _assetUUIDs];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)existingAssetUUIDs
{
  v2 = [(CAMTransientDataSource *)self _assetUUIDs];
  BOOL v3 = (void *)[v2 copy];

  return v3;
}

void __53__CAMTransientDataSource_insertAssetWithConvertible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeAssetWithUUID:*(void *)(a1 + 32)];
}

- (void)removeAllAssets
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CAMTransientDataSource *)self _assetsByUUID];
  uint64_t v4 = [v3 allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [(CAMTransientDataSource *)self _removeAssetWithUUID:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
    if (v7) {
      [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
    }
  }
}

- (NSSet)existingBurstIdentifiers
{
  BOOL v3 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v4 = [(CAMTransientDataSource *)self _representativeAssetsByBurstIdentifier];
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v3 setWithArray:v5];

  int v7 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__CAMTransientDataSource_existingBurstIdentifiers__block_invoke;
  v10[3] = &unk_263FA7088;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  return (NSSet *)v8;
}

void __50__CAMTransientDataSource_existingBurstIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 firstObject];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v6 burstIdentifier];
  [v4 addObject:v5];
}

- (void)removeRepresentativeAssetForBurstIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMTransientDataSource *)self existingRepresentativeAssetForBurstIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 uuid];
    [(CAMTransientDataSource *)self _removeAssetWithUUID:v7];
  }
  else
  {
    int v7 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
    uint64_t v22 = 0;
    v23[0] = &v22;
    v23[1] = 0x3032000000;
    v23[2] = __Block_byref_object_copy__34;
    v23[3] = __Block_byref_object_dispose__34;
    id v24 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __70__CAMTransientDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke;
    uint64_t v19 = &unk_263FA70B0;
    id v20 = v4;
    uint64_t v21 = &v22;
    [v7 enumerateKeysAndObjectsUsingBlock:&v16];
    id v8 = objc_msgSend(v7, "objectForKey:", *(void *)(v23[0] + 40), v16, v17, v18, v19);

    if (v8)
    {
      [v7 removeObjectForKey:*(void *)(v23[0] + 40)];
      long long v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CAMTransientDataSource removeRepresentativeAssetForBurstIdentifier:]((uint64_t)v23, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
  [(CAMTransientDataSource *)self _notifyObserversOfDataSourceChange];
}

void __70__CAMTransientDataSource_removeRepresentativeAssetForBurstIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = [a3 firstObject];
  long long v9 = [v8 burstIdentifier];
  uint64_t v10 = v9;
  if (v8 && [v9 isEqualToString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)enqueuePendingBurstAssetWithConvertible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  id v6 = [v4 burstIdentifier];
  if (v6)
  {
    int v7 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
    id v8 = [(CAMTransientDataSource *)self _enqueuedBurstAssetUUIDByBurstIdentifier];
    long long v9 = [v8 objectForKey:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:v5])
      {
LABEL_11:
        id v12 = [v7 objectForKey:v5];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v7 setObject:v12 forKey:v5];
        }
        [v12 addObject:v4];

        goto LABEL_14;
      }
      [v8 setObject:v5 forKey:v6];
      [v7 removeObjectForKey:v10];
    }
    else
    {
      [v8 setObject:v5 forKey:v6];
    }
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CAMTransientDataSource enqueuePendingBurstAssetWithConvertible:]();
    }

    goto LABEL_11;
  }
  int v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Unable to enqueue a pending burst asset because this convertible does not have a burst identifier!", v13, 2u);
  }
LABEL_14:
}

- (void)processPendingBurstAssets
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CAMTransientDataSource *)self _enqueuedBurstAssetUUIDByBurstIdentifier];
  uint64_t v23 = [(CAMTransientDataSource *)self _enqueuedBurstConvertiblesByAssetUUID];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v22 = *(void *)v29;
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v4, "objectForKey:", v9, v21);
        id v11 = [v23 objectForKey:v10];
        id v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          v34 = v10;
          __int16 v35 = 2114;
          uint64_t v36 = v9;
          _os_log_debug_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEBUG, "Processing %{public}@ for burst %{public}@", buf, 0x16u);
        }

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          char v16 = 0;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v13);
              }
              uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              if (v16) {
                [(CAMTransientDataSource *)self updateAssetWithConvertible:v19];
              }
              else {
                id v20 = [(CAMTransientDataSource *)self insertAssetWithConvertible:v19];
              }
              char v16 = 1;
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v7);
  }

  [v4 removeAllObjects];
  [v23 removeAllObjects];
}

- (void)unregisterChangeObserver:(id)a3
{
}

- (NSMutableDictionary)_enqueuedBurstAssetUUIDByBurstIdentifier
{
  return self->__enqueuedBurstAssetUUIDByBurstIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__enqueuedBurstConvertiblesByAssetUUID, 0);
  objc_storeStrong((id *)&self->__enqueuedBurstAssetUUIDByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByUUID, 0);
  objc_storeStrong((id *)&self->__assetUUIDs, 0);
  objc_storeStrong((id *)&self->__observers, 0);
}

- (void)insertAssetWithConvertible:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_2099F8000, v0, v1, "Inserted transient asset for %{public}@ %{public}@");
}

- (void)updateAssetWithConvertible:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_2099F8000, v0, v1, "Updated transient asset for %{public}@ %{public}@");
}

- (void)updateAssetWithConvertible:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateAssetWithConvertible:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "Ignoring update for transient asset because we can't actually update anything", v1, 2u);
}

- (void)_removeAssetWithUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_removeAssetWithUUID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeRepresentativeAssetForBurstIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)enqueuePendingBurstAssetWithConvertible:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_3(&dword_2099F8000, v0, v1, "Pending convertible for %{public}@ is now %{public}@");
}

@end