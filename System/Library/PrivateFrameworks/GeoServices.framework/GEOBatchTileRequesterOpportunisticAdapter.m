@interface GEOBatchTileRequesterOpportunisticAdapter
+ (unint64_t)policy;
- (GEOBatchTileRequesterOpportunisticAdapter)init;
- (GEOBatchTileRequesterOpportunisticAdapter)initWithSessionIdentifier:(id)a3 batchTileRequester:(id)a4 manifestManager:(id)a5 diskCache:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8;
- (GEOOpportunisticDataSourceDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)bytesDownloaded;
- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(uint64_t)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9;
- (void)batchTileRequesterDidFinish:(id)a3;
- (void)cancel;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation GEOBatchTileRequesterOpportunisticAdapter

+ (unint64_t)policy
{
  return 3;
}

- (GEOBatchTileRequesterOpportunisticAdapter)init
{
  result = (GEOBatchTileRequesterOpportunisticAdapter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOBatchTileRequesterOpportunisticAdapter)initWithSessionIdentifier:(id)a3 batchTileRequester:(id)a4 manifestManager:(id)a5 diskCache:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)GEOBatchTileRequesterOpportunisticAdapter;
  v19 = [(GEOBatchTileRequesterOpportunisticAdapter *)&v26 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    sessionIdentifier = v19->_sessionIdentifier;
    v19->_sessionIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v19->_requester, a4);
    objc_storeStrong((id *)&v19->_diskCache, a6);
    if (v16)
    {
      v22 = (GEOResourceManifestManager *)v16;
    }
    else
    {
      v22 = +[GEOResourceManifestManager modernManager];
    }
    manifestManager = v19->_manifestManager;
    v19->_manifestManager = v22;

    objc_storeStrong((id *)&v19->_requestCounter, a7);
    v19->_requestCounterPolicy = a8;
    v19->_started.lock._os_unfair_lock_opaque = 0;
    v19->_started.didRun = 0;
    [(GEOBatchTileRequester *)v19->_requester setDelegate:v19];
    v24 = v19;
  }

  return v19;
}

- (OS_dispatch_queue)delegateQueue
{
  return [(GEOBatchTileRequester *)self->_requester delegateQueue];
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)resume
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__GEOBatchTileRequesterOpportunisticAdapter_resume__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  GEOOnce((uint64_t)&self->_started, v3);
  [(GEOBatchTileRequester *)self->_requester resume];
}

uint64_t __51__GEOBatchTileRequesterOpportunisticAdapter_resume__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) startedProactiveTileDownloadForIdentifier:*(void *)(*(void *)(a1 + 32) + 8) policy:*(unsigned __int8 *)(*(void *)(a1 + 32) + 48)];
}

- (void)pause
{
}

- (void)cancel
{
}

- (unint64_t)bytesDownloaded
{
  return [(GEOBatchTileRequester *)self->_requester bytesDownloaded];
}

- (void)batchTileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(uint64_t)a5 tileSet:(unsigned int)a6 etag:(void *)a7 forKey:(uint64_t)a8 userInfo:(uint64_t)a9
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v38[0] = a9;
  v38[1] = a10;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a11;
  if (_GEOTileResponseIsCacheable((unsigned __int8 *)v38, v19))
  {
    v36 = *(void **)(a1 + 24);
    v35 = [v16 countryCode];
    [v16 region];
    uint64_t v20 = v37 = a6;
    v21 = [*(id *)(a1 + 32) devicePostureCountry];
    [*(id *)(a1 + 32) devicePostureRegion];
    v22 = v19;
    id v23 = v16;
    uint64_t v24 = a1;
    id v25 = v18;
    id v26 = v17;
    v28 = uint64_t v27 = a5;
    BOOL IsAllowableForKey = _GEOTileResponseIsAllowableForKey((uint64_t)v38, v36, v35, v20, v21, v28);

    uint64_t v30 = v27;
    id v17 = v26;
    id v18 = v25;
    uint64_t v31 = v24;
    id v16 = v23;
    id v19 = v22;

    if (IsAllowableForKey)
    {
      v32 = [v22 objectForKeyedSubscript:@"CachedDataWasCurrent"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v33 = [v32 BOOLValue];
      }
      else {
        char v33 = 0;
      }
      BYTE1(v34) = v33;
      LOBYTE(v34) = [v16 reason];
      objc_msgSend(*(id *)(v31 + 32), "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", v17, v38, v30, v37, v38[0] & 0x7F, v18, v34);
    }
  }
}

- (void)batchTileRequesterDidFinish:(id)a3
{
  [(GEORequestCounter *)self->_requestCounter finishedProactiveTileDownloadForIdentifier:self->_sessionIdentifier policy:self->_requestCounterPolicy tilesConsidered:[(GEOBatchTileRequester *)self->_requester numberOfTilesConsidered] tileDownloadAttempts:[(GEOBatchTileRequester *)self->_requester numberOfTilesAttempted] successes:[(GEOBatchTileRequester *)self->_requester successfulTiles] failures:[(GEOBatchTileRequester *)self->_requester failedTiles] bytesDownloaded:[(GEOBatchTileRequester *)self->_requester bytesDownloaded]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataSourceDidFinish:self];
}

- (GEOOpportunisticDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOOpportunisticDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_requester, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end