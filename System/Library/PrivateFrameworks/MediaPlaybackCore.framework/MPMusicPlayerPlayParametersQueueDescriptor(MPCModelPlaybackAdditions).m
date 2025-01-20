@interface MPMusicPlayerPlayParametersQueueDescriptor(MPCModelPlaybackAdditions)
- (MPCModelPlaybackContext)_classicalMusicAppPlaybackContextForPlayParametersQueue:()MPCModelPlaybackAdditions;
- (MPCModelPlaybackContext)_playbackContextForStorePlayParameters:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:containsStartItem:;
- (id)_libraryItemsForPlayParameters:()MPCModelPlaybackAdditions;
- (id)playbackContexts;
- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions;
- (void)_configureiTunesLibraryRequest:()MPCModelPlaybackAdditions forLibraryItems:;
- (void)_updatePlaybackContextsForPlaybackParametersQueue:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:storePlayParameters:contexts:containsStartItem:;
@end

@implementation MPMusicPlayerPlayParametersQueueDescriptor(MPCModelPlaybackAdditions)

- (uint64_t)matchesStartItem:()MPCModelPlaybackAdditions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 startItemPlayParameters];

  if (v5)
  {
    v6 = [a1 startItemPlayParameters];
    v7 = [v6 itemKind];
    char v8 = [v7 isEqualToString:*MEMORY[0x263F11CA8]];

    if ((v8 & 1) == 0)
    {
      v10 = [a1 startItemPlayParameters];
      v11 = [v10 persistentID];

      v12 = [a1 startItemPlayParameters];
      id v13 = [v12 catalogID];

      v14 = [a1 startItemPlayParameters];
      id v15 = [v14 libraryID];

      if ([v4 persistentID])
      {
        uint64_t quot = [v4 persistentID];
        uint64_t v17 = quot;
        v18 = (char *)&v29 + 1;
        do
        {
          lldiv_t v19 = lldiv(quot, 10);
          uint64_t quot = v19.quot;
          if (v19.rem >= 0) {
            LOBYTE(v20) = v19.rem;
          }
          else {
            uint64_t v20 = -v19.rem;
          }
          *(v18 - 2) = v20 + 48;
          v21 = (const UInt8 *)(v18 - 2);
          --v18;
        }
        while (v19.quot);
        if (v17 < 0)
        {
          *(v18 - 2) = 45;
          v21 = (const UInt8 *)(v18 - 2);
        }
        v22 = (__CFString *)CFStringCreateWithBytes(0, v21, (char *)&v29 - (char *)v21, 0x8000100u, 0);
      }
      else
      {
        v22 = &stru_26CBCA930;
      }
      id v23 = [v4 cloudUniversalLibraryID];
      if (v15 == v23)
      {
        uint64_t v9 = 1;
        v25 = v15;
      }
      else
      {
        char v24 = [v15 isEqual:v23];

        if (v24)
        {
          uint64_t v9 = 1;
LABEL_24:

          goto LABEL_25;
        }
        id v26 = [v4 storeItemID];
        if (v13 == v26)
        {

          uint64_t v9 = 1;
          v25 = v13;
        }
        else
        {
          v25 = v26;
          char v27 = [v13 isEqual:v26];

          uint64_t v9 = 1;
          if ((v27 & 1) == 0 && v11 != v22) {
            uint64_t v9 = [(__CFString *)v11 isEqual:v22];
          }
        }
      }

      goto LABEL_24;
    }
  }
  uint64_t v9 = 1;
LABEL_25:

  return v9;
}

