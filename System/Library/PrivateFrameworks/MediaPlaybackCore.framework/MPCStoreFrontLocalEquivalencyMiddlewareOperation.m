@interface MPCStoreFrontLocalEquivalencyMiddlewareOperation
- (MPCPlayerRequest)playerRequest;
- (MPCStoreFrontLocalEquivalencyMiddleware)middleware;
- (MPCStoreFrontLocalEquivalencyMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4;
- (MPModelGenericObject)overridePlayingItem;
- (NSArray)inputProtocols;
- (NSArray)invalidationObservers;
- (NSArray)outputProtocols;
- (NSIndexPath)playingItemIndexPath;
- (NSMapTable)inputOperations;
- (id)invalidationHandler;
- (void)execute;
- (void)setInputOperations:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setPlayerRequest:(id)a3;
@end

@implementation MPCStoreFrontLocalEquivalencyMiddlewareOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_inputOperations, 0);
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

- (MPCStoreFrontLocalEquivalencyMiddleware)middleware
{
  return self->_middleware;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInputOperations:(id)a3
{
}

- (NSMapTable)inputOperations
{
  return self->_inputOperations;
}

- (NSArray)outputProtocols
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC34078;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)inputProtocols
{
  void v4[2] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CC291C8;
  v4[1] = &unk_26CC38538;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (void)execute
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v3 = [(MPCStoreFrontLocalEquivalencyMiddlewareOperation *)self inputOperations];
  v4 = [v3 objectForKey:&unk_26CC38538];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v47 + 1) + 8 * i) controller];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  v11 = [v10 resolvedPlayerPath];
  char v12 = [v11 isLocal];

  if (v12)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v13 = [(MPCStoreFrontLocalEquivalencyMiddlewareOperation *)self inputOperations];
    v14 = [v13 objectForKey:&unk_26CC291C8];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          uint64_t v20 = [v19 modelObjects];
          if (v20)
          {
            v21 = (void *)v20;
            v22 = [v19 sourceContentItems];
            v23 = [v19 playingIndexPath];

            if (v23
              && ([v21 itemAtIndexPath:v23], (v24 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v25 = v24;
              v26 = [v24 identifiers];
              v27 = [v26 universalStore];
              uint64_t v28 = [v27 subscriptionAdamID];

              if (!v28) {
                goto LABEL_31;
              }
              if (execute_sOnceToken != -1) {
                dispatch_once(&execute_sOnceToken, &__block_literal_global_6732);
              }
              if (execute_sSystemMediaApplicationBundleID && execute_sSystemMediaApplicationBundleVersion)
              {
                v36 = [v22 itemAtIndexPath:v23];
                v29 = [v36 userInfo];
                v30 = [v29 objectForKeyedSubscript:*MEMORY[0x263F11C08]];
                v31 = objc_msgSend(v30, "MPC_storeFrontIdentifierKey");

                v32 = [MEMORY[0x263F893C8] defaultIdentityStore];
                v33 = [MEMORY[0x263F893C0] activeAccount];
                v37[0] = MEMORY[0x263EF8330];
                v37[1] = 3221225472;
                v37[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2;
                v37[3] = &unk_2643C0608;
                id v38 = v31;
                v39 = self;
                uint64_t v42 = v28;
                id v40 = v25;
                id v41 = v23;
                id v34 = v25;
                id v35 = v31;
                [v32 getPropertiesForUserIdentity:v33 completionHandler:v37];
              }
              else
              {
LABEL_31:
                [(MPAsyncOperation *)self finish];
              }
            }
            else
            {
              [(MPAsyncOperation *)self finish];
            }

            goto LABEL_33;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  [(MPAsyncOperation *)self finish];
LABEL_33:
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  v3 = [a2 storefrontIdentifier];
  v4 = objc_msgSend(v3, "MPC_storeFrontIdentifierKey");

  if (v4 == *(void **)(a1 + 32) || objc_msgSend(v4, "isEqual:"))
  {
    [*(id *)(a1 + 40) finish];
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", *(void *)(a1 + 64));
    id v6 = objc_alloc_init(MEMORY[0x263F12298]);
    [v6 setReason:3];
    [v6 setTimeoutInterval:&unk_26CC196F8];
    [v6 setRetryDelay:2.0];
    [v6 setAllowLocalEquivalencies:1];
    [v6 setShouldRequireCachedResults:1];
    v22[0] = v5;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    [v6 setItemIdentifiers:v7];

    v8 = [MEMORY[0x263F890C0] defaultInfo];
    uint64_t v9 = (void *)[v8 mutableCopy];
    [v9 setClientIdentifier:execute_sSystemMediaApplicationBundleID];
    [v9 setClientVersion:execute_sSystemMediaApplicationBundleVersion];
    [v6 setClientInfo:v9];
    [v6 setShouldIgnoreExpiration:1];
    v10 = [*(id *)(*(void *)(a1 + 40) + 304) userIdentity];
    [v6 setUserIdentity:v10];

    v11 = [MEMORY[0x263F893C8] defaultIdentityStore];
    [v6 setUserIdentityStore:v11];

    char v12 = [MEMORY[0x263F122A0] sharedStoreItemMetadataRequestController];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_70;
    v17[3] = &unk_2643C3D60;
    v13 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v5;
    id v19 = v6;
    id v20 = v13;
    id v21 = *(id *)(a1 + 56);
    id v14 = v6;
    id v15 = v5;
    id v16 = (id)[v12 getStoreItemMetadataForRequest:v14 responseHandler:v17];
  }
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5 || [v5 isFinalResponse])
  {
    if (v6)
    {
      [*(id *)(a1 + 32) finishWithError:v6];
    }
    else
    {
      uint64_t v7 = [v5 storeItemMetadataForItemIdentifier:*(void *)(a1 + 40)];
      if (v7)
      {
        v8 = [*(id *)(a1 + 32) playerRequest];
        uint64_t v9 = [v8 playingItemProperties];
        if (v9)
        {
          v10 = (void *)v9;
        }
        else
        {
          id v18 = [*(id *)(a1 + 32) playerRequest];
          v10 = [v18 queueItemProperties];

          if (!v10)
          {
            v10 = [MEMORY[0x263F12180] emptyPropertySet];
          }
        }
        id v19 = (void *)[objc_alloc(MEMORY[0x263F122D0]) initWithRequestedPropertySet:v10];
        objc_msgSend(v19, "setShouldUsePlaylistEntry:", objc_msgSend(*(id *)(a1 + 56), "type") == 5);
        id v20 = [*(id *)(a1 + 32) userIdentity];
        id v21 = [v19 modelObjectWithStoreItemMetadata:v7 userIdentity:v20];

        uint64_t v22 = objc_msgSend(*(id *)(a1 + 56), "MPC_modelObjectWithStoreFrontLocalEquivalentModelObject:", v21);
        v23 = (void *)v22;
        if (v22 && (void *)v22 != v21)
        {
          v24 = [*(id *)(a1 + 32) middleware];
          [v24 setOverridePlayingItem:v23];

          uint64_t v25 = *(void *)(a1 + 64);
          v26 = [*(id *)(a1 + 32) middleware];
          [v26 setPlayingItemIndexPath:v25];
        }
        [*(id *)(a1 + 32) finish];
      }
      else
      {
        v11 = [v5 cacheMissItemIdentifiers];
        int v12 = [v11 containsObject:*(void *)(a1 + 40)];

        if (v12)
        {
          [*(id *)(a1 + 48) setShouldRequireCachedResults:0];
          v13 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 280));
          id v14 = [MEMORY[0x263F122A0] sharedStoreItemMetadataRequestController];
          uint64_t v15 = *(void *)(a1 + 48);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2_71;
          v27[3] = &unk_2643C05E0;
          id v28 = v13;
          id v16 = v13;
          id v17 = (id)[v14 getStoreItemMetadataForRequest:v15 responseHandler:v27];
        }
        [*(id *)(a1 + 32) finish];
      }
    }
  }
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke_2_71(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v6 || [v6 isFinalResponse]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__MPCStoreFrontLocalEquivalencyMiddlewareOperation_execute__block_invoke()
{
  uint64_t v0 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v1 = (void *)execute_sSystemMediaApplicationBundleID;
  execute_sSystemMediaApplicationBundleID = v0;

  if (!execute_sSystemMediaApplicationBundleID) {
    return;
  }
  id v13 = [MEMORY[0x263F086E0] mainBundle];
  v2 = [v13 bundleIdentifier];
  int v3 = [v2 isEqualToString:execute_sSystemMediaApplicationBundleID];

  if (v3)
  {
    v4 = [v13 objectForInfoDictionaryKey:*MEMORY[0x263EFFAA0]];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v13 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];
    }
    v10 = (void *)execute_sSystemMediaApplicationBundleVersion;
    execute_sSystemMediaApplicationBundleVersion = (uint64_t)v6;
LABEL_13:

    goto LABEL_14;
  }
  id v7 = objc_alloc(MEMORY[0x263F01878]);
  v8 = (void *)[v7 initWithBundleIdentifier:execute_sSystemMediaApplicationBundleID allowPlaceholder:1 error:0];
  id v5 = v8;
  if (v8)
  {
    uint64_t v9 = [v8 shortVersionString];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 bundleVersion];
    }
    int v12 = (void *)execute_sSystemMediaApplicationBundleVersion;
    execute_sSystemMediaApplicationBundleVersion = (uint64_t)v11;

    goto LABEL_13;
  }
LABEL_14:
}

- (MPCStoreFrontLocalEquivalencyMiddlewareOperation)initWithMiddleware:(id)a3 playerRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCStoreFrontLocalEquivalencyMiddlewareOperation;
  uint64_t v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_playerRequest, a4);
  }

  return v10;
}

- (NSIndexPath)playingItemIndexPath
{
  v2 = [(MPCStoreFrontLocalEquivalencyMiddlewareOperation *)self middleware];
  int v3 = [v2 playingItemIndexPath];

  return (NSIndexPath *)v3;
}

- (MPModelGenericObject)overridePlayingItem
{
  v2 = [(MPCStoreFrontLocalEquivalencyMiddlewareOperation *)self middleware];
  int v3 = [v2 overridePlayingItem];

  return (MPModelGenericObject *)v3;
}

@end