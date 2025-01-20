@interface GEOAbstractOfflineTileRequester
+ (BOOL)requiresNetwork;
- (GEOAbstractOfflineTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (uint64_t)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(uint64_t)a3 onlineTileKey:(uint64_t)a4 completionHandler:(uint64_t)a5;
- (uint64_t)_offlineDataKeyForTileKey:localeKey:;
- (uint64_t)cancelKey:;
- (void)_finished;
- (void)_loadTiles;
- (void)_offlineTileComplete:(char *)a3 onlineKey:(uint64_t)a4 tile:(void *)a5 info:(void *)a6 error:(void *)a7;
- (void)cancel;
- (void)start;
@end

@implementation GEOAbstractOfflineTileRequester

+ (BOOL)requiresNetwork
{
  return 0;
}

- (GEOAbstractOfflineTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOAbstractOfflineTileRequester;
  v9 = [(GEOTileRequester *)&v21 initWithTileRequest:v8 delegateQueue:a4 delegate:a5];
  if (v9)
  {
    v9->_qos = qos_class_self();
    dispatch_group_t v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    atomic_store(0, (unsigned __int8 *)&v9->_canceled);
    uint64_t v12 = geo_isolater_create();
    keyListIsolater = v9->_keyListIsolater;
    v9->_keyListIsolater = (geo_isolater *)v12;

    v14 = [v8 keyList];
    uint64_t v15 = [v14 copy];
    keyList = v9->_keyList;
    v9->_keyList = (GEOTileKeyList *)v15;

    v9->_keyListIndex = 0;
    v9->_finished.lock._os_unfair_lock_opaque = 0;
    v9->_finished.didRun = 0;
    uint64_t v17 = [v8 auditToken];
    auditToken = v9->_auditToken;
    v9->_auditToken = (GEOApplicationAuditToken *)v17;

    v19 = v9;
  }

  return v9;
}

- (void)start
{
  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__GEOAbstractOfflineTileRequester_start__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __40__GEOAbstractOfflineTileRequester_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadTiles];
}

- (uint64_t)_offlineDataKeyForTileKey:localeKey:
{
  return 0;
}

- (uint64_t)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(uint64_t)a3 onlineTileKey:(uint64_t)a4 completionHandler:(uint64_t)a5
{
  return (*(uint64_t (**)(uint64_t, void))(a5 + 16))(a5, 0);
}

- (void)_loadTiles
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v28 = +[GEOOfflineDataAccess sharedInstance];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) == 0)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    long long v27 = 0x8410203uLL;
    while (1)
    {
      uint64_t v49 = 0;
      v50 = (char *)&v49;
      uint64_t v51 = 0x3010000000;
      v52 = "";
      long long v53 = xmmword_18A628440;
      uint64_t v32 = v29;
      uint64_t v33 = 3221225472;
      v34 = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke;
      v35 = &unk_1E53D7C00;
      v36 = self;
      v37 = &v49;
      geo_isolate_sync_data();
      if ((v50[32] & 0x7F) == 1) {
        break;
      }
      v4 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        unint64_t keyListIndex = self->_keyListIndex;
        v6 = GEOStringFromTileKey(v50 + 32);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = keyListIndex;
        *(_WORD *)&v47[4] = 2112;
        *(void *)&v47[6] = v6;
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[Offline] Loading tile %d %@", buf, 0x12u);
      }
      dispatch_group_enter((dispatch_group_t)self->_group);
      uint64_t v7 = *((void *)v50 + 5);
      uint64_t v8 = -97;
      if ((v50[32] & 0x60) == 0) {
        uint64_t v8 = -1;
      }
      *(void *)&long long v48 = v8 & *((void *)v50 + 4);
      *((void *)&v48 + 1) = v7;
      v9 = -[GEOTileRequester activeTileSetForKey:](self, "activeTileSetForKey:", &v48, v27);
      dispatch_group_t v10 = [v9 disputedBordersOfflineKeySuffixForCountry:self->super._deviceCountry region:self->super._deviceRegion];
      v11 = [(GEOAbstractOfflineTileRequester *)self _offlineDataKeyForTileKey:&v48 localeKey:v10];
      unsigned int v31 = 0;
      int v12 = GEOTileKeyStyle((uint64_t)&v48, &v31);
      uint64_t v13 = v31;
      v14 = +[GEORequestCounter sharedCounter];
      uint64_t v15 = v14;
      if (v12) {
        uint64_t v16 = (v13 << 32) | 0x100;
      }
      else {
        uint64_t v16 = 256;
      }
      uint64_t v17 = [v14 requestCounterTicketForType:v16 auditToken:self->_auditToken traits:0];

      [v17 startingRequestWithExplicitInterfaces:256];
      if ([v10 length])
      {
        v18 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = GEOStringFromTileKey(v50 + 32);
          *(_DWORD *)buf = v27;
          *(void *)v47 = v10;
          *(_WORD *)&v47[8] = 2112;
          *(void *)&v47[10] = v19;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "[Offline] Checking for locale-specific (%{private}@) variant: %@", buf, 0x16u);
        }
      }
      if (v11)
      {
        delegateQueue = self->super._delegateQueue;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_5;
        v38[3] = &unk_1E53EC958;
        id v21 = v10;
        v44 = &v49;
        id v39 = v21;
        v40 = self;
        long long v45 = v48;
        id v41 = v17;
        id v22 = v11;
        id v42 = v22;
        id v43 = v28;
        [v43 getDataForKey:v22 callbackQueue:delegateQueue callback:v38];

        v23 = v39;
      }
      else
      {
        v23 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Unexpected tile key"];
        [v17 explicitInterfaceRequestCompleted:v23 xmitBytes:0 recvBytes:0];
        [(GEOAbstractOfflineTileRequester *)self _offlineTileComplete:v50 + 32 onlineKey:&v48 tile:0 info:0 error:v23];
        dispatch_group_leave((dispatch_group_t)self->_group);
      }

      _Block_object_dispose(&v49, 8);
      unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_canceled);
      if (v24) {
        goto LABEL_21;
      }
    }
    _Block_object_dispose(&v49, 8);
  }
