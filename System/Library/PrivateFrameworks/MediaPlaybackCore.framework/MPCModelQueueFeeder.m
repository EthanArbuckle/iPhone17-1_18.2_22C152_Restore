@interface MPCModelQueueFeeder
- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4;
- (BOOL)containsLiveStream;
- (BOOL)containsTransportableContentWithReason:(id *)a3;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4;
- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4;
- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4;
- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4;
- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4;
- (MPCModelPlaybackResponse)response;
- (MPCModelQueueFeeder)init;
- (MPModelGenericObject)fallbackSectionRepresentation;
- (NSString)rtcReportingPlayQueueSourceIdentifier;
- (id)_equivalencySourceAdamIDForIdentifierSet:(id)a3;
- (id)_sectionedModelObjectsRepresentationForSectionedCollection:(id)a3;
- (id)_staticRegistryRequest;
- (id)_supplementalLibraryRequestWithError:(id *)a3;
- (id)accountIDForItem:(id)a3 inSection:(id)a4;
- (id)firstItemIntersectingIdentifierSet:(id)a3;
- (id)firstModelPlayEvent;
- (id)identifiersForItem:(id)a3 inSection:(id)a4;
- (id)itemForItem:(id)a3 inSection:(id)a4;
- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4;
- (id)playbackInfoForItem:(id)a3;
- (id)supplementalPlaybackContextWithReason:(int64_t)a3;
- (id)uniqueIdentifier;
- (id)updatedPlaybackContext;
- (int64_t)supplementalPlaybackContextBehavior;
- (void)_beginBackgroundTaskAssertion;
- (void)_endBackgroundTaskAssertion;
- (void)applyVolumeNormalizationForItem:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5;
- (void)loadPlaybackContext:(id)a3 completion:(id)a4;
- (void)reloadSection:(id)a3 completion:(id)a4;
- (void)setFallbackSectionRepresentation:(id)a3;
@end

@implementation MPCModelQueueFeeder

uint64_t __55__MPCModelQueueFeeder_modelPlayEventForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

uint64_t __62__MPCModelQueueFeeder_isExportableMediaTypeForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

uint64_t __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendItem:");
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_4()
{
  return 0;
}

- (BOOL)shouldUsePlaceholderForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__MPCModelQueueFeeder_shouldUsePlaceholderForItem_inSection___block_invoke;
  v10[3] = &unk_2643C5E70;
  id v11 = v5;
  id v6 = v5;
  v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v10];
  char v8 = [v7 isPlaceholder];

  return v8;
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_144(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count];
  if (*(void *)(a1 + 40) >= *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "itemAtIndex:");
  }

  return v4;
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v6 = [*(id *)(a1 + 40) itemAtIndex:a3];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

- (void)_beginBackgroundTaskAssertion
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t backgroundTasks = self->_backgroundTasks;
  self->_unint64_t backgroundTasks = backgroundTasks + 1;
  uint64_t v4 = *MEMORY[0x263F54E88];
  if (!backgroundTasks || self->_backgroundTaskIdentifier == v4)
  {
    id v5 = [(MPCModelQueueFeeder *)self description];
    id v6 = MPSharedBackgroundTaskProvider();
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __52__MPCModelQueueFeeder__beginBackgroundTaskAssertion__block_invoke;
    v20 = &unk_2643C5EE8;
    v21 = self;
    id v7 = v5;
    id v22 = v7;
    self->_unint64_t backgroundTaskIdentifier = [v6 beginTaskWithName:v7 expirationHandler:&v17];

    unint64_t backgroundTaskIdentifier = self->_backgroundTaskIdentifier;
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v10 = v9;
    if (backgroundTaskIdentifier == v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543874;
        v24 = v11;
        __int16 v25 = 2048;
        v26 = self;
        __int16 v27 = 2114;
        id v28 = v7;
        v12 = "[MQF:%{public}@:%p] _beginBackgroundTaskAssertion | task failed to start [] task.name=%{public}@";
        v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 32;
LABEL_8:
        _os_log_impl(&dword_21BB87000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
      unint64_t v16 = self->_backgroundTaskIdentifier;
      *(_DWORD *)buf = 138544130;
      v24 = v11;
      __int16 v25 = 2048;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2048;
      unint64_t v30 = v16;
      v12 = "[MQF:%{public}@:%p] _beginBackgroundTaskAssertion | task started [] task.name=%{public}@ task.id=%lu";
      v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 42;
      goto LABEL_8;
    }
  }
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 128) setShouldBatchResultsWithPlaceholderObjects:0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 232));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(*(void *)(a1 + 32) + 120) response];
  uint64_t v3 = [v2 modelResponse];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) conformsToProtocol:&unk_26CC37778] & 1) == 0)
  {
    os_log_type_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MPCModelQueueFeeder.m", 395, @"Response class (%@) must conform to MPCModelPlaybackResponse", objc_opt_class() object file lineNumber description];
  }
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    __int16 v24 = 2048;
    uint64_t v25 = v9;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | processing new response [] newResponse=%p", buf, 0x20u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v11 = *(void *)(v10 + 176) == 0;
  BOOL v12 = *(void *)(v10 + 176) != 0;
  v13 = *(NSObject **)(v10 + 80);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_86;
  block[3] = &unk_2643C1838;
  long long v16 = *(_OWORD *)(a1 + 48);
  block[4] = v10;
  BOOL v18 = v11;
  BOOL v19 = v12;
  uint64_t v17 = *(void *)(a1 + 64);
  dispatch_async(v13, block);
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_119(uint64_t a1)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  v1 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
LABEL_4:
    uint64_t v3 = *(void **)(a1 + 32);
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_120;
    v93[3] = &unk_2643C17C0;
    uint64_t v96 = *(void *)(a1 + 72);
    v93[4] = v3;
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 80);
    id v75 = v4;
    id v94 = v4;
    uint64_t v97 = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 88);
    id v95 = v6;
    uint64_t v98 = v7;
    [v3 identifierRegistryWithExclusiveAccess:v93];

    goto LABEL_5;
  }
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v2) {
    goto LABEL_4;
  }
  id v75 = 0;
LABEL_5:
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v10 = *(void *)(a1 + 32);
    BOOL v11 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    BOOL v12 = [(__CFString *)v11 results];
    uint64_t v13 = [v12 totalItemCount];
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    v101 = v11;
    __int16 v102 = 2048;
    uint64_t v103 = v13;
    __int16 v104 = 2114;
    id v105 = v75;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | applying new response [] newResponse=%p totalItemCount=%ld changeDetails=%{public}@", buf, 0x34u);
  }
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__13973;
  v91 = __Block_byref_object_dispose__13974;
  id v92 = 0;
  uint64_t v14 = *(void *)(a1 + 32);
  uint32_t v15 = *(NSObject **)(v14 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_132;
  block[3] = &unk_2643C67A0;
  block[4] = v14;
  void block[5] = &v87;
  dispatch_sync(v15, block);
  v78 = [*(id *)(*(void *)(a1 + 32) + 232) results];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = (id)v88[5];
  uint64_t v16 = [obj countByEnumeratingWithState:&v82 objects:v99 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v83 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v20 = *(void **)(a1 + 32);
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_133;
        v81[3] = &unk_2643C5DC8;
        v81[4] = v19;
        v21 = objc_msgSend(v78, "indexPathForGlobalIndex:", objc_msgSend(v20, "identifierRegistryWithExclusiveAccessReturningInteger:", v81));
        if (v21)
        {
          __int16 v22 = [v78 itemAtIndexPath:v21];
          uint64_t v23 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v22];
          if (v23) {
            [v19 setGenericObject:v23];
          }
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v82 objects:v99 count:16];
    }
    while (v16);
  }

  uint64_t v24 = a1;
  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v25)
  {
    uint64_t v26 = *(void *)(a1 + 32);
    __int16 v27 = *(void **)(v26 + 176);
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3_134;
    v80[3] = &unk_2643C5FA0;
    v80[4] = v26;
    [v27 applyChanges:v25 itemLookupBlock:v80];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isFinalResponse])
  {
    id v28 = [*(id *)(*(void *)(a1 + 32) + 192) request];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v24 = a1;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_29;
    }
    unint64_t v30 = [*(id *)(*(void *)(a1 + 32) + 192) request];
    uint64_t v31 = [v30 sectionedModelObjects];
    BOOL v32 = v31 == 0;

    if (v32)
    {
      v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v35 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | updating Section [promoting storeRequest.storeIDs to sectionedModelObjects]", buf, 0x16u);
      }
      v36 = *(void **)(a1 + 32);
      v37 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) results];
      v38 = [v36 _sectionedModelObjectsRepresentationForSectionedCollection:v37];
      [v30 setSectionedModelObjects:v38];

      [v30 setStoreIDs:0];
      [*(id *)(*(void *)(a1 + 32) + 176) updateSection];
    }
  }
  else
  {
    objc_opt_class();
    int v39 = objc_opt_isKindOfClass();
    if ((_os_feature_enabled_impl() & v39) != 1) {
      goto LABEL_29;
    }
    v40 = [*(id *)(*(void *)(a1 + 32) + 120) request];
    unint64_t v30 = [v40 modelRequest];

    [v30 setPreviousResponse:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _invalidate];
  }

  uint64_t v24 = a1;
