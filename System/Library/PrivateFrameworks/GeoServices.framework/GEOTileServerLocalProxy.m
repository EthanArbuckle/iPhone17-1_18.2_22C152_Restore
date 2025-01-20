@interface GEOTileServerLocalProxy
+ (void)enableCDSObserversIfNecessary;
- (GEOTileDB)tileCache;
- (GEOTileServerLocalProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8;
- (id)userInfoForRequesterUserInfo:(id)a3 tileEdition:(unsigned int)a4 tileSet:(id)a5 eTag:(id)a6 bundleIdentifier:(id)a7 reason:(unsigned __int8)a8;
- (uint64_t)reportCorruptTile:(char *)a3;
- (unint64_t)calculateFreeableSizeSync;
- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3;
- (void)_deleteLocationSensitiveInformation:(id)a3;
- (void)_didAddSubscription:(id)a3;
- (void)_forceDataSaverPreload:(id)a3;
- (void)_initiateDataSaverPreloadIfPossible:(id)a3;
- (void)_registerBuiltInProviders;
- (void)_updateExpiringTilesets;
- (void)beginPreloadSessionOfSize:(unint64_t)a3;
- (void)calculateFreeableSize;
- (void)cancel:(long long *)a3 batchID:;
- (void)close;
- (void)dealloc;
- (void)endPreloadSession;
- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6;
- (void)flushPendingWrites;
- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5;
- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3;
- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12;
- (void)proactiveTileDownloaderDidFinish:(id)a3;
- (void)registerProvider:(Class)a3;
- (void)reprioritizeKey:(long long *)a3 newPriority:(int)a4 batchID:;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)runOpportunisticTileDownloader:(id)a3;
- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
- (void)tileDBDidDeleteExternalResource:(id)a3;
- (void)tileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(unsigned int)a6 tileSet:(void *)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10;
- (void)tileRequester:(void *)a3 receivedError:(void *)a4 forKey:(uint64_t)a5;
- (void)tileRequesterFinished:(id)a3;
@end

@implementation GEOTileServerLocalProxy

- (void)_updateExpiringTilesets
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = +[GEOResourceManifestManager modernManagerForConfiguration:self->super._manifestConfiguration];
  v4 = [v3 activeTileGroup];

  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = objc_msgSend(v4, "tileSets", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 hasTimeToLiveSeconds]
          && [v11 timeToLiveSeconds])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v12 = (double *)malloc_type_malloc(16 * [v5 count], 0x1000040F7F8B94BuLL);
    if ([v5 count])
    {
      unint64_t v13 = 0;
      v14 = v12 + 1;
      do
      {
        v15 = [v5 objectAtIndexedSubscript:v13];
        __int16 v16 = [v15 style];
        char v17 = [v15 scale];
        *((_DWORD *)v14 - 2) = ((v16 & 0x3FFF | (([v15 size] & 0xF) << 14) & 0xFFC3FFFF | ((v17 & 0xF) << 18)) << 8) | 1;
        double *v14 = (double)[v15 timeToLiveSeconds];
        v14 += 2;

        ++v13;
      }
      while (v13 < [v5 count]);
    }
    -[GEOTileDB setExpirationRecords:count:](self->_tileCache, "setExpirationRecords:count:", v12, [v5 count]);
    free(v12);
  }
  else
  {
    [(GEOTileDB *)self->_tileCache setExpirationRecords:0 count:0];
  }
}

- (void)generateRequestedFromTileLoaderEndSignpost:(unint64_t)a3
{
  v4 = GEOGetTileLoadingLog();
  v5 = v4;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v5, OS_SIGNPOST_INTERVAL_END, a3, "TileLoaderRequest.geod", "", v6, 2u);
  }
}

- (void)generateRequestedFromTileLoaderBeginSignpost:(os_signpost_id_t)a3 tileKey:(uint64_t)a4 options:(char)a5
{
  uint64_t v7 = GEOGetTileLoadingLog();
  uint64_t v8 = v7;
  if ((a5 & 0x40) != 0)
  {
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "PreliminaryOnly=1";
      v10 = buf;
      goto LABEL_8;
    }
  }
  else if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    __int16 v11 = 0;
    uint64_t v9 = "";
    v10 = (uint8_t *)&v11;
LABEL_8:
    _os_signpost_emit_with_name_impl(&dword_188D96000, v8, OS_SIGNPOST_INTERVAL_BEGIN, a3, "TileLoaderRequest.geod", v9, v10, 2u);
  }
}

void __105__GEOTileServerLocalProxy_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userInfoForRequesterUserInfo:*(void *)(a1 + 40) tileEdition:*(unsigned int *)(a1 + 72) tileSet:*(unsigned int *)(a1 + 76) eTag:*(void *)(a1 + 48) bundleIdentifier:*(void *)(a1 + 56) reason:*(unsigned __int8 *)(a1 + 80)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) loadedTile:*(void *)(a1 + 64) forKey:a1 + 81 info:v3];
}

