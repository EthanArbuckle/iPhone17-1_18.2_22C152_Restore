@interface _GEOMapDataSubscriptionBatchTileRequester
- (GEOMapDataSubscription)subscription;
- (NSProgress)progress;
- (_GEOMapDataSubscriptionBatchTileRequester)init;
- (_GEOMapDataSubscriptionBatchTileRequester)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 auditToken:(id)a6 requestOptions:(unint64_t)a7 manifestManager:(id)a8 log:(id)a9 logPrefix:(id)a10 tileRequesterCreationBlock:(id)a11;
- (uint64_t)downloadDidSucceedForTile:(uint64_t)a1 downloadSize:httpStatus:;
- (unint64_t)numberOfTilesConsidered;
- (unsigned)reason;
- (void)_addMoreKeysToListIfNeeded:(id)a3 cachedETags:(id)a4 cachedData:(id)a5 completionHandler:(id)a6;
- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4;
- (void)didFinishWithError:(id)a3;
@end

@implementation _GEOMapDataSubscriptionBatchTileRequester

- (_GEOMapDataSubscriptionBatchTileRequester)init
{
  result = (_GEOMapDataSubscriptionBatchTileRequester *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOMapDataSubscriptionBatchTileRequester)initWithSubscription:(id)a3 diskCache:(id)a4 reason:(unsigned __int8)a5 auditToken:(id)a6 requestOptions:(unint64_t)a7 manifestManager:(id)a8 log:(id)a9 logPrefix:(id)a10 tileRequesterCreationBlock:(id)a11
{
  id v49 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v52 = a9;
  id v51 = a10;
  id v50 = a11;
  v19 = (GEOApplicationAuditToken *)v17;
  v20 = v19;
  if (!v19)
  {
    v21 = [v49 _originatingBundleIdentifier];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      v23 = [GEOApplicationAuditToken alloc];
      v24 = [v49 _originatingBundleIdentifier];
      v20 = [(GEOApplicationAuditToken *)v23 initWithProxiedApplicationBundleId:v24];
    }
    else
    {
      v20 = 0;
    }
  }
  v25 = [v16 devicePostureCountry];
  v26 = [v16 devicePostureRegion];
  v27 = v20;
  if (!v20)
  {
    v27 = +[GEOApplicationAuditToken currentProcessAuditToken];
  }
  v57.receiver = self;
  v57.super_class = (Class)_GEOMapDataSubscriptionBatchTileRequester;
  v28 = [(GEOBatchTileRequester *)&v57 initWithCountryCode:v25 region:v26 auditToken:v27 requestOptions:a7 log:v52 logPrefix:v51 tileRequesterCreationBlock:v50];
  if (!v20) {

  }
  if (v28)
  {
    objc_storeStrong((id *)&v28->_diskCache, a4);
    v29 = v18;
    if (!v18)
    {
      v29 = +[GEOResourceManifestManager modernManager];
    }
    id v46 = v16;
    objc_storeStrong((id *)&v28->_manifestManager, v29);
    id v45 = v18;
    if (!v18) {

    }
    v28->_batchSize = GEOConfigGetUInteger(GeoServicesConfig_CellSaverBatchSize, (uint64_t)off_1E9114188);
    objc_storeStrong((id *)&v28->_subscription, a3);
    v28->_reason = a5;
    v30 = [MEMORY[0x1E4F1CA48] array];
    v31 = [MEMORY[0x1E4F1CA60] dictionary];
    manifestManager = v28->_manifestManager;
    char v33 = [(GEOMapDataSubscription *)v28->_subscription dataTypes];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __166___GEOMapDataSubscriptionBatchTileRequester_initWithSubscription_diskCache_reason_auditToken_requestOptions_manifestManager_log_logPrefix_tileRequesterCreationBlock___block_invoke;
    v53[3] = &unk_1E53EBDA8;
    v34 = v28;
    v54 = v34;
    id v55 = v30;
    v35 = v31;
    v56 = v35;
    id v36 = v30;
    _GEOEnumerateTileSetsForSubscriptionDataTypes(manifestManager, v33, v53);
    uint64_t v37 = GEOTileKeyEnumeratorContainingEnumerators(v36);
    tileKeysToLoad = v34->_tileKeysToLoad;
    v34->_tileKeysToLoad = (GEOTileKeyEnumerator *)v37;

    uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", -[GEOTileKeyEnumerator count](v34->_tileKeysToLoad, "count"));
    progress = v34->_progress;
    v34->_progress = (NSProgress *)v39;

    dataTypeToDBTileSets = v34->_dataTypeToDBTileSets;
    v34->_dataTypeToDBTileSets = v35;
    v42 = v35;

    v43 = v34;
    id v18 = v45;
    id v16 = v46;
  }

  return v28;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unint64_t)numberOfTilesConsidered
{
  return self->_numberOfTilesOriginallyConsidered;
}

- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(GEOTileKeyList);
  v9 = [[GEOTileKeyMap alloc] initWithMapType:0];
  v10 = [[GEOTileKeyMap alloc] initWithMapType:0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82___GEOMapDataSubscriptionBatchTileRequester_determineNextBatchWithQueue_callback___block_invoke;
  v16[3] = &unk_1E53DE5C8;
  v20 = v10;
  id v21 = v7;
  id v17 = v6;
  id v18 = v8;
  v19 = v9;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  id v14 = v7;
  id v15 = v6;
  [(_GEOMapDataSubscriptionBatchTileRequester *)self _addMoreKeysToListIfNeeded:v13 cachedETags:v12 cachedData:v11 completionHandler:v16];
}

- (void)_addMoreKeysToListIfNeeded:(id)a3 cachedETags:(id)a4 cachedData:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(void))a6;
  unint64_t v14 = [v10 count];
  unint64_t batchSize = self->_batchSize;
  if (v14 >= batchSize)
  {
    v13[2](v13);
  }
  else
  {
    unint64_t v16 = batchSize - [v10 count];
    id v17 = objc_alloc_init(GEOTileKeyList);
    tileKeysToLoad = self->_tileKeysToLoad;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke;
    v43[3] = &unk_1E53EBDD0;
    v19 = v17;
    v44 = v19;
    unint64_t v45 = v16;
    char v20 = [(GEOTileKeyEnumerator *)tileKeysToLoad continueEnumeratingTileKeysWithBlock:v43];
    if ([(GEOTileKeyList *)v19 count])
    {
      char v29 = v20;
      self->_numberOfTilesOriginallyConsidered += [(GEOTileKeyList *)v19 count];
      id v21 = dispatch_group_create();
      v31 = v11;
      diskCache = self->_diskCache;
      isolationQueue = self->super._isolationQueue;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_28;
      v38[3] = &unk_1E53EBDF8;
      v38[4] = self;
      id v24 = v31;
      id v39 = v24;
      id v30 = v12;
      id v25 = v12;
      id v40 = v25;
      id v26 = v10;
      id v41 = v26;
      [(GEOTileDB *)diskCache dataForKeys:v19 reason:5 group:v21 callbackQueue:isolationQueue dataHandler:v38];
      v27 = self->super._isolationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113___GEOMapDataSubscriptionBatchTileRequester__addMoreKeysToListIfNeeded_cachedETags_cachedData_completionHandler___block_invoke_2;
      block[3] = &unk_1E53DEC18;
      char v37 = v29;
      id v36 = v13;
      block[4] = self;
      id v33 = v26;
      id v34 = v24;
      id v35 = v25;
      v28 = v27;
      id v12 = v30;
      id v11 = v31;
      dispatch_group_notify(v21, v28, block);
    }
    else
    {
      if ((v20 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: finished", buf, 2u);
      }
      v13[2](v13);
    }
  }
}

- (uint64_t)downloadDidSucceedForTile:(uint64_t)a1 downloadSize:httpStatus:
{
  uint64_t v2 = [*(id *)(a1 + 248) completedUnitCount] + 1;
  v3 = *(void **)(a1 + 248);

  return [v3 setCompletedUnitCount:v2];
}

- (void)didFinishWithError:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v21 = 0;
    log = self->super._log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->super._logPrefix;
      subscription = self->_subscription;
      v8 = log;
      v9 = [(GEOMapDataSubscription *)subscription identifier];
      *(_DWORD *)buf = 138543875;
      char v37 = logPrefix;
      __int16 v38 = 2160;
      uint64_t v39 = 1752392040;
      __int16 v40 = 2113;
      id v41 = v9;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "%{public}@ Marking subscription '%{private, mask.hash}@' as fully-loaded", buf, 0x20u);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = self->_dataTypeToDBTileSets;
    uint64_t v24 = [(NSDictionary *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v10;
          id v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          uint64_t v12 = objc_msgSend(v11, "unsignedIntegerValue", v21);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v13 = [(NSDictionary *)self->_dataTypeToDBTileSets objectForKeyedSubscript:v11];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) unsignedIntValue];
                diskCache = self->_diskCache;
                char v20 = [(GEOMapDataSubscription *)self->_subscription identifier];
                [(GEOTileDB *)diskCache setSubscriptionWithIdentifier:v20 isFullyLoaded:1 forDataType:v12 dataSubtype:v18 version:1];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v15);
          }

          uint64_t v10 = v25 + 1;
        }
        while (v25 + 1 != v24);
        uint64_t v24 = [(NSDictionary *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }

    id v4 = v21;
  }
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_tileKeysToLoad, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_dataTypeToDBTileSets, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);

  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end