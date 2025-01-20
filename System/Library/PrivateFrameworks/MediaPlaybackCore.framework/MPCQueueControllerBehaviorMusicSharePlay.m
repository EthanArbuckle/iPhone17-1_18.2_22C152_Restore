@interface MPCQueueControllerBehaviorMusicSharePlay
@end

@implementation MPCQueueControllerBehaviorMusicSharePlay

void __55___MPCQueueControllerBehaviorMusicSharePlay__setQueue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 identifier];
  if (([*(id *)(*(void *)(a1 + 32) + 152) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 32) _emitEventsForAddedSharedListeningContainer:v4];
    [*(id *)(*(void *)(a1 + 32) + 152) addObject:v3];
  }
}

void __89___MPCQueueControllerBehaviorMusicSharePlay__sectionObjectForSharedListeningContainerID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  v7 = [v10 identifiers];
  v8 = [v7 vendorID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  switch([v5 kind])
  {
    case 1:
      id v12 = objc_alloc(MEMORY[0x263F11DB0]);
      v13 = [MEMORY[0x263F11E88] identityKind];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2;
      v33[3] = &unk_2643C49D8;
      v8 = &v34;
      id v34 = v5;
      int v9 = (void *)[v12 initWithSource:@"MusicSharePlayBehavior" modelKind:v13 block:v33];

      id v10 = objc_alloc(MEMORY[0x263F11E80]);
      v11 = &__block_literal_global_18219;
      break;
    case 2:
    case 5:
      id v6 = objc_alloc(MEMORY[0x263F11DB0]);
      v7 = [MEMORY[0x263F11FE0] identityKind];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_8;
      v29[3] = &unk_2643C49D8;
      v8 = &v30;
      id v30 = v5;
      int v9 = (void *)[v6 initWithSource:@"MusicSharePlayBehavior" modelKind:v7 block:v29];

      id v10 = objc_alloc(MEMORY[0x263F11FD8]);
      v11 = &__block_literal_global_322;
      break;
    case 3:
      id v14 = objc_alloc(MEMORY[0x263F11DB0]);
      v15 = [MEMORY[0x263F11FB8] identityKind];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_5;
      v31[3] = &unk_2643C49D8;
      v8 = &v32;
      id v32 = v5;
      int v9 = (void *)[v14 initWithSource:@"MusicSharePlayBehavior" modelKind:v15 block:v31];

      id v10 = objc_alloc(MEMORY[0x263F11F98]);
      v11 = &__block_literal_global_317;
      break;
    default:
      id v16 = objc_alloc(MEMORY[0x263F11DB0]);
      v17 = [MEMORY[0x263F11F00] identityKind];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_11;
      v27[3] = &unk_2643C49D8;
      v8 = &v28;
      id v28 = v5;
      int v9 = (void *)[v16 initWithSource:@"MusicSharePlayBehavior" modelKind:v17 block:v27];

      id v10 = objc_alloc(MEMORY[0x263F11EF8]);
      v11 = &__block_literal_global_326;
      break;
  }
  v18 = (void *)[v10 initWithIdentifiers:v9 block:v11];
  v19 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v18];

  [*(id *)(a1 + 32) appendSection:v19];
  v20 = [*(id *)(a1 + 40) tracklist];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_13;
  v23[3] = &unk_2643C2618;
  id v21 = *(id *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 56);
  id v24 = v21;
  uint64_t v25 = v22;
  id v26 = *(id *)(a1 + 32);
  [v20 enumerateItemsInSectionAtIndex:a3 usingBlock:v23];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setVendorID:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_3;
  v6[3] = &unk_2643C4988;
  id v7 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v6];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_5(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setVendorID:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_6;
  v6[3] = &unk_2643C4988;
  id v7 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v6];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setVendorID:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_9;
  v6[3] = &unk_2643C49B0;
  id v7 = *(id *)(a1 + 32);
  [v4 setRadioIdentifiersWithBlock:v6];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  [v3 setVendorID:v4];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_13(id *a1, void *a2)
{
  v32[4] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 playParams];
  id v5 = [v4 objectForKeyedSubscript:@"kind"];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F11CC0];
    v32[0] = *MEMORY[0x263F11CC8];
    v32[1] = v6;
    uint64_t v7 = *MEMORY[0x263F11CE0];
    v32[2] = *MEMORY[0x263F11CD8];
    v32[3] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
    char v9 = [v8 containsObject:v5];

    if (v9)
    {
      id v10 = (id *)0x263F12030;
LABEL_11:
      v11 = [*v10 identityKind];
      id v18 = objc_alloc(MEMORY[0x263F11DB0]);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_333;
      v22[3] = &unk_2643C49D8;
      id v23 = v3;
      v19 = (void *)[v18 initWithSource:@"MusicSharePlayBehavior" modelKind:v11 block:v22];
      v20 = objc_msgSend(objc_alloc((Class)-[NSObject modelClass](v11, "modelClass")), "initWithIdentifiers:block:", v19, &__block_literal_global_337);
      id v21 = [MEMORY[0x263F11EE0] genericObjectWithModelObject:v20];
      [a1[6] appendItem:v21];

      goto LABEL_12;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F11CD0]])
    {
      id v10 = (id *)0x263F12080;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:*MEMORY[0x263F11CB8]])
    {
      id v10 = (id *)0x263F11F70;
      goto LABEL_11;
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    id v12 = [a1[4] engineID];
    v13 = [a1[5] sessionID];
    id v14 = [v3 identifier];
    *(_DWORD *)buf = 138544130;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    v27 = v13;
    __int16 v28 = 2114;
    v29 = v14;
    __int16 v30 = 2114;
    v31 = v5;
    v15 = "[BMSP:%{public}@:%{public}@] _sectionedCollectionForQueue: | bailing [unsupported playParams[\"kind\"]] itemID"
          "=%{public}@ playParamsKind=%{public}@";
    id v16 = v11;
    uint32_t v17 = 42;
    goto LABEL_6;
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    id v12 = [a1[4] engineID];
    v13 = [a1[5] sessionID];
    id v14 = [v3 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    v27 = v13;
    __int16 v28 = 2114;
    v29 = v14;
    v15 = "[BMSP:%{public}@:%{public}@] _sectionedCollectionForQueue: | bailing [missing playParams[\"kind\"]] itemID=%{public}@";
    id v16 = v11;
    uint32_t v17 = 32;
LABEL_6:
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_FAULT, v15, buf, v17);
  }
