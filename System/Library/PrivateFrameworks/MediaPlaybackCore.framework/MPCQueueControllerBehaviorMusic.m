@interface MPCQueueControllerBehaviorMusic
@end

@implementation MPCQueueControllerBehaviorMusic

id __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_204(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 itemID];
  v5 = [v3 identifierSetForItem:v4];

  return v5;
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_273(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 88) allSectionIdentifiers];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 96) allSectionIdentifiers];
  v4 = [v2 setByAddingObjectsFromSet:v3];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_2;
  v8[3] = &unk_2643BFFB0;
  v8[4] = *(void *)(a1 + 32);
  v5 = objc_msgSend(v4, "msv_filter:", v8);
  if ([v5 count])
  {
    v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 2, @"Missing data sources for sectionIDs: %@", v5);
    [*(id *)(a1 + 40) addObject:v6];
  }
  if ([*(id *)(a1 + 40) count])
  {
    v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingErrors:debugDescription:", @"MPCMusicBehaviorError", 2, *(void *)(a1 + 40), &stru_26CBCA930);
  }
  else
  {
    v7 = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 128) = 1;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior_Oversize");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) engineID];
    v9 = [*(id *)(a1 + 40) sessionID];
    *(_DWORD *)buf = 138543874;
    id v109 = v8;
    __int16 v110 = 2114;
    v111 = v9;
    __int16 v112 = 2114;
    id v113 = v6;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | processing dataSourceState=%{public}@", buf, 0x20u);
  }
  if (([*(id *)(*(void *)(a1 + 40) + 88) hasSection:v5] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 40) + 96) hasSection:v5] & 1) != 0)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [*(id *)(a1 + 32) engineID];
      v12 = [*(id *)(a1 + 40) sessionID];
      *(_DWORD *)buf = 138544130;
      id v109 = v11;
      __int16 v110 = 2114;
      v111 = v12;
      __int16 v112 = 2048;
      id v113 = v6;
      __int16 v114 = 2114;
      id v115 = v5;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restored [success] dataSourceState=%p sectionID=%{public}@", buf, 0x2Au);
    }
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    spid = (char *)os_signpost_id_make_with_pointer(v13, v6);

    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v15 = v14;
    location = (id *)(spid - 1);
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543362;
      id v109 = v5;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource", "section=%{public}@", buf, 0xCu);
    }

    v16 = [*(id *)(a1 + 32) eventStream];
    [v6 setEventStream:v16];

    v17 = [*(id *)(a1 + 32) playerID];
    [v6 setPlayerID:v17];

    v18 = [v6 playbackContext];
    [v18 clearStartItem];

    v19 = [v6 playbackContext];
    [v19 setShuffleType:0];

    v20 = [v6 playbackContext];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v22 = [v6 playbackContext];
      v23 = *(void **)(a1 + 48);
      if (v23)
      {
        v24 = [v23 sectionID];
        v25 = [*(id *)(a1 + 48) itemID];
        if ([v5 isEqualToString:v24])
        {
          v26 = [*(id *)(a1 + 40) _identifierListForSection:v24];
          if ([v26 hasItem:v25 inSection:v24]
            && ([v26 isDeletedItem:v25 inSection:v24] & 1) == 0)
          {
            v33 = [v6 dataSource];
            v106[0] = MEMORY[0x263EF8330];
            v106[1] = 3221225472;
            v106[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_204;
            v106[3] = &unk_2643C5E70;
            v107 = *(id *)(a1 + 48);
            v34 = [v33 identifierRegistryWithExclusiveAccessReturningObject:v106];
            [v22 setStartItemIdentifiers:v34];

            v27 = v107;
          }
          else
          {
            v27 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [*(id *)(a1 + 32) engineID];
              v29 = [*(id *)(a1 + 40) sessionID];
              *(_DWORD *)buf = 138544130;
              id v109 = v28;
              __int16 v110 = 2114;
              v111 = v29;
              __int16 v112 = 2114;
              id v113 = v24;
              __int16 v114 = 2114;
              id v115 = v25;
              _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | ignoring start item [no longer in SIL/AutoPlay-SIL] startingSectionID=%{public}@ startingItemID=%{public}@", buf, 0x2Au);
            }
          }
        }
      }
    }
    v35 = [v6 playbackContext];
    int v36 = [v35 conformsToProtocol:&unk_26CC28748];

    if (v36)
    {
      v37 = [v6 playbackContext];
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v39 = v38;
      if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v39, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Rectify", "", buf, 2u);
      }

      v40 = [v37 playbackRequestEnvironment];
      id v105 = 0;
      v41 = [v40 rectifiedPlaybackRequestEnvironmentWithReasons:&v105];
      id v42 = v105;

      if (v41)
      {
        v43 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [*(id *)(a1 + 32) engineID];
          v45 = [*(id *)(a1 + 40) sessionID];
          v46 = [v42 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138544130;
          id v109 = v44;
          __int16 v110 = 2114;
          v111 = v45;
          __int16 v112 = 2114;
          id v113 = v46;
          __int16 v114 = 2114;
          id v115 = v5;
          _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | account rectification [%{public}@] sectionID=%{public}@", buf, 0x2Au);
        }
        [v37 setPlaybackRequestEnvironment:v41];
      }
      v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v48 = v47;
      if ((unint64_t)location <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        v49 = [v42 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543362;
        id v109 = v49;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v48, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Rectify", "reasons=%{public}@", buf, 0xCu);
      }
    }
    v50 = *(void **)(a1 + 40);
    v51 = [v6 playbackContext];
    v52 = [v6 sectionIdentifier];
    [v50 _emitEventsForAddingPlaybackContext:v51 sectionIdentifier:v52];

    v53 = dispatch_group_create();
    dispatch_group_enter(v53);
    v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v55 = v54;
    if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v55, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Replace", "", buf, 2u);
    }

    v84 = [*(id *)(a1 + 40) _identifierListForSection:v5];
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_257;
    v97[3] = &unk_2643BFF38;
    id v56 = *(id *)(a1 + 32);
    uint64_t v57 = *(void *)(a1 + 40);
    id v98 = v56;
    uint64_t v99 = v57;
    id v58 = v6;
    id v100 = v58;
    id v59 = v5;
    id v101 = v59;
    id v102 = *(id *)(a1 + 56);
    v104 = spid;
    os_log_t v30 = v53;
    os_log_t v103 = v30;
    [v84 replaceDataSource:v58 forSection:v59 completion:v97];
    if (![v58 shouldAddOriginalPlaybackContextAfterReplacement]) {
      goto LABEL_61;
    }
    v60 = [v58 originalPlaybackContext];
    BOOL v61 = v60 == 0;

    if (v61) {
      goto LABEL_61;
    }
    v62 = [v58 originalPlaybackContext];
    if (objc_opt_respondsToSelector())
    {
      v63 = [v58 originalPlaybackContext];
      char v64 = objc_opt_respondsToSelector();

      if ((v64 & 1) == 0) {
        goto LABEL_54;
      }
      v62 = [v58 originalPlaybackContext];
      v65 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v66 = v65;
      if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v66, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Original-Rectify", "", buf, 2u);
      }

      v67 = [v62 playbackRequestEnvironment];
      id v96 = 0;
      v68 = [v67 rectifiedPlaybackRequestEnvironmentWithReasons:&v96];
      id v83 = v96;

      if (v68)
      {
        v69 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v82 = [*(id *)(a1 + 32) engineID];
          v70 = [*(id *)(a1 + 40) sessionID];
          v81 = [v83 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138544130;
          id v109 = v82;
          __int16 v110 = 2114;
          v111 = v70;
          __int16 v112 = 2114;
          id v113 = v81;
          __int16 v114 = 2114;
          id v115 = v59;
          _os_log_impl(&dword_21BB87000, v69, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | account rectification for originalPlaybackContext [%{public}@] sectionID=%{public}@", buf, 0x2Au);
        }
        [v62 setPlaybackRequestEnvironment:v68];
      }
      v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v72 = v71;
      if ((unint64_t)location <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        v73 = [v83 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543362;
        id v109 = v73;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v72, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Original-Rectify", "reasons=%{public}@", buf, 0xCu);
      }
    }

LABEL_54:
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    dispatch_group_enter(v30);
    v74 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v75 = v74;
    if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v74))
    {
      *(_WORD *)v95 = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v75, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Add", "", v95, 2u);
    }

    v76 = *(void **)(a1 + 40);
    if (v84 == (void *)v76[11])
    {
      v77 = [v58 originalPlaybackContext];
      v78 = (id *)v93;
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_263;
      v93[3] = &unk_2643BFF60;
      locationa = v94;
      objc_copyWeak(v94, (id *)buf);
      v93[4] = *(id *)(a1 + 32);
      v93[5] = v58;
      id v80 = v59;
      v93[6] = v80;
      v93[7] = *(id *)(a1 + 56);
      v94[1] = spid;
      v93[8] = v30;
      [v76 _addPlaybackContext:v77 atPosition:100 afterContentItemID:0 sectionIdentifier:v80 actions:16 completion:v93];
    }
    else
    {
      v77 = [v58 originalPlaybackContext];
      v78 = (id *)v91;
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_267;
      v91[3] = &unk_2643BFF60;
      locationa = v92;
      objc_copyWeak(v92, (id *)buf);
      v91[4] = *(id *)(a1 + 32);
      v91[5] = v58;
      id v79 = v59;
      v91[6] = v79;
      v91[7] = *(id *)(a1 + 56);
      v92[1] = spid;
      v91[8] = v30;
      [v76 _addAutoPlayPlaybackContext:v77 atPosition:100 afterContentItemID:0 sectionIdentifier:v79 actions:16 completion:v91];
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);
LABEL_61:
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_271;
    block[3] = &unk_2643C4F28;
    v90 = spid;
    id v89 = *(id *)(a1 + 64);
    dispatch_group_notify(v30, MEMORY[0x263EF83A0], block);

    goto LABEL_62;
  }
  [*(id *)(*(void *)(a1 + 40) + 120) setObject:0 forKeyedSubscript:v5];
  os_log_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    v31 = [*(id *)(a1 + 32) engineID];
    v32 = [*(id *)(a1 + 40) sessionID];
    *(_DWORD *)buf = 138543874;
    id v109 = v31;
    __int16 v110 = 2114;
    v111 = v32;
    __int16 v112 = 2114;
    id v113 = v5;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_FAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | skipping section [sectionID not in SIL/AutoPlay-SIL] sectionID=%{public}@", buf, 0x20u);
  }
