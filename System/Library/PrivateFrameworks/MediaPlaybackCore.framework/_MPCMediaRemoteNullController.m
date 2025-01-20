@interface _MPCMediaRemoteNullController
+ (BOOL)_shouldRegisterForNotifications;
- (id)_init;
- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5;
- (id)contentItemForIdentifier:(id)a3;
- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6;
- (id)playbackQueueForRequest:(void *)a3;
- (id)playbackQueueParticipants;
- (id)playbackState;
- (id)supportedCommands;
- (int64_t)contentItemArtworkCacheStateForIdentifier:(id)a3 size:(CGSize)a4;
- (int64_t)contentItemCacheStateForIdentifier:(id)a3;
- (int64_t)playbackQueueParticipantsCacheState;
- (int64_t)playbackStateCacheState;
- (int64_t)supportedCommandsCacheState;
- (void)invalidateAllTokens;
- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5;
@end

@implementation _MPCMediaRemoteNullController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFuture, 0);
  objc_storeStrong((id *)&self->_contentItemRemoteArtworkForIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_contentItemArtworkForIdentifierFuture, 0);
  objc_storeStrong((id *)&self->_contentItemForIdentifierFuture, 0);

  objc_storeStrong((id *)&self->_playbackQueueFuture, 0);
}

- (void)invalidateAllTokens
{
  [(MPCFuture *)self->super._playbackStateFuture invalidate];
  [(MPCFuture *)self->super._supportedCommandsFuture invalidate];
  [(MPCFuture *)self->_playbackQueueFuture invalidate];
  [(MPCFuture *)self->_contentItemForIdentifierFuture invalidate];
  contentItemArtworkForIdentifierFuture = self->_contentItemArtworkForIdentifierFuture;

  [(MPCFuture *)contentItemArtworkForIdentifierFuture invalidate];
}

- (id)playbackQueueParticipants
{
  return self->_participantsFuture;
}

- (int64_t)playbackQueueParticipantsCacheState
{
  return 1;
}

- (id)contentItemRemoteArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5 artworkFormat:(id)a6
{
  return self->_contentItemRemoteArtworkForIdentifierFuture;
}

- (id)contentItemArtworkForContentItemIdentifier:(id)a3 artworkIdentifier:(id)a4 size:(CGSize)a5
{
  return self->_contentItemArtworkForIdentifierFuture;
}

- (int64_t)contentItemArtworkCacheStateForIdentifier:(id)a3 size:(CGSize)a4
{
  return 1;
}

- (id)contentItemForIdentifier:(id)a3
{
  return self->_contentItemForIdentifierFuture;
}

- (int64_t)contentItemCacheStateForIdentifier:(id)a3
{
  return 1;
}

- (id)playbackQueueForRequest:(void *)a3
{
  return self->_playbackQueueFuture;
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_class();
  id v11 = [(MPCMediaRemoteController *)self resolvedPlayerPath];
  [v10 sendCommand:v6 options:v9 toPlayerPath:v11 completion:v8];
}

- (id)supportedCommands
{
  return self->super._supportedCommandsFuture;
}

- (int64_t)supportedCommandsCacheState
{
  return 1;
}

- (id)playbackState
{
  return self->super._playbackStateFuture;
}

- (int64_t)playbackStateCacheState
{
  return 1;
}

- (id)_init
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)_MPCMediaRemoteNullController;
  id v2 = [(MPCMediaRemoteController *)&v35 _init];
  if (v2)
  {
    v3 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [*((id *)v2 + 3) setDebugLabel:@"playbackState [nullcontroller - init]"];
    [*((id *)v2 + 3) finishWithValue:0];
    v5 = (void *)MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands();
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v13 = NSNumber;
          uint64_t v14 = MEMORY[0x21D49D090](v12);
          v15 = objc_msgSend(v13, "numberWithUnsignedInt:", v14, (void)v31);
          [v6 setObject:v12 forKeyedSubscript:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }

    v16 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v17 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v16;

    [*((id *)v2 + 5) setDebugLabel:@"supportedCommands [nullcontroller - init]"];
    v18 = (void *)*((void *)v2 + 5);
    v19 = (void *)[v6 copy];
    [v18 finishWithValue:v19];

    v20 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v21 = (void *)*((void *)v2 + 33);
    *((void *)v2 + 33) = v20;

    [*((id *)v2 + 33) setDebugLabel:@"playbackQueue [nullcontroller - init]"];
    [*((id *)v2 + 33) finishWithValue:0];
    v22 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v23 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v22;

    [*((id *)v2 + 34) setDebugLabel:@"contentItemForIdentifier [nullcontroller - init]"];
    [*((id *)v2 + 34) finishWithValue:0];
    v24 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v25 = (void *)*((void *)v2 + 35);
    *((void *)v2 + 35) = v24;

    [*((id *)v2 + 35) setDebugLabel:@"contentItemArtworkForIdentifier [nullcontroller - init]"];
    [*((id *)v2 + 35) finishWithValue:0];
    v26 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v27 = (void *)*((void *)v2 + 36);
    *((void *)v2 + 36) = v26;

    [*((id *)v2 + 36) setDebugLabel:@"contentItemRemoteArtworkForContentItemIdentifier [nullcontroller - init]"];
    [*((id *)v2 + 36) finishWithValue:0];
    v28 = [[MPCFuture alloc] initWithQueue:*((void *)v2 + 2)];
    v29 = (void *)*((void *)v2 + 37);
    *((void *)v2 + 37) = v28;

    [*((id *)v2 + 37) setDebugLabel:@"playbackQueueParticipants [nullcontroller - init]"];
    [*((id *)v2 + 37) finishWithValue:MEMORY[0x263EFFA68]];
  }
  return v2;
}

+ (BOOL)_shouldRegisterForNotifications
{
  return 0;
}

@end