- (id)userInfoForRequesterUserInfo:(id)a3 tileEdition:(unsigned int)a4 tileSet:(id)a5 eTag:(id)a6 bundleIdentifier:(id)a7 reason:(unsigned __int8)a8
{
  uint64_t v8 = a8;
  uint64_t v11 = *(void *)&a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (id)[a3 mutableCopy];
  if (!v15) {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  __int16 v16 = [v15 objectForKey:@"GEOTileLoadResultSource"];

  if (!v16)
  {
    char v17 = [NSNumber numberWithInteger:2];
    [v15 setObject:v17 forKey:@"GEOTileLoadResultSource"];
  }
  long long v18 = [NSNumber numberWithUnsignedChar:v8];
  [v15 setObject:v18 forKey:@"OriginalLoadReason"];

  long long v19 = [NSNumber numberWithBool:0];
  [v15 setObject:v19 forKey:@"GEOTileLoadResultIsPreliminary"];

  long long v20 = [NSNumber numberWithUnsignedInt:v11];
  [v15 setObject:v20 forKey:@"tileEdition"];

  long long v21 = [NSNumber numberWithUnsignedInt:*(void *)&a5];
  [v15 setObject:v21 forKey:@"tileSet"];

  v22 = [NSNumber numberWithInt:getpid()];
  [v15 setObject:v22 forKey:@"ProcessID"];

  if ([v14 length]) {
    [v15 setObject:v14 forKey:@"GEOTileLoadResultRequestingAppBundleIdentifier"];
  }
  if ([v13 length]) {
    [v15 setObject:v13 forKey:@"ETag"];
  }

  return v15;
}

- (void)_registerBuiltInProviders
{
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  [(GEOTileServerLocalProxy *)self registerProvider:objc_opt_class()];
  uint64_t v3 = objc_opt_class();

  [(GEOTileServerLocalProxy *)self registerProvider:v3];
}

- (void)registerProvider:(Class)a3
{
  objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[objc_class tileProviderIdentifier](a3, "tileProviderIdentifier"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMapTable *)self->_providers setObject:a3 forKey:v5];
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_64(uint64_t a1)
{
  BOOL v2 = *(unsigned char *)(a1 + 56) == 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 57);
  id v4 = *(id *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  v6 = [NSNumber numberWithInteger:1];
  uint64_t v7 = [NSNumber numberWithBool:v2];
  uint64_t v8 = [NSNumber numberWithUnsignedChar:v3];
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, @"GEOTileLoadResultSource", v7, @"GEOTileLoadResultIsPreliminary", v8, @"OriginalLoadReason", 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if ([v4 length]) {
    [v10 setObject:v4 forKey:@"ETag"];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained proxy:*(void *)(a1 + 40) loadedTile:*(void *)(a1 + 48) forKey:a1 + 58 info:v10];
}

- (void)tileRequester:(void *)a3 receivedData:(void *)a4 tileEdition:(int)a5 tileSetDB:(unsigned int)a6 tileSet:(void *)a7 etag:(void *)a8 forKey:(__int128)a9 userInfo:(void *)a10
{
  HIDWORD(v40) = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v54 = a9;
  id v14 = a3;
  id v42 = a4;
  id v43 = a8;
  id v15 = a10;
  id v16 = a7;
  char v17 = [v14 deviceCountry];
  long long v18 = [v14 deviceRegion];
  long long v19 = [*(id *)(a1 + 48) devicePostureCountry];
  long long v20 = [*(id *)(a1 + 48) devicePostureRegion];
  BOOL IsAllowable = _GEOTileResponseIsAllowable(v16, v17, v18, v19, v20);

  long long v21 = v15;
  int IsCacheable = _GEOTileResponseIsCacheable((unsigned __int8 *)&v54, v15);
  uint64_t v23 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  v24 = [v14 context];
  v25 = v24;
  if (v24) {
    char v26 = [v24 loadReason];
  }
  else {
    char v26 = 0;
  }
  v27 = v43;
  if ((IsCacheable & IsAllowable) == 1)
  {
    v28 = [v21 objectForKeyedSubscript:@"CachedDataWasCurrent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v29 = [v28 BOOLValue];
    }
    else {
      char v29 = 0;
    }
    BYTE1(v40) = v29;
    LOBYTE(v40) = v26;
    objc_msgSend(*(id *)(a1 + 48), "addData:forKey:edition:set:provider:etag:reason:isIdenticalToExistingStaleData:", v42, &v54, HIDWORD(v40), a6, v54 & 0x7F, v43, v40);
  }
  if (v25)
  {
    char v30 = v26;
    v31 = [v25 pendingRequesterList];
    [v31 removeKey:&v54];

    v32 = [v25 interestList];
    int v33 = [v32 containsKey:&v54];

    os_unfair_lock_unlock(v23);
    if ((v33 & IsAllowable) == 1)
    {
      v34 = [v14 tileRequest];
      v35 = [v34 auditToken];
      v36 = [v35 bundleId];
      v37 = (void *)[v36 copy];

      v27 = v43;
      v38 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __105__GEOTileServerLocalProxy_tileRequester_receivedData_tileEdition_tileSetDB_tileSet_etag_forKey_userInfo___block_invoke;
      block[3] = &unk_1E53DA7D8;
      block[4] = a1;
      id v46 = v21;
      int v50 = HIDWORD(v40);
      unsigned int v51 = a6;
      id v47 = v43;
      id v48 = v37;
      char v52 = v30;
      id v49 = v42;
      long long v53 = v54;
      id v39 = v37;
      dispatch_async(v38, block);
    }
  }
  else
  {
    os_unfair_lock_unlock(v23);
  }
}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsKey:a2] ^ 1;
}

BOOL __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_63(uint64_t a1, _OWORD *a2, void *a3, char a4, void *a5, char a6, double a7)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  os_unfair_lock_lock_with_options();
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 72) indexOfObjectIdenticalTo:*(void *)(a1 + 40)];
  int v15 = [*(id *)(a1 + 48) containsKey:a2];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  id v16 = [*(id *)(a1 + 56) objectForKey:a2];
  char v17 = v16;
  if (v16)
  {
    os_signpost_id_t v18 = [v16 unsignedLongLongValue];
    long long v19 = GEOGetTileLoadingLog();
    long long v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v20, OS_SIGNPOST_INTERVAL_END, v18, "CheckDiskCache", "", buf, 2u);
    }
  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_24;
  }
  if (!v12)
  {
    [*(id *)(a1 + 80) _addKeyToBack:a2];
    v22 = [*(id *)(a1 + 40) cacheMissNoDataList];
LABEL_23:
    v27 = v22;
    [v22 addKey:a2];

    goto LABEL_24;
  }
  if (!v15 || (a4 & 1) != 0)
  {
    if (!v15) {
      goto LABEL_16;
    }
  }
  else if (GEOConfigGetDouble(GeoServicesConfig_StaleTileDisplayAgeThreshold, (uint64_t)off_1E9114288) <= a7)
  {
    int v21 = 1;
    if (a4) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  *(_OWORD *)buf = *a2;
  uint64_t v23 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_64;
  block[3] = &unk_1E53DA788;
  char v34 = a4;
  id v24 = v13;
  char v35 = a6;
  uint64_t v25 = *(void *)(a1 + 32);
  id v31 = v24;
  uint64_t v32 = v25;
  id v33 = v12;
  long long v36 = *(_OWORD *)buf;
  dispatch_async(v23, block);

LABEL_16:
  int v21 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_17:
    if ([v13 length]) {
      [*(id *)(a1 + 64) setObject:v13 forKey:a2];
    }
    [*(id *)(a1 + 72) setObject:v12 forKey:a2];
    [*(id *)(a1 + 80) _addKeyToBack:a2];
    char v26 = *(void **)(a1 + 40);
    if (v21) {
      [v26 cacheMissStaleUnusableDataList];
    }
    else {
    v22 = [v26 cacheMissStaleDataList];
    }
    goto LABEL_23;
  }
