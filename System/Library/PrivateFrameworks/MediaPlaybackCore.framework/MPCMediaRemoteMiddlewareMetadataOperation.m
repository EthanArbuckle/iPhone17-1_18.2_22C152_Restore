@interface MPCMediaRemoteMiddlewareMetadataOperation
- (MPCFuture)playQueueIdentifiersFuture;
- (MPCFuture)playbackQueueFuture;
- (MPCFuture)playingIdentifierFuture;
- (MPCFuture)queueIdentifierFuture;
- (MPCMediaRemoteMiddleware)middleware;
- (MPCMediaRemoteMiddlewareMetadataOperation)initWithMiddleware:(id)a3 request:(id)a4;
- (MPCMediaRemoteMiddlewareMetadataOperationConfiguration)request;
- (MPSectionedCollection)modelObjects;
- (MPSectionedCollection)sourceContentItems;
- (NSArray)inputProtocols;
- (NSArray)invalidationObservers;
- (NSArray)outputProtocols;
- (NSIndexPath)playingIndexPath;
- (NSMapTable)inputOperations;
- (_MSVSignedRange)rangeFromTracklistRange:(id)a3;
- (id)_genericObjectPropertySetForContentItem:(id)a3 preferredRelationships:(id)a4 propertySet:(id)a5;
- (id)_itemGenericObjectPropertySetForContentItem:(id)a3 propertySet:(id)a4;
- (id)invalidationHandler;
- (id)timeoutDescription;
- (void)_loadPlaybackQueueWithCompletion:(id)a3;
- (void)execute;
- (void)setInputOperations:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlayQueueIdentifiersFuture:(id)a3;
- (void)setPlaybackQueueFuture:(id)a3;
- (void)setPlayingIdentifierFuture:(id)a3;
- (void)setQueueIdentifierFuture:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation MPCMediaRemoteMiddlewareMetadataOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)inputProtocols
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    v4 = [v3 identifiers];
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__603;
    v38[4] = __Block_byref_object_dispose__604;
    id v39 = 0;
    dispatch_group_t v7 = dispatch_group_create();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_6;
    v31[3] = &unk_2643BE348;
    v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    v32 = v8;
    uint64_t v33 = v9;
    id v10 = v5;
    id v34 = v10;
    id v11 = v6;
    id v35 = v11;
    id v36 = *(id *)(a1 + 40);
    v37 = v38;
    [v4 enumerateObjectsUsingBlock:v31];
    int v12 = [*(id *)(a1 + 32) isCancelled];
    v13 = *(id **)(a1 + 32);
    if (v12)
    {
      [v13 finish];
    }
    else
    {
      uint64_t v14 = [v13[35] arrayByAddingObject:v11];
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 280);
      *(void *)(v15 + 280) = v14;

      v17 = [*(id *)(a1 + 32) request];
      intptr_t v18 = [v17 qualityOfService];
      if ((unint64_t)(v18 + 1) > 0x22 || ((1 << (v18 + 1)) & 0x404040400) == 0) {
        intptr_t v18 = 0;
      }
      v19 = dispatch_get_global_queue(v18, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_4;
      block[3] = &unk_2643BE370;
      uint64_t v20 = *(void *)(a1 + 32);
      v28 = v38;
      block[4] = v20;
      v21 = *(void **)(a1 + 48);
      uint64_t v29 = *(void *)(a1 + 56);
      id v27 = v21;
      id v25 = v10;
      id v22 = v3;
      uint64_t v23 = *(void *)(a1 + 64);
      id v26 = v22;
      uint64_t v30 = v23;
      dispatch_group_notify(v8, v19, block);
    }
    _Block_object_dispose(v38, 8);
  }
}

