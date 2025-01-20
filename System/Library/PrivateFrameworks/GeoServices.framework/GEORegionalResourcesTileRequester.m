@interface GEORegionalResourcesTileRequester
+ (unsigned)tileProviderIdentifier;
- (GEORegionalResourcesTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (uint64_t)_generateEndSignpostEventIfNecessary:;
- (void)cancel;
- (void)start;
@end

@implementation GEORegionalResourcesTileRequester

uint64_t __42__GEORegionalResourcesTileRequester_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

+ (unsigned)tileProviderIdentifier
{
  return 8;
}

void __74__GEORegionalResourcesTileRequester__generateEndSignpostEventIfNecessary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:a1 + 40];
  v3 = v2;
  if (v2)
  {
    os_signpost_id_t v4 = [v2 unsignedLongLongValue];
    v5 = GEOGetTileLoadingLog();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v6, OS_SIGNPOST_INTERVAL_END, v4, "SubmittedToRequester", "", v7, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:a1 + 40];
  }
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_6(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  os_signpost_id_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  os_signpost_id_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)start
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  uint64_t v51 = 0;
  uint64_t v3 = [(GEOTileRequester *)self tileRequest];
  os_signpost_id_t v4 = [v3 keyList];
  uint64_t v5 = [v4 count];

  uint64_t v51 = v5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v6 = [(GEOTileRequest *)self->super._tileRequest keyList];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v47;
    obuint64_t j = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__83;
        v44 = __Block_byref_object_dispose__83;
        id v45 = 0;
        uint64_t v33 = MEMORY[0x1E4F143A8];
        uint64_t v34 = 3221225472;
        v35 = __42__GEORegionalResourcesTileRequester_start__block_invoke;
        v36 = &unk_1E53D8CB0;
        v37 = self;
        v38 = &v40;
        uint64_t v39 = v10;
        geo_isolate_sync_data();
        v11 = (void *)v41[5];
        if (v11)
        {
          os_signpost_id_t v12 = [v11 unsignedLongLongValue];
          v13 = GEOGetTileLoadingLog();
          v14 = v13;
          if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_188D96000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SubmittedToRequester", "Type=RegionalResource", buf, 2u);
          }
        }
        _Block_object_dispose(&v40, 8);
      }
      v6 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = [(GEOTileRequester *)self tileRequest];
  id v25 = [v15 keyList];

  uint64_t v16 = [v25 countByEnumeratingWithState:&v29 objects:v57 count:16];
  if (v16)
  {
    id obja = *(id *)v30;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(id *)v30 != obja) {
          objc_enumerationMutation(v25);
        }
        v18 = *(_OWORD **)(*((void *)&v29 + 1) + 8 * j);
        *(_OWORD *)buf = *v18;
        uint64_t v40 = 0;
        v41 = &v40;
        uint64_t v42 = 0x3032000000;
        v43 = __Block_byref_object_copy__83;
        v44 = __Block_byref_object_dispose__83;
        id v45 = 0;
        geo_isolate_sync_data();
        v19 = (void *)v41[5];
        if (v19) {
          uint64_t v20 = [v19 unsignedLongLongValue];
        }
        else {
          uint64_t v20 = 0;
        }
        v28 = objc_alloc_init(_GEORegionalResourcesTileLoader);
        geo_isolate_sync();
        v21 = [(GEOTileRequester *)self tileRequest];
        v22 = [v21 manifestConfiguration];
        v23 = [(GEOTileRequester *)self tileRequest];
        v24 = [v23 auditToken];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_3;
        v54[3] = &unk_1E53EC8B8;
        long long v55 = *(_OWORD *)buf;
        v54[4] = self;
        v54[5] = v50;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_5;
        v52[3] = &unk_1E53EC8E0;
        long long v53 = *(_OWORD *)buf;
        v52[4] = self;
        v52[5] = v50;
        [(_GEORegionalResourcesTileLoader *)v28 loadResourcesForTileKey:v18 manifestConfiguration:v22 auditToken:v24 signpostID:v20 finished:v54 error:v52];

        _Block_object_dispose(&v40, 8);
      }
      uint64_t v16 = [v25 countByEnumeratingWithState:&v29 objects:v57 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(v50, 8);
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_4(uint64_t a1)
{
  --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v2 = [*(id *)(a1 + 32) resourceManifestManager];
  uint64_t v3 = [v2 activeTileGroup];
  uint64_t v4 = [v3 identifier];

  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  unsigned int v8 = [v6 tileSetForKey:a1 + 56];
  v9 = [*(id *)(a1 + 32) activeTileSetForKey:a1 + 56];
  objc_msgSend(v5, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", v6, v7, v4, v8, v9, 0, *(void *)(a1 + 56), *(void *)(a1 + 64), 0);

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v10 = [*(id *)(a1 + 32) delegate];
    [v10 tileRequesterFinished:*(void *)(a1 + 32)];
  }
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [GEOTileData alloc];
  uint64_t v5 = [v3 data];

  v6 = [(GEOTileData *)v4 initWithData:v5];
  objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned int v8 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_4;
  v11[3] = &unk_1E53EC890;
  uint64_t v9 = *(void *)(a1 + 40);
  os_signpost_id_t v12 = v6;
  uint64_t v13 = v9;
  v11[4] = v7;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (uint64_t)_generateEndSignpostEventIfNecessary:
{
  return geo_isolate_sync_data();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostIDsIsolater, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_loadersIsolater, 0);

  objc_storeStrong((id *)&self->_loaders, 0);
}

- (GEORegionalResourcesTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEORegionalResourcesTileRequester;
  uint64_t v9 = [(GEOTileRequester *)&v19 initWithTileRequest:v8 delegateQueue:a4 delegate:a5];
  if (v9)
  {
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    loaders = v9->_loaders;
    v9->_loaders = v10;

    uint64_t v12 = geo_isolater_create();
    loadersIsolater = v9->_loadersIsolater;
    v9->_loadersIsolater = (geo_isolater *)v12;

    uint64_t v14 = [v8 signpostIDs];
    signpostIDs = v9->_signpostIDs;
    v9->_signpostIDs = (GEOTileKeyMap *)v14;

    uint64_t v16 = geo_isolater_create();
    signpostIDsIsolater = v9->_signpostIDsIsolater;
    v9->_signpostIDsIsolater = (geo_isolater *)v16;
  }
  return v9;
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_6;
  v8[3] = &unk_1E53EC890;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v6;
  v8[4] = v4;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_6(uint64_t a1)
{
  --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "tileRequester:receivedError:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64));

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 tileRequesterFinished:*(void *)(a1 + 32)];
  }
}

- (void)cancel
{
}

uint64_t __43__GEORegionalResourcesTileRequester_cancel__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "cancel", (void)v10);
        id v8 = (void *)[v7 tileKeyPtr];
        objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *v8, v8[1]);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

@end