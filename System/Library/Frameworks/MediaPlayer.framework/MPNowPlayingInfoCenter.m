@interface MPNowPlayingInfoCenter
+ (MPNowPlayingInfoCenter)defaultCenter;
+ (OS_dispatch_queue)serviceQueue;
+ (id)infoCenterForPlayerID:(id)a3;
+ (id)infoCenterForPlayerPath:(id)a3;
- (BOOL)isInvalidated;
- (BOOL)supportsArtworkCatalogLoading;
- (MPNowPlayingContentItem)nowPlayingContentItem;
- (MPNowPlayingInfoCenter)init;
- (MPNowPlayingInfoCenter)initWithPlayerID:(id)a3;
- (MPNowPlayingInfoCenter)initWithPlayerPath:(id)a3;
- (MPNowPlayingInfoLyricsDelegate)lyricsDelegate;
- (MPNowPlayingPlaybackQueueDataSource)playbackQueueDataSource;
- (MPNowPlayingPlaybackQueueDelegate)playbackQueueDelegate;
- (MPNowPlayingPlaybackState)playbackState;
- (MRPlayerPath)playerPath;
- (NSDictionary)nowPlayingInfo;
- (NSString)playerID;
- (NSString)representedApplicationBundleIdentifier;
- (OS_dispatch_queue)dataSourceQueue;
- (id)_artworkCatalogForContentItem:(id)a3;
- (id)_childContentItemForContentItem:(id)a3 index:(int64_t)a4;
- (id)_contentItemForIdentifier:(id)a3;
- (id)_contentItemForIdentifier:(id)a3 alreadyOnDataSourceQueue:(BOOL)a4;
- (id)_contentItemIDsInRange:(id)a3 itemsRange:(id *)a4;
- (id)_onDataSourceQueue_artworkCatalogForContentItem:(id)a3;
- (id)_onQueue_stateDictionary;
- (id)artworkCatalogBlockForContentItem:(id)a3;
- (void)_becomeActiveIfPossibleWithCompletion:(id)a3;
- (void)_becomeActiveWithCompletion:(id)a3;
- (void)_contentItemChangedNotification:(id)a3;
- (void)_createPlaybackQueueForRequest:(void *)a3;
- (void)_getMetadataForContentItem:(id)a3 completion:(id)a4;
- (void)_getTransportablePlaybackSessionRepresentationWithIdentifier:(id)a3 preferredSessionType:(id)a4 completion:(id)a5;
- (void)_initializeNowPlayingInfo;
- (void)_invalidatePlaybackQueueImmediatelyWithCompletion:(id)a3;
- (void)_onDataSourceQueue_getContentItemIDsInRange:(_MSVSignedRange)a3 completion:(id)a4;
- (void)_onQueue_clearPlaybackQueueDataSourceCallbacks;
- (void)_onQueue_pushContentItemsUpdate;
- (void)_onQueue_pushNowPlayingInfoAndRetry:(BOOL)a3;
- (void)_onQueue_registerLyricsDelegateCallbacks:(id)a3;
- (void)_onQueue_registerPlaybackQueueDataSourceCallbacks:(id)a3;
- (void)becomeActive;
- (void)becomeActiveSystemFallback;
- (void)dealloc;
- (void)invalidate;
- (void)invalidatePlaybackQueue;
- (void)invalidatePlaybackQueueWithCompletion:(id)a3;
- (void)resignActiveSystemFallback;
- (void)setDataSourceQueue:(id)a3;
- (void)setLyricsDelegate:(id)a3;
- (void)setNowPlayingContentItem:(id)a3;
- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo;
- (void)setPlaybackQueueDataSource:(id)a3;
- (void)setPlaybackQueueDelegate:(id)a3;
- (void)setPlaybackState:(MPNowPlayingPlaybackState)playbackState;
- (void)setRepresentedApplicationBundleIdentifier:(id)a3;
@end

@implementation MPNowPlayingInfoCenter

void __49__MPNowPlayingInfoCenter_playbackQueueDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

uint64_t __39__MPNowPlayingInfoCenter_isInvalidated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 280);
  return result;
}

- (MPNowPlayingInfoCenter)initWithPlayerID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F770A8]) initWithIdentifier:v4 displayName:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F770A8] defaultPlayer];
  }
  v6 = (void *)v5;
  id v7 = objc_alloc(MEMORY[0x1E4F770B0]);
  v8 = [MEMORY[0x1E4F77098] localOrigin];
  v9 = [MEMORY[0x1E4F76FE8] localClient];
  v10 = (void *)[v7 initWithOrigin:v8 client:v9 player:v6];

  v11 = [(MPNowPlayingInfoCenter *)self initWithPlayerPath:v10];
  return v11;
}

+ (id)infoCenterForPlayerID:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F770A8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithIdentifier:v4 displayName:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F770B0]);
  id v7 = [MEMORY[0x1E4F77098] localOrigin];
  v8 = [MEMORY[0x1E4F76FE8] localClient];
  v9 = (void *)[v6 initWithOrigin:v7 client:v8 player:v5];

  v10 = [(id)objc_opt_class() infoCenterForPlayerPath:v9];

  return v10;
}

+ (id)infoCenterForPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  uint64_t v5 = [(id)__infoCenterMap objectForKey:v3];
  objc_sync_exit(v4);

  return v5;
}

- (MPNowPlayingInfoCenter)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MPNowPlayingInfoCenter;
  id v6 = [(MPNowPlayingInfoCenter *)&v38 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke;
  block[3] = &unk_1E57F9EA8;
  v8 = v6;
  v37 = v8;
  if (initWithPlayerPath__onceToken != -1)
  {
    dispatch_once(&initWithPlayerPath__onceToken, block);
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    id v5 = [MEMORY[0x1E4F770B0] localPlayerPath];
  }
LABEL_5:
  uint64_t v9 = [v5 copy];
  playerPath = v8->_playerPath;
  v8->_playerPath = (MRPlayerPath *)v9;

  v11 = [(id)objc_opt_class() infoCenterForPlayerPath:v8->_playerPath];

  if (v11)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, v8, @"MPNowPlayingInfoCenter.m", 131, @"Cannot have two MPNowPlayingInfoCenters for the same playerPath: %@", v5 object file lineNumber description];
  }
  v12 = objc_opt_class();
  objc_sync_enter(v12);
  [(id)__infoCenterMap setObject:v8 forKey:v8->_playerPath];
  objc_sync_exit(v12);

  v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  objc_storeStrong((id *)&v8->_dataSourceQueue, MEMORY[0x1E4F14428]);
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/accessQueue", 0);
  accessQueue = v8->_accessQueue;
  v8->_accessQueue = (OS_dispatch_queue *)v15;

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/calloutQueue", v13);
  calloutQueue = v8->_calloutQueue;
  v8->_calloutQueue = (OS_dispatch_queue *)v17;

  dispatch_queue_t v19 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/utilityQueue", v14);
  utilityQueue = v8->_utilityQueue;
  v8->_utilityQueue = (OS_dispatch_queue *)v19;

  v21 = [[MPArtworkResizeUtility alloc] initWithQualityOfService:17];
  artworkResizeUtility = v8->_artworkResizeUtility;
  v8->_artworkResizeUtility = v21;

  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  contentItemIdentifiers = v8->_contentItemIdentifiers;
  v8->_contentItemIdentifiers = (NSMutableArray *)v23;

  uint64_t v25 = [objc_alloc(MEMORY[0x1E4F77998]) initWithMaximumCapacity:201];
  contentItems = v8->_contentItems;
  v8->_contentItems = (MSVLRUDictionary *)v25;

  uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
  mutatedContentItems = v8->_mutatedContentItems;
  v8->_mutatedContentItems = (NSMutableDictionary *)v27;

  uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
  mutatedPlaybackQueueRequests = v8->_mutatedPlaybackQueueRequests;
  v8->_mutatedPlaybackQueueRequests = (NSMutableDictionary *)v29;

  v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v31 addObserver:v8 selector:sel__contentItemChangedNotification_ name:@"_MPContentItemDidChangeNotification" object:0];

  [(MPNowPlayingInfoCenter *)v8 _initializeNowPlayingInfo];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2;
  v34[3] = &unk_1E57F6298;
  v35 = v8;
  v35->_stateHandle = __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2((uint64_t)v34);

LABEL_8:
  return v7;
}

uint64_t __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v3, &location);
  uint64_t v1 = MSVLogAddStateHandler();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
  return v1;
}

- (void)_initializeNowPlayingInfo
{
  id v3 = objc_alloc_init(MPNowPlayingInfoCenterArtworkContext);
  publishedContext = self->_publishedContext;
  self->_publishedContext = v3;
}

uint64_t __64__MPNowPlayingInfoCenter_invalidatePlaybackQueueWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlaybackQueueImmediatelyWithCompletion:*(void *)(a1 + 40)];
}

- (void)invalidatePlaybackQueue
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)becomeActive
{
}

uint64_t __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

uint64_t __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_228(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isInvalidated];
  if ((result & 1) == 0)
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 32);
      id v5 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(v6 + 304);
      id v8 = v4;
      uint64_t v9 = [v5 valueForKey:@"identifier"];
      v10 = [v9 componentsJoinedByString:@", "];
      int v11 = 138413058;
      v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> sending content items changed: %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    return MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer();
  }
  return result;
}

