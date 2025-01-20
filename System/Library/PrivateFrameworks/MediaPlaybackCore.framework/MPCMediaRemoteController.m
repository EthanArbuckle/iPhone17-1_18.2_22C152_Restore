@interface MPCMediaRemoteController
+ (BOOL)_shouldRegisterForNotifications;
+ (OS_dispatch_queue)mediaRemoteReplyQueue;
+ (id)controllerForPlayerPath:(id)a3;
+ (void)_sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 toPlayerPath:(id)a6 completion:(id)a7;
+ (void)_sendCommand:(unsigned int)a3 playbackIntent:(id)a4 options:(id)a5 toPlayerPath:(id)a6 completion:(id)a7;
+ (void)sendCommand:(unsigned int)a3 options:(id)a4 toPlayerPath:(id)a5 completion:(id)a6;
- (CGSize)overlayScaledFittingSizeForCatalog:(id)a3 scaledFittingSize:(CGSize)result;
- (MPCFuture)playbackQueueParticipants;
- (MPCFuture)playbackState;
- (MPCFuture)supportedCommands;
- (MPCPlayerPath)resolvedPlayerPath;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)calloutQueue;
- (id)_artworkCatalogBlockForContentItem:(id)a3;
- (id)_createExportableArtworkPropertiesForContentItem:(id)a3;
- (id)_init;
- (id)_legacyCommands;
- (id)_onQueue_identifiersForRange:(_MSVSignedRange)a3;
- (id)_onQueue_playbackQueueForRange:(_MSVSignedRange)a3;
- (id)_onQueue_setOptimisticElapsedTimeForContentItem:(id)a3 elapsedTime:(double)a4 rate:(float)a5;
- (id)_onQueue_setOptimisticPlaybackState:(unsigned int)a3 withOptions:(id)a4;
- (id)_onQueue_stateDictionary;
- (id)_onQueue_updateOptimisticStateForCommand:(unsigned int)a3 options:(id)a4;
- (id)_requestPropertiesDescriptionForRequest:(void *)a3;
- (id)artworkCatalogBlockForContentItem:(id)a3;
- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5;
- (id)contentItemForIdentifier:(id)a3;
- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6;
- (id)invalidationToken;
- (id)mediaRemoteArtworkDataSource;
- (id)overlayVisualIdenticalityForCatalog:(id)a3;
- (id)playbackQueueForRequest:(void *)a3;
- (id)remoteArtworkDataSource;
- (int64_t)contentItemArtworkCacheStateForArtworkIdentifier:(id)a3 size:(CGSize)a4;
- (int64_t)contentItemCacheStateForIdentifier:(id)a3;
- (int64_t)playbackQueueParticipantsCacheState;
- (int64_t)playbackStateCacheState;
- (int64_t)supportedCommandsCacheState;
- (void)_contentItemArtworkChangedNotification:(id)a3;
- (void)_onQueue_invalidateArtworkFuturesForContentItemID:(id)a3;
- (void)_onQueue_mergeContentItems:(id)a3;
- (void)_onQueue_mergeContentItems:(id)a3 queueRange:(_MSVSignedRange)a4 requestRange:(_MSVSignedRange)a5 requestProperties:(id)a6;
- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3;
- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4;
- (void)_onQueue_purgeContentItemIdentifierForProperties:(id)a3;
- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 afterContentItemIdentifier:(id)a4;
- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 beforeContentItemIdentifier:(id)a4;
- (void)_playbackQueueChangedNotification:(id)a3;
- (void)_playbackQueueContentItemsChangedNotification:(id)a3;
- (void)_playbackQueueParticipantsDidChangeNotification:(id)a3;
- (void)_playbackStateDidChangeNotification:(id)a3;
- (void)_supportedCommandsDidChangeNotification:(id)a3;
- (void)artworkCatalog:(id)a3 didClearFromView:(id)a4;
- (void)artworkCatalog:(id)a3 didConfigureView:(id)a4 withRepresentation:(id)a5;
- (void)artworkCatalog:(id)a3 willConfigureView:(id)a4;
- (void)dealloc;
- (void)dictionary:(id)a3 willRemoveObject:(id)a4 forKey:(id)a5;
- (void)invalidateAllTokens;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5;
- (void)setAccessQueue:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setInvalidationToken:(id)a3;
- (void)setResolvedPlayerPath:(id)a3;
@end

@implementation MPCMediaRemoteController

- (id)contentItemForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__22508;
  v16 = __Block_byref_object_dispose__22509;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke;
  block[3] = &unk_2643C4648;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __41__MPCMediaRemoteController_playbackState__block_invoke_3(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

- (MPCFuture)playbackQueueParticipants
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22508;
  id v10 = __Block_byref_object_dispose__22509;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

- (MPCFuture)supportedCommands
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22508;
  id v10 = __Block_byref_object_dispose__22509;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__MPCMediaRemoteController_supportedCommands__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

- (id)playbackQueueForRequest:(void *)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"<MPCMediaRemoteController: %p>", self);
  MRPlaybackQueueRequestSetLabel();
  v5 = [(MPCMediaRemoteController *)self _requestPropertiesDescriptionForRequest:a3];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__22508;
  uint64_t v14 = __Block_byref_object_dispose__22509;
  id v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke;
  block[3] = &unk_2643C3610;
  block[4] = self;
  void block[5] = v5;
  block[6] = &v10;
  block[7] = a3;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_requestPropertiesDescriptionForRequest:(void *)a3
{
  return (id)[a3 requestProperties];
}

- (MPCFuture)playbackState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22508;
  uint64_t v10 = __Block_byref_object_dispose__22509;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__MPCMediaRemoteController_playbackState__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MPCFuture *)v3;
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_3(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = a1[4];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEBUG, "MRC: Resolved player path %@ (resolved = %@)", (uint8_t *)&v8, 0x16u);
  }

  [v3 mediaRemotePlayerPath];
  uint64_t v6 = off_2643BCC40;
  if ((MRNowPlayingPlayerPathIsLocal() & 1) == 0)
  {
    [v3 mediaRemotePlayerPath];
    if (!MRNowPlayingPlayerPathGetIsResolved()) {
      uint64_t v6 = off_2643BD630;
    }
  }
  id v7 = (void *)[objc_alloc(*v6) _init];
  [v7 setInvalidationToken:a1[5]];
  [v7 setResolvedPlayerPath:v3];
  [*(id *)(*(void *)(a1[6] + 8) + 40) finishWithValue:v7];
}

- (void)setResolvedPlayerPath:(id)a3
{
}

- (void)setInvalidationToken:(id)a3
{
}

void __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    if (![v2 isInvalid]) {
      goto LABEL_7;
    }
    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  [v2 disconnect];
  id v3 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  [*(id *)(*(void *)(a1 + 32) + 56) setDebugLabel:@"playbackQueueParticipants [was nil before]"];
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = (void *)MEMORY[0x263F54908];
    id v7 = [MEMORY[0x263F54910] defaultRequest];
    int v8 = [*(id *)(a1 + 32) resolvedPlayerPath];
    uint64_t v9 = [v8 mediaRemotePlayerPath];
    v16[0] = MEMORY[0x263EF8330];
    long long v10 = *(_OWORD *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v16[1] = 3221225472;
    v16[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_2;
    v16[3] = &unk_2643C3570;
    long long v17 = v10;
    [v6 fetchParticipantsWithRequest:v7 forPlayerPath:v9 queue:v11 completion:v16];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    long long v12 = *(_OWORD *)(a1 + 32);
    v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v14[1] = 3221225472;
    v14[2] = __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_3;
    v14[3] = &unk_2643C67A0;
    long long v15 = v12;
    dispatch_async(v13, v14);
  }
LABEL_7:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 56));
}

void __45__MPCMediaRemoteController_supportedCommands__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v6 == *(void **)(v5 + 40))
    {
      *(void *)(v5 + 48) = 0;
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 finishWithError:a3];
  }
  else
  {
    id v9 = a2;
    if ([v9 count])
    {
      long long v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, objc_msgSend(v9, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(const void **)(*((void *)&v24 + 1) + 8 * i);
            int v17 = MEMORY[0x21D49D090](v16);
            NSMapInsert(v10, (const void *)(v17 | 0x80000000), v16);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v13);
      }

      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "finishWithValue:", v10, (void)v24);
    }
    else
    {
      v18 = [*(id *)(a1 + 32) resolvedPlayerPath];
      int v19 = [v18 isInProcess];

      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      if (v19)
      {
        [*(id *)(v20 + 40) finishWithValue:MEMORY[0x263EFFA78]];
      }
      else
      {
        v22 = [*(id *)(a1 + 32) _legacyCommands];
        [v21 finishWithValue:v22];
      }
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == *(void *)(v23 + 40)) {
      *(void *)(v23 + 48) = 1;
    }
  }
}

- (id)_artworkCatalogBlockForContentItem:(id)a3
{
  id v4 = a3;
  if ([(MPCPlayerPath *)self->_resolvedPlayerPath isInProcess])
  {
    id v5 = [(MPCPlayerPath *)self->_resolvedPlayerPath playerID];
    uint64_t v6 = [MEMORY[0x263F12118] infoCenterForPlayerID:v5];
    if ([v6 supportsArtworkCatalogLoading])
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke;
      aBlock[3] = &unk_2643C3748;
      id v17 = v6;
      id v18 = v4;
      id v7 = v4;
      id v8 = v6;
      id v9 = _Block_copy(aBlock);
      long long v10 = _Block_copy(v9);

      goto LABEL_6;
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_2;
  v13[3] = &unk_2643C3748;
  id v14 = v4;
  long long v15 = self;
  id v5 = v4;
  id v11 = _Block_copy(v13);
  long long v10 = _Block_copy(v11);

  id v8 = v14;
LABEL_6:

  return v10;
}

- (MPCPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

void __41__MPCMediaRemoteController_playbackState__block_invoke_2(uint64_t a1, int a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MPCMediaRemoteController_playbackState__block_invoke_3;
  aBlock[3] = &__block_descriptor_36_e5_I8__0l;
  int v8 = a2;
  id v5 = _Block_copy(aBlock);
  [v4 finishWithValue:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == *(void *)(v6 + 24)) {
    *(void *)(v6 + 32) = 1;
  }
}

void __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6 == *(void **)(v7 + 56))
    {
      *(void *)(v7 + 64) = 0;
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 56);
      *(void *)(v8 + 56) = 0;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 finishWithError:v5];
  }
  else
  {
    if (v12) {
      id v10 = v12;
    }
    else {
      id v10 = (id)MEMORY[0x263EFFA68];
    }
    [v6 finishWithValue:v10];
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == *(void *)(v11 + 56)) {
      *(void *)(v11 + 64) = 1;
    }
  }
}

