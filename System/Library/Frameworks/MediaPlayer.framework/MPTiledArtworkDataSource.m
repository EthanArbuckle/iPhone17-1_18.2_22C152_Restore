@interface MPTiledArtworkDataSource
+ (CGSize)_tileSizeForFittingSize:(CGSize)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 spacing:(double)a6;
+ (id)_errorWithDescription:(id)a3;
+ (id)_loadingRequestForArtworkCatalog:(id)a3;
+ (id)_representationCacheKeyForArtworkCatalog:(id)a3 forAnyRevision:(BOOL)a4;
+ (id)sharedDataSource;
- (BOOL)_hasLoadingRequestForArtworkCatalog:(id)a3;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (MPTiledArtworkDataSource)init;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)_addLoadingRequestForArtworkCatalog:(id)a3;
- (void)_performAsyncBlock:(id)a3;
- (void)_performSyncBlock:(id)a3;
- (void)_removeLoadingRequestForArtworkCatalog:(id)a3;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPTiledArtworkDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilingArtworkCatalogOperationQueue, 0);
  objc_storeStrong((id *)&self->_tiledArtworkRepresentationFallbackCache, 0);
  objc_storeStrong((id *)&self->_renderingTiledArtworkRequestsQueue, 0);
  objc_storeStrong((id *)&self->_loadingTiledArtworkRequestsAccessQueue, 0);

  objc_storeStrong((id *)&self->_loadingTiledArtworkRequests, 0);
}

- (void)_removeLoadingRequestForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _loadingRequestForArtworkCatalog:v4];

  [(NSCountedSet *)self->_loadingTiledArtworkRequests removeObject:v5];
}

- (void)_performSyncBlock:(id)a3
{
  block = (void (**)(void))a3;
  if (dispatch_get_specific((const void *)_MPTiledArtworkDataSourceQueueSpecificIsAccessQueue))
  {
    if (block) {
      block[2]();
    }
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_loadingTiledArtworkRequestsAccessQueue, block);
  }
}

- (void)_performAsyncBlock:(id)a3
{
}

- (BOOL)_hasLoadingRequestForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _loadingRequestForArtworkCatalog:v4];

  LOBYTE(self) = [(NSCountedSet *)self->_loadingTiledArtworkRequests containsObject:v5];
  return (char)self;
}

- (void)_addLoadingRequestForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _loadingRequestForArtworkCatalog:v4];

  [(NSCountedSet *)self->_loadingTiledArtworkRequests addObject:v5];
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (a3 == 1)
  {
    v17 = [v12 token];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
    v30[3] = &unk_1E57F9F98;
    v30[4] = self;
    id v18 = v12;
    id v31 = v18;
    [(MPTiledArtworkDataSource *)self _performSyncBlock:v30];
    tilingArtworkCatalogOperationQueue = self->_tilingArtworkCatalogOperationQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_1E57EE390;
    v23[4] = self;
    id v24 = v18;
    id v25 = v17;
    uint64_t v29 = 1;
    id v26 = v13;
    id v27 = v14;
    id v28 = v16;
    id v20 = v17;
    [(NSOperationQueue *)tilingArtworkCatalogOperationQueue addOperationWithBlock:v23];
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_5;
    v21[3] = &unk_1E57F0040;
    id v22 = v15;
    (*((void (**)(id, void *))v14 + 2))(v14, v21);
    id v20 = v22;
  }
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLoadingRequestForArtworkCatalog:*(void *)(a1 + 40)];
}