void __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_235(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 304);
  uint64_t v5 = *MEMORY[0x1E4F77868];
  v7[0] = *MEMORY[0x1E4F77878];
  v7[1] = v5;
  v8[0] = v4;
  v8[1] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 postNotificationName:@"_MPNowPlayingContentItemsDidChangeNotification" object:0 userInfo:v6];
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_5(void *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1[9] + 8) + 40);
  if (v2)
  {
    v14[0] = [v2 _mediaRemoteContentItem];
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F770A0]) initWithContentItems:v3 location:0];
  uint64_t v5 = v4;
  if (a1[4]) {
    objc_msgSend(v4, "setQueueIdentifier:");
  }
  if (a1[5]) {
    objc_msgSend(v5, "setProperties:");
  }
  if (a1[6]) {
    objc_msgSend(v5, "setAuxiliaryNowPlayingInfo:");
  }
  uint64_t v6 = [(id)objc_opt_class() serviceQueue];
  int v11 = v5;
  id v7 = v5;
  msv_dispatch_sync_on_queue();

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = a1[7];
  uint64_t v12 = *MEMORY[0x1E4F77878];
  uint64_t v13 = *(void *)(v9 + 304);
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v8 postNotificationName:@"_MPNowPlayingInfoCenterPlaybackQueueDidChangeNotification" object:v9 userInfo:v10];

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)_onQueue_pushContentItemsUpdate
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated && [(NSMutableDictionary *)self->_mutatedContentItems count])
  {
    v40 = [MEMORY[0x1E4F1CA48] array];
    v37 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_mutatedContentItems allValues];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v39 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v49 != v39) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id *)(*((void *)&v48 + 1) + 8 * i);
          objc_msgSend(v40, "addObject:", objc_msgSend(v7, "_mediaRemoteContentItem"));
          contentItems = self->_contentItems;
          uint64_t v9 = [v7 identifier];
          v10 = [(MSVLRUDictionary *)contentItems objectForKeyedSubscript:v9];

          uint64_t v11 = [v7 artworkIdentifier];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            [v7 artworkIdentifier];
            v14 = uint64_t v13 = v3;
            __int16 v15 = [v10 artworkIdentifier];
            char v16 = [v14 isEqualToString:v15];

            uint64_t v3 = v13;
            if ((v16 & 1) == 0)
            {
              __int16 v17 = [v7 identifier];
              [v13 addObject:v17];
            }
          }
          if (v10)
          {
            v18 = (void *)[v10 copy];

            [v18 _mergeContentItem:v7];
            uint64_t v19 = self->_contentItems;
            v20 = [v7 identifier];
            [(MSVLRUDictionary *)v19 setObject:v18 forKeyedSubscript:v20];
          }
          v21 = [(MPContentItem *)self->_nowPlayingContentItem identifier];
          v22 = [v7 identifier];
          int v23 = [v21 isEqual:v22];

          if (v23)
          {
            v24 = (MPNowPlayingContentItem *)[(MPNowPlayingContentItem *)self->_nowPlayingContentItem copy];
            [(MPNowPlayingContentItem *)v24 _mergeContentItem:v7];
            nowPlayingContentItem = self->_nowPlayingContentItem;
            self->_nowPlayingContentItem = v24;
          }
          mutatedPlaybackQueueRequests = self->_mutatedPlaybackQueueRequests;
          uint64_t v27 = [v7 identifier];
          v28 = [(NSMutableDictionary *)mutatedPlaybackQueueRequests objectForKeyedSubscript:v27];

          if (v28)
          {
            MRPlaybackQueueRequestSetIncludeMetadata();
            CFRetain(v28);
            uint64_t v29 = [(id)objc_opt_class() serviceQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke;
            block[3] = &unk_1E57F49E8;
            v47 = v28;
            void block[4] = self;
            block[5] = v7;
            id v46 = v3;
            dispatch_async(v29, block);
          }
          else
          {
            id v30 = v7;
            uint64_t v31 = [v30 _mediaRemoteContentItem];
            v32 = [v30 identifier];
            char v33 = [v3 containsObject:v32];

            if ((v33 & 1) == 0) {
              MRContentItemSetArtworkIdentifier();
            }
            [v37 addObject:v31];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v5);
    }
    if ([v37 count])
    {
      v34 = [(id)objc_opt_class() serviceQueue];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_228;
      v43[3] = &unk_1E57F9F98;
      v43[4] = self;
      id v44 = v37;
      dispatch_async(v34, v43);
    }
    calloutQueue = self->_calloutQueue;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke_235;
    v41[3] = &unk_1E57F9F98;
    v41[4] = self;
    id v42 = v40;
    id v36 = v40;
    dispatch_async(calloutQueue, v41);
    [(NSMutableDictionary *)self->_mutatedContentItems removeAllObjects];
    [(NSMutableDictionary *)self->_mutatedPlaybackQueueRequests removeAllObjects];
  }
}

- (void)_getMetadataForContentItem:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__32543;
  uint64_t v25 = __Block_byref_object_dispose__32544;
  id v26 = 0;
  uint64_t v9 = [v7 identifier];
  void block[6] = MEMORY[0x1E4F143A8];
  block[7] = 3221225472;
  block[8] = __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke;
  block[9] = &unk_1E57F9F48;
  v20 = &v21;
  block[10] = self;
  id v10 = v9;
  id v19 = v10;
  msv_dispatch_sync_on_queue();
  uint64_t v11 = v22[5];
  if (!v11 && v10)
  {
    uint64_t v12 = [(MPNowPlayingInfoCenter *)self _contentItemForIdentifier:v10];
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;

    uint64_t v14 = (void *)v22[5];
    if (!v14) {
      goto LABEL_9;
    }
    __int16 v15 = [v14 identifier];
    if (([v10 isEqualToString:v15] & 1) == 0)
    {
      __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"MPNowPlayingInfoCenter.m", 585, @"MPNowPlayingPlaybackQueueDataSource produced content item does not match requested identifier: requestedID=%@ contentItemID=%@", v10, v15 object file lineNumber description];
    }
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke_2;
    block[3] = &unk_1E57F9F20;
    void block[4] = self;
    block[5] = &v21;
    dispatch_async(accessQueue, block);

    uint64_t v11 = v22[5];
  }
  if (v11) {
    objc_msgSend(v7, "_mergeContentItem:");
  }
LABEL_9:
  v8[2](v8, 0);

  _Block_object_dispose(&v21, 8);
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_2(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_3;
  v10[3] = &unk_1E57F9F48;
  v10[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v6;
  long long v11 = v6;
  +[MPContentItem performSuppressingChangeNotifications:v10];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_4;
  block[3] = &unk_1E57F9F48;
  void block[4] = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v9 = v7;
  dispatch_async(v4, block);
}

void __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 _mediaRemoteContentItem];
    MRContentItemMerge();
    id v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      long long v7 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(v8 + 304);
      id v10 = v6;
      long long v11 = [v7 identifier];
      *(_DWORD *)buf = 138413058;
      long long v48 = v6;
      __int16 v49 = 2048;
      uint64_t v50 = v8;
      __int16 v51 = 2112;
      uint64_t v52 = v9;
      __int16 v53 = 2114;
      v54 = v11;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> Content item mutated [already enqueued for update]: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(v15 + 304);
      id v17 = v13;
      v18 = [v14 identifier];
      *(_DWORD *)buf = 138413058;
      long long v48 = v13;
      __int16 v49 = 2048;
      uint64_t v50 = v15;
      __int16 v51 = 2112;
      uint64_t v52 = v16;
      __int16 v53 = 2114;
      v54 = v18;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> Content item mutated: %{public}@", buf, 0x2Au);
    }
    id v5 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:*(void *)(a1 + 56)];
    id v19 = *(void **)(*(void *)(a1 + 32) + 64);
    v20 = [*(id *)(a1 + 40) identifier];
    [v19 setObject:v5 forKeyedSubscript:v20];
  }
  uint64_t v21 = [*(id *)(a1 + 48) userInfo];
  v22 = [v21 objectForKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyDeltaRequest"];

  if (v22)
  {
    uint64_t v23 = *(void **)(*(void *)(a1 + 32) + 72);
    v24 = [*(id *)(a1 + 40) identifier];
    uint64_t v25 = [v23 objectForKeyedSubscript:v24];

    if (v25)
    {
      MRPlaybackQueueRequestMerge();
    }
    else
    {
      id v26 = *(void **)(*(void *)(a1 + 32) + 72);
      uint64_t v27 = [*(id *)(a1 + 40) identifier];
      [v26 setObject:v22 forKeyedSubscript:v27];
    }
  }
  v28 = [*(id *)(a1 + 48) userInfo];
  uint64_t v29 = [v28 objectForKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyImmediately"];
  int v30 = [v29 BOOLValue];

  if (v30)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushContentItemsUpdate");
    goto LABEL_25;
  }
  MRContentItemGetPlaybackRate();
  BOOL v32 = v31 > 2.2204e-16;
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 160);
  if (v31 <= 2.2204e-16)
  {
    if (v34) {
      goto LABEL_25;
    }
    qos_class_t v38 = qos_class_self();
    if (MSVDeviceIsWatch())
    {
      double v35 = 0.2;
    }
    else if (MSVDeviceIsAudioAccessory())
    {
      double v35 = 0.2;
    }
    else
    {
      double v35 = 0.1;
    }
LABEL_24:
    *(unsigned char *)(*(void *)(a1 + 32) + 168) = v32;
    uint64_t v39 = (void *)MEMORY[0x1E4F77A30];
    uint64_t v40 = *(void *)(a1 + 32);
    uint64_t v41 = *(void *)(v40 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke_226;
    block[3] = &unk_1E57F9EA8;
    void block[4] = v40;
    dispatch_block_t v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v38, 0, block);
    uint64_t v43 = [v39 timerWithInterval:0 repeats:v41 queue:v42 block:v35];
    uint64_t v44 = *(void *)(a1 + 32);
    v45 = *(void **)(v44 + 160);
    *(void *)(v44 + 160) = v43;

    goto LABEL_25;
  }
  double v35 = 0.01;
  if (!v34
    || !*(unsigned char *)(v33 + 168)
    && ([v34 invalidate],
        uint64_t v36 = *(void *)(a1 + 32),
        v37 = *(void **)(v36 + 160),
        *(void *)(v36 + 160) = 0,
        v37,
        !*(void *)(*(void *)(a1 + 32) + 160)))
  {
    qos_class_t v38 = QOS_CLASS_USER_INITIATED;
    goto LABEL_24;
  }
