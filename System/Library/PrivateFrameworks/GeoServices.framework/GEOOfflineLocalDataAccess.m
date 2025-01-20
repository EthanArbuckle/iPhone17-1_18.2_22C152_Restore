@interface GEOOfflineLocalDataAccess
- (BOOL)_getVersionForLayer:(void *)a3 version:;
- (BOOL)hasDataForKey:(id)a3 error:(id *)a4;
- (GEOOfflineLocalDataAccess)initWithDiskCache:(id)a3 configuration:(id)a4;
- (id)_dataFromInstalledTestBundlesForKey:(void *)a1;
- (id)_installedTestBundles;
- (id)dataForKey:(id)a3 error:(id *)a4;
- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4;
- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
@end

@implementation GEOOfflineLocalDataAccess

void __81__GEOOfflineLocalDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  v2 = [[GEOOfflineVersionMetadata alloc] initWithDataConfiguration:*(void *)(*(void *)(a1 + 32) + 16)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__GEOOfflineLocalDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke;
  v8[3] = &unk_1E53D7ED0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

- (GEOOfflineLocalDataAccess)initWithDiskCache:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOOfflineLocalDataAccess;
  id v9 = [(GEOOfflineLocalDataAccess *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_diskCache, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    uint64_t v11 = geo_isolater_create();
    testBundlesIsolation = v10->_testBundlesIsolation;
    v10->_testBundlesIsolation = (geo_isolater *)v11;

    v13 = v10;
  }

  return v10;
}

- (BOOL)_getVersionForLayer:(void *)a3 version:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v5 = [*(id *)(a1 + 16) activeVersions];
  id v6 = [NSNumber numberWithUnsignedInt:a2];
  id v7 = [v5 objectForKeyedSubscript:v6];

  BOOL v8 = v7 != 0;
  if (v7)
  {
    *a3 = [v7 unsignedLongLongValue];
  }
  else
  {
    id v9 = GEOGetOfflineDataAccessLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (a2 >= 0x15)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E19D0[(int)a2];
      }
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "No known active version for layer: %{public}@", buf, 0xCu);
    }
  }

  return v8;
}

- (id)_installedTestBundles
{
  id v1 = a1;
  if (a1)
  {
    geo_assert_not_isolated();
    uint64_t v3 = 0;
    v4 = &v3;
    uint64_t v5 = 0x3032000000;
    id v6 = __Block_byref_object_copy__38;
    id v7 = __Block_byref_object_dispose__38;
    id v8 = 0;
    geo_isolate_sync();
    id v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);
  }

  return v1;
}

void __50__GEOOfflineLocalDataAccess__installedTestBundles__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = +[GEOOfflineDataBundle installedBundles]();
    v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = (void *)v3;
    }
    else {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v5);

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (id)_dataFromInstalledTestBundlesForKey:(void *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    -[GEOOfflineLocalDataAccess _installedTestBundles](a1);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = -[GEOOfflineDataBundle dataForKey:](*(void *)(*((void *)&v13 + 1) + 8 * i), v3);
          if (v9)
          {
            v10 = (void *)v9;
            uint64_t v11 = GEOGetOfflineDataAccessLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 141558275;
              uint64_t v18 = 1752392040;
              __int16 v19 = 2113;
              id v20 = v3;
              _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Returning locally-overridden data for key %{private, mask.hash}@", buf, 0x16u);
            }

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v10 = 0;
LABEL_14:
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[GEOPlatform sharedPlatform];
  int v12 = [v11 isInternalInstall];

  if (v12
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v8),
        (long long v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E53D7C50;
    id v24 = v13;
    id v25 = v10;
    id v14 = v24;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v22 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, [v8 layer], &v22))
    {
      diskCache = self->_diskCache;
      uint64_t v16 = v22;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_3;
      v18[3] = &unk_1E53E19B0;
      v17 = &v19;
      id v19 = v10;
      [(GEOTileDB *)diskCache getDataForOfflineKey:v8 version:v16 associatedWithFullyLoadedSubscription:1 callbackQueue:v9 callback:v18];
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_2;
      v20[3] = &unk_1E53DA028;
      v17 = &v21;
      id v21 = v10;
      dispatch_async(v9, v20);
    }
  }
}

