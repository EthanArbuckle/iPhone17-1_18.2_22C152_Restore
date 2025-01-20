@interface GEOBatchTileRequester
- (GEOBatchTileRequester)init;
- (GEOBatchTileRequester)initWithCountryCode:(id)a3 region:(id)a4 auditToken:(id)a5 requestOptions:(unint64_t)a6 log:(id)a7 logPrefix:(id)a8 tileRequesterCreationBlock:(id)a9;
- (GEOBatchTileRequesterDelegate)delegate;
- (NSString)countryCode;
- (NSString)region;
- (OS_dispatch_queue)delegateQueue;
- (uint64_t)cancelKey:(uint64_t)a3;
- (unint64_t)bytesDownloaded;
- (unint64_t)failedTiles;
- (unint64_t)numberOfTilesAttempted;
- (unint64_t)numberOfTilesConsidered;
- (unint64_t)successfulTiles;
- (unsigned)reason;
- (void)_finish;
- (void)_requestNextBatch;
- (void)_startRequesterForKeys:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5;
- (void)cancel;
- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)tileRequester:(uint64_t)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(int)a6 tileSet:(uint64_t)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10;
- (void)tileRequester:(uint64_t)a3 receivedError:(void *)a4 forKey:(uint64_t)a5;
- (void)tileRequesterFinished:(id)a3;
@end

@implementation GEOBatchTileRequester

- (GEOBatchTileRequester)init
{
  result = (GEOBatchTileRequester *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOBatchTileRequester)initWithCountryCode:(id)a3 region:(id)a4 auditToken:(id)a5 requestOptions:(unint64_t)a6 log:(id)a7 logPrefix:(id)a8 tileRequesterCreationBlock:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v39.receiver = self;
  v39.super_class = (Class)GEOBatchTileRequester;
  v20 = [(GEOBatchTileRequester *)&v39 init];
  if (v20)
  {
    id v21 = [NSString stringWithFormat:@"com.apple.GeoServices.%@", objc_opt_class()];
    [v21 UTF8String];
    uint64_t v22 = geo_dispatch_queue_create_with_workloop_qos();
    isolationQueue = v20->_isolationQueue;
    v20->_isolationQueue = (OS_dispatch_queue *)v22;

    dispatch_group_t v24 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v24;

    uint64_t global_queue = geo_get_global_queue();
    delegateQueue = v20->_delegateQueue;
    v20->_delegateQueue = (OS_dispatch_queue *)global_queue;

    uint64_t v28 = [v14 copy];
    countryCode = v20->_countryCode;
    v20->_countryCode = (NSString *)v28;

    uint64_t v30 = [v15 copy];
    regionCode = v20->_regionCode;
    v20->_regionCode = (NSString *)v30;

    objc_storeStrong((id *)&v20->_auditToken, a5);
    objc_storeStrong((id *)&v20->_log, a7);
    uint64_t v32 = [v18 copy];
    logPrefix = v20->_logPrefix;
    v20->_logPrefix = (NSString *)v32;

    uint64_t v34 = [v19 copy];
    id tileRequesterCreationBlock = v20->_tileRequesterCreationBlock;
    v20->_id tileRequesterCreationBlock = (id)v34;

    v20->_paused = 1;
    v20->_requestOptions = a6;
    v36 = v20;
  }
  return v20;
}

- (unsigned)reason
{
  return 0;
}

- (unint64_t)numberOfTilesConsidered
{
  return 0;
}

- (void)resume
{
  objc_initWeak(&location, self);
  preparationGroup = self->_preparationGroup;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_resume__block_invoke;
  block[3] = &unk_1E53D93B8;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_group_notify(preparationGroup, isolationQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__GEOBatchTileRequester_resume__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *((unsigned char *)WeakRetained + 73))
  {
    *((unsigned char *)WeakRetained + 73) = 0;
    id v3 = WeakRetained;
    if ([*((id *)WeakRetained + 12) count]) {
      [v3 _startRequesterForKeys:*(void *)(*(void *)(a1 + 32) + 96) staleCachedETags:*(void *)(*(void *)(a1 + 32) + 152) staleCachedData:*(void *)(*(void *)(a1 + 32) + 160)];
    }
    else {
      [v3 _requestNextBatch];
    }
    id WeakRetained = v3;
  }
}