LABEL_25:
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  long long v6 = a4;
  if (MRContentItemGetHasMetadata())
  {
    v6[2](v6, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12;
    v9[3] = &unk_1E57F90A0;
    id v10 = v6;
    [WeakRetained _getMetadataForContentItem:v8 completion:v9];
  }
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) playbackQueueDataSource];
  id v2 = [v6 nowPlayingInfoCenter:*(void *)(a1 + 32) contentItemForID:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_onQueue_registerPlaybackQueueDataSourceCallbacks:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    [(MPNowPlayingInfoCenter *)self _onQueue_clearPlaybackQueueDataSourceCallbacks];
    if (v4)
    {
      objc_initWeak(location, self);
      if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      {
        if (objc_opt_respondsToSelector())
        {
          v35[1] = (id)MEMORY[0x1E4F143A8];
          v35[2] = (id)3221225472;
          v35[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke;
          v35[4] = &unk_1E57F46A0;
          objc_copyWeak(&v36, location);
          MRMediaRemotePlaybackSessionSetMigrateBeginCallback();
          objc_destroyWeak(&v36);
        }
        if (objc_opt_respondsToSelector())
        {
          v34[1] = (id)MEMORY[0x1E4F143A8];
          v34[2] = (id)3221225472;
          v34[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3;
          void v34[4] = &unk_1E57F46C8;
          objc_copyWeak(v35, location);
          MRMediaRemotePlaybackSessionSetMigrateEndCallback();
          objc_destroyWeak(v35);
        }
        v33[1] = (id)MEMORY[0x1E4F143A8];
        v33[2] = (id)3221225472;
        v33[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5;
        v33[4] = &unk_1E57F4718;
        objc_copyWeak(v34, location);
        MRMediaRemotePlaybackSessionSetRequestCallback();
        objc_destroyWeak(v34);
      }
      id v5 = [(id)objc_opt_class() serviceQueue];
      v32[1] = (id)MEMORY[0x1E4F143A8];
      v32[2] = (id)3221225472;
      v32[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7;
      v32[4] = &unk_1E57F4740;
      objc_copyWeak(v33, location);
      self->_callbacks.createPlaybackQueue = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreatePlaybackQueueForRequestCallbackForPlayer();

      id v6 = [(id)objc_opt_class() serviceQueue];
      v31[1] = (id)MEMORY[0x1E4F143A8];
      v31[2] = (id)3221225472;
      v31[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8;
      v31[4] = &unk_1E57F4768;
      objc_copyWeak(v32, location);
      self->_callbacks.createContentItem = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreateContentItemForIdentifierCallbackForPlayer();

      if (objc_opt_respondsToSelector())
      {
        long long v7 = [(id)objc_opt_class() serviceQueue];
        v30[1] = (id)MEMORY[0x1E4F143A8];
        v30[2] = (id)3221225472;
        v30[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9;
        v30[4] = &unk_1E57F47B8;
        objc_copyWeak(v31, location);
        self->_callbacks.createChildItem = (void *)MRMediaRemotePlaybackQueueDataSourceAddCreateChildContentItemCallbackForPlayer();

        objc_destroyWeak(v31);
      }
      id v8 = [(id)objc_opt_class() serviceQueue];
      v29[1] = (id)MEMORY[0x1E4F143A8];
      v29[2] = (id)3221225472;
      v29[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11;
      v29[4] = &unk_1E57F47E0;
      objc_copyWeak(v30, location);
      self->_callbacks.metadata = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemMetadataCallbackForPlayer();

      uint64_t v9 = [(id)objc_opt_class() serviceQueue];
      v28[1] = (id)MEMORY[0x1E4F143A8];
      v28[2] = (id)3221225472;
      v28[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13;
      v28[4] = &unk_1E57F47E0;
      objc_copyWeak(v29, location);
      self->_callbacks.artwork = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemArtworkCallbackForPlayer();

      if (objc_opt_respondsToSelector())
      {
        id v10 = [(id)objc_opt_class() serviceQueue];
        v27[1] = (id)MEMORY[0x1E4F143A8];
        v27[2] = (id)3221225472;
        v27[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_140;
        v27[4] = &unk_1E57F47E0;
        objc_copyWeak(v28, location);
        self->_callbacks.formattedArtwork = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemFormattedArtworkCallbackForPlayer();

        objc_destroyWeak(v28);
      }
      if (objc_opt_respondsToSelector())
      {
        long long v11 = [(id)objc_opt_class() serviceQueue];
        v26[1] = (id)MEMORY[0x1E4F143A8];
        v26[2] = (id)3221225472;
        v26[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6_158;
        v26[4] = &unk_1E57F47E0;
        objc_copyWeak(v27, location);
        self->_callbacks.lyrics = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemLyricsCallbackForPlayer();

        objc_destroyWeak(v27);
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = [(id)objc_opt_class() serviceQueue];
        v25[1] = (id)MEMORY[0x1E4F143A8];
        v25[2] = (id)3221225472;
        v25[3] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10_165;
        v25[4] = &unk_1E57F47E0;
        objc_copyWeak(v26, location);
        self->_callbacks.info = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemInfoCallbackForPlayer();

        objc_destroyWeak(v26);
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [(id)objc_opt_class() serviceQueue];
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        uint64_t v23 = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14_172;
        v24 = &unk_1E57F47E0;
        objc_copyWeak(v25, location);
        self->_callbacks.transcriptAlignments = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemTranscriptAlignmentsCallbackForPlayer();

        objc_destroyWeak(v25);
      }
      int v14 = objc_opt_respondsToSelector();
      int v15 = objc_opt_respondsToSelector();
      char v16 = v15;
      if ((v14 | v15))
      {
        id v17 = [(id)objc_opt_class() serviceQueue];
        objc_copyWeak(&v18, location);
        char v19 = v14 & 1;
        char v20 = v16 & 1;
        self->_callbacks.languageOptions = (void *)MRMediaRemotePlaybackQueueDataSourceAddContentItemLanguageOptionsCallbackForPlayer();

        objc_destroyWeak(&v18);
      }
      objc_destroyWeak(v29);
      objc_destroyWeak(v30);
      objc_destroyWeak(v32);
      objc_destroyWeak(v33);
      objc_destroyWeak(location);
    }
  }
}

+ (OS_dispatch_queue)serviceQueue
{
  if (serviceQueue_onceToken != -1) {
    dispatch_once(&serviceQueue_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)serviceQueue___serviceQueue;

  return (OS_dispatch_queue *)v2;
}

- (void)_onQueue_clearPlaybackQueueDataSourceCallbacks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__MPNowPlayingInfoCenter__onQueue_clearPlaybackQueueDataSourceCallbacks__block_invoke;
    v4[3] = &unk_1E57F4628;
    v4[4] = self;
    uint64_t v3 = (void (**)(void, void))MEMORY[0x19971E0F0](v4);
    ((void (**)(void, $6ABC577084DBE3C9E4C820F9B0F2273B *))v3)[2](v3, &self->_callbacks);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.createContentItem);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.createChildItem);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.metadata);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.artwork);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.formattedArtwork);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.info);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.transcriptAlignments);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.languageOptions);
    ((void (**)(void, void **))v3)[2](v3, &self->_callbacks.lyrics);
    MRMediaRemotePlaybackSessionSetRequestCallback();
  }
}

uint64_t __72__MPNowPlayingInfoCenter__onQueue_clearPlaybackQueueDataSourceCallbacks__block_invoke(uint64_t a1, void *a2)
{
  if (*a2)
  {
    uint64_t result = MRMediaRemotePlaybackQueueDataSourceRemoveCallbackForPlayer();
    *a2 = 0;
  }
  return result;
}

- (id)_contentItemForIdentifier:(id)a3
{
  return [(MPNowPlayingInfoCenter *)self _contentItemForIdentifier:a3 alreadyOnDataSourceQueue:0];
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke(void *a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 104);
  uint64_t v6 = *(void *)(v3 + 32);
  if (v6 >= v5 && v6 - v5 < v4)
  {
    uint64_t v8 = *(uint64_t *)(v3 + 40) <= 1 ? 1 : *(void *)(v3 + 40);
    if (v6 + ~v5 + v8 < v4)
    {
      uint64_t v9 = MSVSignedIntersectionRange();
      uint64_t v11 = v9;
      uint64_t v12 = v10;
      uint64_t v13 = a1[4];
      uint64_t v14 = *(void *)(v13 + 80);
      if (v14 < 0) {
        uint64_t v14 = -v14;
      }
      uint64_t v15 = objc_msgSend(*(id *)(v13 + 112), "subarrayWithRange:", v14 + v9, v10);
      uint64_t v16 = *(void *)(a1[6] + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      id v18 = (uint64_t *)a1[7];
      if (v18)
      {
        uint64_t *v18 = v11;
        v18[1] = v12;
      }
    }
  }
}

void __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained _createPlaybackQueueForRequest:a2];

  return v4;
}

- (void)_createPlaybackQueueForRequest:(void *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t Range = MRPlaybackQueueRequestGetRange();
  v22[0] = 0;
  v22[1] = 0;
  uint64_t v6 = -[MPNowPlayingInfoCenter _contentItemIDsInRange:itemsRange:](self, "_contentItemIDsInRange:itemsRange:", Range, v5, v22);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)MRContentItemCreate();
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F770A0]);
  id v17 = (id)[v14 initWithContentItems:v7 location:v22[0]];
  msv_dispatch_sync_on_queue();
  id v15 = v17;

  return v15;
}

- (id)_contentItemIDsInRange:(id)a3 itemsRange:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__32543;
  long long v19 = __Block_byref_object_dispose__32544;
  id v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_1956C748F;
  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke;
  v12[3] = &unk_1E57F4440;
  v12[4] = self;
  v12[5] = v13;
  v12[6] = &v15;
  v12[7] = a4;
  uint64_t v6 = (void *)MEMORY[0x19971E0F0](v12);
  msv_dispatch_sync_on_queue();
  id v7 = (void *)v16[5];
  if (!v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_2;
    v11[3] = &unk_1E57F4468;
    v11[4] = self;
    v11[5] = v13;
    v11[6] = a2;
    id v10 = (id)MEMORY[0x19971E0F0](v11);
    msv_dispatch_sync_on_queue();
    msv_dispatch_sync_on_queue();

    id v7 = (void *)v16[5];
  }
  id v8 = v7;

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_becomeActiveWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  if ([(MPNowPlayingInfoCenter *)self isInvalidated])
  {
    if (v4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 6, @"MPNowPlayingInfoCenter was invalidated");
      v4[2](v4, v5);
    }
  }
  else
  {
    uint64_t v6 = v4;
    MRMediaRemoteSetNowPlayingPlayer();
  }
}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isInvalidated];
  if ((result & 1) == 0)
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = objc_opt_class();
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(v7 + 304);
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v11 = v6;
        uint64_t v12 = [v10 identifier];
        int v17 = 138413314;
        long long v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        __int16 v21 = 2112;
        uint64_t v22 = v8;
        __int16 v23 = 2114;
        uint64_t v24 = v9;
        __int16 v25 = 2114;
        id v26 = v12;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [nowPlayingItemDidChange] %{public}@ -> %{public}@", (uint8_t *)&v17, 0x34u);
      }
    }
    else if (v5)
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 304);
      int v17 = 138412802;
      long long v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      id v16 = v13;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [identifiersDidChange]", (uint8_t *)&v17, 0x20u);
    }
    return MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer();
  }
  return result;
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_4;
  v3[3] = &unk_1E57F4490;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_onDataSourceQueue_getContentItemIDsInRange:completion:", *(void *)(v2 + 32), *(void *)(v2 + 40), v3);
}

