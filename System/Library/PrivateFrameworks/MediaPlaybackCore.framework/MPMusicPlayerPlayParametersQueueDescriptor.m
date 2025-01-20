@interface MPMusicPlayerPlayParametersQueueDescriptor
@end

@implementation MPMusicPlayerPlayParametersQueueDescriptor

uint64_t __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_131(uint64_t a1, void *a2)
{
  return [a2 setPersonalStoreIdentifiersWithPersonID:*(void *)(a1 + 32) block:&__block_literal_global_134];
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_2_138(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identifiersMatchingIdentifierSet:v3 propertySet:*(void *)(a1 + 40) options:0 error:0];
  if (!v4) {
    id v4 = v3;
  }

  return v4;
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 universalStore];
  uint64_t v4 = [v3 subscriptionAdamID];

  v5 = [v2 universalStore];
  v6 = v5;
  if (v4)
  {
    uint64_t quot = [v5 subscriptionAdamID];
    uint64_t v8 = quot;
    v9 = (char *)&v23 + 1;
    do
    {
      lldiv_t v10 = lldiv(quot, 10);
      uint64_t quot = v10.quot;
      if (v10.rem >= 0) {
        LOBYTE(v11) = v10.rem;
      }
      else {
        uint64_t v11 = -v10.rem;
      }
      *(v9 - 2) = v11 + 48;
      v12 = (const UInt8 *)(v9 - 2);
      --v9;
    }
    while (v10.quot);
LABEL_14:
    if (v8 < 0)
    {
      *(v9 - 2) = 45;
      v12 = (const UInt8 *)(v9 - 2);
    }
    uint64_t v18 = (uint64_t)CFStringCreateWithBytes(0, v12, (char *)&v23 - (char *)v12, 0x8000100u, 0);
    goto LABEL_17;
  }
  uint64_t v13 = [v5 adamID];

  v14 = [v2 universalStore];
  v6 = v14;
  if (v13)
  {
    uint64_t v15 = [v14 adamID];
    uint64_t v8 = v15;
    v9 = (char *)&v23 + 1;
    do
    {
      lldiv_t v16 = lldiv(v15, 10);
      uint64_t v15 = v16.quot;
      if (v16.rem >= 0) {
        LOBYTE(v17) = v16.rem;
      }
      else {
        uint64_t v17 = -v16.rem;
      }
      *(v9 - 2) = v17 + 48;
      v12 = (const UInt8 *)(v9 - 2);
      --v9;
    }
    while (v16.quot);
    goto LABEL_14;
  }
  v21 = [v14 globalPlaylistID];
  uint64_t v22 = [v21 length];

  if (v22)
  {
    v6 = [v2 universalStore];
    uint64_t v18 = [v6 globalPlaylistID];
LABEL_17:
    v19 = (void *)v18;

    goto LABEL_18;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

id __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F12028];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithIdentifiers:v3 block:&__block_literal_global_143];

  return v4;
}

uint64_t __129__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___classicalMusicAppPlaybackContextForPlayParametersQueue___block_invoke_135(uint64_t a1, void *a2)
{
  return [a2 identifiers];
}

id __164__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___playbackContextForStorePlayParameters_libraryItems_radioPlaybackContext_containsStartItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isLibraryContent]) {
    [v2 catalogID];
  }
  else {
  id v3 = [v2 itemID];
  }

  return v3;
}

id __164__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___playbackContextForStorePlayParameters_libraryItems_radioPlaybackContext_containsStartItem___block_invoke_2_55(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F12028];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 identifiers];

  v6 = (void *)[v4 initWithIdentifiers:v5 block:&__block_literal_global_61];

  return v6;
}

void __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke(uint64_t a1, void *a2, id *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  v12 = objc_alloc_init(MPCModelRadioPlaybackContext);
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F11FD8]) initWithIdentifiers:v10 block:&__block_literal_global_13787];

  [(MPCModelRadioPlaybackContext *)v12 setRadioStation:v13];
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v19 = 138543362;
    uint64_t v20 = v15;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MusicKit: Adding playback context for radio station: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  lldiv_t v16 = objc_msgSend(*(id *)(a1 + 40), "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", *(void *)(a1 + 48), *(void *)(a1 + 56), v12, objc_msgSend(*a3, "BOOLValue"));
  [v11 addObject:v16];

  *a3 = (id)MEMORY[0x263EFFA80];
  [*(id *)(a1 + 48) removeAllObjects];
  [*(id *)(a1 + 56) removeAllObjects];
  uint64_t v17 = [*(id *)(a1 + 40) startItemPlayParameters];
  int v18 = [v17 isEqual:v9];

  if (v18) {
    *a3 = (id)MEMORY[0x263EFFA88];
  }
}

void __204__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions___updatePlaybackContextsForPlaybackParametersQueue_libraryItems_radioPlaybackContext_storePlayParameters_contexts_containsStartItem___block_invoke_32(uint64_t a1, uint64_t a2, id *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v19 = 138543362;
    uint64_t v20 = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "MusicKit: Adding store playback context for store play parameters %{public}@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  if (v13)
  {
    if (v10 || (v14 = [*(id *)(a1 + 40) count], uint64_t v13 = *(void **)(a1 + 32), v14))
    {
      uint64_t v15 = *(void **)(a1 + 48);
      lldiv_t v16 = objc_msgSend(*(id *)(a1 + 56), "_playbackContextForStorePlayParameters:libraryItems:radioPlaybackContext:containsStartItem:", v13, *(void *)(a1 + 40), *(void *)(a1 + 64), objc_msgSend(*a3, "BOOLValue"));
      [v15 addObject:v16];

      *a3 = (id)MEMORY[0x263EFFA80];
      [*(id *)(a1 + 40) removeAllObjects];
      uint64_t v13 = *(void **)(a1 + 32);
    }
    [v13 addObject:v9];
    uint64_t v17 = [*(id *)(a1 + 56) startItemPlayParameters];
    int v18 = [v17 isEqual:v9];

    if (v18)
    {
      id v10 = 0;
      *a3 = (id)MEMORY[0x263EFFA88];
    }
    else
    {
      id v10 = 0;
    }
  }
}

void __89__MPMusicPlayerPlayParametersQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  id v3 = (void *)[v2 mutableCopy];
  id v4 = [v3 stringByAppendingString:@".tst"];

  v7[0] = v2;
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6 = [*(id *)(a1 + 32) requestingBundleIdentifier];
  playbackContexts_isClassicMusicApp = [v5 containsObject:v6];
}

@end