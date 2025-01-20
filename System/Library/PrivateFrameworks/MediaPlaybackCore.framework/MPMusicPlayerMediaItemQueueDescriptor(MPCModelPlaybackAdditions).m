@interface MPMusicPlayerMediaItemQueueDescriptor(MPCModelPlaybackAdditions)
- (BOOL)matchesStartItem:()MPCModelPlaybackAdditions;
- (id)playbackContexts;
@end

@implementation MPMusicPlayerMediaItemQueueDescriptor(MPCModelPlaybackAdditions)

- (BOOL)matchesStartItem:()MPCModelPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 startItem];

  if (v5)
  {
    v6 = [a1 startItem];
    uint64_t v7 = [v6 persistentID];
    v8 = [v4 mediaItem];
    BOOL v9 = v7 == [v8 persistentID];
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)playbackContexts
{
  v31[1] = *MEMORY[0x263EF8340];
  v2 = [a1 query];
  id v3 = objc_alloc_init(MEMORY[0x263F11F48]);
  [v3 setLegacyMediaQuery:v2];
  id v4 = NSString;
  v5 = [a1 playActivityFeatureName];
  v6 = [v4 stringWithFormat:@"MediaItemQueueDescriptor-%@", v5];
  [v3 setLabel:v6];

  uint64_t v7 = objc_alloc_init(MPCModelPlaybackContext);
  [(MPCModelPlaybackContext *)v7 setRequest:v3];
  v8 = [a1 startItem];
  if (v8)
  {
    BOOL v9 = [v2 mediaLibrary];
    v10 = [v9 uniqueIdentifier];

    uint64_t v11 = [v8 persistentID];
    if ([v2 isPlaylistItemsQuery]) {
      uint64_t v11 = [v2 _playlistItemPersistentIDForItemPersistentID:v11];
    }
    id v12 = objc_alloc(MEMORY[0x263F11DB0]);
    v13 = [MEMORY[0x263F12030] identityKind];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __84__MPMusicPlayerMediaItemQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
    v28[3] = &unk_2643C3FE0;
    id v29 = v10;
    uint64_t v30 = v11;
    id v14 = v10;
    v15 = (void *)[v12 initWithSource:@"MPMusicPlayerQueueDescriptor" modelKind:v13 block:v28];
    [(MPCModelPlaybackContext *)v7 setStartItemIdentifiers:v15];
  }
  v16 = [a1 startTimes];
  [(MPCModelPlaybackContext *)v7 setStartTimeModifications:v16];

  v17 = [a1 endTimes];
  [(MPCModelPlaybackContext *)v7 setEndTimeModifications:v17];

  -[MPCModelPlaybackContext setShuffleType:](v7, "setShuffleType:", [a1 shuffleType]);
  -[MPCModelPlaybackContext setRepeatType:](v7, "setRepeatType:", [a1 repeatType]);
  v18 = [a1 playActivityFeatureName];
  [(MPCModelPlaybackContext *)v7 setPlayActivityFeatureName:v18];

  v19 = [a1 playActivityRecommendationData];
  [(MPCModelPlaybackContext *)v7 setPlayActivityRecommendationData:v19];

  v20 = [a1 playActivityQueueGroupingID];
  [(MPCModelPlaybackContext *)v7 setPlayActivityQueueGroupingID:v20];

  v21 = [(MPCModelPlaybackContext *)v7 playbackRequestEnvironment];
  v22 = (void *)[v21 mutableCopy];

  v23 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  v24 = [v23 clientIdentifier];
  [v22 setClientIdentifier:v24];

  v25 = [v23 clientVersion];
  [v22 setClientVersion:v25];

  if ([a1 isPrivate]) {
    [(MPCModelPlaybackContext *)v7 setPrivateListeningOverride:MEMORY[0x263EFFA88]];
  }
  [a1 _addRequestingBundleIdentifierToPlaybackRequestEnvironment:v22];
  [(MPCModelPlaybackContext *)v7 setPlaybackRequestEnvironment:v22];
  [(MPCModelPlaybackContext *)v7 setQueueDescriptor:a1];
  v31[0] = v7;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];

  return v26;
}

@end