void __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_1E57F9F48;
  v9[4] = v2;
  id v10 = *(id *)(a1 + 40);
  v11 = &v12;
  [v2 _performSyncBlock:v9];
  if (!*((unsigned char *)v13 + 24))
  {
    v3 = [*(id *)(a1 + 48) artworkCatalogsWithCount:1];
    id v4 = [v3 firstObject];

    id v5 = [v4 dataSource];
    if (objc_opt_respondsToSelector())
    {
      [v5 loadArtworkEffectResultForEffectType:*(void *)(a1 + 80) catalog:v4 options:*(void *)(a1 + 56) systemEffectHandler:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_4;
      v7[3] = &unk_1E57F0040;
      uint64_t v6 = *(void *)(a1 + 64);
      id v8 = *(id *)(a1 + 72);
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hasLoadingRequestForArtworkCatalog:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result ^ 1;
  if (((result ^ 1) & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _removeLoadingRequestForArtworkCatalog:v4];
  }
  return result;
}

uint64_t __119__MPTiledArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7 = a5;
  if (a3 == 1)
  {
    id v8 = [a4 token];
    if ([v8 hasExistingArtworkCatalogsWithCount:1])
    {
      v9 = [v8 existingArtworkCatalogsWithCount:1];
      id v10 = [v9 firstObject];

      v11 = [v10 dataSource];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [v11 existingArtworkEffectResultForEffectType:1 catalog:v10 options:v7];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = [a3 token];
  uint64_t v4 = [MPTiledArtworkRepresentationCacheKey alloc];
  id v5 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:](v4, "initWithTiledArtworkRequest:scaledFittingSize:", v3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v5;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 token];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v40 = [v8 numberOfRows];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v36 = [v8 numberOfColumns];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = v34[3] * v38[3];
  v9 = [v8 revisionIdentifier];
  [v8 tileSpacing];
  uint64_t v11 = v10;
  if (!v30[3]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Tiled artwork count cannot be 0."];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v27[3] = &unk_1E57F9F98;
  v27[4] = self;
  id v12 = v6;
  id v28 = v12;
  [(MPTiledArtworkDataSource *)self _performSyncBlock:v27];
  tilingArtworkCatalogOperationQueue = self->_tilingArtworkCatalogOperationQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  v18[3] = &unk_1E57EE368;
  v18[4] = self;
  id v14 = v12;
  id v19 = v14;
  id v15 = v7;
  id v22 = v15;
  id v16 = v8;
  id v20 = v16;
  v23 = &v29;
  id v24 = &v37;
  id v25 = &v33;
  id v17 = v9;
  id v21 = v17;
  uint64_t v26 = v11;
  [(NSOperationQueue *)tilingArtworkCatalogOperationQueue addOperationWithBlock:v18];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLoadingRequestForArtworkCatalog:*(void *)(a1 + 40)];
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  v2 = *(void **)(a1 + 32);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3;
  v92[3] = &unk_1E57F9F48;
  v92[4] = v2;
  id v93 = *(id *)(a1 + 40);
  v94 = &v95;
  [v2 _performSyncBlock:v92];
  if (!*((unsigned char *)v96 + 24))
  {
    v3 = [*(id *)(a1 + 48) artworkCatalogsWithCount:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    unint64_t v4 = [v3 count];
    if (v4 < *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      if (!v4)
      {
        id v15 = [(id)objc_opt_class() _errorWithDescription:@"No artwork catalogs were found"];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_39:

        goto LABEL_40;
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    id v5 = [*(id *)(a1 + 40) cache];
    id v6 = v5;
    if (!v5) {
      id v6 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    id v61 = v6;

    uint64_t v7 = [(id)objc_opt_class() _representationCacheKeyForArtworkCatalog:*(void *)(a1 + 40) forAnyRevision:1];
    v60 = (void *)v7;
    if (v7)
    {
      id v8 = [v61 objectForKey:v7];
      id v9 = [v8 representationToken];
      id v10 = [v9 tileArtworkVisualIdenticalityIdentifiers];
      if (v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v12 = 0;
          while (1)
          {
            id v13 = [v3 objectAtIndex:v12];
            objc_msgSend(v13, "setRenderHint:", objc_msgSend(*(id *)(a1 + 40), "renderHint"));
            id v14 = [v13 visualIdenticalityIdentifier];
            if (!v14) {
              break;
            }
            [v11 addObject:v14];

            if ((unint64_t)++v12 >= *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
              goto LABEL_17;
            }
          }

          id v11 = 0;
        }
LABEL_17:
        if ([v11 isEqualToArray:v10])
        {
          id v16 = [*(id *)(a1 + 40) visualIdenticalityIdentifier];
          [v8 representationSize];
          double v18 = v17;
          double v20 = v19;
          id v21 = [v8 image];
          id v22 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v16, v21, v18, v20);

          id v15 = v61;
          v23 = objc_alloc_init(MPTiledArtworkRepresentationToken);
          [(MPTiledArtworkRepresentationToken *)v23 setTileArtworkVisualIdenticalityIdentifiers:v10];
          [(MPTiledArtworkRepresentationToken *)v23 setRevisionIdentifier:*(void *)(a1 + 56)];
          [v22 setRepresentationToken:v23];
          id v24 = [(id)objc_opt_class() _representationCacheKeyForArtworkCatalog:*(void *)(a1 + 40) forAnyRevision:0];
          if (v24) {
            [v61 setObject:v22 forKey:v24];
          }
          [v61 setObject:v22 forKey:v60];
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

          id v25 = v60;
LABEL_38:

          goto LABEL_39;
        }
      }
    }
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    id v28 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.loadingTileDataAccessQueue", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4;
    block[3] = &unk_1E57F9F48;
    uint64_t v91 = *(void *)(a1 + 72);
    id v29 = v26;
    id v89 = v29;
    id v30 = v27;
    id v90 = v30;
    dispatch_sync(v28, block);
    uint64_t v31 = dispatch_group_create();
    [*(id *)(a1 + 40) destinationScale];
    if (v32 <= 0.00000011920929) {
      double v33 = 1.0;
    }
    else {
      double v33 = v32;
    }
    [*(id *)(a1 + 40) scaledFittingSize];
    double v35 = v34;
    double v37 = v36;
    MSVGetMaximumScreenSize();
    if (v38 < v39) {
      double v38 = v39;
    }
    double v40 = (double)(unint64_t)(uint64_t)v38;
    if (v35 >= v40) {
      double v41 = v40;
    }
    else {
      double v41 = v35;
    }
    if (v37 >= v40) {
      double v42 = v40;
    }
    else {
      double v42 = v37;
    }
    double v43 = v41 / v33;
    double v44 = v42 / v33;
    objc_msgSend((id)objc_opt_class(), "_tileSizeForFittingSize:rows:columns:spacing:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), v41 / v33, v42 / v33, *(double *)(a1 + 96));
    double v47 = v45;
    double v48 = v46;
    double v58 = v42;
    double v59 = v41;
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v49 = 0;
      double v50 = ceil(v45 * 1.77777778);
      double v51 = ceil(v46 * 1.77777778);
      do
      {
        dispatch_group_enter(v31);
        v52 = [v3 objectAtIndexedSubscript:v49];
        objc_msgSend(v52, "setRenderHint:", objc_msgSend(*(id *)(a1 + 40), "renderHint"));
        objc_msgSend(v52, "setFittingSize:", v50, v51);
        [v52 setDestinationScale:v33];
        objc_initWeak(&location, v52);
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_5;
        v81[3] = &unk_1E57EE2C8;
        objc_copyWeak(v86, &location);
        v82 = v28;
        id v83 = v29;
        v86[1] = v49;
        id v84 = v30;
        v85 = v31;
        [v52 requestImageWithCompletion:v81];

        objc_destroyWeak(v86);
        objc_destroyWeak(&location);

        ++v49;
      }
      while ((unint64_t)v49 < *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    }
    uint64_t v53 = *(void *)(a1 + 32);
    v54 = *(NSObject **)(v53 + 24);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_7;
    v62[3] = &unk_1E57EE340;
    v63 = v28;
    id v64 = v29;
    id v65 = v30;
    uint64_t v66 = v53;
    id v55 = *(id *)(a1 + 64);
    double v73 = v33;
    double v74 = v43;
    uint64_t v56 = *(void *)(a1 + 72);
    id v71 = v55;
    uint64_t v72 = v56;
    double v75 = v44;
    double v76 = v47;
    uint64_t v57 = *(void *)(a1 + 96);
    double v77 = v48;
    uint64_t v78 = v57;
    id v67 = *(id *)(a1 + 40);
    double v79 = v59;
    double v80 = v58;
    id v68 = *(id *)(a1 + 56);
    id v15 = v61;
    id v69 = v61;
    id v25 = v60;
    id v70 = v60;
    id v10 = v30;
    id v9 = v29;
    id v8 = v28;
    dispatch_group_notify(v31, v54, v62);

    id v11 = v89;
    goto LABEL_38;
  }
  v3 = [(id)objc_opt_class() _errorWithDescription:@"Tiling artwork request was cancelled"];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_40:

  _Block_object_dispose(&v95, 8);
}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hasLoadingRequestForArtworkCatalog:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result ^ 1;
  if (((result ^ 1) & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _removeLoadingRequestForArtworkCatalog:v4];
  }
  return result;
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_4(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    unint64_t v2 = 0;
    do
    {
      v3 = (void *)a1[4];
      uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
      [v3 addObject:v4];

      id v5 = (void *)a1[5];
      id v6 = [MEMORY[0x1E4F1CA98] null];
      [v5 addObject:v6];

      ++v2;
    }
    while (v2 < *(void *)(*(void *)(a1[6] + 8) + 24));
  }
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v40 = 0;
  double v41 = &v40;
  uint64_t v42 = 0x3032000000;
  double v43 = __Block_byref_object_copy__2557;
  double v44 = __Block_byref_object_dispose__2558;
  id v45 = 0;
  uint64_t v34 = 0;
  double v35 = &v34;
  uint64_t v36 = 0x3032000000;
  double v37 = __Block_byref_object_copy__2557;
  double v38 = __Block_byref_object_dispose__2558;
  id v39 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_23;
  block[3] = &unk_1E57F2870;
  double v32 = &v40;
  unint64_t v2 = *(NSObject **)(a1 + 32);
  id v30 = *(id *)(a1 + 40);
  double v33 = &v34;
  id v31 = *(id *)(a1 + 48);
  dispatch_sync(v2, block);
  v3 = (void *)v41[5];
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  LODWORD(v3) = [v3 containsObject:v4];

  if (v3)
  {
    id v5 = [(id)objc_opt_class() _errorWithDescription:@"Artwork catalogs found, but at least one had an empty image"];
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB17E0] preferredFormat];
    [v6 setOpaque:0];
    [v6 setScale:*(double *)(a1 + 112)];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v6, *(double *)(a1 + 120), *(double *)(a1 + 128));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2_29;
    v24[3] = &unk_1E57EE2F0;
    uint64_t v8 = *(void *)(a1 + 104);
    long long v25 = *(_OWORD *)(a1 + 136);
    v24[4] = v8;
    v24[5] = &v40;
    uint64_t v9 = *(void *)(a1 + 152);
    uint64_t v26 = *(void *)(a1 + 112);
    uint64_t v27 = v9;
    long long v28 = *(_OWORD *)(a1 + 120);
    id v5 = [v7 imageWithActions:v24];
    if (v5)
    {
      id v11 = [*(id *)(a1 + 64) visualIdenticalityIdentifier];
      uint64_t v12 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v11, v5, *(double *)(a1 + 160), *(double *)(a1 + 168));

      id v13 = objc_alloc_init(MPTiledArtworkRepresentationToken);
      id v14 = (void *)v35[5];
      id v15 = [MEMORY[0x1E4F1CA98] null];
      LOBYTE(v14) = [v14 containsObject:v15];

      if ((v14 & 1) == 0) {
        [(MPTiledArtworkRepresentationToken *)v13 setTileArtworkVisualIdenticalityIdentifiers:v35[5]];
      }
      [(MPTiledArtworkRepresentationToken *)v13 setRevisionIdentifier:*(void *)(a1 + 72)];
      [v12 setRepresentationToken:v13];
      id v16 = [(id)objc_opt_class() _representationCacheKeyForArtworkCatalog:*(void *)(a1 + 64) forAnyRevision:0];
      if (v16) {
        [*(id *)(a1 + 80) setObject:v12 forKey:v16];
      }
      if (*(void *)(a1 + 88)) {
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v12);
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3_31;
      v19[3] = &unk_1E57EE318;
      id v17 = v12;
      id v20 = v17;
      id v18 = v16;
      id v21 = v18;
      id v22 = *(id *)(a1 + 88);
      id v23 = *(id *)(a1 + 80);
      [v5 prepareForDisplayWithCompletionHandler:v19];
    }
    else
    {
      id v17 = 0;
    }
    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 96) + 16))(*(void *)(a1 + 96), v17, 0, v10);
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = [WeakRetained visualIdenticalityIdentifier];
  if (v3 | v5)
  {
    id v6 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_6;
    block[3] = &unk_1E57F1AE8;
    id v10 = (id)v3;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 72);
    id v11 = v7;
    uint64_t v14 = v8;
    id v12 = (id)v5;
    id v13 = *(id *)(a1 + 48);
    dispatch_sync(v6, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_6(uint64_t result)
{
  v1 = (void *)result;
  if (*(void *)(result + 32)) {
    uint64_t result = objc_msgSend(*(id *)(result + 40), "replaceObjectAtIndex:withObject:", *(void *)(result + 64));
  }
  if (v1[6])
  {
    unint64_t v2 = (void *)v1[7];
    uint64_t v3 = v1[8];
    return objc_msgSend(v2, "replaceObjectAtIndex:withObject:", v3);
  }
  return result;
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2_29(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v2 = 0;
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      v9.origin.x = v4;
      v9.origin.y = v3;
      v9.size.width = *(CGFloat *)(a1 + 48);
      v9.size.height = *(CGFloat *)(a1 + 56);
      UIRectClip(v9);
      uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndex:v2];
      [v6 size];
      [v6 size];
      [v6 size];
      [v6 size];
      UIRectGetCenter();
      UIRectCenteredAboutPointScale();
      objc_msgSend(v6, "drawInRect:");
      double v7 = *(double *)(a1 + 72);
      double v4 = v4 + *(double *)(a1 + 48) + v7;
      if (v4 >= *(double *)(a1 + 80))
      {
        double v3 = v7 + v3 + *(double *)(a1 + 56);
        double v4 = 0.0;
      }
      uint64_t v8 = UIGraphicsGetCurrentContext();
      CGContextRestoreGState(v8);

      ++v2;
    }
    while (v2 < *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
}

void __82__MPTiledArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_3_31(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return;
  }
  id v6 = [*(id *)(a1 + 32) representationWithPreparedImage:a2];
  double v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = v3;
LABEL_6:
    [*(id *)(a1 + 56) setObject:v6 forKey:v4];

    uint64_t v5 = v6;
    goto LABEL_7;
  }
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = v6;
  if (v4) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__MPTiledArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPTiledArtworkDataSource *)self _performSyncBlock:v6];
}

