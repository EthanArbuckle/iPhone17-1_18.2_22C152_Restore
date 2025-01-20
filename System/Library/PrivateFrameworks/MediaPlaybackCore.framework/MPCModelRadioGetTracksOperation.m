@interface MPCModelRadioGetTracksOperation
- (MPCModelRadioGetTracksOperation)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4 radioQueueFeeder:(id)a5;
- (id)_cacheTracksForStep:(id)a3;
- (id)completionHandler;
- (void)_runStep:(id)a3 withFinishHandler:(id)a4;
- (void)execute;
- (void)setCompletionHandler:(id)a3;
@end

@implementation MPCModelRadioGetTracksOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)_runStep:(id)a3 withFinishHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    radioQueueFeederPointerForLogging = self->_radioQueueFeederPointerForLogging;
    *(_DWORD *)buf = 134218498;
    v16 = radioQueueFeederPointerForLogging;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "RQF %p [GTO %p]: _runStep: [performWithCompletionHandler] step=%{public}@", buf, 0x20u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__MPCModelRadioGetTracksOperation__runStep_withFinishHandler___block_invoke;
  v12[3] = &unk_2643C3E50;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v11 performWithCompletionHandler:v12];
}

void __62__MPCModelRadioGetTracksOperation__runStep_withFinishHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(v5 + 288);
    *(_DWORD *)buf = 134219010;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v36 = v6;
    LOWORD(v37) = 2114;
    *(void *)((char *)&v37 + 2) = v3;
    WORD5(v37) = 1024;
    HIDWORD(v37) = [v3 isFinished];
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "RQF %p [GTO %p]: _runStep: [completed] step=%{public}@ nextStep=%{public}@ nextStepIsFinished=%{BOOL}u", buf, 0x30u);
  }

  if ([v3 isFinished])
  {
    v8 = [v3 error];
    v9 = [v3 response];
    id v10 = v9;
    if (v9)
    {
      BOOL v11 = [v9 tracklistActionType] != 1;
      v12 = [*(id *)(a1 + 32) _cacheTracksForStep:v3];
      id v34 = objc_alloc_init(MEMORY[0x263F120D8]);
      id v13 = *(id *)(*(void *)(a1 + 32) + 272);
      id v14 = [v10 stationMetadata];
      v33 = v13;
      if (v14)
      {
        v15 = (void *)MEMORY[0x263F12180];
        uint64_t v16 = *MEMORY[0x263F11770];
        *(void *)buf = *MEMORY[0x263F11710];
        *(void *)&buf[8] = v16;
        uint64_t v17 = *MEMORY[0x263F11720];
        *(void *)&buf[16] = *MEMORY[0x263F11718];
        uint64_t v36 = v17;
        uint64_t v18 = *MEMORY[0x263F11798];
        *(void *)&long long v37 = *MEMORY[0x263F117A0];
        *((void *)&v37 + 1) = v18;
        uint64_t v19 = *MEMORY[0x263F11780];
        uint64_t v38 = *MEMORY[0x263F11790];
        uint64_t v39 = v19;
        uint64_t v40 = *MEMORY[0x263F11778];
        [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:9];
        id v20 = v32 = v14;
        uint64_t v21 = [v15 propertySetWithProperties:v20];

        v22 = [[MPCModelRadioStationBuilder alloc] initWithRequestedProperties:v21];
        [v13 requestContext];
        BOOL v31 = v11;
        v23 = v12;
        v25 = v24 = v8;
        v26 = [v25 identity];
        v27 = [(MPCModelRadioStationBuilder *)v22 modelRadioStationForMetadata:v32 userIdentity:v26];

        v8 = v24;
        v12 = v23;
        BOOL v11 = v31;

        id v14 = v32;
      }
      else
      {
        id v30 = objc_alloc(MEMORY[0x263F11FD8]);
        uint64_t v21 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
        v27 = (void *)[v30 initWithIdentifiers:v21 block:&__block_literal_global_24060];
      }

      [v34 appendSection:v27];
      if (v12) {
        [v34 appendItems:v12];
      }
      v28 = [v10 performanceMetrics];
      v29 = [[MPCModelRadioGetTracksResponse alloc] initWithTracks:v34 tracklistAction:v11];
    }
    else
    {
      v28 = 0;
      v29 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) _runStep:v3 withFinishHandler:*(void *)(a1 + 48)];
  }
}

