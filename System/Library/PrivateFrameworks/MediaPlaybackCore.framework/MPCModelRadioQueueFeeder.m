@interface MPCModelRadioQueueFeeder
+ (id)sharedQueue;
+ (void)__CRASH_FOR_UNEXPECTED_TRACK_DELETE__;
- (BOOL)_isTransientLoadingError:(id)a3;
- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4;
- (BOOL)canSkipItem:(id)a3 reason:(id *)a4;
- (BOOL)containsLiveStream;
- (BOOL)containsRadioContent;
- (BOOL)containsTransportableContentWithReason:(id *)a3;
- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4;
- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4;
- (BOOL)shouldRequestAdditionalItemsWhenReachingTailOfSection:(id)a3;
- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4;
- (MPCModelRadioQueueFeeder)init;
- (NSString)rtcReportingPlayQueueSourceIdentifier;
- (id)_defaultGetTracksRequestWithContext:(id)a3 radioStation:(id)a4;
- (id)_errorForRequest:(id)a3 withError:(id)a4;
- (id)accountIDForItem:(id)a3 inSection:(id)a4;
- (id)firstModelPlayEvent;
- (id)identifiersForItem:(id)a3 inSection:(id)a4;
- (id)itemForItem:(id)a3 inSection:(id)a4;
- (id)placeholderItemForLoadingAdditionalItemsInSection:(id)a3;
- (id)supplementalPlaybackContextWithReason:(int64_t)a3;
- (id)updatedPlaybackContext;
- (int64_t)itemCount;
- (int64_t)prefetchThresholdForSection:(id)a3;
- (int64_t)supplementalPlaybackContextBehavior;
- (void)_allowCellularStreamingDidChangeNotification:(id)a3;
- (void)_beginBackgroundTaskAssertion;
- (void)_beginObservingIdentityStoreForSignOut;
- (void)_detectSignOutForIdentityStore:(id)a3;
- (void)_detectSignOutForIdentityStoreChangeNotification:(id)a3;
- (void)_endBackgroundTaskAssertion;
- (void)_endObservingIdentityStoreForSignOut;
- (void)_handleGetTracksResponse:(id)a3 getTracksError:(id)a4 fromRequest:(id)a5 completion:(id)a6;
- (void)_handlePersonalizationResponse:(id)a3 personalizationError:(id)a4 fromRequest:(id)a5 completion:(id)a6;
- (void)_loadTracksWithRequest:(id)a3 completion:(id)a4;
- (void)_observePersonalizationResponse:(id)a3;
- (void)_removeAllTracks;
- (void)_removeRestrictedTracks;
- (void)_repersonalizeCurrentTracks;
- (void)_responseDidInvalidate;
- (void)_responseDidInvalidateNotification:(id)a3;
- (void)_updateAdditionalLoadingSupport;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)itemDidBeginPlayback:(id)a3;
- (void)loadAdditionalItemsWithCount:(int64_t)a3 forSection:(id)a4 completion:(id)a5;
- (void)loadPlaybackContext:(id)a3 completion:(id)a4;
- (void)reloadSection:(id)a3 completion:(id)a4;
@end

@implementation MPCModelRadioQueueFeeder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_observedIdentityStore, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_storeStrong((id *)&self->_lastPlayedIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCleanPlayedIdentifier, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);

  objc_storeStrong((id *)&self->_section, 0);
}

- (void)_repersonalizeCurrentTracks
{
  v3 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue tracks];
  if ([v3 totalItemCount] >= 1)
  {
    queueGeneration = (void *)self->_queueGeneration;
    objc_initWeak(&location, self);
    v5 = [[MPCModelRadioPersonalizationRequest alloc] initWithRadioStationTracks:v3];
    v6 = [(MPCModelRadioPersonalizationRequest *)v5 itemKind];
    v7 = objc_msgSend((id)objc_msgSend(v6, "modelClass"), "mqf_requiredItemPlaybackProperties");
    [(MPCModelRadioPersonalizationRequest *)v5 setItemProperties:v7];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke;
    v8[3] = &unk_2643C6220;
    objc_copyWeak(v9, &location);
    v9[1] = queueGeneration;
    [(MPCModelRadioPersonalizationRequest *)v5 performWithResponseHandler:v8];
    objc_destroyWeak(v9);

    objc_destroyWeak(&location);
  }
}

void __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke_2;
  block[3] = &unk_2643C61F8;
  objc_copyWeak(v8, (id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  id v7 = v3;
  v8[1] = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v8);
}

void __55__MPCModelRadioQueueFeeder__repersonalizeCurrentTracks__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32)) {
    BOOL v3 = WeakRetained == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && WeakRetained[22] == *(id *)(a1 + 48))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[10], "updateWithPersonalizedResponse:");
    [v4 _observePersonalizationResponse:*(void *)(a1 + 32)];
    WeakRetained = v4;
  }
}

- (void)_responseDidInvalidate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MPCModelRadioQueueFeeder__responseDidInvalidate__block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__MPCModelRadioQueueFeeder__responseDidInvalidate__block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[160])
  {
    BOOL v3 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
    char v4 = [v3 allowsExplicitContent];

    v2 = *(unsigned char **)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      v2[160] = 0;
      [*(id *)(a1 + 32) _removeRestrictedTracks];
      v2 = *(unsigned char **)(a1 + 32);
    }
  }

  return [v2 _repersonalizeCurrentTracks];
}

- (void)_removeRestrictedTracks
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  BOOL v3 = [(MPMutableIdentifierListSection *)self->_section itemIdentifiers];
  char v4 = (void *)[v3 copy];

  int64_t v5 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue removeExplicitItems];
  if (v5)
  {
    int64_t v6 = v5;
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v40 = self;
      __int16 v41 = 2048;
      int64_t v42 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[RQF:%p] _removeRestrictedTracks | removedItems.count=%ld", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_lastPlayedIdentifier, self->_lastCleanPlayedIdentifier);
    v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[MPCModelRadioQueueFeeder itemCount](self, "itemCount"));
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke;
    v37[3] = &unk_2643C60E8;
    v37[4] = self;
    id v9 = v8;
    id v38 = v9;
    [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccess:v37];
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self->_playbackQueue);

    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v13 = v12;
    unint64_t v14 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "rqf:_removeRestrictedTracks:diff", "", buf, 2u);
    }

    v15 = (void *)MEMORY[0x263F11D58];
    uint64_t v16 = [v4 count];
    uint64_t v17 = [v9 count];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_160;
    v34[3] = &unk_2643C5F10;
    id v35 = v4;
    id v18 = v9;
    id v36 = v18;
    v19 = [v15 changeDetailsWithPreviousCount:v16 finalCount:v17 isEqualBlock:v34 isUpdatedBlock:&__block_literal_global_163_31409];
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v21 = v20;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_END, v11, "rqf:_removeRestrictedTracks:diff", "changes=%{public}@", buf, 0xCu);
    }

    if (v19)
    {
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v23 = v22;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v11, "rqf:_removeRestrictedTracks:apply", "", buf, 2u);
      }

      v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v25 = v24;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v25, OS_SIGNPOST_EVENT, v11, "rqf:_removeRestrictedTracks:apply", "applying", buf, 2u);
      }

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_164;
      v31[3] = &unk_2643C60E8;
      v26 = v19;
      v32 = v26;
      id v33 = v18;
      [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccess:v31];
      section = self->_section;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_3;
      v30[3] = &unk_2643C5FA0;
      v30[4] = self;
      [(MPMutableIdentifierListSection *)section applyChanges:v26 itemLookupBlock:v30];
      v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v29 = v28;
      if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v29, OS_SIGNPOST_INTERVAL_END, v11, "rqf:_removeRestrictedTracks:apply", "", buf, 2u);
      }
    }
  }
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(*(void *)(a1 + 32) + 80) trackModels];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2;
  v6[3] = &unk_2643C6070;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateItemIdentifiersUsingBlock:v6];
}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  int64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  id v7 = [v6 first];

  uint64_t v8 = [v5 isEqual:v7];
  return v8;
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_164(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_165;
  v4[3] = &unk_2643C60C0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 applyChanges:v3 identifierSetLookupBlock:v4];
}

id __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_4;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v5[4] = a2;
  uint64_t v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

id __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_165(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v3 = [v2 second];

  return v3;
}

uint64_t __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2_161()
{
  return 0;
}

void __51__MPCModelRadioQueueFeeder__removeRestrictedTracks__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  char v4 = objc_msgSend(*(id *)(a1 + 32), "itemForIdentifierSet:");
  id v5 = *(void **)(a1 + 40);
  int64_t v6 = (void *)MEMORY[0x263F54F10];
  id v7 = v4;
  if (!v4)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v8 = [v6 pairWithFirst:v7 second:v9];
  [v5 addObject:v8];

  if (!v4) {
}
  }

- (void)_removeAllTracks
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = [(MPMutableIdentifierListSection *)self->_section itemIdentifiers];
  char v4 = (void *)[v3 copy];

  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self->_playbackQueue);

  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "rqf:_removeAllTracks:diff", "", buf, 2u);
  }

  v10 = objc_msgSend(MEMORY[0x263F11D58], "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", objc_msgSend(v4, "count"), 0, &__block_literal_global_151, &__block_literal_global_153);
  os_signpost_id_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v6, "rqf:_removeAllTracks:diff", "changes=%{public}@", buf, 0xCu);
  }

  if (v10)
  {
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    unint64_t v14 = v13;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v6, "rqf:_removeAllTracks:apply", "", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_154;
    block[3] = &unk_2643C61D0;
    void block[4] = self;
    os_signpost_id_t v18 = v6;
    id v17 = v10;
    v15 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_154(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllItems];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_EVENT, v4, "rqf:_removeAllTracks:apply", "applying", buf, 2u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_155;
  v13[3] = &unk_2643C61A8;
  id v5 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v5 identifierRegistryWithExclusiveAccess:v13];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(v7 + 72);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_3;
  v12[3] = &unk_2643C5FA0;
  v12[4] = v7;
  [v8 applyChanges:v6 itemLookupBlock:v12];
  unint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_END, v11, "rqf:_removeAllTracks:apply", "", buf, 2u);
  }
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_155(uint64_t a1, void *a2)
{
  return [a2 applyChanges:*(void *)(a1 + 32) identifierSetLookupBlock:&__block_literal_global_158];
}