LABEL_29:
  uint64_t v41 = *(void *)(v24 + 32);
  if (*(void *)(v41 + 112))
  {
    if (!*(void *)(v41 + 160))
    {
      v46 = 0;
      v43 = 0;
      goto LABEL_40;
    }
    v42 = [*(id *)(*(void *)(*(void *)(v24 + 48) + 8) + 40) results];
    v43 = [v42 indexPathForItemWithIdentifiersIntersectingSet:*(void *)(*(void *)(v24 + 32) + 160)];

    if (v43)
    {
      v44 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) results];
      v45 = [v44 identifiersForItemAtIndexPath:v43];

      if ([v45 isPlaceholder])
      {
      }
      else
      {
        v47 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) results];
        uint64_t v48 = [v47 globalIndexForIndexPath:v43];

        if (v48 != 0x7FFFFFFFFFFFFFFFLL)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          v101 = 0;
          uint64_t v24 = a1;
          v68 = *(void **)(a1 + 32);
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_144;
          v79[3] = &unk_2643C17E8;
          v79[4] = buf;
          v79[5] = v48;
          v43 = [v68 identifierRegistryWithExclusiveAccessReturningObject:v79];
          if (v43)
          {
            v46 = 0;
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"startIndex out of bounds (startIndex/registry.count = %ld/%ld)", v48, *(void *)(*(void *)&buf[8] + 24));
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          _Block_object_dispose(buf, 8);
LABEL_40:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v49 = *(id *)(*(void *)(*(void *)(v24 + 48) + 8) + 40);
            v50 = [v49 performanceMetrics];

            uint64_t v24 = a1;
          }
          else
          {
            v50 = 0;
          }
          v51 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
          os_signpost_id_t v52 = os_signpost_id_make_with_pointer(v51, *(const void **)(v24 + 32));

          if (v43
            || [*(id *)(a1 + 40) totalItemCount] >= 1 && !*(void *)(*(void *)(a1 + 32) + 160))
          {
            v53 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
            v54 = v53;
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v54, OS_SIGNPOST_INTERVAL_END, v52, "ModelShimRequest", " enableTelemetry=YES ", buf, 2u);
            }

            v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v56 = [*(id *)(a1 + 32) uniqueIdentifier];
              uint64_t v57 = *(void *)(a1 + 32);
              v58 = *(__CFString **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              int v59 = [(__CFString *)v58 isFinalResponse];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v56;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v57;
              *(_WORD *)&buf[22] = 2048;
              v101 = v58;
              __int16 v102 = 1024;
              LODWORD(v103) = v59;
              _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | calling loadingCompletionHandler [start item satisfied] newResponse=%p isFinalResponse=%{BOOL}u", buf, 0x26u);
            }
            (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16))();
            uint64_t v60 = *(void *)(a1 + 32);
            v61 = *(void **)(v60 + 112);
            *(void *)(v60 + 112) = 0;

            v62 = *(void **)(*(void *)(a1 + 32) + 160);
            *(void *)(*(void *)(a1 + 32) + 160) = 0;
          }
          else
          {
            if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isFinalResponse]) {
              goto LABEL_51;
            }
            v63 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
            v64 = v63;
            if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_21BB87000, v64, OS_SIGNPOST_INTERVAL_END, v52, "ModelShimRequest", "NoValidItems", buf, 2u);
            }

            uint64_t v65 = [*(id *)(a1 + 40) totalItemCount];
            uint64_t v66 = *(void *)(a1 + 32);
            if (v65)
            {
              v62 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 55, @"Failed to resolve startItemIdentifiers [%@]: %@ for %@", v46, *(void *)(v66 + 160), *(void *)(v66 + 128));
              v67 = @"failed to resolve startItem";
            }
            else
            {
              v62 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 61, @"No valid items found [empty model response] for %@", *(void *)(v66 + 128));
              v67 = @"empty model response";
            }
            v69 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v70 = [*(id *)(a1 + 32) uniqueIdentifier];
              uint64_t v71 = *(void *)(a1 + 32);
              uint64_t v72 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              *(_DWORD *)buf = 138544386;
              *(void *)&uint8_t buf[4] = v70;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v71;
              *(_WORD *)&buf[22] = 2114;
              v101 = v67;
              __int16 v102 = 2048;
              uint64_t v103 = v72;
              __int16 v104 = 2114;
              id v105 = v62;
              _os_log_impl(&dword_21BB87000, v69, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] controller:defersResponseReplacement: | calling loadingCompletionHandler with error [%{public}@] newResponse=%p isFinalResponse=YES error=%{public}@", buf, 0x34u);
            }
            (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16))();
            uint64_t v73 = *(void *)(a1 + 32);
            v74 = *(void **)(v73 + 112);
            *(void *)(v73 + 112) = 0;
          }
LABEL_51:

          uint64_t v41 = *(void *)(a1 + 32);
          goto LABEL_52;
        }
      }
      v46 = 0;
      v43 = 0;
    }
    else
    {
      v46 = @"indexPathForItemWithIdentifiersIntersectingSet returned nil";
    }
    uint64_t v24 = a1;
    goto LABEL_40;
  }
LABEL_52:
  [*(id *)(v41 + 88) unlock];

  _Block_object_dispose(&v87, 8);
}

- (id)uniqueIdentifier
{
  return (id)[(MPMutableIdentifierListSection *)self->_section sectionIdentifier];
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) identifierSetAtIndex:a2];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 indexPathForGlobalIndex:a3];
  uint64_t v8 = [v6 itemAtIndexPath:v7];

  LODWORD(v6) = [v5 shouldExcludeFromShuffle];
  if (v6 == [v8 shouldExcludeFromShuffle])
  {
    int v10 = [v5 isPlaceholder];
    uint64_t v9 = v10 ^ [v8 isPlaceholder];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) identifierSetAtIndex:a2];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 indexPathForGlobalIndex:a3];
  uint64_t v8 = [v6 itemAtIndexPath:v7];

  uint64_t v9 = [v5 intersectsSet:v8];
  return v9;
}

id __61__MPCModelQueueFeeder_shouldUsePlaceholderForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 indexForItem:*(void *)(a1 + 32)];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v3 identifierSetAtIndex:v4];
  }

  return v5;
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke;
  v47[3] = &unk_2643C5DC8;
  id v9 = v7;
  id v48 = v9;
  uint64_t v10 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v47];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      v50 = v12;
      __int16 v51 = 2048;
      os_signpost_id_t v52 = self;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v9;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] itemForItem:inSection: | returning nil [no index for item in registry] item=%{public}@", buf, 0x20u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = v10;
    BOOL v11 = [(MPCModelPlaybackResponse *)self->_response results];
    uint32_t v15 = [v11 indexPathForGlobalIndex:v14];
    uint64_t v16 = v15;
    if (v15)
    {
      if ([v15 length] != 2)
      {
        v42 = [MEMORY[0x263F08690] currentHandler];
        [v42 handleFailureInMethod:a2, self, @"MPCModelQueueFeeder.m", 982, @"IndexPath was not an item index path with globalIndex from registry: %ld indexPath=%@", v14, v16 object file lineNumber description];
      }
      v44 = [v11 itemAtIndexPath:v16];
      uint64_t v17 = objc_msgSend(MEMORY[0x263F11EE0], "genericObjectWithModelObject:");
      if ([v17 type] == 10)
      {
        BOOL v18 = [MPCModelMediaClipAVItem alloc];
        BOOL v19 = [v17 mediaClip];
        uint64_t v13 = [(MPCModelMediaClipAVItem *)v18 initWithMediaClip:v19];
        v20 = v44;
      }
      else
      {
        id v43 = v8;
        uint64_t v23 = [MPCModelGenericAVItem alloc];
        uint64_t v24 = [(MPCModelPlaybackResponse *)self->_response request];
        uint64_t v25 = [v24 itemProperties];
        uint64_t v26 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:](v23, "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:");

        __int16 v27 = [NSNumber numberWithBool:self->_isSiriInitiated];
        [(MPCModelGenericAVItem *)v26 setSiriInitiated:v27];

        id v28 = [(MPCModelPlaybackContext *)self->_playbackContext queueDescriptor];
        -[MPCModelGenericAVItem setPrioritizeStartupOverQuality:](v26, "setPrioritizeStartupOverQuality:", [v28 prioritizeStartupOverQuality]);

        __int16 v29 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
        unint64_t v30 = +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:v29];
        [(MPCModelGenericAVItem *)v26 setAssetCacheProvider:v30];

        if (objc_opt_respondsToSelector())
        {
          uint64_t v31 = [(MPCModelPlaybackRequest *)self->_request mediaLibrary];
          [(MPCModelGenericAVItem *)v26 setMediaLibrary:v31];
        }
        v20 = v44;
        if ([(MPCModelPlaybackResponse *)self->_response conformsToProtocol:&unk_26CC37718])
        {
          BOOL v32 = [v44 identifiers];
          v33 = [(MPCModelQueueFeeder *)self _equivalencySourceAdamIDForIdentifierSet:v32];
          v34 = v33;
          if (v33) {
            -[MPCModelGenericAVItem setEquivalencySourceAdamID:](v26, "setEquivalencySourceAdamID:", [v33 longLongValue]);
          }
        }
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke_257;
        block[3] = &unk_2643C5EE8;
        block[4] = self;
        v36 = v26;
        v46 = v36;
        dispatch_barrier_sync(accessQueue, block);
        v37 = v46;
        BOOL v19 = v36;

        uint64_t v13 = v19;
        id v8 = v43;
      }

      if (v13)
      {
        [(MPCModelMediaClipAVItem *)v13 setFeeder:self];
        [(MPCModelMediaClipAVItem *)v13 setQueueIdentifier:v9];
        v38 = [(MPCModelQueueFeeder *)self modelPlayEventForItem:v9 inSection:v8];
        [(MPCModelMediaClipAVItem *)v13 setModelPlayEvent:v38];

        int v39 = [(MPCModelQueueFeeder *)self playbackInfoForItem:v13];
        [(MPCModelMediaClipAVItem *)v13 setPlaybackInfo:v39];

        v40 = [(MPCModelPlaybackContext *)self->_playbackContext associatedParticipantIdentifier];
        [(MPCModelMediaClipAVItem *)v13 setAssociatedParticipantIdentifier:v40];
      }
    }
    else
    {
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        uint64_t v22 = [v11 totalItemCount];
        *(_DWORD *)buf = 138544642;
        v50 = v21;
        __int16 v51 = 2048;
        os_signpost_id_t v52 = self;
        __int16 v53 = 2048;
        uint64_t v54 = v14;
        __int16 v55 = 2114;
        id v56 = v9;
        __int16 v57 = 2048;
        v58 = v11;
        __int16 v59 = 2048;
        uint64_t v60 = v22;
        _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] itemForItem:inSection: | returning nil [indexPathForGlobalIndex:%ld returned nil] item=%{public}@ results=%p results.totalItemCount=%ld", buf, 0x3Eu);
      }
      uint64_t v13 = 0;
    }
  }

  return v13;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__MPCModelQueueFeeder_isExportableMediaTypeForItem_inSection___block_invoke;
  v19[3] = &unk_2643C5DC8;
  id v6 = v5;
  id v20 = v6;
  uint64_t v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v19];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v7;
    uint64_t v10 = [(MPCModelPlaybackResponse *)self->_response results];
    BOOL v11 = [v10 indexPathForGlobalIndex:v9];

    BOOL v12 = [(MPCModelPlaybackResponse *)self->_response results];
    uint64_t v13 = [v12 itemAtIndexPath:v11];

    id v14 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