- (MPCModelPlaybackContext)_classicalMusicAppPlaybackContextForPlayParametersQueue:()MPCModelPlaybackAdditions
{
  v117[0] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v114 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating store playback context for classical music app: %{public}@", buf, 0xCu);
  }

  v6 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
  id v7 = objc_alloc(MEMORY[0x263F11DD0]);
  char v8 = [MEMORY[0x263F11E40] deviceMediaLibrary];
  uint64_t v9 = (void *)[v7 initWithLibrary:v8];

  id v10 = objc_alloc(MEMORY[0x263F12180]);
  v111[0] = *MEMORY[0x263F11A18];
  v11 = [MEMORY[0x263F12180] emptyPropertySet];
  v112[0] = v11;
  v111[1] = *MEMORY[0x263F11998];
  v12 = [MEMORY[0x263F12180] emptyPropertySet];
  v112[1] = v12;
  v111[2] = *MEMORY[0x263F119D8];
  id v13 = [MEMORY[0x263F12180] emptyPropertySet];
  v112[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3];
  v103 = (void *)[v10 initWithProperties:MEMORY[0x263EFFA68] relationships:v14];

  id v15 = [a1 playParametersQueue];
  if ([v15 count] != 1)
  {

LABEL_8:
    id v26 = [a1 containerPlayParameters];

    char v27 = (void *)&unk_21BEF1000;
    if (!v26)
    {
      v18 = 0;
      goto LABEL_29;
    }
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [a1 containerPlayParameters];
      v30 = [a1 containerPlayParameters];
      v31 = [v30 identifiers];
      *(_DWORD *)buf = 138543618;
      v114 = v29;
      __int16 v115 = 2114;
      v116 = v31;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "MusicKit: Attempting to create container item for container play params: %{public}@ with identifiers: %{public}@", buf, 0x16u);
    }
    v32 = [a1 containerPlayParameters];
    v33 = [v32 identifiers];
    v34 = [v9 identifiersMatchingIdentifierSet:v33 propertySet:v103 options:0 error:0];

    if (!v34)
    {
      v35 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [a1 containerPlayParameters];
        v37 = [v36 identifiers];
        *(_DWORD *)buf = 138543362;
        v114 = v37;
        _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "MusicKit: Could not find identifiers in library object database for identifiers: %{public}@", buf, 0xCu);
      }
      v38 = [a1 containerPlayParameters];
      v39 = [v38 identifiers];

      v40 = [MEMORY[0x263F893C0] activeAccount];
      id v41 = (id)*MEMORY[0x263F89090];
      if ([MEMORY[0x263F54ED8] hasBoolEntitlement:@"com.apple.accounts.appleaccount.fullaccess"])
      {
        v42 = v9;
        v43 = v4;
        v44 = [MEMORY[0x263F893C8] defaultIdentityStore];
        v45 = [v44 DSIDForUserIdentity:v40 outError:0];
        v46 = [v45 stringValue];

        if ([v46 length])
        {
          id v47 = v46;

          id v41 = v47;
        }
        id v4 = v43;
        uint64_t v9 = v42;

        char v27 = &unk_21BEF1000;
      }
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = v27[136];
      v107[2] = __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_131;
      v107[3] = &unk_2643C49D8;
      id v108 = v41;
      id v48 = v41;
      v34 = (MPCModelPlaybackContext *)[v39 copyWithSource:@"MusicPlayerPlayParams+PersonAddition" block:v107];
    }
    v49 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v114 = v34;
      _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating container with container identifiers: %{public}@", buf, 0xCu);
    }

    v50 = [a1 containerPlayParameters];
    v51 = [v50 itemKind];
    char v52 = [v51 isEqualToString:*MEMORY[0x263F11C98]];

    if (v52)
    {
      v53 = (Class *)0x263F11E80;
    }
    else
    {
      v54 = [a1 containerPlayParameters];
      v55 = [v54 itemKind];
      int v56 = [v55 isEqualToString:*MEMORY[0x263F11CA0]];

      if (!v56)
      {
        v18 = 0;
        goto LABEL_28;
      }
      v53 = (Class *)0x263F11F98;
    }
    v18 = (MPCModelPlaybackContext *)[objc_alloc(*v53) initWithIdentifiers:v34];
LABEL_28:

LABEL_29:
    v21 = v4;
    lldiv_t v19 = [(MPCModelPlaybackContext *)v4 msv_compactMap:&__block_literal_global_137];
    v104[0] = MEMORY[0x263EF8330];
    v104[1] = v27[136];
    v104[2] = __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_2_138;
    v104[3] = &unk_2643C1658;
    uint64_t v20 = v9;
    id v105 = v9;
    id v106 = v103;
    v57 = objc_msgSend(v19, "msv_compactMap:", v104);
    objc_msgSend(v57, "msv_compactMap:", &__block_literal_global_141);
    v58 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v59 = (MPCModelPlaybackContext *)objc_alloc_init(MEMORY[0x263F120D8]);
      [(MPCModelPlaybackContext *)v59 appendSection:v18];
      [(MPCModelPlaybackContext *)v59 appendItems:v58];
      [(MPCModelStorePlaybackItemsRequest *)v6 setSectionedModelObjects:v59];
      v60 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v114 = v18;
        __int16 v115 = 2114;
        v116 = v58;
        v61 = "MusicKit: Created SPIR with container: %{public}@ and items %{public}@";
        v62 = v60;
        uint32_t v63 = 22;