LABEL_12:
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_333(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setVendorID:v5];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2_334;
  v6[3] = &unk_2643C4988;
  id v7 = *(id *)(a1 + 32);
  [v4 setUniversalStoreIdentifiersWithBlock:v6];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_2_334(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mediaIdentifier];
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v4, "longLongValue"));
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 mediaIdentifier];
  [v4 setStationStringID:v5];

  id v6 = [*(id *)(a1 + 32) stationHash];
  [v4 setStationHash:v6];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mediaIdentifier];
  [v3 setGlobalPlaylistID:v4];
}

void __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mediaIdentifier];
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v4, "longLongValue"));
}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 vendorID];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = [a2 identifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_3;
  v10[3] = &unk_2643C2618;
  id v7 = (void *)a1[4];
  uint64_t v6 = a1[5];
  v8 = (void *)a1[6];
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v8;
  id v9 = v5;
  [v7 enumerateItemsInSectionAtIndex:a3 usingBlock:v10];
}

void __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = [a2 identifier];
  id v3 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:*(void *)(a1 + 32) itemID:v7];
  if ([*(id *)(a1 + 40) _useItemPlaceholderForItemID:v7])
  {
    uint64_t v4 = [v3 copyAsPlaceholder];

    id v3 = (void *)v4;
  }
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = [v3 contentItemID];
  [v5 addObject:v6];
}

void __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 identifier];
  v8 = [v5 _sectionObjectForSharedListeningContainerID:v7];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "msp_shortDescription");
  }
  else {
  id v9 = [v8 description];
  }
  id v10 = *(void **)(a1 + 40);
  id v11 = NSString;
  uint64_t v12 = [v6 shortDescription];

  id v13 = [v11 stringWithFormat:@"%@ - %@", v12, v9];
  [v10 addObject:v13];

  id v14 = [MEMORY[0x263EFF980] array];
  v15 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke_2;
  v17[3] = &unk_2643C25A0;
  v17[4] = *(void *)(a1 + 32);
  id v18 = v14;
  id v16 = v14;
  [v15 enumerateItemsInSectionAtIndex:a3 usingBlock:v17];
  [*(id *)(a1 + 40) addObject:v16];
}

void __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 identifier];
  id v11 = [v3 _itemObjectForSharedListeningItemID:v5];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "msp_shortDescription");
  }
  else {
  id v6 = [v11 description];
  }
  id v7 = *(void **)(a1 + 40);
  v8 = NSString;
  id v9 = [v4 shortDescription];

  id v10 = [v8 stringWithFormat:@"%@ - %@", v9, v6];
  [v7 addObject:v10];
}

