@interface MPCModelGenericAVItemSubscriptionAssetLoadOperation
- (BOOL)_canRetrieveLoadResultsFromMiniSinfWithAssets:(id *)a3;
- (BOOL)_canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:(id *)a3 hlsAsset:(id *)a4;
- (ICMusicSubscriptionLeaseSession)subscriptionLeaseSession;
- (ICStoreRequestContext)requestContext;
- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties;
- (MPCModelGenericAVItemSubscriptionAssetLoadOperation)init;
- (id)_handlePlaybackResponse:(id)a3 withPlaybackCacheRequest:(id)a4 error:(id *)a5;
- (id)_loadResultsFromServerObjectDatabaseAssets:(id)a3 hlsAsset:(id)a4;
- (id)_loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:(id)a3;
- (id)cancellationHandler;
- (id)description;
- (id)responseHandler;
- (int64_t)operationType;
- (void)cancel;
- (void)execute;
- (void)setAssetLoadProperties:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSubscriptionLeaseSession:(id)a3;
@end

@implementation MPCModelGenericAVItemSubscriptionAssetLoadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionLeaseSession, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
  objc_storeStrong(&self->_cancellationHandler, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setSubscriptionLeaseSession:(id)a3
{
}

- (ICMusicSubscriptionLeaseSession)subscriptionLeaseSession
{
  return self->_subscriptionLeaseSession;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setOperationType:(int64_t)a3
{
  self->_operationType = a3;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setAssetLoadProperties:(id)a3
{
}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__MPCModelGenericAVItemSubscriptionAssetLoadOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_2643C55A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __78__MPCModelGenericAVItemSubscriptionAssetLoadOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 280);
  *(void *)(v3 + 280) = v2;
}

- (id)cancellationHandler
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13488;
  v10 = __Block_byref_object_dispose__13489;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__MPCModelGenericAVItemSubscriptionAssetLoadOperation_cancellationHandler__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  uint64_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __74__MPCModelGenericAVItemSubscriptionAssetLoadOperation_cancellationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 280));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_handlePlaybackResponse:(id)a3 withPlaybackCacheRequest:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  id v11 = [v8 items];
  v12 = [v11 firstObject];

  if (v12)
  {
    v40 = (void *)v10;
    v38 = a5;
    id v13 = objc_alloc_init(MEMORY[0x263F120E0]);
    v14 = [v12 assetExpirationDate];
    [v13 setExpirationDate:v14];

    id v39 = v8;
    v15 = [v8 dialog];
    v16 = [v15 responseDictionary];
    [v13 setDialogDictionary:v16];

    v17 = [v12 fileAssets];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = 0;
      uint64_t v21 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v23)
          {
            if (!v20) {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v17, "count"));
            }
            [v20 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }
    [v13 setFileAssetInfoList:v20];
    v33 = [v12 hlsAsset];
    if (v33)
    {
      v34 = (void *)[objc_alloc(MEMORY[0x263F12288]) initWithiTunesCloudStoreHLSAssetInfo:v33];
      [v13 setHlsAssetInfo:v34];
    }
    id v41 = 0;
    v30 = v40;
    v32 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v13 assetLoadProperties:v40 source:6 error:&v41];
    id v31 = v41;
    int v35 = [v32 allowsAssetInfoCaching];
    id v8 = v39;
    if (v9 && v35)
    {
      v36 = [MEMORY[0x263F12260] sharedCache];
      [v36 addCachedResponse:v13 forRequest:v9];

      v30 = v40;
    }

    a5 = v38;
    if (v38) {
      goto LABEL_23;
    }
  }
  else
  {
    v24 = (void *)v10;
    v25 = (void *)MEMORY[0x263F087E8];
    v26 = [MEMORY[0x263F087E8] errorForICError:0 response:v8];
    v27 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
    v28 = [v27 itemIdentifiers];
    v29 = v25;
    v30 = v24;
    objc_msgSend(v29, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 54, v26, @"Response did not contain asset for item identifiers: %@", v28);
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    if (a5) {
LABEL_23:
    }
      *a5 = v31;
  }

  return v32;
}