- (MPCMediaRemoteMiddlewareMetadataOperation)initWithMiddleware:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCMediaRemoteMiddlewareMetadataOperation;
  uint64_t v9 = [(MPAsyncOperation *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_request, a4);
  }

  return v10;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = [*(id *)(a1 + 40) middleware];
  id v7 = [v6 controller];
  id v8 = [v7 contentItemForIdentifier:v5];

  [*(id *)(a1 + 48) addObject:v8];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2_7;
  v21[3] = &unk_2643C55A8;
  uint64_t v9 = *(void **)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v10 = v5;
  id v22 = v10;
  id v11 = [v8 onInvalid:v21];
  [v9 addObject:v11];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_3;
  v15[3] = &unk_2643BE320;
  id v12 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 72);
  uint64_t v20 = a3;
  id v16 = v12;
  id v17 = v10;
  id v18 = *(id *)(a1 + 32);
  id v13 = v10;
  id v14 = (id)[v8 onCompletion:v15];
}

- (void)_loadPlaybackQueueWithCompletion:(id)a3
{
  v56[1] = *MEMORY[0x263EF8340];
  id v38 = a3;
  v40 = _Block_copy(self->_invalidationHandler);
  v4 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
  uint64_t v5 = [v4 tracklistRange];
  -[MPCMediaRemoteMiddlewareMetadataOperation rangeFromTracklistRange:](self, "rangeFromTracklistRange:", v5, v6);

  id v7 = (const void *)MRPlaybackQueueRequestCreate();
  id v8 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
  uint64_t v9 = [v8 playingItemProperties];
  id v10 = [v9 relationships];
  uint64_t v11 = *MEMORY[0x263F119F0];
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F119F0]];
  if (v12)
  {
  }
  else
  {
    id v13 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
    id v14 = [v13 queueItemProperties];
    uint64_t v15 = [v14 relationships];
    id v16 = [v15 objectForKeyedSubscript:v11];

    if (!v16) {
      goto LABEL_7;
    }
  }
  MRPlaybackQueueRequestSetIncludeInfo();
  MRPlaybackQueueRequestSetIncludeSections();
  id v17 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
  id v18 = [v17 playingItemProperties];
  uint64_t v19 = [v18 relationships];
  uint64_t v20 = [v19 objectForKeyedSubscript:v11];

  v21 = [v20 properties];
  LODWORD(v19) = [v21 containsObject:*MEMORY[0x263F116E0]];

  if (v19) {
    MRPlaybackQueueRequestSetIncludeAlignments();
  }

LABEL_7:
  id v22 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
  id v23 = [v22 label];
  MRPlaybackQueueRequestSetLabel();

  v24 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self middleware];
  id v25 = [v24 controller];
  id v26 = [v25 playbackQueueForRequest:v7];
  [(MPCMediaRemoteMiddlewareMetadataOperation *)self setPlaybackQueueFuture:v26];

  CFRelease(v7);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  char v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  char v53 = 0;
  id v27 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self playbackQueueFuture];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke;
  v48[3] = &unk_2643BE9C8;
  v50 = v54;
  id v28 = v40;
  id v49 = v28;
  v51 = v52;
  uint64_t v29 = [v27 onInvalid:v48];

  v56[0] = v29;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];
  invalidationObservers = self->_invalidationObservers;
  self->_invalidationObservers = v30;

  v32 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self playbackQueueFuture];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2;
  v43[3] = &unk_2643BE398;
  v43[4] = self;
  id v33 = v28;
  id v44 = v33;
  v46 = v52;
  id v34 = v39;
  id v45 = v34;
  v47 = v54;
  id v35 = [v32 onSuccess:v43];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_21;
  v41[3] = &unk_2643C5830;
  id v36 = v34;
  id v42 = v36;
  id v37 = (id)[v35 onFailure:v41];

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);
}

- (MPCMediaRemoteMiddlewareMetadataOperationConfiguration)request
{
  return self->_request;
}

- (MPCFuture)playbackQueueFuture
{
  return self->_playbackQueueFuture;
}

- (void)setPlaybackQueueFuture:(id)a3
{
}