- (void)pause
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__GEOBatchTileRequester_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __30__GEOBatchTileRequester_pause__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(v2 + 24);
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v4;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "%{public}@ Pausing.", buf, 0xCu);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 73) = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) cancel];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__GEOBatchTileRequester_cancel__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __31__GEOBatchTileRequester_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_cancel__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __31__GEOBatchTileRequester_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
  [v7 didFinishWithError:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__GEOBatchTileRequester_cancel__block_invoke_3;
  block[3] = &unk_1E53D79D8;
  block[4] = v9;
  dispatch_async(v10, block);
}

void __31__GEOBatchTileRequester_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained batchTileRequesterDidFinish:*(void *)(a1 + 32)];
}

- (void)_finish
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__GEOBatchTileRequester__finish__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __32__GEOBatchTileRequester__finish__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v2[3];
    uint64_t v6 = v2[15];
    uint64_t v5 = v2[16];
    uint64_t v7 = v2[14];
    *(_DWORD *)buf = 138544130;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "%{public}@ Finished. Successfully downloaded %llu tiles (%{bytes}llu), failed to download %llu tiles", buf, 0x2Au);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  [v2 didFinishWithError:v2[22]];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GEOBatchTileRequester__finish__block_invoke_10;
  block[3] = &unk_1E53D79D8;
  block[4] = v8;
  dispatch_async(v9, block);
}

void __32__GEOBatchTileRequester__finish__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained batchTileRequesterDidFinish:*(void *)(a1 + 32)];
}

- (uint64_t)cancelKey:(uint64_t)a3
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v5 = *(NSObject **)(a1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GEOBatchTileRequester_cancelKey___block_invoke;
  block[3] = &unk_1E53D8CB0;
  block[4] = a1;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_async_and_wait(v5, block);
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __35__GEOBatchTileRequester_cancelKey___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 96) containsKey:a1[6]];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    --*(void *)(a1[4] + 104);
    uint64_t v2 = *(void **)(a1[4] + 88);
    id v4 = [NSNumber numberWithUnsignedInt:*(unsigned char *)a1[6] & 0x7F];
    uint64_t v3 = [v2 objectForKeyedSubscript:v4];
    [v3 cancelKey:a1[6]];
  }
}

- (void)_requestNextBatch
{
  if (!self->_canceled)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__GEOBatchTileRequester__requestNextBatch__block_invoke;
    v4[3] = &unk_1E53F73E0;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    [(GEOBatchTileRequester *)self determineNextBatchWithQueue:isolationQueue callback:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __42__GEOBatchTileRequester__requestNextBatch__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 72))
  {
    if ([v7 count])
    {
      [v11 _startRequesterForKeys:v7 staleCachedETags:v8 staleCachedData:v9];
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 32);
      __int16 v13 = *(NSObject **)(v12 + 16);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(v12 + 24);
        int v15 = 138543362;
        uint64_t v16 = v14;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "%{public}@ No more tiles to request. Done.", (uint8_t *)&v15, 0xCu);
      }
      [v11 _finish];
    }
  }
}