LABEL_19:

      BOOL v8 = v15 != 0;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v14;
      if ([v16 type] == 1)
      {
        id v15 = [v16 song];

        id v17 = 0;
LABEL_18:

        goto LABEL_19;
      }
      if ([v16 type] == 5)
      {
        id v17 = [v16 playlistEntry];
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v17 = v14;
      }
      else {
        id v17 = 0;
      }
    }
    if ([v17 type] == 1)
    {
      id v15 = [v17 song];
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_18;
  }
  BOOL v8 = 0;
LABEL_20:

  return v8;
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__MPCModelQueueFeeder_modelPlayEventForItem_inSection___block_invoke;
  v17[3] = &unk_2643C5DC8;
  id v6 = v5;
  id v18 = v6;
  uint64_t v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v17];
  BOOL v8 = [(MPCModelPlaybackResponse *)self->_response results];
  uint64_t v9 = [v8 indexPathForGlobalIndex:v7];

  if (v9)
  {
    uint64_t v10 = [(MPCModelPlaybackResponse *)self->_response results];
    BOOL v11 = objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v9, "section"));
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v11 anyObject];

    BOOL v11 = (void *)v12;
  }
  if (!v11)
  {
    BOOL v11 = [(MPModelGenericObject *)self->_fallbackSectionRepresentation anyObject];
  }
  uint64_t v13 = (void *)MEMORY[0x263F11F88];
  id v14 = [(MPCModelQueueFeeder *)self playActivityFeatureName];
  id v15 = [v13 playEventWithModelObject:v11 featureName:v14];

  return v15;
}

- (id)playbackInfoForItem:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [v4 modelGenericObject];
  uint64_t v7 = [v6 identifiers];

  BOOL v8 = [(MPCModelQueueFeeder *)self _equivalencySourceAdamIDForIdentifierSet:v7];
  uint64_t v9 = [v8 longLongValue];

  uint64_t v48 = 0;
  id v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  __int16 v51 = __Block_byref_object_copy__13973;
  os_signpost_id_t v52 = __Block_byref_object_dispose__13974;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__13973;
  v46 = __Block_byref_object_dispose__13974;
  id v47 = 0;
  startTimeModifications = self->_startTimeModifications;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke;
  v37[3] = &unk_2643C16A8;
  id v11 = v7;
  id v38 = v11;
  int v39 = &v48;
  v40 = &v42;
  uint64_t v41 = v9;
  [(NSDictionary *)startTimeModifications enumerateKeysAndObjectsUsingBlock:v37];
  if (v49[5])
  {
    uint64_t v12 = (void *)v43[5];
    if (!v12 || (objc_storeStrong(v49 + 5, v12), v49[5]))
    {
      uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        id v15 = (uint64_t (*)(uint64_t, uint64_t))v49[5];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v63 = v15;
        LOWORD(v64) = 2114;
        *(void *)((char *)&v64 + 2) = v4;
        _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] playbackInfoForItem | setting override start time [] startTime=%{public}@ item=%{public}@", buf, 0x2Au);
      }
      [v5 setObject:v49[5] forKey:*MEMORY[0x263F11130]];
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v63 = __Block_byref_object_copy__13973;
  *(void *)&long long v64 = __Block_byref_object_dispose__13974;
  *((void *)&v64 + 1) = 0;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13973;
  uint64_t v35 = __Block_byref_object_dispose__13974;
  id v36 = 0;
  endTimeModifications = self->_endTimeModifications;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke_9;
  uint64_t v26 = &unk_2643C16A8;
  id v17 = v11;
  id v27 = v17;
  id v28 = buf;
  __int16 v29 = &v31;
  uint64_t v30 = v9;
  [(NSDictionary *)endTimeModifications enumerateKeysAndObjectsUsingBlock:&v23];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    id v18 = (void *)v32[5];
    if (!v18 || (objc_storeStrong((id *)(*(void *)&buf[8] + 40), v18), *(void *)(*(void *)&buf[8] + 40)))
    {
      BOOL v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)uint64_t v54 = 138544130;
        __int16 v55 = v20;
        __int16 v56 = 2048;
        __int16 v57 = self;
        __int16 v58 = 2114;
        uint64_t v59 = v21;
        __int16 v60 = 2114;
        id v61 = v4;
        _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] playbackInfoForItem | setting override stop time [] stopTime=%{public}@ item=%{public}@", v54, 0x2Au);
      }
      [v5 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:*MEMORY[0x263F11118]];
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v5;
}

- (id)_equivalencySourceAdamIDForIdentifierSet:(id)a3
{
  id v4 = a3;
  if ([(MPCModelPlaybackResponse *)self->_response conformsToProtocol:&unk_26CC37718])
  {
    id v5 = [v4 universalStore];
    uint64_t v6 = [v5 adamID];

    uint64_t v7 = [(MPCModelPlaybackResponse *)self->_response equivalencySourceStoreAdamIDForLocalStoreAdamID:v6];
    if (!v7)
    {
      BOOL v8 = [v4 universalStore];
      uint64_t v9 = [v8 subscriptionAdamID];

      uint64_t v7 = [(MPCModelPlaybackResponse *)self->_response equivalencySourceStoreAdamIDForLocalStoreAdamID:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)rtcReportingPlayQueueSourceIdentifier
{
  return self->_rtcReportingPlayQueueSourceIdentifier;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_section, a3);
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    BOOL v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    id v23 = v7;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] reloadSection: | connecting to section [] section=%p", buf, 0x20u);
  }
  diffQueue = self->_diffQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke;
  block[3] = &unk_2643C5620;
  id v15 = v7;
  id v16 = self;
  id v17 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(diffQueue, block);
}

uint64_t __45__MPCModelQueueFeeder_itemForItem_inSection___block_invoke_257(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return a4 != 2;
}