LABEL_21:
  group = self->_group;
  v26 = self->super._delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_4;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_group_notify(group, v26, block);
}

__n128 __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 88);
  if (v3 < [*(id *)(v2 + 80) count])
  {
    v5 = (__n128 *)[*(id *)(*(void *)(a1 + 32) + 80) keyAtIndex:*(void *)(*(void *)(a1 + 32) + 88)];
    __n128 result = *v5;
    *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v5;
    ++*(void *)(*(void *)(a1 + 32) + 88);
  }
  return result;
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 56) serviceKey];
    objc_msgSend(v7, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", 0, objc_msgSend(v8, "length"), objc_msgSend(v5, "length"));

    v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8) + 32;
    v34[0] = @"TileIsCacheable";
    v34[1] = @"GEOTileLoadResultSource";
    v35[0] = MEMORY[0x1E4F1CC28];
    v35[1] = &unk_1ED73E218;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v9 _offlineTileComplete:v10 onlineKey:a1 + 80 tile:v5 info:v11 error:v6];

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 96));
  }
  else if ([*(id *)(a1 + 32) length])
  {
    int v12 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = GEOStringFromTileKey((char *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
      *(_DWORD *)buf = 138412290;
      v47 = v13;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "[Offline] No locale-specific variant found for tile. Fetching base data: %@", buf, 0xCu);
    }
    v14 = [*(id *)(a1 + 40) _offlineDataKeyForTileKey:a1 + 80 localeKey:0];
    if (v14)
    {
      uint64_t v15 = *(void **)(a1 + 64);
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 24);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_8;
      v36[3] = &unk_1E53EC958;
      id v37 = *(id *)(a1 + 48);
      id v38 = v14;
      id v39 = *(id *)(a1 + 56);
      id v40 = 0;
      uint64_t v17 = *(void *)(a1 + 72);
      uint64_t v41 = *(void *)(a1 + 40);
      uint64_t v42 = v17;
      long long v43 = *(_OWORD *)(a1 + 80);
      [v15 getDataForKey:v38 callbackQueue:v16 callback:v36];

      v18 = v37;
    }
    else
    {
      v18 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Unexpected tile key"];
      v23 = *(void **)(a1 + 48);
      unsigned __int8 v24 = [*(id *)(a1 + 56) serviceKey];
      objc_msgSend(v23, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v18, objc_msgSend(v24, "length"), 0);

      v25 = *(void **)(a1 + 40);
      uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8) + 32;
      v44[0] = @"TileIsCacheable";
      v44[1] = @"GEOTileLoadResultSource";
      v45[0] = MEMORY[0x1E4F1CC28];
      v45[1] = &unk_1ED73E218;
      long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
      [v25 _offlineTileComplete:v26 onlineKey:a1 + 80 tile:0 info:v27 error:v18];

      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 96));
    }
  }
  else
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8) + 32;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_3;
    v28[3] = &unk_1E53EC930;
    v20 = *(void **)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 40);
    id v30 = v21;
    uint64_t v31 = v22;
    uint64_t v32 = *(void *)(a1 + 72);
    long long v33 = *(_OWORD *)(a1 + 80);
    [v20 _fetchEmptyFallbackIfPossibleForOfflineTileKey:v19 onlineTileKey:a1 + 80 completionHandler:v28];
  }
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) serviceKey];
    uint64_t v9 = [v8 length];
    uint64_t v10 = [*(id *)(a1 + 48) serviceKey];
    objc_msgSend(v7, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", 0, objc_msgSend(v10, "length") + v9, objc_msgSend(*(id *)(a1 + 56), "length") + objc_msgSend(v5, "length"));

    v11 = *(void **)(a1 + 64);
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8) + 32;
    v22[0] = @"TileIsCacheable";
    v22[1] = @"GEOTileLoadResultSource";
    v23[0] = MEMORY[0x1E4F1CC28];
    v23[1] = &unk_1ED73E218;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v11 _offlineTileComplete:v12 onlineKey:a1 + 80 tile:v5 info:v13 error:v6];

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 64) + 96));
  }
  else
  {
    v14 = *(void **)(a1 + 64);
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8) + 32;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_2;
    v17[3] = &unk_1E53EC930;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    long long v16 = *(_OWORD *)(a1 + 80);
    long long v20 = *(_OWORD *)(a1 + 64);
    long long v21 = v16;
    [v14 _fetchEmptyFallbackIfPossibleForOfflineTileKey:v15 onlineTileKey:a1 + 80 completionHandler:v17];
  }
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_2(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) serviceKey];
  objc_msgSend(v5, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v4, objc_msgSend(v6, "length"), objc_msgSend(v3, "length"));

  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 32;
  v10[0] = @"TileIsCacheable";
  v10[1] = @"GEOTileLoadResultSource";
  v11[0] = MEMORY[0x1E4F1CC28];
  v11[1] = &unk_1ED73E218;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v7 _offlineTileComplete:v8 onlineKey:a1 + 64 tile:v3 info:v9 error:v4];

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 96));
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_3(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8];
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) serviceKey];
  objc_msgSend(v5, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v4, objc_msgSend(v6, "length"), objc_msgSend(v3, "length"));

  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8) + 32;
  v10[0] = @"TileIsCacheable";
  v10[1] = @"GEOTileLoadResultSource";
  v11[0] = MEMORY[0x1E4F1CC28];
  v11[1] = &unk_1ED73E218;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v7 _offlineTileComplete:v8 onlineKey:a1 + 64 tile:v3 info:v9 error:v4];

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 96));
}