LABEL_62:
}

BOOL __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

void __53___MPCQueueControllerBehaviorMusic_didConnectToHost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v5 state] != 1)
  {
    id v6 = *(void **)(a1 + 32);
    v7 = [v5 playbackContext];
    [v6 _emitEventsForAddingPlaybackContext:v7 sectionIdentifier:v8];
  }
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_271(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "QC-FinalizeDataSource", "", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_257(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    os_signpost_id_t v4 = v3;
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) engineID];
      v7 = [*(id *)(a1 + 40) sessionID];
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      int v14 = 138544386;
      v15 = v6;
      __int16 v16 = 2114;
      v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [replacing SIL data source failed] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v14, 0x34u);
    }
    v10 = objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 2, @"replacing SIL data source failed");

    [*(id *)(a1 + 64) addObject:v10];
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v13, "QC-FinalizeDataSource-Replace", "", (uint8_t *)&v14, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

id __85___MPCQueueControllerBehaviorMusic__updateGroupSessionParticipants_localParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    id v3 = [MPCSharedSessionParticipant alloc];
    if (v3)
    {
      v12.receiver = v3;
      v12.super_class = (Class)MPCSharedSessionParticipant;
      id v4 = objc_msgSendSuper2(&v12, sel_init);
      id v5 = v4;
      if (v4) {
        *((void *)v4 + 2) = 2;
      }
    }
    else
    {
      id v5 = 0;
    }
    v7 = [v2 identifier];
    if (v5) {
      objc_setProperty_nonatomic_copy(v5, v6, v7, 48);
    }

    uint64_t v8 = [v2 identity];

    v10 = [v8 identifier];
    if (v5) {
      objc_setProperty_nonatomic_copy(v5, v9, v10, 56);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __85___MPCQueueControllerBehaviorMusic__updateGroupSessionParticipants_localParticipant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!v5)
  {
    uint64_t v8 = (void *)MEMORY[0x263F08690];
    id v9 = a3;
    v10 = [v8 currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"_MPCQueueControllerBehaviorMusic.m", 3827, @"Failed to create AutoPlay playback queue: %@", v9 object file lineNumber description];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_2;
  v11[3] = &unk_2643C0208;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 80);
  v11[4] = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  [v5 getMusicPlaybackContextWithOptions:0 completion:v11];
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"_MPCQueueControllerBehaviorMusic.m", 3829, @"Failed to create AutoPlay playbackContext: %@", v6 object file lineNumber description];
  }
  id v7 = v5;
  uint64_t v8 = [*(id *)(a1 + 40) userIdentity];
  [v7 setUserIdentity:v8];

  objc_msgSend(v7, "setContinueListeningMaxQueueReferences:", objc_msgSend(*(id *)(a1 + 48), "continueListeningMaxQueueSizeInRequest"));
  objc_msgSend(v7, "setContinueListeningPrefetchThreshold:", objc_msgSend(*(id *)(a1 + 48), "continueListeningMaxUpcomingTracksSizeToMaintain"));
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v10 = v7;
  objc_copyWeak(&v14, &location);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_4;
  v4[3] = &unk_2643C01B8;
  objc_copyWeak(&v8, (id *)(a1 + 72));
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _addAutoPlayPlaybackContext:v3 atPosition:2 afterContentItemID:0 sectionIdentifier:0 actions:16 completion:v4];

  objc_destroyWeak(&v8);
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_4(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = v3;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = v3;
  id v6 = WeakRetained;
  msv_dispatch_on_main_queue();
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_5(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
  if (*(void *)(a1 + 40))
  {
    if ((*(void *)(*(void *)(a1 + 32) + 104) | 2) == 3)
    {
      id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [*(id *)(a1 + 48) engineID];
        id v7 = [*(id *)(a1 + 32) sessionID];
        unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 104);
        if (v8 >= 0xA)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", *(void *)(*(void *)(a1 + 32) + 104));
          id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = off_2643C02F8[v8];
        }
        uint64_t v17 = *(void *)(a1 + 56);
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        __int16 v20 = v6;
        __int16 v21 = 2114;
        __int16 v22 = v7;
        __int16 v23 = 2114;
        uint64_t v24 = v9;
        __int16 v25 = 2114;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | failed to enable, not updating state [already in %{public}@ state] transition=%{public}@ error=%{public}@", buf, 0x34u);
      }
    }
    else
    {
      id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [*(id *)(a1 + 48) engineID];
        id v13 = [*(id *)(a1 + 32) sessionID];
        id v14 = *(__CFString **)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        __int16 v20 = v12;
        __int16 v21 = 2114;
        __int16 v22 = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | disabling autoplay [failed to enable] transition=%{public}@ error=%{public}@", buf, 0x2Au);
      }
      id v16 = *(void **)(a1 + 32);
      if (v16[13] != 2) {
        [v16 _transitionToAutoPlayState:2];
      }
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 64) == v10[12] && v10[13] == 6)
    {
      [v10 _transitionToAutoPlayState:7];
    }
  }
}