- (BOOL)containsLiveStream
{
  return 0;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
  v142[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_playbackContext, a3);
  uint64_t v9 = [v7 fallbackSectionRepresentation];
  uint64_t v10 = (MPModelGenericObject *)[v9 copy];
  fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  self->_fallbackSectionRepresentation = v10;

  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    v133 = v13;
    __int16 v134 = 2048;
    v135 = self;
    __int16 v136 = 2114;
    id v137 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | [] playbackContext=%{public}@", buf, 0x20u);
  }
  id v14 = [v7 playActivityRecommendationData];
  [(MPCModelQueueFeeder *)self setPlayActivityRecommendationData:v14];

  id v15 = [v7 playActivityQueueGroupingID];
  [(MPCModelQueueFeeder *)self setPlayActivityQueueGroupingID:v15];

  id v16 = [v7 playActivityFeatureName];
  [(MPCModelQueueFeeder *)self setPlayActivityFeatureName:v16];

  id v17 = [v7 siriReferenceIdentifier];
  [(MPCModelQueueFeeder *)self setSiriReferenceIdentifier:v17];

  id v18 = [v7 siriWHAMetricsInfo];
  [(MPCModelQueueFeeder *)self setSiriWHAMetricsInfo:v18];

  BOOL v19 = [v7 startItemIdentifiers];
  startItemIdentifiers = self->_startItemIdentifiers;
  self->_startItemIdentifiers = v19;

  uint64_t v21 = [v7 startTimeModifications];
  startTimeModifications = self->_startTimeModifications;
  self->_startTimeModifications = v21;

  id v23 = [v7 endTimeModifications];
  endTimeModifications = self->_endTimeModifications;
  self->_endTimeModifications = v23;

  uint64_t v25 = [v7 siriReferenceIdentifier];
  self->_isSiriInitiated = v25 != 0;

  uint64_t v26 = [v7 siriAssetInfo];
  id v27 = (void *)[v26 copy];

  if ([v27 length])
  {
    id v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      v133 = v29;
      __int16 v134 = 2048;
      v135 = self;
      __int16 v136 = 2114;
      id v137 = v27;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | processing siriAssetInfo [] siriAssetInfo=%{public}@", buf, 0x20u);
    }
  }
  uint64_t v30 = [v7 request];
  uint64_t v31 = (MPCModelPlaybackRequest *)[v30 copy];
  request = self->_request;
  self->_request = v31;

  if (([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC36B50] & 1) == 0)
  {
    v115 = [MEMORY[0x263F08690] currentHandler];
    [v115 handleFailureInMethod:a2, self, @"MPCModelQueueFeeder.m", 770, @"Request class (%@) must conform to MPCModelPlaybackRequest", objc_opt_class() object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v33 = self->_request;
    v34 = [(MPCModelPlaybackRequest *)v33 sectionKind];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v36 = [(MPCModelPlaybackRequest *)v33 sectionKind];
      if (([v36 variants] & 8) != 0)
      {
        v114 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Invalid request section kind [playlist variant Folder] kind=%@ request=%@", v36, self->_request);
        (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v114);

        goto LABEL_72;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = self->_request;
    [(MPCModelPlaybackRequest *)v37 setUseUniversalAccumulator:1];
    if (_os_feature_enabled_impl()) {
      [(MPCModelPlaybackRequest *)v37 setAllowLocalEquivalencies:1];
    }
    if (self->_isSiriInitiated && ![v27 length])
    {
      id v120 = v8;
      v122 = v27;
      id v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v39 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        *(_DWORD *)buf = 138543618;
        v133 = v39;
        __int16 v134 = 2048;
        v135 = self;
        _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | generating ABC [missing siriAssetInfo for siri initiated storePlayback]", buf, 0x16u);
      }
      v40 = (void *)MEMORY[0x263F54EC8];
      uint64_t v41 = *MEMORY[0x263F54E80];
      v140[0] = @"siriReferenceIdentifier";
      uint64_t v42 = [v7 siriReferenceIdentifier];
      id v43 = (void *)v42;
      if (v42) {
        uint64_t v44 = (__CFString *)v42;
      }
      else {
        uint64_t v44 = @"<missing>";
      }
      v140[1] = @"storeItemsRequest.identifiers";
      v141[0] = v44;
      uint64_t v45 = [(MPCModelPlaybackRequest *)v37 identifiers];
      v46 = (void *)v45;
      id v47 = @"nil";
      if (v45) {
        id v47 = (__CFString *)v45;
      }
      v141[1] = v47;
      uint64_t v48 = [NSDictionary dictionaryWithObjects:v141 forKeys:v140 count:2];
      v142[0] = v48;
      id v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:1];
      [v40 snapshotWithDomain:v41 type:@"Bug" subType:@"MissingSiriAssetInfo" context:@"SetPlaybackQueue" triggerThresholdValues:&stru_26CBCA930 events:v49 completion:0];

      id v8 = v120;
      id v27 = v122;
    }
  }
  uint64_t v50 = [(MPCModelPlaybackRequest *)self->_request itemKind];
  __int16 v51 = (void *)[v50 modelClass];

  uint64_t v52 = objc_msgSend(v51, "mqf_requiredItemPlaybackProperties");
  if (v52)
  {
    uint64_t v33 = (MPCModelPlaybackRequest *)v52;
    v123 = v27;
    if (self->_representativeMetadataPropertySet)
    {
      uint64_t v53 = [v51 genericObjectType];
      if (v53)
      {
        uint64_t v54 = [MEMORY[0x263F11EE0] relationshipKeyForGenericObjectType:v53];
        if (v54)
        {
          __int16 v55 = [(MPPropertySet *)self->_representativeMetadataPropertySet relationships];
          __int16 v56 = [v55 objectForKeyedSubscript:v54];
          uint64_t v57 = [(MPCModelPlaybackRequest *)v33 propertySetByCombiningWithPropertySet:v56];

          uint64_t v33 = (MPCModelPlaybackRequest *)v57;
        }
      }
    }
    [(MPCModelPlaybackRequest *)self->_request setItemProperties:v33];
    __int16 v58 = [(MPCModelPlaybackRequest *)self->_request sectionKind];
    uint64_t v59 = (void *)[v58 modelClass];

    __int16 v60 = objc_msgSend(v59, "mqf_requiredSectionPlaybackProperties");
    if (self->_representativeMetadataPropertySet)
    {
      uint64_t v61 = [v59 genericObjectType];
      if (v61)
      {
        v62 = [MEMORY[0x263F11EE0] relationshipKeyForGenericObjectType:v61];
        if (v62)
        {
          v63 = [(MPPropertySet *)self->_representativeMetadataPropertySet relationships];
          long long v64 = [v63 objectForKeyedSubscript:v62];
          uint64_t v65 = [v60 propertySetByCombiningWithPropertySet:v64];

          __int16 v60 = (void *)v65;
        }
      }
    }
    [(MPCModelPlaybackRequest *)self->_request setSectionProperties:v60];
    if (objc_opt_respondsToSelector()) {
      [(MPCModelPlaybackRequest *)self->_request setDisableImplicitSectioning:1];
    }
    if (objc_opt_respondsToSelector()) {
      [(MPCModelPlaybackRequest *)self->_request setShouldBatchResultsWithPlaceholderObjects:1];
    }
    v118 = v60;
    if ([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC36BB0])
    {
      uint64_t v66 = self->_request;
      v67 = [(MPCModelPlaybackRequest *)v66 rtcReportingPlayQueueSourceIdentifier];
      rtcReportingPlayQueueSourceIdentifier = self->_rtcReportingPlayQueueSourceIdentifier;
      self->_rtcReportingPlayQueueSourceIdentifier = v67;
    }
    v69 = [v7 playbackRequestEnvironment];
    playbackRequestEnvironment = self->_playbackRequestEnvironment;
    self->_playbackRequestEnvironment = v69;

    id v121 = v8;
    if ([(MPCModelPlaybackRequest *)self->_request conformsToProtocol:&unk_26CC28748])
    {
      uint64_t v71 = self->_request;
      uint64_t v72 = [(MPCModelPlaybackRequest *)v71 playbackRequestEnvironment];
      uint64_t v73 = self->_playbackRequestEnvironment;

      if (v72 != v73)
      {
        v74 = [(MPCModelPlaybackRequest *)v71 playbackRequestEnvironment];
        id v75 = [v74 userIdentity];
        v76 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
        v77 = [MEMORY[0x263F893C8] defaultIdentityStore];
        char v78 = [v75 isEqualToIdentity:v76 inStore:v77];

        if ((v78 & 1) == 0)
        {
          v79 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
          {
            v80 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
            v81 = [(MPCModelPlaybackRequest *)v71 playbackRequestEnvironment];
            long long v82 = self->_playbackRequestEnvironment;
            *(_DWORD *)buf = 138544130;
            v133 = v80;
            __int16 v134 = 2048;
            v135 = self;
            __int16 v136 = 2114;
            id v137 = v81;
            __int16 v138 = 2114;
            v139 = v82;
            _os_log_impl(&dword_21BB87000, v79, OS_LOG_TYPE_FAULT, "[MQF:%{public}@:%p] loadPlaybackContext: | recovering user identity mismatch [self correcting] request.playbackRequestEnvironment=%{public}@ context.playbackRequestEnvironment=%{public}@", buf, 0x2Au);
          }
        }
        [(MPCModelPlaybackRequest *)v71 setPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
        id v8 = v121;
      }
    }
    if (MSVDeviceOSIsInternalInstall())
    {
      long long v83 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v84 = [v83 BOOLForKey:@"_static_qf_debug"];

      if (v84)
      {
        long long v85 = [(MPCModelQueueFeeder *)self _staticRegistryRequest];
        v86 = self->_request;
        self->_request = v85;
      }
    }
    uint64_t v87 = [(MPCModelPlaybackRequest *)self->_request label];
    v88 = (void *)v87;
    if (v87) {
      uint64_t v89 = (__CFString *)v87;
    }
    else {
      uint64_t v89 = @"<missing request label>";
    }
    v90 = [@"com.apple.MediaPlayer.MPCModelQueueFeeder: " stringByAppendingString:v89];
    [(MPCModelPlaybackRequest *)self->_request setLabel:v90];

    id v91 = objc_alloc_init(MEMORY[0x263F12008]);
    [(MPRequestResponseController *)self->_requestController setRequest:v91];

    id v92 = [(MPRequestResponseController *)self->_requestController request];
    [v92 setTimeoutInterval:0.0];

    v93 = [(MPRequestResponseController *)self->_requestController request];
    [v93 setQualityOfService:25];

    id v94 = [(MPCModelPlaybackRequest *)self->_request label];
    id v95 = [(MPRequestResponseController *)self->_requestController request];
    [v95 setLabel:v94];

    uint64_t v96 = self->_request;
    uint64_t v97 = [(MPRequestResponseController *)self->_requestController request];
    [v97 setModelRequest:v96];

    uint64_t v98 = (void *)[v8 copy];
    id loadingCompletionHandler = self->_loadingCompletionHandler;
    self->_id loadingCompletionHandler = v98;

    [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment _createStoreRequestContext];
    v117 = id v131 = 0;
    v100 = [[MPCModelGenericAVItemUserIdentityPropertySet alloc] initWithRequestContext:v117 error:&v131];
    id v101 = v131;
    identityPropertySet = self->_identityPropertySet;
    self->_identityPropertySet = v100;

    if (v101)
    {
      uint64_t v103 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        __int16 v104 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
        id v105 = objc_msgSend(v101, "msv_description");
        *(_DWORD *)buf = 138543874;
        v133 = v104;
        __int16 v134 = 2048;
        v135 = self;
        __int16 v136 = 2114;
        id v137 = v105;
        _os_log_impl(&dword_21BB87000, v103, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | failed to load identity properties [] error=%{public}@", buf, 0x20u);
      }
    }
    else if (self->_identityPropertySet)
    {
      goto LABEL_68;
    }
    (*((void (**)(void))self->_loadingCompletionHandler + 2))();
    id v106 = self->_loadingCompletionHandler;
    self->_id loadingCompletionHandler = 0;

LABEL_68:
    [(MPRequestResponseController *)self->_requestController setNeedsReload];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke;
    aBlock[3] = &unk_2643C6660;
    aBlock[4] = self;
    id v107 = v7;
    id v129 = v107;
    id v108 = v123;
    id v130 = v108;
    v109 = _Block_copy(aBlock);
    v110 = v109;
    if (v108)
    {
      v111 = objc_opt_class();
      v112 = [(MPCModelQueueFeeder *)self playActivityFeatureName];
      v113 = [(MPCPlaybackRequestEnvironment *)self->_playbackRequestEnvironment userIdentity];
      v124[0] = MEMORY[0x263EF8330];
      v124[1] = 3221225472;
      v124[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_242;
      v124[3] = &unk_2643C18B0;
      id v125 = v107;
      v126 = self;
      id v127 = v110;
      objc_msgSend(v111, "MPC_consumeSiriAssetInfo:playActivityFeatureName:userIdentity:completion:", v108, v112, v113, v124);
    }
    else
    {
      (*((void (**)(void *))v109 + 2))(v109);
    }
    id v8 = v121;

    id v27 = v123;
    goto LABEL_72;
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v116 = [MEMORY[0x263F08690] currentHandler];
    [v116 handleFailureInMethod:a2, self, @"MPCModelQueueFeeder.m", 802, @"Invalid request item class: %@ for %@", v51, self->_request object file lineNumber description];
  }
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Invalid request item class: %@ for %@", v51, self->_request);
  uint64_t v33 = (MPCModelPlaybackRequest *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, MPCModelPlaybackRequest *))v8 + 2))(v8, 0, 0, v33);
LABEL_72:
}