LABEL_34:
        _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);
      }
    }
    else
    {
      objc_msgSend(v57, "msv_compactMap:", &__block_literal_global_146);
      v59 = (MPCModelPlaybackContext *)objc_claimAutoreleasedReturnValue();
      [(MPCModelStorePlaybackItemsRequest *)v6 setStoreIDs:v59];
      v60 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v59;
        v61 = "MusicKit: Created SPIR with storeIDs %{public}@";
        v62 = v60;
        uint32_t v63 = 12;
        goto LABEL_34;
      }
    }

    v22 = 0;
    char v24 = v105;
    goto LABEL_36;
  }
  v16 = [a1 containerPlayParameters];

  if (v16) {
    goto LABEL_8;
  }
  uint64_t v17 = [a1 playParametersQueue];
  v18 = [v17 firstObject];

  lldiv_t v19 = [(MPCModelPlaybackContext *)v18 itemKind];
  uint64_t v20 = v9;
  if (![v19 isEqualToString:*MEMORY[0x263F11CA8]])
  {
    v21 = v4;
    if ([(MPCModelPlaybackContext *)v18 isLibraryContent]) {
      [(MPCModelPlaybackContext *)v18 catalogID];
    }
    else {
    uint64_t v82 = [(MPCModelPlaybackContext *)v18 itemID];
    }
    char v24 = (void *)v82;
    if (v82)
    {
      uint64_t v110 = v82;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v110 count:1];
      [(MPCModelStorePlaybackItemsRequest *)v6 setStoreIDs:v25];
LABEL_77:
      v22 = 0;
      goto LABEL_78;
    }
    v83 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v114 = v4;
      __int16 v115 = 2114;
      v116 = v18;
      _os_log_impl(&dword_21BB87000, v83, OS_LOG_TYPE_FAULT, "MusicKit: Unable to set store ids for classical music app for queue: %{public}@ with first item play parameters: %{public}@", buf, 0x16u);
    }

    v84 = [(MPCModelPlaybackContext *)v18 identifiers];
    v25 = [v20 identifiersMatchingIdentifierSet:v84 propertySet:v103 options:0 error:0];

    if (!v25)
    {
      v25 = [(MPCModelPlaybackContext *)v18 identifiers];
    }
    v85 = [v25 universalStore];
    uint64_t v86 = [v85 subscriptionAdamID];

    v87 = [v25 universalStore];
    v88 = v87;
    if (v86)
    {
      uint64_t quot = [v87 subscriptionAdamID];
      uint64_t v90 = quot;
      v91 = (char *)v117 + 1;
      do
      {
        lldiv_t v92 = lldiv(quot, 10);
        uint64_t quot = v92.quot;
        if (v92.rem >= 0) {
          LOBYTE(v93) = v92.rem;
        }
        else {
          uint64_t v93 = -v92.rem;
        }
        *(v91 - 2) = v93 + 48;
        v94 = (const UInt8 *)(v91 - 2);
        --v91;
      }
      while (v92.quot);
    }
    else
    {
      uint64_t v95 = [v87 adamID];

      v96 = [v25 universalStore];
      v88 = v96;
      if (!v95)
      {
        v102 = [v96 globalPlaylistID];
        char v24 = (void *)[v102 length];

        if (!v24) {
          goto LABEL_77;
        }
        v88 = [v25 universalStore];
        uint64_t v100 = [v88 globalPlaylistID];
LABEL_75:
        char v24 = (void *)v100;

        if (v24)
        {
          v109 = v24;
          v101 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
          [(MPCModelStorePlaybackItemsRequest *)v6 setStoreIDs:v101];
        }
        goto LABEL_77;
      }
      uint64_t v97 = [v96 adamID];
      uint64_t v90 = v97;
      v91 = (char *)v117 + 1;
      do
      {
        lldiv_t v98 = lldiv(v97, 10);
        uint64_t v97 = v98.quot;
        if (v98.rem >= 0) {
          LOBYTE(v99) = v98.rem;
        }
        else {
          uint64_t v99 = -v98.rem;
        }
        *(v91 - 2) = v99 + 48;
        v94 = (const UInt8 *)(v91 - 2);
        --v91;
      }
      while (v98.quot);
    }
    if (v90 < 0)
    {
      *(v91 - 2) = 45;
      v94 = (const UInt8 *)(v91 - 2);
    }
    uint64_t v100 = (uint64_t)CFStringCreateWithBytes(0, v94, (char *)v117 - (char *)v94, 0x8000100u, 0);
    goto LABEL_75;
  }
  v21 = v4;
  v22 = objc_alloc_init(MPCModelRadioPlaybackContext);
  id v23 = objc_alloc(MEMORY[0x263F11FD8]);
  char v24 = [(MPCModelPlaybackContext *)v18 identifiers];
  v25 = (void *)[v23 initWithIdentifiers:v24 block:&__block_literal_global_121_13756];
  [(MPCModelRadioPlaybackContext *)v22 setRadioStation:v25];
LABEL_78:

LABEL_36:
  v64 = [(MPCModelStorePlaybackItemsRequest *)v6 sectionedModelObjects];
  if (v64)
  {
  }
  else
  {
    v65 = [(MPCModelStorePlaybackItemsRequest *)v6 storeIDs];

    if (!v65)
    {
      v66 = (MPCModelPlaybackContext *)v22;
      goto LABEL_42;
    }
  }
  v66 = objc_alloc_init(MPCModelPlaybackContext);
  [(MPCModelPlaybackContext *)v66 setRequest:v6];
  v67 = [a1 startItemPlayParameters];

  if (v67)
  {
    v68 = [a1 startItemPlayParameters];
    v69 = [v68 identifiers];
    [(MPCModelPlaybackContext *)v66 setStartItemIdentifiers:v69];
  }
  v70 = [a1 startTimes];
  [(MPCModelPlaybackContext *)v66 setStartTimeModifications:v70];

  v71 = [a1 endTimes];
  [(MPCModelPlaybackContext *)v66 setEndTimeModifications:v71];

  -[MPCModelPlaybackContext setShuffleType:](v66, "setShuffleType:", [a1 shuffleType]);
  -[MPCModelPlaybackContext setRepeatType:](v66, "setRepeatType:", [a1 repeatType]);
  [(MPCModelPlaybackContext *)v66 setAllowsJumpToIt:1];
  v72 = [(MPCModelPlaybackContext *)v66 playbackRequestEnvironment];
  v73 = (void *)[v72 mutableCopy];

  v74 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
  v75 = [v74 clientIdentifier];
  [v73 setClientIdentifier:v75];

  v76 = [v74 clientVersion];
  [v73 setClientVersion:v76];

  [a1 _addRequestingBundleIdentifierToPlaybackRequestEnvironment:v73];
  [(MPCModelPlaybackContext *)v66 setPlaybackRequestEnvironment:v73];