void __56__MPNowPlayingInfoCenter__artworkCatalogForContentItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onDataSourceQueue_artworkCatalogForContentItem:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_invalidatePlaybackQueueImmediatelyWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  if ([(MPNowPlayingInfoCenter *)self isInvalidated])
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      playerPath = self->_playerPath;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))playerPath;
      id v9 = v7;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue ignored [infoCenter was invalidated]", buf, 0x20u);
    }
    v5[2](v5, 0);
  }
  else
  {
    id v10 = [(MPNowPlayingInfoCenter *)self playbackQueueDataSource];
    if (objc_opt_respondsToSelector())
    {
      id v11 = [v10 playbackQueueIdentifierForNowPlayingInfoCenter:self];
    }
    else
    {
      id v11 = 0;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__32543;
    uint64_t v44 = __Block_byref_object_dispose__32544;
    id v45 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__32543;
    v40[4] = __Block_byref_object_dispose__32544;
    id v41 = (id)MEMORY[0x1E4F1CBF0];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__32543;
    v38[4] = __Block_byref_object_dispose__32544;
    id v39 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3010000000;
    id v36 = &unk_1956C748F;
    long long v37 = *MEMORY[0x1E4F77910];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke;
    uint64_t v27 = &unk_1E57F4530;
    v28 = self;
    uint64_t v29 = v38;
    int v30 = buf;
    float v31 = v40;
    BOOL v32 = &v33;
    msv_dispatch_sync_on_queue();
    uint64_t v12 = v34;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_2;
    v15[3] = &unk_1E57F45D8;
    __int16 v19 = v38;
    uint64_t v20 = buf;
    v15[4] = self;
    __int16 v21 = v40;
    uint64_t v22 = &v33;
    id v13 = v10;
    id v16 = v13;
    SEL v23 = a2;
    id v14 = v11;
    id v17 = v14;
    long long v18 = v5;
    -[MPNowPlayingInfoCenter _onDataSourceQueue_getContentItemIDsInRange:completion:](self, "_onDataSourceQueue_getContentItemIDsInRange:completion:", v12[4], v12[5], v15);

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)isInvalidated
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)_onDataSourceQueue_getContentItemIDsInRange:(_MSVSignedRange)a3 completion:(id)a4
{
  int64_t length = a3.length;
  int64_t location = a3.location;
  char v7 = (void (**)(id, void, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  MSVSignedIntersectionRange();
  if (!v8)
  {
    MSVSignedUnionRange();
    int64_t location = MSVSignedSubtractedRange();
    int64_t length = v9;
  }
  id v10 = [(MPNowPlayingInfoCenter *)self playbackQueueDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    if (length <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = length;
    }
    uint64_t v12 = [v10 nowPlayingInfoCenter:self contentItemIDsFromOffset:location toOffset:location + v11 - 1 nowPlayingIndex:&v28];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = MEMORY[0x1E4F1CBF0];
    }
    v7[2](v7, v14, v28);

    goto LABEL_32;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:length];
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:length];
  if (length >= 1)
  {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (objc_opt_respondsToSelector())
      {
        id v16 = [v10 nowPlayingInfoCenter:self contentItemIDForOffset:location];
        if (!v16) {
          goto LABEL_25;
        }
      }
      else
      {
        if (_onDataSourceQueue_getContentItemIDsInRange_completion__onceToken != -1) {
          dispatch_once(&_onDataSourceQueue_getContentItemIDsInRange_completion__onceToken, &__block_literal_global_108_32590);
        }
        uint64_t v28 = 0;
        uint64_t v29 = &v28;
        uint64_t v30 = 0x3032000000;
        float v31 = __Block_byref_object_copy__32543;
        BOOL v32 = __Block_byref_object_dispose__32544;
        id v33 = 0;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_109;
        v24[3] = &unk_1E57FA120;
        id v26 = &v28;
        id v25 = v10;
        int64_t v27 = location;
        +[MPContentItem performSuppressingChangeNotifications:v24];
        id v16 = (void *)v29[5];
        if (v16)
        {
          id v17 = [(id)v29[5] identifier];
          [v20 setObject:v16 forKeyedSubscript:v17];

          id v16 = [(id)v29[5] identifier];
        }

        _Block_object_dispose(&v28, 8);
        if (!v16)
        {
LABEL_25:
          if ([v15 count]) {
            goto LABEL_29;
          }
          goto LABEL_26;
        }
      }
      if (!location) {
        uint64_t v19 = [v15 count];
      }
      [v15 addObject:v16];
LABEL_26:

      ++location;
      if (!--length) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
  if ([v20 count])
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_2;
    block[3] = &unk_1E57F9F98;
    id v22 = v20;
    SEL v23 = self;
    dispatch_async(accessQueue, block);
  }
  ((void (**)(id, void *, uint64_t))v7)[2](v7, v15, v19);

LABEL_32:
}

- (id)_onDataSourceQueue_artworkCatalogForContentItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataSourceQueue);
  BOOL v5 = [(MPNowPlayingInfoCenter *)self playbackQueueDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 nowPlayingInfoCenter:self artworkCatalogForContentItem:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __55__MPNowPlayingInfoCenter_supportsArtworkCatalogLoading__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_respondsToSelector() & 1;
}

void __57__MPNowPlayingInfoCenter__createPlaybackQueueForRequest___block_invoke(uint64_t a1)
{
  char v7 = [*(id *)(a1 + 32) playbackQueueDataSource];
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v7 playbackQueueIdentifierForNowPlayingInfoCenter:*(void *)(a1 + 32)];
    if (v2) {
      [*(id *)(a1 + 40) setQueueIdentifier:v2];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v7 playbackQueuePropertiesForNowPlayingInfoCenter:*(void *)(a1 + 32)];
    if (v3) {
      [*(id *)(a1 + 40) setProperties:v3];
    }
  }
  char v4 = objc_opt_respondsToSelector();
  BOOL v5 = v7;
  if (v4)
  {
    uint64_t v6 = [v7 playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:*(void *)(a1 + 32)];
    if (v6) {
      [*(id *)(a1 + 40) setAuxiliaryNowPlayingInfo:v6];
    }

    BOOL v5 = v7;
  }
}

- (MPNowPlayingPlaybackQueueDataSource)playbackQueueDataSource
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = __Block_byref_object_copy__32543;
  uint64_t v8 = __Block_byref_object_dispose__32544;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingPlaybackQueueDataSource *)v2;
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      char v9 = 1;
LABEL_13:
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32);
      uint64_t v26 = [v6 count];
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v29 = *(void *)(v28 + 40);
      if (v29 != v26)
      {
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v30 = *(void *)(v28 + 32);
          if (v30 < 0) {
            uint64_t v25 = ((v30 + v29) & ((v30 + v29) >> 63)) - v26;
          }
        }
        else
        {
          uint64_t v25 = -a3;
        }
      }
      if (objc_opt_respondsToSelector())
      {
        float v31 = [*(id *)(a1 + 40) playbackQueuePropertiesForNowPlayingInfoCenter:*(void *)(a1 + 32)];
      }
      else
      {
        float v31 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        BOOL v32 = [*(id *)(a1 + 40) playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:*(void *)(a1 + 32)];
      }
      else
      {
        BOOL v32 = 0;
      }
      uint64_t v33 = *(void *)(a1 + 32);
      v34 = *(NSObject **)(v33 + 40);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_4;
      v50[3] = &unk_1E57F4558;
      uint64_t v35 = *(void *)(a1 + 64);
      v50[4] = v33;
      uint64_t v52 = v35;
      id v51 = v6;
      uint64_t v53 = v25;
      uint64_t v54 = v27;
      uint64_t v55 = *(void *)(a1 + 96);
      dispatch_async(v34, v50);
      id v36 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_5;
      v41[3] = &unk_1E57F45B0;
      uint64_t v47 = *(void *)(a1 + 64);
      id v42 = *(id *)(a1 + 48);
      id v43 = v31;
      uint64_t v37 = *(void *)(a1 + 32);
      id v44 = v32;
      uint64_t v45 = v37;
      char v49 = v9;
      uint64_t v48 = *(void *)(a1 + 72);
      id v46 = *(id *)(a1 + 56);
      id v38 = v32;
      id v18 = v31;
      dispatch_async(v36, v41);

      goto LABEL_25;
    }
  }
  else
  {
    id v10 = [v5 objectAtIndexedSubscript:a3];
    uint64_t v11 = v10;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
      || ([v10 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)] & 1) == 0)
    {
      char v9 = 1;
      uint64_t v19 = [*(id *)(a1 + 32) _contentItemForIdentifier:v11 alreadyOnDataSourceQueue:1];
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
      __int16 v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      uint64_t v22 = *(void *)(a1 + 32);
      SEL v23 = *(NSObject **)(v22 + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_3;
      block[3] = &unk_1E57F9F48;
      void block[4] = v22;
      id v57 = v11;
      uint64_t v58 = *(void *)(a1 + 64);
      id v24 = v11;
      dispatch_async(v23, block);

      goto LABEL_13;
    }
  }
  if (([v6 isEqualToArray:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)] & 1) == 0)
  {
    char v9 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v14 + 304);
    *(_DWORD *)buf = 138412802;
    v60 = v13;
    __int16 v61 = 2048;
    uint64_t v62 = v14;
    __int16 v63 = 2112;
    uint64_t v64 = v15;
    id v16 = v13;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidatePlaybackQueue [no change detected]", buf, 0x20u);
  }
  id v17 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_100;
  v39[3] = &unk_1E57FA198;
  id v40 = *(id *)(a1 + 56);
  dispatch_async(v17, v39);
  id v18 = v40;
LABEL_25:
}

- (id)_contentItemForIdentifier:(id)a3 alreadyOnDataSourceQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    MEMORY[0x1E4F14758](self->_dataSourceQueue);
  }
  else {
    MEMORY[0x1E4F14760](self->_dataSourceQueue);
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__32543;
  uint64_t v28 = __Block_byref_object_dispose__32544;
  id v29 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke;
  uint64_t v20 = &unk_1E57F9F48;
  SEL v23 = &v24;
  __int16 v21 = self;
  id v7 = v6;
  id v22 = v7;
  msv_dispatch_sync_on_queue();
  if (!v25[5])
  {
    uint64_t v8 = [(MPNowPlayingInfoCenter *)self playbackQueueDataSource];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_2;
      v14[3] = &unk_1E57F9F48;
      id v16 = &v24;
      v14[4] = self;
      id v15 = v7;
      uint64_t v10 = MEMORY[0x19971E0F0](v14);
      uint64_t v11 = (void *)v10;
      if (v4) {
        (*(void (**)(uint64_t))(v10 + 16))(v10);
      }
      else {
        msv_dispatch_sync_on_queue();
      }
    }
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v12;
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_5;
  block[3] = &unk_1E57F53B8;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = a3;
  id v8 = v5;
  dispatch_sync(v6, block);
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_contentItemChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"_MPContentItemDidChangeUserInfoKeyDeltaItem"];

    if (v7)
    {
      accessQueue = self->_accessQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke;
      v9[3] = &unk_1E57F49E8;
      void v9[4] = self;
      id v10 = v5;
      uint64_t v12 = v7;
      id v11 = v4;
      dispatch_sync(accessQueue, v9);
    }
  }
}

- (BOOL)supportsArtworkCatalogLoading
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __58__MPNowPlayingInfoCenter__contentItemChangedNotification___block_invoke_226(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 0;
  uint64_t v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_onQueue_pushContentItemsUpdate");
}

void __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke()
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = (void *)__infoCenterMap;
  __infoCenterMap = v0;

  objc_sync_exit(obj);
}

void __47__MPNowPlayingInfoCenter_nowPlayingContentItem__block_invoke(uint64_t a1)
{
}

void __77__MPNowPlayingInfoCenter__contentItemForIdentifier_alreadyOnDataSourceQueue___block_invoke_4(void *a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = *(void **)(a1[4] + 120);
  uint64_t v4 = [v2 identifier];
  id v5 = (id)v4;
  if (!v4) {
    uint64_t v4 = a1[5];
  }
  [v3 setObject:v2 forKeyedSubscript:v4];
}

- (id)_artworkCatalogForContentItem:(id)a3
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__32543;
  id v10 = __Block_byref_object_dispose__32544;
  id v11 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)invalidatePlaybackQueueWithCompletion:(id)a3
{
  id v4 = a3;
  dataSourceQueue = self->_dataSourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__MPNowPlayingInfoCenter_invalidatePlaybackQueueWithCompletion___block_invoke;
  v7[3] = &unk_1E57F9140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dataSourceQueue, v7);
}