uint64_t __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ModelShimRequest", "", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(id *)(*(void *)(a1 + 32) + 128);
    *(void *)buf = 0;
    int v39 = buf;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy__13973;
    uint64_t v42 = __Block_byref_object_dispose__13974;
    id v43 = 0;
    id v7 = [v6 identifiers];
    uint64_t v8 = [(__CFString *)v7 totalItemCount];
    uint64_t v9 = [v6 sectionedModelObjects];
    uint64_t v10 = v9;
    if (v9 && v8 >= 1 && !*(void *)(*(void *)(a1 + 32) + 160))
    {
      BOOL v31 = [*(id *)(a1 + 40) shuffleType] == 0;

      if (!v31)
      {
        uint64_t v32 = [(__CFString *)v7 indexPathForGlobalIndex:arc4random_uniform(v8)];
        uint64_t v33 = (void *)*((void *)v39 + 5);
        *((void *)v39 + 5) = v32;

        uint64_t v34 = [(__CFString *)v7 identifiersForItemAtIndexPath:*((void *)v39 + 5)];
        uint64_t v35 = *(void *)(a1 + 32);
        id v36 = *(void **)(v35 + 160);
        *(void *)(v35 + 160) = v34;
      }
    }
    else
    {
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v39;
    if (*(void *)(v11 + 160) && !*((void *)v39 + 5))
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_225;
      v37[3] = &unk_2643C1888;
      void v37[4] = v11;
      v37[5] = buf;
      [(__CFString *)v7 enumerateItemIdentifiersUsingBlock:v37];
      id v12 = v39;
    }
    if (*((void *)v12 + 5))
    {
      uint64_t v13 = -[__CFString globalIndexForIndexPath:](v7, "globalIndexForIndexPath:");
      id v14 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
      [v14 addObject:*((void *)v39 + 5)];
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        if (v13 <= 1) {
          uint64_t v28 = 1;
        }
        else {
          uint64_t v28 = v13;
        }
        for (uint64_t i = v28 - 1; (unint64_t)[v14 count] <= 2 && i < v8; ++i)
        {
          if (v13 != i)
          {
            uint64_t v30 = [(__CFString *)v7 indexPathForGlobalIndex:i];
            if (v30) {
              [v14 addObject:v30];
            }
          }
        }
      }
      [v6 setPlaybackPrioritizedIndexPaths:v14];
    }
    else
    {
      if (!*(void *)(a1 + 48) || !*(void *)(*(void *)(a1 + 32) + 160)) {
        goto LABEL_16;
      }
      id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = [*(id *)(a1 + 32) uniqueIdentifier];
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(v18 + 160);
        *(_DWORD *)id v47 = 138544130;
        uint64_t v48 = v17;
        __int16 v49 = 2048;
        uint64_t v50 = v18;
        __int16 v51 = 2114;
        uint64_t v52 = v19;
        __int16 v53 = 2114;
        uint64_t v54 = v7;
        _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] loadPlaybackContext: | clearing startItemIdentifiers [SiriAssetInfo contains item not in the request] startItemIdentifiers=%{public}@ storeItemsRequest.identifiers=%{public}@", v47, 0x2Au);
      }
      __int16 v20 = (void *)MEMORY[0x263F54EC8];
      v44[0] = @"startItemIdentifiers";
      v45[0] = *(void *)(*(void *)(a1 + 32) + 160);
      v44[1] = @"storeItemsRequest.sectionedModelObjects";
      uint64_t v21 = [v6 sectionedModelObjects];
      __int16 v22 = (void *)v21;
      id v23 = @"nil";
      if (v21) {
        uint64_t v24 = (__CFString *)v21;
      }
      else {
        uint64_t v24 = @"nil";
      }
      v44[2] = @"identifiers";
      if (v7) {
        id v23 = v7;
      }
      v45[1] = v24;
      v45[2] = v23;
      uint64_t v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
      v46 = v25;
      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      [v20 snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"SiriAssetInfoBug" context:@"StartItemNotInRequest" triggerThresholdValues:&stru_26CBCA930 events:v26 completion:0];

      uint64_t v27 = *(void *)(a1 + 32);
      id v14 = *(void **)(v27 + 160);
      *(void *)(v27 + 160) = 0;
    }

LABEL_16:
    _Block_object_dispose(buf, 8);
  }
  return [*(id *)(*(void *)(a1 + 32) + 120) beginAutomaticResponseLoading];
}

- (MPCModelQueueFeeder)init
{
  v15.receiver = self;
  v15.super_class = (Class)MPCModelQueueFeeder;
  id v2 = [(MPCModelQueueFeeder *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelQueueFeeder.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelQueueFeeder.diffQueue", v5);
    diffQueue = v2->_diffQueue;
    v2->_diffQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    diffLock = v2->_diffLock;
    v2->_diffLock = v8;

    if (!v2->_playbackRequestEnvironment)
    {
      uint64_t v10 = +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment];
      playbackRequestEnvironment = v2->_playbackRequestEnvironment;
      v2->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v10;
    }
    id v12 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x263F121E0]);
    requestController = v2->_requestController;
    v2->_requestController = v12;

    [(MPRequestResponseController *)v2->_requestController setDelegate:v2];
  }
  return v2;
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet delegatedIdentityProperties];
  dispatch_queue_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 DSID];
  }
  else
  {
    uint64_t v8 = [(MPCModelGenericAVItemUserIdentityPropertySet *)self->_identityPropertySet identityProperties];
    id v7 = [v8 DSID];
  }
  if (v7)
  {
    uint64_t quot = [v7 longLongValue];
    uint64_t v10 = quot;
    uint64_t v11 = (char *)&v17 + 1;
    do
    {
      lldiv_t v12 = lldiv(quot, 10);
      uint64_t quot = v12.quot;
      if (v12.rem >= 0) {
        LOBYTE(v13) = v12.rem;
      }
      else {
        uint64_t v13 = -v12.rem;
      }
      *(v11 - 2) = v13 + 48;
      id v14 = (const UInt8 *)(v11 - 2);
      --v11;
    }
    while (v12.quot);
    if (v10 < 0)
    {
      *(v11 - 2) = 45;
      id v14 = (const UInt8 *)(v11 - 2);
    }
    objc_super v15 = (__CFString *)CFStringCreateWithBytes(0, v14, (char *)&v17 - (char *)v14, 0x8000100u, 0);
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendSection:");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3;
  v5[3] = &unk_2643C1720;
  uint64_t v4 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateItemIdentifiersInSectionAtIndex:a2 usingBlock:v5];
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_132(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)updatedPlaybackContext
{
  return self->_playbackContext;
}

- (void)_endBackgroundTaskAssertion
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__MPCModelQueueFeeder__endBackgroundTaskAssertion__block_invoke;
  v3[3] = &unk_2643C5FF0;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__13973;
  void v17[4] = __Block_byref_object_dispose__13974;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__13973;
  v15[4] = __Block_byref_object_dispose__13974;
  id v16 = 0;
  [(NSLock *)self->_diffLock lock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_2643C1860;
  void block[4] = self;
  id v11 = v8;
  lldiv_t v12 = v17;
  uint64_t v13 = v15;
  SEL v14 = a2;
  id v9 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_86(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) results];
  id v3 = objc_alloc_init(MEMORY[0x263F120D8]);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) results];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2;
  v40[3] = &unk_2643C1748;
  id v5 = v3;
  id v41 = v5;
  id v6 = v4;
  id v42 = v6;
  [v6 enumerateSectionIdentifiersUsingBlock:v40];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__13973;
  v38[4] = __Block_byref_object_dispose__13974;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__13973;
  v36[4] = __Block_byref_object_dispose__13974;
  id v37 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0x7FFFFFFFFFFFFFFFLL;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4;
  v23[3] = &unk_2643C1770;
  char v32 = *(unsigned char *)(a1 + 64);
  uint64_t v28 = v35;
  __int16 v29 = v34;
  uint64_t v30 = v38;
  id v8 = v5;
  id v24 = v8;
  char v33 = *(unsigned char *)(a1 + 65);
  id v9 = v2;
  id v25 = v9;
  BOOL v31 = v36;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  id v26 = v10;
  uint64_t v27 = v11;
  [v7 identifierRegistryWithExclusiveAccess:v23];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_119;
  block[3] = &unk_2643C1810;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 48);
  id v18 = v38;
  uint64_t v19 = v36;
  __int16 v20 = v35;
  void block[4] = v12;
  id v16 = v8;
  uint64_t v21 = v34;
  uint64_t v22 = v13;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

void __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = [*(id *)(a1 + 32) itemIdentifiers];
  id v3 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2;
  v12[3] = &unk_2643C5E70;
  id v4 = v2;
  id v13 = v4;
  id v5 = [v3 identifierRegistryWithExclusiveAccessReturningObject:v12];
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    objc_super v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v5;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] reloadSection: | applying changes [] section=%p changes=%{public}@", buf, 0x2Au);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_261;
  v11[3] = &unk_2643C5FA0;
  id v10 = *(void **)(a1 + 32);
  v11[4] = *(void *)(a1 + 40);
  [v10 applyChanges:v5 itemLookupBlock:v11];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 count];
  if (*(unsigned char *)(a1 + 96))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 count];
    id v4 = (void *)MEMORY[0x263F11D58];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v6 = [*(id *)(a1 + 32) totalItemCount];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_5;
    v25[3] = &unk_2643C5F10;
    id v26 = v3;
    id v27 = *(id *)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_6;
    v22[3] = &unk_2643C5F10;
    id v23 = v26;
    id v24 = *(id *)(a1 + 32);
    uint64_t v7 = [v4 changeDetailsWithPreviousCount:v5 finalCount:v6 isEqualBlock:v25 isUpdatedBlock:v22];
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) totalItemCount];
    id v10 = (void *)MEMORY[0x263F11D58];
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v12 = [*(id *)(a1 + 32) totalItemCount];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_7;
    v19[3] = &unk_2643C5F10;
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_8;
    v16[3] = &unk_2643C5F10;
    id v17 = v3;
    id v18 = *(id *)(a1 + 32);
    uint64_t v13 = [v10 changeDetailsWithPreviousCount:v11 finalCount:v12 isEqualBlock:v19 isUpdatedBlock:v16];
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    objc_super v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