LABEL_42:
  if ([a1 isPrivate]) {
    [(MPCModelPlaybackContext *)v66 setPrivateListeningOverride:MEMORY[0x263EFFA88]];
  }
  v77 = [a1 playActivityFeatureName];
  [(MPCModelPlaybackContext *)v66 setPlayActivityFeatureName:v77];

  v78 = [a1 playActivityRecommendationData];
  [(MPCModelPlaybackContext *)v66 setPlayActivityRecommendationData:v78];

  v79 = [a1 playActivityQueueGroupingID];
  [(MPCModelPlaybackContext *)v66 setPlayActivityQueueGroupingID:v79];

  [(MPCModelPlaybackContext *)v66 setQueueDescriptor:a1];
  v80 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v114 = v66;
    _os_log_impl(&dword_21BB87000, v80, OS_LOG_TYPE_DEFAULT, "MusicKit: Created playback context: %{public}@", buf, 0xCu);
  }

  return v66;
}

- (id)_libraryItemsForPlayParameters:()MPCModelPlaybackAdditions
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identifiers];
  v5 = [v3 itemKind];
  uint64_t v6 = *MEMORY[0x263F11C98];
  if ((([v5 isEqualToString:*MEMORY[0x263F11C98]] & 1) != 0
     || [v5 isEqualToString:*MEMORY[0x263F11CA0]])
    && ![v3 isLibraryContent]
    || ([v5 isEqualToString:*MEMORY[0x263F11CA8]] & 1) != 0)
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_38;
  }
  id v7 = [MEMORY[0x263EFF980] array];
  id v105 = v5;
  if ([v5 isEqual:*MEMORY[0x263F11CA0]])
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = [v4 universalStore];
    id v10 = [v9 globalPlaylistID];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      v12 = (void *)MEMORY[0x263F11E60];
      id v13 = [v4 universalStore];
      v14 = [v13 globalPlaylistID];
      id v15 = [v12 predicateWithValue:v14 forProperty:*MEMORY[0x263F11430]];
      [v8 addObject:v15];
    }
    v16 = [v4 universalStore];
    uint64_t v17 = [v16 universalCloudLibraryID];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      lldiv_t v19 = (void *)MEMORY[0x263F11E60];
      uint64_t v20 = [v4 universalStore];
      v21 = [v20 universalCloudLibraryID];
      v22 = [v19 predicateWithValue:v21 forProperty:*MEMORY[0x263F11438]];
      [v8 addObject:v22];
    }
    id v23 = [v4 library];
    uint64_t v24 = [v23 persistentID];

    if (v24)
    {
      v25 = (void *)MEMORY[0x263F11E60];
      id v26 = NSNumber;
      char v27 = [v4 library];
      v28 = objc_msgSend(v26, "numberWithLongLong:", objc_msgSend(v27, "persistentID"));
      uint64_t v29 = [v25 predicateWithValue:v28 forProperty:*MEMORY[0x263F11478]];
      [v8 addObject:v29];
    }
    v30 = objc_msgSend(MEMORY[0x263F11DE8], "predicateMatchingPredicates:", v8, v4);
    id v31 = objc_alloc(MEMORY[0x263F11E68]);
    v32 = [MEMORY[0x263EFFA08] setWithObject:v30];
    v33 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    v34 = (void *)[v31 initWithFilterPredicates:v32 library:v33];

    [v34 setShouldIncludeNonLibraryEntities:1];
    v35 = v34;
    uint64_t v36 = 6;
LABEL_22:
    [v35 setGroupingType:v36];