- (id)_loadResultsFromServerObjectDatabaseAssets:(id)a3 hlsAsset:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  v38 = v8;
  if (!v8 && !v9)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"MPCModelGenericAVItemSubscriptionAssetLoadOperation.m", 371, @"Invalid parameter not satisfying: %@", @"assets.count > 0 || hlsAsset != nil" object file lineNumber description];
  }
  id v10 = objc_alloc_init(MEMORY[0x263F120E0]);
  [v10 setSubscriptionRequired:1];
  v37 = v10;
  [v10 setOnlineSubscriptionKeysRequired:1];
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v17 = [v16 sinfs];

        if (v17)
        {
          v44[0] = @"URL";
          uint64_t v18 = [v16 url];
          uint64_t v19 = [v18 absoluteString];
          v45[0] = v19;
          v44[1] = @"flavor";
          uint64_t v20 = [v16 flavor];
          uint64_t v21 = @"unknown";
          if ((unint64_t)(v20 - 1) <= 3) {
            uint64_t v21 = off_2643C1540[v20 - 1];
          }
          v45[1] = v21;
          v45[2] = &unk_26CC19430;
          v44[2] = @"metadata";
          v44[3] = @"sinfs";
          v22 = [v16 sinfs];
          v45[3] = v22;
          v23 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];

          v24 = (void *)[objc_alloc(MEMORY[0x263F89348]) initWithFileAssetResponseDictionary:v23];
          [v24 setExpectedProtectionType:3];
          v25 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:v24];
          [v11 addObject:v25];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v13);
  }

  [v37 setFileAssetInfoList:v11];
  if (v38)
  {
    id v26 = objc_alloc_init(MEMORY[0x263F89350]);
    v27 = [v38 playlistURL];
    [v26 setPlaylistURL:v27];

    v28 = [v38 keyCertificateURL];
    [v26 setKeyCertificateURL:v28];

    v29 = [v38 keyServerURL];
    [v26 setKeyServerURL:v29];

    v30 = [v38 keyServerProtocolType];
    [v26 setKeyServerProtocolType:v30];

    objc_msgSend(v26, "setITunesStoreStream:", objc_msgSend(v38, "isiTunesStoreStream"));
    id v31 = [v38 keyServerAdamID];
    [v26 setKeyServerAdamID:v31];

    v32 = (void *)[objc_alloc(MEMORY[0x263F12288]) initWithiTunesCloudStoreHLSAssetInfo:v26];
    [v37 setHlsAssetInfo:v32];
  }
  v33 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  v34 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v37 assetLoadProperties:v33 source:4 error:0];

  return v34;
}

- (id)_loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"MPCModelGenericAVItemSubscriptionAssetLoadOperation.m", 341, @"Invalid parameter not satisfying: %@", @"assets.count > 0" object file lineNumber description];
  }
  v27 = self;
  id v6 = objc_alloc_init(MEMORY[0x263F120E0]);
  [v6 setSubscriptionRequired:1];
  id v26 = v6;
  [v6 setOnlineSubscriptionKeysRequired:1];
  v29 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v37[0] = @"URL";
        uint64_t v12 = [v11 url];
        uint64_t v13 = [v12 absoluteString];
        v38[0] = v13;
        v37[1] = @"flavor";
        uint64_t v14 = [v11 flavor];
        v15 = @"unknown";
        if ((unint64_t)(v14 - 1) <= 3) {
          v15 = off_2643C1540[v14 - 1];
        }
        v38[1] = v15;
        v38[2] = &unk_26CC19408;
        v37[2] = @"metadata";
        v37[3] = @"sinfs";
        v34[0] = @"id";
        v34[1] = @"sinf2";
        v35[0] = &unk_26CC18FA8;
        v16 = [v11 miniSINF];
        v35[1] = v16;
        v17 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
        v36 = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
        v38[3] = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F89348]) initWithFileAssetResponseDictionary:v19];
        [v20 setExpectedProtectionType:3];
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:v20];
        [v29 addObject:v21];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v8);
  }

  [v26 setFileAssetInfoList:v29];
  v22 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)v27 assetLoadProperties];
  v23 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v26 assetLoadProperties:v22 source:5 error:0];

  return v23;
}