id __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F11D58];
  uint64_t v5 = [*(id *)(a1 + 32) count];
  uint64_t v6 = [v3 count];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_3;
  v10[3] = &unk_2643C5F10;
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v7 = v3;
  uint64_t v8 = [v4 changeDetailsWithPreviousCount:v5 finalCount:v6 isEqualBlock:v10 isUpdatedBlock:&__block_literal_global_260];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_fallbackSectionRepresentation, 0);
  objc_storeStrong((id *)&self->_representativeMetadataPropertySet, 0);
  objc_storeStrong((id *)&self->_playbackContext, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_rtcReportingPlayQueueSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_activeModelGenericAVItems, 0);
  objc_storeStrong((id *)&self->_diffLock, 0);
  objc_storeStrong((id *)&self->_diffQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (MPCModelPlaybackResponse)response
{
  return self->_response;
}

- (void)setFallbackSectionRepresentation:(id)a3
{
}

- (MPModelGenericObject)fallbackSectionRepresentation
{
  return self->_fallbackSectionRepresentation;
}

- (id)_staticRegistryRequest
{
  return (id)[(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:&__block_literal_global_293];
}

id __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 count];
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = [v2 identifierSetAtIndex:i];
      id v7 = [v6 modelKind];
      uint64_t v8 = (objc_class *)[v7 modelClass];
      if (!v8) {
        uint64_t v8 = (objc_class *)objc_opt_class();
      }

      id v9 = [v8 alloc];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke_2;
      v17[3] = &unk_2643C1978;
      id v18 = v2;
      uint64_t v19 = i;
      id v10 = (void *)[v9 initWithIdentifiers:v6 block:v17];
      id v11 = [(objc_class *)v8 mqf_requiredItemPlaybackProperties];
      id v12 = (void *)[v10 copyWithPropertySet:v11];

      [v4 addObject:v12];
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x263F12040]);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F12048]) initWithRequest:v13];
  id v15 = objc_alloc_init(MEMORY[0x263F120D8]);
  [v15 appendSection:&stru_26CBCA930];
  [v15 appendItems:v4];
  [v14 setResults:v15];
  [v13 setStaticResponse:v14];

  return v13;
}

void __45__MPCModelQueueFeeder__staticRegistryRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = v7;
    uint64_t v6 = [v4 itemAtIndex:v3];
    [v5 setTitle:v6];
  }
}

- (id)_supplementalLibraryRequestWithError:(id *)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v4 = (void *)[(MPCModelPlaybackRequest *)self->_request copy];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(MPCModelPlaybackRequest *)self->_request mediaLibrary];
    [v4 setMediaLibrary:v6];
  }
  v68 = [v4 allowedSectionIdentifiers];
  v69 = v4;
  if ([v68 count])
  {
    uint64_t v71 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v68, "count"));
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v7 = v68;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (!v8) {
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v100;
    id obj = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v100 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        id v13 = [v12 personalizedStore];
        uint64_t v14 = [v12 universalStore];
        id v15 = (void *)v14;
        if (v13)
        {
          BOOL v16 = [v13 cloudID] != 0;
          if (!v15) {
            goto LABEL_14;
          }
        }
        else
        {
          BOOL v16 = 0;
          if (!v14)
          {
LABEL_14:
            BOOL v18 = 0;
            if (!v16) {
              goto LABEL_18;
            }
            goto LABEL_19;
          }
        }
        id v17 = [v15 globalPlaylistID];
        if ([v17 length])
        {
          BOOL v18 = 1;
        }
        else
        {
          uint64_t v19 = [v15 universalCloudLibraryID];
          BOOL v18 = [v19 length] != 0;
        }
        if (!v16)
        {
LABEL_18:
          if (!v18) {
            goto LABEL_20;
          }
        }
LABEL_19:
        id v20 = objc_alloc(MEMORY[0x263F11DB0]);
        id v21 = [v12 modelKind];
        v94[0] = MEMORY[0x263EF8330];
        v94[1] = 3221225472;
        v94[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke;
        v94[3] = &unk_2643C1950;
        BOOL v97 = v16;
        id v95 = v13;
        BOOL v98 = v18;
        id v96 = v15;
        uint64_t v22 = (void *)[v20 initWithSource:@"ModelQueueFeeder" modelKind:v21 block:v94];

        [v71 addObject:v22];
LABEL_20:
      }
      id v7 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
      if (!v9)
      {
LABEL_22:

        id v5 = v69;
        [v69 setAllowedSectionIdentifiers:v71];
        if ([v71 count])
        {

          break;
        }
        if (!a3)
        {
          id v59 = 0;
          id v23 = v71;
          goto LABEL_80;
        }
        __int16 v60 = (void *)MEMORY[0x263F087E8];
        objc_msgSend(v7, "msv_compactDescription");
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable allowedSectionIDs: %@", v40);
        id v59 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
        id v23 = v71;
        goto LABEL_79;
      }
    }
  }
  id v23 = [v5 allowedItemIdentifiers];
  uint64_t v71 = v23;
  if (![v23 count]) {
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  id obja = (id)objc_claimAutoreleasedReturnValue();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v104 count:16];
  if (!v25) {
    goto LABEL_43;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v91;
  do
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(void *)v91 != v27) {
        objc_enumerationMutation(v24);
      }
      __int16 v29 = *(void **)(*((void *)&v90 + 1) + 8 * j);
      uint64_t v30 = [v29 personalizedStore];
      uint64_t v31 = [v29 universalStore];
      char v32 = (void *)v31;
      if (v30)
      {
        BOOL v33 = [v30 cloudID] != 0;
        if (!v32) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v33 = 0;
        if (!v31)
        {
LABEL_35:
          BOOL v35 = 0;
          if (!v33) {
            goto LABEL_39;
          }
          goto LABEL_40;
        }
      }
      uint64_t v34 = [v32 universalCloudLibraryID];
      if ([v34 length]) {
        BOOL v35 = 1;
      }
      else {
        BOOL v35 = [v32 purchasedAdamID] != 0;
      }

      if (!v33)
      {
LABEL_39:
        if (!v35) {
          goto LABEL_41;
        }
      }
LABEL_40:
      id v36 = v24;
      id v37 = objc_alloc(MEMORY[0x263F11DB0]);
      id v38 = [v29 modelKind];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4;
      v85[3] = &unk_2643C1950;
      BOOL v88 = v33;
      id v86 = v30;
      BOOL v89 = v35;
      id v87 = v32;
      id v39 = (void *)[v37 initWithSource:@"ModelQueueFeeder" modelKind:v38 block:v85];

      [obja addObject:v39];
      id v24 = v36;

LABEL_41:
    }
    uint64_t v26 = [v24 countByEnumeratingWithState:&v90 objects:v104 count:16];
  }
  while (v26);
LABEL_43:

  id v5 = v69;
  id v23 = v24;
  id v40 = obja;
  [v69 setAllowedItemIdentifiers:obja];
  if (![obja count])
  {
    if (a3)
    {
      uint64_t v61 = (void *)MEMORY[0x263F087E8];
      v62 = objc_msgSend(v23, "msv_compactDescription");
      objc_msgSend(v61, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable allowedItemIDs: %@", v62);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = v69;
    }
    id v59 = 0;
    goto LABEL_79;
  }

  id v23 = v71;
LABEL_45:
  id v40 = [v5 scopedContainers];
  if (![v40 count]) {
    goto LABEL_69;
  }
  id v41 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v40, "count"));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v66 = v40;
  id v40 = v40;
  uint64_t v72 = [v40 countByEnumeratingWithState:&v81 objects:v103 count:16];
  if (!v72) {
    goto LABEL_67;
  }
  uint64_t v42 = *(void *)v82;
  id objb = v40;
  uint64_t v70 = *(void *)v82;
  while (2)
  {
    uint64_t v43 = 0;
    while (2)
    {
      if (*(void *)v82 != v42) {
        objc_enumerationMutation(objb);
      }
      uint64_t v44 = *(void **)(*((void *)&v81 + 1) + 8 * v43);
      uint64_t v45 = [v44 identifiers];
      v46 = [v45 personalizedStore];

      id v47 = [v44 identifiers];
      uint64_t v48 = [v47 universalStore];

      if (v46)
      {
        BOOL v49 = [v46 cloudID] != 0;
        if (v48) {
          goto LABEL_53;
        }
LABEL_56:
        BOOL v51 = 0;
        if (v49) {
          goto LABEL_64;
        }
LABEL_63:
        if (v51) {
          goto LABEL_64;
        }
      }
      else
      {
        BOOL v49 = 0;
        if (!v48) {
          goto LABEL_56;
        }
LABEL_53:
        uint64_t v50 = [v48 globalPlaylistID];
        if ([v50 length])
        {
          BOOL v51 = 1;
        }
        else
        {
          uint64_t v52 = [v48 universalCloudLibraryID];
          if ([v52 length]) {
            BOOL v51 = 1;
          }
          else {
            BOOL v51 = [v48 purchasedAdamID] != 0;
          }
        }
        if (!v49) {
          goto LABEL_63;
        }
LABEL_64:
        id v53 = objc_alloc(MEMORY[0x263F11DB0]);
        uint64_t v54 = [v44 identifiers];
        [v54 modelKind];
        v56 = uint64_t v55 = v41;
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7;
        v76[3] = &unk_2643C1950;
        BOOL v79 = v49;
        id v77 = v46;
        BOOL v80 = v51;
        id v78 = v48;
        uint64_t v57 = (void *)[v53 initWithSource:@"ModelQueueFeeder" modelKind:v56 block:v76];

        id v41 = v55;
        uint64_t v42 = v70;

        __int16 v58 = (void *)[v44 copyWithIdentifiers:v57 block:&__block_literal_global_288_13911];
        [v41 addObject:v58];
      }
      if (v72 != ++v43) {
        continue;
      }
      break;
    }
    id v40 = objb;
    uint64_t v72 = [objb countByEnumeratingWithState:&v81 objects:v103 count:16];
    if (v72) {
      continue;
    }
    break;
  }
LABEL_67:

  id v5 = v69;
  [v69 setScopedContainers:v41];
  if (![v41 count])
  {
    if (a3)
    {
      v63 = (void *)MEMORY[0x263F087E8];
      long long v64 = objc_msgSend(v40, "msv_compactDescription");
      objc_msgSend(v63, "msv_errorWithDomain:code:debugDescription:", @"MPCError", 72, @"Failed to create transportable scopedContainers: %@", v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = v69;
    }

    id v59 = 0;
    goto LABEL_78;
  }

  id v23 = v71;
  id v40 = v66;
LABEL_69:
  id v59 = v5;
LABEL_79:

LABEL_80:

  return v59;
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) personID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8;
    v7[3] = &unk_2643C4960;
    id v8 = *(id *)(a1 + 32);
    [v3 setPersonalStoreIdentifiersWithPersonID:v4 block:v7];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9;
    v5[3] = &unk_2643C4988;
    id v6 = *(id *)(a1 + 40);
    [v3 setUniversalStoreIdentifiersWithBlock:v5];
  }
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 globalPlaylistID];
  [v6 setGlobalPlaylistID:v4];

  id v5 = [*(id *)(a1 + 32) universalCloudLibraryID];
  [v6 setUniversalCloudLibraryID:v5];

  objc_msgSend(v6, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 universalCloudLibraryID];
  [v5 setUniversalCloudLibraryID:v4];

  objc_msgSend(v5, "setPurchasedAdamID:", objc_msgSend(*(id *)(a1 + 32), "purchasedAdamID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v2, "cloudID"));
}

void __60__MPCModelQueueFeeder__supplementalLibraryRequestWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 globalPlaylistID];
  [v4 setGlobalPlaylistID:v5];

  id v6 = [*(id *)(a1 + 32) universalCloudLibraryID];
  [v4 setUniversalCloudLibraryID:v6];
}