- (_MSVSignedRange)rangeFromTracklistRange:(id)a3
{
  if (a3.var1 >= 0) {
    int64_t var1 = a3.var1;
  }
  else {
    int64_t var1 = -a3.var1;
  }
  if (a3.var0 >= 0) {
    int64_t var0 = a3.var0;
  }
  else {
    int64_t var0 = -a3.var0;
  }
  int64_t v5 = -var0;
  int64_t v6 = var1 + var0 + 1;
  result.length = v6;
  result.location = v5;
  return result;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v2)
  {
    id v3 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 2000, v2, @"Failed to get play queue identifers");
  }
  else
  {
    id v3 = 0;
  }
  v4 = [*(id *)(a1 + 32) middleware];
  int64_t v5 = [v4 controllerFuture];
  char v6 = [v5 isInvalid];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || (v6 & 1) != 0 || v3)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 48) playingIdentifier];
    id v12 = [*(id *)(a1 + 48) queueIdentifier];
    id v13 = [*(id *)(a1 + 48) queueProperties];
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, void *))(v9 + 16))(v9, v10, v11, v12, v13, v3);
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Middleware");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) request];
      int v14 = 134217984;
      uint64_t v15 = v8;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "INVALIDATE: %p: Invalidated before returning a response. Re-requesting items.", (uint8_t *)&v14, 0xCu);
    }
    [*(id *)(a1 + 32) _loadPlaybackQueueWithCompletion:*(void *)(a1 + 56)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
}

void __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [*(id *)(a1 + 32) isCancelled];
  if (v15 || v16)
  {
    [*(id *)(a1 + 32) finishWithError:v15];
  }
  else if ([v11 count])
  {
    id v17 = *(void **)(a1 + 32);
    if (v12)
    {
      id v59 = v14;
      id v60 = v13;
      id v64 = v12;
      id v18 = [v17 request];
      uint64_t v19 = [v18 queueSectionProperties];

      uint64_t v20 = [*(id *)(a1 + 32) request];
      v67 = [v20 queueItemProperties];

      id v21 = objc_alloc_init(MEMORY[0x263F120D8]);
      id v22 = objc_alloc_init(MEMORY[0x263F120D8]);
      id v23 = [MEMORY[0x263F11E70] translatorForMPModelClass:objc_opt_class()];
      id v24 = objc_alloc_init(MEMORY[0x263F11E78]);
      id v25 = [*(id *)(a1 + 32) middleware];
      id v26 = [v25 controller];
      [v24 setArtworkGenerator:v26];

      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke_2;
      aBlock[3] = &unk_2643BE3C0;
      id v61 = v22;
      id v69 = v61;
      id v63 = v23;
      id v70 = v63;
      id v57 = v19;
      id v71 = v57;
      id v62 = v24;
      id v72 = v62;
      id v65 = v21;
      id v73 = v65;
      id v27 = _Block_copy(aBlock);
      id v28 = [v11 firstObject];
      v66 = (void (**)(void, void))v27;
      (*((void (**)(void *, void *))v27 + 2))(v27, v28);
      if ([v11 count])
      {
        uint64_t v29 = 0;
        while (1)
        {
          uint64_t v30 = objc_msgSend(v11, "objectAtIndexedSubscript:", v29, v57);
          v31 = [v30 collectionIdentifier];
          if (v31)
          {
            v32 = [v30 collectionIdentifier];
            id v33 = [v28 collectionIdentifier];
            int v34 = [v32 isEqualToString:v33] ^ 1;
          }
          else
          {
            int v34 = 0;
          }

          id v35 = [v30 collectionInfo];
          if (v35)
          {
            id v36 = [v30 collectionInfo];
            id v37 = [v28 collectionInfo];
            int v38 = [v36 isEqualToDictionary:v37] ^ 1;
          }
          else
          {
            int v38 = 0;
          }

          if ((v34 | v38) == 1)
          {
            id v39 = v30;

            ((void (**)(void, id))v66)[2](v66, v39);
            id v28 = v39;
          }
          id v40 = v67;
          v41 = [*(id *)(a1 + 32) middleware];
          id v42 = [v41 playingIndexPath];
          if (v42) {
            goto LABEL_18;
          }
          v43 = [v30 identifier];
          int v44 = [v43 isEqualToString:v64];

          if (v44) {
            break;
          }
LABEL_19:
          if (v40)
          {
            uint64_t v49 = [*(id *)(a1 + 32) _itemGenericObjectPropertySetForContentItem:v30 propertySet:v40];
            v50 = (void *)v49;
            if (v30 && v49)
            {
              v51 = [v63 objectForPropertySet:v49 contentItem:v30 context:v62];
              if (v51)
              {
                [v65 appendItem:v51];
                [v61 appendItem:v30];
              }
            }
          }

          if (++v29 >= (unint64_t)[v11 count]) {
            goto LABEL_27;
          }
        }
        uint64_t v45 = [v65 numberOfSections] - 1;
        v46 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v65, "numberOfItemsInSection:", v45), v45);
        v47 = [*(id *)(a1 + 32) middleware];
        [v47 setPlayingIndexPath:v46];

        v41 = [*(id *)(a1 + 32) request];
        uint64_t v48 = [v41 playingItemProperties];
        id v42 = v40;
        id v40 = (id)v48;
LABEL_18:

        goto LABEL_19;
      }
