@interface _MPCModelRadioPlaybackQueueStationTracksCollection
- (BOOL)isExplicitItemAtIndex:(int64_t)a3;
- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet;
- (MPSectionedCollection)trackModels;
- (MPSectionedCollection)tracks;
- (_MPCModelRadioPlaybackQueueStationTracksCollection)initWithPlaybackContext:(id)a3;
- (id)AVItemAtIndex:(int64_t)a3;
- (id)trackForItemAtIndex:(int64_t)a3;
- (int64_t)numberOfItems;
- (int64_t)removeExplicitItems;
- (void)removeAllItems;
- (void)setIdentityPropertySet:(id)a3;
- (void)updateWithPersonalizedResponse:(id)a3;
@end

@implementation _MPCModelRadioPlaybackQueueStationTracksCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_trackModels, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_activeModelGenericAVItems, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)setIdentityPropertySet:(id)a3
{
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return self->_identityPropertySet;
}

- (MPSectionedCollection)tracks
{
  return self->_tracks;
}

- (MPSectionedCollection)trackModels
{
  return self->_trackModels;
}

- (id)trackForItemAtIndex:(int64_t)a3
{
  tracks = self->_tracks;
  v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  v5 = [(MPSectionedCollection *)tracks itemAtIndexPath:v4];

  return v5;
}

- (int64_t)removeExplicitItems
{
  id v3 = objc_alloc_init(MEMORY[0x263F120D8]);
  id v4 = objc_alloc_init(MEMORY[0x263F120D8]);
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  trackModels = self->_trackModels;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke;
  v9[3] = &unk_2643C5770;
  v9[4] = v3;
  v9[5] = v4;
  v9[7] = v5;
  v9[8] = v10;
  v9[6] = self;
  [(MPSectionedCollection *)trackModels enumerateSectionsUsingBlock:v9];
  int64_t v7 = [v5 count];
  if (v7 >= 1)
  {
    objc_storeStrong((id *)&self->_trackModels, v3);
    objc_storeStrong((id *)&self->_tracks, v4);
  }
  _Block_object_dispose(v10, 8);

  return v7;
}

- (void)removeAllItems
{
  id v3 = (MPSectionedCollection *)objc_alloc_init(MEMORY[0x263F120D8]);
  trackModels = self->_trackModels;
  self->_trackModels = v3;

  id v5 = (MPSectionedCollection *)objc_alloc_init(MEMORY[0x263F120D8]);
  tracks = self->_tracks;
  self->_tracks = v5;
}

- (int64_t)numberOfItems
{
  return [(MPSectionedCollection *)self->_trackModels totalItemCount];
}