- (id)_sectionedModelObjectsRepresentationForSectionedCollection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F120D8]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke;
  v11[3] = &unk_2643C1928;
  id v6 = v5;
  id v12 = v6;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [v7 enumerateSectionsUsingBlock:v11];
  id v8 = v14;
  id v9 = v6;

  return v9;
}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F11F78]);
    id v7 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    uint64_t v8 = [v6 initWithIdentifiers:v7 block:&__block_literal_global_266];

    id v5 = (id)v8;
  }
  [*(id *)(a1 + 32) appendSection:v5];
  id v9 = [*(id *)(*(void *)(a1 + 40) + 232) request];
  uint64_t v10 = [v9 itemKind];
  uint64_t v11 = [v10 modelClass];

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 type] == 1)
    {
      id v12 = *(void **)(a1 + 48);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_3;
      v17[3] = &unk_2643C18D8;
      v18[1] = v11;
      id v13 = (id *)v18;
      v18[0] = *(id *)(a1 + 32);
      [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v17];
    }
    else
    {
      id v14 = *(void **)(a1 + 48);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_5;
      v15[3] = &unk_2643C1900;
      v16[1] = v11;
      id v13 = (id *)v16;
      v16[0] = *(id *)(a1 + 32);
      [v14 enumerateItemIdentifiersInSectionAtIndex:a3 usingBlock:v15];
    }
  }
}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = [a2 identifiers];
  id v3 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithIdentifiers:v4 block:&__block_literal_global_269];
  [*(id *)(a1 + 32) appendItem:v3];
}

void __82__MPCModelQueueFeeder__sectionedModelObjectsRepresentationForSectionedCollection___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(objc_class **)(a1 + 40);
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithIdentifiers:v5 block:&__block_literal_global_273];

  [*(id *)(a1 + 32) appendItem:v6];
}

void __50__MPCModelQueueFeeder__endBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[27] - 1;
    WeakRetained[27] = v3;
    if (!v3)
    {
      uint64_t v4 = *MEMORY[0x263F54E88];
      if (WeakRetained[26] != *MEMORY[0x263F54E88])
      {
        id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [v2 uniqueIdentifier];
          uint64_t v7 = v2[26];
          int v9 = 138543874;
          uint64_t v10 = v6;
          __int16 v11 = 2048;
          id v12 = v2;
          __int16 v13 = 2048;
          uint64_t v14 = v7;
          _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] _endBackgroundTaskAssertion | task ended [] task.id=%lu", (uint8_t *)&v9, 0x20u);
        }
        uint64_t v8 = MPSharedBackgroundTaskProvider();
        [v8 endTask:v2[26]];

        v2[26] = v4;
      }
    }
  }
}

void __52__MPCModelQueueFeeder__beginBackgroundTaskAssertion__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] BackgroundTask.expirationHandler | task expired [] task.name=%{public}@", (uint8_t *)&v7, 0x20u);
  }
  id v6 = MPSharedBackgroundTaskProvider();
  [v6 endTask:*(void *)(*(void *)(a1 + 32) + 208)];

  *(void *)(*(void *)(a1 + 32) + 208) = *MEMORY[0x263F54E88];
}

- (BOOL)section:(id)a3 shouldShuffleExcludeItem:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__MPCModelQueueFeeder_section_shouldShuffleExcludeItem___block_invoke;
  v10[3] = &unk_2643C5E70;
  id v11 = v5;
  id v6 = v5;
  int v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v10];
  char v8 = [v7 shouldExcludeFromShuffle];

  return v8;
}

id __56__MPCModelQueueFeeder_section_shouldShuffleExcludeItem___block_invoke(uint64_t a1, void *a2)
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

id __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_261(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2_262;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  void v5[4] = a2;
  id v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __48__MPCModelQueueFeeder_reloadSection_completion___block_invoke_2_262(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__MPCModelQueueFeeder_identifiersForItem_inSection___block_invoke;
  v9[3] = &unk_2643C5E70;
  id v10 = v5;
  id v6 = v5;
  int v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v9];

  return v7;
}

id __52__MPCModelQueueFeeder_identifiersForItem_inSection___block_invoke(uint64_t a1, void *a2)
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

void __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_242(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v4 = v3;
  msv_dispatch_on_main_queue();
}

uint64_t __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shuffleType])
  {
    id v2 = *(void **)(a1 + 40);
    if (v2) {
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 160), v2);
    }
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void __54__MPCModelQueueFeeder_loadPlaybackContext_completion___block_invoke_225(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 intersectsSet:*(void *)(*(void *)(a1 + 32) + 160)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)firstItemIntersectingIdentifierSet:(id)a3
{
  response = self->_response;
  id v5 = a3;
  id v6 = [(MPCModelPlaybackResponse *)response results];
  int v7 = [v6 indexPathForItemWithIdentifiersIntersectingSet:v5];

  if (v7)
  {
    id v8 = [(MPCModelPlaybackResponse *)self->_response results];
    uint64_t v9 = [v8 globalIndexForIndexPath:v7];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__MPCModelQueueFeeder_firstItemIntersectingIdentifierSet___block_invoke;
    v12[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
    void v12[4] = v9;
    id v10 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningObject:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __58__MPCModelQueueFeeder_firstItemIntersectingIdentifierSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 >= [v3 count])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 itemAtIndex:*(void *)(a1 + 32)];
  }

  return v5;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__MPCModelQueueFeeder_supportsAutoPlayForItem_inSection___block_invoke;
  v19[3] = &unk_2643C5DC8;
  id v6 = v5;
  id v20 = v6;
  uint64_t v7 = [(MPCModelQueueFeeder *)self identifierRegistryWithExclusiveAccessReturningInteger:v19];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v8) = 0;
    goto LABEL_24;
  }
  uint64_t v9 = v7;
  id v10 = [(MPCModelPlaybackResponse *)self->_response results];
  id v11 = [v10 indexPathForGlobalIndex:v9];

  uint64_t v12 = [(MPCModelPlaybackResponse *)self->_response results];
  uint64_t v13 = [v12 itemAtIndexPath:v11];

  id v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v14;
    }
    else {
      id v17 = 0;
    }
LABEL_15:
    if ([v17 type] == 1)
    {
      id v15 = [v17 song];
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_18;
  }
  id v16 = v14;
  if ([v16 type] != 1)
  {
    if ([v16 type] == 5)
    {
      id v17 = [v16 playlistEntry];
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_15;
  }
  id v15 = [v16 song];

  id v17 = 0;
LABEL_18:

LABEL_19:
  if (v15 && ([v15 hasVideo] & 1) == 0) {
    int v8 = [v15 isArtistUploadedContent] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

LABEL_24:
  return v8;
}

uint64_t __57__MPCModelQueueFeeder_supportsAutoPlayForItem_inSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexForItem:*(void *)(a1 + 32)];
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)canJumpToItem:(id)a3 reason:(id *)a4
{
  return 1;
}

void __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_120(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v4 != [v3 count])
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 138544130;
      __int16 v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v7;
      __int16 v32 = 2048;
      id v33 = v8;
      __int16 v34 = 2048;
      uint64_t v35 = [v3 count];
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] defersResponseReplacement | change details out of sync [identifierRegistry count mismatch] countDuringDiff=%ld countDuringApply=%ld", buf, 0x2Au);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 48) totalItemCount];
  id v27 = 0;
  LOBYTE(v10) = [v10 isValidForPreviousCount:v9 finalCount:v11 reason:&v27];
  id v12 = v27;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      __int16 v29 = v14;
      __int16 v30 = 2048;
      uint64_t v31 = v15;
      __int16 v32 = 2114;
      id v33 = v12;
      __int16 v34 = 2114;
      uint64_t v35 = v16;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] defersResponseReplacement | crashing [invalid change details] reason=%{public}@ changeDetails=%{public}@", buf, 0x2Au);
    }
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"MPCModelQueueFeeder.m", 494, @"%@", v12 object file lineNumber description];
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_124;
  v22[3] = &unk_2643C1798;
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  uint64_t v26 = *(void *)(a1 + 72);
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(a1 + 40);
  id v23 = v19;
  uint64_t v24 = v20;
  id v25 = v21;
  [v3 applyChanges:v18 identifierSetLookupBlock:v22];
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_2_133(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 queueIdentifier];
  uint64_t v5 = [v3 indexForItem:v4];

  return v5;
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_3_134(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4_135;
  v5[3] = &__block_descriptor_40_e41__16__0__MPQueueFeederIdentifierRegistry_8l;
  void v5[4] = a2;
  id v3 = [v2 identifierRegistryWithExclusiveAccessReturningObject:v5];

  return v3;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_4_135(uint64_t a1, void *a2)
{
  return [a2 itemAtIndex:*(void *)(a1 + 32)];
}

id __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) indexPathForGlobalIndex:a2];
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MPCModelQueueFeeder.m", 498, @"Unable to apply changes [missing identifier set in new collection] index=%ld/%ld changeDetails=%@", a2, objc_msgSend(*(id *)(a1 + 32), "totalItemCount"), *(void *)(a1 + 48) object file lineNumber description];
  }
  uint64_t v5 = [*(id *)(a1 + 32) itemAtIndexPath:v4];
  if (!v5)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MPCModelQueueFeeder.m", 500, @"newCollection failed to produce identifierSet for indexPath: %@", v4 object file lineNumber description];
  }

  return v5;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 indexPathForGlobalIndex:a2];
  uint64_t v7 = [v5 identifiersForItemAtIndexPath:v6];

  int v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v8 indexPathForGlobalIndex:a3];
  id v10 = [v8 itemAtIndexPath:v9];

  uint64_t v11 = [v7 intersectsSet:v10];
  return v11;
}