LABEL_23:

    v67 = [v34 collections];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v106 objects:v110 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v107 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v7 addObject:v72];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v73 = [v72 items];
              if ([v73 count]) {
                [v7 addObjectsFromArray:v73];
              }
            }
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v106 objects:v110 count:16];
      }
      while (v69);
    }

    id v4 = v104;
    goto LABEL_37;
  }
  int v37 = [v5 isEqual:v6];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v38 = [v4 universalStore];
  uint64_t v39 = [v38 subscriptionAdamID];

  if (v37)
  {
    if (v39)
    {
      v40 = (void *)MEMORY[0x263F11E60];
      id v41 = NSNumber;
      v42 = [v4 universalStore];
      v43 = objc_msgSend(v41, "numberWithLongLong:", objc_msgSend(v42, "subscriptionAdamID"));
      v44 = [v40 predicateWithValue:v43 forProperty:*MEMORY[0x263F113D8]];
      [v8 addObject:v44];

      v45 = (void *)MEMORY[0x263F11E60];
      v46 = NSNumber;
      id v47 = [v4 universalStore];
      id v48 = objc_msgSend(v46, "numberWithLongLong:", objc_msgSend(v47, "subscriptionAdamID"));
      v49 = [v45 predicateWithValue:v48 forProperty:*MEMORY[0x263F113F0]];
      [v8 addObject:v49];
    }
    v50 = [v4 universalStore];
    v51 = [v50 universalCloudLibraryID];
    uint64_t v52 = [v51 length];

    if (v52)
    {
      v53 = (void *)MEMORY[0x263F11E60];
      v54 = [v4 universalStore];
      v55 = [v54 universalCloudLibraryID];
      int v56 = [v53 predicateWithValue:v55 forProperty:*MEMORY[0x263F113D0]];
      [v8 addObject:v56];
    }
    v57 = [v4 library];
    uint64_t v58 = [v57 persistentID];

    if (v58)
    {
      v59 = (void *)MEMORY[0x263F11E60];
      v60 = NSNumber;
      v61 = [v4 library];
      v62 = objc_msgSend(v60, "numberWithLongLong:", objc_msgSend(v61, "persistentID"));
      uint32_t v63 = [v59 predicateWithValue:v62 forProperty:*MEMORY[0x263F11218]];
      [v8 addObject:v63];
    }
    v30 = objc_msgSend(MEMORY[0x263F11DE8], "predicateMatchingPredicates:", v8, v4);
    id v64 = objc_alloc(MEMORY[0x263F11E68]);
    v65 = [MEMORY[0x263EFFA08] setWithObject:v30];
    v66 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    v34 = (void *)[v64 initWithFilterPredicates:v65 library:v66];

    v35 = v34;
    uint64_t v36 = 1;
    goto LABEL_22;
  }
  if (v39)
  {
    v75 = (void *)MEMORY[0x263F11E60];
    v76 = NSNumber;
    v77 = [v4 universalStore];
    v78 = objc_msgSend(v76, "numberWithLongLong:", objc_msgSend(v77, "subscriptionAdamID"));
    v79 = [v75 predicateWithValue:v78 forProperty:*MEMORY[0x263F113D8]];
    [v8 addObject:v79];

    v80 = (void *)MEMORY[0x263F11E60];
    v81 = NSNumber;
    uint64_t v82 = [v4 universalStore];
    v83 = objc_msgSend(v81, "numberWithLongLong:", objc_msgSend(v82, "subscriptionAdamID"));
    v84 = [v80 predicateWithValue:v83 forProperty:*MEMORY[0x263F113F0]];
    [v8 addObject:v84];
  }
  v85 = [v4 universalStore];
  uint64_t v86 = [v85 universalCloudLibraryID];
  uint64_t v87 = [v86 length];

  if (v87)
  {
    v88 = (void *)MEMORY[0x263F11E60];
    v89 = [v4 universalStore];
    uint64_t v90 = [v89 universalCloudLibraryID];
    v91 = [v88 predicateWithValue:v90 forProperty:*MEMORY[0x263F113D0]];
    [v8 addObject:v91];
  }
  lldiv_t v92 = [v4 library];
  uint64_t v93 = [v92 persistentID];

  if (v93)
  {
    v94 = (void *)MEMORY[0x263F11E60];
    uint64_t v95 = NSNumber;
    v96 = [v4 library];
    uint64_t v97 = objc_msgSend(v95, "numberWithLongLong:", objc_msgSend(v96, "persistentID"));
    lldiv_t v98 = [v94 predicateWithValue:v97 forProperty:*MEMORY[0x263F11368]];
    [v8 addObject:v98];
  }
  v30 = [MEMORY[0x263F11DE8] predicateMatchingPredicates:v8];
  id v99 = objc_alloc(MEMORY[0x263F11E68]);
  uint64_t v100 = [MEMORY[0x263EFFA08] setWithObject:v30];
  v101 = [MEMORY[0x263F11E40] deviceMediaLibrary];
  v34 = (void *)[v99 initWithFilterPredicates:v100 library:v101];

  v102 = [v34 items];
  v103 = [v102 firstObject];

  if (!v103)
  {
    v104 = v4;
    goto LABEL_23;
  }
  [v7 addObject:v103];

LABEL_37:
  v5 = v105;
LABEL_38:

  return v7;
}