id __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_4;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v5[4] = a2;
  uint64_t v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_2_156()
{
  return [MEMORY[0x263F11DB0] emptyIdentifierSet];
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke_2()
{
  return 0;
}

uint64_t __44__MPCModelRadioQueueFeeder__removeAllTracks__block_invoke()
{
  return 1;
}

- (void)_observePersonalizationResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (MPCModelRadioPersonalizationResponse *)a3;
  p_lastResponse = (id *)&self->_lastResponse;
  if (self->_lastResponse != v5)
  {
    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = v7;
    unint64_t v9 = (void *)MEMORY[0x263F11B18];
    if (*p_lastResponse) {
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x263F11B18]);
    }
    objc_storeStrong((id *)&self->_lastResponse, a3);
    if (*p_lastResponse)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__responseDidInvalidateNotification_, *v9);
      if (([*p_lastResponse isValid] & 1) == 0)
      {
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = 134217984;
          v12 = self;
          _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_INFO, "[RQF:%p] personalization response invalidated", (uint8_t *)&v11, 0xCu);
        }

        [(MPCModelRadioQueueFeeder *)self _responseDidInvalidate];
      }
    }
  }
}

- (void)_loadTracksWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(MPCModelRadioQueueFeeder *)self _beginBackgroundTaskAssertion];
  uint64_t v8 = self->_siriAssetInfo;
  siriAssetInfo = self->_siriAssetInfo;
  self->_siriAssetInfo = 0;

  objc_initWeak(&location, self);
  v10 = [[MPCModelRadioGetTracksOperation alloc] initWithGetTracksRequest:v6 siriAssetInfo:v8 radioQueueFeeder:self];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke;
  v17[3] = &unk_2643C6160;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  objc_copyWeak(&v20, &location);
  id v12 = v7;
  id v19 = v12;
  [(MPCModelRadioGetTracksOperation *)v10 setCompletionHandler:v17];
  uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(id)objc_opt_class() sharedQueue];
    uint64_t v15 = [v14 operationCount];
    *(_DWORD *)buf = 134218498;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = v15;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _loadTracksWithRequest:… | starting [] request=%{public}@ sharedQueue.operationCount=%ld", buf, 0x20u);
  }
  uint64_t v16 = [(id)objc_opt_class() sharedQueue];
  [v16 addOperation:v10];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_2;
  block[3] = &unk_2643C6138;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v11;
  id v19 = v7;
  id v20 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  id v21 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v22);
}

void __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      id v8 = [*(id *)(a1 + 64) urlMetrics];
      id v9 = [v8 firstObject];
      uint64_t v10 = [v9 humanDescription];
      id v11 = objc_msgSend(*(id *)(a1 + 32), "msv_description");
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v6;
      __int16 v29 = 2114;
      uint64_t v30 = v7;
      __int16 v31 = 2114;
      v32 = v10;
      __int16 v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "[RQF:%p] _loadTracksWithRequest:… | finished [] request=%{public}@ response=%{public}@ metrics='%{public}@' error=%{public}@", buf, 0x34u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [*(id *)(a1 + 64) urlMetrics];
    id v16 = [v15 firstObject];
    uint64_t v17 = [v16 humanDescription];
    *(_DWORD *)buf = 134218754;
    uint64_t v26 = v12;
    __int16 v27 = 2114;
    uint64_t v28 = v13;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _loadTracksWithRequest:… | finished [] request=%{public}@ response=%{public}@ metrics='%{public}@'", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 56);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_145;
  v22[3] = &unk_2643C6110;
  id v24 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 64);
  [WeakRetained _handleGetTracksResponse:v20 getTracksError:v19 fromRequest:v21 completion:v22];
}

uint64_t __62__MPCModelRadioQueueFeeder__loadTracksWithRequest_completion___block_invoke_145(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (BOOL)_isTransientLoadingError:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F88F00]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    BOOL v8 = v6 == -7100 || v6 == -7103;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_handlePersonalizationResponse:(id)a3 personalizationError:(id)a4 fromRequest:(id)a5 completion:(id)a6
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v79 = a6;
  uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v10);

  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v16 = v15;
  os_signpost_id_t spid = v14;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:_handlePersonalizationResponse", "", buf, 2u);
  }

  if (v10)
  {
    id v76 = v11;
    v78 = v12;
    if (!self->_queueGeneration)
    {
      id v18 = [(MPCModelRadioPlaybackContext *)self->_playbackContext radioStation];
      uint64_t v19 = [v18 identifiers];
      uint64_t v20 = [v19 radio];
      uint64_t v21 = [v20 stationStringID];
      uint64_t v22 = [v21 length];

      if (!v22)
      {
        id v23 = [v10 radioStationTracks];
        id v24 = [v23 firstSection];
        id v25 = [v24 identifiers];
        uint64_t v26 = [v25 radio];
        __int16 v27 = [v26 stationStringID];

        if ([(MPCModelRadioQueueFeeder *)v27 length])
        {
          uint64_t v28 = (MPCModelRadioPlaybackContext *)[(MPCModelRadioPlaybackContext *)self->_playbackContext copy];
          __int16 v29 = [v10 radioStationTracks];
          uint64_t v30 = [v29 firstSection];
          [(MPCModelRadioPlaybackContext *)v28 setRadioStation:v30];

          playbackContext = self->_playbackContext;
          self->_playbackContext = v28;

          v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v95 = self;
            __int16 v96 = 2114;
            v97 = v27;
            _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handlePersonalizationResponse: | updating section [gained stationID] newStationID=%{public}@", buf, 0x16u);
          }

          section = self->_section;
          if (!section)
          {
            self->_needsSectionUpdate = 1;
            section = self->_section;
          }
          [(MPMutableIdentifierListSection *)section updateSection];
        }
        else
        {
        }
      }
    }
    int64_t v39 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue numberOfItems];
    v40 = [v10 results];
    uint64_t v41 = [v40 totalItemCount];

    if (v39 == v41)
    {
      int64_t v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v95 = self;
        __int16 v96 = 2048;
        v97 = (MPCModelRadioQueueFeeder *)v39;
        __int16 v98 = 2048;
        int64_t v99 = v39;
        _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_ERROR, "[RQF:%p] _handlePersonalizationResponse: | setting _hasReachedTracklistEnd=YES [no new items] previousCount=%ld finalCount=%ld", buf, 0x20u);
      }

      self->_hasReachedTracklistEnd = 1;
    }
    if (self->_mayHaveRestrictedContent) {
      char v43 = 1;
    }
    else {
      char v43 = [v78 allowsExplicitContent];
    }
    self->_mayHaveRestrictedContent = v43;
    ++self->_queueGeneration;
    [(MPCModelRadioPlaybackQueue *)self->_playbackQueue updateWithPersonalizedResponse:v10];
    [(MPCModelRadioQueueFeeder *)self _observePersonalizationResponse:v10];
    if (self->_mayHaveRestrictedContent)
    {
      v44 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
      char v45 = [v44 allowsExplicitContent];

      if ((v45 & 1) == 0)
      {
        self->_mayHaveRestrictedContent = 0;
        [(MPCModelRadioPlaybackQueue *)self->_playbackQueue removeExplicitItems];
      }
    }
    if (self->_lastPlayedIdentifier)
    {
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke;
      v93[3] = &unk_2643C5DC8;
      v93[4] = self;
      [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v93];
    }
    [(MPCModelRadioQueueFeeder *)self _beginObservingIdentityStoreForSignOut];
    v46 = [(MPMutableIdentifierListSection *)self->_section itemIdentifiers];
    uint64_t v47 = [v46 copy];
    v48 = (void *)v47;
    v49 = (void *)MEMORY[0x263EFFA68];
    if (v47) {
      v49 = (void *)v47;
    }
    id v50 = v49;

    v51 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v50, "count"));
    v52 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[MPCModelRadioQueueFeeder itemCount](self, "itemCount"));
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2;
    v88[3] = &unk_2643C6098;
    v34 = (MPCModelRadioQueueFeeder *)v50;
    v89 = v34;
    id v53 = v51;
    id v90 = v53;
    v91 = self;
    id v54 = v52;
    id v92 = v54;
    [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccess:v88];
    v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v56 = v55;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:_handlePersonalizationResponse:diff", "", buf, 2u);
    }

    v57 = (void *)MEMORY[0x263F11D58];
    uint64_t v58 = [v53 count];
    uint64_t v59 = [v54 count];
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_136;
    v85[3] = &unk_2643C5F10;
    id v60 = v53;
    id v86 = v60;
    id v61 = v54;
    id v87 = v61;
    v62 = [v57 changeDetailsWithPreviousCount:v58 finalCount:v59 isEqualBlock:v85 isUpdatedBlock:&__block_literal_global_139];
    v63 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v64 = v63;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_DWORD *)buf = 138543362;
      v95 = v62;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v64, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse:diff", "changes=%{public}@", buf, 0xCu);
    }

    v37 = v79;
    if (v62)
    {
      v65 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v95 = self;
        __int16 v96 = 2114;
        v97 = v62;
        _os_log_impl(&dword_21BB87000, v65, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handlePersonalizationResponse: | applying diff [] changes=%{public}@", buf, 0x16u);
      }

      v66 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v67 = v66;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v67, OS_SIGNPOST_INTERVAL_BEGIN, spid, "rqf:_handlePersonalizationResponse:apply", "", buf, 2u);
      }

      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_140;
      v82[3] = &unk_2643C60E8;
      v68 = v62;
      v83 = v68;
      id v84 = v61;
      [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccess:v82];
      v69 = self->_section;
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3_143;
      v81[3] = &unk_2643C5FA0;
      v81[4] = self;
      [(MPMutableIdentifierListSection *)v69 applyChanges:v68 itemLookupBlock:v81];
      v70 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v71 = v70;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v71, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse:apply", "", buf, 2u);
      }
    }
    if (v79) {
      (*((void (**)(id, void))v79 + 2))(v79, 0);
    }
    v72 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v73 = v72;
    id v11 = v77;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      v74 = [v10 results];
      uint64_t v75 = [v74 totalItemCount];
      *(_DWORD *)buf = 134217984;
      v95 = (MPCModelRadioQueueFeeder *)v75;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v73, OS_SIGNPOST_INTERVAL_END, spid, "rqf:_handlePersonalizationResponse", "numberOfItems=%lld", buf, 0xCu);
    }
    id v12 = v78;
  }
  else
  {
    v34 = [(MPCModelRadioQueueFeeder *)self _errorForRequest:v12 withError:v11];
    uint64_t v35 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v36 = v35;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)buf = 138543362;
      v95 = v34;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v36, OS_SIGNPOST_INTERVAL_END, v14, "rqf:_handlePersonalizationResponse", "error=%{public}@", buf, 0xCu);
    }

    if (self->_queueGeneration)
    {
      v37 = v79;
    }
    else
    {
      id v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v37 = v79;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v95 = self;
        __int16 v96 = 2114;
        v97 = v34;
        _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_ERROR, "[RQF:%p] _handlePersonalizationResponse: | failing [queueGeneration = 0] error=%{public}@", buf, 0x16u);
      }

      (*((void (**)(id, MPCModelRadioQueueFeeder *))v79 + 2))(v79, v34);
    }
  }
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(*(void *)(a1 + 32) + 144)];
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v3 identifierSetForItem:v9];
        id v11 = *(void **)(a1 + 40);
        v22[0] = v9;
        v22[1] = v10;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
        [v11 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [*(id *)(*(void *)(a1 + 48) + 80) trackModels];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3;
  v15[3] = &unk_2643C6070;
  id v16 = v3;
  id v17 = *(id *)(a1 + 56);
  id v14 = v3;
  [v13 enumerateItemIdentifiersUsingBlock:v15];
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_136(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = [v5 firstObject];

  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  BOOL v8 = [v7 firstObject];

  uint64_t v9 = [v6 isEqual:v8];
  return v9;
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_140(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_141;
  v4[3] = &unk_2643C60C0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 applyChanges:v3 identifierSetLookupBlock:v4];
}

id __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3_143(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_4;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v5[4] = a2;
  uint64_t v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

id __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_141(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

uint64_t __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_2_137()
{
  return 0;
}

void __103__MPCModelRadioQueueFeeder__handlePersonalizationResponse_personalizationError_fromRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) itemForIdentifierSet:v4];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v9[0] = v7;
  v9[1] = v4;
  BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v6 addObject:v8];

  if (!v5) {
}
  }