uint64_t __73__MPTiledArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeLoadingRequestForArtworkCatalog:*(void *)(a1 + 40)];
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cache];
  tiledArtworkRepresentationFallbackCache = v5;
  if (!v5) {
    tiledArtworkRepresentationFallbackCache = self->_tiledArtworkRepresentationFallbackCache;
  }
  id v7 = tiledArtworkRepresentationFallbackCache;

  uint64_t v8 = [(id)objc_opt_class() _representationCacheKeyForArtworkCatalog:v4 forAnyRevision:0];
  if (!v8
    || ([(NSCache *)v7 objectForKey:v8], (CGRect v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [(id)objc_opt_class() _representationCacheKeyForArtworkCatalog:v4 forAnyRevision:1];
    CGRect v9 = [(NSCache *)v7 objectForKey:v10];
  }

  return v9;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 representationSize];
  double v8 = v7;
  double v10 = v9;
  [v6 scaledFittingSize];
  double v12 = v11;
  double v14 = v13;
  MSVGetMaximumScreenSize();
  if (v15 < v16) {
    double v15 = v16;
  }
  double v17 = (double)(unint64_t)(uint64_t)v15;
  if (v12 >= v17) {
    double v18 = v17;
  }
  else {
    double v18 = v12;
  }
  if (vabdd_f64(v8, v18) >= 0.00000011920929) {
    goto LABEL_12;
  }
  if (v14 < v17) {
    double v17 = v14;
  }
  if (vabdd_f64(v10, v17) >= 0.00000011920929)
  {
LABEL_12:
    char v23 = 0;
  }
  else
  {
    double v19 = [v6 token];
    id v20 = [v19 revisionIdentifier];
    if (v20)
    {
      id v21 = [v5 representationToken];
      id v22 = [v21 revisionIdentifier];
      char v23 = [v22 isEqual:v20];
    }
    else
    {
      char v23 = 1;
    }
  }
  return v23;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (MPTiledArtworkDataSource)init
{
  v14.receiver = self;
  v14.super_class = (Class)MPTiledArtworkDataSource;
  unint64_t v2 = [(MPTiledArtworkDataSource *)&v14 init];
  if (v2)
  {
    double v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    tilingArtworkCatalogOperationQueue = v2->_tilingArtworkCatalogOperationQueue;
    v2->_tilingArtworkCatalogOperationQueue = v3;

    [(NSOperationQueue *)v2->_tilingArtworkCatalogOperationQueue setName:@"com.apple.MediaPlayer.MPTiledArtworkDataSource.TilingArtworkCatalogOperationQueue"];
    [(NSOperationQueue *)v2->_tilingArtworkCatalogOperationQueue setMaxConcurrentOperationCount:5];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.LoadingTiledArtworkRequestsQueue", 0);
    loadingTiledArtworkRequestsAccessQueue = v2->_loadingTiledArtworkRequestsAccessQueue;
    v2->_loadingTiledArtworkRequestsAccessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPTiledArtworkDataSource.RenderingTiledArtworkRequestsQueue", 0);
    renderingTiledArtworkRequestsQueue = v2->_renderingTiledArtworkRequestsQueue;
    v2->_renderingTiledArtworkRequestsQueue = (OS_dispatch_queue *)v7;

    double v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    tiledArtworkRepresentationFallbackCache = v2->_tiledArtworkRepresentationFallbackCache;
    v2->_tiledArtworkRepresentationFallbackCache = v9;

    [(NSCache *)v2->_tiledArtworkRepresentationFallbackCache setCountLimit:50];
    double v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    loadingTiledArtworkRequests = v2->_loadingTiledArtworkRequests;
    v2->_loadingTiledArtworkRequests = v11;
  }
  return v2;
}

+ (CGSize)_tileSizeForFittingSize:(CGSize)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 spacing:(double)a6
{
  double v6 = (a3.width - (double)(a5 - 1) * a6) / (double)a5;
  double v7 = (a3.height - (double)(a4 - 1) * a6) / (double)a4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (id)_loadingRequestForArtworkCatalog:(id)a3
{
  id v3 = a3;
  id v4 = [v3 token];
  [v3 scaledFittingSize];
  double v6 = v5;
  double v8 = v7;

  MSVGetMaximumScreenSize();
  if (v9 < v10) {
    double v9 = v10;
  }
  double v11 = (double)(unint64_t)(uint64_t)v9;
  if (v6 >= v11) {
    double v6 = v11;
  }
  if (v8 >= v11) {
    double v8 = v11;
  }
  double v12 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v4, v6, v8);

  return v12;
}

+ (id)_errorWithDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  double v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  double v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPTiledArtworkError" code:0 userInfo:v5];

  return v6;
}