void __55__MPCMediaRemoteController__onQueue_mergeContentItems___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = MRContentItemGetIdentifier();
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "pokeKey:", v8, (void)v13);
        if ((MRContentItemIsEmpty() & 1) == 0)
        {
          id v9 = [*(id *)(*(void *)(a1 + 40) + 112) objectForKeyedSubscript:v8];
          id v10 = (void *)[v9 copy];

          if (v10)
          {
            id v11 = v10;
            [v11 _mediaRemoteContentItem];
            MRContentItemMerge();
          }
          else
          {
            id v11 = (id)[objc_alloc(MEMORY[0x263F120F8]) _initWithMediaRemoteContentItem:v7];
          }
          id v12 = [*(id *)(*(void *)(a1 + 40) + 128) objectForKeyedSubscript:v8];
          if (v12)
          {
            [v11 _mediaRemoteContentItem];
            [v12 _mediaRemoteContentItem];
            MRContentItemMerge();
          }
          [*(id *)(*(void *)(a1 + 40) + 112) setObject:v11 forKeyedSubscript:v8];
          [*(id *)(*(void *)(a1 + 40) + 128) setObject:0 forKeyedSubscript:v8];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __74__MPCMediaRemoteController__playbackQueueContentItemsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        uint64_t v8 = MRContentItemGetIdentifier();
        if (v8)
        {
          id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 112), "objectForKeyedSubscript:", v8, (void)v16);
          [*(id *)(*(void *)(a1 + 40) + 120) setObject:0 forKeyedSubscript:v8];
          if (v9)
          {
            id v10 = (id) [v9 copy];
            [v10 _mediaRemoteContentItem];
            MRContentItemMerge();
            [*(id *)(*(void *)(a1 + 40) + 112) setObject:v10 forKeyedSubscript:v8];
            id v11 = [*(id *)(*(void *)(a1 + 40) + 160) objectForKey:v8];
            [v11 invalidate];

            id v12 = [*(id *)(*(void *)(a1 + 40) + 160) objectForKey:v8];
            [v12 disconnect];

            [*(id *)(*(void *)(a1 + 40) + 160) removeObjectForKey:v8];
          }
          else
          {
            long long v13 = [*(id *)(*(void *)(a1 + 40) + 128) objectForKeyedSubscript:v8];
            if (v13)
            {
              id v10 = v13;
              [v10 _mediaRemoteContentItem];
              MRContentItemMerge();
            }
            else
            {
              long long v14 = (void *)[objc_alloc(MEMORY[0x263F120F8]) _initWithMediaRemoteContentItem:v7];
              long long v15 = (void *)[v14 copy];
              [*(id *)(*(void *)(a1 + 40) + 128) setObject:v15 forKeyedSubscript:v8];

              id v10 = 0;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_31(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(id)controllerForPlayerPath____playerPathControllers objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5 || [v5 isInvalid])
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v7;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEBUG, "MRC: Resolving player path %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) disconnect];
    uint64_t v8 = [MPCFuture alloc];
    uint64_t v9 = [(MPCFuture *)v8 initWithQueue:controllerForPlayerPath____playerPathControllersFutureQueue];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDebugLabel:@"controllerForPlayerPath"];
    [(id)controllerForPlayerPath____playerPathControllers setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
    id v12 = +[MPCPlayerPathCache sharedCache];
    long long v13 = [v12 resolvedPlayerPathForPlayerPath:*(void *)(a1 + 32)];

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_37;
    v28[3] = &unk_2643C67A0;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v29 = v14;
    uint64_t v30 = v15;
    long long v16 = [v13 onInvalid:v28];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_3;
    v24[3] = &unk_2643C3398;
    id v25 = *(id *)(a1 + 32);
    id v26 = v16;
    uint64_t v27 = *(void *)(a1 + 40);
    id v17 = v16;
    long long v18 = [v13 onSuccess:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_41;
    v22[3] = &unk_2643C33C0;
    long long v21 = *(_OWORD *)(a1 + 32);
    id v19 = (id)v21;
    long long v23 = v21;
    id v20 = (id)[v18 onFailure:v22];
  }
}

void __41__MPCMediaRemoteController_playbackState__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (![v2 isInvalid]) {
      return;
    }
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v2 disconnect];
  uint64_t v3 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  [*(id *)(*(void *)(a1 + 32) + 24) setDebugLabel:@"playbackState [was nil before]"];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = [*(id *)(a1 + 32) resolvedPlayerPath];
  [v6 mediaRemotePlayerPath];
  MRMediaRemoteGetPlaybackStateForPlayer();
}

void __45__MPCMediaRemoteController_supportedCommands__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2) {
    goto LABEL_4;
  }
  if ([v2 isInvalid])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
LABEL_4:
    [v2 disconnect];
    uint64_t v3 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [*(id *)(*(void *)(a1 + 32) + 40) setDebugLabel:@"supportedCommands [was nil before]"];
    uint64_t v6 = [*(id *)(a1 + 32) resolvedPlayerPath];
    [v6 mediaRemotePlayerPath];
    MRMediaRemoteGetSupportedCommandsForPlayer();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1 + 32) + 112) pokeKey:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v5)
  {
    if (![v5 isInvalid]) {
      return;
    }
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  [v5 disconnect];
  uint64_t v6 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [NSString stringWithFormat:@"contentItem - %@", *(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDebugLabel:v9];

  [*(id *)(*(void *)(a1 + 32) + 160) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    long long v13 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v13)
    {
      id v14 = (void *)[v12 copy];

      [v14 _mergeContentItem:v13];
      id v12 = v14;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishWithValue:v12];
  }
  else
  {
    v23[0] = *(void *)(a1 + 40);
    [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v15 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();
    MRPlaybackQueueRequestSetIncludeMetadata();
    MRPlaybackQueueRequestSetIncludeLanguageOptions();
    long long v16 = [*(id *)(a1 + 32) resolvedPlayerPath];
    uint64_t v17 = [v16 mediaRemotePlayerPath];
    long long v18 = dispatch_get_global_queue(21, 0);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_2;
    v21[3] = &unk_2643C3638;
    v21[4] = *(void *)(a1 + 32);
    long long v20 = *(_OWORD *)(a1 + 40);
    id v19 = (id)v20;
    long long v22 = v20;
    MEMORY[0x21D49D220](v15, v17, v18, v21);

    if (v15) {
      CFRelease(v15);
    }
  }
}

void __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke(uint64_t a1)
{
  uint64_t Range = MRPlaybackQueueRequestGetRange();
  uint64_t v4 = v3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKey:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKey:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v9)
  {
    if (![v9 isInvalid]) {
      goto LABEL_13;
    }
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  [v9 disconnect];
  uint64_t v10 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  long long v13 = NSString;
  id v14 = NSStringFromMSVSignedRange();
  uint64_t v15 = [v13 stringWithFormat:@"playbackQueueForRequest[%@]", v14];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDebugLabel:v15];

  long long v16 = *(void **)(*(void *)(a1 + 32) + 184);
  v41[0] = Range;
  v41[1] = v4;
  uint64_t v17 = [MEMORY[0x263F08D40] valueWithBytes:v41 objCType:"{_MSVSignedRange=qq}"];
  [v16 setObject:v17 forKey:*(void *)(a1 + 40)];

  long long v18 = *(void **)(*(void *)(a1 + 32) + 152);
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v40[0] = Range;
  v40[1] = v4;
  long long v20 = [MEMORY[0x263F08D40] valueWithBytes:v40 objCType:"{_MSVSignedRange=qq}"];
  [v18 setObject:v19 forKey:v20];

  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void *)(v21 + 88);
  if (Range >= v22
    && (uint64_t v23 = *(void *)(v21 + 96), Range - v22 < v23)
    && (v4 <= 1 ? (uint64_t v24 = 1) : (uint64_t v24 = v4), v5 && ~v22 + Range + v24 < v23))
  {
    id v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v26 = objc_msgSend((id)v21, "_onQueue_playbackQueueForRange:", Range, v4);
    [v25 finishWithValue:v26];
  }
  else
  {
    [*(id *)(v21 + 112) beginTransaction];
    uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:*(void *)(a1 + 40)];
    v28 = [v27 allObjects];
    MRPlaybackQueueRequestSetIdentifiers();

    MRPlaybackQueueRequestSetIncludeMetadata();
    MRPlaybackQueueRequestSetIncludeLanguageOptions();
    uint64_t v29 = *(void *)(a1 + 56);
    uint64_t v30 = [*(id *)(a1 + 32) resolvedPlayerPath];
    uint64_t v31 = [v30 mediaRemotePlayerPath];
    v35[0] = MEMORY[0x263EF8330];
    uint64_t v32 = *(void *)(a1 + 48);
    long long v33 = *(_OWORD *)(a1 + 32);
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8);
    v35[1] = 3221225472;
    v35[2] = __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke_2;
    v35[3] = &unk_2643C35E8;
    uint64_t v38 = Range;
    uint64_t v39 = v4;
    uint64_t v37 = v32;
    long long v36 = v33;
    MEMORY[0x21D49D220](v29, v31, v34, v35);
  }
LABEL_13:
}

+ (id)controllerForPlayerPath:(id)a3
{
  id v3 = a3;
  if (controllerForPlayerPath__onceToken != -1) {
    dispatch_once(&controllerForPlayerPath__onceToken, &__block_literal_global_28);
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__22508;
  uint64_t v15 = __Block_byref_object_dispose__22509;
  id v16 = 0;
  uint64_t v4 = controllerForPlayerPath____playerPathControllersQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_31;
  v8[3] = &unk_2643C67A0;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_supportedCommandsDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [v4 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  id v5 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v5 mediaRemotePlayerPath];
  int v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__MPCMediaRemoteController__supportedCommandsDidChangeNotification___block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

uint64_t __52__MPCMediaRemoteController_playbackQueueForRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t Range = MRPlaybackQueueGetRange();
  if (!v5)
  {
    uint64_t v13 = Range;
    uint64_t v14 = v7;
    if (v7 < 1
      || ((uint64_t v15 = *(void *)(a1 + 56), v15 <= 0) ? (v16 = *(void *)(a1 + 64) <= -v15) : (v16 = 1),
          v16
       || Range <= 0 && v7 > -Range
       || (objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 2000, @"PlaybackQueue Response failed to include now playing item"), (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0)))
    {
      uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 152);
      long long v29 = *(_OWORD *)(a1 + 56);
      long long v18 = [MEMORY[0x263F08D40] valueWithBytes:&v29 objCType:"{_MSVSignedRange=qq}"];
      id v5 = [v17 objectForKey:v18];

      uint64_t v10 = (void *)MRPlaybackQueueCopyContentItems();
      if (*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == v5) {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_mergeContentItems:queueRange:requestRange:requestProperties:", v10, v13, v14, *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
      }
      uint64_t v19 = MRPlaybackQueueGetQueueID();
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void **)(v20 + 232);
      *(void *)(v20 + 232) = v19;

      uint64_t v22 = [a2 properties];
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void **)(v23 + 240);
      *(void *)(v23 + 240) = v22;

      id v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v12 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_playbackQueueForRange:", *(void *)(a1 + 56), *(void *)(a1 + 64));
      [v25 finishWithValue:v12];
      goto LABEL_15;
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishWithError:v5];
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 152);
  long long v28 = *(_OWORD *)(a1 + 56);
  id v9 = [MEMORY[0x263F08D40] valueWithBytes:&v28 objCType:"{_MSVSignedRange=qq}"];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10 == *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 152);
    long long v27 = *(_OWORD *)(a1 + 56);
    id v12 = [MEMORY[0x263F08D40] valueWithBytes:&v27 objCType:"{_MSVSignedRange=qq}"];
    [v11 setObject:0 forKey:v12];
