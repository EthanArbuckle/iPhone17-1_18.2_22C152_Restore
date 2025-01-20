@interface MPCModelGenericAVItemMediaRedownloadOperation
- (ICStoreRequestContext)requestContext;
- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties;
- (MPCModelGenericAVItemMediaRedownloadOperation)init;
- (id)responseHandler;
- (void)cancel;
- (void)execute;
- (void)setAssetLoadProperties:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPCModelGenericAVItemMediaRedownloadOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
  objc_storeStrong((id *)&self->_mediaDownloadRequest, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
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

- (void)setAssetLoadProperties:(id)a3
{
}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)execute
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke;
  aBlock[3] = &unk_2643C3DD8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = [(MPCModelGenericAVItemMediaRedownloadOperation *)self assetLoadProperties];
  v5 = [(MPCModelGenericAVItemMediaRedownloadOperation *)self requestContext];
  if (v5)
  {
    v6 = [v4 storeAsset];
    v7 = [v6 redownloadParameters];
    if (![v7 length])
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v51 = self;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing redownload parameters.", buf, 0xCu);
      }

      v19 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 25, @"Missing redownload parameters");
      (*((void (**)(void *, void, void, void *))v3 + 2))(v3, 0, 0, v19);
      goto LABEL_33;
    }
    uint64_t v8 = [v6 endpointType];
    BOOL v9 = v8 == 2;
    v10 = (Class *)0x263F89190;
    if (v8 != 2) {
      v10 = (Class *)0x263F89278;
    }
    v42 = (void *)[objc_alloc(*v10) initWithRequestContext:v5 redownloadParametersString:v7];
    [v42 setUsePrioritizedURLSession:1];
    id v11 = objc_alloc_init(MEMORY[0x263F12268]);
    objc_msgSend(v11, "setAccountID:", objc_msgSend(v4, "accountID"));
    objc_msgSend(v11, "setDelegatedAccountID:", objc_msgSend(v4, "delegatedAccountID"));
    [v11 setRequestType:v9];
    [v11 setRedownloadParameters:v7];
    v12 = [MEMORY[0x263F12260] sharedCache];
    v13 = [v12 cachedResponseForRequest:v11];
    v14 = v13;
    if (v13)
    {
      v13 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v13 assetLoadProperties:v4 source:3 error:0];
    }
    v41 = v13;
    if ([v13 hasValidAsset])
    {
      v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = self;
        __int16 v52 = 2114;
        v53 = v14;
        _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing cached playback response: %{public}@", buf, 0x16u);
      }

      v16 = v41;
      (*((void (**)(void *, void *, void, void))v3 + 2))(v3, v41, 0, 0);
      goto LABEL_38;
    }
    v39 = v14;
    v40 = v12;
    v20 = [MEMORY[0x263F89108] currentDeviceInfo];
    if ([v20 isAudioAccessory])
    {
    }
    else
    {
      v21 = [MEMORY[0x263F89108] currentDeviceInfo];
      int v22 = [v21 isAppleTV];

      if (!v22)
      {
LABEL_29:
        v29 = [MEMORY[0x263F89110] sharedMonitor];
        char v30 = [v29 isRemoteServerLikelyReachable];

        if ((v30 & 1) == 0)
        {
          v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          v14 = v39;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v51 = self;
            _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Skipping redownload asset request [offline]", buf, 0xCu);
          }

          v36 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 56, @"No network connection");
          (*((void (**)(void *, void, void, void *))v3 + 2))(v3, 0, 0, v36);

          v12 = v40;
          goto LABEL_37;
        }
        [v42 setPlaybackRequest:1];
        v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = self;
          _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Performing media redownload request...", buf, 0xCu);
        }

        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_13;
        block[3] = &unk_2643C5EE8;
        block[4] = self;
        id v48 = v42;
        id v33 = v42;
        dispatch_barrier_async(accessQueue, block);
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_2;
        v43[3] = &unk_2643C3E00;
        v43[4] = self;
        id v44 = v4;
        id v45 = v11;
        id v46 = v3;
        id v34 = v11;
        [v33 performRequestWithResponseHandler:v43];

        v19 = v40;
LABEL_33:

LABEL_39:
        goto LABEL_40;
      }
    }
    v23 = [v4 itemIdentifiers];
    v24 = [v23 universalStore];
    uint64_t v25 = [v24 subscriptionAdamID];

    if (v25)
    {
      id v26 = objc_alloc_init(MEMORY[0x263F12268]);
      objc_msgSend(v26, "setAccountID:", objc_msgSend(v4, "accountID"));
      objc_msgSend(v26, "setDelegatedAccountID:", objc_msgSend(v4, "delegatedAccountID"));
      [v26 setStoreSubscriptionAdamID:v25];
      [v26 setRequestType:2];
      v12 = v40;
      uint64_t v27 = [v40 cachedResponseForRequest:v26];
      v38 = (void *)v27;
      if (v27)
      {
        v28 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v27 assetLoadProperties:v4 source:3 error:0];
      }
      else
      {
        v28 = 0;
      }
      if ([v28 hasValidAsset])
      {
        log = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          v53 = v39;
          _os_log_impl(&dword_21BB87000, log, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Using existing subscription cached playback response despite redownload request: %{public}@", buf, 0x16u);
        }

        (*((void (**)(void *, void *, void, void))v3 + 2))(v3, v28, 0, 0);
        v14 = v39;
LABEL_37:
        v16 = v41;
LABEL_38:

        goto LABEL_39;
      }
    }
    goto LABEL_29;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v51 = self;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing store request context.", buf, 0xCu);
  }

  v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 26, @"Missing store request context");
  (*((void (**)(void *, void, void, void *))v3 + 2))(v3, 0, 0, v6);