uint64_t __75___MPCQueueControllerBehaviorMusicSharePlay__purgePendingActionsWithLabel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 label];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = (void *)a1[4];
  id v10 = [v8 identifiers];
  id v11 = [v10 vendorID];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
    *a4 = 1;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_2;
    v14[3] = &unk_2643C24D8;
    uint64_t v12 = (void *)a1[5];
    id v13 = (void *)a1[7];
    v14[4] = a1[6];
    id v15 = v13;
    [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v14];
  }
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = *(void **)(a1 + 32);
  id v10 = [v8 identifiers];
  id v11 = [v10 vendorID];
  LODWORD(v9) = [v9 isEqualToString:v11];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    *a4 = 1;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_4;
    v16[3] = &unk_2643C2528;
    uint64_t v12 = *(void **)(a1 + 40);
    id v13 = *(void **)(a1 + 56);
    v16[4] = *(void *)(a1 + 48);
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 80);
    id v17 = v14;
    uint64_t v19 = v15;
    id v18 = *(id *)(a1 + 64);
    [v12 enumerateItemsInSectionAtIndex:a3 usingBlock:v16];
  }
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id obj = (id)[a2 copyWithPropertySet:*(void *)(*(void *)(a1 + 32) + 104)];
  id v3 = [*(id *)(a1 + 40) startItemIdentifier];
  uint64_t v4 = [obj identifiers];
  id v5 = [v4 vendorID];
  int v6 = [v3 isEqualToString:v5];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  }
  [*(id *)(a1 + 48) addObject:obj];
}

void __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id)[a2 copyWithPropertySet:*(void *)(*(void *)(a1 + 32) + 104)];
  [*(id *)(a1 + 40) addObject:v3];
}