- (void)_handleGetTracksResponse:(id)a3 getTracksError:(id)a4 fromRequest:(id)a5 completion:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v15 = (char *)os_signpost_id_make_with_pointer(v14, v10);

    id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v17 = v16;
    unint64_t v18 = (unint64_t)(v15 - 1);
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:merge", "", buf, 2u);
    }

    if (self->_currentItem)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke;
      v37[3] = &unk_2643C5DC8;
      v37[4] = self;
      uint64_t v19 = [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v37];
    }
    else
    {
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v39 = self;
      __int16 v40 = 2048;
      uint64_t v41 = v19;
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_INFO, "[RQF:%p] _handleGetTracksResponse: | merging playback queue [] currentIndex=%lld", buf, 0x16u);
    }

    long long v20 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue tracksByApplyingTracksResponse:v10 currentIndex:v19];
    id v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v24 = v23;
    if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v24, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:merge", "", buf, 2u);
    }

    objc_initWeak(&location, self);
    id v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v26 = v25;
    if (v18 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "rqf:_handleGetTracksResponse:personalize", "", buf, 2u);
    }

    __int16 v27 = [[MPCModelRadioPersonalizationRequest alloc] initWithRadioStationTracks:v20];
    [(MPCModelRadioPersonalizationRequest *)v27 setAnalyticsSignpostsEnabled:1];
    uint64_t v28 = [(MPCModelRadioPersonalizationRequest *)v27 itemKind];
    __int16 v29 = objc_msgSend((id)objc_msgSend(v28, "modelClass"), "mqf_requiredItemPlaybackProperties");
    [(MPCModelRadioPersonalizationRequest *)v27 setItemProperties:v29];

    uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v20 totalItemCount];
      *(_DWORD *)buf = 134218498;
      int64_t v39 = self;
      __int16 v40 = 2048;
      uint64_t v41 = v31;
      __int16 v42 = 2114;
      char v43 = v27;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handleGetTracksResponse: | starting personalization [] request.trackCount=%ld request=%{public}@", buf, 0x20u);
    }

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_127;
    v32[3] = &unk_2643C6048;
    v32[4] = self;
    v32[5] = v27;
    objc_copyWeak(v35, &location);
    id v33 = v12;
    id v34 = v13;
    v35[1] = v15;
    [(MPCModelRadioPersonalizationRequest *)v27 performWithResponseHandler:v32];

    objc_destroyWeak(v35);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v20 = [(MPCModelRadioQueueFeeder *)self _errorForRequest:v12 withError:v11];
    long long v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v39 = self;
      __int16 v40 = 2114;
      uint64_t v41 = (uint64_t)v20;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "[RQF:%p] _handleGetTracksResponse: | failed [no track response] error=%{public}@", buf, 0x16u);
    }

    if (v13) {
      (*((void (**)(id, void *))v13 + 2))(v13, v20);
    }
  }

  [(MPCModelRadioQueueFeeder *)self _endBackgroundTaskAssertion];
}

uint64_t __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = a2;
  id v4 = [v2 queueIdentifier];
  uint64_t v5 = [v3 indexForItem:v4];

  return v5;
}

void __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_2;
  v11[3] = &unk_2643C6020;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v13 = v5;
  id v7 = v5;
  objc_copyWeak(v17, (id *)(a1 + 64));
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 72);
  id v16 = v8;
  v17[1] = v9;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);

  objc_destroyWeak(v17);
}

void __91__MPCModelRadioQueueFeeder__handleGetTracksResponse_getTracksError_fromRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v16 = 134218498;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    uint64_t v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[RQF:%p] _handleGetTracksResponse: | finished personalization [] request=%{public}@ response=%{public}@", (uint8_t *)&v16, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained _handlePersonalizationResponse:*(void *)(a1 + 48) personalizationError:*(void *)(a1 + 56) fromRequest:*(void *)(a1 + 64) completion:*(void *)(a1 + 72)];
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 88);
  if (v7)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      int v16 = 138543362;
      uint64_t v17 = v11;
      long long v12 = " error=%{public}@";
      id v13 = v9;
      os_signpost_id_t v14 = v10;
      uint32_t v15 = 12;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_END, v14, "rqf:_handleGetTracksResponse:personalize", v12, (uint8_t *)&v16, v15);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v16) = 0;
    long long v12 = "";
    id v13 = v9;
    os_signpost_id_t v14 = v10;
    uint32_t v15 = 2;
    goto LABEL_10;
  }
}

- (id)_errorForRequest:(id)a3 withError:(id)a4
{
  v69[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F88FA0];
  uint64_t v9 = objc_msgSend(v7, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F88FA0]);

  if (v9)
  {
    os_signpost_id_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v63 = self;
      __int16 v64 = 2114;
      uint64_t v65 = (uint64_t)v7;
      uint64_t v11 = "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICRadioServerErrorDomai"
            "n] underlyingError=%{public}@";
LABEL_7:
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v12 = *MEMORY[0x263F88F00];
  id v13 = objc_msgSend(v7, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F88F00], -7101);

  if (v13)
  {
    os_signpost_id_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v63 = self;
      __int16 v64 = 2114;
      uint64_t v65 = (uint64_t)v7;
      uint64_t v11 = "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICErrorCodeInvalidReque"
            "st] underlyingError=%{public}@";
      goto LABEL_7;
    }