uint64_t __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"unknown version"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = a2;
  unint64_t v5 = a3;
  uint64_t v6 = (void *)v5;
  if (!(v7 | v5))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = +[GEOPlatform sharedPlatform];
  int v8 = [v7 isInternalInstall];

  if (!v8
    || (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v6),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v11 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, [v6 layer], &v11))
    {
      uint64_t v9 = [(GEOTileDB *)self->_diskCache dataForOfflineKey:v6 version:v11 associatedWithFullyLoadedSubscription:1 error:a4];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"unknown version"];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[GEOPlatform sharedPlatform];
  int v12 = [v11 isInternalInstall];

  if (v12
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v8),
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E53DA028;
    id v19 = v10;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v17 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, [v8 layer], &v17))
    {
      [(GEOTileDB *)self->_diskCache determineIfOfflineDataExistsForKey:v8 version:v17 associatedWithFullyLoadedSubscription:1 callbackQueue:v9 callback:v10];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke_2;
      v15[3] = &unk_1E53DA028;
      id v16 = v10;
      dispatch_async(v9, v15);
    }
  }
}

uint64_t __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"unknown version"];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = +[GEOPlatform sharedPlatform];
  int v8 = [v7 isInternalInstall];

  if (v8
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v6),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, [v6 layer], &v12))
    {
      BOOL v10 = [(GEOTileDB *)self->_diskCache hasDataForOfflineKey:v6 version:v12 associatedWithFullyLoadedSubscription:1 error:a4];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"unknown version"];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  id v9 = a5;
  BOOL v10 = +[GEOPlatform sharedPlatform];
  int v11 = [v10 isInternalInstall];

  if (v11)
  {
    v28 = v8;
    uint64_t v12 = -[GEOOfflineLocalDataAccess _installedTestBundles](self);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v15 = 0;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (!v15)
          {
            long long v15 = [MEMORY[0x1E4F1CA80] set];
          }
          id v19 = -[GEOOfflineDataBundle availableKeysForLayer:](v18, v6);
          [v15 addObjectsFromArray:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v14);
    }
    else
    {
      long long v15 = 0;
    }

    int v8 = v28;
  }
  else
  {
    long long v15 = 0;
  }
  uint64_t v35 = 0;
  if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, v6, &v35))
  {
    diskCache = self->_diskCache;
    uint64_t v21 = v35;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke_2;
    v29[3] = &unk_1E53DECB8;
    uint64_t v22 = &v31;
    v23 = &v30;
    v30 = v15;
    id v31 = v9;
    id v24 = v15;
    id v25 = v9;
    [(GEOTileDB *)diskCache getOfflineKeysForLayer:v6 version:v21 callbackQueue:v8 callback:v29];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E53D7C50;
    uint64_t v22 = &v34;
    v23 = &v33;
    v33 = v15;
    id v34 = v9;
    id v26 = v15;
    id v27 = v9;
    dispatch_async(v8, block);
  }
}

void __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) allObjects];
  id v4 = (id)v2;
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, v3, 0);
}

void __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      [v6 addObjectsFromArray:v10];
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = [*(id *)(a1 + 32) allObjects];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);

      goto LABEL_7;
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
LABEL_7:
}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(GEOOfflineDataConfiguration *)self->_configuration tileMetadata];
  if (v6) {
    goto LABEL_7;
  }
  int v16 = -1;
  uint64_t v7 = [GEOOfflineDataKey alloc];
  int v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v16 length:4];
  id v9 = [(GEOOfflineDataKey *)v7 initWithLayer:9 serviceKey:v8];

  id v10 = [(GEOOfflineLocalDataAccess *)self dataForKey:v9 error:a4];
  if (!v10)
  {
LABEL_13:

    uint64_t v6 = 0;
    goto LABEL_7;
  }
  int v11 = v10;
  uint64_t v12 = [v10 readDataWithError:a4];
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: serializedConfig != ((void *)0)", v15, 2u);
    }

    goto LABEL_13;
  }
  uint64_t v13 = (void *)v12;
  uint64_t v6 = [[GEOPBOfflineTileMetadata alloc] initWithData:v12];
  if (v6) {
    [(GEOOfflineDataConfiguration *)self->_configuration setTileMetadata:v6];
  }

LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testBundlesIsolation, 0);
  objc_storeStrong((id *)&self->_testBundles, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end