uint64_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) identifierSetAtIndex:a2];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v6 indexPathForGlobalIndex:a3];
  int v8 = [v6 itemAtIndexPath:v7];

  LODWORD(v6) = [v5 shouldExcludeFromShuffle];
  if (v6 == [v8 shouldExcludeFromShuffle])
  {
    int v10 = [v5 isPlaceholder];
    uint64_t v9 = v10 ^ [v8 isPlaceholder];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

intptr_t __60__MPCModelQueueFeeder_controller_defersResponseReplacement___block_invoke_9(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MPCModelQueueFeeder_controller_shouldRetryFailedRequestWithError___block_invoke;
  block[3] = &unk_2643C4648;
  void block[4] = self;
  id v10 = v5;
  uint64_t v11 = &v12;
  id v6 = v5;
  dispatch_sync(MEMORY[0x263EF83A0], block);
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__MPCModelQueueFeeder_controller_shouldRetryFailedRequestWithError___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 112);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, 0, 0, a1[5]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)getRepresentativeMetadataForPlaybackContext:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (MPPropertySet *)a4;
  id v10 = a5;
  representativeMetadataPropertySet = self->_representativeMetadataPropertySet;
  self->_representativeMetadataPropertySet = v9;
  uint64_t v12 = v9;

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke;
  v15[3] = &unk_2643C1A70;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v13 = v10;
  id v14 = v8;
  [(MPCModelQueueFeeder *)self loadPlaybackContext:v14 completion:v15];
}

void __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) shuffleType])
  {
    id v6 = (void *)MEMORY[0x263F11EE0];
    char v7 = [*(id *)(*(void *)(a1 + 40) + 232) results];
    id v8 = [v7 firstSection];
    id v9 = [v6 genericObjectWithModelObject:v8];

    if (v9)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Unable to obtain metadata for shuffled context: %@", *(void *)(a1 + 32));
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:

    goto LABEL_13;
  }
  id v9 = v14;
  if (v9
    || ([*(id *)(a1 + 40) identifierRegistryWithExclusiveAccessReturningObject:&__block_literal_global_14082], (id v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = [*(id *)(a1 + 40) itemForItem:v9 inSection:@"<REPRESENTATIVE ITEM LOADER>"];
    uint64_t v11 = [v10 modelGenericObject];
    if (v11)
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Could not convert startItem into metadata: %@", v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    goto LABEL_12;
  }
  uint64_t v13 = *(void *)(a1 + 48);
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"No start item was found for playback context: %@", *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id, id))(v13 + 16))(v13, 0, v5, v9);
LABEL_13:
}

id __89__MPCModelQueueFeeder_getRepresentativeMetadataForPlaybackContext_properties_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    uint64_t v3 = [v2 itemAtIndex:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)firstModelPlayEvent
{
  uint64_t v3 = (void *)MEMORY[0x263F11F88];
  uint64_t v4 = [(MPCModelPlaybackResponse *)self->_response results];
  id v5 = [v4 firstSection];
  fallbackSectionRepresentation = v5;
  if (!v5) {
    fallbackSectionRepresentation = self->_fallbackSectionRepresentation;
  }
  char v7 = [(MPCModelQueueFeeder *)self playActivityFeatureName];
  id v8 = [v3 playEventWithModelObject:fallbackSectionRepresentation featureName:v7];

  return v8;
}

- (id)supplementalPlaybackContextWithReason:(int64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(MPCModelQueueFeeder *)self supplementalPlaybackContextBehavior] != 1)
  {
    id v16 = 0;
    goto LABEL_27;
  }
  id v5 = [(MPCModelPlaybackResponse *)self->_response results];
  if ([v5 totalItemCount])
  {
    id v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    if ((unint64_t)a3 < 2)
    {
      id v17 = [MEMORY[0x263F12178] standardUserDefaults];
      char v18 = [v17 forceLibrarySupplementalContexts];

      if ((v18 & 1) == 0)
      {
        id v16 = 0;
        goto LABEL_25;
      }
    }
    else if (a3 != 2)
    {
      if (a3 == 3)
      {
        char v7 = [v5 firstSection];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v34) = 0;
          id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "numberOfSections"));
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke;
          v29[3] = &unk_2643C16F8;
          id v10 = v9;
          id v30 = v10;
          id v31 = v5;
          __int16 v32 = buf;
          [v31 enumerateSectionIdentifiersUsingBlock:v29];
          if ([v10 count] && !*(unsigned char *)(*(void *)&buf[8] + 24)) {
            [(MPCModelStorePlaybackItemsRequest *)v6 setStoreIDs:v10];
          }

          _Block_object_dispose(buf, 8);
        }
        uint64_t v11 = [(MPCModelStorePlaybackItemsRequest *)v6 storeIDs];
        BOOL v12 = v11 == 0;

        uint64_t v13 = objc_alloc_init(MPCModelPlaybackContext);
        if (v12)
        {
          id v28 = 0;
          id v14 = [(MPCModelQueueFeeder *)self _supplementalLibraryRequestWithError:&v28];
          char v15 = (MPCModelPlaybackContext *)v28;
          if (!v14)
          {
            uint64_t v26 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v27 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v27;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2048;
              int64_t v34 = 3;
              __int16 v35 = 2114;
              uint64_t v36 = v15;
              _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_ERROR, "[MQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | failed to create library supplemental [] error=%{public}@", buf, 0x2Au);
            }
            id v16 = 0;
            goto LABEL_23;
          }
          [(MPCModelPlaybackContext *)v13 setRequest:v14];
          [(MPCModelPlaybackContext *)v13 setSkipEncodingMediaLibraryUniqueID:1];

LABEL_20:
          [(MPCModelPlaybackContext *)v13 setPlaybackRequestEnvironment:self->_playbackRequestEnvironment];
          uint64_t v20 = [(MPCModelQueueFeeder *)self playActivityQueueGroupingID];
          [(MPCModelPlaybackContext *)v13 setPlayActivityQueueGroupingID:v20];

          id v21 = [(MPCModelQueueFeeder *)self playActivityFeatureName];
          [(MPCModelPlaybackContext *)v13 setPlayActivityFeatureName:v21];

          uint64_t v22 = [(MPCModelQueueFeeder *)self playActivityRecommendationData];
          [(MPCModelPlaybackContext *)v13 setPlayActivityRecommendationData:v22];

          id v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [(MPCModelQueueFeeder *)self uniqueIdentifier];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v24;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2048;
            int64_t v34 = a3;
            __int16 v35 = 2114;
            uint64_t v36 = v13;
            _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[MQF:%{public}@:%p] supplementalPlaybackContextWithReason:%ld | created supplemental [] supplementalContext=%{public}@", buf, 0x2Au);
          }
          uint64_t v13 = v13;
          id v16 = v13;
LABEL_23:

LABEL_25:
          goto LABEL_26;
        }
LABEL_19:
        [(MPCModelStorePlaybackItemsRequest *)v6 setClientIdentifier:@"com.apple.Music"];
        [(MPCModelPlaybackContext *)v13 setRequest:v6];
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v13 = objc_alloc_init(MPCModelPlaybackContext);
      goto LABEL_19;
    }
    id v19 = [(MPCModelQueueFeeder *)self _sectionedModelObjectsRepresentationForSectionedCollection:v5];
    [(MPCModelStorePlaybackItemsRequest *)v6 setSectionedModelObjects:v19];

    goto LABEL_18;
  }
  id v16 = 0;
LABEL_26:

LABEL_27:

  return v16;
}

void __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  char v7 = [a3 preferredStoreStringIdentifierForPersonID:0];
  if ([v7 length])
  {
    [*(id *)(a1 + 32) addObject:v7];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke_2;
    v9[3] = &unk_2643C16D0;
    id v8 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 48);
    [v8 enumerateItemIdentifiersInSectionAtIndex:a2 usingBlock:v9];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __61__MPCModelQueueFeeder_supplementalPlaybackContextWithReason___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 preferredStoreStringIdentifierForPersonID:0];
  if (![v6 length])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (int64_t)supplementalPlaybackContextBehavior
{
  return objc_opt_isKindOfClass() & 1;
}

void __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  if ([v12 intersectsSet:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
    goto LABEL_8;
  }
  if (a1[7])
  {
    id v8 = [v12 universalStore];
    if ([v8 adamID] == a1[7])
    {
    }
    else
    {
      id v9 = [v12 universalStore];
      uint64_t v10 = [v9 subscriptionAdamID];
      uint64_t v11 = a1[7];

      if (v10 != v11) {
        goto LABEL_8;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
LABEL_8:
}

void __43__MPCModelQueueFeeder_playbackInfoForItem___block_invoke_9(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  if ([v12 intersectsSet:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
    goto LABEL_8;
  }
  if (a1[7])
  {
    id v8 = [v12 universalStore];
    if ([v8 adamID] == a1[7])
    {
    }
    else
    {
      id v9 = [v12 universalStore];
      uint64_t v10 = [v9 subscriptionAdamID];
      uint64_t v11 = a1[7];

      if (v10 != v11) {
        goto LABEL_8;
      }
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
LABEL_8:
}

- (void)applyVolumeNormalizationForItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 modelPlayEvent];
  if ([v4 itemType] == 1)
  {
    id v5 = [v3 modelGenericObject];
    if ([v5 type] == 1)
    {
      id v6 = [v5 song];
      id v7 = [v6 album];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  if ([v7 hasLoadedValueForKey:*MEMORY[0x263F114D8]])
  {
    [v7 volumeNormalization];
    float v9 = v8;
  }
  else
  {
    float v9 = NAN;
  }
  uint64_t v10 = [MEMORY[0x263F12178] standardUserDefaults];
  int v11 = [v10 soundCheckEnabled];

  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Preferences");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v11;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "MPCModelQueueFeeder applyVolumeNormalizationForItem: soundCheckEnabled=%{BOOL}u", (uint8_t *)v15, 8u);
  }

  double v13 = 0.0;
  if (v11) {
    *(float *)&double v13 = v9;
  }
  [v3 setSoundCheckVolumeNormalization:v13];
  *(float *)&double v14 = v9;
  [v3 setLoudnessInfoVolumeNormalization:v14];
}

- (void)dealloc
{
  if (self->_backgroundTaskIdentifier != *MEMORY[0x263F54E88])
  {
    id v3 = MPSharedBackgroundTaskProvider();
    [v3 endTask:self->_backgroundTaskIdentifier];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCModelQueueFeeder;
  [(MPCModelQueueFeeder *)&v4 dealloc];
}

@end