void __66___MPCQueueControllerBehaviorMusicSharePlay__initializeWithQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) engineID];
      id v10 = [*(id *)(a1 + 40) sessionID];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v64 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | failing command [failed to get expectedCurrentItem] error=%{public}@", buf, 0x20u);
    }
    objc_msgSend(v7, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 9, @"failed to get expectedCurrentItem from server during initial load");
    id v11 = (MPCModelStorePlaybackItemsRequest *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 16))();
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = 0;

    [*(id *)(a1 + 48) rollback];
  }
  else
  {
    if (!v5)
    {
      v60 = [MEMORY[0x263F08690] currentHandler];
      [v60 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_MPCQueueControllerBehaviorMusicSharePlay.m" lineNumber:1355 description:@"Server didn't have expected current item"];
    }
    id v14 = [*(id *)(a1 + 40) liveLink];
    uint64_t v15 = [v5 identifier];
    objc_msgSend(v14, "expectingToJoinWithStartItem:asInitiator:", v15, objc_msgSend(*(id *)(a1 + 40), "joiningAsInitiator"));

    id v11 = objc_alloc_init(MPCModelStorePlaybackItemsRequest);
    [(MPCModelStorePlaybackItemsRequest *)v11 setPlaybackRequestEnvironment:*(void *)(*(void *)(a1 + 40) + 32)];
    id v16 = objc_msgSend(MEMORY[0x263F11EE0], "mqf_requiredItemPlaybackProperties");
    [(MPCModelStorePlaybackItemsRequest *)v11 setItemProperties:v16];

    id v17 = objc_msgSend(MEMORY[0x263F11EE0], "mqf_requiredSectionPlaybackProperties");
    [(MPCModelStorePlaybackItemsRequest *)v11 setSectionProperties:v17];

    id v18 = [*(id *)(a1 + 40) requestedPropertySetForEvents];

    if (v18)
    {
      uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [*(id *)(a1 + 32) engineID];
        id v21 = [*(id *)(a1 + 40) sessionID];
        uint64_t v22 = [*(id *)(a1 + 40) requestedPropertySetForEvents];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2114;
        v64 = v22;
        _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | adding client requested properites [] properites=%{public}@", buf, 0x20u);
      }
      id v23 = [(MPCModelStorePlaybackItemsRequest *)v11 itemProperties];
      id v24 = [*(id *)(a1 + 40) requestedPropertySetForEvents];
      uint64_t v25 = [v23 propertySetByCombiningWithPropertySet:v24];
      [(MPCModelStorePlaybackItemsRequest *)v11 setItemProperties:v25];

      __int16 v26 = [(MPCModelStorePlaybackItemsRequest *)v11 sectionProperties];
      v27 = [*(id *)(a1 + 40) requestedPropertySetForEvents];
      __int16 v28 = [v26 propertySetByCombiningWithPropertySet:v27];
      [(MPCModelStorePlaybackItemsRequest *)v11 setSectionProperties:v28];
    }
    v29 = [*(id *)(a1 + 40) _sectionedCollectionForQueue:*(void *)(a1 + 56)];
    [(MPCModelStorePlaybackItemsRequest *)v11 setSectionedModelObjects:v29];

    id v30 = [v5 identifier];
    id v31 = objc_alloc(MEMORY[0x263F11DB0]);
    id v32 = [MEMORY[0x263F12030] identityKind];
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___MPCQCBMSPSongIdentifierSetForVendorID_block_invoke;
    v64 = &unk_2643C49D8;
    id v65 = v30;
    id v33 = v30;
    id v34 = (void *)[v31 initWithSource:@"MusicSharePlayBehavior" modelKind:v32 block:buf];

    v35 = [(MPCModelStorePlaybackItemsRequest *)v11 sectionedModelObjects];
    v36 = [v35 indexPathForItemWithIdentifiersIntersectingSet:v34];

    if (!v36)
    {
      v61 = [MEMORY[0x263F08690] currentHandler];
      [v61 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"_MPCQueueControllerBehaviorMusicSharePlay.m", 1374, @"Invalid sectionedModelObjects -- does not contain start item: %@", v5 object file lineNumber description];
    }
    v62 = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    [(MPCModelStorePlaybackItemsRequest *)v11 setPlaybackPrioritizedIndexPaths:v37];

    [(MPCModelStorePlaybackItemsRequest *)v11 setClientIdentifier:@"com.apple.Music"];
    [(MPCModelStorePlaybackItemsRequest *)v11 setLabel:@"com.apple.MediaPlaybackCore.MPCQueueControllerBehaviorMusicSharePlay"];
    id v38 = objc_alloc_init(MEMORY[0x263F12008]);
    [*(id *)(*(void *)(a1 + 40) + 128) setRequest:v38];

    v39 = [*(id *)(*(void *)(a1 + 40) + 128) request];
    [v39 setTimeoutInterval:0.0];

    v40 = [*(id *)(*(void *)(a1 + 40) + 128) request];
    [v40 setQualityOfService:25];

    v41 = [(MPCModelStorePlaybackItemsRequest *)v11 label];
    v42 = [*(id *)(*(void *)(a1 + 40) + 128) request];
    [v42 setLabel:v41];

    v43 = [*(id *)(*(void *)(a1 + 40) + 128) request];
    [v43 setModelRequest:v11];

    [*(id *)(*(void *)(a1 + 40) + 128) setNeedsReload];
    v44 = [*(id *)(a1 + 56) tracklist];
    v45 = objc_msgSend(v44, "sectionAtIndex:", objc_msgSend(v36, "msv_section"));

    v46 = [v45 identifier];
    v47 = [v5 identifier];
    v48 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v46 itemID:v47];

    v49 = (void *)[v48 copyAsPlaceholder];
    v50 = *(void **)(a1 + 48);
    v51 = [v49 contentItemID];
    [v50 setSuggestedContentItemIDForStart:v51];

    [*(id *)(a1 + 40) _setQueue:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) commit];
    uint64_t v52 = *(void *)(*(void *)(a1 + 40) + 8);
    v53 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    if (v52)
    {
      if (v54)
      {
        v55 = [*(id *)(a1 + 32) engineID];
        v56 = [*(id *)(a1 + 40) sessionID];
        v57 = *(void **)(*(void *)(a1 + 40) + 8);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        *(_WORD *)&buf[22] = 2114;
        v64 = v57;
        _os_log_impl(&dword_21BB87000, v53, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | begin synchronized playback with AVPlaybackCoordinator [] playbackCoordinator=%{public}@", buf, 0x20u);
      }
      [*(id *)(*(void *)(a1 + 40) + 112) beginSynchronizedPlaybackWithAVPlaybackCoordinator:*(void *)(*(void *)(a1 + 40) + 8)];
    }
    else
    {
      if (v54)
      {
        v58 = [*(id *)(a1 + 32) engineID];
        v59 = [*(id *)(a1 + 40) sessionID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v59;
        _os_log_impl(&dword_21BB87000, v53, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _initializeWithQueue: | deferred begin synchronized playback with AVPlaybackCoordinator [coordinator unavailable]", buf, 0x16u);
      }
    }
  }
}

unsigned char *__90___MPCQueueControllerBehaviorMusicSharePlay__emitEventsForParticipants_localUserIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "msp_mpcParticipant");
  uint64_t v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  id v5 = [v3 identifier];

  id v6 = [*(id *)(a1 + 32) identifier];
  if (v5 != v6)
  {
    char v7 = [v5 isEqual:v6];
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v7 = 1;
  if (v4) {
LABEL_3:
  }
    v4[8] = v7;
LABEL_4:

  return v4;
}