id __55___MPCQueueControllerBehaviorMusic__itemForComponents___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F11D30]) initWithToken:@"AutoPlayPlaceholder" dataSource:*(void *)(a1 + 32)];

  return v1;
}

void __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v6 shouldRequestAdditionalItemsAtTail])
  {
    uint64_t v7 = [v6 prefetchThreshold];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [*(id *)(a1 + 32) _countOfItemsWithinSection:v5 maxCount:v7];
      uint64_t v10 = v8 - v9;
      id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 40) engineID];
        id v13 = [*(id *)(a1 + 32) sessionID];
        *(_DWORD *)buf = 138544386;
        __int16 v21 = v12;
        __int16 v22 = 2114;
        __int16 v23 = v13;
        __int16 v24 = 2114;
        id v25 = v5;
        __int16 v26 = 2048;
        uint64_t v27 = v8;
        __int16 v28 = 2048;
        uint64_t v29 = v9;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[CUTS:%{public}@:%{public}@] _evaluateLoadingDataSourceItemThresholds | evaluating [] sectionID=%{public}@ threshold=%ld itemCount>=%ld", buf, 0x34u);
      }
      if (v10 >= 1)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke_631;
        v16[3] = &unk_2643C0190;
        id v14 = *(id *)(a1 + 40);
        uint64_t v15 = *(void *)(a1 + 32);
        id v17 = v14;
        uint64_t v18 = v15;
        id v19 = v5;
        [v6 loadAdditionalItemsIfNeededWithCount:v10 completion:v16];
      }
    }
  }
}

void __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke_631(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) engineID];
    id v4 = [*(id *)(a1 + 40) sessionID];
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 138543874;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[CUTS:%{public}@:%{public}@] _evaluateLoadingDataSourceItemThresholds | completed [] sectionID=%{public}@", (uint8_t *)&v6, 0x20u);
  }
}