LABEL_8:

    self->_hasReachedTracklistEnd = 1;
    id v14 = v7;
    goto LABEL_9;
  }
  id v16 = v7;
  id v14 = v16;
  if (self->_queueGeneration)
  {
    uint64_t v17 = objc_msgSend(v16, "msv_errorByUnwrappingDomain:code:", v12, -7100);

    if (v17)
    {
      __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v63 = self;
        __int16 v64 = 2114;
        uint64_t v65 = (uint64_t)v14;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | setting _hasReachedTracklistEnd=YES [received ICErrorCodeConnectionFailed] underlyingError=%{public}@", buf, 0x16u);
      }

      self->_hasReachedTracklistEnd = 1;
    }
    goto LABEL_9;
  }
  self->_hasReachedTracklistEnd = 1;
  if (!_os_feature_enabled_impl())
  {
    id v23 = v6;
    uint64_t v24 = (void *)MEMORY[0x263EFF9A0];
    id v25 = v14;
    uint64_t v26 = [v24 dictionaryWithCapacity:4];
    __int16 v27 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
    uint64_t v28 = objc_msgSend(v25, "msv_errorByUnwrappingDomain:", v8);

    uint64_t v59 = v26;
    if (v28)
    {
      uint64_t v29 = [v28 code];
      uint64_t v30 = 0;
      if (v29 > 139)
      {
        if (v29 == 141)
        {
          [v26 setObject:&unk_26CC192F0 forKeyedSubscript:@"MPCRadioPlaybackErrorCategoryKey"];
          uint64_t v30 = [v27 localizedStringForKey:@"PLAYBACK_FAILURE_LOCATION_RESTRICTION_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          goto LABEL_29;
        }
        uint64_t v31 = 0;
        if (v29 != 140) {
          goto LABEL_30;
        }
        id v34 = (void *)[objc_alloc(NSNumber) initWithInteger:3];
        [v26 setObject:v34 forKey:@"MPCRadioPlaybackErrorCategoryKey"];
      }
      else
      {
        if (v29 == 120)
        {
          v55 = [v23 seedContentReference];
          unint64_t v56 = [v55 contentType];
          if (v56 > 3)
          {
            uint64_t v31 = 0;
          }
          else
          {
            uint64_t v31 = [v27 localizedStringForKey:off_2643C5790[v56] value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          }

          uint64_t v30 = 0;
          goto LABEL_30;
        }
        uint64_t v31 = 0;
        if (v29 != 125)
        {
LABEL_30:
          if (v30 | v31)
          {
            [MEMORY[0x263F121C0] dialogWithTitle:v30 message:v31];
            v57 = v28;
            uint64_t v35 = v58 = v23;
            id v36 = v27;
            v37 = (void *)MEMORY[0x263F121C8];
            id v38 = [v36 localizedStringForKey:@"OK" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
            int64_t v39 = [v37 actionWithTitle:v38 type:0 commandEvent:0];
            [v35 addAction:v39];

            __int16 v27 = v36;
            uint64_t v28 = v57;

            [v59 setObject:v35 forKey:@"MPCErrorUserInfoKeyRemoteDialog"];
            id v23 = v58;
          }

          uint64_t v22 = v59;
          goto LABEL_33;
        }
        v32 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
        char v33 = [v32 allowsExplicitContent];

        if ((v33 & 1) == 0)
        {
          uint64_t v30 = [v27 localizedStringForKey:@"EXPLICIT_CONTENT_NOT_ALLOWED_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          uint64_t v31 = [v27 localizedStringForKey:@"EXPLICIT_CONTENT_NOT_ALLOWED_DUE_TO_RESTRICTIONS" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          goto LABEL_30;
        }
      }
    }
    uint64_t v30 = 0;
LABEL_29:
    uint64_t v31 = 0;
    goto LABEL_30;
  }
  v68 = @"ICRadioContentReferenceType";
  uint64_t v19 = NSNumber;
  __int16 v20 = [v6 seedContentReference];
  uint64_t v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "contentType"));
  v69[0] = v21;
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];

LABEL_33:
  id v40 = v14;
  uint64_t v41 = objc_msgSend(v40, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F08570], -1009);

  __int16 v42 = v40;
  if (v41)
  {
    char v43 = [MEMORY[0x263F89110] sharedMonitor];
    uint64_t v44 = [v43 networkType];

    char v45 = [MEMORY[0x263F12178] standardUserDefaults];
    if ([v45 preferredMusicLowBandwidthResolution] < 1)
    {
      uint64_t v47 = 0;
    }
    else
    {
      v46 = [MEMORY[0x263F11D60] sharedCloudController];
      uint64_t v47 = [v46 isCellularDataRestrictedForMusic] ^ 1;
    }
    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v63 = self;
      __int16 v64 = 2048;
      uint64_t v65 = v44;
      __int16 v66 = 1024;
      int v67 = v47;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | Received NSURLErrorNotConnectedToInternet [] currentNetworkType=%li cellularDataAllowed=%{BOOL}u", buf, 0x1Cu);
    }

    if ((v47 & 1) != 0 || !ICEnvironmentNetworkTypeIsCellular())
    {
      v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v63 = self;
        __int16 v64 = 2114;
        uint64_t v65 = (uint64_t)v40;
        _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_ERROR, "[RQF:%p] _errorForRequest:withError: | Transforming error to 'radio queue feeder network unavailable' [] underlyingError=%{public}@", buf, 0x16u);
      }
      uint64_t v50 = -1004;
      v51 = @"Network Unavailable";
    }
    else
    {
      v49 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v63 = self;
        __int16 v64 = 2114;
        uint64_t v65 = (uint64_t)v40;
        _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_INFO, "[RQF:%p] _errorForRequest:withError: | Transforming error to 'cellular restricted error' [network type cellular] underlyingError=%{public}@", buf, 0x16u);
      }
      uint64_t v50 = -1003;
      v51 = @"Cellular Restricted";
    }

    v60[0] = @"ICEnvironmentNetworkType";
    v52 = [NSNumber numberWithInteger:v44];
    v60[1] = @"isMusicCellularStreamingAllowed";
    v61[0] = v52;
    id v53 = [NSNumber numberWithBool:v47];
    v61[1] = v53;
    id v54 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
    __int16 v42 = objc_msgSend(v40, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", @"MPCModelRadioQueueFeederError", v50, v54, @"radio request failed with reason: %@", v51);
  }
  if (!v42)
  {
    __int16 v42 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCModelRadioQueueFeederError", -1005, @"Invalid case -- missing underlyingError");
  }
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:userInfo:debugDescription:", *MEMORY[0x263F110C0], 3, v42, v22, @"radio request failed");
  id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:

  return v14;
}

- (void)_endObservingIdentityStoreForSignOut
{
  if (self->_observedIdentityStore)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F89088] object:self->_observedIdentityStore];
    observedIdentityStore = self->_observedIdentityStore;
    self->_observedIdentityStore = 0;
  }
}

- (void)_endBackgroundTaskAssertion
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__MPCModelRadioQueueFeeder__endBackgroundTaskAssertion__block_invoke;
  v3[3] = &unk_2643C5FF0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __55__MPCModelRadioQueueFeeder__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[14] - 1;
    WeakRetained[14] = v3;
    if (!v3)
    {
      uint64_t v4 = *MEMORY[0x263F54E88];
      if (WeakRetained[13] != *MEMORY[0x263F54E88])
      {
        uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = v2[13];
          int v8 = 134218240;
          uint64_t v9 = v2;
          __int16 v10 = 2048;
          uint64_t v11 = v6;
          _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_INFO, "[RQF:%p] _beginBackgroundTaskAssertion | ended task [] backgroundTaskIdentifier=%lu", (uint8_t *)&v8, 0x16u);
        }

        id v7 = MPSharedBackgroundTaskProvider();
        [v7 endTask:v2[13]];

        v2[13] = v4;
      }
    }
  }
}

- (void)_detectSignOutForIdentityStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICStoreRequestContext *)self->_storeRequestContext identity];
  id v13 = 0;
  uint64_t v6 = [v4 getPropertiesForUserIdentity:v5 error:&v13];
  id v7 = v13;

  if (v7)
  {
    int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend(v7, "msv_description");
      *(_DWORD *)buf = 134218242;
      uint32_t v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] _detectSignOutForIdentityStore: | error=%{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  if (!v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__MPCModelRadioQueueFeeder__detectSignOutForIdentityStore___block_invoke;
    block[3] = &unk_2643C5EE8;
    uint64_t v11 = v4;
    uint64_t v12 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    int v8 = v11;
LABEL_6:
  }
}

void __59__MPCModelRadioQueueFeeder__detectSignOutForIdentityStore___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 192) && !*(unsigned char *)(v1 + 208))
  {
    *(unsigned char *)(v1 + 128) = 1;
    *(unsigned char *)(*(void *)(a1 + 40) + 208) = 1;
    [*(id *)(a1 + 40) _removeAllTracks];
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[RQF:%p] _detectSignOutForIdentityStore: | clearing tracklist [nil active account]", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)_defaultGetTracksRequestWithContext:(id)a3 radioStation:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x263F89290];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  __int16 v10 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
  uint64_t v11 = [v10 allowsExplicitContent];

  if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v12 = (void *)MEMORY[0x263F11DA8];
    id v13 = [v6 identity];
    id v14 = [v6 identityStore];
    uint32_t v15 = [v12 userMonitorWithUserIdentity:v13 fromUserIdentityStore:v14];

    if (v15)
    {
      uint64_t v11 = [v15 isExplicitSettingEnabled];
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v6 identity];
        *(_DWORD *)uint64_t v30 = 134218754;
        *(void *)&v30[4] = self;
        *(_WORD *)&v30[12] = 1024;
        *(_DWORD *)&v30[14] = v11;
        *(_WORD *)&v30[18] = 2114;
        *(void *)&v30[20] = v17;
        *(_WORD *)&v30[28] = 2048;
        *(void *)&v30[30] = v15;
        uint64_t v18 = "[RQF:%p] _defaultGetTracksRequestWithContext: | updating allowExplicit with homeUserMonitor [] allowExplic"
              "it=%{BOOL}u userIdentity=%{public}@ userMonitor=%p";
        uint64_t v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        uint32_t v21 = 38;
LABEL_7:
        _os_log_impl(&dword_21BB87000, v19, v20, v18, v30, v21);
      }
    }
    else
    {
      __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v6 identity];
        *(_DWORD *)uint64_t v30 = 134218242;
        *(void *)&v30[4] = self;
        *(_WORD *)&v30[12] = 2114;
        *(void *)&v30[14] = v17;
        uint64_t v18 = "[RQF:%p] _defaultGetTracksRequestWithContext: | failed to get homeUserMonitor [] userIdentity=%{public}@";
        uint64_t v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 22;
        goto LABEL_7;
      }
    }
  }
  objc_msgSend(v9, "setAllowsExplicitContent:", v11, *(_OWORD *)v30, *(void *)&v30[16], *(_OWORD *)&v30[24], v31);
  [v9 setRequestContext:v6];
  [v9 setShouldResponseContainStationMetadata:1];
  uint64_t v22 = MEMORY[0x263EFFA88];
  [v9 setPrivateListeningEnabled:MEMORY[0x263EFFA88]];
  [v9 setDelegatedPrivateListeningEnabled:v22];
  id v23 = [v8 identifiers];

  if (v23)
  {
    uint64_t v24 = [v23 radio];
    id v25 = [v24 stationHash];
    [v9 setStationHash:v25];

    uint64_t v26 = [v23 radio];
    objc_msgSend(v9, "setStationID:", objc_msgSend(v26, "stationID"));

    __int16 v27 = [v23 radio];
    uint64_t v28 = [v27 stationStringID];
    [v9 setStationStringID:v28];
  }

  return v9;
}