- (void)_startRequesterForKeys:(id)a3 staleCachedETags:(id)a4 staleCachedData:(id)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v8 = (GEOTileKeyList *)a3;
  id v78 = a4;
  id v77 = a5;
  if (!self->_canceled)
  {
    if (self->_remainingKeysForActiveRequesters != v8)
    {
      id v9 = (GEOTileKeyList *)[(GEOTileKeyList *)v8 copy];
      remainingKeysForActiveRequesters = self->_remainingKeysForActiveRequesters;
      self->_remainingKeysForActiveRequesters = v9;

      self->_numberOfTilesAttempted += [(GEOTileKeyList *)v8 count];
      uint64_t v11 = (GEOTileKeyMap *)[v78 copy];
      currentStaleETags = self->_currentStaleETags;
      self->_currentStaleETags = v11;

      __int16 v13 = (GEOTileKeyMap *)[v77 copy];
      currentStaleData = self->_currentStaleData;
      self->_currentStaleData = v13;
    }
    if (!self->_paused)
    {
      v76 = self;
      int v15 = [[GEOTileKeyMap alloc] initWithMapType:0 capacity:[(GEOTileKeyList *)v8 count]];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v73 = v8;
      uint64_t v16 = v8;
      uint64_t v17 = [(GEOTileKeyList *)v16 countByEnumeratingWithState:&v100 objects:v112 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v101 != v19) {
              objc_enumerationMutation(v16);
            }
            [(GEOTileKeyMap *)v15 setObject:&unk_1ED73EBD8 forKey:*(void *)(*((void *)&v100 + 1) + 8 * i)];
          }
          uint64_t v18 = [(GEOTileKeyList *)v16 countByEnumeratingWithState:&v100 objects:v112 count:16];
        }
        while (v18);
      }

      id v21 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      obuint64_t j = v16;
      uint64_t v22 = [(GEOTileKeyList *)obj countByEnumeratingWithState:&v96 objects:v111 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v97;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v97 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(unsigned char **)(*((void *)&v96 + 1) + 8 * j);
            uint64_t v27 = *v26 & 0x7F;
            uint64_t v28 = [NSNumber numberWithUnsignedInt:v27];
            v29 = [v21 objectForKeyedSubscript:v28];

            if (!v29)
            {
              uint64_t v30 = objc_alloc_init(GEOTileKeyList);
              v31 = [NSNumber numberWithUnsignedInt:v27];
              [v21 setObject:v30 forKeyedSubscript:v31];
            }
            uint64_t v32 = [NSNumber numberWithUnsignedInt:v27];
            v33 = [v21 objectForKeyedSubscript:v32];
            [v33 addKey:v26];
          }
          uint64_t v23 = [(GEOTileKeyList *)obj countByEnumeratingWithState:&v96 objects:v111 count:16];
        }
        while (v23);
      }

      GEOMachAbsoluteTimeGetCurrent();
      double v35 = v34;
      v36 = v76;
      activeRequesters = v76->_activeRequesters;
      if (!activeRequesters)
      {
        uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_super v39 = v76->_activeRequesters;
        v76->_activeRequesters = (NSMutableDictionary *)v38;

        activeRequesters = v76->_activeRequesters;
      }
      [(NSMutableDictionary *)activeRequesters removeAllObjects];
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v80 = v21;
      v75 = v15;
      uint64_t v79 = [v80 countByEnumeratingWithState:&v92 objects:v110 count:16];
      if (v79)
      {
        uint64_t v74 = *(void *)v93;
        do
        {
          for (uint64_t k = 0; k != v79; ++k)
          {
            if (*(void *)v93 != v74) {
              objc_enumerationMutation(v80);
            }
            v41 = *(void **)(*((void *)&v92 + 1) + 8 * k);
            int obja = [v41 unsignedIntValue];
            v81 = v41;
            v42 = [v80 objectForKeyedSubscript:v41];
            v43 = -[GEOTileKeyMap initWithMapType:capacity:]([GEOTileKeyMap alloc], "initWithMapType:capacity:", 0, [v42 count]);
            long long v88 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            id v44 = v42;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v88 objects:v109 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v89;
              do
              {
                for (uint64_t m = 0; m != v46; ++m)
                {
                  if (*(void *)v89 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  uint64_t v49 = *(void *)(*((void *)&v88 + 1) + 8 * m);
                  v50 = [NSNumber numberWithDouble:v35];
                  [(GEOTileKeyMap *)v43 setObject:v50 forKey:v49];
                }
                uint64_t v46 = [v44 countByEnumeratingWithState:&v88 objects:v109 count:16];
              }
              while (v46);
            }

            v51 = [GEOTileRequest alloc];
            v52 = +[GEOResourceManifestConfiguration defaultConfiguration];
            v53 = [MEMORY[0x1E4F1CA20] currentLocale];
            v36 = v76;
            auditTokeuint64_t n = v76->_auditToken;
            unint64_t requestOptions = v76->_requestOptions;
            BYTE1(v72) = [(GEOBatchTileRequester *)v76 reason];
            LOBYTE(v72) = 1;
            v71 = auditToken;
            int v15 = v75;
            v56 = -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](v51, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", v44, v52, v53, v78, v77, v75, 0, v43, 0, v71, requestOptions, 0, v72);

            v57 = (*((void (**)(void))v76->_tileRequesterCreationBlock + 2))();
            v58 = v57;
            if (v57)
            {
              [v57 setDeviceCountry:v76->_countryCode];
              [v58 setDeviceRegion:v76->_regionCode];
              [(NSMutableDictionary *)v76->_activeRequesters setObject:v58 forKeyedSubscript:v81];
            }
            else
            {
              log = v76->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
              {
                logPrefix = v76->_logPrefix;
                *(_DWORD *)buf = 138543618;
                v106 = logPrefix;
                __int16 v107 = 1024;
                int v108 = obja;
                _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_INFO, "%{public}@ No matching requester for provider ID %d. Not fetching tiles of that type", buf, 0x12u);
              }
            }
          }
          uint64_t v79 = [v80 countByEnumeratingWithState:&v92 objects:v110 count:16];
        }
        while (v79);
      }

      if ([(NSMutableDictionary *)v36->_activeRequesters count])
      {
        v61 = (void *)[(NSMutableDictionary *)v36->_activeRequesters copy];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v62 = v61;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v84 objects:v104 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          uint64_t v65 = *(void *)v85;
          do
          {
            for (uint64_t n = 0; n != v64; ++n)
            {
              if (*(void *)v85 != v65) {
                objc_enumerationMutation(v62);
              }
              v67 = [v62 objectForKeyedSubscript:*(void *)(*((void *)&v84 + 1) + 8 * n)];
              [v67 start];
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v84 objects:v104 count:16];
          }
          while (v64);
        }

        id v8 = v73;
        int v15 = v75;
      }
      else
      {
        v68 = v36->_log;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          v69 = v36->_logPrefix;
          *(_DWORD *)buf = 138543362;
          v106 = v69;
          _os_log_impl(&dword_188D96000, v68, OS_LOG_TYPE_INFO, "%{public}@ Zero keys in batch matched to valid requester classes. Moving on to next batch", buf, 0xCu);
        }
        v70 = v36->_remainingKeysForActiveRequesters;
        v36->_remainingKeysForActiveRequesters = 0;

        [(GEOBatchTileRequester *)v36 _requestNextBatch];
        id v8 = v73;
      }
    }
  }
}