LABEL_27:
      v52 = objc_msgSend(*(id *)(a1 + 32), "middleware", v57);
      [v52 setQueueContentItems:v61];

      char v53 = [*(id *)(a1 + 32) middleware];
      [v53 setQueueModelObjects:v65];

      v54 = [*(id *)(a1 + 32) middleware];
      id v13 = v60;
      [v54 setQueueIdentifier:v60];

      char v55 = [*(id *)(a1 + 32) middleware];
      id v14 = v59;
      [v55 setQueueProperties:v59];

      [*(id *)(a1 + 32) finish];
      id v12 = v64;
      id v15 = 0;
    }
    else
    {
      v56 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 2000, @"Failed to get playing identifier");
      [v17 finishWithError:v56];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finish];
  }
}

- (MPCMediaRemoteMiddleware)middleware
{
  return self->_middleware;
}

- (void)execute
{
  id v3 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self middleware];
  v4 = [v3 controller];

  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke;
    v5[3] = &unk_2643BE3E8;
    v5[4] = self;
    [(MPCMediaRemoteMiddlewareMetadataOperation *)self _loadPlaybackQueueWithCompletion:v5];
  }
  else
  {
    [(MPAsyncOperation *)self cancel];
    [(MPAsyncOperation *)self finish];
  }
}

- (id)_itemGenericObjectPropertySetForContentItem:(id)a3 propertySet:(id)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 deviceSpecificUserInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F11B70]];

  uint64_t v10 = [v7 relationships];
  uint64_t v11 = *MEMORY[0x263F119E0];
  id v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F119E0]];

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_24;
  }
  uint64_t v15 = [v6 mediaType];
  id v14 = (void *)MEMORY[0x263EFFA68];
  if (v15 <= 511)
  {
    if (v15 != 1)
    {
      if (v15 != 2)
      {
        if (v15 != 256) {
          goto LABEL_21;
        }
LABEL_16:
        uint64_t v18 = *MEMORY[0x263F11A70];
        v46[0] = *MEMORY[0x263F11A68];
        v46[1] = v18;
        int v16 = (void *)MEMORY[0x263EFF8C0];
        id v17 = v46;
        uint64_t v19 = 2;
LABEL_20:
        id v14 = [v16 arrayWithObjects:v17 count:v19];
        goto LABEL_21;
      }
      uint64_t v44 = *MEMORY[0x263F11A70];
      int v16 = (void *)MEMORY[0x263EFF8C0];
      id v17 = &v44;
LABEL_18:
      uint64_t v19 = 1;
      goto LABEL_20;
    }
LABEL_15:
    v47[0] = *MEMORY[0x263F11A70];
    int v16 = (void *)MEMORY[0x263EFF8C0];
    id v17 = v47;
    goto LABEL_18;
  }
  switch(v15)
  {
    case 0x200:
      uint64_t v20 = *MEMORY[0x263F11A68];
      v45[0] = *MEMORY[0x263F11A78];
      v45[1] = v20;
      v45[2] = *MEMORY[0x263F11A70];
      int v16 = (void *)MEMORY[0x263EFF8C0];
      id v17 = v45;
      uint64_t v19 = 3;
      goto LABEL_20;
    case 0x2000:
      goto LABEL_16;
    case 0x800:
      goto LABEL_15;
  }