LABEL_24:

  return v14 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)loadTiles:(id)a3 batchID:(int)a4 priorities:(const unsigned int *)a5 hasAdditionalInfos:(const BOOL *)a6 additionalInfos:(const GEOTileLoaderAdditionalInfo *)a7 signpostIDs:(const unint64_t *)a8 createTimes:(const double *)a9 reason:(unsigned __int8)a10 options:(unint64_t)a11 auditToken:(id)a12
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a12;
  if ([v15 count])
  {
    SEL v104 = a2;
    id v109 = v16;
    unint64_t v17 = a11 & (self->_tileCache == 0) ^ a11;
    uint64_t v18 = *(unsigned char *)[v15 firstKey] & 0x7F;
    providers = self->_providers;
    long long v20 = [NSNumber numberWithUnsignedChar:v18];
    id v21 = [(NSMapTable *)providers objectForKey:v20];

    v107 = v21;
    if (!v21)
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"No provider registered can handle keys with provider %lu", v18);
      delegateQueue = self->super._delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2;
      block[3] = &unk_1E53D99F0;
      void block[4] = self;
      id v171 = v15;
      id v172 = v22;
      id v24 = v22;
      dispatch_async(delegateQueue, block);
    }
    uint64_t v25 = objc_alloc_init(GEOTileServerLocalProxyBatchContext);
    [(GEOTileServerLocalProxyBatchContext *)v25 setFullList:v15];
    v102 = (void *)[v15 copy];
    -[GEOTileServerLocalProxyBatchContext setInterestList:](v25, "setInterestList:");
    unint64_t v103 = v17;
    if (v17)
    {
      v28 = objc_alloc_init(GEOTileKeyList);
      char v29 = objc_alloc_init(GEOTileKeyList);
      [(GEOTileServerLocalProxyBatchContext *)v25 setCacheMissNoDataList:v29];

      char v30 = objc_alloc_init(GEOTileKeyList);
      [(GEOTileServerLocalProxyBatchContext *)v25 setCacheMissStaleDataList:v30];

      id v31 = objc_alloc_init(GEOTileKeyList);
      [(GEOTileServerLocalProxyBatchContext *)v25 setCacheMissStaleUnusableDataList:v31];

      char v26 = v28;
    }
    else
    {
      char v26 = (GEOTileKeyList *)v15;
    }
    v101 = v26;
    -[GEOTileServerLocalProxyBatchContext setRequesterList:](v25, "setRequesterList:");
    [(GEOTileServerLocalProxyBatchContext *)v25 setLoadReason:a10];
    [(GEOTileServerLocalProxyBatchContext *)v25 setProactivelyLoadOnFailure:(a11 >> 8) & 1];
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_inProgress addObject:v25];
    os_unfair_lock_unlock(&self->_inProgressLock);
    v100 = [[GEOTileKeyMap alloc] initWithMapType:0];
    v99 = [[GEOTileKeyMap alloc] initWithMapType:0];
    uint64_t v32 = [GEOTileKeyMap alloc];
    v112 = self;
    id v113 = v15;
    v110 = v25;
    if (a8)
    {
      v124 = -[GEOTileKeyMap initWithMapType:capacity:](v32, "initWithMapType:capacity:", 0, [v15 count]);
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v33 = v15;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v166 objects:v181 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = 0;
        uint64_t v37 = *(void *)v167;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v167 != v37) {
              objc_enumerationMutation(v33);
            }
            uint64_t v39 = *(void *)(*((void *)&v166 + 1) + 8 * i);
            uint64_t v40 = [NSNumber numberWithUnsignedLongLong:a8[v36 + i]];
            [(GEOTileKeyMap *)v124 setObject:v40 forKey:v39];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v166 objects:v181 count:16];
          v36 += i;
        }
        while (v35);
      }

      self = v112;
      id v15 = v113;
      uint64_t v25 = v110;
    }
    else
    {
      v124 = [(GEOTileKeyMap *)v32 initWithMapType:0 capacity:0];
    }
    v41 = [GEOTileKeyMap alloc];
    if (a9)
    {
      id v42 = -[GEOTileKeyMap initWithMapType:capacity:](v41, "initWithMapType:capacity:", 0, [v15 count]);
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id v43 = v15;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v162 objects:v180 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = 0;
        uint64_t v47 = *(void *)v163;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v163 != v47) {
              objc_enumerationMutation(v43);
            }
            uint64_t v49 = *(void *)(*((void *)&v162 + 1) + 8 * j);
            int v50 = [NSNumber numberWithDouble:a9[v46 + j]];
            [(GEOTileKeyMap *)v42 setObject:v50 forKey:v49];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v162 objects:v180 count:16];
          v46 += j;
        }
        while (v45);
      }

      self = v112;
      id v15 = v113;
      uint64_t v25 = v110;
    }
    else
    {
      id v42 = [(GEOTileKeyMap *)v41 initWithMapType:0 capacity:0];
    }
    char v51 = a11;
    if (a5 && ((a11 & 2) != 0 || ([v21 requiresNetwork] & 1) == 0))
    {
      char v52 = -[GEOTileKeyMap initWithMapType:capacity:]([GEOTileKeyMap alloc], "initWithMapType:capacity:", 0, [v15 count]);
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v53 = v15;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v158 objects:v179 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = 0;
        uint64_t v57 = *(void *)v159;
        do
        {
          uint64_t v58 = 0;
          uint64_t v121 = v56;
          v59 = &a5[v56];
          do
          {
            if (*(void *)v159 != v57) {
              objc_enumerationMutation(v53);
            }
            uint64_t v60 = *(void *)(*((void *)&v158 + 1) + 8 * v58);
            v61 = [NSNumber numberWithUnsignedInt:v59[v58]];
            [(GEOTileKeyMap *)v52 setObject:v61 forKey:v60];

            ++v58;
          }
          while (v55 != v58);
          uint64_t v55 = [v53 countByEnumeratingWithState:&v158 objects:v179 count:16];
          uint64_t v56 = v121 + v58;
        }
        while (v55);
      }

      self = v112;
      id v15 = v113;
      uint64_t v25 = v110;
      char v51 = a11;
    }
    else
    {
      char v52 = 0;
    }
    v122 = 0;
    id v16 = v109;
    v62 = "N6google8protobuf17GeneratedCodeInfoE" + 21;
    if (a6 && a7)
    {
      if ((v51 & 2) != 0 || ([v107 requiresNetwork] & 1) == 0)
      {
        v122 = [[GEOTileKeyMap alloc] initWithMapType:0];
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        id v63 = v15;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v154 objects:v178 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = 0;
          uint64_t v67 = *(void *)v155;
          do
          {
            uint64_t v68 = 0;
            v69 = &a7[v66];
            uint64_t v119 = v66;
            v70 = &a6[v66];
            do
            {
              if (*(void *)v155 != v67) {
                objc_enumerationMutation(v63);
              }
              if (v70[v68])
              {
                uint64_t v71 = *(void *)(*((void *)&v154 + 1) + 8 * v68);
                GEOTileLoaderAdditionalInfo buf = *v69;
                v72 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&buf length:16];
                [(GEOTileKeyMap *)v122 setObject:v72 forKey:v71];
              }
              ++v68;
              ++v69;
            }
            while (v65 != v68);
            uint64_t v65 = [v63 countByEnumeratingWithState:&v154 objects:v178 count:16];
            uint64_t v66 = v119 + v68;
          }
          while (v65);
        }

        self = v112;
        id v15 = v113;
        id v16 = v109;
        uint64_t v25 = v110;
        v62 = "neratedCodeInfoE";
      }
      else
      {
        v122 = 0;
      }
    }
    v139[0] = MEMORY[0x1E4F143A8];
    uint64_t v73 = *((void *)v62 + 481);
    v139[1] = v73;
    v139[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_3;
    v139[3] = &unk_1E53DA740;
    v139[4] = self;
    v74 = v101;
    v140 = v74;
    id v75 = v102;
    id v141 = v75;
    unint64_t v150 = v103;
    v151 = v107;
    v76 = v25;
    v142 = v76;
    v77 = v100;
    v143 = v77;
    v120 = v99;
    v144 = v120;
    v117 = v52;
    v145 = v117;
    v78 = v124;
    v146 = v78;
    v115 = v42;
    v147 = v115;
    v123 = v122;
    v148 = v123;
    unsigned __int8 v153 = a10;
    id v149 = v16;
    SEL v152 = v104;
    uint64_t v79 = MEMORY[0x18C120660](v139);
    v80 = (void *)v79;
    if (v103)
    {
      v105 = (void (**)(void))v79;
      v106 = v76;
      v111 = v77;
      v108 = v75;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v82 = v15;
      uint64_t v83 = [v82 countByEnumeratingWithState:&v135 objects:v176 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v136;
        do
        {
          for (uint64_t k = 0; k != v84; ++k)
          {
            if (*(void *)v136 != v85) {
              objc_enumerationMutation(v82);
            }
            v87 = *(char **)(*((void *)&v135 + 1) + 8 * k);
            if (*v87 < 0)
            {
              [(GEOTileKeyList *)v74 _addKeyToBack:*(void *)(*((void *)&v135 + 1) + 8 * k)];
            }
            else
            {
              v88 = [(GEOTileKeyMap *)v78 objectForKey:*(void *)(*((void *)&v135 + 1) + 8 * k)];
              v89 = v88;
              if (v88)
              {
                os_signpost_id_t v90 = [v88 unsignedLongLongValue];
                unsigned int v134 = 1;
                GEOTileKeyStyle((uint64_t)v87, &v134);
                v91 = GEOGetTileLoadingLog();
                v92 = v91;
                if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
                {
                  v93 = @"RASTER_STANDARD";
                  switch(v134)
                  {
                    case 0u:
                      break;
                    case 1u:
                      v93 = @"VECTOR_STANDARD";
                      break;
                    case 2u:
                      v93 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
                      break;
                    case 3u:
                      v93 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
                      break;
                    case 4u:
                      v93 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
                      break;
                    case 5u:
                      v93 = @"RASTER_STANDARD_BACKGROUND";
                      break;
                    case 6u:
                      v93 = @"RASTER_HYBRID";
                      break;
                    case 7u:
                      v93 = @"RASTER_SATELLITE";
                      break;
                    case 8u:
                      v93 = @"RASTER_TERRAIN";
                      break;
                    case 0xBu:
                      v93 = @"VECTOR_BUILDINGS";
                      break;
                    case 0xCu:
                      v93 = @"VECTOR_TRAFFIC";
                      break;
                    case 0xDu:
                      v93 = @"VECTOR_POI";
                      break;
                    case 0xEu:
                      v93 = @"SPUTNIK_METADATA";
                      break;
                    case 0xFu:
                      v93 = @"SPUTNIK_C3M";
                      break;
                    case 0x10u:
                      v93 = @"SPUTNIK_DSM";
                      break;
                    case 0x11u:
                      v93 = @"SPUTNIK_DSM_GLOBAL";
                      break;
                    case 0x12u:
                      v93 = @"VECTOR_REALISTIC";
                      break;
                    case 0x13u:
                      v93 = @"VECTOR_LEGACY_REALISTIC";
                      break;
                    case 0x14u:
                      v93 = @"VECTOR_ROADS";
                      break;
                    case 0x15u:
                      v93 = @"RASTER_VEGETATION";
                      break;
                    case 0x16u:
                      v93 = @"VECTOR_TRAFFIC_SKELETON";
                      break;
                    case 0x17u:
                      v93 = @"RASTER_COASTLINE_MASK";
                      break;
                    case 0x18u:
                      v93 = @"RASTER_HILLSHADE";
                      break;
                    case 0x19u:
                      v93 = @"VECTOR_TRAFFIC_WITH_GREEN";
                      break;
                    case 0x1Au:
                      v93 = @"VECTOR_TRAFFIC_STATIC";
                      break;
                    case 0x1Bu:
                      v93 = @"RASTER_COASTLINE_DROP_MASK";
                      break;
                    case 0x1Cu:
                      v93 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
                      break;
                    case 0x1Du:
                      v93 = @"VECTOR_SPEED_PROFILES";
                      break;
                    case 0x1Eu:
                      v93 = @"VECTOR_VENUES";
                      break;
                    case 0x1Fu:
                      v93 = @"RASTER_DOWN_SAMPLED";
                      break;
                    case 0x20u:
                      v93 = @"RASTER_COLOR_BALANCED";
                      break;
                    case 0x21u:
                      v93 = @"RASTER_SATELLITE_NIGHT";
                      break;
                    case 0x22u:
                      v93 = @"SPUTNIK_VECTOR_BORDER";
                      break;
                    case 0x23u:
                      v93 = @"RASTER_SATELLITE_DIGITIZE";
                      break;
                    case 0x24u:
                      v93 = @"RASTER_HILLSHADE_PARKS";
                      break;
                    case 0x25u:
                      v93 = @"VECTOR_TRANSIT";
                      break;
                    case 0x26u:
                      v93 = @"RASTER_STANDARD_BASE";
                      break;
                    case 0x27u:
                      v93 = @"RASTER_STANDARD_LABELS";
                      break;
                    case 0x28u:
                      v93 = @"RASTER_HYBRID_ROADS";
                      break;
                    case 0x29u:
                      v93 = @"RASTER_HYBRID_LABELS";
                      break;
                    case 0x2Au:
                      v93 = @"FLYOVER_C3M_MESH";
                      break;
                    case 0x2Bu:
                      v93 = @"FLYOVER_C3M_JPEG_TEXTURE";
                      break;
                    case 0x2Cu:
                      v93 = @"FLYOVER_C3M_ASTC_TEXTURE";
                      break;
                    case 0x2Du:
                      v93 = @"RASTER_SATELLITE_ASTC";
                      break;
                    case 0x2Eu:
                      v93 = @"RASTER_HYBRID_ROADS_AND_LABELS";
                      break;
                    case 0x2Fu:
                      v93 = @"VECTOR_TRANSIT_SELECTION";
                      break;
                    case 0x30u:
                      v93 = @"VECTOR_COVERAGE";
                      break;
                    case 0x34u:
                      v93 = @"FLYOVER_METADATA";
                      break;
                    case 0x35u:
                      v93 = @"VECTOR_ROAD_NETWORK";
                      break;
                    case 0x36u:
                      v93 = @"VECTOR_LAND_COVER";
                      break;
                    case 0x37u:
                      v93 = @"VECTOR_DEBUG";
                      break;
                    case 0x38u:
                      v93 = @"VECTOR_STREET_POI";
                      break;
                    case 0x39u:
                      v93 = @"MUNIN_METADATA";
                      break;
                    case 0x3Au:
                      v93 = @"VECTOR_SPR_MERCATOR";
                      break;
                    case 0x3Bu:
                      v93 = @"VECTOR_SPR_MODELS";
                      break;
                    case 0x3Cu:
                      v93 = @"VECTOR_SPR_MATERIALS";
                      break;
                    case 0x3Du:
                      v93 = @"VECTOR_SPR_METADATA";
                      break;
                    case 0x3Eu:
                      v93 = @"VECTOR_TRACKS";
                      break;
                    case 0x3Fu:
                      v93 = @"VECTOR_RESERVED_2";
                      break;
                    case 0x40u:
                      v93 = @"VECTOR_STREET_LANDMARKS";
                      break;
                    case 0x41u:
                      v93 = @"COARSE_LOCATION_POLYGONS";
                      break;
                    case 0x42u:
                      v93 = @"VECTOR_SPR_ROADS";
                      break;
                    case 0x43u:
                      v93 = @"VECTOR_SPR_STANDARD";
                      break;
                    case 0x44u:
                      v93 = @"VECTOR_POI_V2";
                      break;
                    case 0x45u:
                      v93 = @"VECTOR_POLYGON_SELECTION";
                      break;
                    case 0x46u:
                      v93 = @"VL_METADATA";
                      break;
                    case 0x47u:
                      v93 = @"VL_DATA";
                      break;
                    case 0x48u:
                      v93 = @"PROACTIVE_APP_CLIP";
                      break;
                    case 0x49u:
                      v93 = @"VECTOR_BUILDINGS_V2";
                      break;
                    case 0x4Au:
                      v93 = @"POI_BUSYNESS";
                      break;
                    case 0x4Bu:
                      v93 = @"POI_DP_BUSYNESS";
                      break;
                    case 0x4Cu:
                      v93 = @"SMART_INTERFACE_SELECTION";
                      break;
                    case 0x4Du:
                      v93 = @"VECTOR_ASSETS";
                      break;
                    case 0x4Eu:
                      v93 = @"SPR_ASSET_METADATA";
                      break;
                    case 0x4Fu:
                      v93 = @"VECTOR_SPR_POLAR";
                      break;
                    case 0x50u:
                      v93 = @"SMART_DATA_MODE";
                      break;
                    case 0x51u:
                      v93 = @"CELLULAR_PERFORMANCE_SCORE";
                      break;
                    case 0x52u:
                      v93 = @"VECTOR_SPR_MODELS_OCCLUSION";
                      break;
                    case 0x53u:
                      v93 = @"VECTOR_TOPOGRAPHIC";
                      break;
                    case 0x54u:
                      v93 = @"VECTOR_POI_V2_UPDATE";
                      break;
                    case 0x55u:
                      v93 = @"VECTOR_LIVE_DATA_UPDATES";
                      break;
                    case 0x56u:
                      v93 = @"VECTOR_TRAFFIC_V2";
                      break;
                    case 0x57u:
                      v93 = @"VECTOR_ROAD_SELECTION";
                      break;
                    case 0x58u:
                      v93 = @"VECTOR_REGION_METADATA";
                      break;
                    case 0x59u:
                      v93 = @"RAY_TRACING";
                      break;
                    case 0x5Au:
                      v93 = @"VECTOR_CONTOURS";
                      break;
                    case 0x5Bu:
                      v93 = @"RASTER_SATELLITE_POLAR";
                      break;
                    case 0x5Cu:
                      v93 = @"VMAP4_ELEVATION";
                      break;
                    case 0x5Du:
                      v93 = @"VMAP4_ELEVATION_POLAR";
                      break;
                    case 0x5Eu:
                      v93 = @"CELLULAR_COVERAGE_PLMN";
                      break;
                    case 0x5Fu:
                      v93 = @"RASTER_SATELLITE_POLAR_NIGHT";
                      break;
                    case 0x60u:
                      v93 = @"UNUSED_96";
                      break;
                    case 0x61u:
                      v93 = @"UNUSED_97";
                      break;
                    case 0x62u:
                      v93 = @"UNUSED_98";
                      break;
                    case 0x63u:
                      v93 = @"UNUSED_99";
                      break;
                    case 0x64u:
                      v93 = @"UNUSED_100";
                      break;
                    case 0x65u:
                      v93 = @"UNUSED_101";
                      break;
                    case 0x66u:
                      v93 = @"UNUSED_102";
                      break;
                    case 0x67u:
                      v93 = @"UNUSED_103";
                      break;
                    case 0x68u:
                      v93 = @"UNUSED_104";
                      break;
                    case 0x69u:
                      v93 = @"UNUSED_105";
                      break;
                    case 0x6Au:
                      v93 = @"UNUSED_106";
                      break;
                    case 0x6Bu:
                      v93 = @"UNUSED_107";
                      break;
                    case 0x6Cu:
                      v93 = @"UNUSED_108";
                      break;
                    case 0x6Du:
                      v93 = @"UNUSED_109";
                      break;
                    case 0x6Eu:
                      v93 = @"UNUSED_110";
                      break;
                    case 0x6Fu:
                      v93 = @"UNUSED_111";
                      break;
                    case 0x70u:
                      v93 = @"UNUSED_112";
                      break;
                    case 0x71u:
                      v93 = @"UNUSED_113";
                      break;
                    case 0x72u:
                      v93 = @"UNUSED_114";
                      break;
                    case 0x73u:
                      v93 = @"UNUSED_115";
                      break;
                    case 0x74u:
                      v93 = @"UNUSED_116";
                      break;
                    case 0x75u:
                      v93 = @"UNUSED_117";
                      break;
                    case 0x76u:
                      v93 = @"UNUSED_118";
                      break;
                    case 0x77u:
                      v93 = @"UNUSED_119";
                      break;
                    default:
                      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v134);
                      v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      break;
                  }
                  buf.var0[0] = 138543362;
                  *(void *)&buf.var0[1] = v93;
                  _os_signpost_emit_with_name_impl(&dword_188D96000, v92, OS_SIGNPOST_INTERVAL_BEGIN, v90, "CheckDiskCache", "Type=%{public}@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
          }
          uint64_t v84 = [v82 countByEnumeratingWithState:&v135 objects:v176 count:16];
        }
        while (v84);
      }

      v94 = (void *)[v82 copy];
      [v94 removeKeysMatchingPredicate:&__block_literal_global_17];
      if ([v94 count])
      {
        v95 = dispatch_group_create();
        tileCache = v112->_tileCache;
        workQueue = v112->_workQueue;
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = v73;
        v127[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_63;
        v127[3] = &unk_1E53DA7B0;
        v127[4] = v112;
        v76 = v106;
        v128 = v106;
        id v75 = v108;
        id v129 = v108;
        v130 = v78;
        v131 = v111;
        v132 = v120;
        v133 = v74;
        [(GEOTileDB *)tileCache dataForKeys:v94 reason:a10 group:v95 callbackQueue:workQueue dataHandler:v127];
        v98 = v112->_workQueue;
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = v73;
        v125[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_66;
        v125[3] = &unk_1E53DA028;
        v81 = v105;
        v126 = v105;
        dispatch_group_notify(v95, v98, v125);

        id v15 = v113;
      }
      else
      {
        v81 = v105;
        v105[2](v105);
        id v15 = v113;
        v76 = v106;
        id v75 = v108;
      }

      id v16 = v109;
      v77 = v111;
    }
    else
    {
      (*(void (**)(uint64_t))(v79 + 16))(v79);
      v81 = v80;
    }
  }
  else
  {
    v27 = self->super._delegateQueue;
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke;
    v173[3] = &unk_1E53D99F0;
    v173[4] = self;
    id v174 = v15;
    v175 = @"Must have at least one tile in list";
    dispatch_async(v27, v173);
  }
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_4;
  v26[3] = &unk_1E53DA718;
  BOOL v2 = *(void **)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  [v2 removeKeysMatchingPredicate:v26];
  if (![*(id *)(a1 + 40) count]) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 120) & 2) == 0 && ([*(id *)(a1 + 128) requiresNetwork])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    id v4 = NSString;
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 136));
    v6 = [v4 stringWithFormat:@"%@ is not allowed to use the network, but needs it in order to continue", v5];
    uint64_t v7 = [v3 GEOErrorWithCode:-6 reason:v6];

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_6;
    block[3] = &unk_1E53D99F0;
    void block[4] = v8;
    id v22 = *(id *)(a1 + 40);
    id v23 = v7;
    id v10 = v7;
    dispatch_async(v9, block);

LABEL_5:
    [*(id *)(*(void *)(a1 + 32) + 72) removeObjectIdenticalTo:*(void *)(a1 + 56)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 128) requiresNetwork])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 16);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_5;
    v24[3] = &unk_1E53D8998;
    v24[4] = v11;
    id v25 = *(id *)(a1 + 40);
    dispatch_async(v12, v24);
  }
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 56) setPendingRequesterList:v13];
  uint64_t v14 = (2 * *(_DWORD *)(a1 + 120)) & 0x10;
  id v15 = [GEOTileRequest alloc];
  BYTE1(v20) = *(unsigned char *)(a1 + 144);
  LOBYTE(v20) = 1;
  id v16 = -[GEOTileRequest initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:](v15, "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v14, 0, v20);
  unint64_t v17 = objc_msgSend(objc_alloc(*(Class *)(a1 + 128)), "initWithTileRequest:delegateQueue:delegate:", v16, *(void *)(*(void *)(a1 + 32) + 88));
  [v17 setContext:*(void *)(a1 + 56)];
  [*(id *)(a1 + 56) setTileRequester:v17];
  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 48) devicePostureCountry];
  [v17 setDeviceCountry:v18];

  long long v19 = [*(id *)(*(void *)(a1 + 32) + 48) devicePostureRegion];
  [v17 setDeviceRegion:v19];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  if (v17)
  {
    [v17 start];
  }