- (void)tileRequester:(uint64_t)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(int)a6 tileSet:(uint64_t)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v33 = a9;
  id v14 = a4;
  id v15 = a8;
  id v16 = a10;
  uint64_t v17 = [v16 objectForKeyedSubscript:@"CachedDataWasCurrent"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    ++*(void *)(a1 + 112);
    goto LABEL_5;
  }
  char v18 = [v17 BOOLValue];

  ++*(void *)(a1 + 112);
  if ((v18 & 1) == 0)
  {
LABEL_5:
    uint64_t v19 = [v14 length];
    goto LABEL_6;
  }
  uint64_t v19 = 0;
LABEL_6:
  *(void *)(a1 + 128) += v19;
  [*(id *)(a1 + 96) removeKey:&v33];
  v20 = [v16 objectForKeyedSubscript:@"GEOTileLoadResultHTTPStatusCode"];
  uint64_t v21 = [v20 unsignedIntValue];

  objc_msgSend((id)a1, "downloadDidSucceedForTile:downloadSize:httpStatus:", &v33, objc_msgSend(v14, "length"), v21);
  uint64_t v22 = *(NSObject **)(a1 + 48);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __103__GEOBatchTileRequester_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke;
  v26[3] = &unk_1E53F7408;
  v26[4] = a1;
  id v27 = v14;
  int v30 = a5;
  int v31 = a6;
  long long v32 = v33;
  id v28 = v15;
  id v29 = v16;
  id v23 = v16;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(v22, v26);
}