- (BOOL)isExplicitItemAtIndex:(int64_t)a3
{
  id v5 = -[_MPCModelRadioPlaybackQueueStationTracksCollection AVItemAtIndex:](self, "AVItemAtIndex:");
  char v6 = [v5 isExplicitTrack];

  if (v6) {
    return 1;
  }
  v8 = [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self trackForItemAtIndex:a3];
  v9 = [v8 parentTrack];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v9) {
    goto LABEL_5;
  }
  tracks = self->_tracks;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76___MPCModelRadioPlaybackQueueStationTracksCollection_isExplicitItemAtIndex___block_invoke;
  v13[3] = &unk_2643C5720;
  v13[4] = v9;
  v13[5] = &v14;
  [(MPSectionedCollection *)tracks enumerateItemsUsingBlock:v13];
  if (v15[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = -[_MPCModelRadioPlaybackQueueStationTracksCollection AVItemAtIndex:](self, "AVItemAtIndex:");
    char v7 = [v11 isExplicitTrack];
  }
  else
  {
LABEL_5:
    char v7 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)AVItemAtIndex:(int64_t)a3
{
  id v4 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  id v5 = [(MPSectionedCollection *)self->_trackModels itemAtIndexPath:v4];
  char v6 = [[MPCModelGenericAVItem alloc] initWithGenericObject:v5 itemProperties:self->_itemProperties playbackRequestEnvironment:self->_playbackRequestEnvironment identityPropertySet:self->_identityPropertySet];
  char v7 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
  v8 = +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:v7];
  [(MPCModelGenericAVItem *)v6 setAssetCacheProvider:v8];

  [(MPCModelGenericAVItem *)v6 setRadioPlayback:1];
  v9 = [NSNumber numberWithBool:self->_isSiriInitiated];
  [(MPCModelGenericAVItem *)v6 setSiriInitiated:v9];

  [(MPCModelGenericAVItem *)v6 setPrioritizeStartupOverQuality:self->_prioritizeStartupOverQuality];
  v10 = [(MPSectionedCollection *)self->_tracks itemAtIndexPath:v4];
  v11 = -[MPSectionedCollection sectionAtIndex:](self->_tracks, "sectionAtIndex:", [v4 section]);
  uint64_t v12 = [v10 trackType];
  [(MPCModelGenericAVItem *)v6 setRadioStreamPlayback:v12 == 4];
  -[MPCModelGenericAVItem setSubscriptionRequired:](v6, "setSubscriptionRequired:", [v11 isSubscriptionRequired]);
  v13 = [v10 serverTrackInfo];
  [(MPCModelGenericAVItem *)v6 setTrackInfo:v13];

  if (v12 == 1)
  {
    uint64_t v14 = [v10 likeState];
    uint64_t v15 = 3;
    if (v14 != -1) {
      uint64_t v15 = 1;
    }
    if (v14 == 1) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = v15;
    }
    [(MPCModelGenericAVItem *)v6 setStationItemLikedState:v16];
  }
  accessQueue = self->_accessQueue;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68___MPCModelRadioPlaybackQueueStationTracksCollection_AVItemAtIndex___block_invoke;
  v20[3] = &unk_2643C5EE8;
  v20[4] = self;
  v20[5] = v6;
  dispatch_barrier_sync(accessQueue, v20);
  v18 = v6;

  return v18;
}

- (void)updateWithPersonalizedResponse:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 results];
  v23 = [v4 radioStationTracks];
  char v6 = [v4 request];
  char v7 = [v6 itemProperties];
  itemProperties = self->_itemProperties;
  self->_itemProperties = v7;

  v9 = (MPSectionedCollection *)[v5 copy];
  trackModels = self->_trackModels;
  self->_trackModels = v9;

  v11 = (MPSectionedCollection *)[v23 copy];
  tracks = self->_tracks;
  self->_tracks = v11;

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__30707;
  v33 = __Block_byref_object_dispose__30708;
  id v34 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85___MPCModelRadioPlaybackQueueStationTracksCollection_updateWithPersonalizedResponse___block_invoke;
  block[3] = &unk_2643C67A0;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(accessQueue, block);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = (id)v30[5];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v19 = [v18 genericObject];
        v20 = [v19 identifiers];
        v21 = [v5 indexPathForItemWithIdentifiersIntersectingSet:v20];

        if (v21)
        {
          v22 = [v5 itemAtIndexPath:v21];
          if (v22) {
            [v18 setGenericObject:v22];
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(&v29, 8);
}

- (_MPCModelRadioPlaybackQueueStationTracksCollection)initWithPlaybackContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MPCModelRadioPlaybackQueueStationTracksCollection;
  id v5 = [(_MPCModelRadioPlaybackQueueStationTracksCollection *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioPlaybackQueue.accessQueue.StationTracksSection", MEMORY[0x263EF83A8]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = [v4 siriReferenceIdentifier];
    v5->_isSiriInitiated = v8 != 0;

    uint64_t v9 = [v4 playbackRequestEnvironment];
    playbackRequestEnvironment = v5->_playbackRequestEnvironment;
    v5->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v9;

    v11 = [v4 queueDescriptor];
    v5->_prioritizeStartupOverQuality = [v11 prioritizeStartupOverQuality];
  }
  return v5;
}

@end