- (BOOL)_canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:(id *)a3 hlsAsset:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  if ([v7 isFollowUp])
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      uint64_t v9 = "[AL] - %{public}@: Skipping assets in the server object database [skipped due to asset load policy]";
LABEL_15:
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
  else
  {
    id v10 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
    int v11 = [v10 isDelegatedLeaseSession];

    if (v11)
    {
      uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        uint64_t v9 = "[AL] - %{public}@: Skipping assets in the server object database [delegated lease]";
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v12 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
      uint64_t v13 = [v12 leaseStatus];
      char v14 = [v13 hasOnlinePlaybackKeys];

      if (v14)
      {
        uint64_t v8 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
        uint64_t v15 = [v7 preferredAudioAssetType];
        v16 = [v7 itemIdentifiers];
        if (v15 < 2)
        {
          uint64_t v20 = [v8 assetsMatchingIdentifierSet:v16];

          if (![v20 count])
          {
            uint64_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = self;
              _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping assets in the server object database [no assets found]", buf, 0xCu);
            }
LABEL_39:

            goto LABEL_16;
          }
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v29 = v20;
          uint64_t v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v31 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = [*(id *)(*((void *)&v30 + 1) + 8 * i) sinfs];

                if (!v26)
                {
                  v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v36 = self;
                    _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Found an asset with no sinf, skipping assets in server object database", buf, 0xCu);
                  }

                  uint64_t v20 = v29;
                  goto LABEL_39;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          if (a3) {
            *a3 = v21;
          }
        }
        else
        {
          v17 = [v8 hlsAssetMatchingIdentifierSet:v16];

          if (!v17)
          {
            v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v36 = self;
              _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping assets in the server object database [no HLS assets found]", buf, 0xCu);
            }

            goto LABEL_16;
          }
          if (a4) {
            *a4 = v17;
          }
        }
        BOOL v18 = 1;
        goto LABEL_17;
      }
      uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        uint64_t v9 = "[AL] - %{public}@: Skipping assets in the server object database [no online lease]";
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  BOOL v18 = 0;
LABEL_17:

  return v18;
}

- (BOOL)_canRetrieveLoadResultsFromMiniSinfWithAssets:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  if ([v5 preferredAudioAssetType] >= 2)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      uint64_t v23 = self;
      uint64_t v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [HLS playback]";
LABEL_8:
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v22, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (([v5 isFollowUp] & 1) != 0
    || ([MEMORY[0x263F12178] standardUserDefaults],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 disableMiniSINF],
        v8,
        v9))
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      uint64_t v23 = self;
      uint64_t v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [skipped due to asset load policy]";
      goto LABEL_8;
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
  int v13 = [v12 isDelegatedLeaseSession];

  if (v13)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v22 = 138543362;
    uint64_t v23 = self;
    uint64_t v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [delegated lease]";
    goto LABEL_8;
  }
  char v14 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
  uint64_t v15 = [v14 leaseStatus];
  char v16 = [v15 hasOnlinePlaybackKeys];

  if ((v16 & 1) == 0)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v22 = 138543362;
    uint64_t v23 = self;
    uint64_t v7 = "[AL] - %{public}@: Skipping miniSINF in the server object database [no online lease]";
    goto LABEL_8;
  }
  id v6 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
  v17 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  BOOL v18 = [v17 itemIdentifiers];
  uint64_t v19 = [v6 assetsWithMiniSINFsMatchingIdentifierSet:v18];

  uint64_t v20 = [v19 count];
  BOOL v10 = v20 != 0;
  if (v20)
  {
    if (a3) {
      *a3 = v19;
    }
  }
  else
  {
    uint64_t v21 = _MPCLogCategoryPlayback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543362;
      uint64_t v23 = self;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping miniSINF in the server object database [no assets found]", (uint8_t *)&v22, 0xCu);
    }
  }
LABEL_10:

  return v10;
}