uint64_t __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finished];
}

- (void)_offlineTileComplete:(char *)a3 onlineKey:(uint64_t)a4 tile:(void *)a5 info:(void *)a6 error:(void *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  dispatch_assert_queue_V2(a1[3]);
  uint64_t v15 = GEOGetTileLoadingLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v16)
    {
      uint64_t v17 = GEOStringFromTileKey(a3);
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v24 = v17;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "[Offline] Failed to load tile %@: %@", buf, 0x16u);
    }
    id v18 = [(dispatch_queue_t *)a1 delegate];
    objc_msgSend(v18, "tileRequester:receivedError:forKey:", a1, v14, *(void *)a3, *((void *)a3 + 1));
  }
  else
  {
    if (v16)
    {
      id v19 = GEOStringFromTileKey(a3);
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v24 = v19;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "[Offline] Successfully loaded tile %@", buf, 0xCu);
    }
    long long v20 = [v13 objectForKeyedSubscript:@"tileEdition"];
    uint64_t v21 = [v20 unsignedIntValue];

    LODWORD(v20) = [(dispatch_queue_t *)a1 tileSetForKey:a4];
    id v18 = [(dispatch_queue_t *)a1 activeTileSetForKey:a4];
    uint64_t v22 = [(dispatch_queue_t *)a1 delegate];
    objc_msgSend(v22, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", a1, v12, v21, v20, v18, 0, *(void *)a3, *((void *)a3 + 1), v13);
  }
}

- (void)_finished
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._delegateQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__GEOAbstractOfflineTileRequester__finished__block_invoke;
  v3[3] = &unk_1E53D79D8;
  v3[4] = self;
  GEOOnce((uint64_t)&self->_finished, v3);
}

void __44__GEOAbstractOfflineTileRequester__finished__block_invoke(uint64_t a1)
{
  uint64_t v2 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "[Offline] Finished loading all tiles", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 tileRequesterFinished:*(void *)(a1 + 32)];
}

- (void)cancel
{
}

- (uint64_t)cancelKey:
{
  return geo_isolate_sync_data();
}

unint64_t __45__GEOAbstractOfflineTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 88);
  unint64_t result = [*(id *)(v2 + 80) count];
  if (v3 < result)
  {
    *(void *)&long long v5 = 138412546;
    long long v11 = v5;
    do
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "keyAtIndex:", v3, v11);
      if (*v6 == *v7 && v6[1] == v7[1])
      {
        uint64_t v9 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = GEOStringFromTileKey(*(char **)(a1 + 40));
          *(_DWORD *)buf = v11;
          id v13 = v10;
          __int16 v14 = 1024;
          int v15 = v3;
          _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "[Offline] Canceling tile %@ at index %d", buf, 0x12u);
        }
        [*(id *)(*(void *)(a1 + 32) + 80) removeKey:*(void *)(a1 + 40)];
      }
      else
      {
        ++v3;
      }
      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
    }
    while (v3 < result);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_keyList, 0);

  objc_storeStrong((id *)&self->_keyListIsolater, 0);
}

@end