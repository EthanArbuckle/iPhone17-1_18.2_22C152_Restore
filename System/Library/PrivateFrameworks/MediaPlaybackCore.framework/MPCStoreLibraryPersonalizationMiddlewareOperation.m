@interface MPCStoreLibraryPersonalizationMiddlewareOperation
- (MPCPlayerRequest)playerRequest;
- (MPCStoreLibraryPersonalizationMiddleware)middleware;
- (MPCStoreLibraryPersonalizationMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4;
- (NSArray)inputProtocols;
- (NSArray)invalidationObservers;
- (NSArray)outputProtocols;
- (NSMapTable)inputOperations;
- (id)invalidationHandler;
- (void)execute;
- (void)setInputOperations:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlayerRequest:(id)a3;
@end

@implementation MPCStoreLibraryPersonalizationMiddlewareOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)outputProtocols
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInputOperations:(id)a3
{
}

- (void)execute
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v3 = [(MPCStoreLibraryPersonalizationMiddlewareOperation *)self inputOperations];
  v4 = [v3 objectForKey:&unk_26CC38538];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v61 + 1) + 8 * i) controller];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  v11 = [v10 resolvedPlayerPath];
  if (([v11 isSystemMusicPath] & 1) != 0 && !objc_msgSend(v11, "isLocal"))
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v12 = [(MPCStoreLibraryPersonalizationMiddlewareOperation *)self inputOperations];
    v13 = [v12 objectForKey:&unk_26CC291C8];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v58;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          uint64_t v19 = [v18 modelObjects];
          if (v19)
          {
            v20 = (void *)v19;
            v21 = [v18 playingIndexPath];
            goto LABEL_24;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    v20 = 0;
    v21 = 0;
LABEL_24:

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v22 = [(MPCStoreLibraryPersonalizationMiddlewareOperation *)self inputOperations];
    v23 = [v22 objectForKey:&unk_26CC34078];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v54;
      while (2)
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v54 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v53 + 1) + 8 * k) overridePlayingItem];
          if (v28)
          {
            v29 = (void *)v28;
            goto LABEL_34;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    v29 = 0;
LABEL_34:

    if (v20)
    {
      id v30 = objc_alloc_init(MEMORY[0x263F120D8]);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke;
      v48[3] = &unk_2643C1ED0;
      id v31 = v30;
      id v49 = v31;
      id v50 = v20;
      v45 = v21;
      id v43 = v21;
      id v51 = v43;
      id v52 = v29;
      [v50 enumerateSectionsUsingBlock:v48];
      v44 = v31;
      v32 = (void *)[objc_alloc(MEMORY[0x263F122B0]) initWithUnpersonalizedContentDescriptors:v31];
      v33 = [(MPCPlayerRequest *)self->_playerRequest userIdentity];
      [v32 setUserIdentity:v33];

      v34 = [MEMORY[0x263F122A8] lightweightPersonalizationPropertiesForModelClass:objc_opt_class()];
      v35 = [(MPCPlayerRequest *)self->_playerRequest queueSectionProperties];
      v36 = [v35 propertySetByCombiningWithPropertySet:v34];
      [v32 setSectionProperties:v36];

      v37 = [(MPCPlayerRequest *)self->_playerRequest queueItemProperties];
      v38 = [v37 propertySetByCombiningWithPropertySet:v34];
      [v32 setItemProperties:v38];

      [v32 setMatchAlbumArtistsOnNameAndStoreID:0];
      v39 = [(MPCPlayerRequest *)self->_playerRequest playingItemProperties];
      v40 = [v39 propertySetByCombiningWithPropertySet:v34];

      if (v43 && v40) {
        objc_msgSend(v32, "setProperties:forItemAtIndexPath:", v40);
      }
      v41 = _Block_copy(self->_invalidationHandler);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_3;
      v46[3] = &unk_2643C1F20;
      v46[4] = self;
      id v47 = v41;
      id v42 = v41;
      [v32 performWithResponseHandler:v46];

      v21 = v45;
    }
    else
    {
      [(MPAsyncOperation *)self finish];
    }
  }
  else
  {
    [(MPAsyncOperation *)self finish];
  }
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_inputOperations, 0);
}

- (NSArray)inputProtocols
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC34078;
  v4[1] = &unk_26CC291C8;
  v4[2] = &unk_26CC38538;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

- (MPCStoreLibraryPersonalizationMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCStoreLibraryPersonalizationMiddlewareOperation;
  uint64_t v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (void)setPlayerRequest:(id)a3
{
}

- (MPCPlayerRequest)playerRequest
{
  return self->_playerRequest;
}

- (void)setMiddleware:(id)a3
{
}

- (MPCStoreLibraryPersonalizationMiddleware)middleware
{
  return self->_middleware;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F122A8]) initWithModel:v5 personalizationStyle:1];
    [v6 appendSection:v7];
  }
  else
  {
    [*(id *)(a1 + 32) appendSection:&stru_26CBCA930];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_2;
  v9[3] = &unk_2643C1EA8;
  id v8 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v13 = a3;
  id v12 = *(id *)(a1 + 32);
  [v8 enumerateItemsInSectionAtIndex:a3 usingBlock:v9];
}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 results];
  id v5 = [*(id *)(a1 + 32) middleware];
  [v5 setPersonalizedModelObjects:v4];

  if (v3)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    id v7 = objc_alloc(MEMORY[0x263F120F0]);
    uint64_t v8 = *MEMORY[0x263F11B18];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_4;
    uint64_t v16 = &unk_2643C1EF8;
    id v17 = v3;
    id v18 = *(id *)(a1 + 40);
    uint64_t v9 = (void *)[v7 initWithName:v8 object:v17 handler:&v13];
    objc_msgSend(v6, "addObject:", v9, v13, v14, v15, v16);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 288);
    *(void *)(v10 + 288) = v6;
    id v12 = v6;
  }
  [*(id *)(a1 + 32) finish];
}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void (**)(uint64_t, __CFString *))(v1 + 16);
  id v3 = *(id *)(a1 + 32);
  v2(v1, @"Personalization response did invalidate");
}

void __60__MPCStoreLibraryPersonalizationMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6 && *(void *)(a1 + 40))
  {
    id v10 = v5;
    if ([v6 section] == *(void *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "item") == a3)
    {
      id v7 = *(id *)(a1 + 40);

      id v5 = v7;
    }
    else
    {
      id v5 = v10;
    }
  }
  if (v5)
  {
    uint64_t v8 = *(void **)(a1 + 48);
    id v11 = v5;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F122A8]) initWithModel:v5 personalizationStyle:1];
    [v8 appendItem:v9];

    id v5 = v11;
  }
}

@end