+ (id)_representationCacheKeyForArtworkCatalog:(id)a3 forAnyRevision:(BOOL)a4
{
  id v5 = a3;
  double v6 = [v5 token];
  double v7 = [v6 entityIdentifier];
  if (v7)
  {
    uint64_t v8 = [v6 namespaceIdentifier];

    if (v8)
    {
      [v5 scaledFittingSize];
      double v10 = v9;
      double v12 = v11;
      MSVGetMaximumScreenSize();
      if (v13 < v14) {
        double v13 = v14;
      }
      double v15 = (double)(unint64_t)(uint64_t)v13;
      if (v10 >= v15) {
        double v10 = v15;
      }
      if (v12 >= v15) {
        double v12 = v15;
      }
      if (a4)
      {
        double v16 = [v6 revisionIdentifier];

        if (v16)
        {
          id v17 = (id)[v6 copy];
          [v17 setRevisionIdentifier:0];
        }
        else
        {
          id v17 = v6;
        }
        double v7 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v17, v10, v12);
      }
      else
      {
        double v7 = -[MPTiledArtworkRepresentationCacheKey initWithTiledArtworkRequest:scaledFittingSize:]([MPTiledArtworkRepresentationCacheKey alloc], "initWithTiledArtworkRequest:scaledFittingSize:", v6, v10, v12);
      }
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

+ (id)sharedDataSource
{
  if (sharedDataSource_sOnceToken != -1) {
    dispatch_once(&sharedDataSource_sOnceToken, &__block_literal_global_2597);
  }
  unint64_t v2 = (void *)sharedDataSource_sSharedDataSource;

  return v2;
}

void __44__MPTiledArtworkDataSource_sharedDataSource__block_invoke()
{
  v0 = objc_alloc_init(MPTiledArtworkDataSource);
  v1 = (void *)sharedDataSource_sSharedDataSource;
  sharedDataSource_sSharedDataSource = (uint64_t)v0;
}

@end