void __38__MPNowPlayingInfoCenter_serviceQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaPlayer.MPNowPlayingInfoCenter/serviceQueue", v2);
  uint64_t v1 = (void *)serviceQueue___serviceQueue;
  serviceQueue___serviceQueue = (uint64_t)v0;
}

void __53__MPNowPlayingInfoCenter_setPlaybackQueueDataSource___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 280))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 176));
    id v4 = *(id *)(a1 + 40);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      objc_msgSend(v5, "_onQueue_registerPlaybackQueueDataSourceCallbacks:", v6);
    }
  }
}

- (void)setPlaybackQueueDataSource:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __53__MPNowPlayingInfoCenter_setPlaybackQueueDataSource___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 128));
  uint64_t v2 = [*(id *)(*(void *)(a1[5] + 8) + 40) identifier];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1[4] + 112);
  if (v6)
  {
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(a1[7] + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    MSVSignedIntersectionRange();
    uint64_t v11 = v10;
    uint64_t v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) length];
    uint64_t v13 = a1[4];
    if (!v12 && v11 >= 1)
    {
      id v15 = *(void **)(v13 + 112);
      uint64_t v16 = *(void *)(v13 + 80);
      if (v16 >= 0) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = -v16;
      }
      uint64_t v18 = [v15 objectAtIndexedSubscript:v17];
      uint64_t v19 = [v18 copy];
      uint64_t v20 = *(void *)(a1[6] + 8);
      __int16 v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
  uint64_t result = MSVSignedUnionRange();
  uint64_t v23 = *(void *)(a1[8] + 8);
  *(void *)(v23 + 32) = result;
  *(void *)(v23 + 40) = v24;
  return result;
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v11 = v2;
    char v4 = [v2 isEqual:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v3 = v11;
    if ((v4 & 1) == 0)
    {
      id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v6 = *(void **)(*(void *)(a1 + 32) + 120);
      uint64_t v7 = [v5 identifier];
      [v6 setObject:v5 forKeyedSubscript:v7];

      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      char v9 = *(void **)(*(void *)(a1 + 32) + 64);
      uint64_t v10 = [v8 identifier];
      [v9 setObject:v8 forKeyedSubscript:v10];

      objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushContentItemsUpdate");
      uint64_t v3 = v11;
    }
  }
}

void __64__MPNowPlayingInfoCenter__getMetadataForContentItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = [v1 identifier];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __76__MPNowPlayingInfoCenter__invalidatePlaybackQueueImmediatelyWithCompletion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 112);
  *(void *)(v3 + 112) = v2;

  *(_OWORD *)(*(void *)(a1 + 32) + 80) = *(_OWORD *)(a1 + 56);
  if ([*(id *)(*(void *)(a1 + 32) + 112) count] != *(void *)(*(void *)(a1 + 32) + 88))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 72), *(void *)(a1 + 32), @"MPNowPlayingInfoCenter.m", 707, @"IPQI: Mismatch in contentItemIdentifiers (%ld) and loadedContentItemsRange (%ld)", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "count"), *(void *)(*(void *)(a1 + 32) + 88));
  }
}

void __39__MPNowPlayingInfoCenter_defaultCenter__block_invoke()
{
  dispatch_queue_t v0 = [[MPNowPlayingInfoCenter alloc] initWithPlayerID:0];
  uint64_t v1 = (void *)defaultCenter___defaultCenter;
  defaultCenter___defaultCenter = (uint64_t)v0;
}

uint64_t __54__MPNowPlayingInfoCenter__becomeActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  id v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 304);
    int v13 = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = a2;
    uint64_t v7 = "becomeActivePlayer: %{public}@ failed %{public}@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 304);
    int v13 = 138543362;
    uint64_t v14 = v11;
    uint64_t v7 = "becomeActivePlayer: %{public}@";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1952E8000, v8, v9, v7, (uint8_t *)&v13, v10);
LABEL_7:

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __60__MPNowPlayingInfoCenter__contentItemIDsInRange_itemsRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v23 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = [v23 count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [*(id *)(v4 + 112) count];
    NSUInteger v6 = MSVReplacementRangeForRanges();
    NSUInteger v8 = v7;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "replaceObjectsInRange:withObjectsFromArray:", v6, v7, v23);
    uint64_t v9 = *(void *)(a1 + 32);
    *(void *)(v9 + 80) = MSVSignedUnionRange();
    *(void *)(v9 + 88) = v10;
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 112) count];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v11 != *(void *)(v4 + 88))
    {
      __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [*(id *)(v13 + 112) count];
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 88);
      uint64_t v20 = v14;
      uint64_t v15 = [v23 count];
      uint64_t v16 = NSStringFromMSVSignedRange();
      uint64_t v17 = NSStringFromMSVSignedRange();
      v25.int64_t location = v6;
      v25.int64_t length = v8;
      uint64_t v18 = NSStringFromRange(v25);
      [v21 handleFailureInMethod:v22, v13, @"MPNowPlayingInfoCenter.m", 482, @"CIIR: Mismatch in contentItemIdentifiers=%ld, loadedContentItemsRange=%ld, previousContentItemIDCount=%ld, dataSourceContentItemIDs=%ld, replacementRange: [(_loaded) %@ : (loaded) %@] => (replacement) %@", v20, v19, v5, v15, v16, v17, v18 object file lineNumber description];

      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  *(void *)(v4 + 96) = MSVSignedUnionRange();
  *(void *)(v4 + 104) = v12;
}

+ (MPNowPlayingInfoCenter)defaultCenter
{
  if (defaultCenter___once != -1) {
    dispatch_once(&defaultCenter___once, &__block_literal_global_32730);
  }
  uint64_t v2 = (void *)defaultCenter___defaultCenter;

  return (MPNowPlayingInfoCenter *)v2;
}

uint64_t __45__MPNowPlayingInfoCenter_initWithPlayerPath___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    NSUInteger v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = objc_msgSend(WeakRetained, "_onQueue_stateDictionary");
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

- (MPNowPlayingContentItem)nowPlayingContentItem
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  NSUInteger v7 = __Block_byref_object_copy__32543;
  NSUInteger v8 = __Block_byref_object_dispose__32544;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingContentItem *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceQueue, 0);
  objc_storeStrong((id *)&self->_representedApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_destroyWeak((id *)&self->_playbackQueueDelegate);
  objc_destroyWeak((id *)&self->_lyricsDelegate);
  objc_destroyWeak((id *)&self->_playbackQueueDataSource);
  objc_storeStrong((id *)&self->_contentItemInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_artworkResizeUtility, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_nowPlayingContentItem, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutatedPlaybackQueueRequests, 0);
  objc_storeStrong((id *)&self->_mutatedContentItems, 0);
  objc_storeStrong((id *)&self->_publishedContext, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_pushDate, 0);
  objc_storeStrong((id *)&self->_convertedNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_queuedNowPlayingInfo, 0);

  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

- (OS_dispatch_queue)dataSourceQueue
{
  return self->_dataSourceQueue;
}

- (NSString)representedApplicationBundleIdentifier
{
  return self->_representedApplicationBundleIdentifier;
}

- (void)setPlaybackQueueDelegate:(id)a3
{
}

- (MPNowPlayingPlaybackQueueDelegate)playbackQueueDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackQueueDelegate);

  return (MPNowPlayingPlaybackQueueDelegate *)WeakRetained;
}

void __57__MPNowPlayingInfoCenter__onQueue_pushContentItemsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInvalidated])
  {
    id v2 = *(const void **)(a1 + 56);
    CFRelease(v2);
  }
  else
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(v6 + 304);
      id v8 = v4;
      id v9 = [v5 identifier];
      int v12 = 138413058;
      uint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> sending content item changed: %{public}@", (uint8_t *)&v12, 0x2Au);
    }
    [*(id *)(a1 + 40) _mediaRemoteContentItem];
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 40) identifier];
    LOBYTE(v10) = [v10 containsObject:v11];

    if ((v10 & 1) == 0) {
      MRContentItemSetArtworkIdentifier();
    }
    [*(id *)(a1 + 40) _mediaRemoteContentItem];
    MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer();
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
}