- (void)_beginObservingIdentityStoreForSignOut
{
  uint64_t v3 = [(ICStoreRequestContext *)self->_storeRequestContext identityStore];
  p_observedIdentityStore = &self->_observedIdentityStore;
  if (self->_observedIdentityStore != v3)
  {
    obj = v3;
    int v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = v5;
    uint64_t v7 = (void *)MEMORY[0x263F89088];
    if (*p_observedIdentityStore) {
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x263F89088]);
    }
    objc_storeStrong((id *)&self->_observedIdentityStore, obj);
    if (*p_observedIdentityStore)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__detectSignOutForIdentityStoreChangeNotification_, *v7);
      [(MPCModelRadioQueueFeeder *)self _detectSignOutForIdentityStore:*p_observedIdentityStore];
    }

    uint64_t v3 = obj;
  }
}

- (void)_beginBackgroundTaskAssertion
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t backgroundTasks = self->_backgroundTasks;
  self->_unint64_t backgroundTasks = backgroundTasks + 1;
  uint64_t v4 = *MEMORY[0x263F54E88];
  if (!backgroundTasks || self->_backgroundTaskIdentifier == v4)
  {
    int v5 = [(MPCModelRadioQueueFeeder *)self description];
    id v6 = MPSharedBackgroundTaskProvider();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__MPCModelRadioQueueFeeder__beginBackgroundTaskAssertion__block_invoke;
    v15[3] = &unk_2643C5FC8;
    void v15[4] = self;
    self->_unint64_t backgroundTaskIdentifier = [v6 beginTaskWithName:v5 expirationHandler:v15];

    unint64_t backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v9 = v8;
    if (backgroundTaskIdentifier == v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = self;
        __int16 v10 = "[RQF:%p] _beginBackgroundTaskAssertion | failed to start task []";
        uint64_t v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 12;
LABEL_8:
        _os_log_impl(&dword_21BB87000, v11, v12, v10, buf, v13);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v14 = self->_backgroundTaskIdentifier;
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = v14;
      __int16 v10 = "[RQF:%p] _beginBackgroundTaskAssertion | started task [] backgroundTaskIdentifier=%lu";
      uint64_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 22;
      goto LABEL_8;
    }
  }
}

void __57__MPCModelRadioQueueFeeder__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = MPSharedBackgroundTaskProvider();
  [v2 endTask:*(void *)(*(void *)(a1 + 32) + 104)];

  uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 104);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "[RQF:%p] _beginBackgroundTaskAssertion | task expired [] backgroundTaskIdentifier=%lu", (uint8_t *)&v6, 0x16u);
  }

  *(void *)(*(void *)(a1 + 32) + 104) = *MEMORY[0x263F54E88];
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__MPCModelRadioQueueFeeder_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__MPCModelRadioQueueFeeder_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAdditionalLoadingSupport];
}

- (void)_responseDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__MPCModelRadioQueueFeeder__responseDidInvalidateNotification___block_invoke;
  v6[3] = &unk_2643C5EE8;
  id v7 = v4;
  __int16 v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __63__MPCModelRadioQueueFeeder__responseDidInvalidateNotification___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) object];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 152);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _responseDidInvalidate];
  }
}

- (void)_detectSignOutForIdentityStoreChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__MPCModelRadioQueueFeeder__detectSignOutForIdentityStoreChangeNotification___block_invoke;
  v6[3] = &unk_2643C5EE8;
  id v7 = v4;
  __int16 v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __77__MPCModelRadioQueueFeeder__detectSignOutForIdentityStoreChangeNotification___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) object];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 192);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = v4[24];
    [v4 _detectSignOutForIdentityStore:v5];
  }
}

- (void)_allowCellularStreamingDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__MPCModelRadioQueueFeeder__allowCellularStreamingDidChangeNotification___block_invoke;
  block[3] = &unk_2643C5FC8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__MPCModelRadioQueueFeeder__allowCellularStreamingDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAdditionalLoadingSupport];
}

- (void)_updateAdditionalLoadingSupport
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v4 = [v3 preferredMusicLowBandwidthResolution];

  uint64_t v5 = [MEMORY[0x263F89110] sharedMonitor];
  [v5 networkType];
  int IsCellular = ICEnvironmentNetworkTypeIsCellular();

  int v7 = IsCellular ^ 1;
  if (v4 > 0) {
    int v7 = 1;
  }
  if (self->_supportsLoadingAdditionalItems != v7)
  {
    self->_supportsLoadingAdditionalItems = v7;
    if ((v7 & 1) == 0)
    {
      __int16 v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        uint64_t v10 = self;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] _updateAdditionalLoadingSupport | loading additional items disabled [cellular streaming restricted]", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return (NSString *)@"queue-source.tilt";
}

- (id)firstModelPlayEvent
{
  uint64_t v3 = (void *)MEMORY[0x263F11F88];
  uint64_t v4 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue radioStation];
  uint64_t v5 = [(MPCModelRadioQueueFeeder *)self playActivityFeatureName];
  int v6 = [v3 playEventWithModelObject:v4 featureName:v5];

  return v6;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_section, a3);
  __int16 v8 = (void (**)(id, void))a4;
  if (self->_needsSectionUpdate)
  {
    [(MPMutableIdentifierListSection *)self->_section updateSection];
    self->_needsSectionUpdate = 0;
  }
  int v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v7);

  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_log_type_t v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection", "", buf, 2u);
  }

  unint64_t v14 = [v7 itemIdentifiers];
  uint32_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  __int16 v16 = v15;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection:diff", "", buf, 2u);
  }

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke;
  v28[3] = &unk_2643C5F58;
  id v17 = v14;
  id v29 = v17;
  uint64_t v30 = self;
  __int16 v18 = [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v28];
  unint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v20 = v19;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v20, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection:diff", "changes=%{public}@", buf, 0xCu);
  }

  if (v18)
  {
    uint32_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v22 = v21;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v10, "rqf:reloadSection:apply", "", buf, 2u);
    }

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_84;
    v27[3] = &unk_2643C5FA0;
    v27[4] = self;
    [v7 applyChanges:v18 itemLookupBlock:v27];
    id v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v24, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection:apply", "", buf, 2u);
    }
  }
  id v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v26 = v25;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v26, OS_SIGNPOST_INTERVAL_END, v10, "rqf:reloadSection", "", buf, 2u);
  }

  v8[2](v8, 0);
}

id __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263F11D58];
  uint64_t v5 = [*(id *)(a1 + 32) count];
  uint64_t v6 = [*(id *)(a1 + 40) itemCount];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2;
  v10[3] = &unk_2643C5F10;
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v7 = v3;
  __int16 v8 = [v4 changeDetailsWithPreviousCount:v5 finalCount:v6 isEqualBlock:v10 isUpdatedBlock:&__block_literal_global_83];

  return v8;
}

id __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_84(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2_85;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  v5[4] = a2;
  id v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2_85(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = [*(id *)(a1 + 40) itemAtIndex:a3];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

uint64_t __53__MPCModelRadioQueueFeeder_reloadSection_completion___block_invoke_3()
{
  return 0;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 == 0;
}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (id)placeholderItemForLoadingAdditionalItemsInSection:(id)a3
{
  if ([(MPCModelRadioPlaybackContext *)self->_playbackContext continueListeningStation])
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue radioStation];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F12150]);
      uint64_t v7 = (void *)MEMORY[0x263F11F78];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke;
      v11[3] = &unk_2643C5EE8;
      id v8 = v6;
      id v12 = v8;
      id v13 = v5;
      [v7 performWithoutEnforcement:v11];
      int v9 = v13;
      id v4 = v8;
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 40) name];
  if ([v2 length])
  {
    id v3 = [*(id *)(a1 + 40) name];
    [*(id *)(a1 + 32) setMainTitle:v3];
  }
  else
  {
    id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    id v4 = [v3 localizedStringForKey:@"LOADING_AUDIO_LABEL" value:&stru_26CBCA930 table:@"MediaPlayer"];
    [*(id *)(a1 + 32) setMainTitle:v4];
  }
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  id v6 = [v5 localizedStringForKey:@"RADIO_LABEL" value:&stru_26CBCA930 table:@"MediaPlayer"];
  [*(id *)(a1 + 32) setArtist:v6];

  if ([*(id *)(a1 + 40) hasLoadedValueForKey:*MEMORY[0x263F11718]])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke_2;
    v7[3] = &unk_2643C5EC0;
    id v8 = *(id *)(a1 + 40);
    [*(id *)(a1 + 32) setArtworkCatalogBlock:v7];
  }
}