- (void)execute
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_2643C3DD8;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  id v5 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  v66 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self requestContext];
  int64_t v6 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self operationType];
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v84 = self;
    __int16 v85 = 2048;
    *(void *)v86 = v6;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using subscription playback endpoint with operation type: %li", buf, 0x16u);
  }

  uint64_t v8 = [MEMORY[0x263F89110] sharedMonitor];
  char v9 = [v8 isRemoteServerLikelyReachable];

  if (v9)
  {
    BOOL v10 = [v5 itemIdentifiers];
    int v11 = [v10 universalStore];
    uint64_t v12 = [v11 subscriptionAdamID];

    if (!v12)
    {
      int v13 = [v10 universalStore];
      uint64_t v12 = [v13 adamID];
    }
    id v14 = objc_alloc_init(MEMORY[0x263F12268]);
    objc_msgSend(v14, "setAccountID:", objc_msgSend(v5, "accountID"));
    objc_msgSend(v14, "setDelegatedAccountID:", objc_msgSend(v5, "delegatedAccountID"));
    if (v6 == 2)
    {
      v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v84 = self;
        _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing subscription accountless playback request...", buf, 0xCu);
      }

      [v14 setRequestType:2];
      [v14 setStoreSubscriptionAdamID:v12];
      v28 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
      v29 = [v28 leaseStatus];
      int v30 = [v29 hasOnlinePlaybackKeys];

      if (v30)
      {
        char v16 = [MEMORY[0x263F12260] sharedCache];
        long long v31 = [v16 cachedResponseForRequest:v14];
        if (v31)
        {
          long long v32 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v31 assetLoadProperties:v5 source:3 error:0];
        }
        else
        {
          long long v32 = 0;
        }
        if ([v32 hasValidAsset])
        {
          id v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v84 = self;
            __int16 v85 = 2114;
            *(void *)v86 = v31;
            _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
          }

          (*((void (**)(void *, void *, void, void))v4 + 2))(v4, v32, 0, 0);
          goto LABEL_70;
        }
      }
      char v16 = (void *)[objc_alloc(MEMORY[0x263F891D0]) initWithRequestContext:v66 storeSubscriptionAdamID:v12];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_33;
      v70[3] = &unk_2643C14F8;
      v70[4] = self;
      id v71 = v14;
      id v72 = v4;
      uint64_t v40 = [v16 performWithResponseHandler:v70];
      objc_initWeak((id *)buf, self);
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2_37;
      v67[3] = &unk_2643C1F60;
      objc_copyWeak(&v69, (id *)buf);
      id v41 = v40;
      id v68 = v41;
      [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self setCancellationHandler:v67];

      objc_destroyWeak(&v69);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v6 == 1)
      {
        uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v84 = self;
          _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading subscription lease session...", buf, 0xCu);
        }

        char v16 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        BOOL v18 = v17;
        if (!v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v84 = self;
            _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed loading subscription asset due to missing lease session.", buf, 0xCu);
          }

          int v22 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:19 userInfo:0];
          (*((void (**)(void *, void, void, void *))v4 + 2))(v4, 0, 0, v22);
          goto LABEL_69;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v16 leaseStatus];
          *(_DWORD *)buf = 138543618;
          v84 = self;
          __int16 v85 = 2114;
          *(void *)v86 = v19;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AL][Lease] - %{public}@: Has subscription lease session, using it. Lease status: %{public}@", buf, 0x16u);
        }
        id v81 = 0;
        BOOL v20 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self _canRetrieveLoadResultsFromMiniSinfWithAssets:&v81];
        id v21 = v81;
        int v22 = v21;
        if (v20)
        {
          uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = [v5 prefersVideoContent];
            v25 = @"audio";
            if (v24) {
              v25 = @"video";
            }
            *(_DWORD *)buf = 138543618;
            v84 = self;
            __int16 v85 = 2114;
            *(void *)v86 = v25;
            _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading %{public}@ asset from Mini Sinf...", buf, 0x16u);
          }

          v64 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self _loadResultsFromServerObjectDatabaseAssetsWithMiniSinf:v22];
          (*((void (**)(void *, void *, void, void))v4 + 2))(v4, v64, 0, 0);

          goto LABEL_69;
        }
        id v79 = 0;
        id v80 = v21;
        BOOL v33 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self _canRetrieveLoadResultsFromServerObjectDatabaseWithAssets:&v80 hlsAsset:&v79];
        id v62 = v80;

        id v65 = v79;
        v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          if (v35)
          {
            int v36 = [v5 prefersVideoContent];
            uint64_t v37 = [v5 preferredAudioAssetType];
            if ((unint64_t)(v37 - 1) > 4) {
              v38 = @"Unspecified";
            }
            else {
              v38 = off_2643C1518[v37 - 1];
            }
            *(_DWORD *)buf = 138543875;
            v84 = self;
            __int16 v85 = 1024;
            *(_DWORD *)v86 = v36;
            *(_WORD *)&v86[4] = 2113;
            *(void *)&v86[6] = v38;
            _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "[AL] %{public}@: MPCModelGenericAVItemSubscriptionAssetLoadOperation execute [loading asset from cache] prefersVideoContent=%{BOOL}u preferredAudio=%{private}@", buf, 0x1Cu);
          }

          v63 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self _loadResultsFromServerObjectDatabaseAssets:v62 hlsAsset:v65];
          (*((void (**)(void *, void *, void, void))v4 + 2))(v4, v63, 0, 0);