void __81___MPCQueueControllerBehaviorMusicSharePlay__componentsForSharedListeningItemID___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v25 = a2;
  id v7 = a3;
  id v8 = [v25 identifier];
  int v9 = [v8 isEqualToString:a1[4]];

  if (v9)
  {
    id v10 = [*(id *)(a1[5] + 120) tracklist];
    id v11 = objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v7, "msv_section"));

    uint64_t v12 = [v11 identifier];
    id v13 = [v25 identifier];
    uint64_t v14 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v12 itemID:v13];
    uint64_t v15 = *(void *)(a1[6] + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v17 = (void *)a1[5];
    id v18 = [v25 identifier];
    LODWORD(v17) = [v17 _useItemPlaceholderForItemID:v18];

    if (v17)
    {
      uint64_t v19 = [*(id *)(*(void *)(a1[6] + 8) + 40) copyAsPlaceholder];
      uint64_t v20 = *(void *)(a1[6] + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    if ([v25 isAutoPlayItem])
    {
      uint64_t v22 = [*(id *)(*(void *)(a1[6] + 8) + 40) copyWithBehaviorFlags:1];
      uint64_t v23 = *(void *)(a1[6] + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    *a4 = 1;
  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) primaryReferencedIdentifier];
  if (v2)
  {
    objc_initWeak((id *)location, *(id *)(a1 + 40));
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = NSString;
    [*(id *)(a1 + 32) type];
    id v5 = NSStringFromICLiveLinkEventType();
    id v6 = [v4 stringWithFormat:@"Event-%@", v5];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke_2;
    v14[3] = &unk_2643C2418;
    v14[4] = *(void *)(a1 + 40);
    id v15 = v2;
    id v16 = *(id *)(a1 + 32);
    objc_copyWeak(&v17, (id *)location);
    [v3 _enqueuePendingActionWithLabel:v6 itemIdentifier:v15 block:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) host];
    id v8 = [*(id *)(a1 + 40) _mpcSharedListeningEventForICLiveLinkEvent:*(void *)(a1 + 32)];
    if (v8)
    {
      int v9 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 engineID];
        id v11 = [*(id *)(a1 + 40) sessionID];
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)location = 138544130;
        *(void *)&location[4] = v10;
        __int16 v19 = 2114;
        uint64_t v20 = v11;
        __int16 v21 = 2114;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        id v24 = v8;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | calling delegate [] event=%{public}@ sharedListeningEvent=%{public}@", location, 0x2Au);
      }
      id v13 = [*(id *)(a1 + 40) musicSharePlayBehaviorDelegate];
      [v13 behavior:*(void *)(a1 + 40) didReceiveSharedListeningEvent:v8];
    }
    else
    {
    }
  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) host];
  if (a2 == 2)
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 engineID];
      id v7 = [*(id *)(a1 + 32) sessionID];
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v22 = 138544130;
      __int16 v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      id v10 = "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [purged waiting on item: %{public}@]"
            " event=%{public}@";
      goto LABEL_7;
    }
  }
  else if (a2 == 1)
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 engineID];
      id v7 = [*(id *)(a1 + 32) sessionID];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v22 = 138544130;
      __int16 v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      __int16 v28 = 2114;
      uint64_t v29 = v9;
      id v10 = "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [expired waiting on item: %{public}@"
            "] event=%{public}@";
LABEL_7:
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x2Au);
LABEL_15:
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = [WeakRetained _mpcSharedListeningEventForICLiveLinkEvent:*(void *)(a1 + 48)];
      uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
      id v7 = v14;
      if (v6)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v4 engineID];
          id v16 = [*(id *)(a1 + 32) sessionID];
          uint64_t v17 = *(void *)(a1 + 40);
          uint64_t v18 = *(void *)(a1 + 48);
          int v22 = 138544386;
          __int16 v23 = v15;
          __int16 v24 = 2114;
          uint64_t v25 = v16;
          __int16 v26 = 2114;
          uint64_t v27 = v17;
          __int16 v28 = 2114;
          uint64_t v29 = v18;
          __int16 v30 = 2114;
          id v31 = v6;
          _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | calling delegate [item valid: %{public}@] event=%{public}@ sharedListeningEvent=%{public}@", (uint8_t *)&v22, 0x34u);
        }
        id v7 = [v5 musicSharePlayBehaviorDelegate];
        [v7 behavior:v5 didReceiveSharedListeningEvent:v6];
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [v4 engineID];
        uint64_t v20 = [*(id *)(a1 + 32) sessionID];
        uint64_t v21 = *(void *)(a1 + 48);
        int v22 = 138543874;
        __int16 v23 = v19;
        __int16 v24 = 2114;
        uint64_t v25 = v20;
        __int16 v26 = 2114;
        uint64_t v27 = v21;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] liveLink:didReceiveEvent: | dropping event [unable to convert to shared listening event] event=%{public}@", (uint8_t *)&v22, 0x20u);
      }
      goto LABEL_15;
    }
  }
}