uint64_t __78__MPCModelRadioQueueFeeder_placeholderItemForLoadingAdditionalItemsInSection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) artworkCatalog];
}

- (void)loadAdditionalItemsWithCount:(int64_t)a3 forSection:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  os_signpost_id_t v10 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue radioStation];
  id v11 = [(MPCModelRadioQueueFeeder *)self _defaultGetTracksRequestWithContext:self->_storeRequestContext radioStation:v10];
  [v11 setReasonType:3];
  if (a3 <= 1) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = a3;
  }
  [v11 setRequestedTrackCount:v12];
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  uint32_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = self;
    __int16 v27 = 2048;
    int64_t v28 = a3;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | calling load", buf, 0x20u);
  }

  __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v17 = v16;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "rqf:loadAdditionalItems:loadTracks", "", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__MPCModelRadioQueueFeeder_loadAdditionalItemsWithCount_forSection_completion___block_invoke;
  v20[3] = &unk_2643C5E98;
  os_signpost_id_t v23 = v14;
  int64_t v24 = a3;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v18 = v9;
  id v19 = v8;
  [(MPCModelRadioQueueFeeder *)self _loadTracksWithRequest:v11 completion:v20];
}

void __79__MPCModelRadioQueueFeeder_loadAdditionalItemsWithCount_forSection_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v4)
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v7, "rqf:loadAdditionalItems:loadTracks", " error=%{public}@", (uint8_t *)&v16, 0xCu);
    }

    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[8];
      os_signpost_id_t v10 = (void *)a1[4];
      uint64_t v11 = a1[5];
      int64_t v12 = objc_msgSend(v4, "msv_description");
      int v16 = 134218754;
      id v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      os_signpost_id_t v23 = v12;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | completed error=%{public}@", (uint8_t *)&v16, 0x2Au);
    }
  }
  else
  {
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v7, "rqf:loadAdditionalItems:loadTracks", "", (uint8_t *)&v16, 2u);
    }

    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = a1[8];
      os_signpost_id_t v14 = (void *)a1[4];
      uint64_t v15 = a1[5];
      int v16 = 134218498;
      id v17 = v14;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadAdditionalItemsWithCount:%ld forSection:%{public}@ | completed", (uint8_t *)&v16, 0x20u);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (int64_t)prefetchThresholdForSection:(id)a3
{
  if (![(MPCModelRadioPlaybackContext *)self->_playbackContext continueListeningStation]) {
    return 1;
  }
  int64_t result = [(MPCModelRadioPlaybackContext *)self->_playbackContext continueListeningPrefetchThreshold];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (BOOL)shouldRequestAdditionalItemsWhenReachingTailOfSection:(id)a3
{
  id v4 = a3;
  if (self->_supportsLoadingAdditionalItems && !self->_hasReachedTracklistEnd) {
    BOOL v5 = ![(MPCModelRadioQueueFeeder *)self containsLiveStream];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  os_signpost_id_t v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(MPMutableIdentifierListSection *)self->_section sectionIdentifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    __int16 v20 = [(MPMutableIdentifierListSection *)self->_section sectionIdentifier];
    [v19 handleFailureInMethod:a2, self, @"MPCModelRadioQueueFeeder.m", 384, @"Provided section identifier did not match stored section identifier: %@ != %@", v8, v20 object file lineNumber description];
  }
  if (self->_playbackQueue)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __50__MPCModelRadioQueueFeeder_itemForItem_inSection___block_invoke;
    v21[3] = &unk_2643C5DC8;
    uint64_t v11 = v7;
    __int16 v22 = v11;
    uint64_t v12 = [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v21];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v24 = self;
        __int16 v25 = 2114;
        uint64_t v26 = v11;
        __int16 v27 = 2114;
        id v28 = v8;
        _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "[RQF:%p] itemForItem:%{public}@ inSection:%{public}@ | returning nil [no index for item in registry]", buf, 0x20u);
      }
      os_signpost_id_t v14 = 0;
    }
    else
    {
      int v16 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue AVItemAtIndex:v12];
      os_signpost_id_t v14 = v16;
      if (!v16)
      {
LABEL_14:
        uint64_t v15 = v22;
        goto LABEL_15;
      }
      [v16 setFeeder:self];
      [v14 setQueueIdentifier:v11];
      id v17 = [(MPCModelRadioQueueFeeder *)self modelPlayEventForItem:v11 inSection:v8];
      [v14 setModelPlayEvent:v17];

      uint64_t v13 = [(MPCModelRadioPlaybackContext *)self->_playbackContext associatedParticipantIdentifier];
      [v14 setAssociatedParticipantIdentifier:v13];
    }

    goto LABEL_14;
  }
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[RQF:%p] itemForItem:%{public}@ inSection:%{public}@ | returning nil [no playbackQueue]", buf, 0x20u);
  }
  os_signpost_id_t v14 = 0;
LABEL_15:

  return v14;
}

uint64_t __50__MPCModelRadioQueueFeeder_itemForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __57__MPCModelRadioQueueFeeder_identifiersForItem_inSection___block_invoke;
  void v9[3] = &unk_2643C5E70;
  id v10 = v5;
  id v6 = v5;
  os_signpost_id_t v7 = [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v9];

  return v7;
}

id __57__MPCModelRadioQueueFeeder_identifiersForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 indexForItem:*(void *)(a1 + 32)];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 identifierSetAtIndex:v4];
  }

  return v5;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v8);

  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "rqf:loadPlaybackContext", "", buf, 2u);
  }

  uint64_t v15 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
  char v16 = [v15 allowsRadioService];

  if (v16)
  {
    unint64_t v96 = v11 - 1;
    SEL v97 = a2;
    os_signpost_id_t v98 = v11;
    id v17 = [v8 playActivityRecommendationData];
    [(MPCModelRadioQueueFeeder *)self setPlayActivityRecommendationData:v17];

    __int16 v18 = [v8 playActivityQueueGroupingID];
    [(MPCModelRadioQueueFeeder *)self setPlayActivityQueueGroupingID:v18];

    uint64_t v19 = [v8 playActivityFeatureName];
    [(MPCModelRadioQueueFeeder *)self setPlayActivityFeatureName:v19];

    __int16 v20 = [v8 siriReferenceIdentifier];
    [(MPCModelRadioQueueFeeder *)self setSiriReferenceIdentifier:v20];

    uint64_t v21 = [v8 siriWHAMetricsInfo];
    [(MPCModelRadioQueueFeeder *)self setSiriWHAMetricsInfo:v21];

    __int16 v22 = [v8 playbackRequestEnvironment];
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v22;

    uint64_t v24 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
    storeRequestContext = self->_storeRequestContext;
    self->_storeRequestContext = v24;

    objc_storeStrong((id *)&self->_playbackContext, a3);
    uint64_t v26 = [[MPCModelRadioPlaybackQueue alloc] initWithPlaybackContext:v8];
    playbackQueue = self->_playbackQueue;
    self->_playbackQueue = v26;

    id v28 = [v8 siriAssetInfo];
    siriAssetInfo = self->_siriAssetInfo;
    self->_siriAssetInfo = v28;

    id v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v31 = [(NSString *)self->_siriAssetInfo length];
      v32 = self->_siriAssetInfo;
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      __int16 v113 = 2048;
      NSUInteger v114 = v31;
      __int16 v115 = 2112;
      v116 = v32;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:%{public}@ | [] siriAssetInfo=(:%ld)%@", buf, 0x2Au);
    }

    uint64_t v33 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
    id v110 = 0;
    id v34 = [[MPCModelGenericAVItemUserIdentityPropertySet alloc] initWithRequestContext:v33 error:&v110];
    id v35 = v110;
    [(MPCModelRadioPlaybackQueue *)self->_playbackQueue setIdentityPropertySet:v34];

    if (v35
      || ([(MPCModelRadioPlaybackQueue *)self->_playbackQueue identityPropertySet],
          char v43 = objc_claimAutoreleasedReturnValue(),
          v43,
          !v43))
    {
      id v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_ERROR, "[RQF:%p] loadPlaybackContext:… | failed to load identity properties [] error=%{public}@", buf, 0x16u);
      }

      (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v35);
      goto LABEL_50;
    }
    id v93 = v9;
    [(MPCModelRadioQueueFeeder *)self _endObservingIdentityStoreForSignOut];
    uint64_t v44 = [(MPCModelRadioQueueFeeder *)self _defaultGetTracksRequestWithContext:self->_storeRequestContext radioStation:0];
    char v45 = [v8 radioStation];
    v46 = [v45 identifiers];
    uint64_t v47 = [v46 radio];
    v48 = [v47 stationStringID];

    v95 = v44;
    v94 = v48;
    if ([v8 continueListeningStation])
    {
      if ([v48 length])
      {
        [v44 setReasonType:1];
        [v44 setStationStringID:v48];
        v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v48;
          uint64_t v50 = "[RQF:%p] loadPlaybackContext:… | resuming continue listening station [] stationID=%{public}@";
          v51 = v49;
          uint32_t v52 = 22;
LABEL_30:
          _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);
        }
      }
      else
      {
        [v44 setReasonType:6];
        v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = self;
          uint64_t v50 = "[RQF:%p] loadPlaybackContext:… | requesting new continue listening station";
          v51 = v49;
          uint32_t v52 = 12;
          goto LABEL_30;
        }
      }

      uint64_t v71 = [(MPCModelRadioPlaybackContext *)self->_playbackContext continueListeningMaxQueueReferences];
      if (v71 <= 0) {
        uint64_t v72 = 10;
      }
      else {
        uint64_t v72 = v71;
      }
      v73 = [v8 continueListeningQueueProvider];
      v74 = [v73 queueReferencesWithMaxCount:v72];

      uint64_t v75 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v74, "count"));
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      os_log_t v67 = v74;
      uint64_t v76 = [v67 countByEnumeratingWithState:&v106 objects:v111 count:16];
      id v9 = v93;
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v77; ++i)
          {
            if (*(void *)v107 != v78) {
              objc_enumerationMutation(v67);
            }
            v80 = [*(id *)(*((void *)&v106 + 1) + 8 * i) ICRadioContentReference];
            [v75 addObject:v80];
          }
          uint64_t v77 = [v67 countByEnumeratingWithState:&v106 objects:v111 count:16];
        }
        while (v77);
      }

      [v95 setQueueContentReferences:v75];
      os_signpost_id_t v81 = v98;
      unint64_t v82 = v96;
      goto LABEL_46;
    }
    [v44 setReasonType:1];
    uint64_t v53 = [v48 length];
    id v54 = v44;
    if (v53)
    {
      v55 = [v8 radioStation];
      unint64_t v56 = [v55 identifiers];
      v57 = [v56 radio];
      id v58 = [v57 stationHash];
      [v44 setStationHash:v58];

      uint64_t v59 = [v8 radioStation];
      id v60 = [v59 identifiers];
      id v61 = [v60 radio];
      objc_msgSend(v44, "setStationID:", objc_msgSend(v61, "stationID"));

      v62 = [v8 radioStation];
      v63 = [v62 identifiers];
      __int16 v64 = [v63 radio];
      uint64_t v65 = [v64 stationStringID];
      [v44 setStationStringID:v65];

      __int16 v66 = [v8 stationURL];
      [v44 setStationURL:v66];

      os_log_t v67 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v9 = v93;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = [v54 stationStringID];
        v69 = [v54 stationHash];
        v70 = [v54 stationURL];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v68;
        __int16 v113 = 2114;
        NSUInteger v114 = (NSUInteger)v69;
        __int16 v115 = 2114;
        v116 = v70;
        _os_log_impl(&dword_21BB87000, v67, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:… | resuming station [] stationID=%{public}@ stationHash=%{public}@ stationURL=%{public}@", buf, 0x2Au);

LABEL_44:
      }
    }
    else
    {
      v83 = [v8 nowPlayingContentReference];
      id v84 = [v83 ICRadioContentReference];
      [v44 setNowPlayingContentReference:v84];

      v85 = [v8 nowPlayingContentReference];
      [v44 setPreservingCurrentlyPlayingItem:v85 != 0];

      id v86 = [v8 seedContentReference];
      id v87 = [v86 ICRadioContentReference];
      [v44 setSeedContentReference:v87];

      os_log_t v67 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      id v9 = v93;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = [v54 seedContentReference];
        v69 = [v54 nowPlayingContentReference];
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v68;
        __int16 v113 = 2114;
        NSUInteger v114 = (NSUInteger)v69;
        _os_log_impl(&dword_21BB87000, v67, OS_LOG_TYPE_DEFAULT, "[RQF:%p] loadPlaybackContext:… | requesting new station [] seedContentReference=%{public}@, nowPlayingContentReference=%{public}@", buf, 0x20u);
        goto LABEL_44;
      }
    }
    unint64_t v82 = v96;
    os_signpost_id_t v81 = v98;
