@interface MPCAssistantQueryPlaybackQueue
+ (id)queryQueueWithContextID:(id)a3 query:(id)a4;
- (MPCAssistantQueryPlaybackQueue)initWithContextID:(id)a3 query:(id)a4;
- (MPMediaItem)firstItem;
- (MPMediaQuery)query;
- (id)description;
- (int64_t)shuffleType;
- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4;
- (void)setFirstItem:(id)a3;
- (void)setShuffleType:(int64_t)a3;
@end

@implementation MPCAssistantQueryPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstItem, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setFirstItem:(id)a3
{
}

- (MPMediaItem)firstItem
{
  return self->_firstItem;
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)getPlaybackQueueWithDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F11F48]);
  v9 = [NSString stringWithFormat:@"MPCAssistantQueryPlaybackQueue: %@", self->_query];
  [v8 setLabel:v9];

  [v8 setLegacyMediaQuery:self->_query forTransport:1];
  v10 = [MEMORY[0x263F12030] identityKind];
  [v8 setItemKind:v10];

  if (self->_firstItem)
  {
    id v11 = objc_alloc(MEMORY[0x263F11DB0]);
    v12 = [MEMORY[0x263F12030] identityKind];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke;
    v25[3] = &unk_2643C49D8;
    v25[4] = self;
    v13 = (void *)[v11 initWithSource:@"MPCAssistant" modelKind:v12 block:v25];
  }
  else
  {
    v13 = 0;
  }
  v14 = [v8 playbackIntentWithStartItemIdentifiers:v13];
  v15 = v14;
  if (self->_shuffleType == 1) {
    [v14 setShuffleMode:1];
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_14;
  }
  v16 = [v6 outputDeviceUIDs];
  if (![v16 count])
  {
    if ([v6 origin])
    {
      [v6 origin];
      int IsLocalOrigin = MROriginIsLocalOrigin();

      if (!IsLocalOrigin) {
        goto LABEL_9;
      }
    }
    else
    {
    }
LABEL_14:
    uint64_t v17 = 2;
    goto LABEL_15;
  }

LABEL_9:
  uint64_t v17 = 3;
LABEL_15:
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_3;
  v21[3] = &unk_2643C1CC0;
  v23 = self;
  id v24 = v7;
  id v22 = v15;
  id v19 = v15;
  id v20 = v7;
  [v19 getRemotePlaybackQueueWithDestination:v17 completion:v21];
}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 88);
  id v4 = a2;
  v5 = [v3 mediaLibrary];
  id v6 = [v5 uniqueIdentifier];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_2;
  v7[3] = &unk_2643C4938;
  v7[4] = *(void *)(a1 + 32);
  [v4 setLibraryIdentifiersWithDatabaseID:v6 block:v7];
}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v13 = v5;
  if (a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    v6();
    goto LABEL_6;
  }
  if ([v5 _mediaRemotePlaybackQueue])
  {
    [*(id *)(a1 + 40) shouldOverrideManuallyCuratedQueue];
    MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue();
    [*(id *)(a1 + 40) shouldImmediatelyStartPlayback];
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    id v7 = [*(id *)(a1 + 40) siriRecommendationID];
    MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier();

    id v8 = [*(id *)(a1 + 40) siriAssetInfo];
    MRSystemAppPlaybackQueueSetSiriAssetInfo();

    v9 = [*(id *)(a1 + 40) featureName];
    MRSystemAppPlaybackQueueSetFeatureName();

    v10 = [*(id *)(a1 + 40) siriWHAMetricsInfo];
    MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo();

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 66, @"Failed to getRemotePlaybackQueue for intent: %@", *(void *)(a1 + 32));
  (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

LABEL_6:
}

void __77__MPCAssistantQueryPlaybackQueue_getPlaybackQueueWithDestination_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 88);
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MPCAssistantQueryPlaybackQueue;
  id v4 = [(MPCAssistantQueryPlaybackQueue *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ query=%@", v4, self->_query];

  return v5;
}

- (MPCAssistantQueryPlaybackQueue)initWithContextID:(id)a3 query:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPCAssistantQueryPlaybackQueue;
  id v8 = [(MPCAssistantPlaybackQueue *)&v11 initWithContextID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_query, a4);
  }

  return v9;
}

+ (id)queryQueueWithContextID:(id)a3 query:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithContextID:v7 query:v6];

  return v8;
}

@end