LABEL_15:
  }
  return [*(id *)(*(void *)(a1 + 32) + 112) endTransaction];
}

- (id)_onQueue_playbackQueueForRange:(_MSVSignedRange)a3
{
  unint64_t length = a3.length;
  int64_t location = a3.location;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int64_t v6 = self->_loadedContentItemsRange.location;
  if (location <= v6) {
    int64_t v7 = self->_loadedContentItemsRange.location;
  }
  else {
    int64_t v7 = location;
  }
  if (v6 < 0) {
    int64_t v6 = -v6;
  }
  int64_t v8 = v6 + v7;
  uint64_t v9 = [(NSMutableArray *)self->_contentItemIDs count];
  if (length >= v9 - v8) {
    unint64_t v10 = v9 - v8;
  }
  else {
    unint64_t v10 = length;
  }
  uint64_t v11 = -[NSMutableArray subarrayWithRange:](self->_contentItemIDs, "subarrayWithRange:", v8, v10);
  id v12 = [[MPCMediaRemoteControllerPlaybackQueue alloc] initWithIdentifiers:v11 playingIdentifier:self->_playingItemIdentifier queueIdentifier:self->_queueIdentifier queueProperties:self->_queueProperties];

  return v12;
}

- (void)_onQueue_mergeContentItems:(id)a3 queueRange:(_MSVSignedRange)a4 requestRange:(_MSVSignedRange)a5 requestProperties:(id)a6
{
  int64_t length = a4.length;
  int64_t location = a4.location;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (location <= 0 && length > -location)
  {
    if ([v10 count])
    {
      [v10 objectAtIndexedSubscript:-location];
    }
    MRContentItemGetIdentifier();
    id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = v12;
    if (v12 != self->_playingItemIdentifier && !-[NSString isEqualToString:](v12, "isEqualToString:"))
    {
      objc_storeStrong((id *)&self->_playingItemIdentifier, v13);
      uint64_t v14 = NSAllMapTableValues(self->_playbackQueueFutures);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v35 + 1) + 8 * i) invalidate];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v16);
      }
    }
  }
  int64_t v19 = MSVSignedUnionRange();
  int64_t v21 = v20;
  uint64_t v22 = vcvtpd_s64_f64((double)v20 * 1.5);
  if ([(MSVLRUDictionary *)self->_contentItems maximumCapacity] < v22)
  {
    [(MSVLRUDictionary *)self->_contentItems setMaximumCapacity:v22];
    [(MSVLRUDictionary *)self->_contentItemArtwork setMaximumCapacity:v22];
  }
  uint64_t v23 = [(NSMutableDictionary *)self->_contentItemIDsForProperties objectForKeyedSubscript:v11];
  uint64_t v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [MEMORY[0x263EFF9C0] setWithCapacity:v22];
  }
  id v26 = v25;

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __97__MPCMediaRemoteController__onQueue_mergeContentItems_queueRange_requestRange_requestProperties___block_invoke;
  v33[3] = &unk_2643C3770;
  id v34 = v26;
  id v27 = v26;
  long long v28 = objc_msgSend(v10, "msv_map:", v33);
  [(NSMutableDictionary *)self->_contentItemIDsForProperties setObject:v27 forKeyedSubscript:v11];
  [(MPCMediaRemoteController *)self _onQueue_mergeContentItems:v10];
  contentItemIDs = self->_contentItemIDs;
  uint64_t v30 = MSVReplacementRangeForRanges();
  -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](contentItemIDs, "replaceObjectsInRange:withObjectsFromArray:", v30, v31, v28);
  self->_loadedContentItemsRange.int64_t location = v19;
  self->_loadedContentItemsRange.int64_t length = v21;
  self->_requestedContentItemsRange.int64_t location = MSVSignedUnionRange();
  self->_requestedContentItemsRange.int64_t length = v32;
}

- (void)_onQueue_mergeContentItems:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  contentItems = self->_contentItems;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__MPCMediaRemoteController__onQueue_mergeContentItems___block_invoke;
  v7[3] = &unk_2643C5EE8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(MSVLRUDictionary *)contentItems performTransaction:v7];
}

void __62__MPCMediaRemoteController__playbackQueueChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 240);
  *(void *)(v4 + 240) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int64_t v7 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = 0;

  long long v8 = *MEMORY[0x263F54EA8];
  *(_OWORD *)(*(void *)(a1 + 32) + 72) = *MEMORY[0x263F54EA8];
  *(_OWORD *)(*(void *)(a1 + 32) + 88) = v8;
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  uint64_t v9 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(a1 + 32) + 152));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v14 invalidate];
        [v14 disconnect];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 184) removeAllObjects];
}

void __68__MPCMediaRemoteController__supportedCommandsDidChangeNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 40) disconnect];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(void *)(*(void *)(a1 + 32) + 48) = 0;
}

- (id)artworkCatalogBlockForContentItem:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke;
  v8[3] = &unk_2643C3748;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(v8);

  return v6;
}

id __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _artworkCatalogBlockForContentItem:*(void *)(a1 + 40)];
  id v3 = (void *)v2;
  if (v2)
  {
    id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [MEMORY[0x263F12178] standardUserDefaults];
  int v6 = [v5 showDebugUI];

  if (v6)
  {
    if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_onceToken != -1) {
      dispatch_once(&ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_onceToken, &__block_literal_global_219);
    }
    if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI)
    {
      if (!v4)
      {
        id v4 = [MEMORY[0x263F11D30] placeholderCatalogWithSymbolName:@"music"];
      }
      [v4 setOverlayDelegate:*(void *)(a1 + 32)];
      int64_t v7 = [*(id *)(a1 + 40) identifier];
      [v4 setOverlayToken:v7];
    }
  }

  return v4;
}

uint64_t __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _artworkCatalogForContentItem:*(void *)(a1 + 40)];
}

id __97__MPCMediaRemoteController__onQueue_mergeContentItems_queueRange_requestRange_requestProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = MRContentItemGetIdentifier();
  [*(id *)(a1 + 32) addObject:v2];

  return v2;
}

- (id)_init
{
  v38.receiver = self;
  v38.super_class = (Class)MPCMediaRemoteController;
  uint64_t v2 = [(MPCMediaRemoteController *)&v38 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCMediaRemoteController", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlaybackCore/MPCMediaRemoteController.callout", v6);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    contentItemIDs = v2->_contentItemIDs;
    v2->_contentItemIDs = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    optimisticStateContentItems = v2->_optimisticStateContentItems;
    v2->_optimisticStateContentItems = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    contentItemChanges = v2->_contentItemChanges;
    v2->_contentItemChanges = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    playbackQueueFutures = v2->_playbackQueueFutures;
    v2->_playbackQueueFutures = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    contentItemFutures = v2->_contentItemFutures;
    v2->_contentItemFutures = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    contentItemArtworkFutures = v2->_contentItemArtworkFutures;
    v2->_contentItemArtworkFutures = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    contentItemRemoteArtworkFutures = v2->_contentItemRemoteArtworkFutures;
    v2->_contentItemRemoteArtworkFutures = (NSMutableDictionary *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    contentItemArtworkIdentifiers = v2->_contentItemArtworkIdentifiers;
    v2->_contentItemArtworkIdentifiers = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
    requestedRangeForProperties = v2->_requestedRangeForProperties;
    v2->_requestedRangeForProperties = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    contentItemIDsForProperties = v2->_contentItemIDsForProperties;
    v2->_contentItemIDsForProperties = (NSMutableDictionary *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x263F54EF0]) initWithMaximumCapacity:1];
    contentItems = v2->_contentItems;
    v2->_contentItems = (MSVLRUDictionary *)v29;

    [(MSVLRUDictionary *)v2->_contentItems setDelegate:v2];
    uint64_t v31 = [objc_alloc(MEMORY[0x263F54EF0]) initWithMaximumCapacity:1];
    contentItemArtwork = v2->_contentItemArtwork;
    v2->_contentItemArtwork = (MSVLRUDictionary *)v31;

    if ([(id)objc_opt_class() _shouldRegisterForNotifications])
    {
      long long v33 = [MEMORY[0x263F08A00] defaultCenter];
      [v33 addObserver:v2 selector:sel__playbackStateDidChangeNotification_ name:*MEMORY[0x263F54E00] object:0];
      [v33 addObserver:v2 selector:sel__supportedCommandsDidChangeNotification_ name:*MEMORY[0x263F54E08] object:0];
      [v33 addObserver:v2 selector:sel__playbackQueueChangedNotification_ name:*MEMORY[0x263F54E60] object:0];
      [v33 addObserver:v2 selector:sel__playbackQueueContentItemsChangedNotification_ name:*MEMORY[0x263F54E70] object:0];
      [v33 addObserver:v2 selector:sel__contentItemArtworkChangedNotification_ name:*MEMORY[0x263F54E68] object:0];
      [v33 addObserver:v2 selector:sel__playbackQueueParticipantsDidChangeNotification_ name:*MEMORY[0x263F54878] object:0];
    }
    id v34 = dispatch_get_global_queue(21, 0);
    _MRMediaRemoteRegisterForNowPlayingNotificationsEx();

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __33__MPCMediaRemoteController__init__block_invoke;
    v36[3] = &unk_2643C34D8;
    long long v37 = v2;
    v37->_stateHandle = __33__MPCMediaRemoteController__init__block_invoke((uint64_t)v36);
  }
  return v2;
}

uint64_t __33__MPCMediaRemoteController__init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v3, &location);
  uint64_t v1 = MSVLogAddStateHandler();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
  return v1;
}

+ (BOOL)_shouldRegisterForNotifications
{
  return 1;
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = (void *)controllerForPlayerPath____playerPathControllers;
  controllerForPlayerPath____playerPathControllers = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.MPCMediaRemoteController.playerPathControllersQueue/access", 0);
  id v3 = (void *)controllerForPlayerPath____playerPathControllersQueue;
  controllerForPlayerPath____playerPathControllersQueue = (uint64_t)v2;

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.MPCMediaRemoteController.playerPathControllersQueue/callout", 0);
  id v5 = (void *)controllerForPlayerPath____playerPathControllersFutureQueue;
  controllerForPlayerPath____playerPathControllersFutureQueue = (uint64_t)v4;
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  dispatch_queue_t v4 = [a3 userInfo];
  [v4 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  id v5 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v5 mediaRemotePlayerPath];
  int v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__MPCMediaRemoteController__playbackQueueChangedNotification___block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

- (void)_playbackStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  [v5 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  int v6 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v6 mediaRemotePlayerPath];
  int v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    long long v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54DF8]];

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke;
    v12[3] = &unk_2643C5EE8;
    id v13 = v9;
    uint64_t v14 = self;
    id v11 = v9;
    dispatch_async(accessQueue, v12);
  }
}