LABEL_46:

    id v88 = objc_alloc_init(MEMORY[0x263F54ED0]);
    v89 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v90 = v89;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
    {
      int v91 = [v95 reasonType];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v91;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v81, "rqf:loadPlaybackContext:getTracks", "reasonType=%d", buf, 8u);
    }

    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = __59__MPCModelRadioQueueFeeder_loadPlaybackContext_completion___block_invoke;
    v99[3] = &unk_2643C5E48;
    id v100 = v88;
    v101 = self;
    SEL v104 = v97;
    os_signpost_id_t v105 = v81;
    v102 = v95;
    id v103 = v9;
    id v92 = v88;
    [(MPCModelRadioQueueFeeder *)self _loadTracksWithRequest:v95 completion:v99];

    id v35 = 0;
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v33 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 64, @"Radio service is restricted");
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v38 = v37;
  if (v33)
  {
    if (v14 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37)) {
      goto LABEL_24;
    }
    *(void *)buf = 67109378;
    *(_WORD *)&buf[8] = 2114;
    *(void *)&buf[10] = v33;
    int64_t v39 = "allowsRadioService=%d error=%{public}@";
    id v40 = v38;
    os_signpost_id_t v41 = v11;
    uint32_t v42 = 18;
  }
  else
  {
    if (v14 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v37)) {
      goto LABEL_24;
    }
    *(void *)buf = 67109120;
    int64_t v39 = "allowsRadioService=%d";
    id v40 = v38;
    os_signpost_id_t v41 = v11;
    uint32_t v42 = 8;
  }
  _os_signpost_emit_with_name_impl(&dword_21BB87000, v40, OS_SIGNPOST_INTERVAL_END, v41, "rqf:loadPlaybackContext:allowsRadioService", v39, buf, v42);
LABEL_24:

  (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v33);
LABEL_51:
}

void __59__MPCModelRadioQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  if (([v6 disarm] & 1) == 0)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"MPCModelRadioQueueFeeder.m" lineNumber:369 description:@"_loadTracksWithRequest completion called more than once"];
  }
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 72);
  if (v5)
  {
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v11 = [*(id *)(a1 + 48) reasonType];
      int v18 = 67109378;
      int v19 = v11;
      __int16 v20 = 2114;
      id v21 = v5;
      uint64_t v12 = "reasonType=%d error=%{public}@";
      uint64_t v13 = v9;
      os_signpost_id_t v14 = v10;
      uint32_t v15 = 18;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_END, v14, "rqf:loadPlaybackContext:getTracks", v12, (uint8_t *)&v18, v15);
    }
  }
  else if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v16 = [*(id *)(a1 + 48) reasonType];
    int v18 = 67109120;
    int v19 = v16;
    uint64_t v12 = "reasonType=%d";
    uint64_t v13 = v9;
    os_signpost_id_t v14 = v10;
    uint32_t v15 = 8;
    goto LABEL_10;
  }

  (*(void (**)(void, void, id, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v7, v5);
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue identityPropertySet];
  id v6 = [v5 delegatedIdentityProperties];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 DSID];
  }
  else
  {
    id v9 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue identityPropertySet];
    os_signpost_id_t v10 = [v9 identityProperties];
    id v8 = [v10 DSID];
  }
  if (v8)
  {
    uint64_t quot = [v8 longLongValue];
    uint64_t v12 = quot;
    uint64_t v13 = (char *)&v19 + 1;
    do
    {
      lldiv_t v14 = lldiv(quot, 10);
      uint64_t quot = v14.quot;
      if (v14.rem >= 0) {
        LOBYTE(v15) = v14.rem;
      }
      else {
        uint64_t v15 = -v14.rem;
      }
      *(v13 - 2) = v15 + 48;
      int v16 = (const UInt8 *)(v13 - 2);
      --v13;
    }
    while (v14.quot);
    if (v12 < 0)
    {
      *(v13 - 2) = 45;
      int v16 = (const UInt8 *)(v13 - 2);
    }
    id v17 = (__CFString *)CFStringCreateWithBytes(0, v16, (char *)&v19 - (char *)v16, 0x8000100u, 0);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 1;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  return 1;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  lldiv_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__31606;
  id v17 = __Block_byref_object_dispose__31607;
  id v18 = 0;
  uint64_t v4 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue radioStation];
  id v5 = (void *)MEMORY[0x263F11F78];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __67__MPCModelRadioQueueFeeder_containsTransportableContentWithReason___block_invoke;
  void v9[3] = &unk_2643C5E20;
  id v6 = v4;
  id v10 = v6;
  int v11 = &v13;
  uint64_t v12 = &v19;
  [v5 performWithoutEnforcement:v9];
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v7 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