void __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke(id *a1)
{
  v20[2] = *MEMORY[0x263EF8340];
  [a1[4] _purgePendingActionsWithLabel:@"ChangeCurrentItem"];
  objc_initWeak(&location, a1[4]);
  v2 = [a1[5] identifier];
  id v3 = [a1[4] host];
  uint64_t v4 = [v3 eventStream];
  v19[0] = @"shared-session-id";
  id v5 = [a1[4] liveLink];
  id v6 = [v5 identifier];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v19[1] = @"originating-participant";
  v20[0] = v7;
  uint64_t v8 = objc_msgSend(a1[6], "msp_mpcParticipant");
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  v20[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v4 emitEventType:@"shared-session-synchronization-begin" payload:v10];

  if (!v8) {
  if (!v6)
  }

  id v11 = a1[4];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke_2;
  v14[3] = &unk_2643C23F0;
  objc_copyWeak(v17, &location);
  id v12 = v2;
  v17[1] = a1[7];
  id v13 = a1[4];
  id v15 = v12;
  id v16 = v13;
  [v11 _enqueuePendingActionWithLabel:@"ChangeCurrentItem" itemIdentifier:v12 block:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v22[2] = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_10:
    id v11 = 0;
    goto LABEL_14;
  }
  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 12, 0, @"Pending action for %@ was interrupted", *(void *)(a1 + 32));
  }
  else
  {
    if (a2 != 1)
    {
      if (!a2)
      {
        id v6 = [WeakRetained _componentsForSharedListeningItemID:*(void *)(a1 + 32)];
        if (!v6)
        {
          __int16 v19 = [MEMORY[0x263F08690] currentHandler];
          [v19 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"_MPCQueueControllerBehaviorMusicSharePlay.m", 1140, @"Pending action flushed but item was still not found [nil components]: %@", *(void *)(a1 + 32) object file lineNumber description];
        }
        id v7 = [v5[20] objectForKeyedSubscript:*(void *)(a1 + 32)];
        if (!v7)
        {
          uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
          [v20 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"_MPCQueueControllerBehaviorMusicSharePlay.m", 1143, @"Pending action flushed but item was still not found [nil indexPath]: %@", *(void *)(a1 + 32) object file lineNumber description];
        }
        uint64_t v8 = [v5 externalSyncHost];
        uint64_t v9 = [v8 beginExternalSyncEditWithReason:@"LiveLink-DirectItemChange"];

        id v10 = [v6 contentItemID];
        [v9 setTargetContentItemID:v10];

        [v9 commit];
      }
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 13, 0, @"Pending action for %@ timed out [item never arrived]", *(void *)(a1 + 32));
  id v11 = };
LABEL_14:
  id v12 = [v5 host];
  id v13 = [v12 eventStream];
  v21[0] = @"shared-session-id";
  uint64_t v14 = [v5 liveLink];
  id v15 = [v14 identifier];
  id v16 = v15;
  if (!v15)
  {
    id v16 = [MEMORY[0x263EFF9D0] null];
  }
  v21[1] = @"shared-sync-error";
  v22[0] = v16;
  uint64_t v17 = v11;
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
  }
  v22[1] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v13 emitEventType:@"shared-session-synchronization-end" payload:v18];

  if (!v11)
  {

    if (v15) {
      goto LABEL_20;
    }
LABEL_22:

    goto LABEL_20;
  }
  if (!v15) {
    goto LABEL_22;
  }
LABEL_20:
}

void __69___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateQueue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[15])
  {
    id v3 = [v2 host];
    id v8 = [v3 beginEditWithReason:@"BehaviorSharePlay-liveLinkDidUpdateQueue"];

    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 128) request];
    id v5 = [v4 modelRequest];

    [v5 setShouldBatchResultsWithPlaceholderObjects:0];
    [v5 setPlaybackPrioritizedIndexPaths:MEMORY[0x263EFFA68]];
    id v6 = [*(id *)(a1 + 32) _sectionedCollectionForQueue:*(void *)(a1 + 40)];
    [v5 setSectionedModelObjects:v6];

    [*(id *)(*(void *)(a1 + 32) + 128) setNeedsReload];
    [*(id *)(a1 + 32) _setQueue:*(void *)(a1 + 40)];
    [v8 commit];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    [v2 _initializeWithQueue:v7];
  }
}

void __76___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateParticipants___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) identity];
  [v1 _emitEventsForParticipants:v2 localUserIdentity:v3];
}

void __82___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didEncounterError_willRetry___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = [v2 eventStream];
    id v5 = objc_msgSend(*(id *)(a1 + 32), "sessionID", @"session-id");
    id v6 = v5;
    if (!v5)
    {
      id v6 = [MEMORY[0x263EFF9D0] null];
    }
    v14[0] = v6;
    v14[1] = @"LiveLink Encountered Error";
    v13[1] = @"shared-session-event-reason";
    v13[2] = @"shared-session-is-reconnect";
    v14[2] = MEMORY[0x263EFFA88];
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    [v4 emitEventType:@"shared-session-end" payload:v7];

    if (!v5) {
    goto LABEL_10;
    }
  }
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [v3 engineID];
    id v10 = [*(id *)(a1 + 32) sessionID];
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] liveLink:didEncounterError: | stopping [not attempting retry] error=%{public}@", buf, 0x20u);
  }
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 9, *(void *)(a1 + 40), @"Unexpected live link error during initial load");
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    uint64_t v12 = *(void *)(a1 + 32);
    id v5 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = 0;
LABEL_10:
  }
}