- (void)_playbackQueueContentItemsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  [v5 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  int v6 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v6 mediaRemotePlayerPath];
  int v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    long long v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54E38]];

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__MPCMediaRemoteController__playbackQueueContentItemsChangedNotification___block_invoke;
    v12[3] = &unk_2643C5EE8;
    id v13 = v9;
    uint64_t v14 = self;
    id v11 = v9;
    dispatch_async(accessQueue, v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationToken, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingItemIdentifier, 0);
  objc_storeStrong((id *)&self->_mrRemoteArtworkDataSource, 0);
  objc_storeStrong((id *)&self->_mrArtworkDataSource, 0);
  objc_storeStrong((id *)&self->_contentItemIDsForProperties, 0);
  objc_storeStrong((id *)&self->_requestedRangeForProperties, 0);
  objc_storeStrong((id *)&self->_contentItemRemoteArtworkFutures, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkFutures, 0);
  objc_storeStrong((id *)&self->_contentItemFutures, 0);
  objc_storeStrong((id *)&self->_playbackQueueFutures, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentItemArtwork, 0);
  objc_storeStrong((id *)&self->_contentItemChanges, 0);
  objc_storeStrong((id *)&self->_optimisticStateContentItems, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_contentItemIDs, 0);
  objc_storeStrong((id *)&self->_playbackQueueParticipantsFuture, 0);
  objc_storeStrong((id *)&self->_supportedCommandsFuture, 0);
  objc_storeStrong((id *)&self->_playbackStateFuture, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)invalidationToken
{
  return self->_invalidationToken;
}

- (void)setCalloutQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 beforeContentItemIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v8 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v6];
  uint64_t v9 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v8 != v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = v9 - 1;
    if (v8 != v9 - 1)
    {
      uint64_t v14 = [(NSDictionary *)self->_queueProperties objectForKeyedSubscript:@"tailInsertionContentItemID"];
      if (v14) {
        uint64_t v15 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v14];
      }
      else {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      [(NSMutableArray *)self->_contentItemIDs removeObjectAtIndex:v8];
      if (v8 >= v12) {
        uint64_t v16 = v12;
      }
      else {
        uint64_t v16 = v13;
      }
      [(NSMutableArray *)self->_contentItemIDs insertObject:v6 atIndex:v16];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v17 = [(NSMutableArray *)self->_contentItemIDs objectAtIndex:v15];
        if (v17)
        {
          long long v18 = (void *)[(NSDictionary *)self->_queueProperties mutableCopy];
          [v18 setObject:v17 forKeyedSubscript:@"tailInsertionContentItemID"];
          [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"optimistic"];
          uint64_t v19 = (NSDictionary *)[v18 copy];
          queueProperties = self->_queueProperties;
          self->_queueProperties = v19;
        }
      }
      uint64_t v21 = NSAllMapTableValues(self->_playbackQueueFutures);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v27 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * i) invalidate];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v23);
      }
    }
  }
}

- (void)_onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:(id)a3 afterContentItemIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v8 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v6];
  uint64_t v9 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v7];
  BOOL v11 = v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == v9;
  uint64_t v12 = v9 + 1;
  if (!v11 && v8 != v12)
  {
    uint64_t v14 = v9;
    uint64_t v15 = [(NSDictionary *)self->_queueProperties objectForKeyedSubscript:@"tailInsertionContentItemID"];
    if (v15) {
      uint64_t v16 = [(NSMutableArray *)self->_contentItemIDs indexOfObject:v15];
    }
    else {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(NSMutableArray *)self->_contentItemIDs removeObjectAtIndex:v8];
    if (v8 <= v14) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = v12;
    }
    [(NSMutableArray *)self->_contentItemIDs insertObject:v6 atIndex:v17];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v18 = [(NSMutableArray *)self->_contentItemIDs objectAtIndex:v16];
      if (v18)
      {
        uint64_t v19 = (void *)[(NSDictionary *)self->_queueProperties mutableCopy];
        [v19 setObject:v18 forKeyedSubscript:@"tailInsertionContentItemID"];
        [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"optimistic"];
        uint64_t v20 = (NSDictionary *)[v19 copy];
        queueProperties = self->_queueProperties;
        self->_queueProperties = v20;
      }
    }
    uint64_t v22 = NSAllMapTableValues(self->_playbackQueueFutures);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) invalidate];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v24);
    }
  }
}

- (id)_onQueue_setOptimisticPlaybackState:(unsigned int)a3 withOptions:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v6 = [(MPCFuture *)self->_playbackStateFuture result];
  [(MPCFuture *)self->_playbackStateFuture invalidate];
  [(MPCFuture *)self->_playbackStateFuture disconnect];
  id v7 = [[MPCFuture alloc] initWithQueue:self->_calloutQueue];
  playbackStateFuture = self->_playbackStateFuture;
  self->_playbackStateFuture = v7;

  [(MPCFuture *)self->_playbackStateFuture setDebugLabel:@"playbackState [optimistic state]"];
  uint64_t v9 = self->_playbackStateFuture;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke;
  aBlock[3] = &__block_descriptor_36_e5_I8__0l;
  unsigned int v17 = a3;
  uint64_t v10 = _Block_copy(aBlock);
  [(MPCFuture *)v9 finishWithValue:v10];

  self->_playbackStateCacheState = 2;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke_2;
  v14[3] = &unk_2643C55A8;
  void v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  uint64_t v12 = _Block_copy(v14);

  return v12;
}

uint64_t __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void __76__MPCMediaRemoteController__onQueue_setOptimisticPlaybackState_withOptions___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32) == 2)
  {
    [*(id *)(v2 + 24) invalidate];
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    if (*(void *)(a1 + 40))
    {
      [*(id *)(*(void *)(a1 + 32) + 24) disconnect];
      id v3 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = v3;

      [*(id *)(*(void *)(a1 + 32) + 24) setDebugLabel:@"playbackState [restored state / optimistic failure]"];
      id v6 = *(void **)(*(void *)(a1 + 32) + 24);
      id v7 = _Block_copy(*(const void **)(a1 + 40));
      [v6 finishWithValue:v7];

      *(void *)(*(void *)(a1 + 32) + 32) = 1;
    }
  }
}

- (id)_onQueue_setOptimisticElapsedTimeForContentItem:(id)a3 elapsedTime:(double)a4 rate:(float)a5
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F120F8]);
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = (void *)[v8 initWithIdentifier:v9];

    id v11 = (void *)MEMORY[0x263F11D70];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke;
    v27[3] = &unk_2643C4F28;
    id v28 = v10;
    double v29 = a4;
    id v12 = v10;
    [v11 performSuppressingChangeNotifications:v27];
    optimisticStateContentItems = self->_optimisticStateContentItems;
    uint64_t v14 = [v7 identifier];
    [(NSMutableDictionary *)optimisticStateContentItems setObject:v12 forKeyedSubscript:v14];

    contentItemFutures = self->_contentItemFutures;
    uint64_t v16 = [v7 identifier];
    unsigned int v17 = [(NSMapTable *)contentItemFutures objectForKey:v16];
    [v17 invalidate];

    long long v18 = self->_contentItemFutures;
    uint64_t v19 = [v7 identifier];
    uint64_t v20 = [(NSMapTable *)v18 objectForKey:v19];
    [v20 disconnect];

    uint64_t v21 = self->_contentItemFutures;
    uint64_t v22 = [v7 identifier];
    [(NSMapTable *)v21 removeObjectForKey:v22];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke_2;
    v25[3] = &unk_2643C5EE8;
    v25[4] = self;
    id v26 = v7;
    uint64_t v23 = _Block_copy(v25);
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

uint64_t __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setElapsedTime:*(double *)(a1 + 40)];
}

void __93__MPCMediaRemoteController__onQueue_setOptimisticElapsedTimeForContentItem_elapsedTime_rate___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 120);
    id v6 = [*(id *)(a1 + 40) identifier];
    [v5 setObject:0 forKeyedSubscript:v6];

    id v7 = *(void **)(*(void *)(a1 + 32) + 160);
    id v8 = [*(id *)(a1 + 40) identifier];
    uint64_t v9 = [v7 objectForKey:v8];
    [v9 invalidate];

    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 160);
    id v11 = [*(id *)(a1 + 40) identifier];
    id v12 = [v10 objectForKey:v11];
    [v12 disconnect];

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 160);
    id v15 = [v13 identifier];
    [v14 removeObjectForKey:v15];
  }
}

- (id)_onQueue_updateOptimisticStateForCommand:(unsigned int)a3 options:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (a3 == 2)
  {
    uint64_t v7 = [(MPCFuture *)self->_playbackStateFuture result];
    if (!v7) {
      goto LABEL_32;
    }
    id v8 = (void *)v7;
    BOOL v9 = [(MPCFuture *)self->_playbackStateFuture isInvalid];

    if (v9) {
      goto LABEL_32;
    }
    uint64_t v10 = [(MPCFuture *)self->_playbackStateFuture result];
    a3 = v10[2]() == 1;
  }
  id v11 = 0;
  if ((int)a3 <= 2)
  {
    if (!a3)
    {
      id v11 = [(MPCMediaRemoteController *)self _onQueue_setOptimisticPlaybackState:1 withOptions:v6];
      goto LABEL_33;
    }
    if (a3 != 1) {
      goto LABEL_33;
    }
  }
  else if (a3 != 3)
  {
    if (a3 != 24)
    {
      if (a3 != 130) {
        goto LABEL_33;
      }
      id v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54C98]];
      uint64_t v13 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54CE0]];
      uint64_t v14 = (void *)v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        uint64_t v16 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54CD8]];
        unsigned int v17 = (void *)v16;
        if (v12 && v16) {
          [(MPCMediaRemoteController *)self _onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:v12 afterContentItemIdentifier:v16];
        }
      }
      else
      {
        [(MPCMediaRemoteController *)self _onQueue_setOptimisticReorderedPlaybackQueueWithMovingContentItemIdentifier:v12 beforeContentItemIdentifier:v13];
      }

      goto LABEL_32;
    }
    if (self->_playingItemIdentifier)
    {
      uint64_t v31 = -[MSVLRUDictionary objectForKeyedSubscript:](self->_contentItems, "objectForKeyedSubscript:");
      uint64_t v32 = [v6 objectForKeyedSubscript:*MEMORY[0x263F54D10]];
      [v32 doubleValue];
      double v34 = v33;

      [v31 duration];
      if (v34 < v35) {
        double v35 = v34;
      }
      id v11 = [(MPCMediaRemoteController *)self _onQueue_setOptimisticElapsedTimeForContentItem:v31 elapsedTime:fmax(v35, 0.0) rate:0.0];

      goto LABEL_33;
    }
LABEL_32:
    id v11 = 0;
    goto LABEL_33;
  }
  long long v18 = [(MPCMediaRemoteController *)self _onQueue_setOptimisticPlaybackState:2 withOptions:v6];
  uint64_t v19 = self->_playingItemIdentifier;
  if (v19)
  {
    uint64_t v20 = [(MSVLRUDictionary *)self->_contentItems objectForKeyedSubscript:v19];
    [v20 elapsedTime];
    double v22 = v21;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v24 = v23;
    [v20 elapsedTimeTimestamp];
    double v26 = v24 - v25;
    [v20 playbackRate];
    double v28 = v22 + v26 * v27;
    [v20 duration];
    if (v28 < v29) {
      double v29 = v28;
    }
    long long v30 = [(MPCMediaRemoteController *)self _onQueue_setOptimisticElapsedTimeForContentItem:v20 elapsedTime:v29 rate:0.0];
  }
  else
  {
    long long v30 = 0;
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  void v40[2] = __77__MPCMediaRemoteController__onQueue_updateOptimisticStateForCommand_options___block_invoke;
  v40[3] = &unk_2643C37C0;
  id v41 = v18;
  id v42 = v30;
  id v36 = v30;
  id v37 = v18;
  id v11 = _Block_copy(v40);

LABEL_33:
  objc_super v38 = _Block_copy(v11);

  return v38;
}