- (id)_onQueue_stateDictionary
{
  v23[8] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  v22[0] = @"_obj";
  uint64_t v4 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  playerPath = self->_playerPath;
  v23[0] = v4;
  v23[1] = playerPath;
  v22[1] = @"_playerPath";
  void v22[2] = @"contentItemIDs";
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if (!contentItemIdentifiers) {
    contentItemIdentifiers = (NSMutableArray *)@"@";
  }
  v23[2] = contentItemIdentifiers;
  v22[3] = @"loadedRange";
  uint64_t v7 = NSStringFromMSVSignedRange();
  v23[3] = v7;
  v22[4] = @"requestedRange";
  id v8 = NSStringFromMSVSignedRange();
  v23[4] = v8;
  v22[5] = @"cachedContentItems";
  uint64_t v9 = [(MSVLRUDictionary *)self->_contentItems allKeys];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = @"@";
  }
  v23[5] = v11;
  v22[6] = @"mutatedContentItems";
  uint64_t v12 = [(NSMutableDictionary *)self->_mutatedContentItems allKeys];
  uint64_t v13 = (void *)v12;
  if (v12) {
    __int16 v14 = (__CFString *)v12;
  }
  else {
    __int16 v14 = @"@";
  }
  v23[6] = v14;
  v22[7] = @"mutatedPlaybackQueueRequests";
  uint64_t v15 = [(NSMutableDictionary *)self->_mutatedPlaybackQueueRequests allKeys];
  __int16 v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  else {
    uint64_t v17 = @"@";
  }
  v23[7] = v17;
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  uint64_t v19 = [v3 dictionaryWithDictionary:v18];

  nowPlayingContentItem = self->_nowPlayingContentItem;
  if (nowPlayingContentItem) {
    [v19 setObject:nowPlayingContentItem forKeyedSubscript:@"nowPlayingContentItem"];
  }
  if ([(NSDictionary *)self->_nowPlayingInfo count]) {
    [v19 setObject:self->_nowPlayingInfo forKeyedSubscript:@"nowPlayingInfo"];
  }
  if (self->_nowPlayingInfo != self->_queuedNowPlayingInfo) {
    objc_msgSend(v19, "setObject:forKeyedSubscript:");
  }

  return v19;
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = (void *)MRPlaybackSessionRequestCopyRequestID();
    uint64_t v7 = WeakRetained[40];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2;
    block[3] = &unk_1E57F8408;
    uint64_t v10 = WeakRetained;
    id v11 = v6;
    id v12 = v4;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = a3;
    uint64_t v9 = (void *)MRPlaybackSessionRequestCopyRequestID();
    uint64_t v10 = WeakRetained[40];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4;
    v13[3] = &unk_1E57F4E70;
    __int16 v14 = WeakRetained;
    id v15 = v9;
    id v16 = v8;
    id v17 = v6;
    id v11 = v8;
    id v12 = v9;
    dispatch_async(v10, v13);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)MRPlaybackSessionRequestCopyIdentifier();
  id v6 = (void *)MRPlaybackSessionRequestCopyType();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6;
  v9[3] = &unk_1E57F46F0;
  id v10 = v4;
  id v8 = v4;
  [WeakRetained _getTransportablePlaybackSessionRepresentationWithIdentifier:v5 preferredSessionType:v6 completion:v9];
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _contentItemForIdentifier:a2];
  [v4 _mediaRemoteContentItem];
  uint64_t SkeletonFrom = MRContentItemCreateSkeletonFrom();

  return SkeletonFrom;
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _contentItemForIdentifier:MRContentItemGetIdentifier()];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v5 = WeakRetained;
  id v6 = v2;
  msv_dispatch_sync_on_queue();
  uint64_t v3 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v3;
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  uint64_t v48 = 0;
  char v49 = (double *)&v48;
  uint64_t v50 = 0x3010000000;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  id v51 = &unk_1956C748F;
  MRPlaybackQueueRequestGetArtworkWidth();
  uint64_t v10 = v9;
  MRPlaybackQueueRequestGetArtworkHeight();
  uint64_t v52 = v10;
  uint64_t v53 = v11;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14;
  v45[3] = &unk_1E57F4830;
  id v12 = WeakRetained;
  id v46 = v12;
  id v13 = v6;
  id v47 = v13;
  __int16 v14 = (void *)MEMORY[0x19971E0F0](v45);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16;
  v40[3] = &unk_1E57F4880;
  id v44 = &v48;
  id v15 = v12;
  id v41 = v15;
  id v16 = v14;
  id v43 = v16;
  id v17 = v8;
  id v42 = v17;
  __int16 v18 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v40);
  uint64_t v19 = [v15 playbackQueueDataSource];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    __int16 v21 = v15[40];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20;
    v35[3] = &unk_1E57F48A8;
    id v39 = &v48;
    id v36 = v15;
    id v37 = v17;
    id v38 = v18;
    dispatch_async(v21, v35);

    uint64_t v22 = v36;
  }
  else
  {
    uint64_t v22 = [v15 _contentItemForIdentifier:MRContentItemGetIdentifier()];
    id v23 = [v22 artwork];

    if (v23)
    {
      if (_block_invoke_onceToken != -1) {
        dispatch_once(&_block_invoke_onceToken, &__block_literal_global_137);
      }
      double v24 = v49[4];
      double v25 = v49[5];
      double v26 = *(double *)&MPNowPlayingContentItemArtworkMaxSize;
      if (v24 == *(double *)&MPNowPlayingContentItemArtworkMaxSize && v25 == *(double *)&qword_1E9364140)
      {
        uint64_t v27 = [v22 artwork];
        [v27 bounds];
        double v24 = v28;
        double v25 = v29;

        double v26 = *(double *)&MPNowPlayingContentItemArtworkMaxSize;
      }
      if (v24 == v26)
      {
        MSVGetMaximumScreenSize();
        double v24 = v30;
      }
      if (v25 == *(double *)&qword_1E9364140)
      {
        MSVGetMaximumScreenSize();
        double v25 = v31;
      }
      BOOL v32 = [v22 artwork];
      uint64_t v33 = objc_msgSend(v32, "imageWithSize:", v24, v25);

      ((void (**)(void, void *, void))v18)[2](v18, v33, 0);
    }
    else
    {
      Error = (const void *)MRMediaRemoteCreateError();
      (*((void (**)(id, const void *))v13 + 2))(v13, Error);
      CFRelease(Error);
    }
  }

  _Block_object_dispose(&v48, 8);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_140(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  uint64_t v10 = [v9 remoteArtworks];

  if (v10)
  {
    v7[2](v7, 0);
  }
  else
  {
    id v11 = a2;
    [v11 artworkWidth];
    uint64_t v13 = v12;
    [v11 artworkHeight];
    uint64_t v15 = v14;
    id v16 = dispatch_group_create();
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2810000000;
    v46[3] = &unk_1956C748F;
    int v47 = 0;
    id v17 = (void *)MEMORY[0x1E4F1CA60];
    __int16 v18 = [v11 requestedRemoteArtworkFormats];
    uint64_t v19 = objc_msgSend(v17, "dictionaryWithCapacity:", objc_msgSend(v18, "count"));

    char v20 = (void *)MEMORY[0x1E4F1CA48];
    __int16 v21 = [v11 requestedRemoteArtworkFormats];
    uint64_t v22 = objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));

    dispatch_group_enter(v16);
    id v23 = WeakRetained[40];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2_142;
    block[3] = &unk_1E57F48F8;
    id v37 = v11;
    id v38 = v16;
    id v39 = WeakRetained;
    id v24 = v9;
    uint64_t v44 = v13;
    uint64_t v45 = v15;
    id v40 = v24;
    id v43 = v46;
    id v25 = v19;
    id v41 = v25;
    id v26 = v22;
    id v42 = v26;
    uint64_t v27 = v16;
    id v28 = v11;
    dispatch_async(v23, block);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4_151;
    v31[3] = &unk_1E57F4E70;
    id v32 = v24;
    id v33 = v25;
    id v34 = v26;
    uint64_t v35 = v7;
    id v29 = v26;
    id v30 = v25;
    dispatch_group_notify(v27, MEMORY[0x1E4F14428], v31);

    _Block_object_dispose(v46, 8);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6_158(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  id v9 = [v8 lyrics];

  if (v9)
  {
    v6[2](v6, 0);
  }
  else
  {
    uint64_t v10 = WeakRetained[40];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7_159;
    block[3] = &unk_1E57F8408;
    uint64_t v12 = WeakRetained;
    id v13 = v8;
    uint64_t v14 = v6;
    dispatch_async(v10, block);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10_165(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  id v9 = WeakRetained[40];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11_166;
  block[3] = &unk_1E57F8408;
  id v14 = WeakRetained;
  id v15 = v8;
  id v16 = v6;
  id v10 = v6;
  id v11 = v8;
  uint64_t v12 = WeakRetained;
  dispatch_async(v9, block);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14_172(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  id v9 = WeakRetained[40];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15_173;
  block[3] = &unk_1E57F8408;
  id v14 = WeakRetained;
  id v15 = v8;
  id v16 = v6;
  id v10 = v6;
  id v11 = v8;
  uint64_t v12 = WeakRetained;
  dispatch_async(v9, block);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18_181(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [(MPContentItem *)[MPNowPlayingContentItem alloc] _initWithMediaRemoteContentItem:a3];
  id v9 = dispatch_group_create();
  id v10 = v9;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__32543;
  v28[4] = __Block_byref_object_dispose__32544;
  id v29 = 0;
  if (*(unsigned char *)(a1 + 40))
  {
    dispatch_group_enter(v9);
    id v11 = WeakRetained[40];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19_182;
    block[3] = &unk_1E57F82D8;
    id v24 = WeakRetained;
    id v25 = v8;
    uint64_t v27 = v28;
    id v26 = v10;
    dispatch_async(v11, block);
  }
  if (*(unsigned char *)(a1 + 41))
  {
    dispatch_group_enter(v10);
    uint64_t v12 = WeakRetained[40];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_22;
    v18[3] = &unk_1E57F82D8;
    uint64_t v19 = WeakRetained;
    id v20 = v8;
    uint64_t v22 = v28;
    __int16 v21 = v10;
    dispatch_async(v12, v18);
  }
  id v13 = WeakRetained[6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_25;
  v15[3] = &unk_1E57F4FB0;
  id v16 = v6;
  id v17 = v28;
  id v14 = v6;
  dispatch_group_notify(v10, v13, v15);

  _Block_object_dispose(v28, 8);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19_182(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20_183;
  void v8[3] = &unk_1E57F4998;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = (id)[v2 nowPlayingInfoCenter:v4 availableLanguageOptionsForContentItem:v9 completion:v8];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_22(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_23;
  void v8[3] = &unk_1E57F4998;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = (id)[v2 nowPlayingInfoCenter:v4 currentLanguageOptionsForContentItem:v9 completion:v8];
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_24;
  v11[3] = &unk_1E57F9F98;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v13 = v7;
  +[MPContentItem performSuppressingChangeNotifications:v11];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  id v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentLanguageOptions:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20_183(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21_184;
  v11[3] = &unk_1E57F9F98;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v13 = v7;
  +[MPContentItem performSuppressingChangeNotifications:v11];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  id v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21_184(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAvailableLanguageOptions:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15_173(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16_174;
  v6[3] = &unk_1E57F4970;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v5 = (id)[v2 nowPlayingInfoCenter:v4 transcriptAlignmentsForContentItem:v7 completion:v6];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16_174(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17_175;
  v10[3] = &unk_1E57F9F98;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v6 = v5;
  id v7 = a3;
  +[MPContentItem performSuppressingChangeNotifications:v10];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, v8, v9);
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17_175(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTranscriptAlignments:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_11_166(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12_167;
  v6[3] = &unk_1E57F4948;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v5 = (id)[v2 nowPlayingInfoCenter:v4 infoForContentItem:v7 completion:v6];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_12_167(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13_168;
  v10[3] = &unk_1E57F9F98;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v6 = v5;
  id v7 = a3;
  +[MPContentItem performSuppressingChangeNotifications:v10];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, v8, v9);
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_13_168(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInfo:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_7_159(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8_160;
  v6[3] = &unk_1E57F4920;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v5 = (id)[v2 nowPlayingInfoCenter:v4 lyricsForContentItem:v7 completion:v6];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_8_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9_161;
  v10[3] = &unk_1E57F9F98;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v6 = v5;
  id v7 = a3;
  +[MPContentItem performSuppressingChangeNotifications:v10];
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, v8, v9);
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_9_161(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLyrics:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2_142(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(a1 + 32) requestedRemoteArtworkFormats];
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * v5);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        id v7 = [*(id *)(a1 + 48) playbackQueueDataSource];
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 56);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3_143;
        v12[3] = &unk_1E57F48D0;
        uint64_t v17 = *(void *)(a1 + 80);
        id v13 = *(id *)(a1 + 64);
        uint64_t v14 = v6;
        id v15 = *(id *)(a1 + 72);
        id v16 = *(id *)(a1 + 40);
        id v10 = (id)objc_msgSend(v7, "nowPlayingInfoCenter:remoteArtworkForContentItem:format:size:completion:", v8, v9, v6, v12, *(double *)(a1 + 88), *(double *)(a1 + 96));

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4_151(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5_152;
  v6[3] = &unk_1E57F9F98;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  +[MPContentItem performSuppressingChangeNotifications:v6];
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = objc_msgSend(v2, "msv_errorWithDomain:code:underlyingErrors:debugDescription:", @"MPNowPlayingInfoCenterErrorDomain", 101, v3, @"failed to create remoteArtwork for contentItemID: %@", v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_5_152(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemoteArtworks:*(void *)(a1 + 40)];
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_3_143(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = v5;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPNowPlayingInfoCenterErrorDomain", 1001, @"playbackQueueDataSource failed to produce remoteArtwork");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    [*(id *)(a1 + 48) addObject:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15;
  v19[3] = &unk_1E57F4808;
  id v20 = v12;
  id v21 = v11;
  double v24 = a5;
  double v25 = a6;
  id v15 = *(id *)(a1 + 40);
  id v22 = v13;
  id v23 = v15;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(v14, v19);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    goto LABEL_3;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  CGFloat v8 = *(double *)(v7 + 32);
  CGFloat v9 = *(double *)(v7 + 40);
  [v5 size];
  CGFloat v11 = v10;
  [v5 size];
  v33.size.height = v12;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v32.size.width = v8;
  v32.size.height = v9;
  v33.size.width = v11;
  if (CGRectContainsRect(v32, v33))
  {
LABEL_3:
    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19;
    block[3] = &unk_1E57F4E70;
    uint64_t v14 = &v27;
    id v27 = *(id *)(a1 + 48);
    id v15 = &v24;
    id v24 = *(id *)(a1 + 40);
    id v16 = &v25;
    id v25 = v5;
    id v26 = v6;
    dispatch_async(v13, block);
  }
  else
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(double *)(v17 + 32) == *(double *)&MPNowPlayingContentItemArtworkMaxSize)
    {
      [v5 size];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v18;
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    if (*(double *)(v17 + 40) == *(double *)&qword_1E9364140)
    {
      [v5 size];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v19;
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    id v20 = *(void **)(a1 + 32);
    id v21 = (void *)v20[19];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17;
    v28[3] = &unk_1E57F4858;
    uint64_t v14 = (id *)&v29;
    id v29 = v20;
    id v15 = &v31;
    id v31 = *(id *)(a1 + 48);
    id v16 = &v30;
    id v30 = *(id *)(a1 + 40);
    id v22 = (id)objc_msgSend(v21, "resizeImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:saveToDestinationURL:completionHandler:", v5, 0, 0, v28, *(double *)(v17 + 32), *(double *)(v17 + 40));
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  double v3 = *(double *)(v2 + 32);
  double v4 = *(double *)(v2 + 40);
  if (v3 == *(double *)&MPNowPlayingContentItemArtworkMaxSize)
  {
    MSVGetMaximumScreenSize();
    double v3 = v5;
  }
  if (v4 == *(double *)&qword_1E9364140)
  {
    MSVGetMaximumScreenSize();
    double v4 = v6;
  }
  id v8 = [*(id *)(a1 + 32) playbackQueueDataSource];
  id v7 = (id)objc_msgSend(v8, "nowPlayingInfoCenter:artworkForContentItem:size:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), v3, v4);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_21()
{
  dispatch_queue_t v0 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1952E8000, v0, OS_LOG_TYPE_ERROR, "Using deprecated contentItem-based artwork.", v1, 2u);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18;
  v10[3] = &unk_1E57F4E70;
  id v14 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), *MEMORY[0x1E4F778F0]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) size];
  (*(void (**)(uint64_t, uint64_t, id, void))(v2 + 16))(v2, v3, v4, *(void *)(a1 + 48));
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), *MEMORY[0x1E4F778F0]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) size];
  (*(void (**)(uint64_t, uint64_t, id, void))(v2 + 16))(v2, v3, v4, *(void *)(a1 + 48));
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_15(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) _mediaRemoteContentItem];
    MRContentItemSetArtworkData();
    [*(id *)(a1 + 40) _mediaRemoteContentItem];
    MRContentItemSetArtworkMIMEType();
    [*(id *)(a1 + 40) _mediaRemoteContentItem];
    MRContentItemSetArtworkDataSize();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _childContentItemForContentItem:*(void *)(a1 + 40) index:*(void *)(a1 + 56)];
  uint64_t v3 = (const void *)[v2 _mediaRemoteContentItem];

  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CFRetain(v3);
  }
}

void __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [v5 identifier];
    id v7 = [v10 sessionType];
    id v8 = [v10 data];
    id v9 = (const void *)MRPlaybackSessionCreate();

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CFRelease(v9);
  }
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_4(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 176));
  [WeakRetained nowPlayingInfoCenter:a1[4] didEndMigrationWithIdentifier:a1[5] error:a1[6]];

  uint64_t v3 = *(uint64_t (**)(void))(a1[7] + 16);

  return v3();
}

uint64_t __76__MPNowPlayingInfoCenter__onQueue_registerPlaybackQueueDataSourceCallbacks___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 176));
  [WeakRetained nowPlayingInfoCenter:a1[4] willBeginSessionMigrationWithIdentifier:a1[5]];

  uint64_t v3 = *(uint64_t (**)(void))(a1[6] + 16);

  return v3();
}

- (void)_onQueue_registerLyricsDelegateCallbacks:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!self->_invalidated)
  {
    if (v4)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      v6[1] = (id)MEMORY[0x1E4F143A8];
      v6[2] = (id)3221225472;
      v6[3] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke;
      void v6[4] = &unk_1E57F4678;
      v6[5] = self;
      objc_copyWeak(&v7, &location);
      objc_copyWeak(&v8, &from);
      MRMediaRemoteSetBeginLyricsEventCallbackForPlayer();
      objc_copyWeak(&v5, &location);
      objc_copyWeak(v6, &from);
      MRMediaRemoteSetEndLyricsEventCallbackForPlayer();
      objc_destroyWeak(v6);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      MRMediaRemoteSetBeginLyricsEventCallbackForPlayer();
      MRMediaRemoteSetEndLyricsEventCallbackForPlayer();
    }
  }
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 320);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_2;
  block[3] = &unk_1E57F4650;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7[1] = (id)cf;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(v4, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_3(uint64_t a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 320);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_4;
  block[3] = &unk_1E57F4650;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7[1] = (id)cf;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(v4, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [[MPNowPlayingInfoLyricsEvent alloc] initWithMediaRemoteLyricsEvent:*(void *)(a1 + 48)];
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 nowPlayingInfoCenter:WeakRetained didEndLyricsEvent:v2];

  id v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
}