void __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2;
  v9[3] = &unk_2643C0140;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  char v17 = *(unsigned char *)(a1 + 80);
  id v15 = v3;
  id v16 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 96) identifier];
  LOBYTE(v2) = [v2 isEqualToString:v3];

  if ((v2 & 1) == 0)
  {
    __int16 v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = [*(id *)(a1 + 48) engineID];
      id v25 = [*(id *)(a1 + 40) sessionID];
      __int16 v26 = *(void **)(a1 + 56);
      uint64_t v27 = [v26 sectionIdentifier];
      int v29 = 138544130;
      uint64_t v30 = v24;
      __int16 v31 = 2114;
      v32 = v25;
      __int16 v33 = 2048;
      v34 = v26;
      __int16 v35 = 2114;
      int v36 = v27;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | rolling back edit [autoPlayIdentifierList changed before dataSource finished loading] dataSource=%p section=%{public}@", (uint8_t *)&v29, 0x2Au);
    }
    [*(id *)(a1 + 64) rollback];
    uint64_t v28 = *(void *)(a1 + 80);
    __int16 v21 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"autoPlayIdentifierList is nil");
    __int16 v22 = *(void (**)(void))(v28 + 16);
    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    id v4 = [*(id *)(a1 + 56) preferredStartItemIdentifier];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 56) sectionIdentifier];
      int v6 = [*(id *)(a1 + 56) preferredStartItemIdentifier];
      id v7 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v5 itemID:v6];

      id v8 = [v7 contentItemID];
      [*(id *)(a1 + 64) setSuggestedContentItemIDForStart:v8];
      uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [*(id *)(a1 + 48) engineID];
        uint64_t v11 = [*(id *)(a1 + 40) sessionID];
        int v29 = 138543874;
        uint64_t v30 = v10;
        __int16 v31 = 2114;
        v32 = v11;
        __int16 v33 = 2114;
        v34 = v8;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@", (uint8_t *)&v29, 0x20u);
      }
    }
  }
  if (*(void *)(*(void *)(a1 + 40) + 128) != 1)
  {
    id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 48) engineID];
      id v14 = [*(id *)(a1 + 40) sessionID];
      int v29 = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v29, 0x16u);
    }
    *(void *)(*(void *)(a1 + 40) + 128) = 1;
  }
  id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [*(id *)(a1 + 48) engineID];
    char v17 = [*(id *)(a1 + 40) sessionID];
    int v29 = 138543618;
    uint64_t v30 = v16;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | committing edit [added data source]", (uint8_t *)&v29, 0x16u);
  }
  [*(id *)(a1 + 64) commit];
  if (*(void *)(a1 + 80))
  {
    uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [*(id *)(a1 + 48) engineID];
      __int16 v20 = [*(id *)(a1 + 40) sessionID];
      int v29 = 138543618;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | calling completion [added data source]", (uint8_t *)&v29, 0x16u);
    }
    __int16 v21 = objc_msgSend(*(id *)(a1 + 72), "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"adding data source failed (autoplay SIL)");
    __int16 v22 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_20:
    v22();
  }
}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) engineID];
    uint64_t v9 = [*(id *)(a1 + 40) sessionID];
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | freezing section [play last] sectionID=%{public}@", (uint8_t *)&v10, 0x20u);
  }
  [v6 setFrozen:1];
}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_609(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2;
  v9[3] = &unk_2643C00F0;
  long long v17 = *(_OWORD *)(a1 + 80);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 96);
  id v14 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  id v15 = v3;
  id v16 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a1 + 88) & 2) != 0 && *(void *)(a1 + 96))
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) engineID];
      id v4 = [*(id *)(a1 + 40) sessionID];
      uint64_t v5 = MPShuffleTypeDescription();
      id v6 = [*(id *)(a1 + 48) preferredStartItemIdentifier];
      id v7 = [*(id *)(a1 + 48) sectionIdentifier];
      int v32 = 138544386;
      __int16 v33 = v3;
      __int16 v34 = 2114;
      __int16 v35 = v4;
      __int16 v36 = 2114;
      uint64_t v37 = v5;
      __int16 v38 = 2114;
      v39 = v6;
      __int16 v40 = 2114;
      v41 = v7;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting shuffle type [first data source loaded] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", (uint8_t *)&v32, 0x34u);
    }
    *(void *)(*(void *)(a1 + 40) + 72) = *(void *)(a1 + 96);
    id v8 = *(void **)(*(void *)(a1 + 40) + 88);
    uint64_t v9 = *(void *)(a1 + 96);
    id v10 = [*(id *)(a1 + 48) preferredStartItemIdentifier];
    uint64_t v11 = [*(id *)(a1 + 48) sectionIdentifier];
    [v8 setShuffleType:v9 startingItem:v10 inSection:v11];

    [*(id *)(a1 + 40) _emitEventsForPlaybackBehaviorChangeIfNeeded];
    [*(id *)(a1 + 56) behavior:*(void *)(a1 + 40) didChangeShuffleType:*(void *)(a1 + 96)];
  }
  if (*(unsigned char *)(a1 + 104))
  {
    id v12 = [*(id *)(a1 + 48) preferredStartItemIdentifier];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 48) sectionIdentifier];
      id v14 = [*(id *)(a1 + 48) preferredStartItemIdentifier];
      id v15 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v13 itemID:v14];

      id v16 = [v15 contentItemID];
      [*(id *)(a1 + 64) setSuggestedContentItemIDForStart:v16];
      long long v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        char v18 = [*(id *)(a1 + 32) engineID];
        id v19 = [*(id *)(a1 + 40) sessionID];
        __int16 v20 = *(void **)(a1 + 64);
        int v32 = 138544130;
        __int16 v33 = v18;
        __int16 v34 = 2114;
        __int16 v35 = v19;
        __int16 v36 = 2114;
        uint64_t v37 = v16;
        __int16 v38 = 2114;
        v39 = v20;
        _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@ edit=%{public}@", (uint8_t *)&v32, 0x2Au);
      }
    }
  }
  if (*(void *)(*(void *)(a1 + 40) + 128) != 1)
  {
    __int16 v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [*(id *)(a1 + 32) engineID];
      __int16 v23 = [*(id *)(a1 + 40) sessionID];
      int v32 = 138543618;
      __int16 v33 = v22;
      __int16 v34 = 2114;
      __int16 v35 = v23;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v32, 0x16u);
    }
    *(void *)(*(void *)(a1 + 40) + 128) = 1;
  }
  __int16 v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [*(id *)(a1 + 32) engineID];
    __int16 v26 = [*(id *)(a1 + 40) sessionID];
    uint64_t v27 = *(void **)(a1 + 64);
    int v32 = 138543874;
    __int16 v33 = v25;
    __int16 v34 = 2114;
    __int16 v35 = v26;
    __int16 v36 = 2114;
    uint64_t v37 = v27;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | committing edit [added data source] edit=%{public}@", (uint8_t *)&v32, 0x20u);
  }
  [*(id *)(a1 + 64) commit];
  if (*(void *)(a1 + 80))
  {
    uint64_t v28 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [*(id *)(a1 + 32) engineID];
      uint64_t v30 = [*(id *)(a1 + 40) sessionID];
      int v32 = 138543618;
      __int16 v33 = v29;
      __int16 v34 = 2114;
      __int16 v35 = v30;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | calling completion [added data source]", (uint8_t *)&v32, 0x16u);
    }
    __int16 v31 = objc_msgSend(*(id *)(a1 + 72), "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"adding data source failed");
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __85___MPCQueueControllerBehaviorMusic_didDequeueShuffledItemsInSectionedIdentifierList___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  id v3 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    id v4 = [v2 beginEditWithReason:@"BehaviorMusic-didDequeueShuffledItems"];
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 engineID];
      id v7 = [*(id *)(a1 + 32) sessionID];
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] didDequeueShuffledItemsInSectionedIdentifierList: | committing edit [ShuffleSIL dequeued items]", (uint8_t *)&v10, 0x16u);
    }
    [v4 commit];
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 engineID];
      uint64_t v9 = [*(id *)(a1 + 32) sessionID];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] didDequeueShuffledItemsInSectionedIdentifierList: | ignoring SIL change [state: Loading]", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __87___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateSection___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v3 updatePlaybackContext];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  [v2 behaviorDidChange];
}

void __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidChangeItems_inSection___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) host];
  [v1 upNextBehaviorDidChange];
}