uint64_t __77__MPCMediaRemoteController__onQueue_updateOptimisticStateForCommand_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (int64_t)playbackQueueParticipantsCacheState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__MPCMediaRemoteController_playbackQueueParticipantsCacheState__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__MPCMediaRemoteController_playbackQueueParticipantsCacheState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 64);
  return result;
}

- (int64_t)supportedCommandsCacheState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__MPCMediaRemoteController_supportedCommandsCacheState__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__MPCMediaRemoteController_supportedCommandsCacheState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (int64_t)playbackStateCacheState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__MPCMediaRemoteController_playbackStateCacheState__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__MPCMediaRemoteController_playbackStateCacheState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (id)_onQueue_stateDictionary
{
  v30[11] = *MEMORY[0x263EF8340];
  int64_t v3 = self->_playbackStateFuture;
  uint64_t v4 = [(MPCFuture *)v3 result];

  double v28 = v3;
  if (v4)
  {
    id v5 = [(MPCFuture *)v3 result];
    v5[2]();
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_contentItemChanges allKeys];
  uint64_t v7 = [(MPCFuture *)self->_supportedCommandsFuture result];
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  v29[0] = @"_obj";
  uint64_t v9 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  resolvedPlayerPath = self->_resolvedPlayerPath;
  v30[0] = v9;
  v30[1] = resolvedPlayerPath;
  v29[1] = @"resolvedPlayerPath";
  v29[2] = @"contentItemIDs";
  contentItemIDs = self->_contentItemIDs;
  if (!contentItemIDs) {
    contentItemIDs = (NSMutableArray *)MEMORY[0x263EFFA68];
  }
  v30[2] = contentItemIDs;
  v29[3] = @"contentItemChanges:keys";
  optimisticStateContentItems = (NSMutableDictionary *)@"<EMPTY>";
  if ([(__CFString *)v6 count]) {
    uint64_t v13 = v6;
  }
  else {
    uint64_t v13 = @"<EMPTY>";
  }
  queueIdentifier = (__CFString *)self->_queueIdentifier;
  queueProperties = self->_queueProperties;
  if (!queueIdentifier) {
    queueIdentifier = @"<NULL>";
  }
  v30[3] = v13;
  v30[4] = queueIdentifier;
  v29[4] = @"queueIdentifier";
  v29[5] = @"queueProperties";
  if (queueProperties) {
    uint64_t v16 = (__CFString *)queueProperties;
  }
  else {
    uint64_t v16 = @"<NULL>";
  }
  v30[5] = v16;
  v29[6] = @"optimisticStateContentItems";
  if ([(NSMutableDictionary *)self->_optimisticStateContentItems count]) {
    optimisticStateContentItems = self->_optimisticStateContentItems;
  }
  v30[6] = optimisticStateContentItems;
  v29[7] = @"supportedCommands";
  uint64_t v17 = [v7 allCommandInfos];
  long long v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = @"<NULL>";
  }
  v30[7] = v19;
  v29[8] = @"playbackState";
  uint64_t v20 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
  v30[8] = v20;
  v29[9] = @"loadedRange";
  double v21 = NSStringFromMSVSignedRange();
  v30[9] = v21;
  v29[10] = @"requestedRange";
  double v22 = NSStringFromMSVSignedRange();
  v30[10] = v22;
  double v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:11];
  double v24 = [v8 dictionaryWithDictionary:v23];

  playingItemIdentifier = self->_playingItemIdentifier;
  if (playingItemIdentifier)
  {
    [v24 setObject:playingItemIdentifier forKeyedSubscript:@"playingItemIdentifier"];
    double v26 = [(MSVLRUDictionary *)self->_contentItems objectForKeyedSubscript:self->_playingItemIdentifier];
    [v24 setObject:v26 forKeyedSubscript:@"playingItem"];
  }

  return v24;
}

- (void)_onQueue_invalidateArtworkFuturesForContentItemID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = [(NSMutableDictionary *)self->_contentItemArtworkFutures objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = NSAllMapTableValues(v5);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v12 invalidate];
          [v12 disconnect];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [(NSMapTable *)v6 removeAllObjects];
  }
}

- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3
{
}

- (void)_onQueue_purgeArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (![v6 length])
  {
    uint64_t v8 = [(MSVLRUDictionary *)self->_contentItems objectForKeyedSubscript:v12];
    uint64_t v9 = [v8 artworkIdentifier];
    if ([v9 length])
    {
      id v10 = [v8 artworkIdentifier];
    }
    else
    {
      id v10 = v12;
    }
    uint64_t v7 = v10;
  }
  if ([v7 length])
  {
    id v11 = [(NSMutableDictionary *)self->_contentItemArtworkIdentifiers objectForKeyedSubscript:v7];
    if ([v11 count]) {
      [v11 removeObject:v12];
    }
    if (![v11 count]) {
      [(MSVLRUDictionary *)self->_contentItemArtwork removeObjectForKey:v7];
    }
    [(NSMutableDictionary *)self->_contentItemArtworkIdentifiers setObject:v11 forKeyedSubscript:v7];
  }
}

- (void)_onQueue_purgeContentItemIdentifierForProperties:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = [MEMORY[0x263EFF980] array];
  contentItemIDsForProperties = self->_contentItemIDsForProperties;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __77__MPCMediaRemoteController__onQueue_purgeContentItemIdentifierForProperties___block_invoke;
  id v12 = &unk_2643C3798;
  id v13 = v4;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)contentItemIDsForProperties enumerateKeysAndObjectsUsingBlock:&v9];
  -[NSMutableDictionary removeObjectsForKeys:](self->_contentItemIDsForProperties, "removeObjectsForKeys:", v7, v9, v10, v11, v12);
}

void __77__MPCMediaRemoteController__onQueue_purgeContentItemIdentifierForProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  [v6 removeObject:v5];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (id)_onQueue_identifiersForRange:(_MSVSignedRange)a3
{
  unint64_t length = a3.length;
  int64_t location = a3.location;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  int64_t v6 = self->_loadedContentItemsRange.location;
  if (location <= v6) {
    int64_t v7 = self->_loadedContentItemsRange.location;
  }
  else {
    int64_t v7 = location;
  }
  if (v6 < 0) {
    int64_t v6 = -v6;
  }
  int64_t v8 = v6 + v7;
  uint64_t v9 = [(NSMutableArray *)self->_contentItemIDs count];
  if (length >= v9 - v8) {
    unint64_t v10 = v9 - v8;
  }
  else {
    unint64_t v10 = length;
  }
  contentItemIDs = self->_contentItemIDs;

  return (id)-[NSMutableArray subarrayWithRange:](contentItemIDs, "subarrayWithRange:", v8, v10);
}

- (id)_legacyCommands
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(&unk_26CC19610, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_26CC19610 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_26CC19610);
        }
        int64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int64_t v8 = (void *)MRMediaRemoteCommandInfoCreate();
        [v7 unsignedIntValue];
        MRMediaRemoteCommandInfoSetCommand();
        MRMediaRemoteCommandInfoSetEnabled();
        [v2 setObject:v8 forKeyedSubscript:v7];
      }
      uint64_t v4 = [&unk_26CC19610 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)_createExportableArtworkPropertiesForContentItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 artworkURLTemplates];
  uint64_t v5 = [v3 artworkURL];
  id v6 = objc_alloc_init(MEMORY[0x263F11D90]);
  [v6 setArtworkTemplateItems:v4];
  [v6 setResolvedURLString:v5];
  uint64_t v7 = [v3 mediaType];

  [v6 setMediaType:v7];
  [v6 setMediaLibraryArtworkType:1];

  return v6;
}

id __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_2(uint64_t a1)
{
  v53[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) artworkIdentifier];
  uint64_t v4 = [v3 length];
  uint64_t v5 = *v2;
  if (v4) {
    [v5 artworkIdentifier];
  }
  else {
  id v6 = [v5 identifier];
  }

  id v7 = [*(id *)(a1 + 40) resolvedPlayerPath];
  int64_t v8 = [v7 origin];

  uint64_t v9 = [*(id *)(a1 + 32) supportedRemoteArtworkFormats];
  if ([v9 count])
  {
    BOOL v10 = 0;
  }
  else
  {
    long long v11 = [*(id *)(a1 + 32) remoteArtworks];
    BOOL v10 = [v11 count] == 0;
  }
  if (!_os_feature_enabled_impl() || (([v8 isLocal] | v10) & 1) != 0)
  {
    long long v12 = [*(id *)(a1 + 40) _createExportableArtworkPropertiesForContentItem:*(void *)(a1 + 32)];
    if ([v12 isValid])
    {
      long long v13 = [*(id *)(a1 + 32) deviceSpecificUserInfo];
      uint64_t v14 = *MEMORY[0x263F11C10];
      uint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F11C10]];
      long long v16 = v15;
      if (v15)
      {
        char v17 = [v15 BOOLValue];

        if (v17) {
          goto LABEL_12;
        }
      }
      else
      {
        double v28 = [*(id *)(a1 + 32) userInfo];
        double v29 = [v28 objectForKeyedSubscript:v14];
        int v30 = [v29 BOOLValue];

        if (v30)
        {
LABEL_12:
          uint64_t v18 = +[MPCMRLegacyRemoteArtworkDataSource sharedDataSource];
          uint64_t v19 = [MPNowPlayingContentItemLegacyRemoteArtworkToken alloc];
          uint64_t v20 = [*(id *)(a1 + 32) identifier];
          double v21 = [(MPNowPlayingContentItemLegacyRemoteArtworkToken *)v19 initWithIdentifier:v20 artworkProperties:v12 artworkIdentifier:v6];

          if (v21)
          {
LABEL_21:

            goto LABEL_24;
          }
LABEL_18:
          [*(id *)(a1 + 32) _mediaRemoteContentItem];
          if (MRContentItemGetHasArtworkData())
          {
            uint64_t v31 = [*(id *)(a1 + 40) mediaRemoteArtworkDataSource];

            uint64_t v32 = [MPCMRContentItemArtworkDataToken alloc];
            double v33 = [*(id *)(a1 + 32) identifier];
            double v21 = [(MPCMRContentItemArtworkDataToken *)v32 initWithIdentifier:v33 artworkIdentifier:v6];

            uint64_t v18 = (void *)v31;
          }
          else
          {
            double v21 = 0;
          }
          goto LABEL_21;
        }
      }
    }
    uint64_t v18 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = [*(id *)(a1 + 40) remoteArtworkDataSource];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__22508;
  v50 = __Block_byref_object_dispose__22509;
  id v51 = 0;
  uint64_t v22 = *(void *)(a1 + 40);
  double v23 = *(NSObject **)(v22 + 8);
  uint64_t v39 = MEMORY[0x263EF8330];
  uint64_t v40 = 3221225472;
  id v41 = __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_3;
  id v42 = &unk_2643C4648;
  v45 = &v46;
  uint64_t v43 = v22;
  id v24 = v6;
  id v44 = v24;
  dispatch_sync(v23, &v39);
  uint64_t v25 = objc_msgSend((id)v47[5], "result", v39, v40, v41, v42, v43);
  double v26 = (void *)v25;
  if (v25)
  {
    uint64_t v52 = *MEMORY[0x263F11B80];
    v53[0] = v25;
    float v27 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  }
  else
  {
    float v27 = (void *)MEMORY[0x263EFFA78];
  }
  double v34 = [MPCMRContentItemRemoteArtworkToken alloc];
  double v35 = [*(id *)(a1 + 32) identifier];
  id v36 = [*(id *)(a1 + 32) supportedRemoteArtworkFormats];
  double v21 = [(MPCMRContentItemRemoteArtworkToken *)v34 initWithIdentifier:v35 artworkIdentifier:v24 supportedRemoteArtworkFormats:v36 remoteArtworks:v27];

  _Block_object_dispose(&v46, 8);