void __67__MPCModelRadioQueueFeeder_containsTransportableContentWithReason___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) subtype] == 1)
  {
    uint64_t v2 = [NSString stringWithFormat:@"RadioStation subtype is Episode: %@", *(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)containsRadioContent
{
  return 1;
}

- (BOOL)containsLiveStream
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue tracks];
  uint64_t v3 = [v2 allItems];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) trackType] == 4)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  id v35[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromMPPlaybackContextSupplementalReason();
  if ([(MPCModelRadioQueueFeeder *)self containsLiveStream])
  {
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      NSUInteger v31 = self;
      __int16 v32 = 2114;
      uint64_t v33 = v4;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning NullPlaybackContext [station contains live stream]", buf, 0x16u);
    }

    id v6 = objc_alloc_init(_MPCNullPlaybackContext);
  }
  else
  {
    int64_t v7 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue numberOfItems];
    if (v7)
    {
      uint64_t v8 = v7;
      long long v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
      if (v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          long long v11 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue trackForItemAtIndex:i];
          if ([v11 storeAdamID])
          {
            uint64_t quot = [v11 storeAdamID];
            uint64_t v13 = quot;
            lldiv_t v14 = (char *)v35 + 1;
            do
            {
              lldiv_t v15 = lldiv(quot, 10);
              uint64_t quot = v15.quot;
              if (v15.rem >= 0) {
                LOBYTE(v16) = v15.rem;
              }
              else {
                uint64_t v16 = -v15.rem;
              }
              *(v14 - 2) = v16 + 48;
              id v17 = (const UInt8 *)(v14 - 2);
              --v14;
            }
            while (v15.quot);
            if (v13 < 0)
            {
              *(v14 - 2) = 45;
              id v17 = (const UInt8 *)(v14 - 2);
            }
            id v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)v35 - (char *)v17, 0x8000100u, 0);
            [v9 addObject:v18];
          }
        }
      }
      if ([v9 count])
      {
        uint64_t v19 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
        [(MPCModelStorePlaybackItemsRequest *)v19 setStoreIDs:v9];
        [(MPCModelStorePlaybackItemsRequest *)v19 setClientIdentifier:@"com.apple.Music"];
        id v6 = objc_alloc_init(MPCModelPlaybackContext);
        [(_MPCNullPlaybackContext *)v6 setRequest:v19];
        [(_MPCNullPlaybackContext *)v6 setPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
        id v20 = objc_alloc(MEMORY[0x263F11EE0]);
        uint64_t v21 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __66__MPCModelRadioQueueFeeder_supplementalPlaybackContextWithReason___block_invoke;
        v29[3] = &unk_2643C5DF8;
        v29[4] = self;
        char v22 = (void *)[v20 initWithIdentifiers:v21 block:v29];
        [(_MPCNullPlaybackContext *)v6 setFallbackSectionRepresentation:v22];

        os_signpost_id_t v23 = [(MPCModelRadioQueueFeeder *)self playActivityQueueGroupingID];
        [(_MPCNullPlaybackContext *)v6 setPlayActivityQueueGroupingID:v23];

        uint64_t v24 = [(MPCModelRadioQueueFeeder *)self playActivityFeatureName];
        [(_MPCNullPlaybackContext *)v6 setPlayActivityFeatureName:v24];

        __int16 v25 = [(MPCModelRadioQueueFeeder *)self playActivityRecommendationData];
        [(_MPCNullPlaybackContext *)v6 setPlayActivityRecommendationData:v25];

        uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          NSUInteger v31 = self;
          __int16 v32 = 2114;
          uint64_t v33 = v4;
          __int16 v34 = 2114;
          v35[0] = v6;
          _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | context=%{public}@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v19 = (MPCModelStorePlaybackItemsRequest *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          NSUInteger v31 = self;
          __int16 v32 = 2114;
          uint64_t v33 = v4;
          __int16 v34 = 2048;
          v35[0] = v8;
          _os_log_impl(&dword_21BB87000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning nil context [no valid station tracks] count=%ld", buf, 0x20u);
        }
        id v6 = 0;
      }
    }
    else
    {
      __int16 v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        NSUInteger v31 = self;
        __int16 v32 = 2114;
        uint64_t v33 = v4;
        _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[RQF:%p] supplementalPlaybackContextWithReason:%{public}@ | returning nil [no items]", buf, 0x16u);
      }

      id v6 = 0;
    }
  }

  return v6;
}

void __66__MPCModelRadioQueueFeeder_supplementalPlaybackContextWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v3 = a2;
  id v4 = [v2 radioStation];
  [v3 setRadioStation:v4];
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return 2;
}

- (BOOL)canSkipItem:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  if (![(MPCModelRadioQueueFeeder *)self containsLiveStream])
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __47__MPCModelRadioQueueFeeder_canSkipItem_reason___block_invoke;
    uint64_t v19 = &unk_2643C5DC8;
    id v8 = v6;
    id v20 = v8;
    uint64_t v9 = [(MPCModelRadioQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:&v16];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        [NSString stringWithFormat:@"cannot find item: %@", v8, v16, v17, v18, v19];
        BOOL v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v7 = 0;
      }
      goto LABEL_20;
    }
    uint64_t v10 = v9;
    long long v11 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue radioStation];
    uint64_t v12 = [(MPCModelRadioPlaybackQueue *)self->_playbackQueue trackForItemAtIndex:v10];
    uint64_t v13 = v12;
    if (!v12) {
      goto LABEL_11;
    }
    if ([v12 isSkippable])
    {
      if ([v13 trackType] != 4 || objc_msgSend(v11, "subtype") == 1)
      {
LABEL_11:
        BOOL v7 = 1;
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      if (a4)
      {
        lldiv_t v14 = @"station is a stream";
        goto LABEL_17;
      }
    }
    else if (a4)
    {
      lldiv_t v14 = @"station track not skippable";
LABEL_17:
      BOOL v7 = 0;
      *a4 = v14;
      goto LABEL_19;
    }
    BOOL v7 = 0;
    goto LABEL_19;
  }
  BOOL v7 = 0;
  if (a4) {
    *a4 = @"live item";
  }
LABEL_21:

  return v7;
}

uint64_t __47__MPCModelRadioQueueFeeder_canSkipItem_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

- (void)itemDidBeginPlayback:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = (MPAVItem *)a3;
  if (self->_currentItem != v5)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218242;
      uint64_t v9 = self;
      __int16 v10 = 2114;
      long long v11 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[RQF:%p] itemDidBeginPlayback: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentItem, a3);
  }
  if (v5)
  {
    BOOL v7 = [(MPAVItem *)v5 queueIdentifier];
    objc_storeStrong((id *)&self->_lastPlayedIdentifier, v7);
    if (([(MPAVItem *)v5 isExplicitTrack] & 1) == 0) {
      objc_storeStrong((id *)&self->_lastCleanPlayedIdentifier, v7);
    }
  }
}

- (int64_t)itemCount
{
  return [(MPCModelRadioPlaybackQueue *)self->_playbackQueue numberOfItems];
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  id v9[2] = __94__MPCModelRadioQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke;
  void v9[3] = &unk_2643C5DA0;
  void v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(MPCModelRadioQueueFeeder *)self loadPlaybackContext:a3 completion:v9];
}

void __94__MPCModelRadioQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void (**)(uint64_t, void))(v5 + 16);
    id v14 = a3;
    v6(v5, 0);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = a3;
    uint64_t v9 = [v7 firstModelPlayEvent];
    id v10 = [v9 radioStation];

    if (v10)
    {
      long long v11 = (void *)MEMORY[0x263F11EE0];
      uint64_t v12 = [v9 radioStation];
      id v10 = [v11 genericObjectWithModelObject:v12];

      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Could not convert station into metadata: %@", v9);
    }
    id v14 = (id)v13;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F89110] sharedMonitor];
  [v3 unregisterObserver:self];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F11C40] object:0];
  if (self->_lastResponse) {
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x263F11B18]);
  }
  if (self->_observedIdentityStore) {
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x263F89088]);
  }
  if (self->_backgroundTaskIdentifier != *MEMORY[0x263F54E88])
  {
    uint64_t v5 = MPSharedBackgroundTaskProvider();
    [v5 endTask:self->_backgroundTaskIdentifier];
  }
  v6.receiver = self;
  v6.super_class = (Class)MPCModelRadioQueueFeeder;
  [(MPCModelRadioQueueFeeder *)&v6 dealloc];
}

- (MPCModelRadioQueueFeeder)init
{
  v12.receiver = self;
  v12.super_class = (Class)MPCModelRadioQueueFeeder;
  uint64_t v2 = [(MPCModelRadioQueueFeeder *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPCPlaybackRequestEnvironment);
    playbackRequestEnvironment = v2->_playbackRequestEnvironment;
    v2->_playbackRequestEnvironment = v3;

    uint64_t v5 = [(MPCPlaybackRequestEnvironment *)v2->_playbackRequestEnvironment _createStoreRequestContext];
    storeRequestContext = v2->_storeRequestContext;
    v2->_storeRequestContext = (ICStoreRequestContext *)v5;

    id v7 = [MEMORY[0x263F89108] currentDeviceInfo];
    int v8 = [v7 hasCellularDataCapability];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:v2 selector:sel__allowCellularStreamingDidChangeNotification_ name:*MEMORY[0x263F11C40] object:0];

      id v10 = [MEMORY[0x263F89110] sharedMonitor];
      [v10 registerObserver:v2];

      [(MPCModelRadioQueueFeeder *)v2 _updateAdditionalLoadingSupport];
    }
    else
    {
      v2->_supportsLoadingAdditionalItems = 1;
    }
  }
  return v2;
}

+ (void)__CRASH_FOR_UNEXPECTED_TRACK_DELETE__
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"MPCModelRadioQueueFeeder.m", 812, @"Unexpected change details (2 inserted, 1 deleted) for Radio tracklist" object file lineNumber description];
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken[0] != -1) {
    dispatch_once(sharedQueue_onceToken, &__block_literal_global_31651);
  }
  uint64_t v2 = (void *)sharedQueue___operationQueue;

  return v2;
}

uint64_t __39__MPCModelRadioQueueFeeder_sharedQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  uint64_t v1 = (void *)sharedQueue___operationQueue;
  sharedQueue___operationQueue = (uint64_t)v0;

  [(id)sharedQueue___operationQueue setName:@"com.apple.MediaPlaybackCore.MPCModelRadioQueueFeeder.loadingOperationQueue"];
  [(id)sharedQueue___operationQueue setMaxConcurrentOperationCount:6];
  uint64_t v2 = (void *)sharedQueue___operationQueue;

  return [v2 setQualityOfService:25];
}

@end