void __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateItems_inSection___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  id v3 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    id v4 = [v2 beginEditWithReason:@"BehaviorMusic-dataSourceDidUpdateItems"];
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 engineID];
      id v7 = [*(id *)(a1 + 32) sessionID];
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidUpdateItems:inSection: | committing edit [data source updated items]", (uint8_t *)&v10, 0x16u);
    }
    [v4 commit];
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 engineID];
      uint64_t v9 = [*(id *)(a1 + 32) sessionID];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidUpdateItems:inSection: | ignoring SIL change [state: Loading]", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __92___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidAddItems_toSection___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v39 = [*(id *)(a1 + 32) host];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v2 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v8 = [v39 eventStream];
        uint64_t v9 = *(void *)(v2 + 48);
        v52[0] = @"queue-section-id";
        v52[1] = @"queue-item-id";
        v53[0] = v9;
        v53[1] = v7;
        int v10 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
        [v8 emitEventType:@"queue-item-add" payload:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v4);
  }

  uint64_t v11 = v2;
  __int16 v12 = *(void **)(v2 + 32);
  uint64_t v13 = v12[13];
  if (v13 == 5)
  {
    uint64_t v14 = [v12 queueReferencesWithMaxCount:1];
    uint64_t v19 = [v14 count];
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    BOOL v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v20)
      {
        __int16 v21 = [v39 engineID];
        __int16 v22 = [*(id *)(v2 + 32) sessionID];
        *(_DWORD *)buf = 138543618;
        v45 = v21;
        __int16 v46 = 2114;
        v47 = v22;
        _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay disabled [finished waitingForItems]", buf, 0x16u);
      }
      uint64_t v23 = 3;
    }
    else
    {
      if (v20)
      {
        __int16 v26 = [v39 engineID];
        uint64_t v27 = [*(id *)(v2 + 32) sessionID];
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        __int16 v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay unsupported [no queue references]", buf, 0x16u);
      }
      uint64_t v23 = 1;
    }
    goto LABEL_29;
  }
  if (v13 == 4)
  {
    uint64_t v14 = [v12 queueReferencesWithMaxCount:1];
    uint64_t v24 = [v14 count];
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    BOOL v25 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (!v24)
    {
      if (v25)
      {
        uint64_t v28 = [v39 engineID];
        int v29 = [*(id *)(v2 + 32) sessionID];
        *(_DWORD *)buf = 138543618;
        v45 = v28;
        __int16 v46 = 2114;
        v47 = v29;
        _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay unsupported [no queue references]", buf, 0x16u);
      }
      uint64_t v23 = 2;
      goto LABEL_29;
    }
    if (v25)
    {
      id v16 = [v39 engineID];
      long long v17 = [*(id *)(v2 + 32) sessionID];
      *(_DWORD *)buf = 138543618;
      v45 = v16;
      __int16 v46 = 2114;
      v47 = v17;
      char v18 = "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay waiting for "
            "trigger [finished waitingForItems]";
      goto LABEL_21;
    }
LABEL_22:
    uint64_t v23 = 9;
LABEL_29:

    [*(id *)(v2 + 32) _transitionToAutoPlayState:v23];
    goto LABEL_30;
  }
  if (v13 != 2) {
    goto LABEL_31;
  }
  uint64_t v14 = [v12 queueReferencesWithMaxCount:1];
  if ([v14 count])
  {
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v39 engineID];
      long long v17 = [*(id *)(v2 + 32) sessionID];
      *(_DWORD *)buf = 138543618;
      v45 = v16;
      __int16 v46 = 2114;
      v47 = v17;
      char v18 = "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay waiting for "
            "trigger [new supported content]";
LABEL_21:
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
LABEL_30:

  __int16 v12 = *(void **)(v2 + 32);
LABEL_31:
  uint64_t v30 = v12[16];
  __int16 v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v32)
    {
      __int16 v33 = [v39 engineID];
      __int16 v34 = [*(id *)(v11 + 32) sessionID];
      uint64_t v36 = *(void *)(v11 + 48);
      uint64_t v35 = *(void *)(v11 + 56);
      *(_DWORD *)buf = 138544130;
      v45 = v33;
      __int16 v46 = 2114;
      v47 = v34;
      __int16 v48 = 2048;
      uint64_t v49 = v35;
      __int16 v50 = 2114;
      uint64_t v51 = v36;
      _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidAddItems:inSection:%{public}@ | editing [data source added items]", buf, 0x2Au);

LABEL_36:
    }
  }
  else if (v32)
  {
    __int16 v33 = [v39 engineID];
    uint64_t v37 = [*(id *)(v11 + 32) sessionID];
    *(_DWORD *)buf = 138543618;
    v45 = v33;
    __int16 v46 = 2114;
    v47 = v37;
    _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:inSection: | ignoring SIL change [state: Loading]", buf, 0x16u);

    goto LABEL_36;
  }
}

void __97___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidRemoveItems_fromSection___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        id v8 = [v2 eventStream];
        uint64_t v9 = *(void *)(a1 + 48);
        v29[0] = @"queue-section-id";
        v29[1] = @"queue-item-id";
        v30[0] = v9;
        v30[1] = v7;
        int v10 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        [v8 emitEventType:@"queue-item-remove" payload:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v4);
  }

  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [v2 engineID];
    uint64_t v13 = [*(id *)(a1 + 32) sessionID];
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    __int16 v22 = v12;
    __int16 v23 = 2114;
    uint64_t v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    uint64_t v28 = v15;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidRemoveItems:inSection:%{public}@ | editing [data source removed items]", buf, 0x2Au);
  }
}

void __98___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidEndTransactionForSection___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  uint64_t v3 = v2;
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    uint64_t v4 = [v2 beginEditWithReason:@"BehaviorMusic-dataSourceDidEndTransaction"];
    uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v3 engineID];
      uint64_t v7 = [*(id *)(a1 + 32) sessionID];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v14 = 138544130;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      long long v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidEndTransactionForSection:%{public}@ | committing edit [data source ended transaction]", (uint8_t *)&v14, 0x2Au);
    }
    [v4 commit];
    [*(id *)(a1 + 32) _evaluateLoadingDataSourceItemThresholds];
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v3 engineID];
      uint64_t v11 = [*(id *)(a1 + 32) sessionID];
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      long long v17 = v11;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidEndTransactionForSection:%{public}@ | ignoring SIL change [state: Loading]", (uint8_t *)&v14, 0x2Au);
    }
  }
}

void __90___MPCQueueControllerBehaviorMusic_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 104) == 9)
  {
    *(unsigned char *)(v3 + 41) = 1;
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v2 engineID];
      uint64_t v6 = [*(id *)(a1 + 32) sessionID];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v5;
      __int16 v16 = 2114;
      long long v17 = v6;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] loadRepresentationForArtworkCatalog:completionHandler: | evaluating autoPlayIsTriggered [loading artwork for autoPlayPlaceholder] triggered=YES", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _transitionToAutoPlayState:9];
    uint64_t v7 = @"AutoPlayArtwork - AutoPlay triggered";
  }
  else
  {
    uint64_t v7 = @"AutoPlayArtwork - Trigger is not needed";
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F07F80];
  uint64_t v13 = v7;
  int v10 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v11 = [v9 errorWithDomain:@"MPCMusicBehaviorError" code:7 userInfo:v10];
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
}

void __68___MPCQueueControllerBehaviorMusic_clearAllItemsAfterContentItemID___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) host];
  [v1 upNextBehaviorDidChange];
}

void __67___MPCQueueControllerBehaviorMusic_removeContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) host];
  [v1 upNextBehaviorDidChange];
}

void __85___MPCQueueControllerBehaviorMusic_moveContentItemID_beforeContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) host];
  [v1 upNextBehaviorDidChange];
}

void __84___MPCQueueControllerBehaviorMusic_moveContentItemID_afterContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) host];
  [v1 upNextBehaviorDidChange];
}