LABEL_24:
  if (v18) {
    id v37 = (void *)[objc_alloc(MEMORY[0x263F11D30]) initWithToken:v21 dataSource:v18];
  }
  else {
    id v37 = 0;
  }

  return v37;
}

void __63__MPCMediaRemoteController__artworkCatalogBlockForContentItem___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 176) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)artworkCatalog:(id)a3 didClearFromView:(id)a4
{
  id v6 = [a3 overlayStorage];
  uint64_t v4 = [v6 viewController];
  uint64_t v5 = [v4 view];
  [v5 removeFromSuperview];
}

- (void)artworkCatalog:(id)a3 didConfigureView:(id)a4 withRepresentation:(id)a5
{
  id v6 = a5;
  id v9 = [a3 overlayStorage];
  id v7 = [v6 imageRepresentation];

  int64_t v8 = [v7 image];
  [v9 setImage:v8];
}

- (CGSize)overlayScaledFittingSizeForCatalog:(id)a3 scaledFittingSize:(CGSize)result
{
  if (result.width < 600.0)
  {
    result.width = 600.0;
    result.height = 600.0;
  }
  return result;
}

- (void)artworkCatalog:(id)a3 willConfigureView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v7 traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 != 3)
  {
    BOOL v10 = [v7 artworkCatalog];
    if (!v10 && ([v7 _lastArtworkCatalog], (BOOL v10 = objc_claimAutoreleasedReturnValue()) == 0)
      || ([v10 overlayStorage],
          long long v11 = objc_claimAutoreleasedReturnValue(),
          [v10 setOverlayStorage:0],
          [v6 setOverlayStorage:v11],
          !v11))
    {
      long long v12 = [v7 viewWithTag:11259375];
      long long v13 = v12;
      if (v12) {
        [v12 removeFromSuperview];
      }
      uint64_t v33 = 0;
      double v34 = &v33;
      uint64_t v35 = 0x2050000000;
      uint64_t v14 = (void *)getMFDebugOverlayControllerClass_softClass;
      uint64_t v36 = getMFDebugOverlayControllerClass_softClass;
      if (!getMFDebugOverlayControllerClass_softClass)
      {
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __getMFDebugOverlayControllerClass_block_invoke;
        v32[3] = &unk_2643C57E0;
        v32[4] = &v33;
        __getMFDebugOverlayControllerClass_block_invoke((uint64_t)v32);
        uint64_t v14 = (void *)v34[3];
      }
      uint64_t v15 = v14;
      _Block_object_dispose(&v33, 8);
      id v16 = objc_alloc_init(v15);
      if (!v16) {
        goto LABEL_14;
      }
      long long v11 = v16;
      char v17 = [v16 viewController];
      uint64_t v18 = [v17 view];

      [v18 setTag:11259375];
      [v7 addSubview:v18];
      [v7 bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      float v27 = [v11 viewController];
      double v28 = [v27 view];
      objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

      id v29 = v7;
      do
      {
        [v29 setUserInteractionEnabled:1];
        uint64_t v30 = [v29 superview];

        id v29 = (id)v30;
      }
      while (v30);
      [v6 setOverlayStorage:v11];
    }
    objc_msgSend(v11, "setPlayerPath:", -[MPCPlayerPath mediaRemotePlayerPath](self->_resolvedPlayerPath, "mediaRemotePlayerPath"));
    uint64_t v31 = [v6 overlayToken];
    [v11 setContentItemID:v31];

    long long v13 = v11;
LABEL_14:
  }
}

- (id)overlayVisualIdenticalityForCatalog:(id)a3
{
  return (id)[a3 overlayToken];
}

void __62__MPCMediaRemoteController_artworkCatalogBlockForContentItem___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263F086E0] mainBundle];
  id v2 = [v0 bundleIdentifier];

  char v1 = ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI;
  if (ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI) {
    char v1 = [v2 hasPrefix:@"com.apple.MediaRemoteUI"] ^ 1;
  }
  ICMediaLibraryAccessPermissionsHelperServiceName_block_invoke_processSupportsDebugUI = v1;
}

- (void)invalidateAllTokens
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MPCMediaRemoteController_invalidateAllTokens__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __47__MPCMediaRemoteController_invalidateAllTokens__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 24) disconnect];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 40) disconnect];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  id v6 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(a1 + 32) + 160));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v11 invalidate];
        [v11 disconnect];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v8);
  }
  [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
  long long v12 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(a1 + 32) + 152));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        [v18 invalidate];
        [v18 disconnect];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v15);
  }

  [*(id *)(*(void *)(a1 + 32) + 184) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 152) removeAllObjects];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v30 = a1;
  double v19 = [*(id *)(*(void *)(a1 + 32) + 168) allValues];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = NSAllMapTableValues(*(NSMapTable **)(*((void *)&v35 + 1) + 8 * k));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (uint64_t m = 0; m != v26; ++m)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v31 + 1) + 8 * m);
              [v29 invalidate];
              [v29 disconnect];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v47 count:16];
          }
          while (v26);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v21);
  }

  [*(id *)(*(void *)(v30 + 32) + 168) removeAllObjects];
  [*(id *)(*(void *)(v30 + 32) + 136) removeAllObjects];
  [*(id *)(*(void *)(v30 + 32) + 144) removeAllObjects];
}

- (void)dictionary:(id)a3 willRemoveObject:(id)a4 forKey:(id)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_contentItems == a3)
  {
    uint64_t v9 = [v7 identifier];
    BOOL v10 = [v8 artworkIdentifier];
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__MPCMediaRemoteController_dictionary_willRemoveObject_forKey___block_invoke;
    block[3] = &unk_2643C6660;
    block[4] = self;
    id v15 = v9;
    id v16 = v10;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(accessQueue, block);
  }
}

void __63__MPCMediaRemoteController_dictionary_willRemoveObject_forKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_purgeContentItemIdentifierForProperties:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_purgeArtworkForContentItemIdentifier:artworkIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 120) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:*(void *)(a1 + 40)];
  [v2 invalidate];
}

- (void)_playbackQueueParticipantsDidChangeNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [v4 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  uint64_t v5 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v5 mediaRemotePlayerPath];
  int v6 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__MPCMediaRemoteController__playbackQueueParticipantsDidChangeNotification___block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

void __76__MPCMediaRemoteController__playbackQueueParticipantsDidChangeNotification___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 56) disconnect];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  *(void *)(*(void *)(a1 + 32) + 64) = 0;
}

- (void)_contentItemArtworkChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  [v5 objectForKeyedSubscript:*MEMORY[0x263F54E48]];

  int v6 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v6 mediaRemotePlayerPath];
  int v7 = MRNowPlayingPlayerPathEqualToPlayerPath();

  if (v7)
  {
    uint64_t v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54E38]];

    accessQueue = self->_accessQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__MPCMediaRemoteController__contentItemArtworkChangedNotification___block_invoke;
    v12[3] = &unk_2643C5EE8;
    id v13 = v9;
    uint64_t v14 = self;
    id v11 = v9;
    dispatch_async(accessQueue, v12);
  }
}

void __67__MPCMediaRemoteController__contentItemArtworkChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = MRContentItemGetIdentifier();
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 160), "objectForKey:", v7, v10);
        [v8 invalidate];

        uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 160) objectForKey:v7];
        [v9 disconnect];

        [*(id *)(*(void *)(a1 + 40) + 160) removeObjectForKey:v7];
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_invalidateArtworkFuturesForContentItemID:", v7);
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_purgeArtworkForContentItemIdentifier:", v7);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 24) invalidate];
  [*(id *)(*(void *)(a1 + 40) + 24) disconnect];
  if (v2)
  {
    uint64_t v3 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 40) + 16)];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    [*(id *)(*(void *)(a1 + 40) + 24) setDebugLabel:@"playbackState [from notification]"];
    int v6 = [*(id *)(a1 + 32) unsignedIntValue];
    int v7 = *(void **)(*(void *)(a1 + 40) + 24);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke_2;
    aBlock[3] = &__block_descriptor_36_e5_I8__0l;
    int v13 = v6;
    uint64_t v8 = _Block_copy(aBlock);
    [v7 finishWithValue:v8];

    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    long long v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = 0;

    uint64_t v9 = 0;
  }
  *(void *)(*(void *)(a1 + 40) + 32) = v9;
}

uint64_t __64__MPCMediaRemoteController__playbackStateDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__22508;
  uint64_t v27 = __Block_byref_object_dispose__22509;
  id v28 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke;
  block[3] = &unk_2643C46A0;
  id v21 = v11;
  uint64_t v22 = &v23;
  block[4] = self;
  id v19 = v10;
  id v20 = v9;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(accessQueue, block);
  id v16 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v16;
}

void __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 176) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v5)
  {
    if (![v5 isInvalid]) {
      return;
    }
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  [v5 disconnect];
  int v6 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [NSString stringWithFormat:@"contentItemRemoteArtwork - %@", *(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDebugLabel:v9];

  [*(id *)(*(void *)(a1 + 32) + 176) setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
  v19[0] = *(void *)(a1 + 48);
  [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v10 = (id)MRPlaybackQueueRequestCreateWithIdentifiers();
  uint64_t v18 = *(void *)(a1 + 56);
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [v10 setRequestedRemoteArtworkFormats:v11];

  long long v12 = [*(id *)(a1 + 32) resolvedPlayerPath];
  uint64_t v13 = [v12 mediaRemotePlayerPath];
  id v14 = dispatch_get_global_queue(21, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke_2;
  v15[3] = &unk_2643C3720;
  uint64_t v17 = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  MEMORY[0x21D49D220](v10, v13, v14, v15);

  if (v10) {
    CFRelease(v10);
  }
}

void __114__MPCMediaRemoteController_contentItemRemoteArtworkForContentItemIdentifier_artworkIdentifier_size_artworkFormat___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 3000, a3, @"Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.");
    id v14 = (id)v4;
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
LABEL_12:
    [v5 finishWithError:v4];
    goto LABEL_13;
  }
  int v6 = (void *)MRPlaybackQueueCopyContentItems();
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v13 = @"Got nil items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.";
LABEL_10:
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = (uint64_t)v14;
    goto LABEL_12;
  }
  if (![v6 count])
  {
    uint64_t v13 = @"Got zero items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.";
    goto LABEL_10;
  }
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  id v9 = [v8 identifier];
  if ([v9 isEqualToString:*(void *)(a1 + 32)])
  {
    id v10 = [v8 remoteArtworks];
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F11B80]];

    if (v11)
    {
      long long v12 = (void *)[objc_alloc(MEMORY[0x263F12100]) initWithMediaRemoteRemoteArtwork:v11];
      id v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, @"Got no RemoteArtwork for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync remote artwork request.");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      long long v12 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, @"Got a different contentItemID from remote artwork loading than when we requested %@ -> %@", v9, *(void *)(a1 + 32));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    long long v12 = 0;
  }

  if (!v12) {
    goto LABEL_11;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithValue:v12];