void __61___MPCQueueControllerBehaviorMusicSharePlay_didStopLiveLink___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) host];
  id v3 = [v2 beginEditWithReason:@"LiveLinkDidStop"];
  [*(id *)(a1 + 32) _setQueue:0];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 128) request];
  id v5 = [v4 modelRequest];

  [v5 setShouldBatchResultsWithPlaceholderObjects:0];
  [v5 setPlaybackPrioritizedIndexPaths:MEMORY[0x263EFFA68]];
  id v6 = objc_alloc_init(MEMORY[0x263F12200]);
  [v5 setSectionedModelObjects:v6];

  [*(id *)(*(void *)(a1 + 32) + 128) setNeedsReload];
  [v3 commit];
  uint64_t v7 = [v2 eventStream];
  v14[0] = @"session-id";
  id v8 = [*(id *)(a1 + 32) sessionID];
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  v14[1] = @"shared-session-event-reason";
  v15[0] = v9;
  v15[1] = @"LiveLink Stopped";
  id v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v7 emitEventType:@"shared-session-end" payload:v10];

  if (!v8) {
  uint64_t v11 = *(unsigned char **)(a1 + 32);
  }
  BOOL v12 = v11[41] == 0;
  id v13 = [v11 musicSharePlayBehaviorDelegate];
  [v13 behavior:*(void *)(a1 + 32) didEndSharePlaySessionWithReason:v12];
}

void __66___MPCQueueControllerBehaviorMusicSharePlay_liveLinkDidReconnect___block_invoke(uint64_t a1)
{
  v10[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  id v3 = [v2 eventStream];
  v9[0] = @"session-id";
  uint64_t v4 = [*(id *)(a1 + 32) sessionID];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  v10[0] = v5;
  v9[1] = @"shared-session-id";
  id v6 = [*(id *)(a1 + 32) sessionID];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v7;
  v10[2] = &unk_26CC18FD8;
  v9[2] = @"shared-session-type";
  v9[3] = @"shared-session-event-reason";
  v9[4] = @"shared-session-is-reconnect";
  v10[3] = @"LiveLink Reconnect";
  void v10[4] = MEMORY[0x263EFFA88];
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  [v3 emitEventType:@"shared-session-begin" payload:v8];

  if (!v6) {
  if (!v4)
  }
}

void __82___MPCQueueControllerBehaviorMusicSharePlay_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) host];
  uint64_t v21 = [v2 beginEditWithReason:@"BehaviorMusicSharePlay-newResponse"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _reloadCacheDataWithOptions:1];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 128) response];
  uint64_t v4 = [v3 modelResponse];
  id v5 = [v4 results];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 176);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        BOOL v12 = [v11 modelGenericObject];
        id v13 = [v12 identifiers];
        uint64_t v14 = [v13 vendorID];

        if (v14)
        {
          id v15 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKeyedSubscript:v14];
          if (v15)
          {
            id v16 = [v5 itemAtIndexPath:v15];
            if (v16) {
              [v11 setGenericObject:v16];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  [v21 commit];
  __int16 v17 = *(void **)(a1 + 32);
  uint64_t v18 = v17[2];
  if (v18)
  {
    (*(void (**)(void, void))(v18 + 16))(v17[2], 0);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(v19 + 16);
    *(void *)(v19 + 16) = 0;

    __int16 v17 = *(void **)(a1 + 32);
  }
  [v17 _dequeuePendingActions];
}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 10, a3, @"Failed to build playback context: %@", *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 40) rollback];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_2;
    v11[3] = &unk_2643C2350;
    id v12 = v5;
    id v16 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v14 = v7;
    uint64_t v15 = v8;
    uint64_t v17 = *(void *)(a1 + 72);
    id v9 = (id)[v12 getSharedListeningTracklistWithCompletion:v11];
  }
}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    id v9 = [*(id *)(a1 + 48) insertAfterContentItemID];
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    long long v24 = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_3;
    long long v25 = &unk_2643C2DC0;
    id v28 = *(id *)(a1 + 64);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    id v26 = v10;
    uint64_t v27 = v11;
    id v12 = _Block_copy(&aBlock);
    if (v9)
    {
      id v13 = [*(id *)(a1 + 56) _componentsForContentItemID:v9];
      id v14 = [v13 itemID];
    }
    else
    {
      id v14 = 0;
    }
    if ([*(id *)(a1 + 40) allowsChangingCurrentItem])
    {
      [*(id *)(*(void *)(a1 + 56) + 120) insertTracklist:v7 afterItemIdentifier:v14 playNowWithPreferredStartIndexPath:v8 completionEx:v12];
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v15 = [*(id *)(a1 + 48) insertionPosition];
    if (v15 == 3)
    {
      uint64_t v16 = [MEMORY[0x263F89300] specifiedPositionAfterItemIdentifier:v14];
    }
    else if (v15 == 2)
    {
      uint64_t v16 = [MEMORY[0x263F89300] playLastPositionWithAfterItemIdentifierHint:v14];
    }
    else
    {
      if (v15)
      {
        uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v19 = *(void *)(a1 + 72);
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v21 = [*(id *)(a1 + 48) insertionPosition];
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, @"_MPCQueueControllerBehaviorMusicSharePlay.m", 905, @"[BMSP] completion performInsertCommand unsupported insertion position: %ld", v21, aBlock, v23, v24, v25);

        uint64_t v17 = 0;
        goto LABEL_16;
      }
      uint64_t v16 = [MEMORY[0x263F89300] playNextPositionWithAfterItemIdentifierHint:v14];
    }
    uint64_t v17 = (void *)v16;