void __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_487(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2_488;
  v9[3] = &unk_2643C00A0;
  uint64_t v18 = *(void *)(a1 + 88);
  id v10 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 64);
  char v19 = *(unsigned char *)(a1 + 96);
  id v15 = *(id *)(a1 + 72);
  id v7 = *(id *)(a1 + 80);
  id v16 = v3;
  id v17 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2_488(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(a1 + 96) & 2) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) shuffleType];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 40) engineID];
        uint64_t v6 = [*(id *)(a1 + 48) sessionID];
        id v7 = MPShuffleTypeDescription();
        id v8 = [*(id *)(a1 + 56) preferredStartItemIdentifier];
        uint64_t v9 = [*(id *)(a1 + 56) sectionIdentifier];
        int v35 = 138544386;
        uint64_t v36 = v5;
        __int16 v37 = 2114;
        __int16 v38 = v6;
        __int16 v39 = 2114;
        long long v40 = v7;
        __int16 v41 = 2114;
        long long v42 = v8;
        __int16 v43 = 2114;
        v44 = v9;
        _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | setting shuffle type [first data source loaded] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", (uint8_t *)&v35, 0x34u);
      }
      *(void *)(*(void *)(a1 + 48) + 72) = v3;
      id v10 = *(void **)(*(void *)(a1 + 48) + 88);
      id v11 = [*(id *)(a1 + 56) preferredStartItemIdentifier];
      uint64_t v12 = [*(id *)(a1 + 56) sectionIdentifier];
      [v10 setShuffleType:v3 startingItem:v11 inSection:v12];

      [*(id *)(a1 + 48) _emitEventsForPlaybackBehaviorChangeIfNeeded];
      [*(id *)(a1 + 64) behavior:*(void *)(a1 + 48) didChangeShuffleType:v3];
    }
  }
  if (*(unsigned char *)(a1 + 104))
  {
    id v13 = [*(id *)(a1 + 56) preferredStartItemIdentifier];

    if (v13)
    {
      id v14 = [*(id *)(a1 + 56) sectionIdentifier];
      id v15 = [*(id *)(a1 + 56) preferredStartItemIdentifier];
      id v16 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v14 itemID:v15];

      id v17 = [v16 contentItemID];
      [*(id *)(a1 + 72) setSuggestedContentItemIDForStart:v17];
      uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        char v19 = [*(id *)(a1 + 40) engineID];
        __int16 v20 = [*(id *)(a1 + 48) sessionID];
        uint64_t v21 = *(void **)(a1 + 72);
        int v35 = 138544130;
        uint64_t v36 = v19;
        __int16 v37 = 2114;
        __int16 v38 = v20;
        __int16 v39 = 2114;
        long long v40 = v17;
        __int16 v41 = 2114;
        long long v42 = v21;
        _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@ edit=%{public}@", (uint8_t *)&v35, 0x2Au);
      }
    }
  }
  if (*(void *)(*(void *)(a1 + 48) + 128) != 1)
  {
    uint64_t v22 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = [*(id *)(a1 + 40) engineID];
      uint64_t v24 = [*(id *)(a1 + 48) sessionID];
      int v35 = 138543618;
      uint64_t v36 = v23;
      __int16 v37 = 2114;
      __int16 v38 = v24;
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v35, 0x16u);
    }
    *(void *)(*(void *)(a1 + 48) + 128) = 1;
  }
  __int16 v25 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [*(id *)(a1 + 40) engineID];
    __int16 v27 = [*(id *)(a1 + 48) sessionID];
    uint64_t v28 = *(void **)(a1 + 72);
    int v35 = 138543874;
    uint64_t v36 = v26;
    __int16 v37 = 2114;
    __int16 v38 = v27;
    __int16 v39 = 2114;
    long long v40 = v28;
    _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | committing edit [added data source] edit=%{public}@", (uint8_t *)&v35, 0x20u);
  }
  [*(id *)(a1 + 72) commit];
  if (*(void *)(a1 + 88))
  {
    int v29 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [*(id *)(a1 + 40) engineID];
      __int16 v31 = [*(id *)(a1 + 48) sessionID];
      int v35 = 138543618;
      uint64_t v36 = v30;
      __int16 v37 = 2114;
      __int16 v38 = v31;
      _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | calling completion [added data source]", (uint8_t *)&v35, 0x16u);
    }
    uint64_t v32 = objc_msgSend(*(id *)(a1 + 80), "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"adding data source failed");
    uint64_t v33 = *(void *)(a1 + 88);
    __int16 v34 = [*(id *)(a1 + 56) preferredStartContentItemID];
    (*(void (**)(uint64_t, void *, void *))(v33 + 16))(v33, v34, v32);
  }
}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, v6, @"Failed to build playback context from queue: %@", *(void *)(a1 + 32));
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) associatedParticipantIdentifier];
    [v5 setAssociatedParticipantIdentifier:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [*(id *)(a1 + 40) contentItemID];
      if (v9)
      {
        id v10 = [*(id *)(a1 + 48) _itemForContentItemID:v9];
        if (([v10 isPlaceholder] & 1) == 0)
        {
          id v11 = [v10 modelGenericObject];
          if (v11)
          {
            id v12 = v5;
            id v13 = +[MPCModelRadioContentReference referenceWithMPModelObject:v11];
            [v12 setNowPlayingContentReference:v13];
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v5;
      if ([v14 allowsJumpToIt])
      {
        id v15 = [v14 startItemIdentifiers];
        BOOL v16 = v15 != 0;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
    char v19 = [*(id *)(a1 + 40) mediaRemoteOptions];
    __int16 v20 = [v19 objectForKeyedSubscript:@"_MPCOverrideAllowsInsertionPositionLast"];
    int v21 = [v20 BOOLValue];

    int v22 = _os_feature_enabled_impl();
    uint64_t v23 = v16 | 0x40;
    if (v21) {
      uint64_t v23 = v16;
    }
    if (v22) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = v16;
    }
    __int16 v25 = *(_WORD *)(*(void *)(a1 + 48) + 10);
    uint64_t v26 = [*(id *)(a1 + 40) insertionPosition];
    if (v26 == 2 && (v25 & 1) != 0 && (v21 & 1) == 0)
    {
      uint64_t v27 = *(void *)(a1 + 64);
      uint64_t v28 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 6, @"Cannot insert at Last position in AutoPlay.");
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
    }
    else
    {
      int v29 = [*(id *)(a1 + 40) insertAfterContentItemID];
      uint64_t v30 = v29;
      if (!v29) {
        uint64_t v30 = *(void **)(a1 + 56);
      }
      id v31 = v30;

      int v32 = _os_feature_enabled_impl();
      uint64_t v33 = *(void **)(a1 + 48);
      if (v32)
      {
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_2;
        v47[3] = &unk_2643C2300;
        id v48 = v5;
        id v49 = *(id *)(a1 + 64);
        objc_msgSend(v33, "_qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v48, v26, v31, 0, v24, v47);

        __int16 v34 = v48;
      }
      else
      {
        __int16 v34 = [*(id *)(a1 + 48) _componentsForContentItemID:v31];
        char v35 = [v34 behaviorFlags];
        long long v40 = *(void **)(a1 + 48);
        if (v35)
        {
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_3;
          v44[3] = &unk_2643C6110;
          uint64_t v36 = &v45;
          id v39 = v5;
          id v45 = v39;
          __int16 v38 = &v46;
          id v46 = *(id *)(a1 + 64);
          [v40 _addAutoPlayPlaybackContext:v39 atPosition:v26 afterContentItemID:v31 sectionIdentifier:0 actions:v24 completion:v44];
        }
        else
        {
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_4;
          v41[3] = &unk_2643C6110;
          uint64_t v36 = &v42;
          id v37 = v5;
          id v42 = v37;
          __int16 v38 = &v43;
          id v43 = *(id *)(a1 + 64);
          [v40 _addPlaybackContext:v37 atPosition:v26 afterContentItemID:v31 sectionIdentifier:0 actions:v24 completion:v41];
        }
      }
    }
  }
}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 6, @"Failed to insert playback context: %@", *(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 6, @"Failed to insert [into autoplay list] playback context: %@", *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 6, @"Failed to insert playback context: %@", *(void *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11 || a2)
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 40)
    || (unint64_t)[*(id *)(v12 + 120) count] > 1
    || [*(id *)(*(void *)(a1 + 32) + 88) shuffleType])
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
    v13();
    goto LABEL_9;
  }
  id v14 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  id v15 = [v14 firstObject];

  id v16 = [v15 playbackContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v18 = [*(id *)(a1 + 32) _playbackContextOptions];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_2;
    v21[3] = &unk_2643C3C70;
    id v24 = *(id *)(a1 + 48);
    id v19 = v16;
    uint64_t v20 = *(void *)(a1 + 32);
    id v22 = v19;
    uint64_t v23 = v20;
    [v17 getMusicPlaybackContextWithOptions:v18 completion:v21];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_9:
}