LABEL_21:
  uint64_t v21 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self _genericObjectPropertySetForContentItem:v6 preferredRelationships:v14 propertySet:v12];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x263F12180]);
    uint64_t v42 = v11;
    uint64_t v43 = v21;
    id v23 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v24 = (void *)[v22 initWithProperties:0 relationships:v23];

    id v12 = (void *)v21;
    goto LABEL_46;
  }
  id v12 = 0;
LABEL_24:
  uint64_t v25 = [v6 mediaType];
  if (v25 <= 255)
  {
    if (v25 != 1)
    {
      if (v25 == 2)
      {
        uint64_t v31 = *MEMORY[0x263F11A18];
        v38[0] = *MEMORY[0x263F119F0];
        v38[1] = v31;
        id v27 = (void *)MEMORY[0x263EFF8C0];
        id v28 = v38;
        goto LABEL_39;
      }
      if (v25 != 4) {
        goto LABEL_41;
      }
      uint64_t v37 = *MEMORY[0x263F11A18];
      id v27 = (void *)MEMORY[0x263EFF8C0];
      id v28 = &v37;
LABEL_36:
      uint64_t v29 = 1;
      goto LABEL_40;
    }
LABEL_35:
    uint64_t v41 = *MEMORY[0x263F11A18];
    id v27 = (void *)MEMORY[0x263EFF8C0];
    id v28 = &v41;
    goto LABEL_36;
  }
  if (v25 > 2047)
  {
    if (v25 == 0x2000) {
      goto LABEL_37;
    }
    if (v25 != 2048) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
  if (v25 == 256)
  {
LABEL_37:
    uint64_t v30 = *MEMORY[0x263F11A18];
    v40[0] = *MEMORY[0x263F119D0];
    v40[1] = v30;
    id v27 = (void *)MEMORY[0x263EFF8C0];
    id v28 = v40;
LABEL_39:
    uint64_t v29 = 2;
    goto LABEL_40;
  }
  if (v25 == 512)
  {
    uint64_t v26 = *MEMORY[0x263F119D0];
    v39[0] = *MEMORY[0x263F11A20];
    v39[1] = v26;
    v39[2] = *MEMORY[0x263F11A18];
    id v27 = (void *)MEMORY[0x263EFF8C0];
    id v28 = v39;
    uint64_t v29 = 3;
LABEL_40:
    uint64_t v32 = [v27 arrayWithObjects:v28 count:v29];

    id v14 = (void *)v32;
  }
LABEL_41:
  if (objc_opt_respondsToSelector())
  {
    id v33 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
    int v34 = [v33 preferredFallbackItemRelationship];

    if (v34)
    {
      uint64_t v35 = [v14 arrayByAddingObject:v34];

      id v14 = (void *)v35;
    }
  }
  id v24 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self _genericObjectPropertySetForContentItem:v6 preferredRelationships:v14 propertySet:v7];
LABEL_46:

  return v24;
}

