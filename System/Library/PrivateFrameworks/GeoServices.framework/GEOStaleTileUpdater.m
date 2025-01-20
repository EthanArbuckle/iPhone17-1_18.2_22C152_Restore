@interface GEOStaleTileUpdater
- (GEOStaleTileUpdater)initWithDiskCache:(id)a3 manifestManager:(id)a4 tileRequesterCreationBlock:(id)a5;
- (uint64_t)cancelKey:(uint64_t)a3;
- (unint64_t)numberOfTilesConsidered;
- (unsigned)reason;
- (void)_addMoreKeysToListIfNeeded:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5 completionHandler:(id)a6;
- (void)_determineStaleKeysToUpdate;
- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4;
@end

@implementation GEOStaleTileUpdater

- (unsigned)reason
{
  return 5;
}

- (GEOStaleTileUpdater)initWithDiskCache:(id)a3 manifestManager:(id)a4 tileRequesterCreationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 devicePostureCountry];
  v13 = [v9 devicePostureRegion];
  v14 = +[GEOApplicationAuditToken currentProcessAuditToken];
  v15 = GEOGetProactiveTileDownloadLog();
  v20.receiver = self;
  v20.super_class = (Class)GEOStaleTileUpdater;
  v16 = [(GEOBatchTileRequester *)&v20 initWithCountryCode:v12 region:v13 auditToken:v14 requestOptions:96 log:v15 logPrefix:@"[StaleTileUpdate]" tileRequesterCreationBlock:v11];

  if (v16)
  {
    v17 = v10;
    if (!v10)
    {
      v17 = +[GEOResourceManifestManager modernManager];
    }
    objc_storeStrong((id *)&v16->_manifestManager, v17);
    if (!v10) {

    }
    objc_storeStrong((id *)&v16->_diskCache, a3);
    v16->_batchSize = +[GEOProactiveTileDownloader maximumDownloadBatchSize];
    [(GEOStaleTileUpdater *)v16 _determineStaleKeysToUpdate];
    v18 = v16;
  }

  return v16;
}

- (void)_determineStaleKeysToUpdate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double Double = GEOConfigGetDouble(GeoServicesConfig_CellSaverStaleThresholdInSeconds, (uint64_t)off_1E9114258);
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v22 = self;
  v6 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  v7 = [v6 tileSets];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (+[GEOProactiveTileDownloader shouldDownloadTileType:](GEOProactiveTileDownloader, "shouldDownloadTileType:", [v12 style]))
        {
          v13 = GEOGetProactiveTileDownloadLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            int v14 = [v12 style];
            *(_DWORD *)buf = 134217984;
            uint64_t v29 = v14;
            _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "[StaleTileUpdate] Will attempt to download tiles for tileset: %{geo:TileSetStyle}llu", buf, 0xCu);
          }

          v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", ((objc_msgSend(v12, "style") & 0x3FFF | ((objc_msgSend(v12, "size") & 0xF) << 14) & 0xFFC3FFFF | ((objc_msgSend(v12, "scale") & 0xF) << 18)) << 8) | 1);
          [v5 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  v16 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v17;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_INFO, "[StaleTileUpdate] Will schedule tile downloads for %llu tilesets", buf, 0xCu);
  }

  dispatch_group_enter((dispatch_group_t)v22->super._preparationGroup);
  diskCache = v22->_diskCache;
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxStaleTilesToUpdate, (uint64_t)off_1E9114268);
  uint64_t v20 = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxSizeOfTilesToUpdate, (uint64_t)off_1E9114278);
  isolationQueue = v22->super._isolationQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__GEOStaleTileUpdater__determineStaleKeysToUpdate__block_invoke;
  v23[3] = &unk_1E53EA400;
  v23[4] = v22;
  [(GEOTileDB *)diskCache getStaleTileKeysUsedSince:v5 fromTileSets:UInteger maxCount:v20 maxTotalSize:isolationQueue queue:v23 callback:Current - Double];
}

void __50__GEOStaleTileUpdater__determineStaleKeysToUpdate__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), a2);
  id v4 = a2;
  *(void *)(*(void *)(a1 + 32) + 208) = [v4 count];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