void __103__GEOBatchTileRequester_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "batchTileRequester:receivedData:tileEdition:tileSet:etag:forKey:userInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 56));
}

- (void)tileRequester:(uint64_t)a3 receivedError:(void *)a4 forKey:(uint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v13 = a5;
  *((void *)&v13 + 1) = a6;
  id v8 = a4;
  if (!*(unsigned char *)(a1 + 73))
  {
    [(id)a1 downloadDidFailForTile:&v13 error:v8];
    if (!*(void *)(a1 + 176)) {
      objc_storeStrong((id *)(a1 + 176), a4);
    }
    ++*(void *)(a1 + 120);
    [*(id *)(a1 + 96) removeKey:&v13];
    id v9 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__GEOBatchTileRequester_tileRequester_receivedError_forKey___block_invoke;
    block[3] = &unk_1E53D7FC0;
    block[4] = a1;
    long long v12 = v13;
    id v11 = v8;
    dispatch_async(v9, block);
  }
}

void __60__GEOBatchTileRequester_tileRequester_receivedError_forKey___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "batchTileRequester:failedToLoadKey:error:", a1[4], a1[6], a1[7], a1[5]);
}

- (void)tileRequesterFinished:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_paused)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_activeRequesters;
    uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = [(NSMutableDictionary *)self->_activeRequesters objectForKeyedSubscript:v10];

        if (v11 == v4) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v12 = v10;

      if (!v12) {
        goto LABEL_11;
      }
      [(NSMutableDictionary *)self->_activeRequesters removeObjectForKey:v12];
      if (![(NSMutableDictionary *)self->_activeRequesters count])
      {
        remainingKeysForActiveRequesters = self->_remainingKeysForActiveRequesters;
        self->_remainingKeysForActiveRequesters = 0;

        [(GEOBatchTileRequester *)self _requestNextBatch];
      }
    }
    else
    {
LABEL_10:

LABEL_11:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: providerIDNumberToRemove != ((void *)0)", v14, 2u);
      }
      id v12 = 0;
    }
  }
}

- (unint64_t)numberOfTilesAttempted
{
  return self->_numberOfTilesAttempted;
}

- (unint64_t)successfulTiles
{
  return self->_successfulTiles;
}

- (unint64_t)failedTiles
{
  return self->_failedTiles;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (GEOBatchTileRequesterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOBatchTileRequesterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)region
{
  return self->_regionCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_currentStaleData, 0);
  objc_storeStrong((id *)&self->_currentStaleETags, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong(&self->_tileRequesterCreationBlock, 0);
  objc_storeStrong((id *)&self->_remainingKeysForActiveRequesters, 0);
  objc_storeStrong((id *)&self->_activeRequesters, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)determineNextBatchWithQueue:(id)a3 callback:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__GEOBatchTileRequester_SubclassOverrides__determineNextBatchWithQueue_callback___block_invoke;
  block[3] = &unk_1E53DA028;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);
}

uint64_t __81__GEOBatchTileRequester_SubclassOverrides__determineNextBatchWithQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end