void __67__MPNowPlayingInfoCenter__onQueue_registerLyricsDelegateCallbacks___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [[MPNowPlayingInfoLyricsEvent alloc] initWithMediaRemoteLyricsEvent:*(void *)(a1 + 48)];
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 nowPlayingInfoCenter:WeakRetained didEndLyricsEvent:v2];

  id v4 = *(const void **)(a1 + 48);
  if (v4) {
    CFRelease(v4);
  }
}

void __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_109(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) contentItemForOffset:*(void *)(a1 + 48)];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_3;
  v3[3] = &unk_1E57F4600;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) setObject:a3 forKeyedSubscript:a2];
}

void __81__MPNowPlayingInfoCenter__onDataSourceQueue_getContentItemIDsInRange_completion___block_invoke()
{
  dispatch_queue_t v0 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1952E8000, v0, OS_LOG_TYPE_ERROR, "Using deprecated -contentItemForOffset: playback queue datasource.", v1, 2u);
  }
}

- (void)_getTransportablePlaybackSessionRepresentationWithIdentifier:(id)a3 preferredSessionType:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dataSourceQueue = self->_dataSourceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke;
  block[3] = &unk_1E57F4508;
  id v19 = v11;
  SEL v20 = a2;
  void block[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(dataSourceQueue, block);
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackQueueDataSource];
  char v3 = objc_opt_respondsToSelector();
  id v4 = objc_alloc(MEMORY[0x1E4F77968]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_2;
  v23[3] = &unk_1E57F53B8;
  v23[4] = *(void *)(a1 + 32);
  long long v15 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v15;
  long long v24 = v15;
  id v6 = (void *)[v4 initWithDeallocHandler:v23];
  if (v3)
  {
    id v7 = +[_MPNowPlayingInfoTransportableSessionRequest requestWithIdentifier:*(void *)(a1 + 40) preferredSessionType:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_3;
    v20[3] = &unk_1E57F44B8;
    id v9 = &v21;
    id v21 = v6;
    id v10 = &v22;
    id v22 = *(id *)(a1 + 56);
    id v11 = v6;
    [v2 nowPlayingInfoCenter:v8 getTransportablePlaybackSessionRepresentationForRequest:v7 completion:v20];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 176));
      id v13 = [WeakRetained playbackQueueIdentifierForNowPlayingInfoCenter:*(void *)(a1 + 32)];
    }
    else
    {
      id v13 = @"<missing queue identifier>";
    }
    uint64_t v14 = *(void *)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_4;
    v16[3] = &unk_1E57F44E0;
    id v9 = &v17;
    id v10 = (id *)&v18;
    id v17 = v6;
    id v18 = v13;
    id v19 = *(id *)(a1 + 56);
    id v11 = v13;
    id v7 = v6;
    [v2 nowPlayingInfoCenter:v14 getTransportablePlaybackSessionRepresentationWithCompletion:v16];
  }
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_2(void *a1)
{
  if (MSVDeviceOSIsInternalInstall())
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[4] file:@"MPNowPlayingInfoCenter.m" lineNumber:603 description:@"MPNowPlayingPlaybackQueueDataSource getTransportablePlaybackSessionRepresentationWithCompletion completion was released without being called."];
  }
  uint64_t v2 = a1[5];
  id Error = (id)MRMediaRemoteCreateError();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, Error);
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 disarm];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __119__MPNowPlayingInfoCenter__getTransportablePlaybackSessionRepresentationWithIdentifier_preferredSessionType_completion___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = a2;
  [v5 disarm];
  uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
  id v9 = [v8 bundleIdentifier];
  id v11 = [v9 stringByAppendingPathExtension:@"transportablePlaybackSession"];

  id v10 = +[MPNowPlayingInfoTransportableSessionResponse responseWithIdentifier:a1[5] sessionType:v11 data:v7];

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)_childContentItemForContentItem:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MPNowPlayingInfoCenter *)self playbackQueueDataSource];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v7 nowPlayingInfoCenter:self childContentItemIDAtIndex:a4 ofItem:v6];
    if (v8) {
      id v9 = [(MPContentItem *)[MPNowPlayingContentItem alloc] initWithIdentifier:v8];
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_becomeActiveIfPossibleWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(MPNowPlayingInfoCenter *)self isInvalidated])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 6, @"MPNowPlayingInfoCenter was invalidated");
    v4[2](v4, v5);
  }
  else
  {
    id v6 = v4;
    MRMediaRemoteSetNowPlayingPlayerIfPossible();
  }
}