- (id)_cacheTracksForStep:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 response];
  uint64_t v5 = [v4 tracks];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F892B8] flattenedTracksWithTracks:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v3 delegatedIdentityProperties];
  v35 = v3;
  v33 = [v3 identityProperties];
  v8 = [v33 DSID];
  uint64_t v39 = [v8 unsignedLongLongValue];

  id v34 = v7;
  v9 = [v7 DSID];
  uint64_t v38 = [v9 unsignedLongLongValue];

  uint64_t v40 = [MEMORY[0x263F12260] sharedCache];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v6;
  uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v41)
  {
    uint64_t v37 = *(void *)v56;
    unint64_t v10 = 0x263EFF000uLL;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v11;
        v12 = *(void **)(*((void *)&v55 + 1) + 8 * v11);
        id v13 = objc_alloc_init(MEMORY[0x263F12268]);
        [v13 setAccountID:v39];
        [v13 setRequestType:3];
        objc_msgSend(v13, "setStoreRadioAdamID:", objc_msgSend(v12, "storeAdamID"));
        v44 = v13;
        [v13 setDelegatedAccountID:v38];
        id v14 = objc_alloc_init(MEMORY[0x263F120E0]);
        if ([v12 trackType] == 4) {
          [v14 setLiveRadioStream:1];
        }
        v46 = v14;
        v15 = [v12 fileAssets];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v52 != v19) {
                objc_enumerationMutation(v15);
              }
              uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:*(void *)(*((void *)&v51 + 1) + 8 * i)];
              if (v21)
              {
                if (!v18) {
                  uint64_t v18 = objc_msgSend(objc_alloc(*(Class *)(v10 + 2432)), "initWithCapacity:", objc_msgSend(v15, "count"));
                }
                [v18 addObject:v21];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v17);
        }
        else
        {
          uint64_t v18 = 0;
        }
        [v46 setFileAssetInfoList:v18];
        v43 = [v12 expirationDate];
        uint64_t v22 = [v12 hlsAsset];
        if (v22)
        {
          v23 = (void *)[objc_alloc(MEMORY[0x263F12288]) initWithiTunesCloudStoreHLSAssetInfo:v22];
          [v46 setHlsAssetInfo:v23];
        }
        v42 = (void *)v22;
        id v24 = objc_alloc_init(*(Class *)(v10 + 2432));
        v25 = [v12 radioStreamAssets];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v48 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = (void *)[objc_alloc(MEMORY[0x263F122F8]) initWithiTunesCloudStoreRadioStreamAssetInfo:*(void *)(*((void *)&v47 + 1) + 8 * j)];
              if (v30) {
                [v24 addObject:v30];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v59 count:16];
          }
          while (v27);
        }
        if ([v24 count]) {
          [v46 setRadioStreamAssetInfoList:v24];
        }
        unint64_t v10 = 0x263EFF000;
        BOOL v31 = v43;
        if (![v18 count])
        {

          BOOL v31 = 0;
        }
        [v46 setExpirationDate:v31];
        [v40 addCachedResponse:v46 forRequest:v44];

        uint64_t v11 = v45 + 1;
      }
      while (v45 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v41);
  }

  return obj;
}

- (void)execute
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = MPSharedBackgroundTaskProvider();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__MPCModelRadioGetTracksOperation_execute__block_invoke;
  v9[3] = &unk_2643C57E0;
  v9[4] = &v10;
  uint64_t v4 = [v3 beginTaskWithName:@"com.apple.MediaPlaybackCore.MPCModelRadioGetTracksOperation" expirationHandler:v9];

  v11[3] = v4;
  uint64_t v5 = [(ICRadioGetTracksRequest *)self->_request reasonType];
  uint64_t v6 = off_2643BCC78;
  if (v5 != 1) {
    uint64_t v6 = off_2643BCC80;
  }
  uint64_t v7 = (void *)[objc_alloc(*v6) initWithGetTracksRequest:self->_request siriAssetInfo:self->_siriAssetInfo];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__MPCModelRadioGetTracksOperation_execute__block_invoke_2;
  v8[3] = &unk_2643C3E28;
  v8[4] = self;
  v8[5] = &v10;
  [(MPCModelRadioGetTracksOperation *)self _runStep:v7 withFinishHandler:v8];

  _Block_object_dispose(&v10, 8);
}

void __42__MPCModelRadioGetTracksOperation_execute__block_invoke(uint64_t a1)
{
  v2 = MPSharedBackgroundTaskProvider();
  [v2 endTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *MEMORY[0x263F54E88];
}

void __42__MPCModelRadioGetTracksOperation_execute__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v17 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = v12[37];
  if (v13)
  {
    (*(void (**)(void, id, id, id))(v13 + 16))(v12[37], v9, v10, v11);
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 296);
    *(void *)(v14 + 296) = 0;

    uint64_t v12 = *(void **)(a1 + 32);
  }
  [v12 finishWithError:v11];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *MEMORY[0x263F54E88])
  {
    uint64_t v16 = MPSharedBackgroundTaskProvider();
    [v16 endTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
}

- (MPCModelRadioGetTracksOperation)initWithGetTracksRequest:(id)a3 siriAssetInfo:(id)a4 radioQueueFeeder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPCModelRadioGetTracksOperation;
  id v11 = [(MPAsyncOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    request = v11->_request;
    v11->_request = (ICRadioGetTracksRequest *)v12;

    uint64_t v14 = [v9 copy];
    siriAssetInfo = v11->_siriAssetInfo;
    v11->_siriAssetInfo = (NSString *)v14;

    v11->_radioQueueFeederPointerForLogging = v10;
  }

  return v11;
}

@end