LABEL_10:
}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_62(uint64_t a1, unsigned __int8 *a2)
{
  return *a2 >> 7;
}

- (void)tileRequesterFinished:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_inProgressLock);
  id v5 = [v4 context];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 pendingRequesterList];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [v6 requesterList];
      uint64_t v10 = [v9 count];

      uint64_t v11 = [v6 pendingRequesterList];
      uint64_t v12 = [v11 count];

      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = [NSString stringWithFormat:@"%@ loaded %ld of %ld needed tiles and then claimed it was finished", v4, v10 - v12, v10];
      id v15 = [v13 GEOErrorWithCode:-7 reason:v14];

      id v16 = [v6 pendingRequesterList];
      delegateQueue = self->super._delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__GEOTileServerLocalProxy_tileRequesterFinished___block_invoke;
      block[3] = &unk_1E53D99F0;
      void block[4] = self;
      id v21 = v16;
      id v22 = v15;
      id v18 = v15;
      id v19 = v16;
      dispatch_async(delegateQueue, block);
    }
    [(NSMutableArray *)self->_inProgress removeObjectIdenticalTo:v6];
    [v4 setContext:0];
    [v4 tearDown];
    [v6 setTileRequester:0];
  }
  os_unfair_lock_unlock(&self->_inProgressLock);
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_6(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained proxy:a1[4] failedToLoadTiles:a1[5] error:a1[6]];
}