void __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v7 isReusableForPlaybackContext:*(void *)(a1 + 32)])
    {
      id v8 = [v7 startItemIdentifiers];
      if (v8)
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_3;
        v10[3] = &unk_2643C0028;
        id v9 = *(void **)(a1 + 40);
        id v11 = *(id *)(a1 + 48);
        [v9 findFirstContentItemIDForItemIntersectingIdentifierSet:v8 completion:v10];
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t, __CFString *, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0, a2, @"same queue [new start item]", a3);
}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 startItemIdentifiers];

      if (v8)
      {
        id v9 = [v7 startItemIdentifiers];
        id v10 = [v7 request];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v12 = [v7 request];
        if (isKindOfClass)
        {
          v40[0] = v9;
          id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
          [v12 setAllowedItemIdentifiers:v13];

          [v7 setRequest:v12];
        }
        else
        {
          objc_opt_class();
          char v16 = objc_opt_isKindOfClass();

          if ((v16 & 1) == 0)
          {
            uint64_t v21 = *(void *)(a1 + 40);
            id v22 = (void *)MEMORY[0x263F087E8];
            uint64_t v23 = [v7 request];
            id v24 = objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"attempt to Play Now unsupported request type: %@", objc_opt_class());
            (*(void (**)(uint64_t, void, void, void, void *))(v21 + 16))(v21, 0, 0, 0, v24);

LABEL_21:
            goto LABEL_22;
          }
          uint64_t v12 = [v7 request];
          uint64_t v17 = [v12 identifiers];
          uint64_t v18 = [v17 indexPathForItemWithIdentifiersIntersectingSet:v9];
          id v19 = v18;
          if (v18)
          {
            uint64_t v20 = objc_msgSend(v17, "sectionAtIndex:", objc_msgSend(v18, "msv_section"));
          }
          else if ([v17 totalItemCount] == 1)
          {
            uint64_t v20 = [v17 firstItem];
            __int16 v25 = [v20 modelKind];
            uint64_t v26 = [v25 modelClass];

            if (v26 != objc_opt_class() || v26 != objc_opt_class())
            {
              id v37 = [NSString stringWithFormat:@"MusicBehavior-PlayNowSection[%@]", v26];
              id v35 = objc_alloc(MEMORY[0x263F11DB0]);
              uint64_t v27 = [MEMORY[0x263F11F00] identityKind];
              uint64_t v28 = (void *)[v35 initWithSource:v37 modelKind:v27 block:&__block_literal_global_382];
              uint64_t v36 = [v28 unionSet:v20];

              uint64_t v20 = (void *)v36;
            }
          }
          else
          {
            id v29 = objc_alloc(MEMORY[0x263F11DB0]);
            uint64_t v30 = [MEMORY[0x263F11F00] identityKind];
            uint64_t v20 = (void *)[v29 initWithSource:@"MusicBehavior-PlayNowSection" modelKind:v30 block:&__block_literal_global_388];
          }
          id v31 = objc_alloc_init(MEMORY[0x263F120D8]);
          [v31 appendSection:v20];
          [v31 appendItem:v9];
          [v12 setIdentifiers:v31];
          [v7 setRequest:v12];
        }
        int v32 = *(void **)(a1 + 32);
        uint64_t v33 = v32[18];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_4;
        v38[3] = &unk_2643C0028;
        id v39 = *(id *)(a1 + 40);
        objc_msgSend(v32, "_qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v7, 0, v33, 0, 1, v38);

        goto LABEL_21;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 10, @"missing startItemIdentifiers", v34);
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 40);
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 10, @"unsupported playback context: %@", objc_opt_class());
    id v15 = };
    (*(void (**)(uint64_t, void, void, void, void *))(v14 + 16))(v14, 0, 0, 0, v15);

LABEL_22:
    goto LABEL_23;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_23:
}

uint64_t __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v5 = [v2 UUID];
  id v4 = [v5 UUIDString];
  [v3 setOpaqueID:v4];
}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v5 = [v2 UUID];
  id v4 = [v5 UUIDString];
  [v3 setOpaqueID:v4];
}

void __78___MPCQueueControllerBehaviorMusic_prepareForCreateStationAfterContentItemID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) engineID];
    id v9 = [*(id *)(a1 + 40) sessionID];
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] prepareForCreateStationAfterContentItemID: | freezing section [create station] sectionID=%{public}@", (uint8_t *)&v10, 0x20u);
  }
  [v6 setFrozen:1];
}