LABEL_68:

          int v22 = v62;
LABEL_69:

          goto LABEL_70;
        }
        if (v35)
        {
          if ([v5 prefersVideoContent]) {
            long long v42 = @"video";
          }
          else {
            long long v42 = @"audio";
          }
          uint64_t v43 = [v5 preferredAudioAssetType];
          if ((unint64_t)(v43 - 1) > 4) {
            long long v44 = @"Unspecified";
          }
          else {
            long long v44 = off_2643C1518[v43 - 1];
          }
          *(_DWORD *)buf = 138543875;
          v84 = self;
          __int16 v85 = 2114;
          *(void *)v86 = v42;
          *(_WORD *)&v86[8] = 2113;
          *(void *)&v86[10] = v44;
          _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Loading %{public}@ asset - Preferred audio: %{private}@", buf, 0x20u);
        }

        v63 = (void *)[objc_alloc(MEMORY[0x263F891E8]) initWithRequestContext:v66];
        objc_msgSend(v63, "setFollowUp:", objc_msgSend(v5, "isFollowUp"));
        [v63 setStoreSubscriptionAdamID:v12];
        [v14 setStoreSubscriptionAdamID:v12];
        if ([v16 isDelegatedLeaseSession])
        {
          long long v45 = [v10 personalizedStore];
          uint64_t v46 = [v45 cloudID];

          [v63 setStoreCloudID:v46];
          [v14 setStoreCloudID:v46];
          uint64_t v47 = [v10 universalStore];
          uint64_t v48 = [v47 purchasedAdamID];

          [v63 setStorePurchasedAdamID:v48];
          [v14 setStorePurchasedAdamID:v48];
          v49 = [v10 universalStore];
          v50 = [v49 universalCloudLibraryID];

          [v63 setCloudUniversalLibraryID:v50];
          [v14 setCloudUniversalLibraryID:v50];
          [v14 setRequestType:4];
        }
        else
        {
          [v14 setRequestType:2];
        }
        v51 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self subscriptionLeaseSession];
        v52 = [v51 leaseStatus];
        int v53 = [v52 hasOnlinePlaybackKeys];

        if (v53)
        {
          v61 = [MEMORY[0x263F12260] sharedCache];
          uint64_t v54 = [v61 cachedResponseForRequest:v14];
          v55 = (void *)v54;
          if (v54)
          {
            v56 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v54 assetLoadProperties:v5 source:3 error:0];
          }
          else
          {
            v56 = 0;
          }
          if ([v56 hasValidAsset])
          {
            v57 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v84 = self;
              __int16 v85 = 2114;
              *(void *)v86 = v55;
              _os_log_impl(&dword_21BB87000, v57, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
            }

            (*((void (**)(void *, void *, void, void))v4 + 2))(v4, v56, 0, 0);
            goto LABEL_68;
          }
        }
        v58 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v84 = self;
          _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing subscription playback request...", buf, 0xCu);
        }

        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_19;
        v76[3] = &unk_2643C14F8;
        v76[4] = self;
        id v77 = v14;
        id v78 = v4;
        v59 = [v16 performPlaybackRequest:v63 completionHandler:v76];
        objc_initWeak((id *)buf, self);
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2;
        v73[3] = &unk_2643C1F60;
        objc_copyWeak(&v75, (id *)buf);
        id v60 = v59;
        id v74 = v60;
        [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self setCancellationHandler:v73];

        objc_destroyWeak(&v75);
        objc_destroyWeak((id *)buf);

        goto LABEL_68;
      }
      char v16 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPCModelGenericAVItemSubscriptionAssetLoadOperation.m", 250, @"Invalid operation type: %li", -[MPCModelGenericAVItemSubscriptionAssetLoadOperation operationType](self, "operationType"));
    }