- (GEOTileServerLocalProxy)initWithCacheDBLocation:(id)a3 cacheFilesLocation:(id)a4 manifestConfiguration:(id)a5 locale:(id)a6 delegateQueue:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  v36.receiver = self;
  v36.super_class = (Class)GEOTileServerLocalProxy;
  id v16 = [(GEOTileServerProxy *)&v36 initWithCacheDBLocation:v14 cacheFilesLocation:v15 manifestConfiguration:a5 locale:a6 delegateQueue:a7 delegate:a8];
  if (!v16) {
    goto LABEL_12;
  }
  unint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  inProgress = v16->_inProgress;
  v16->_inProgress = v17;

  v16->_inProgressLock._os_unfair_lock_opaque = 0;
  uint64_t v19 = geo_dispatch_queue_create();
  workQueue = v16->_workQueue;
  v16->_workQueue = (OS_dispatch_queue *)v19;

  uint64_t v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  providers = v16->_providers;
  v16->_providers = (NSMapTable *)v21;

  if (v14)
  {
    id v23 = [[GEOTileDB alloc] initWithDBDirectory:v14 externalFilesDirectory:v15];
    tileCache = v16->_tileCache;
    v16->_tileCache = v23;

    [(GEOTileDB *)v16->_tileCache registerObserver:v16 queue:v16->_workQueue];
    id v25 = +[GEOMapDataSubscriptionExpirationHelper sharedHelper];
    [v25 configureWithDB:v16->_tileCache];
  }
  [(GEOTileServerLocalProxy *)v16 _registerBuiltInProviders];
  char v26 = +[GEOResourceManifestManager modernManagerForConfiguration:v16->super._manifestConfiguration];
  [v26 addTileGroupObserver:v16 queue:v16->_workQueue];

  [(GEOTileServerLocalProxy *)v16 _updateExpiringTilesets];
  id v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:v16 selector:sel__deleteLocationSensitiveInformation_ name:@"GEOLocationServicesDisabledNotification" object:0];

  v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v28 addObserver:v16 selector:sel__deleteLocationSensitiveInformation_ name:kGEOResetPrivacyWarningsNotification object:0];

  char v29 = +[GEOPrivacyManager sharedManager];
  if ([v29 hasFiredResetPrivacyWarningsNotification])
  {

LABEL_7:
    [(GEOTileServerLocalProxy *)v16 _deleteLocationSensitiveInformation:0];
    goto LABEL_8;
  }
  char v30 = +[GEOPrivacyManager sharedManager];
  int v31 = [v30 hasFiredLocationServicesDisabledNotification];

  if (v31) {
    goto LABEL_7;
  }
