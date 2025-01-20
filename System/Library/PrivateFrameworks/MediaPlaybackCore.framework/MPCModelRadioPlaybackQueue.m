@interface MPCModelRadioPlaybackQueue
- (BOOL)isExplicitItemAtIndex:(int64_t)a3;
- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet;
- (MPCModelRadioPlaybackQueue)initWithPlaybackContext:(id)a3;
- (MPModelRadioStation)radioStation;
- (MPSectionedCollection)trackModels;
- (MPSectionedCollection)tracks;
- (id)AVItemAtIndex:(int64_t)a3;
- (id)trackForItemAtIndex:(int64_t)a3;
- (id)tracksByApplyingTracksResponse:(id)a3 currentIndex:(int64_t)a4;
- (int64_t)numberOfItems;
- (int64_t)removeExplicitItems;
- (void)removeAllItems;
- (void)setIdentityPropertySet:(id)a3;
- (void)setRadioStation:(id)a3;
- (void)updateWithPersonalizedResponse:(id)a3;
@end

@implementation MPCModelRadioPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationTracks, 0);
  objc_storeStrong((id *)&self->_radioStation, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (void)setRadioStation:(id)a3
{
}

- (MPModelRadioStation)radioStation
{
  return self->_radioStation;
}

- (void)updateWithPersonalizedResponse:(id)a3
{
  id v4 = a3;
  id v6 = [v4 results];
  v5 = [v6 firstSection];
  [(MPCModelRadioPlaybackQueue *)self setRadioStation:v5];

  [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks updateWithPersonalizedResponse:v4];
}

- (id)tracksByApplyingTracksResponse:(id)a3 currentIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = [(MPCModelRadioPlaybackQueue *)self tracks];
  v8 = [v6 tracks];
  if (![v7 totalItemCount])
  {
    id v9 = v8;
    goto LABEL_10;
  }
  id v9 = objc_alloc_init(MEMORY[0x263F120D8]);
  v10 = [v8 firstSection];
  [v9 appendSection:v10];

  uint64_t v11 = [v6 tracklistAction];
  if (v11 == 1)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13[5] = MEMORY[0x263EF8330];
      v13[6] = 3221225472;
      v13[7] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_2;
      v13[8] = &unk_2643C56F8;
      v13[9] = v9;
      v13[10] = a4;
      goto LABEL_8;
    }
  }
  else if (!v11)
  {
    v13[11] = MEMORY[0x263EF8330];
    v13[12] = 3221225472;
    v13[13] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke;
    v13[14] = &unk_2643C56D0;
    v13[15] = v9;
LABEL_8:
    objc_msgSend(v7, "enumerateItemsUsingBlock:");
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_3;
  v13[3] = &unk_2643C56D0;
  v13[4] = v9;
  [v8 enumerateItemsUsingBlock:v13];
LABEL_10:

  return v9;
}

uint64_t __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendItem:a2];
}

void __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, BOOL *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  [v7 appendItem:a2];
  uint64_t v9 = [v8 item];

  *a4 = v9 == *(void *)(a1 + 40);
}

uint64_t __74__MPCModelRadioPlaybackQueue_tracksByApplyingTracksResponse_currentIndex___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendItem:a2];
}

- (MPSectionedCollection)tracks
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks tracks];
}

- (id)trackForItemAtIndex:(int64_t)a3
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks trackForItemAtIndex:a3];
}

- (MPSectionedCollection)trackModels
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks trackModels];
}

- (int64_t)removeExplicitItems
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks removeExplicitItems];
}

- (void)removeAllItems
{
}

- (int64_t)numberOfItems
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks numberOfItems];
}

- (BOOL)isExplicitItemAtIndex:(int64_t)a3
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks isExplicitItemAtIndex:a3];
}

- (id)AVItemAtIndex:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  stationTracks = self->_stationTracks;
  if (stationTracks)
  {
    id v6 = [(_MPCModelRadioPlaybackQueueStationTracksCollection *)stationTracks AVItemAtIndex:a3];
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      v10 = self;
      __int16 v11 = 2048;
      int64_t v12 = a3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "%{public}@ AVItemAtIndex: returning nil [no stationTracks] globalIndex=%ld", (uint8_t *)&v9, 0x16u);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)setIdentityPropertySet:(id)a3
{
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return [(_MPCModelRadioPlaybackQueueStationTracksCollection *)self->_stationTracks identityPropertySet];
}

- (MPCModelRadioPlaybackQueue)initWithPlaybackContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPCModelRadioPlaybackQueue;
  v5 = [(MPCModelRadioPlaybackQueue *)&v15 init];
  if (v5)
  {
    id v6 = [[_MPCModelRadioPlaybackQueueStationTracksCollection alloc] initWithPlaybackContext:v4];
    stationTracks = v5->_stationTracks;
    v5->_stationTracks = v6;

    id v8 = [v4 playbackRequestEnvironment];
    uint64_t v9 = [v8 _createStoreRequestContext];
    storeRequestContext = v5->_storeRequestContext;
    v5->_storeRequestContext = (ICStoreRequestContext *)v9;

    __int16 v11 = [v4 radioStation];

    if (v11)
    {
      uint64_t v12 = [v4 radioStation];
      radioStation = v5->_radioStation;
      v5->_radioStation = (MPModelRadioStation *)v12;
    }
  }

  return v5;
}

@end