- (void)_configureiTunesLibraryRequest:()MPCModelPlaybackAdditions forLibraryItems:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F12028] kindWithVariants:7];
  uint64_t v29 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v15 = [v14 type];
        if (v15 == 1)
        {
          id v28 = v14;
          [v5 setItemKind:v7];
          id v17 = [v28 identifiers];

          [v29 addObject:v17];
        }
        else
        {
          if (v15 == 4)
          {
            v22 = (void *)MEMORY[0x263F11FB8];
            id v23 = v14;
            uint64_t v24 = [v22 identityKind];
            [v5 setSectionKind:v24];

            v25 = [v23 identifiers];
            [v8 addObject:v25];

            id v26 = (void *)MEMORY[0x263F11FA0];
            v34 = v7;
            char v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];

            id v17 = [v26 kindWithKinds:v27];

            uint64_t v20 = v5;
            id v21 = v17;
          }
          else
          {
            if (v15 != 2) {
              continue;
            }
            v16 = (void *)MEMORY[0x263F11E88];
            id v17 = v14;
            uint64_t v18 = [v16 identityKind];
            [v5 setSectionKind:v18];

            lldiv_t v19 = [v17 identifiers];
            [v8 addObject:v19];

            uint64_t v20 = v5;
            id v21 = v7;
          }
          [v20 setItemKind:v21];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  [v5 setAllowedItemIdentifiers:v29];
  [v5 setAllowedSectionIdentifiers:v8];
}