LABEL_13:
}

- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__22508;
  uint64_t v26 = __Block_byref_object_dispose__22509;
  id v27 = 0;
  accessQueue = self->_accessQueue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke;
  v16[3] = &unk_2643C36F8;
  CGFloat v20 = width;
  CGFloat v21 = height;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = &v22;
  id v12 = v9;
  id v13 = v10;
  dispatch_sync(accessQueue, v16);
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);

  return v14;
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromCGSize(*(CGSize *)(a1 + 64));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 168) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKey:v2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v7)
  {
    if (![v7 isInvalid]) {
      goto LABEL_16;
    }
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  [v7 disconnect];
  uint64_t v8 = [[MPCFuture alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = [NSString stringWithFormat:@"contentItemArtwork[%@] - %@", v2, *(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDebugLabel:v11];

  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    [*(id *)(*(void *)(a1 + 32) + 168) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:v2];
  id v12 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(*(void *)(a1 + 32) + 144) setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [v12 addObject:*(void *)(a1 + 48)];
  id v13 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v14 = [v13 objectForKeyedSubscript:v2];

  if (v14)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) finishWithValue:v14];
  }
  else
  {
    id v15 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v15)
    {
      id v16 = [MEMORY[0x263EFF9A0] dictionary];
      [*(id *)(*(void *)(a1 + 32) + 136) setObject:v16 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    v28[0] = *(void *)(a1 + 48);
    [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    id v17 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();
    MRPlaybackQueueRequestSetIncludeArtwork();
    id v18 = [*(id *)(a1 + 32) resolvedPlayerPath];
    uint64_t v19 = [v18 mediaRemotePlayerPath];
    CGFloat v20 = dispatch_get_global_queue(21, 0);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_2;
    v22[3] = &unk_2643C36D0;
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 56);
    void v22[4] = v21;
    id v23 = v3;
    id v24 = v2;
    id v25 = *(id *)(a1 + 48);
    id v26 = *(id *)(a1 + 40);
    MEMORY[0x21D49D220](v17, v19, v20, v22);

    if (v17) {
      CFRelease(v17);
    }
  }
LABEL_16:
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v9 = (void *)MRPlaybackQueueCopyContentItems();
    id v10 = v9;
    if (v9)
    {
      if ([v9 count])
      {
        [v10 objectAtIndexedSubscript:0];

        id v11 = MRContentItemGetIdentifier();
        if ([v11 isEqualToString:*(void *)(a1 + 56)])
        {
          uint64_t ArtworkData = MRContentItemGetArtworkData();
          if (ArtworkData)
          {
            uint64_t v13 = [objc_alloc(MEMORY[0x263F827E8]) initWithData:ArtworkData];
            if (v13)
            {
              id v14 = (void *)v13;

              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) finishWithValue:v14];
              AnalyticsSendEventLazy();
              uint64_t v15 = *(void *)(a1 + 32);
              id v16 = *(NSObject **)(v15 + 8);
              v38[0] = MEMORY[0x263EF8330];
              v38[1] = 3221225472;
              v38[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_5;
              v38[3] = &unk_2643C36A8;
              v38[4] = v15;
              id v39 = *(id *)(a1 + 64);
              id v40 = *(id *)(a1 + 48);
              id v41 = v14;
              id v4 = v14;
              dispatch_async(v16, v38);

              uint64_t v8 = v39;
              goto LABEL_18;
            }
            uint64_t v19 = (void *)MEMORY[0x263F087E8];
            CGFloat v20 = @"Got invalid image data for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.";
          }
          else
          {
            uint64_t v19 = (void *)MEMORY[0x263F087E8];
            CGFloat v20 = @"Got no image data for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.";
          }
          objc_msgSend(v19, "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, v20, v25, v26);
        }
        else
        {
          objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, @"Got a different artwork identifier from remote artwork loading than when we requested %@ -> %@", v11, *(void *)(a1 + 56));
        id v18 = };

LABEL_17:
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) finishWithError:v18];
        uint64_t v33 = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        long long v35 = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_6;
        long long v36 = &unk_2643C58D0;
        long long v37 = v18;
        id v4 = v18;
        AnalyticsSendEventLazy();
        uint64_t v21 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        void v28[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_7;
        v28[3] = &unk_2643C46A0;
        id v29 = *(id *)(a1 + 40);
        id v22 = *(id *)(a1 + 48);
        uint64_t v23 = *(void *)(a1 + 32);
        id v30 = v22;
        uint64_t v31 = v23;
        long long v27 = *(_OWORD *)(a1 + 64);
        id v24 = (id)v27;
        long long v32 = v27;
        dispatch_async(v21, v28);

        uint64_t v8 = v37;
        goto LABEL_18;
      }
      id v17 = @"Got zero items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.";
    }
    else
    {
      id v17 = @"Got nil items for MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.";
    }
    id v18 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 3000, v17);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 3000, a3, @"Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync artwork request.");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) finishWithError:v4];
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_3;
  block[3] = &unk_2643C4648;
  id v43 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  id v44 = v6;
  uint64_t v45 = v7;
  dispatch_async(v5, block);

  uint64_t v8 = v43;
LABEL_18:
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (v2 == *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v3 = v2;
    [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v2 = v3;
  }
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[7];
  id v3 = [*(id *)(a1[4] + 136) objectForKeyedSubscript:a1[5]];
  [v3 setObject:v2 forKeyedSubscript:a1[6]];
}

id __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [MEMORY[0x263EFF910] date];
  [v2 setObject:@"MPArtworkImage" forKeyedSubscript:@"mediaType"];
  id v4 = NSNumber;
  [v3 timeIntervalSinceNow];
  id v6 = [v4 numberWithDouble:fabs(v5)];
  [v2 setObject:v6 forKeyedSubscript:@"duration"];

  [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"success"];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "msv_analyticSignature");
  [v2 setObject:v7 forKeyedSubscript:@"errorSignature"];

  return v2;
}

void __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_7(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (v3 == *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    [*(id *)(a1 + 32) setObject:0 forKey:*(void *)(a1 + 40)];
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 48) + 136) objectForKeyedSubscript:*(void *)(a1 + 56)];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

id __94__MPCMediaRemoteController_contentItemArtworkForContentItemIdentifier_artworkIdentifier_size___block_invoke_4()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  char v1 = [MEMORY[0x263EFF910] date];
  [v0 setObject:@"MPArtworkImage" forKeyedSubscript:@"mediaType"];
  uint64_t v2 = NSNumber;
  [v1 timeIntervalSinceNow];
  id v4 = [v2 numberWithDouble:fabs(v3)];
  [v0 setObject:v4 forKeyedSubscript:@"duration"];

  [v0 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"success"];

  return v0;
}

- (int64_t)contentItemArtworkCacheStateForArtworkIdentifier:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__MPCMediaRemoteController_contentItemArtworkCacheStateForArtworkIdentifier_size___block_invoke;
  block[3] = &unk_2643C3660;
  CGFloat v15 = width;
  CGFloat v16 = height;
  void block[4] = self;
  id v13 = v7;
  id v14 = &v17;
  id v9 = v7;
  dispatch_sync(accessQueue, block);
  int64_t v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __82__MPCMediaRemoteController_contentItemArtworkCacheStateForArtworkIdentifier_size___block_invoke(uint64_t a1)
{
  NSStringFromCGSize(*(CGSize *)(a1 + 56));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKey:*(void *)(a1 + 40)];
  double v3 = [v2 objectForKey:v4];

  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 2000, a3, @"Got error from MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync one-off content item request.");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishWithError:v4];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_3;
    block[3] = &unk_2643C4648;
    void block[4] = v5;
    id v7 = (id *)v20;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v20[0] = v8;
    v20[1] = v9;
    dispatch_async(v6, block);
  }
  else
  {
    int64_t v10 = (void *)MRPlaybackQueueCopyContentItems();
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_4;
    v15[3] = &unk_2643C66B0;
    id v7 = &v16;
    void v15[4] = v11;
    CGFloat v16 = v10;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    id v17 = v13;
    uint64_t v18 = v14;
    id v4 = v10;
    dispatch_async(v12, v15);
  }
}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_3(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 160) objectForKey:a1[5]];
  if (v2 == *(void **)(*(void *)(a1[6] + 8) + 40))
  {
    id v3 = v2;
    [*(id *)(a1[4] + 112) removeObjectForKey:a1[5]];
    uint64_t v2 = v3;
  }
}

void __53__MPCMediaRemoteController_contentItemForIdentifier___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_mergeContentItems:", *(void *)(a1 + 40));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) finishWithValue:v2];
}

- (int64_t)contentItemCacheStateForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MPCMediaRemoteController_contentItemCacheStateForIdentifier___block_invoke;
  block[3] = &unk_2643C4648;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__MPCMediaRemoteController_contentItemCacheStateForIdentifier___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
  }
  else
  {
    id v3 = [*(id *)(a1[4] + 160) objectForKey:a1[5]];
    if ([v3 isFinalized]) {
      *(void *)(*(void *)(a1[6] + 8) + 24) = 1;
    }

    id v2 = 0;
  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__125;
  void v35[4] = __Block_byref_object_dispose__126;
  id v36 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke;
  block[3] = &unk_2643C3598;
  uint64_t v33 = v35;
  void block[4] = self;
  int v34 = v6;
  id v11 = v8;
  id v32 = v11;
  dispatch_sync(accessQueue, block);
  id v12 = objc_alloc_init(MEMORY[0x263F54ED0]);
  dispatch_time_t v13 = dispatch_time(0, 5500000000);
  uint64_t v14 = self->_accessQueue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_2;
  v26[3] = &unk_2643C3598;
  id v29 = v35;
  id v15 = v12;
  id v27 = v15;
  id v28 = self;
  int v30 = v6;
  dispatch_after(v13, v14, v26);
  CGFloat v16 = objc_opt_class();
  id v17 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  void v20[2] = __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_128;
  v20[3] = &unk_2643C35C0;
  id v18 = v15;
  id v24 = v35;
  id v21 = v18;
  id v22 = self;
  int v25 = v6;
  id v19 = v9;
  id v23 = v19;
  [v16 sendCommand:v6 options:v11 toPlayerPath:v17 completion:v20];

  _Block_object_dispose(v35, 8);
}

