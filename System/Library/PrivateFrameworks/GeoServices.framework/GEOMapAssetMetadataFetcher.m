@interface GEOMapAssetMetadataFetcher
- (GEOMapAssetMetadataFetcher)init;
- (GEOMapAssetMetadataFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 enableASTCTextures:(BOOL)a5;
- (void)fetchAssetMetadataForMetadataKeys:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOMapAssetMetadataFetcher

- (GEOMapAssetMetadataFetcher)init
{
  result = (GEOMapAssetMetadataFetcher *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapAssetMetadataFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 enableASTCTextures:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapAssetMetadataFetcher;
  v10 = [(GEOMapAssetMetadataFetcher *)&v17 init];
  if (v10)
  {
    if (v8)
    {
      v11 = (GEOTileLoader *)v8;
    }
    else
    {
      v11 = +[GEOTileLoader modernLoader];
    }
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v11;

    objc_storeStrong((id *)&v10->_auditToken, a4);
    v10->_enableASTCTextures = a5;
    uint64_t v13 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)fetchAssetMetadataForMetadataKeys:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  queue = a4;
  id v9 = a5;
  v22 = v8;
  v23 = v9;
  if ([v8 count])
  {
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__94;
    v58 = __Block_byref_object_dispose__94;
    id v59 = 0;
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_14;
    v50 = &unk_1E53D8288;
    v51 = self;
    id v10 = v8;
    id v52 = v10;
    v53 = &v54;
    geo_isolate_sync_data();
    if (v55[5])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E53EDAB8;
      id v45 = v9;
      v46 = &v54;
      dispatch_async(queue, block);
      v11 = v45;
    }
    else
    {
      v12 = [MEMORY[0x1E4F29128] UUID];
      v11 = GEOTileLoaderClientIdentifier(v12);

      uint64_t v13 = dispatch_group_create();
      v25 = v11;
      v26 = [[GEOTileKeyMap alloc] initWithMapType:0];
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x3032000000;
      v42[3] = __Block_byref_object_copy__94;
      v42[4] = __Block_byref_object_dispose__94;
      id v43 = 0;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v10;
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v62 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            dispatch_group_enter(v13);
            auditToken = self->_auditToken;
            tileLoader = self->_tileLoader;
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_3;
            v34[3] = &unk_1E53EDAE0;
            v37 = v42;
            v35 = v26;
            v36 = v13;
            v20 = tileLoader;
            v11 = v25;
            [(GEOTileLoader *)v20 loadKey:v17 priority:2147483646 forClient:v25 options:3 reason:4 auditToken:auditToken callbackQ:queue beginNetwork:0 callback:v34];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v62 count:16];
        }
        while (v14);
      }

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_4;
      v28[3] = &unk_1E53EDB08;
      v33 = v42;
      id v32 = v23;
      v29 = v26;
      id v30 = obj;
      v31 = self;
      v21 = v26;
      dispatch_group_notify(v13, queue, v28);

      _Block_object_dispose(v42, 8);
    }

    _Block_object_dispose(&v54, 8);
  }
  else
  {
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke;
    v60[3] = &unk_1E53DDD88;
    id v61 = v9;
    dispatch_async(queue, v60);
  }
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = objc_alloc_init(GEOMapAssetMetadata);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_14(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (*(void *)(v1 + 48))
  {
    v3 = (void *)a1[5];
    id v4 = *(id *)(v1 + 40);
    id v5 = v3;
    uint64_t v6 = [v4 count];
    if (v6 == [v5 count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        while (2)
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            if ((objc_msgSend(v5, "containsKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10), (void)v11) & 1) == 0)
            {

              return;
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 48));
    }
    else
    {
    }
  }
}

uint64_t __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v17 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v12 + 40);
    long long v13 = (id *)(v12 + 40);
    long long v14 = v15;
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = v10;
    }
    objc_storeStrong(v13, v16);
  }
  else if (v17)
  {
    [*(id *)(a1 + 32) setObject:v17 forKey:a2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    if (v3 == [*(id *)(a1 + 40) count])
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v5 = (GEOMapAssetMetadata *)*(id *)(a1 + 40);
      uint64_t v6 = [(GEOMapAssetMetadata *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v25;
        id obj = v5;
LABEL_8:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * v8);
          id v10 = [*(id *)(a1 + 32) objectForKey:v9];
          id v11 = v10;
          if (!v10)
          {
            uint64_t v17 = *(void *)(a1 + 56);
            v18 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Unexpectedly-missing tile"];
            (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

            goto LABEL_25;
          }
          uint64_t v12 = [v10 decodedRepresentation];
          if (!v12)
          {
            id v23 = 0;
            long long v13 = [v11 readDataWithError:&v23];
            id v14 = v23;
            if (!v13)
            {
              (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_24:

              goto LABEL_25;
            }
            uint64_t v12 = [[GEOVectorTile alloc] initWithVMP4:v13 localizationData:0 tileKey:v9];

            if (!v12)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              id v14 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Missing metadata tile"];
              (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v14);
              goto LABEL_24;
            }
          }
          [v4 addObject:v12];

          if (v6 == ++v8)
          {
            id v5 = obj;
            uint64_t v6 = [(GEOMapAssetMetadata *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v6) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      uint64_t v15 = [[GEOMapAssetMetadata alloc] initWithVectorTiles:v4 enableASTCTextures:*(unsigned __int8 *)(*(void *)(a1 + 48) + 24)];
      id v22 = *(id *)(a1 + 40);
      id obj = v15;
      geo_isolate_sync_data();
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_25:
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 56);
      id obja = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Unexpected number of tiles"];
      (*(void (**)(uint64_t, void))(v16 + 16))(v16, 0);
    }
  }
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 48);

  objc_storeStrong(v3, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoadedMetadata, 0);
  objc_storeStrong((id *)&self->_lastLoadedKeys, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end