- (MPCModelPlaybackContext)_playbackContextForStorePlayParameters:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:containsStartItem:
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v100 = v12;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "Creating radio playback context: %{public}@", buf, 0xCu);
    }

    v14 = (MPCModelPlaybackContext *)v12;
  }
  else
  {
    if ([v11 count])
    {
      uint64_t v15 = [a1 playParametersQueue];
      uint64_t v16 = [v15 count];

      if (v16 == 1)
      {
        id v17 = [a1 playParametersQueue];
        uint64_t v18 = [v17 firstObject];

        lldiv_t v19 = [v18 itemKind];
        if (([v19 isEqualToString:*MEMORY[0x263F11C98]] & 1) != 0
          || [v19 isEqualToString:*MEMORY[0x263F11CA0]])
        {
          [a1 setContainerPlayParameters:v18];
        }
      }
      id v20 = objc_alloc_init(MEMORY[0x263F11F48]);
      id v21 = [a1 containerPlayParameters];

      if (v21)
      {
        int v91 = a6;
        id v89 = v11;
        id v90 = v10;
        v22 = [a1 containerPlayParameters];
        id v23 = [v22 identifiers];
        uint64_t v24 = [v23 modelKind];
        [v20 setSectionKind:v24];

        v25 = [a1 containerPlayParameters];
        id v26 = [v25 identifiers];
        lldiv_t v98 = v26;
        char v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v98 count:1];
        [v20 setAllowedSectionIdentifiers:v27];

        id v28 = [MEMORY[0x263F12028] kindWithVariants:7];
        uint64_t v29 = [v20 sectionKind];
        long long v30 = [v29 identityKind];
        long long v31 = [MEMORY[0x263F11FB8] identityKind];
        int v32 = [v30 isEqual:v31];

        long long v33 = v28;
        if (v32)
        {
          v34 = (void *)MEMORY[0x263F11FA0];
          id v97 = v28;
          v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v97 count:1];
          long long v33 = [v34 kindWithKinds:v35];
        }
        uint64_t v36 = [v20 sectionKind];
        int v37 = [v36 identityKind];
        v38 = [MEMORY[0x263F11E88] identityKind];
        int v39 = [v37 isEqual:v38];

        if (v39)
        {
          v40 = (void *)MEMORY[0x263F12038];
          uint64_t v95 = *MEMORY[0x263F11810];
          v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
          uint64_t v87 = [v40 sortDescriptorWithKeyPath:v88 ascending:1];
          v96[0] = v87;
          id v41 = (void *)MEMORY[0x263F12038];
          uint64_t v94 = *MEMORY[0x263F11888];
          v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
          v43 = [v41 sortDescriptorWithKeyPath:v42 ascending:1];
          v96[1] = v43;
          v44 = (void *)MEMORY[0x263F12038];
          uint64_t v93 = *MEMORY[0x263F11880];
          v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
          v46 = [v44 sortDescriptorWithKeyPath:v45 ascending:1];
          v96[2] = v46;
          id v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:3];
          [v20 setItemSortDescriptors:v47];
        }
        [v20 setItemKind:v33];
        [v20 setFilteringOptions:4];

        id v11 = v89;
        id v10 = v90;
        a6 = v91;
      }
      else
      {
        uint64_t v58 = (void *)[objc_alloc(MEMORY[0x263F11E68]) initWithEntities:v11 entityType:0];
        [v20 setLegacyMediaQuery:v58];
      }
      v59 = NSString;
      v60 = [a1 playActivityFeatureName];
      v61 = [v59 stringWithFormat:@"PlayParametersQueueDescriptor-%@", v60];
      [v20 setLabel:v61];

      v62 = v20;
      uint32_t v63 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v100 = v62;
        _os_log_impl(&dword_21BB87000, v63, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating library playback context with request: %{public}@", buf, 0xCu);
      }

      id v48 = (MPCModelStorePlaybackItemsRequest *)v62;
    }
    else
    {
      id v48 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
      v49 = [a1 containerPlayParameters];

      if (v49)
      {
        id v50 = objc_alloc_init(MEMORY[0x263F120D8]);
        v51 = [a1 containerPlayParameters];
        uint64_t v52 = [v51 itemKind];
        int v53 = [v52 isEqualToString:*MEMORY[0x263F11C98]];

        int v92 = a6;
        if (v53)
        {
          id v54 = objc_alloc(MEMORY[0x263F11E80]);
          v55 = [a1 containerPlayParameters];
          int v56 = [v55 identifiers];
          v57 = &__block_literal_global_47;
        }
        else
        {
          v65 = [a1 containerPlayParameters];
          v66 = [v65 itemKind];
          int v67 = [v66 isEqualToString:*MEMORY[0x263F11CA0]];

          if (v67)
          {
            id v54 = objc_alloc(MEMORY[0x263F11F98]);
            v55 = [a1 containerPlayParameters];
            int v56 = [v55 identifiers];
            v57 = &__block_literal_global_51;
          }
          else
          {
            uint64_t v68 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v69 = [a1 containerPlayParameters];
              *(_DWORD *)buf = 138543362;
              id v100 = v69;
              _os_log_impl(&dword_21BB87000, v68, OS_LOG_TYPE_DEFAULT, "MusicKit: Unable to determine valid container play parameters itemKind for play parameters: %{public}@. Defaulting to album.", buf, 0xCu);
            }
            id v54 = objc_alloc(MEMORY[0x263F11E80]);
            v55 = [a1 containerPlayParameters];
            int v56 = [v55 identifiers];
            v57 = &__block_literal_global_54;
          }
        }
        uint64_t v70 = (void *)[v54 initWithIdentifiers:v56 block:v57];

        [v50 appendSection:v70];
        v71 = objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_58);
        [v50 appendItems:v71];
        [(MPCModelStorePlaybackItemsRequest *)v48 setSectionedModelObjects:v50];

        a6 = v92;
      }
      else
      {
        id v64 = objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_63);
        [(MPCModelStorePlaybackItemsRequest *)v48 setStoreIDs:v64];
      }
      [(MPCModelStorePlaybackItemsRequest *)v48 setClientIdentifier:@"com.apple.Music"];
      v62 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v100 = v48;
        _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "MusicKit: Creating store playback context with request: %{public}@", buf, 0xCu);
      }
    }

    v14 = objc_alloc_init(MPCModelPlaybackContext);
    [(MPCModelPlaybackContext *)v14 setRequest:v48];
    if (a6)
    {
      v72 = [a1 startItemPlayParameters];
      v73 = [v72 identifiers];
      [(MPCModelPlaybackContext *)v14 setStartItemIdentifiers:v73];
    }
    v74 = [a1 startTimes];
    [(MPCModelPlaybackContext *)v14 setStartTimeModifications:v74];

    v75 = [a1 endTimes];
    [(MPCModelPlaybackContext *)v14 setEndTimeModifications:v75];

    -[MPCModelPlaybackContext setShuffleType:](v14, "setShuffleType:", [a1 shuffleType]);
    -[MPCModelPlaybackContext setRepeatType:](v14, "setRepeatType:", [a1 repeatType]);
    [(MPCModelPlaybackContext *)v14 setAllowsJumpToIt:1];
  }
  v76 = [a1 playActivityFeatureName];
  [(MPCModelPlaybackContext *)v14 setPlayActivityFeatureName:v76];

  v77 = [a1 playActivityRecommendationData];
  [(MPCModelPlaybackContext *)v14 setPlayActivityRecommendationData:v77];

  v78 = [a1 playActivityQueueGroupingID];
  [(MPCModelPlaybackContext *)v14 setPlayActivityQueueGroupingID:v78];

  if ([a1 isPrivate]) {
    [(MPCModelPlaybackContext *)v14 setPrivateListeningOverride:MEMORY[0x263EFFA88]];
  }
  if ([(MPCModelPlaybackContext *)v14 conformsToProtocol:&unk_26CC28748])
  {
    v79 = v14;
    v80 = [(MPCModelPlaybackContext *)v79 playbackRequestEnvironment];
    v81 = (void *)[v80 mutableCopy];

    uint64_t v82 = (void *)[objc_alloc(MEMORY[0x263F890C0]) initWithSystemApplicationType:0];
    v83 = [v82 clientIdentifier];
    [v81 setClientIdentifier:v83];

    v84 = [v82 clientVersion];
    [v81 setClientVersion:v84];

    [a1 _addRequestingBundleIdentifierToPlaybackRequestEnvironment:v81];
    [(MPCModelPlaybackContext *)v79 setPlaybackRequestEnvironment:v81];
  }
  [(MPCModelPlaybackContext *)v14 setQueueDescriptor:a1];
  v85 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v100 = v14;
    _os_log_impl(&dword_21BB87000, v85, OS_LOG_TYPE_DEFAULT, "MusicKit: Created playback context: %{public}@", buf, 0xCu);
  }

  return v14;
}