LABEL_8:
  if (_cdsObserversEnabled == 1)
  {
    manifestConfiguration = v16->super._manifestConfiguration;
    if (!manifestConfiguration
      || [(GEOResourceManifestConfiguration *)manifestConfiguration isDefaultConfiguration])
    {
      id v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v33 addObserver:v16 selector:sel__forceDataSaverPreload_ name:@"GEOTileServerLocalProxyForceExplicitProactiveTileDownloadRun" object:0];

      uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v34 addObserver:v16 selector:sel__didAddSubscription_ name:0x1ED5A1B70 object:0];
    }
  }
LABEL_12:

  return v16;
}

uint64_t __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)calculateFreeableSize
{
  tileCache = self->_tileCache;
  delegateQueue = self->super._delegateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__GEOTileServerLocalProxy_calculateFreeableSize__block_invoke;
  v4[3] = &unk_1E53DA800;
  v4[4] = self;
  [(GEOTileDB *)tileCache calculateFreeableSizeWithQueue:delegateQueue handler:v4];
}

- (void)tileRequester:(void *)a3 receivedError:(void *)a4 forKey:(uint64_t)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v17 = a5;
  *((void *)&v17 + 1) = a6;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  uint64_t v10 = [v8 context];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 pendingRequesterList];
    [v12 removeKey:&v17];

    id v13 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__GEOTileServerLocalProxy_tileRequester_receivedError_forKey___block_invoke;
    block[3] = &unk_1E53D7FC0;
    long long v16 = v17;
    void block[4] = a1;
    id v15 = v9;
    dispatch_async(v13, block);
    if (((char)v17 & 0x80000000) == 0)
    {
      if ([v11 proactivelyLoadOnFailure])
      {
        objc_msgSend(*(id *)(a1 + 48), "trackFailureForKey:tileSet:shouldProactivelyLoad:", &v17, objc_msgSend(v8, "tileSetForKey:", &v17), 1);
        if (!*(void *)(a1 + 96)) {
          [(id)a1 _initiateDataSaverPreloadIfPossible:0];
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) willGoToNetworkForTiles:*(void *)(a1 + 40)];
}