LABEL_16:
    [*(id *)(*(void *)(a1 + 56) + 120) insertTracklist:v7 atPosition:v17 completionEx:v12];

    goto LABEL_17;
  }
  id v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 10, a4, @"Failed to build shared tracklist for context: %@", *(void *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 40) rollback];
LABEL_18:
}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  id v7 = v8;
  msv_dispatch_on_main_queue();
}

void __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 7, v2, @"Failed to insert content");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id v5 = *(void **)(a1 + 40);
    [v5 rollback];
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) _componentsForSharedListeningItemID:*(void *)(a1 + 56)];
    id v6 = *(void **)(a1 + 40);
    id v7 = [v8 contentItemID];
    [v6 setSuggestedContentItemIDForStart:v7];

    [*(id *)(a1 + 40) commit];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_2;
    v9[3] = &unk_2643C2328;
    id v10 = v5;
    id v7 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    id v8 = (id)[v10 getSharedListeningTracklistWithCompletion:v9];
  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 10, a4, @"Failed to build shared tracklist for context: %@", *(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_3;
    block[3] = &unk_2643C3D38;
    block[4] = *(void *)(a1 + 40);
    id v11 = v7;
    id v12 = v8;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 120);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_4;
  v5[3] = &unk_2643C2300;
  v5[4] = v1;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v3 insertTracklist:v2 afterItemIdentifier:0 playNowWithPreferredStartIndexPath:v4 completionEx:v5];
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_5;
  v11[3] = &unk_2643C3D38;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 5, @"canReuseQueue -> linkLink.queue.PlayNow failed");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 40) _componentsForSharedListeningItemID:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [v2 contentItemID];
  (*(void (**)(uint64_t, uint64_t, void *, __CFString *, id))(v3 + 16))(v3, 1, v4, @"live link processed", v5);
}

void __95___MPCQueueControllerBehaviorMusicSharePlay_setAutoPlayEnabled_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = [WeakRetained host];
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 engineID];
      id v9 = [v5 sessionID];
      int v10 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      __int16 v16 = 1024;
      int v17 = v10;
      __int16 v18 = 2114;
      id v19 = v3;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | failed [server error] autoPlayEnabled=%{BOOL}u error=%{public}@", buf, 0x26u);
    }
    id v11 = objc_msgSend(v3, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 4, @"setAutoPlayEnabled:%ld failed", *(unsigned __int8 *)(a1 + 48));
  }
  else
  {
    id v11 = 0;
  }
  [v5 _emitEventsForPlaybackBehaviorChange];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v8;
  id v7 = v5;
  msv_dispatch_on_main_queue();
}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    BOOL v2 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_3;
    v9[3] = &unk_2643C2238;
    id v5 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    objc_copyWeak(v13, &location);
    id v6 = v4;
    v13[1] = *(id *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    [v5 _enqueuePendingActionWithLabel:@"getExpectedCurrentItemModelObject" itemIdentifier:v6 block:v9];

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCMusicSharePlayBehaviorError", 15);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v8);
  }
}

void __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 13, @"failed to get model object - pending action timed out");
    __int16 v14 = (id *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id *))(v3 + 16))(v3, 0, v14);
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
    __int16 v14 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = [WeakRetained _componentsForSharedListeningItemID:*(void *)(a1 + 32)];
      if (!v5)
      {
        id v12 = [MEMORY[0x263F08690] currentHandler];
        [v12 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"_MPCQueueControllerBehaviorMusicSharePlay.m", 208, @"Pending action flushed but item was still not found [nil components]: %@", *(void *)(a1 + 32) object file lineNumber description];
      }
      id v6 = [v14[16] response];
      uint64_t v7 = [v6 modelResponse];
      id v8 = [v7 results];

      id v9 = [v14[20] objectForKeyedSubscript:*(void *)(a1 + 32)];
      if (!v9)
      {
        uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
        [v13 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"_MPCQueueControllerBehaviorMusicSharePlay.m", 212, @"Pending action flushed but item was still not found [nil indexPath]: %@", *(void *)(a1 + 32) object file lineNumber description];
      }
      id v10 = [v8 itemAtIndexPath:v9];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      id v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicSharePlayBehaviorError", 11, @"failed to get model object - sharePlay behavior was dealloc'd");
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v5);
    }
  }
}

@end