void __102___MPCQueueControllerBehaviorMusic_findFirstContentItemIDForItemIntersectingIdentifierSet_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v12 = a3;
  id v6 = [v12 firstItemIntersectingIdentifierSet:*(void *)(a1 + 32)];
  if (v6)
  {
    id v7 = [v12 sectionIdentifier];
    id v8 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v7 itemID:v6];

    uint64_t v9 = [v8 contentItemID];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __94___MPCQueueControllerBehaviorMusic_isExportableSessionType_forContentItemID_extension_reason___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 dataSource];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v6 containsTransportableContentWithReason:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_263(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) engineID];
      char v8 = [WeakRetained sessionID];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v15 = 138544386;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [adding playback context failed] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x34u);
    }
    id v11 = objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 2, @"failed to add original playback context (dataSource requested shouldAddOriginalPlaybackContextAfterReplacement)");

    [*(id *)(a1 + 56) addObject:v11];
  }
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 80);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_END, v14, "QC-FinalizeDataSource-Add", "", (uint8_t *)&v15, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_267(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) engineID];
      char v8 = [WeakRetained sessionID];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v15 = 138544386;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      id v24 = v4;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [adding playback context failed (autoplay SIL)] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x34u);
    }
    id v11 = objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 2, @"failed to add original playback context to autoplay SIL (dataSource requested shouldAddOriginalPlaybackContextAfterReplacement)");

    [*(id *)(a1 + 56) addObject:v11];
  }
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 80);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v13, OS_SIGNPOST_INTERVAL_END, v14, "QC-FinalizeDataSource-Add", "", (uint8_t *)&v15, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  char v8 = [v6 sectionIdentifier];
  uint64_t v9 = [v7 _identifierListForSection:v8];

  if (([*(id *)(a1 + 32) autoPlayEnabled] & 1) != 0 || v9 != *(void **)(*(void *)(a1 + 32) + 96))
  {
    if ([v6 shouldRequestAdditionalItemsAtTail])
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      uint64_t v10 = *(void *)(a1 + 64);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_2;
      v13[3] = &unk_2643BFEE8;
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      id v14 = v11;
      uint64_t v15 = v12;
      id v16 = v5;
      id v17 = *(id *)(a1 + 40);
      [v6 loadAdditionalItemsIfNeededWithCount:v10 completion:v13];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) engineID];
    id v6 = [*(id *)(a1 + 40) sessionID];
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] loadAdditionalUpcomingItems:completion: | load additional completed [] loaded=%{BOOL}u sectionID=%{public}@", (uint8_t *)&v8, 0x26u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __62___MPCQueueControllerBehaviorMusic_preferredUpcomingItemCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v12 = v4;
  id v6 = [v4 sectionIdentifier];
  uint64_t v7 = [v5 _identifierListForSection:v6];

  int v8 = *(void **)(a1 + 32);
  if ((v7 != (void *)v8[12]
     || [v8 autoPlayEnabled] && !*(void *)(*(void *)(a1 + 32) + 64))
    && [v12 shouldRequestAdditionalItemsAtTail])
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v10 = [v12 prefetchThreshold];
    if (v9 <= v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  }
}

void __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke(id *a1, void *a2, void *a3)
{
  v47[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 1, @"Failed to convert playback queue to playback context");

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    uint64_t v9 = [a1[4] associatedParticipantIdentifier];
    [v5 setAssociatedParticipantIdentifier:v9];

    uint64_t v10 = [a1[5] host];
    uint64_t v11 = +[MPCPlaybackAccountManager sharedManager];
    id v12 = [v5 userIdentity];
    int v13 = [v11 accountForUserIdentity:v12];

    uint64_t v14 = [v13 hashedDSID];
    uint64_t v36 = v10;
    id v39 = [v10 eventStream];
    v46[0] = @"account-id";
    uint64_t v15 = v14;
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v34 = (void *)v15;
    v46[1] = @"queue-reporting-metadata";
    v47[0] = v15;
    v44[0] = @"queue-grouping-id";
    uint64_t v16 = [v5 playActivityQueueGroupingID];
    id v35 = (void *)v16;
    if (!v16)
    {
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v33 = (void *)v16;
    v45[0] = v16;
    v44[1] = @"feature-name";
    uint64_t v17 = [v5 playActivityFeatureName];
    uint64_t v18 = (void *)v17;
    if (!v17)
    {
      uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    }
    int v32 = (void *)v17;
    v45[1] = v17;
    v44[2] = @"reco-data";
    uint64_t v19 = [v5 playActivityRecommendationData];
    uint64_t v20 = (void *)v19;
    if (!v19)
    {
      uint64_t v19 = [MEMORY[0x263EFF9D0] null];
    }
    id v37 = (void *)v14;
    v45[2] = v19;
    v44[3] = @"siri-ref-id";
    __int16 v21 = objc_msgSend(v5, "siriReferenceIdentifier", v19);
    uint64_t v22 = v21;
    if (!v21)
    {
      uint64_t v22 = [MEMORY[0x263EFF9D0] null];
    }
    __int16 v38 = v13;
    v45[3] = v22;
    void v44[4] = @"siri-wha-metrics";
    __int16 v23 = [v5 siriWHAMetricsInfo];
    id v24 = v23;
    if (!v23)
    {
      id v24 = [MEMORY[0x263EFF9D0] null];
    }
    v45[4] = v24;
    uint64_t v25 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];
    v47[1] = v25;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
    [v39 emitEventType:@"session-will-begin" payload:v26];

    if (!v23) {
    if (!v21)
    }

    if (!v20) {
    if (!v18)
    }

    if (!v35) {
    if (!v37)
    }

    [a1[5] _emitEventsForPlaybackBehaviorChangeIfNeeded];
    uint64_t v27 = [a1[5] sessionID];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    void v40[2] = __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke_2;
    v40[3] = &unk_2643C59E0;
    id v41 = v36;
    id v42 = v27;
    id v28 = a1[5];
    id v43 = a1[6];
    id v29 = v27;
    id v30 = v36;
    [v28 _addPlaybackContext:v5 atPosition:2 afterContentItemID:0 sectionIdentifier:0 actions:55 completion:v40];

    int v8 = v38;
  }
}

void __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) engineID];
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = objc_msgSend(v3, "msv_description");
      int v16 = 138543874;
      uint64_t v17 = v6;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      __int16 v21 = v8;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] loadWithPlaybackContext:completionHandler: | completed [first data source] error=%{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) engineID];
    uint64_t v10 = *(void *)(a1 + 40);
    int v16 = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] loadWithPlaybackContext:completionHandler: | completed [first data source]", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v11 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x263F88FA0], 140);

  if (v11)
  {
    id v12 = @"addPlaybackContext failed [radio server error]";
    int v13 = v3;
    uint64_t v14 = 9;
  }
  else
  {
    id v12 = @"addPlaybackContext failed";
    int v13 = v3;
    uint64_t v14 = 1;
  }
  uint64_t v15 = objc_msgSend(v13, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", v14, v12);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __56___MPCQueueControllerBehaviorMusic_canLoadQueue_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSURL URLWithString:a2];
  id v3 = [v2 scheme];
  BOOL v4 = v3 != 0;

  return v4;
}

@end