void __52__GEOTileServerLocalProxy_calculateFreeableSizeSync__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) canShrinkDiskCacheByAmount:*(void *)(a1 + 40)];
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:a1[6]];
  [WeakRetained proxy:v2 failedToLoadTiles:v3 error:v4];
}

- (unint64_t)calculateFreeableSizeSync
{
  unint64_t v3 = [(GEOTileDB *)self->_tileCache calculateFreeableSizeSync];
  delegateQueue = self->super._delegateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__GEOTileServerLocalProxy_calculateFreeableSizeSync__block_invoke;
  v6[3] = &unk_1E53D79B0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(delegateQueue, v6);
  return v3;
}

- (void)_deleteLocationSensitiveInformation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  for (uint64_t i = 0; i != 10; ++i)
  {
    int v5 = 0;
    int v6 = (GEOTileSetStyleMetadata[4 * i] & 0x3FFF) << 8;
    do
    {
      int v7 = 0;
      int v8 = 3;
      do
      {
        id v9 = [NSNumber numberWithUnsignedInt:v6 | (v5 << 22) | v7 | 1u];
        [v3 addObject:v9];

        v7 += 0x4000000;
        --v8;
      }
      while (v8);
      ++v5;
    }
    while (v5 != 3);
  }
  if ([v3 count])
  {
    uint64_t v10 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)GEOTileLoaderAdditionalInfo buf = 134217984;
      uint64_t v13 = [v3 count];
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "Location services are now disabled. Deleting %llu tilesets", buf, 0xCu);
    }

    [(GEOTileDB *)self->_tileCache deleteDataForTilesets:v3];
  }
}

+ (void)enableCDSObserversIfNecessary
{
  _cdsObserversEnabled = 1;
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[GEOResourceManifestManager modernManagerForConfiguration:self->super._manifestConfiguration];
  [v4 removeTileGroupObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GEOTileServerLocalProxy;
  [(GEOTileServerProxy *)&v5 dealloc];
}

- (void)runOpportunisticTileDownloader:(id)a3
{
  id v4 = a3;
  objc_super v5 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)GEOTileLoaderAdditionalInfo buf = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Starting proactive downloader", buf, 2u);
  }

  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__GEOTileServerLocalProxy_runOpportunisticTileDownloader___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);
}

uint64_t __58__GEOTileServerLocalProxy_runOpportunisticTileDownloader___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initiateDataSaverPreloadIfPossible:*(void *)(a1 + 40)];
}

- (void)close
{
}

- (void)cancel:(long long *)a3 batchID:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (!v7)
  {
    id v9 = 0;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v8 = v7;
  locuint64_t k = v5;
  id v9 = 0;
  uint64_t v10 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v13 = [v12 interestList];
      int v14 = [v13 containsKey:a3];

      if (v14)
      {
        id v15 = v12;

        id v9 = v15;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v37 count:16];
  }
  while (v8);

  if (v9)
  {
    long long v16 = [v9 interestList];
    [v16 removeKey:a3];

    long long v17 = [v9 tileRequester];

    objc_super v5 = lock;
    if (v17)
    {
      id v6 = [v9 tileRequester];
      uint64_t v18 = [v9 interestList];
      uint64_t v19 = [v9 pendingRequesterList];
      char v20 = [v18 intersectsList:v19];

      if (v20)
      {
        uint64_t v21 = [v9 pendingRequesterList];
        [v21 removeKey:a3];

        long long v36 = *a3;
        id v22 = *(NSObject **)(a1 + 88);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke_2;
        v34[3] = &unk_1E53D7FE8;
        id v23 = &v35;
        id v35 = v6;
        id v24 = v6;
        id v25 = v34;
      }
      else
      {
        [v6 setContext:0];
        [v9 setTileRequester:0];
        [*(id *)(a1 + 72) removeObjectIdenticalTo:v9];
        id v22 = *(NSObject **)(a1 + 88);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke;
        block[3] = &unk_1E53D79D8;
        id v23 = &v29;
        id v29 = v6;
        id v26 = v6;
        id v25 = block;
      }
      dispatch_async(v22, v25);

      goto LABEL_18;
    }
  }
  else
  {
    objc_super v5 = lock;
  }
LABEL_19:
  os_unfair_lock_unlock(v5);
}

uint64_t __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __42__GEOTileServerLocalProxy_cancel_batchID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelKey:a1 + 40];
}