void __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateOptimisticStateForCommand:options:", *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_2(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 32) disarm];
    if (result)
    {
      uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        uint64_t v3 = *(void *)(*(void *)(v1 + 40) + 248);
        id v4 = (void *)MRMediaRemoteCopyCommandDescription();
        int v5 = 138543618;
        uint64_t v6 = v3;
        __int16 v7 = 2114;
        id v8 = v4;
        _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "MRC %{public}@: Undo optimistic state [timeout] command=%{public}@", (uint8_t *)&v5, 0x16u);
      }
      return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) + 16))();
    }
  }
  return result;
}

void __59__MPCMediaRemoteController_sendCommand_options_completion___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]
    && [v3 statusCode]
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 248);
      uint64_t v6 = (void *)MRMediaRemoteCopyCommandDescription();
      int v7 = 138543874;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "MRC %{public}@: Undo optimistic state [failed] command=%{public}@ status=%{public}@", (uint8_t *)&v7, 0x20u);
    }
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 8), *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __53__MPCMediaRemoteController_playbackQueueParticipants__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithValue:MEMORY[0x263EFFA68]];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == *(void *)(v3 + 56)) {
    *(void *)(v3 + 64) = 1;
  }
  return result;
}

- (id)mediaRemoteArtworkDataSource
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__22508;
  id v10 = __Block_byref_object_dispose__22509;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__MPCMediaRemoteController_mediaRemoteArtworkDataSource__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__MPCMediaRemoteController_mediaRemoteArtworkDataSource__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);
  if (!v2)
  {
    id v3 = [[MPCMRArtworkDataSource alloc] initWithController:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 208);
    *(void *)(v4 + 208) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (id)remoteArtworkDataSource
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__22508;
  id v10 = __Block_byref_object_dispose__22509;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__MPCMediaRemoteController_remoteArtworkDataSource__block_invoke;
  v5[3] = &unk_2643C67A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__MPCMediaRemoteController_remoteArtworkDataSource__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 216);
  if (!v2)
  {
    id v3 = [[MPCMRRemoteArtworkDataSource alloc] initWithController:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 216);
    *(void *)(v4 + 216) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 216);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (void)dealloc
{
  MEMORY[0x21D49D7C0](self->_stateHandle, a2);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)MPCMediaRemoteController;
  [(MPCMediaRemoteController *)&v4 dealloc];
}

uint64_t __33__MPCMediaRemoteController__init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      __int16 v9 = objc_msgSend(WeakRetained, "_onQueue_stateDictionary");
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)_sendCommand:(unsigned int)a3 playbackIntent:(id)a4 options:(id)a5 toPlayerPath:(id)a6 completion:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    id v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"MPCMediaRemoteController.m", 221, @"Invalid parameter not satisfying: %@", @"playbackIntent" object file lineNumber description];
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke;
  v22[3] = &unk_2643C3488;
  id v23 = v13;
  id v24 = v14;
  id v26 = v16;
  id v27 = a1;
  unsigned int v28 = a3;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v16;
  id v20 = v13;
  [v17 getPlaybackIntentDestinationWithCompletion:v22];
}

void __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 1000, a3, @"Failed to create playback queue from playback intent %@", *(void *)(a1 + 32));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [MEMORY[0x263F121D0] statusWithCode:200 error:v10];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"];
    [*(id *)(a1 + 32) setDelegateTokenB:v7];

    uint64_t v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke_2;
    v11[3] = &unk_2643C3460;
    id v12 = v8;
    id v15 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v16 = a2;
    uint64_t v17 = v9;
    int v18 = *(_DWORD *)(a1 + 72);
    id v14 = *(id *)(a1 + 48);
    [v12 getRemotePlaybackQueueWithDestination:a2 completion:v11];
  }
}

void __88__MPCMediaRemoteController__sendCommand_playbackIntent_options_toPlayerPath_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v25 = a2;
  if (v25)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v5 setObject:0 forKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"];
    [v5 setObject:0 forKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionDelegationTokenB"];
    uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent"];
    int v7 = v25;
    if (v6)
    {
      uint64_t v8 = [v6 integerValue];
      if ((unint64_t)(v8 - 1) >= 3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v8;
      }
      [v5 setObject:0 forKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionReplaceIntent"];
      [v25 setReplaceIntent:v9];
      int v7 = v25;
    }
    id v10 = v7;
    [v10 _mediaRemotePlaybackQueue];
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    if (ExternalRepresentation)
    {
      [v5 setObject:ExternalRepresentation forKeyedSubscript:*MEMORY[0x263F54DA8]];
      id v12 = [v10 mediaRemoteOptions];
      [v5 addEntriesFromDictionary:v12];

      uint64_t v13 = *(void *)(a1 + 64);
      if (v13 == 3)
      {
        id v14 = objc_alloc(MEMORY[0x263F89100]);
        id v15 = [MEMORY[0x263F08AB0] processInfo];
        uint64_t v16 = [v15 processName];
        uint64_t v17 = [@"com.apple.MediaPlaybackCore.performRemoteQueueCommand-" stringByAppendingString:v16];
        int v18 = (void *)[v14 initWithName:v17];

        id v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
        [v18 setExpirationDate:v19];

        id v20 = [MEMORY[0x263F890F8] sharedService];
        [v20 addAssertion:v18];

        uint64_t v13 = *(void *)(a1 + 64);
      }
      [*(id *)(a1 + 72) _sendCommand:*(unsigned int *)(a1 + 80) options:v5 appOptions:v13 != 1 toPlayerPath:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      id v22 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 1000, @"Failed to create external representation from playback queue %@", v10);
      uint64_t v23 = *(void *)(a1 + 56);
      id v24 = [MEMORY[0x263F121D0] statusWithCode:200 error:v22];
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 1000, a3, @"Failed to create playback queue from playback intent %@", *(void *)(a1 + 32));
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v6 = [MEMORY[0x263F121D0] statusWithCode:200 error:v5];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v6);
  }
}

+ (void)_sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 toPlayerPath:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke;
  aBlock[3] = &unk_2643C33E8;
  id v13 = v12;
  id v33 = v13;
  unsigned int v34 = a3;
  id v14 = a6;
  id v15 = _Block_copy(aBlock);
  uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  int v18 = [v11 objectForKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionDevices"];
  if (v18)
  {
    id v25 = (void *)[v11 mutableCopy];
    [v25 removeObjectForKey:@"MPCPlayerCommandRequestMediaRemoteOptionDevices"];
    id v24 = v25;

    id v26 = _MPCLogCategoryMediaRemote();
    id v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SendCommand:groupDevicesAndSendCommand", "", buf, 2u);
    }

    [v14 mediaRemotePlayerPath];
    uint64_t v21 = [a1 mediaRemoteReplyQueue];
    v29[2] = MEMORY[0x263EF8330];
    v29[3] = 3221225472;
    v29[4] = __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_50;
    v29[5] = &unk_2643C3410;
    id v22 = (id *)v30;
    v30[0] = v15;
    v30[1] = v17;
    id v28 = v15;
    MRAVEndpointGroupDevicesAndSendCommandWithResult();
  }
  else
  {
    id v19 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    id v20 = v19;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SendCommand:sendCommandToPlayer", "", buf, 2u);
    }

    [v14 mediaRemotePlayerPath];
    uint64_t v21 = [a1 mediaRemoteReplyQueue];
    id v22 = (id *)v29;
    v29[0] = v15;
    v29[1] = v17;
    id v23 = v15;
    MRMediaRemoteSendCommandToPlayerWithResult();
    id v24 = v11;
  }
}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v13 = a3;
  id v7 = a4;
  if (a2 != 11 && a2)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = (void *)MEMORY[0x263F121D0];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlayerRequestError", 1000, v13, @"Failed to send command %ld", *(unsigned int *)(a1 + 40));
    id v12 = [v11 statusWithCode:200 error:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = MPRemoteCommandStatusFromMRSendCommandResultStatus();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SendCommand:groupDevicesAndSendCommand", "", v16, 2u);
  }

  uint64_t v10 = [v5 error];
  uint64_t v11 = [v5 sendError];
  if (v6)
  {
    id v12 = v6;

    if (v11) {
      uint64_t v11 = v11;
    }
    else {
      uint64_t v11 = 2;
    }
    uint64_t v10 = v12;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [v5 resultStatuses];
  id v15 = [v14 firstObject];
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v13 + 16))(v13, v11, v10, v15);
}

void __84__MPCMediaRemoteController__sendCommand_options_appOptions_toPlayerPath_completion___block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SendCommand:sendCommandToPlayer", "", v14, 2u);
  }

  uint64_t v7 = [v3 sendError];
  if (!v7)
  {
    uint64_t v8 = [v3 resultStatuses];
    uint64_t v9 = [v8 count];

    if (v9) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = 5;
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = [v3 error];
  id v12 = [v3 resultStatuses];
  uint64_t v13 = [v12 firstObject];
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v10 + 16))(v10, v7, v11, v13);
}

+ (void)sendCommand:(unsigned int)a3 options:(id)a4 toPlayerPath:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v12 objectForKeyedSubscript:@"MPCPlayerCommandRequestMediaRemoteOptionPlaybackIntent"];
  id v14 = (id)v13;
  if (v13) {
    [a1 _sendCommand:v8 playbackIntent:v13 options:v12 toPlayerPath:v11 completion:v10];
  }
  else {
    [a1 _sendCommand:v8 options:v12 appOptions:v8 == 132 toPlayerPath:v11 completion:v10];
  }
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_37(uint64_t a1)
{
  uint64_t v2 = controllerForPlayerPath____playerPathControllersQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2;
  uint64_t v9 = &unk_2643C67A0;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v4;
  dispatch_async(v2, &v6);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "invalidate", v6, v7, v8, v9);
  id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) result];
  [v5 invalidateAllTokens];
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_41(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) finishWithError:a2];
  id v3 = controllerForPlayerPath____playerPathControllersQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2_42;
  v6[3] = &unk_2643C67A0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, v6);
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2_42(uint64_t a1)
{
  uint64_t v2 = [(id)controllerForPlayerPath____playerPathControllers objectForKey:*(void *)(a1 + 32)];
  if (v2 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v3 = v2;
    [(id)controllerForPlayerPath____playerPathControllers removeObjectForKey:*(void *)(a1 + 32)];
    uint64_t v2 = v3;
  }
}

void __52__MPCMediaRemoteController_controllerForPlayerPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)controllerForPlayerPath____playerPathControllers objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v2 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v3 = v2;
    [(id)controllerForPlayerPath____playerPathControllers removeObjectForKey:*(void *)(a1 + 32)];
    uint64_t v2 = v3;
  }
}

+ (OS_dispatch_queue)mediaRemoteReplyQueue
{
  if (mediaRemoteReplyQueue_onceToken != -1) {
    dispatch_once(&mediaRemoteReplyQueue_onceToken, &__block_literal_global_22699);
  }
  uint64_t v2 = (void *)mediaRemoteReplyQueue___mediaRemoteReplyQueue;

  return (OS_dispatch_queue *)v2;
}

void __49__MPCMediaRemoteController_mediaRemoteReplyQueue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MediaPlaybackCore/MediaRemoteReplyQueue", v0);
  uint64_t v2 = (void *)mediaRemoteReplyQueue___mediaRemoteReplyQueue;
  mediaRemoteReplyQueue___mediaRemoteReplyQueue = (uint64_t)v1;
}

@end