- (uint64_t)cancelKey:(uint64_t)a3
{
  dispatch_group_wait(a1[4], 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = a1[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__GEOStaleTileUpdater_cancelKey___block_invoke;
  block[3] = &unk_1E53D8CB0;
  block[4] = a1;
  block[5] = &v11;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  v9.receiver = a1;
  v9.super_class = (Class)GEOStaleTileUpdater;
  unsigned int v6 = [(GEOBatchTileRequester *)&v9 cancelKey:a3];
  if (*((unsigned char *)v12 + 24)) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __33__GEOStaleTileUpdater_cancelKey___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 200) containsKey:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v3 = *(void **)(a1[4] + 200);
    uint64_t v4 = a1[6];
    return [v3 removeKey:v4];
  }
  return result;
}

- (unint64_t)numberOfTilesConsidered
{
  return self->_numberOfTilesOriginallyConsidered;
}

- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(GEOTileKeyList);
  objc_super v9 = [[GEOTileKeyMap alloc] initWithMapType:0];
  uint64_t v10 = [[GEOTileKeyMap alloc] initWithMapType:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke;
  v16[3] = &unk_1E53DE5C8;
  uint64_t v20 = v10;
  id v21 = v7;
  id v17 = v6;
  v18 = v8;
  v19 = v9;
  uint64_t v11 = v10;
  v12 = v9;
  uint64_t v13 = v8;
  id v14 = v7;
  id v15 = v6;
  [(GEOStaleTileUpdater *)self _addMoreKeysToListIfNeeded:v13 staleCachedETags:v12 staleCachedData:v11 completionHandler:v16];
}

void __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E53EA428;
  id v7 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);
}

uint64_t __60__GEOStaleTileUpdater_determineNextBatchWithQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_addMoreKeysToListIfNeeded:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(void))a6;
  if ([v10 count] < self->_batchSize && -[GEOTileKeyList count](self->_keysRemaining, "count"))
  {
    v30 = v12;
    id v14 = [GEOTileKeyList alloc];
    unint64_t batchSize = self->_batchSize;
    if (batchSize >= [(GEOTileKeyList *)self->_keysRemaining count]) {
      unint64_t v16 = [(GEOTileKeyList *)self->_keysRemaining count];
    }
    else {
      unint64_t v16 = self->_batchSize;
    }
    id v17 = [(GEOTileKeyList *)v14 initWithCapacity:v16];
    if (self->_batchSize)
    {
      unint64_t v18 = 0;
      do
      {
        if (![(GEOTileKeyList *)self->_keysRemaining count]) {
          break;
        }
        v19 = [(GEOTileKeyList *)self->_keysRemaining firstKey];
        [(GEOTileKeyList *)v17 addKey:v19];
        [(GEOTileKeyList *)self->_keysRemaining removeKey:v19];
        ++v18;
      }
      while (v18 < self->_batchSize);
    }
    uint64_t v20 = dispatch_group_create();
    diskCache = self->_diskCache;
    isolationQueue = self->super._isolationQueue;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke;
    v36[3] = &unk_1E53EBDF8;
    v36[4] = self;
    id v29 = v11;
    id v22 = v11;
    id v37 = v22;
    id v23 = v30;
    id v38 = v23;
    id v24 = v10;
    id v39 = v24;
    [(GEOTileDB *)diskCache dataForKeys:v17 reason:5 group:v20 callbackQueue:isolationQueue dataHandler:v36];
    long long v25 = self->super._isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke_2;
    block[3] = &unk_1E53F5D30;
    block[4] = self;
    id v32 = v24;
    id v26 = v22;
    id v11 = v29;
    id v33 = v26;
    id v27 = v23;
    id v12 = v30;
    id v34 = v27;
    v35 = v13;
    dispatch_group_notify(v20, v25, block);
  }
  else
  {
    v13[2](v13);
  }
}

uint64_t __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  if (!v9)
  {
LABEL_5:
    [a1[7] addKey:a2];
    goto LABEL_6;
  }
  if ((a4 & 1) == 0)
  {
    if (v10)
    {
      [a1[5] setObject:v10 forKey:a2];
      [a1[6] setObject:v9 forKey:a2];
    }
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

uint64_t __101__GEOStaleTileUpdater__addMoreKeysToListIfNeeded_staleCachedETags_staleCachedData_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addMoreKeysToListIfNeeded:*(void *)(a1 + 40) staleCachedETags:*(void *)(a1 + 48) staleCachedData:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysRemaining, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);

  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end