LABEL_40:
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[38];
  id v12 = v7;
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v9 + 16))(v9, a2, a3, v7);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 304);
    *(void *)(v10 + 304) = 0;

    id v7 = v12;
    uint64_t v8 = *(void **)(a1 + 32);
  }
  [v8 finishWithError:v7];
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_13(uint64_t a1)
{
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = a1[4];
  id v11 = *(NSObject **)(v10 + 272);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_3;
  block[3] = &unk_2643C5FC8;
  block[4] = v10;
  dispatch_barrier_async(v11, block);
  uint64_t v12 = [MEMORY[0x263F087E8] errorForICError:v9 response:v7];
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = a1[4];
    *(_DWORD *)buf = 138543874;
    uint64_t v55 = v14;
    __int16 v56 = 2114;
    os_log_t v57 = v7;
    __int16 v58 = 2114;
    id v59 = v9;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Finished media redownload request with response: %{public}@, error: %{public}@", buf, 0x20u);
  }

  v15 = [v7 items];
  v16 = [v15 firstObject];

  if (v16)
  {
    uint64_t v41 = v12;
    id v44 = v9;
    id v46 = a1;
    id v45 = v8;
    os_log_t v17 = (os_log_t)objc_alloc_init(MEMORY[0x263F120E0]);
    v18 = [v16 assetExpirationDate];
    [v17 setExpirationDate:v18];

    v19 = [v16 suzeLeaseID];
    [v17 setSuzeLeaseID:v19];

    v20 = [v7 dialog];
    v21 = [v20 responseDictionary];
    [v17 setDialogDictionary:v21];

    int v22 = [v16 fileAssets];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v28)
          {
            if (!v25) {
              uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v22, "count"));
            }
            objc_msgSend(v25, "addObject:", v28, v41);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v24);
    }
    else
    {
      uint64_t v25 = 0;
    }
    -[NSObject setFileAssetInfoList:](v17, "setFileAssetInfoList:", v25, v41);
    v32 = [v16 hlsAsset];
    if (v32)
    {
      id v33 = (void *)[objc_alloc(MEMORY[0x263F12288]) initWithiTunesCloudStoreHLSAssetInfo:v32];
      [v17 setHlsAssetInfo:v33];
    }
    uint64_t v34 = v46[5];
    id v47 = v42;
    char v30 = +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:v17 assetLoadProperties:v34 source:6 error:&v47];
    id v31 = v47;

    if ([v30 allowsAssetInfoCaching])
    {
      v35 = [MEMORY[0x263F12260] sharedCache];
      [v35 addCachedResponse:v17 forRequest:v46[6]];
    }
    id v8 = v45;
    if (!v30)
    {
      if (!v31)
      {
        v43 = [MEMORY[0x263F08690] currentHandler];
        v40 = [NSString stringWithUTF8String:"-[MPCModelGenericAVItemMediaRedownloadOperation execute]_block_invoke"];
        [v43 handleFailureInFunction:v40 file:@"MPCModelGenericAVItemMediaRedownloadOperation.m" lineNumber:167 description:@"An error is expected for the failure to create a loadResult"];
      }
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = v46[4];
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v37;
        __int16 v56 = 2114;
        os_log_t v57 = v17;
        __int16 v58 = 2114;
        id v59 = v31;
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Unable to extract valid load result from extracted media redownload asset response - Response:%{public}@ - Error:%{public}@", buf, 0x20u);
      }
    }
    id v9 = v44;
    a1 = v46;
  }
  else
  {
    os_log_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v29;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing response item in media redownload request response", buf, 0xCu);
    }
    char v30 = 0;
    id v31 = (id)v12;
  }

  if (([v30 hasValidAsset] & 1) == 0 && !v31)
  {
    v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v55 = v39;
      _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Missing asset URL in media redownload request response", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 15, @"Missing asset URL in media redownload request response");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[7] + 16))();
}

void __56__MPCModelGenericAVItemMediaRedownloadOperation_execute__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 280);
  *(void *)(v1 + 280) = 0;
}

- (void)cancel
{
  v11.receiver = self;
  v11.super_class = (Class)MPCModelGenericAVItemMediaRedownloadOperation;
  [(MPAsyncOperation *)&v11 cancel];
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__24017;
  id v9 = __Block_byref_object_dispose__24018;
  id v10 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__MPCModelGenericAVItemMediaRedownloadOperation_cancel__block_invoke;
  v4[3] = &unk_2643C67A0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  [(id)v6[5] cancel];
  _Block_object_dispose(&v5, 8);
}

void __55__MPCModelGenericAVItemMediaRedownloadOperation_cancel__block_invoke(uint64_t a1)
{
}

- (MPCModelGenericAVItemMediaRedownloadOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCModelGenericAVItemMediaRedownloadOperation;
  v2 = [(MPAsyncOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItemMediaRedownloadOperation.accessQueue", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end