LABEL_70:

    goto LABEL_71;
  }
  id v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v84 = self;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Short-circuiting Item Subscription Asset Loading [offline] - SOD/Cached Response/Server requests are unusable", buf, 0xCu);
  }

  BOOL v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:56 userInfo:0];
  (*((void (**)(void *, void, void, void *))v4 + 2))(v4, 0, 0, v10);
LABEL_71:
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 312);
  id v11 = v7;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, a2, a3);
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v8 + 312);
  }
  else
  {
    BOOL v10 = 0;
  }
  *(void *)(v8 + 312) = 0;

  [*(id *)(a1 + 32) finishWithError:v11];
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) setCancellationHandler:0];
  if (v9)
  {
    BOOL v10 = (void *)MEMORY[0x263F087E8];
    id v11 = [MEMORY[0x263F087E8] errorForICError:v9 response:v7];
    uint64_t v12 = objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 15, v11, @"Failed to send subscription playback request (lease)");

    uint64_t v13 = 0;
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v20 = 0;
    uint64_t v13 = [v14 _handlePlaybackResponse:v7 withPlaybackCacheRequest:v15 error:&v20];
    uint64_t v12 = (uint64_t)v20;
  }
  char v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    id v24 = v7;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished subscription playback request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  if (!(v13 | v12))
  {
    BOOL v18 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[MPCModelGenericAVItemSubscriptionAssetLoadOperation execute]_block_invoke"];
    [v18 handleFailureInFunction:v19 file:@"MPCModelGenericAVItemSubscriptionAssetLoadOperation.m" lineNumber:186 description:@"An error is expected for the failure to create a loadResult"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Canceling subscription playback request...", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(a1 + 32) cancel];
  }
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) setCancellationHandler:0];
  if (v9)
  {
    BOOL v10 = (void *)MEMORY[0x263F087E8];
    id v11 = [MEMORY[0x263F087E8] errorForICError:v9 response:v7];
    uint64_t v12 = objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 15, v11, @"Failed to send subscription playback request (accountless stream)");

    uint64_t v13 = 0;
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v20 = 0;
    uint64_t v13 = [v14 _handlePlaybackResponse:v7 withPlaybackCacheRequest:v15 error:&v20];
    uint64_t v12 = (uint64_t)v20;
  }
  char v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    id v24 = v7;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished subscription accountless playback request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  if (!(v13 | v12))
  {
    BOOL v18 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[MPCModelGenericAVItemSubscriptionAssetLoadOperation execute]_block_invoke"];
    [v18 handleFailureInFunction:v19 file:@"MPCModelGenericAVItemSubscriptionAssetLoadOperation.m" lineNumber:235 description:@"An error is expected for the failure to create a loadResult"];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62__MPCModelGenericAVItemSubscriptionAssetLoadOperation_execute__block_invoke_2_37(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Canceling subscription accountless playback request...", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(a1 + 32) cancel];
  }
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
  [(MPAsyncOperation *)&v5 cancel];
  uint64_t v3 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self cancellationHandler];
  int v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (id)description
{
  uint64_t v3 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)self assetLoadProperties];
  int v4 = [v3 isFollowUp];

  if (v4)
  {
    objc_super v5 = [NSString stringWithFormat:@"<%@: %p followUp>", objc_opt_class(), self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
    objc_super v5 = [(MPCModelGenericAVItemSubscriptionAssetLoadOperation *)&v7 description];
  }

  return v5;
}

- (MPCModelGenericAVItemSubscriptionAssetLoadOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCModelGenericAVItemSubscriptionAssetLoadOperation;
  uint64_t v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItemSubscriptionAssetLoadOperation.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end