- (void)_updatePlaybackContextsForPlaybackParametersQueue:()MPCModelPlaybackAdditions libraryItems:radioPlaybackContext:storePlayParameters:contexts:containsStartItem:
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke;
  aBlock[3] = &unk_2643C1568;
  id v19 = v16;
  id v70 = v19;
  v71 = a1;
  id v20 = v17;
  id v72 = v20;
  id v21 = v15;
  id v73 = v21;
  v45 = (void (**)(void *, id, id *, void *, void *))_Block_copy(aBlock);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke_32;
  v63[3] = &unk_2643C1590;
  id v48 = v20;
  id v64 = v48;
  id v22 = v21;
  id v65 = v22;
  id v54 = v18;
  id v66 = v54;
  int v67 = a1;
  id v23 = v19;
  id v68 = v23;
  v44 = (void (**)(void *, id, id *, void *, void *, id))_Block_copy(v63);
  v51 = v22;
  v42 = v14;
  if (v22)
  {
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    obuint64_t j = v14;
    uint64_t v50 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v60;
      uint64_t v43 = *MEMORY[0x263F11CA8];
      id v47 = a1;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v26 = [v25 identifiers];
          char v27 = [v25 itemKind];
          id v28 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v76 = v27;
            __int16 v77 = 2114;
            v78 = v26;
            _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "MusicKit: Handling play parameters for type: %{public}@ and identifiers: %{public}@", buf, 0x16u);
          }

          uint64_t v29 = [a1 _libraryItemsForPlayParameters:v25];
          if ([v29 count])
          {
            id v52 = v27;
            long long v30 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v76 = v26;
              _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "MusicKit: Static entities created for item with identifiers: %{public}@", buf, 0xCu);
            }

            if (v23 || [v48 count])
            {
              long long v31 = objc_msgSend(a1, "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v48, v51, v23, objc_msgSend(*a8, "BOOLValue"));
              [v54 addObject:v31];

              *a8 = (id)MEMORY[0x263EFFA80];
              a1 = v47;
              [v48 removeAllObjects];
            }
            [v51 addObjectsFromArray:v29];
            int v32 = [a1 startItemPlayParameters];
            int v33 = [v32 isEqual:v25];

            id v23 = 0;
            if (v33) {
              *a8 = (id)MEMORY[0x263EFFA88];
            }
            char v27 = v52;
          }
          else if ([v27 isEqualToString:v43])
          {
            v45[2](v45, v54, a8, v26, v25);
          }
          else
          {
            v44[2](v44, v54, a8, v26, v25, v23);
          }
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
      }
      while (v50);
    }
  }
  else
  {
    long long v57 = 0uLL;
    long long v58 = 0uLL;
    long long v55 = 0uLL;
    long long v56 = 0uLL;
    id v53 = v14;
    uint64_t v34 = [v53 countByEnumeratingWithState:&v55 objects:v74 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v56;
      uint64_t v37 = *MEMORY[0x263F11CA8];
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v53);
          }
          int v39 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          v40 = [v39 identifiers];
          id v41 = [v39 itemKind];
          if ([v41 isEqualToString:v37]) {
            v45[2](v45, v54, a8, v40, v39);
          }
          else {
            v44[2](v44, v54, a8, v40, v39, v23);
          }
        }
        uint64_t v35 = [v53 countByEnumeratingWithState:&v55 objects:v74 count:16];
      }
      while (v35);
    }
  }
}

- (id)playbackContexts
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [a1 playParametersQueue];
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "MusicKit: MPMusicPlayerPlayParamertersQueueDescriptor playParametersQueue: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = a1;
  if (playbackContexts_sOnceToken != -1) {
    dispatch_once(&playbackContexts_sOnceToken, block);
  }
  if (playbackContexts_isClassicMusicApp)
  {
    id v7 = [a1 playParametersQueue];
    id v8 = [a1 _classicalMusicAppPlaybackContextForPlayParametersQueue:v7];

    if (v8)
    {
      id v23 = v8;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      goto LABEL_24;
    }
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v4;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "MusicKit: Unable to produce playback context for play parameters queue %{public}@. Defaulting to public SDK playback (non-filtered).", buf, 0xCu);
    }
  }
  if ([v4 count] == 1
    && ([a1 startItemPlayParameters],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    id v12 = [v4 firstObject];
    id v13 = [v12 itemKind];

    id v14 = NSNumber;
    if ([v13 isEqualToString:*MEMORY[0x263F11C98]]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = [v13 isEqualToString:*MEMORY[0x263F11CA0]];
    }
    id v16 = [v14 numberWithInt:v15];
  }
  else
  {
    id v16 = (void *)MEMORY[0x263EFFA80];
  }
  id v21 = v16;
  [a1 _updatePlaybackContextsForPlaybackParametersQueue:v4 libraryItems:v3 radioPlaybackContext:0 storePlayParameters:v2 contexts:v5 containsStartItem:&v21];
  id v8 = v21;

  if ([v2 count] || objc_msgSend(v3, "count"))
  {
    id v17 = objc_msgSend(a1, "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v2, v3, 0, objc_msgSend(v8, "BOOLValue"));
    [v5 addObject:v17];
  }
  id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "MusicKit: Returning playback contexts for MPMusicPlayerPlayParamertersQueueDescriptor: Contexts = %{public}@", buf, 0xCu);
  }

  id v9 = v5;
LABEL_24:
  id v19 = v9;

  return v19;
}

@end