- (void)reprioritizeKey:(long long *)a3 newPriority:(int)a4 batchID:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (os_unfair_lock_s *)(a1 + 80);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = *(id *)(a1 + 72);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  int v21 = a4;
  locuint64_t k = v7;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v8);
      }
      int v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v15 = [v14 interestList];
      int v16 = [v15 containsKey:a3];

      if (v16)
      {
        id v17 = v14;

        uint64_t v11 = v17;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  }
  while (v10);

  if (!v11)
  {
    uint64_t v7 = lock;
    goto LABEL_16;
  }
  uint64_t v18 = [v11 tileRequester];

  uint64_t v7 = lock;
  if (v18)
  {
    uint64_t v19 = [v11 tileRequester];
    long long v30 = *a3;
    char v20 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__GEOTileServerLocalProxy_reprioritizeKey_newPriority_batchID___block_invoke;
    block[3] = &unk_1E53D7EF8;
    id v28 = v19;
    int v29 = v21;
    id v8 = v19;
    dispatch_async(v20, block);

LABEL_14:
  }
LABEL_16:
  os_unfair_lock_unlock(v7);
}

uint64_t __63__GEOTileServerLocalProxy_reprioritizeKey_newPriority_batchID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reprioritizeKey:a1 + 44 newPriority:*(unsigned int *)(a1 + 40)];
}

void __141__GEOTileServerLocalProxy_loadTiles_batchID_priorities_hasAdditionalInfos_additionalInfos_signpostIDs_createTimes_reason_options_auditToken___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:a1[6]];
  [WeakRetained proxy:v2 failedToLoadTiles:v3 error:v4];
}

void __62__GEOTileServerLocalProxy_tileRequester_receivedError_forKey___block_invoke(uint64_t a1)
{
  uint64_t v3 = [[GEOTileKeyList alloc] initWithCapacity:1];
  [(GEOTileKeyList *)v3 addKey:a1 + 48];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) failedToLoadTiles:v3 error:*(void *)(a1 + 40)];
}

void __49__GEOTileServerLocalProxy_tileRequesterFinished___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained proxy:a1[4] failedToLoadTiles:a1[5] error:a1[6]];
}

- (uint64_t)reportCorruptTile:(char *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v5 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = GEOStringFromTileKey(a3);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Deleting corrupt tile %@", (uint8_t *)&v8, 0xCu);
  }
  return [*(id *)(a1 + 48) deleteDataForKey:a3];
}

void __48__GEOTileServerLocalProxy_calculateFreeableSize__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxy:*(void *)(a1 + 32) canShrinkDiskCacheByAmount:a2];
}

- (void)shrinkDiskCacheToSize:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
}

- (unint64_t)shrinkDiskCacheToSizeSync:(unint64_t)a3
{
  return [(GEOTileDB *)self->_tileCache shrinkToSizeSync:a3];
}

- (void)beginPreloadSessionOfSize:(unint64_t)a3
{
}

- (void)endPreloadSession
{
}

- (void)flushPendingWrites
{
}

- (void)enumerateAllKeysIncludingData:(BOOL)a3 onQueue:(id)a4 group:(id)a5 dataHandler:(id)a6
{
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  [(GEOTileServerLocalProxy *)self _updateExpiringTilesets];
  [(GEOTileDB *)self->_tileCache evaluateDevicePostureAgainstCurrentManifest:0];
  if (!v7)
  {
    if (self->_updatingManifestForProactiveTileDownload) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v8 = [v11 tileSets];
  uint64_t v9 = [v7 tileSets];
  if ([v8 isEqualToArray:v9])
  {

    goto LABEL_6;
  }
  BOOL updatingManifestForProactiveTileDownload = self->_updatingManifestForProactiveTileDownload;

  if (!updatingManifestForProactiveTileDownload) {
LABEL_5:
  }
    [(GEOTileServerLocalProxy *)self _initiateDataSaverPreloadIfPossible:0];
LABEL_6:
}

- (void)_didAddSubscription:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:0x1ED5A1BB0];

  if (v5 && ![v5 policy])
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__GEOTileServerLocalProxy__didAddSubscription___block_invoke;
    block[3] = &unk_1E53D79D8;
    void block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __47__GEOTileServerLocalProxy__didAddSubscription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initiateDataSaverPreloadIfPossible:0];
}

- (void)_forceDataSaverPreload:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
  uint64_t v2 = +[GEOResourceManifestManager modernManager];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_2;
  v3[3] = &unk_1E53D9070;
  v3[4] = *(void *)(a1 + 32);
  [v2 updateManifest:0 completionHandler:v3];
}

void __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_3;
  block[3] = &unk_1E53D79D8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __50__GEOTileServerLocalProxy__forceDataSaverPreload___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
  return [*(id *)(a1 + 32) _initiateDataSaverPreloadIfPossible:0];
}

- (void)_initiateDataSaverPreloadIfPossible:(id)a3
{
  id v4 = a3;
  proactiveTileDownloader = self->_proactiveTileDownloader;
  if (!v4)
  {
    [(GEOProactiveTileDownloader *)proactiveTileDownloader cancel];
    id v6 = self->_proactiveTileDownloader;
    self->_proactiveTileDownloader = 0;

    if (_cdsObserversEnabled != 1) {
      goto LABEL_10;
    }
    id v7 = [GEOProactiveTileDownloader alloc];
    workQueue = self->_workQueue;
    tileCache = self->_tileCache;
    providers = self->_providers;
    id v11 = self;
    id v12 = 0;
LABEL_9:
    int v14 = [(GEOProactiveTileDownloader *)v7 initWithDelegate:v11 delegateQueue:workQueue diskCache:tileCache tileRequesterClasses:providers backgroundTask:v12];
    id v15 = self->_proactiveTileDownloader;
    self->_proactiveTileDownloader = v14;

    [(GEOProactiveTileDownloader *)self->_proactiveTileDownloader start];
    goto LABEL_10;
  }
  if (!proactiveTileDownloader)
  {
    uint64_t v13 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_INFO, "No valid tile downloader. Create one and start it.", v16, 2u);
    }

    id v7 = [GEOProactiveTileDownloader alloc];
    workQueue = self->_workQueue;
    tileCache = self->_tileCache;
    providers = self->_providers;
    id v11 = self;
    id v12 = v4;
    goto LABEL_9;
  }
  [(GEOProactiveTileDownloader *)proactiveTileDownloader taskFired:v4];
LABEL_10:
}

- (void)proactiveTileDownloaderDidFinish:(id)a3
{
  id v4 = (GEOProactiveTileDownloader *)a3;
  if (self->_proactiveTileDownloader == v4)
  {
    self->_proactiveTileDownloader = 0;
    objc_super v5 = v4;

    id v4 = v5;
  }
}

- (void)tileDBDidDeleteExternalResource:(id)a3
{
  delegateQueue = self->super._delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GEOTileServerLocalProxy_tileDBDidDeleteExternalResource___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __59__GEOTileServerLocalProxy_tileDBDidDeleteExternalResource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained proxyDidDeleteExternalTileData:*(void *)(a1 + 32)];
}

- (GEOTileDB)tileCache
{
  return self->_tileCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTileDownloader, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inProgress, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_cacheLocation, 0);

  objc_storeStrong((id *)&self->_tileCache, 0);
}

@end