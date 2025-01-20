@interface GEOProactiveFailedTileDownloader
- (GEOProactiveFailedTileDownloader)initWithDiskCache:(id)a3 tileRequesterCreationBlock:(id)a4;
- (uint64_t)cancelKey:(uint64_t)a3;
- (unint64_t)numberOfTilesConsidered;
- (unsigned)reason;
- (void)_addMoreKeysToListIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)_determineKeysToUpdate;
- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4;
@end

@implementation GEOProactiveFailedTileDownloader

- (unsigned)reason
{
  return 5;
}

- (GEOProactiveFailedTileDownloader)initWithDiskCache:(id)a3 tileRequesterCreationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 devicePostureCountry];
  v10 = [v7 devicePostureRegion];
  v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
  v12 = GEOGetProactiveTileDownloadLog();
  v16.receiver = self;
  v16.super_class = (Class)GEOProactiveFailedTileDownloader;
  v13 = [(GEOBatchTileRequester *)&v16 initWithCountryCode:v9 region:v10 auditToken:v11 requestOptions:96 log:v12 logPrefix:@"[PreviouslyFailed]" tileRequesterCreationBlock:v8];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_diskCache, a3);
    v13->_batchSize = +[GEOProactiveTileDownloader maximumDownloadBatchSize];
    [(GEOProactiveFailedTileDownloader *)v13 _determineKeysToUpdate];
    v14 = v13;
  }

  return v13;
}

- (void)_determineKeysToUpdate
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = Current - GEOConfigGetDouble(GeoServicesConfig_CellSaverStaleThresholdInSeconds, (uint64_t)off_1E9114258);
  dispatch_group_enter((dispatch_group_t)self->super._preparationGroup);
  diskCache = self->_diskCache;
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_CellSaverMaxStaleTilesToUpdate, (uint64_t)off_1E9114268);
  isolationQueue = self->super._isolationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__GEOProactiveFailedTileDownloader__determineKeysToUpdate__block_invoke;
  v8[3] = &unk_1E53EA400;
  v8[4] = self;
  [(GEOTileDB *)diskCache getFailedTileKeysForProactiveLoadSince:UInteger maxCount:isolationQueue queue:v8 callback:v4];
}

void __58__GEOProactiveFailedTileDownloader__determineKeysToUpdate__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), a2);
  id v4 = a2;
  *(void *)(*(void *)(a1 + 32) + 200) = [v4 count];
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
  block[2] = __46__GEOProactiveFailedTileDownloader_cancelKey___block_invoke;
  block[3] = &unk_1E53D8CB0;
  block[4] = a1;
  block[5] = &v11;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  v9.receiver = a1;
  v9.super_class = (Class)GEOProactiveFailedTileDownloader;
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

uint64_t __46__GEOProactiveFailedTileDownloader_cancelKey___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 192) containsKey:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v3 = *(void **)(a1[4] + 192);
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
  id v8 = objc_alloc_init(GEOTileKeyList);
  objc_super v9 = [[GEOTileKeyMap alloc] initWithMapType:0];
  v10 = [[GEOTileKeyMap alloc] initWithMapType:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke;
  v16[3] = &unk_1E53DE5C8;
  v20 = v10;
  id v21 = v7;
  id v17 = v6;
  v18 = v8;
  v19 = v9;
  uint64_t v11 = v10;
  v12 = v9;
  uint64_t v13 = v8;
  id v14 = v7;
  id v15 = v6;
  [(GEOProactiveFailedTileDownloader *)self _addMoreKeysToListIfNeeded:v13 completionHandler:v16];
}

void __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke_2;
  v3[3] = &unk_1E53EA428;
  id v7 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v2, v3);
}

uint64_t __73__GEOProactiveFailedTileDownloader_determineNextBatchWithQueue_callback___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_addMoreKeysToListIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count] < self->_batchSize && -[GEOTileKeyList count](self->_keysRemaining, "count"))
  {
    id v8 = objc_alloc_init(GEOTileKeyList);
    if (self->_batchSize)
    {
      unint64_t v9 = 0;
      do
      {
        if (![(GEOTileKeyList *)self->_keysRemaining count]) {
          break;
        }
        v10 = [(GEOTileKeyList *)self->_keysRemaining firstKey];
        [(GEOTileKeyList *)v8 addKey:v10];
        [(GEOTileKeyList *)self->_keysRemaining removeKey:v10];
        ++v9;
      }
      while (v9 < self->_batchSize);
    }
    uint64_t v11 = dispatch_group_create();
    diskCache = self->_diskCache;
    isolationQueue = self->super._isolationQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke;
    v19[3] = &unk_1E53EA450;
    v19[4] = self;
    id v14 = v6;
    id v20 = v14;
    [(GEOTileDB *)diskCache dataForKeys:v8 reason:5 group:v11 callbackQueue:isolationQueue dataHandler:v19];
    id v15 = self->super._isolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke_2;
    block[3] = &unk_1E53D7F70;
    block[4] = self;
    id v17 = v14;
    v18 = v7;
    dispatch_group_notify(v11, v15, block);
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    [*(id *)(a1 + 40) addKey:a2];
  }
  return 1;
}

uint64_t __81__GEOProactiveFailedTileDownloader__addMoreKeysToListIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addMoreKeysToListIfNeeded:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysRemaining, 0);

  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end