void __64__MPNowPlayingInfoCenter__becomeActiveIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 304);
      id v7 = objc_msgSend(v3, "msv_description");
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "becomeActivePlayerIfPossible: %{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 304);
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "becomeActivePlayerIfPossible: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (id)artworkCatalogBlockForContentItem:(id)a3
{
  id v4 = a3;
  if ([(MPNowPlayingInfoCenter *)self supportsArtworkCatalogLoading])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__MPNowPlayingInfoCenter_artworkCatalogBlockForContentItem___block_invoke;
    v12[3] = &unk_1E57F4418;
    void v12[4] = self;
    id v13 = v4;
    id v5 = (void *)MEMORY[0x19971E0F0](v12);
    int v10 = (void *)MEMORY[0x19971E0F0](v5, v6, v7, v8, v9);
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

uint64_t __60__MPNowPlayingInfoCenter_artworkCatalogBlockForContentItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _artworkCatalogForContentItem:*(void *)(a1 + 40)];
}

- (void)setDataSourceQueue:(id)a3
{
  id v4 = (OS_dispatch_queue *)a3;
  if (self->_dataSourceQueue != v4)
  {
    p_dataSourceQueue = &self->_dataSourceQueue;
    if (!v4)
    {
      id v6 = MEMORY[0x1E4F14428];
      id v4 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    }
    id obj = v4;
    objc_storeStrong((id *)p_dataSourceQueue, v4);
    id v4 = obj;
  }
}

- (void)setNowPlayingContentItem:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) identifier];
  id v3 = [*(id *)(a1 + 40) identifier];
  char v4 = [v2 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 320);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    void block[4] = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __51__MPNowPlayingInfoCenter_setNowPlayingContentItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePlaybackQueueImmediatelyWithCompletion:&__block_literal_global_50];
}

- (MPNowPlayingInfoLyricsDelegate)lyricsDelegate
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__32543;
  id v8 = __Block_byref_object_dispose__32544;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MPNowPlayingInfoLyricsDelegate *)v2;
}

void __40__MPNowPlayingInfoCenter_lyricsDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)setLyricsDelegate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __44__MPNowPlayingInfoCenter_setLyricsDelegate___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

void __44__MPNowPlayingInfoCenter_setLyricsDelegate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 280))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 184));
    id v4 = *(id *)(a1 + 40);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 32) + 184), *(id *)(a1 + 40));
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      objc_msgSend(v5, "_onQueue_registerLyricsDelegateCallbacks:", v6);
    }
  }
}

- (void)setRepresentedApplicationBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (![(MPNowPlayingInfoCenter *)self isInvalidated])
  {
    id v4 = (NSString *)[v6 copy];
    representedApplicationBundleIdentifier = self->_representedApplicationBundleIdentifier;
    self->_representedApplicationBundleIdentifier = v4;

    MRNowPlayingPlayerPathGetClient();
    MRNowPlayingClientSetParentAppBundleIdentifier();
    MRNowPlayingPlayerPathGetOrigin();
    MRMediaRemoteUpdateClientProperties();
  }
}

- (void)resignActiveSystemFallback
{
  if (self->_fallbackActivity)
  {
    MRApplicationActivityEnd();
    CFRelease(self->_fallbackActivity);
    self->_fallbackActivity = 0;
  }
}

void __52__MPNowPlayingInfoCenter_resignActiveSystemFallback__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2
    && ([MEMORY[0x1E4F28C58] errorWithDomain:@"MediaRemote" code:a2 userInfo:0],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    os_log_t v3 = (os_log_t)v2;
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [v3 msv_description];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "MPNowPlayingInfoCenter resigned active system fallback error=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    os_log_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter resigned active system fallback", (uint8_t *)&v6, 2u);
    }
  }
}

- (void)becomeActiveSystemFallback
{
  [(MPNowPlayingInfoCenter *)self becomeActive];
  if (self->_fallbackActivity) {
    [(MPNowPlayingInfoCenter *)self resignActiveSystemFallback];
  }
  os_log_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter becoming active system fallback", v4, 2u);
  }

  MRNowPlayingPlayerPathGetClient();
  MRNowPlayingClientGetBundleIdentifier();
  self->_fallbackActivity = (void *)MRApplicationActivityCreate();
  MRApplicationActivityBegin();
}

void __52__MPNowPlayingInfoCenter_becomeActiveSystemFallback__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_log_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  id v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_msgSend(a2, "msv_description");
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "MPNowPlayingInfoCenter became active system fallback error=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "MPNowPlayingInfoCenter became active system fallback", (uint8_t *)&v6, 2u);
  }
}

- (NSString)playerID
{
  uint64_t v2 = [(MRPlayerPath *)self->_playerPath player];
  os_log_t v3 = [v2 identifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (MPNowPlayingPlaybackState)playbackState
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  MPNowPlayingPlaybackState v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__MPNowPlayingInfoCenter_playbackState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136);
  return result;
}

- (void)setPlaybackState:(MPNowPlayingPlaybackState)playbackState
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke;
  v4[3] = &unk_1E57F8328;
  v4[4] = self;
  void v4[5] = playbackState;
  dispatch_async(accessQueue, v4);
}

void __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 280))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(void *)(v1 + 136) != v3)
    {
      *(void *)(v1 + 136) = v3;
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 1;
      switch(v4)
      {
        case 1:
          break;
        case 2:
          int v5 = 2;
          break;
        case 3:
          int v5 = 3;
          break;
        case 4:
          int v5 = 4;
          break;
        default:
          if (v4 == 1000) {
            int v5 = 5;
          }
          else {
            int v5 = 0;
          }
          break;
      }
      uint64_t v6 = [(id)objc_opt_class() serviceQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      id v7[2] = __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke_2;
      v7[3] = &unk_1E57F9C60;
      v7[4] = *(void *)(a1 + 32);
      int v8 = v5;
      dispatch_async(v6, v7);
    }
  }
}

uint64_t __43__MPNowPlayingInfoCenter_setPlaybackState___block_invoke_2(uint64_t a1)
{
  return MEMORY[0x1F412E7F0](*(void *)(*(void *)(a1 + 32) + 304), *(unsigned int *)(a1 + 40), 0, 0);
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  msv_dispatch_sync_on_queue();
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    playerPath = self->_playerPath;
    *(_DWORD *)buf = 138412802;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = playerPath;
    id v6 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[InfoCenter] <%@: %p (%@)> invalidated", buf, 0x20u);
  }
  uint64_t v7 = objc_opt_class();
  objc_sync_enter(v7);
  [(id)__infoCenterMap removeObjectForKey:self->_playerPath];
  objc_sync_exit(v7);
}

uint64_t __36__MPNowPlayingInfoCenter_invalidate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearPlaybackQueueDataSourceCallbacks");
  *(unsigned char *)(*(void *)(a1 + 32) + 280) = 1;
  return result;
}

- (void)dealloc
{
  MEMORY[0x19971B730](self->_stateHandle, a2);
  [(MPNowPlayingInfoCenter *)self resignActiveSystemFallback];
  if (![(MPNowPlayingInfoCenter *)self isInvalidated])
  {
    uint64_t v3 = +[MPRemoteCommandCenter commandCenterForPlayerPath:self->_playerPath];
    if (!v3) {
      MRMediaRemoteRemovePlayer();
    }
  }
  objc_storeWeak((id *)&self->_playbackQueueDataSource, 0);
  objc_storeWeak((id *)&self->_lyricsDelegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoCenter;
  [(MPNowPlayingInfoCenter *)&v4 dealloc];
}

- (MPNowPlayingInfoCenter)init
{
  return 0;
}

- (void)_onQueue_pushNowPlayingInfoAndRetry:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_nowPlayingInfo != self->_queuedNowPlayingInfo)
  {
    if (_onQueue_pushNowPlayingInfoAndRetry____once != -1) {
      dispatch_once(&_onQueue_pushNowPlayingInfoAndRetry____once, &__block_literal_global_33403);
    }
    pushDate = self->_pushDate;
    if (!pushDate
      || _onQueue_pushNowPlayingInfoAndRetry____isSystemApp
      || ([(NSDate *)pushDate timeIntervalSinceNow], fabs(v6) >= 0.5))
    {
      objc_storeStrong((id *)&self->_nowPlayingInfo, self->_queuedNowPlayingInfo);
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      __int16 v10 = self->_pushDate;
      self->_pushDate = v9;

      _MPToMRNowPlayingInfoDictionary(self->_nowPlayingInfo, self->_publishedContext);
      uint64_t v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      convertedNowPlayingInfo = self->_convertedNowPlayingInfo;
      self->_convertedNowPlayingInfo = v11;

      id v13 = [(NSDictionary *)self->_nowPlayingInfo objectForKeyedSubscript:@"artwork"];
      [(MPNowPlayingInfoCenterArtworkContext *)self->_publishedContext setArtwork:v13];

      uint64_t v14 = [(NSDictionary *)self->_convertedNowPlayingInfo objectForKeyedSubscript:*MEMORY[0x1E4F77458]];
      [(MPNowPlayingInfoCenterArtworkContext *)self->_publishedContext setArtworkIdentifier:v14];

      long long v15 = [(NSDictionary *)self->_convertedNowPlayingInfo objectForKeyedSubscript:*MEMORY[0x1E4F77440]];
      [(MPNowPlayingInfoCenterArtworkContext *)self->_publishedContext setArtworkData:v15];

      id v16 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "NPIC: setNowPlayingInfo: sending to MediaRemote", v18, 2u);
      }

      id v17 = [(MPNowPlayingInfoCenter *)self playerPath];
      MRMediaRemoteSetNowPlayingInfoForPlayer();
    }
    else if (v3)
    {
      dispatch_time_t v7 = dispatch_time(0, 500000000);
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_2;
      block[3] = &unk_1E57F9EA8;
      void block[4] = self;
      dispatch_after(v7, calloutQueue, block);
    }
  }
}

void __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MPNowPlayingPlaybackState v2 = *(NSObject **)(v1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_3;
  block[3] = &unk_1E57F9EA8;
  void block[4] = v1;
  dispatch_barrier_async(v2, block);
}

void __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  objc_super v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = objc_msgSend(v2, "msv_description");
      int v6 = 138543362;
      dispatch_time_t v7 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "NPIC: setNowPlayingInfo: finished error=%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "NPIC: setNowPlayingInfo: finished", (uint8_t *)&v6, 2u);
  }
}

uint64_t __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushNowPlayingInfoAndRetry:", 0);
}

uint64_t __78__MPNowPlayingInfoCenter_NowPlayingInfo___onQueue_pushNowPlayingInfoAndRetry___block_invoke()
{
  uint64_t result = SBSIsSystemApplication();
  _onQueue_pushNowPlayingInfoAndRetry____isSystemApp = result != 0;
  return result;
}

- (NSDictionary)nowPlayingInfo
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__33432;
  __int16 v10 = __Block_byref_object_dispose__33433;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MPNowPlayingInfoCenter_NowPlayingInfo__nowPlayingInfo__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __56__MPNowPlayingInfoCenter_NowPlayingInfo__nowPlayingInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo
{
  objc_super v4 = (void *)[(NSDictionary *)nowPlayingInfo copy];
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __60__MPNowPlayingInfoCenter_NowPlayingInfo__setNowPlayingInfo___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __60__MPNowPlayingInfoCenter_NowPlayingInfo__setNowPlayingInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_pushNowPlayingInfoAndRetry:", 1);
}

@end