- (id)_genericObjectPropertySetForContentItem:(id)a3 preferredRelationships:(id)a4 propertySet:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  id v8 = [MEMORY[0x263F11EE0] requiredStoreLibraryPersonalizationProperties];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        int v16 = [v7 relationships];
        id v17 = [v16 objectForKeyedSubscript:v15];

        if (v17)
        {
          uint64_t v18 = [v8 relationships];
          uint64_t v19 = [v18 objectForKeyedSubscript:v15];
          uint64_t v20 = v19;
          if (!v19)
          {
            uint64_t v20 = [MEMORY[0x263F12180] emptyPropertySet];
          }
          uint64_t v21 = [v17 propertySetByCombiningWithPropertySet:v20];
          [v9 setObject:v21 forKeyedSubscript:v15];

          if (!v19) {
          goto LABEL_15;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (![v9 count])
  {
    memset(v34, 0, sizeof(v34));
    id v22 = [v7 relationships];
    if ([v22 countByEnumeratingWithState:v34 objects:v39 count:16])
    {
      uint64_t v23 = **((void **)&v34[0] + 1);
      id v33 = [v7 relationships];
      id v24 = [v33 objectForKeyedSubscript:v23];
      uint64_t v32 = v8;
      uint64_t v25 = [v8 relationships];
      uint64_t v26 = [v25 objectForKeyedSubscript:v23];
      id v27 = v26;
      if (!v26)
      {
        id v27 = [MEMORY[0x263F12180] emptyPropertySet];
      }
      [v24 propertySetByCombiningWithPropertySet:v27];
      uint64_t v29 = v28 = v24;
      [v9 setObject:v29 forKeyedSubscript:v23];

      if (!v26) {
      id v8 = v32;
      }
    }
  }
  if ([v9 count])
  {
    uint64_t v30 = [objc_alloc(MEMORY[0x263F12180]) initWithProperties:0 relationships:v9];

    id v7 = (id)v30;
  }

  return v7;
}

void __52__MPCMediaRemoteMiddlewareMetadataOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) appendSection:v6];
  if (!v6
    || ([*(id *)(a1 + 40) sectionObjectForPropertySet:*(void *)(a1 + 48) contentItem:v6 context:*(void *)(a1 + 56)], (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = objc_alloc(MEMORY[0x263F11EE0]);
    int64_t v5 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    id v3 = (void *)[v4 initWithIdentifiers:v5 block:&__block_literal_global_597];
  }
  [*(id *)(a1 + 64) appendSection:v3];
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v8)
  {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 64) withObject:v8];
  }
  else
  {
    id v7 = v5;
    if (!v5)
    {
      id v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 2000, @"Content item completed without error or value: %@", *(void *)(a1 + 40));
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
    if (!v6) {
  }
    }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueFuture, 0);
  objc_storeStrong((id *)&self->_queueIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_playingIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_playQueueIdentifiersFuture, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_inputOperations, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);

  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (NSArray)outputProtocols
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC291C8;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

uint64_t __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    _MSVSignedRange result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  return result;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_2_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [@"Item Changed: " stringByAppendingString:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setQueueIdentifierFuture:(id)a3
{
}

- (MPCFuture)queueIdentifierFuture
{
  return self->_queueIdentifierFuture;
}

- (void)setPlayingIdentifierFuture:(id)a3
{
}

- (MPCFuture)playingIdentifierFuture
{
  return self->_playingIdentifierFuture;
}

- (void)setPlayQueueIdentifiersFuture:(id)a3
{
}

- (MPCFuture)playQueueIdentifiersFuture
{
  return self->_playQueueIdentifiersFuture;
}

- (void)setRequest:(id)a3
{
}

- (void)setMiddleware:(id)a3
{
}

- (void)setInputOperations:(id)a3
{
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)timeoutDescription
{
  id v3 = NSString;
  id v4 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self playQueueIdentifiersFuture];
  id v5 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self playingIdentifierFuture];
  id v6 = +[MPCPlayerPathCache sharedCache];
  id v7 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self request];
  id v8 = [v7 playerPath];
  uint64_t v9 = [v6 observationTokenDescriptionForPlayerPath:v8];
  id v10 = [v3 stringWithFormat:@"playQueueIdentifiersFuture=%@ playingIdentifierFuture=%@ playerPathObserver=%@", v4, v5, v9];

  return v10;
}

void __78__MPCMediaRemoteMiddlewareMetadataOperation__loadPlaybackQueueWithCompletion___block_invoke_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 2000, a2, @"Failed to get playback queue");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, void, id))(v2 + 16))(v2, 0, 0, 0, 0, v3);
}

- (MPSectionedCollection)sourceContentItems
{
  uint64_t v2 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self middleware];
  id v3 = [v2 queueContentItems];

  return (MPSectionedCollection *)v3;
}

- (MPSectionedCollection)modelObjects
{
  uint64_t v2 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self middleware];
  id v3 = [v2 queueModelObjects];

  return (MPSectionedCollection *)v3;
}

- (NSIndexPath)playingIndexPath
{
  uint64_t v2 = [(MPCMediaRemoteMiddlewareMetadataOperation *)self middleware];
  id v3 = [v2 playingIndexPath];

  return (NSIndexPath *)v3;
}

@end