@interface MPCMusicPlayerControllerServer
@end

@implementation MPCMusicPlayerControllerServer

uint64_t __68___MPCMusicPlayerControllerServer__handleCommandHandlersRegistered___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeIfNeeded];
}

void __66___MPCMusicPlayerControllerServer__handleMPAVItemTitlesDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 playbackEngine];
  v4 = [v3 player];
  v5 = [v4 currentItem];
  id v7 = [v2 _nowPlayingWithItem:v5];

  [*(id *)(*(void *)(a1 + 32) + 56) setNowPlaying:v7];
  id v6 = objc_alloc_init(MEMORY[0x263F120D0]);
  [v6 setHasTimeMetadata:1];
  [v6 setHasNowPlaying:1];
  [v6 setNowPlaying:v7];
  [*(id *)(a1 + 32) _applyServerStateUpdateRecord:v6];
}

void __94___MPCMusicPlayerControllerServer__invokeServerCommandEvent_remoteCommandSenderID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: _invokeServerCommandEvent:… stop dispatch [] serverEvent=%{public}@ statuses=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

void __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    int v11 = v3;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: connection invalidated: pid=%u", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = v5;
  if (WeakRetained && v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_164;
    v7[3] = &unk_2643C5EE8;
    id v8 = WeakRetained;
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __70___MPCMusicPlayerControllerServer_listener_shouldAcceptNewConnection___block_invoke_164(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = dispatch_group_create();
  int v3 = [MEMORY[0x263EFF980] array];
  v4 = [*(id *)(a1 + 32) queueController];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = a1;
  id obj = [*(id *)(a1 + 40) removedItemIdentifiers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        dispatch_group_enter(v2);
        uint64_t v10 = [v4 music];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2;
        v27[3] = &unk_2643C4B00;
        id v28 = v3;
        v29 = v2;
        [v10 removeContentItemID:v9 completion:v27];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  int v11 = [*(id *)(a1 + 40) insertedDescriptors];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3;
  v22[3] = &unk_2643BF3C0;
  uint64_t v12 = *(void **)(v17 + 56);
  v22[4] = *(void *)(v17 + 48);
  id v23 = v12;
  v24 = v2;
  id v25 = v4;
  id v13 = v3;
  id v26 = v13;
  id v14 = v4;
  v15 = v2;
  [v11 enumerateKeysAndObjectsUsingBlock:v22];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3_154;
  block[3] = &unk_2643C55A8;
  id v20 = v13;
  id v21 = *(id *)(v17 + 64);
  id v16 = v13;
  dispatch_group_notify(v15, MEMORY[0x263EF83A0], block);
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v35 = a2;
  [a3 playbackContexts];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = v42 = 0u;
  id obj = [v28 reverseObjectEnumerator];
  uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v33 = *MEMORY[0x263F54C88];
    uint64_t v34 = *(void *)v40;
    uint64_t v32 = *MEMORY[0x263F54D60];
    uint64_t v30 = *MEMORY[0x263F54CD8];
    uint64_t v31 = *MEMORY[0x263F54D18];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v39 + 1) + 8 * v7);
        id v9 = v35;
        uint64_t v10 = [*(id *)(a1 + 32) playbackEngine];
        int v11 = [v10 mediaRemotePublisher];
        uint64_t v12 = [v11 commandCenter];

        id v13 = [[MPCPlaybackContextRemotePlaybackQueue alloc] initWithPlaybackContext:v8];
        id v14 = [MEMORY[0x263EFF9D0] null];

        id v15 = objc_alloc(MEMORY[0x263F11DB8]);
        id v16 = [v12 insertIntoPlaybackQueueCommand];
        if (v14 == v9)
        {
          v45[0] = v33;
          id v23 = MSVNanoIDCreateTaggedPointer();
          v18 = [@"MPMusicPlayer-" stringByAppendingString:v23];

          v46[0] = v18;
          v46[1] = @"MPCMusicPlayerControllerServer";
          v45[1] = v32;
          v45[2] = @"kMRMediaRemoteOptionSenderID";
          uint64_t v24 = *(void *)(a1 + 40);
          v45[3] = @"MPRemoteCommandQueueInsertionPosition";
          v46[2] = v24;
          v46[3] = &unk_26CC18C90;
          v19 = NSDictionary;
          id v20 = v46;
          id v21 = v45;
          uint64_t v22 = 4;
        }
        else
        {
          v43[0] = v33;
          uint64_t v17 = MSVNanoIDCreateTaggedPointer();
          v18 = [@"MPMusicPlayer-" stringByAppendingString:v17];

          v44[0] = v18;
          v44[1] = @"MPCMusicPlayerControllerServer";
          v43[1] = v32;
          v43[2] = @"kMRMediaRemoteOptionSenderID";
          v44[2] = *(void *)(a1 + 40);
          v44[3] = &unk_26CC18CA8;
          v43[3] = v31;
          v43[4] = v30;
          v44[4] = v9;
          v19 = NSDictionary;
          id v20 = v44;
          id v21 = v43;
          uint64_t v22 = 5;
        }
        id v25 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
        id v26 = (void *)[v15 initWithCommand:v16 playbackQueue:v13 options:v25];

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v27 = [*(id *)(a1 + 56) upNextBehavior];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_151;
        v36[3] = &unk_2643C4B00;
        id v37 = *(id *)(a1 + 64);
        id v38 = *(id *)(a1 + 48);
        [v27 performInsertCommand:v26 targetContentItemID:0 completion:v36];

        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v6);
  }
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_3_154(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = (void *)MEMORY[0x263F087E8];
    uint64_t v3 = *MEMORY[0x263F11B30];
    v4 = [*(id *)(a1 + 32) firstObject];
    objc_msgSend(v2, "msv_errorWithDomain:code:underlyingError:debugDescription:", v3, 3, v4, @"Failed to apply queue modifications");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_151(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2_152;
  block[3] = &unk_2643C6660;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __72___MPCMusicPlayerControllerServer_performQueueModifications_completion___block_invoke_2_152(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  id v4 = [v3 commandCenter];

  id v5 = [v4 changePlaybackRateCommand];
  if ([v5 isSupported])
  {
    id v7 = *(void **)(a1 + 32);
    LODWORD(v6) = *(_DWORD *)(a1 + 64);
    id v8 = (void *)[v5 newCommandEventWithPlaybackRate:v6];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke_2;
    v16[3] = &unk_2643BF348;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v17 = v10;
    uint64_t v18 = v11;
    [v7 _invokeServerCommandEvent:v8 remoteCommandSenderID:v9 completion:v16];

    uint64_t v12 = v17;
  }
  else
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v20 = [v5 isEnabled];
      __int16 v21 = 1024;
      int v22 = [v5 isSupported];
      __int16 v23 = 1024;
      int v24 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackRate: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    uint64_t v12 = v14;
    os_signpost_id_t v15 = *(void *)(a1 + 56);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_END, v15, "setPlaybackRate", "", buf, 2u);
    }
  }
}

void __62___MPCMusicPlayerControllerServer_setPlaybackRate_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setPlaybackRate", "", v5, 2u);
  }
}

void __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  id v5 = [v4 changePlaybackPositionCommand];
  if ([v5 isSupportedAndEnabled])
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = (void *)[v5 newCommandEventWithPositionTime:*(double *)(a1 + 56)];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke_2;
    v15[3] = &unk_2643BF348;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    id v16 = v9;
    uint64_t v17 = v10;
    [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:v8 completion:v15];

    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      int v19 = [v5 isEnabled];
      __int16 v20 = 1024;
      int v21 = [v5 isSupported];
      __int16 v22 = 1024;
      int v23 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackPosition: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    uint64_t v11 = v13;
    os_signpost_id_t v14 = *(void *)(a1 + 64);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v14, "setElapsedTime", "", buf, 2u);
    }
  }
}

void __61___MPCMusicPlayerControllerServer_setElapsedTime_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "setElapsedTime", "", v5, 2u);
  }
}

void __59___MPCMusicPlayerControllerServer_getShuffleModeWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  id v5 = [v3 commandCenter];

  os_signpost_id_t v4 = [v5 changeShuffleModeCommand];
  [v4 currentShuffleType];
  MPMusicShuffleModeForMPShuffleType();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50___MPCMusicPlayerControllerServer_setShuffleMode___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  id v5 = [v4 changeShuffleModeCommand];
  if ([v5 isSupportedAndEnabled])
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:1000];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_125;
        goto LABEL_10;
      case 1:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:0];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_127_2754;
        goto LABEL_10;
      case 2:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:1];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_129;
        goto LABEL_10;
      case 3:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:0];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_131_2755;
LABEL_10:
        [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:v8 completion:v9];

        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109632;
      v11[1] = [v5 isEnabled];
      __int16 v12 = 1024;
      int v13 = [v5 isSupported];
      __int16 v14 = 1024;
      int v15 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changeShuffleMode: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v11, 0x14u);
    }
  }
}

void __58___MPCMusicPlayerControllerServer_getRepeatModeWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  id v5 = [v3 commandCenter];

  os_signpost_id_t v4 = [v5 changeRepeatModeCommand];
  [v4 currentRepeatType];
  MPMusicRepeatModeForMPRepeatType();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49___MPCMusicPlayerControllerServer_setRepeatMode___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  id v5 = [v4 changeRepeatModeCommand];
  if ([v5 isSupportedAndEnabled])
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:3];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_117;
        goto LABEL_10;
      case 1:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:0];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_119;
        goto LABEL_10;
      case 2:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:1];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_121;
        goto LABEL_10;
      case 3:
        double v6 = *(void **)(a1 + 32);
        id v7 = (void *)[v5 newCommandEventWithType:2];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = &__block_literal_global_123;
LABEL_10:
        [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:v8 completion:v9];

        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109632;
      v11[1] = [v5 isEnabled];
      __int16 v12 = 1024;
      int v13 = [v5 isSupported];
      __int16 v14 = 1024;
      int v15 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changeRepeatMode: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v11, 0x14u);
    }
  }
}

void __42___MPCMusicPlayerControllerServer_endSeek__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  id v5 = [v4 seekForwardCommand];
  if ([v5 isSupportedAndEnabled])
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = (void *)[v5 newSeekCommandEventWithType:1];
    [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:*(void *)(a1 + 40) completion:&__block_literal_global_115];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = [v5 isEnabled];
      __int16 v10 = 1024;
      int v11 = [v5 isSupported];
      __int16 v12 = 1024;
      int v13 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: seekForward: endSeeking: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }
  }
}

void __58___MPCMusicPlayerControllerServer_beginSeekWithDirection___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5 == -1)
  {
    double v6 = [v4 seekBackwardCommand];
    if ([v6 isSupportedAndEnabled])
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = (void *)[v6 newCommandEvent];
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = &__block_literal_global_113;
      goto LABEL_7;
    }
    int v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109632;
      int v14 = [v6 isEnabled];
      __int16 v15 = 1024;
      int v16 = [v6 isSupported];
      __int16 v17 = 1024;
      int v18 = [v4 commandHandlersRegistered];
      __int16 v12 = "MPCMusicPlayerControllerServer: seekBackward: dropping command [not enabled or not ready] enabled=%{BOOL}u, "
            "supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v5 == 1)
  {
    double v6 = [v4 seekForwardCommand];
    if ([v6 isSupportedAndEnabled])
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = (void *)[v6 newCommandEvent];
      uint64_t v9 = *(void *)(a1 + 40);
      __int16 v10 = &__block_literal_global_110;
LABEL_7:
      [v7 _invokeServerCommandEvent:v8 remoteCommandSenderID:v9 completion:v10];

LABEL_14:
      goto LABEL_15;
    }
    int v11 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109632;
      int v14 = [v6 isEnabled];
      __int16 v15 = 1024;
      int v16 = [v6 isSupported];
      __int16 v17 = 1024;
      int v18 = [v4 commandHandlersRegistered];
      __int16 v12 = "MPCMusicPlayerControllerServer: seekForward: dropping command [not enabled or not ready] enabled=%{BOOL}u, s"
            "upported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
LABEL_12:
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0x14u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_15:
}

void __44___MPCMusicPlayerControllerServer_reshuffle__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  uint64_t v5 = [v4 reshuffleCommand];
  if ([v5 isSupportedAndEnabled])
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = (void *)[v5 newCommandEvent];
    [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:*(void *)(a1 + 40) completion:&__block_literal_global_108];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = [v5 isEnabled];
      __int16 v10 = 1024;
      int v11 = [v5 isSupported];
      __int16 v12 = 1024;
      int v13 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: reshuffle: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }
  }
}

void __52___MPCMusicPlayerControllerServer_skipWithBehavior___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  switch(*(void *)(a1 + 48))
  {
    case 0:
      uint64_t v5 = [v4 previousTrackCommand];
      if ([v5 isSupportedAndEnabled])
      {
        double v6 = *(void **)(a1 + 32);
        v15[0] = *MEMORY[0x263F54D70];
        v15[1] = @"MPCRemoteCommandEventOptionSkipImmediatelyKey";
        v16[0] = MEMORY[0x263EFFA88];
        v16[1] = MEMORY[0x263EFFA88];
        id v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
        uint64_t v8 = (void *)[v5 newCommandEventWithCommandType:5 options:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        __int16 v10 = &__block_literal_global_106;
        goto LABEL_10;
      }
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      goto LABEL_19;
    case 1:
      uint64_t v5 = [v4 nextTrackCommand];
      if ([v5 isSupportedAndEnabled])
      {
        double v6 = *(void **)(a1 + 32);
        uint64_t v25 = @"MPCRemoteCommandEventOptionSkipImmediatelyKey";
        v26[0] = MEMORY[0x263EFFA88];
        id v7 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
        uint64_t v8 = (void *)[v5 newCommandEventWithCommandType:4 options:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        __int16 v10 = &__block_literal_global_97;
        goto LABEL_10;
      }
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 67109632;
      int v20 = [v5 isEnabled];
      __int16 v21 = 1024;
      int v22 = [v5 isSupported];
      __int16 v23 = 1024;
      int v24 = [v4 commandHandlersRegistered];
      int v13 = "MPCMusicPlayerControllerServer: nextTrack: dropping command [not enabled or not ready] enabled=%{BOOL}u, sup"
            "ported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
      goto LABEL_20;
    case 2:
      uint64_t v5 = [v4 changePlaybackPositionCommand];
      if ([v5 isSupportedAndEnabled])
      {
        int v11 = *(void **)(a1 + 32);
        __int16 v12 = (void *)[v5 newCommandEventWithPositionTime:0.0];
        [v11 _invokeServerCommandEvent:v12 remoteCommandSenderID:*(void *)(a1 + 40) completion:&__block_literal_global_100];
      }
      else
      {
        uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          int v20 = [v5 isEnabled];
          __int16 v21 = 1024;
          int v22 = [v5 isSupported];
          __int16 v23 = 1024;
          int v24 = [v4 commandHandlersRegistered];
          _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: changePlaybackPosition: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", buf, 0x14u);
        }
      }
      goto LABEL_22;
    case 3:
      uint64_t v5 = [v4 previousTrackCommand];
      if ([v5 isSupportedAndEnabled])
      {
        double v6 = *(void **)(a1 + 32);
        __int16 v17 = @"MPCRemoteCommandEventOptionSkipImmediatelyKey";
        uint64_t v18 = MEMORY[0x263EFFA88];
        id v7 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v8 = (void *)[v5 newCommandEventWithCommandType:5 options:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        __int16 v10 = &__block_literal_global_103;
LABEL_10:
        [v6 _invokeServerCommandEvent:v8 remoteCommandSenderID:v9 completion:v10];
      }
      else
      {
        id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:
          *(_DWORD *)buf = 67109632;
          int v20 = [v5 isEnabled];
          __int16 v21 = 1024;
          int v22 = [v5 isSupported];
          __int16 v23 = 1024;
          int v24 = [v4 commandHandlersRegistered];
          int v13 = "MPCMusicPlayerControllerServer: previousTrack: dropping command [not enabled or not ready] enabled=%{BOO"
                "L}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u";
LABEL_20:
          _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, v13, buf, 0x14u);
        }
      }
LABEL_21:

LABEL_22:
LABEL_23:

      return;
    default:
      goto LABEL_23;
  }
}

void __57___MPCMusicPlayerControllerServer_pauseWithFadeDuration___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  uint64_t v5 = [v4 pauseCommand];
  if ([v5 isSupportedAndEnabled])
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = (void *)[v5 newCommandEvent];
    [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:*(void *)(a1 + 40) completion:&__block_literal_global_95];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = [v5 isEnabled];
      __int16 v10 = 1024;
      int v11 = [v5 isSupported];
      __int16 v12 = 1024;
      int v13 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: pause: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }
  }
}

void __39___MPCMusicPlayerControllerServer_play__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 mediaRemotePublisher];
  os_signpost_id_t v4 = [v3 commandCenter];

  uint64_t v5 = [v4 playCommand];
  if ([v5 isSupportedAndEnabled])
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = (void *)[v5 newCommandEvent];
    [v6 _invokeServerCommandEvent:v7 remoteCommandSenderID:*(void *)(a1 + 40) completion:&__block_literal_global_93];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = [v5 isEnabled];
      __int16 v10 = 1024;
      int v11 = [v5 isSupported];
      __int16 v12 = 1024;
      int v13 = [v4 commandHandlersRegistered];
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPCMusicPlayerControllerServer: play: dropping command [not enabled or not ready] enabled=%{BOOL}u, supported=%{BOOL}u, commandHandlersRegistered=%{BOOL}u", (uint8_t *)v9, 0x14u);
    }
  }
}

void __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 statusCode];

  if (v5)
  {
    double v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F11B30];
    uint64_t v8 = [v3 firstObject];
    uint64_t v9 = [v8 error];
    __int16 v10 = objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", v7, 6, v9, @"Failed to prepare queue for append");

    (*((void (**)(void))a1[7] + 2))();
  }
  else if ((unint64_t)[a1[4] count] < 2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v11 = a1[4];
    id v12 = a1[6];
    id v13 = a1[7];
    msv_dispatch_on_main_queue();
  }
}

void __92___MPCMusicPlayerControllerServer__appendPlaybackContexts_remoteCommandSenderID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v2 removeObjectAtIndex:0];
  [*(id *)(a1 + 40) _appendPlaybackContexts:v2 remoteCommandSenderID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __63___MPCMusicPlayerControllerServer_appendDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _appendPlaybackContexts:*(void *)(a1 + 40) remoteCommandSenderID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return result;
}

void __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke(id *a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = [v3 statusCode];

  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 6, @"Failed to prepare queue for prepend");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[7] + 2))();
  }
  else if ((unint64_t)[a1[4] count] < 2)
  {
    uint64_t v5 = (void (*)(void))*((void *)a1[7] + 2);
    v5();
  }
  else
  {
    id v7 = a1[4];
    id v8 = a1[6];
    id v9 = a1[7];
    msv_dispatch_on_main_queue();
  }
}

void __93___MPCMusicPlayerControllerServer__prependPlaybackContexts_remoteCommandSenderID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v2 removeLastObject];
  [*(id *)(a1 + 40) _prependPlaybackContexts:v2 remoteCommandSenderID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __64___MPCMusicPlayerControllerServer_prependDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _prependPlaybackContexts:*(void *)(a1 + 40) remoteCommandSenderID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return result;
}

uint64_t __58___MPCMusicPlayerControllerServer_getDescriptorWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8), 0);
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = (void *)MEMORY[0x263F11B30];
  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 2, @"Queue was interrupted by another queue");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  id v8 = _Block_copy(*(const void **)(a1 + 88));
  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  dispatch_time_t v11 = dispatch_time(0, 9000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_2;
  block[3] = &unk_2643C5EE8;
  id v12 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v36 = v12;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
  id v13 = [MEMORY[0x263F08C38] UUID];
  if ((unint64_t)[*(id *)(a1 + 48) count] <= 1) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v14);
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = (unint64_t)[*(id *)(a1 + 48) count] > 1;
  __int16 v15 = [*(id *)(a1 + 32) playbackEngine];
  int v16 = [v15 mediaRemotePublisher];
  __int16 v17 = [v16 commandCenter];

  uint64_t v18 = [v17 setPlaybackQueueCommand];
  if ([v18 isSupportedAndEnabled])
  {
    if ([*(id *)(a1 + 56) hasSuffix:@"iapd"]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 10;
    }
    [*(id *)(a1 + 64) setActionAfterQueueLoad:v19];
    int v20 = [[MPCPlaybackContextRemotePlaybackQueue alloc] initWithPlaybackContext:*(void *)(a1 + 64)];
    [(MPCPlaybackContextRemotePlaybackQueue *)v20 setReplaceIntent:1];
    __int16 v21 = (void *)[objc_alloc(MEMORY[0x263F12238]) initWithCommand:v18 playbackQueue:v20];
    int v22 = *(void **)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 72);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_3;
    v29[3] = &unk_2643BF2F8;
    v29[4] = v22;
    id v30 = v13;
    id v31 = *(id *)(a1 + 48);
    id v32 = *(id *)(a1 + 72);
    id v33 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 80);
    [v22 _invokeServerCommandEvent:v21 remoteCommandSenderID:v23 completion:v29];
  }
  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 24);
    uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *v4, 7, @"SetPlaybackQueue is currently not enabled or the playback engine is not ready");
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 24);
    *(void *)(v26 + 24) = 0;

    uint64_t v28 = *(void *)(a1 + 32);
    int v20 = *(MPCPlaybackContextRemotePlaybackQueue **)(v28 + 16);
    *(void *)(v28 + 16) = 0;
  }
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16) == *(void *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(v1 + 24);
    if (v2)
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 9, @"Preparing queue timed out");
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;

      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = 0;
    }
  }
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = [v3 statusCode];

  if ([*(id *)(*(void *)(a1 + 32) + 40) isEqual:*(void *)(a1 + 40)]) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    msv_dispatch_on_main_queue();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 16) == *(void *)(a1 + 64))
  {
    uint64_t v7 = *(void *)(v6 + 24);
    if (v7)
    {
      if (v4)
      {
        id v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 6, @"Failed to prepare to play");
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
      }
      else
      {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
        if (![*(id *)(a1 + 64) disableQueueModifications])
        {
LABEL_16:
          uint64_t v14 = *(void *)(a1 + 32);
          __int16 v15 = *(void **)(v14 + 24);
          *(void *)(v14 + 24) = 0;

          uint64_t v16 = *(void *)(a1 + 32);
          __int16 v17 = *(void **)(v16 + 16);
          *(void *)(v16 + 16) = 0;

          return;
        }
        uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v10 = [*(id *)(a1 + 72) engineID];
          uint64_t v11 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138543618;
          int v22 = v10;
          __int16 v23 = 2114;
          uint64_t v24 = v11;
          _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[MPCS:%{public}@] setDescriptor:completion: | disabling queue modification [client] descriptor=%{public}@", buf, 0x16u);
        }
        id v12 = [*(id *)(a1 + 72) queueController];
        id v13 = [v12 music];
        [v13 setAllowsQueueModifications:0];

        id v8 = [*(id *)(a1 + 72) mediaRemotePublisher];
        [v8 publishIfNeeded];
      }

      goto LABEL_16;
    }
  }
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v2 removeObjectAtIndex:0];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_5;
  v5[3] = &unk_2643C4B00;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 56);
  [v3 _appendPlaybackContexts:v2 remoteCommandSenderID:v4 completion:v5];
}

void __60___MPCMusicPlayerControllerServer_setDescriptor_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 16) == *(void *)(a1 + 40))
  {
    uint64_t v5 = *(void *)(v4 + 24);
    if (v5)
    {
      id v12 = v3;
      (*(void (**)(void))(v5 + 16))();
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 24);
      *(void *)(v6 + 24) = 0;

      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 16);
      *(void *)(v8 + 16) = 0;

      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;

      id v3 = v12;
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    }
  }
}

void __60___MPCMusicPlayerControllerServer_getTimeSnapshotWithReply___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  LODWORD(a3) = 2143289344;
  id v4 = [*(id *)(a1 + 32) _timeSnapshotWithElapsedTime:NAN rate:a3];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playbackEngine];
  uint64_t v3 = [v2 queueController];

  id v4 = [v3 itemForContentItemID:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 modelGenericObject];
  uint64_t v6 = [v5 anyObject];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 artworkCatalog];
    objc_msgSend(v7, "setFittingSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke_2;
    v10[3] = &unk_2643BF2A8;
    id v13 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v7 requestImageWithCompletion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 7, @"%@:%@ does not support artwork.", *(void *)(a1 + 40), *(void *)(a1 + 48));
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

void __92___MPCMusicPlayerControllerServer_getImageForArtworkIdentifier_itemIdentifier_atSize_reply___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = MEMORY[0x21D49CBF0](a2);
    uint64_t v5 = *(void (**)(void))(a1[6] + 16);
    id v8 = (id)v4;
  }
  else
  {
    uint64_t v6 = a1[6];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x263F11B30], 8, a3, @"%@:%@ did not provide image data.", a1[4], a1[5]);
    uint64_t v5 = *(void (**)(void))(v6 + 16);
    id v8 = (id)v7;
  }
  v5();
}

void __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFF00;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))*(void *)(a1 + 56);
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v2;
    *(_WORD *)&buf[22] = 2048;
    id v31 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu contentItemHash=%llu repeatIteration=%llu", buf, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) playbackEngine];
  uint64_t v7 = [v6 queueController];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v31 = __Block_byref_object_copy__2851;
  id v32 = __Block_byref_object_dispose__2852;
  id v33 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke_30;
  v21[3] = &unk_2643BF280;
  id v8 = v7;
  uint64_t v24 = -256;
  unint64_t v25 = v2;
  id v22 = v8;
  __int16 v23 = buf;
  [v8 enumerateContentItemIDsInMode:1 block:v21];
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    if (v3)
    {
      uint64_t v9 = [v8 music];
      BOOL v10 = v9 == 0;

      if (!v10)
      {
        id v11 = [v8 music];
        uint64_t v12 = [v11 copyContentItemID:*(void *)(*(void *)&buf[8] + 40) repeatIteration:v3];
        id v13 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v12;
      }
    }
    uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v26 = 134218242;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v16;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu jumping to item [found match] matchingContentItemID=%{public}@", v26, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setNowPlayingItem:itemIdentifier:remoteCommandSenderID:completion:", 0, *(void *)(*(void *)&buf[8] + 40), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)uint64_t v26 = 134217984;
      uint64_t v27 = v18;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "MPMusicPlayerControllerServer: setNowPlayingUID:%llu dropping command [failed to find match]", v26, 0xCu);
    }

    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 5, @"Cannot find item for UID: %llu", *(void *)(a1 + 56));
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
  _Block_object_dispose(buf, 8);
}

void __63___MPCMusicPlayerControllerServer_setNowPlayingUID_completion___block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) music];

  uint64_t v5 = v3;
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) music];
    uint64_t v5 = [v6 contentItemIDWithoutRepeatIteration:v3];
  }
  v104 = (void *)a1;
  id v105 = v3;
  unint64_t v7 = *MEMORY[0x263F54E90];
  long long v119 = 0u;
  long long v118 = 0u;
  long long v117 = 0u;
  long long v116 = 0u;
  long long v115 = 0u;
  long long v114 = 0u;
  long long v113 = 0u;
  long long v112 = 0u;
  unint64_t v8 = v7 + 0x60EA27EEADC0B5D6;
  unint64_t v9 = v7 - 0x3D4D51C2D82B14B1;
  unint64_t v10 = v7 + 0x61C8864E7A143579;
  long long v106 = xmmword_21BEF1620;
  v107.i64[0] = v7 + 0x60EA27EEADC0B5D6;
  v107.i64[1] = v7 - 0x3D4D51C2D82B14B1;
  unint64_t v108 = v7;
  unint64_t v109 = v7 + 0x61C8864E7A143579;
  id v11 = (uint64_t *)v110;
  memset(v110, 0, sizeof(v110));
  uint64_t v111 = 0;
  id v12 = v5;
  id v13 = (char *)[v12 UTF8String];
  int64_t v14 = [v12 length];
  if (v13)
  {
    int v15 = v14;
    *((void *)&v106 + 1) = v14;
    if ((unint64_t)v14 <= 0x1F)
    {
      memcpy(v110, v13, v14);
      int v16 = v111 + v15;
LABEL_11:
      LODWORD(v111) = v16;
      goto LABEL_12;
    }
    __int16 v17 = &v13[v14];
    if (v14 >= 32)
    {
      do
      {
        unint64_t v8 = 0x9E3779B185EBCA87 * __ROR8__(v8 - 0x3D4D51C2D82B14B1 * *(void *)v13, 33);
        unint64_t v9 = 0x9E3779B185EBCA87 * __ROR8__(v9 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 1), 33);
        unint64_t v7 = 0x9E3779B185EBCA87 * __ROR8__(v7 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 2), 33);
        unint64_t v10 = 0x9E3779B185EBCA87 * __ROR8__(v10 - 0x3D4D51C2D82B14B1 * *((void *)v13 + 3), 33);
        v13 += 32;
      }
      while (v13 <= v17 - 32);
      v107.i64[0] = v8;
      v107.i64[1] = v9;
      unint64_t v108 = v7;
      unint64_t v109 = v10;
    }
    if (v13 < v17)
    {
      int v16 = v17 - v13;
      __memcpy_chk();
      goto LABEL_11;
    }
  }
LABEL_12:

  memset(&v120[8], 0, 64);
  *(void *)v120 = v106;
  if ((uint64_t)v106 > 3000)
  {
    if ((uint64_t)v106 <= 4000)
    {
      if ((void)v106 == 3001)
      {
        if (*((void *)&v106 + 1) < 0x20uLL) {
          unint64_t v54 = v108 + 0x27D4EB2F165667C5;
        }
        else {
          unint64_t v54 = 0x85EBCA77C2B2AE63
        }
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((0x85EBCA77C2B2AE63
                    - 0x61C8864E7A143579
                    * ((__ROR8__(v107.i64[1], 57) + __ROR8__(v107.i64[0], 63) + __ROR8__(v108, 52) + __ROR8__(v109, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v107.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v107.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v108, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v109, 33)));
        unint64_t v56 = v54 + *((void *)&v106 + 1);
        unint64_t v57 = BYTE8(v106) & 0x1F;
        if (v57 >= 8)
        {
          do
          {
            uint64_t v58 = *v11++;
            unint64_t v56 = 0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v58, 33)) ^ v56, 37);
            v57 -= 8;
          }
          while (v57 > 7);
        }
        if (v57 >= 4)
        {
          unsigned int v59 = *(_DWORD *)v11;
          id v11 = (uint64_t *)((char *)v11 + 4);
          unint64_t v56 = 0xC2B2AE3D27D4EB4FLL * __ROR8__((0x9E3779B185EBCA87 * v59) ^ v56, 41) + 0x165667B19E3779F9;
          v57 -= 4;
        }
        for (; v57; --v57)
        {
          unsigned int v60 = *(unsigned __int8 *)v11;
          id v11 = (uint64_t *)((char *)v11 + 1);
          unint64_t v56 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v60) ^ v56, 53);
        }
        unint64_t v61 = 0x165667B19E3779F9
            * ((0xC2B2AE3D27D4EB4FLL * (v56 ^ (v56 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v56 ^ (v56 >> 33))) >> 29));
        *(void *)&v120[8] = v61 ^ HIDWORD(v61);
        uint64_t v19 = v104;
        uint64_t v18 = v105;
      }
      else
      {
        uint64_t v19 = v104;
        uint64_t v18 = v105;
        if ((void)v106 == 4000) {
          CC_MD5_Final(&v120[8], (CC_MD5_CTX *)((char *)&v106 + 8));
        }
      }
    }
    else
    {
      uint64_t v19 = v104;
      uint64_t v18 = v105;
      switch((void)v106)
      {
        case 0xFA1:
          CC_SHA1_Final(&v120[8], (CC_SHA1_CTX *)((char *)&v106 + 8));
          break;
        case 0x10A0:
          CC_SHA256_Final(&v120[8], (CC_SHA256_CTX *)((char *)&v106 + 8));
          break;
        case 0x11A0:
          CC_SHA512_Final(&v120[8], (CC_SHA512_CTX *)((char *)&v106 + 8));
          break;
      }
    }
    goto LABEL_58;
  }
  if ((uint64_t)v106 > 1999)
  {
    uint64_t v19 = v104;
    uint64_t v18 = v105;
    if ((void)v106 != 2000)
    {
      if ((void)v106 != 3000) {
        goto LABEL_58;
      }
      v50 = &v108;
      if (HIDWORD(v106)) {
        __int32 v51 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v107, (uint32x4_t)xmmword_21BEF1640), (int8x16_t)vshlq_u32(v107, (uint32x4_t)xmmword_21BEF1630)));
      }
      else {
        __int32 v51 = v107.i32[2] + 374761393;
      }
      unsigned __int32 v62 = DWORD2(v106) + v51;
      unint64_t v63 = v110[0] & 0xF;
      if (v63 >= 4)
      {
        do
        {
          int v64 = *(_DWORD *)v50;
          v50 = (unint64_t *)((char *)v50 + 4);
          HIDWORD(v65) = v62 - 1028477379 * v64;
          LODWORD(v65) = HIDWORD(v65);
          unsigned __int32 v62 = 668265263 * (v65 >> 15);
          v63 -= 4;
        }
        while (v63 > 3);
      }
      for (; v63; --v63)
      {
        int v66 = *(unsigned __int8 *)v50;
        v50 = (unint64_t *)((char *)v50 + 1);
        HIDWORD(v67) = v62 + 374761393 * v66;
        LODWORD(v67) = HIDWORD(v67);
        unsigned __int32 v62 = -1640531535 * (v67 >> 21);
      }
      unsigned int v68 = -1028477379 * ((-2048144777 * (v62 ^ (v62 >> 15))) ^ ((-2048144777 * (v62 ^ (v62 >> 15))) >> 13));
      unsigned int v69 = v68 ^ HIWORD(v68);
      goto LABEL_57;
    }
    switch(v107.u8[3])
    {
      case 1u:
        int v55 = v107.u8[0];
        break;
      case 2u:
        int v55 = v107.u16[0];
        break;
      case 3u:
        int v55 = v107.u16[0] | (v107.u8[2] << 16);
        break;
      default:
        unsigned int v70 = DWORD2(v106);
        goto LABEL_56;
    }
    unsigned int v70 = (461845907 * ((380141568 * v55) | ((-862048943 * v55) >> 17))) ^ DWORD2(v106);
LABEL_56:
    unsigned int v71 = -2048144789 * (v70 ^ HIDWORD(v106) ^ ((v70 ^ HIDWORD(v106)) >> 16));
    unsigned int v69 = (-1028477387 * (v71 ^ (v71 >> 13))) ^ ((-1028477387 * (v71 ^ (v71 >> 13))) >> 16);
    DWORD2(v106) = v69;
LABEL_57:
    *(_DWORD *)&v120[8] = v69;
    goto LABEL_58;
  }
  uint64_t v19 = v104;
  uint64_t v18 = v105;
  if ((void)v106)
  {
    if ((void)v106 == 1000)
    {
      uint64_t v20 = (*((void *)&v106 + 1) + v107.i64[0]) ^ __ROR8__(v107.i64[0], 51);
      uint64_t v21 = v107.i64[1] + (v108 ^ v109);
      uint64_t v22 = __ROR8__(v108 ^ v109, 48);
      uint64_t v23 = (v21 ^ v22) + __ROR8__(*((void *)&v106 + 1) + v107.i64[0], 32);
      uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
      uint64_t v25 = v21 + v20;
      uint64_t v26 = v25 ^ __ROR8__(v20, 47);
      unint64_t v27 = (v23 ^ v109) + v26;
      uint64_t v28 = v27 ^ __ROR8__(v26, 51);
      uint64_t v29 = (__ROR8__(v25, 32) ^ 0xFFLL) + v24;
      uint64_t v30 = __ROR8__(v24, 48);
      uint64_t v31 = __ROR8__(v27, 32) + (v29 ^ v30);
      uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
      uint64_t v33 = v28 + v29;
      uint64_t v34 = v33 ^ __ROR8__(v28, 47);
      uint64_t v35 = v34 + v31;
      uint64_t v36 = v35 ^ __ROR8__(v34, 51);
      uint64_t v37 = __ROR8__(v33, 32) + v32;
      uint64_t v38 = __ROR8__(v32, 48);
      uint64_t v39 = __ROR8__(v35, 32) + (v37 ^ v38);
      uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
      uint64_t v41 = v36 + v37;
      uint64_t v42 = v41 ^ __ROR8__(v36, 47);
      uint64_t v43 = v42 + v39;
      uint64_t v44 = v43 ^ __ROR8__(v42, 51);
      uint64_t v45 = __ROR8__(v41, 32) + v40;
      uint64_t v46 = __ROR8__(v40, 48);
      uint64_t v47 = __ROR8__(v43, 32) + (v45 ^ v46);
      unint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
      uint64_t v49 = v44 + v45;
      *((void *)&v106 + 1) = v47;
      v107.i64[0] = v49 ^ __ROR8__(v44, 47);
      v107.i64[1] = __ROR8__(v49, 32);
      unint64_t v108 = v48;
      *(void *)&v120[8] = v107.i64[0] ^ v47 ^ v107.i64[1] ^ v48;
    }
  }
  else
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    v53 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
    [v52 handleFailureInFunction:v53 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
  }
LABEL_58:
  v121[0] = *(_OWORD *)v120;
  v121[1] = *(_OWORD *)&v120[16];
  v121[2] = *(_OWORD *)&v120[32];
  v121[3] = *(_OWORD *)&v120[48];
  uint64_t v122 = *(void *)&v120[64];
  if (*(uint64_t *)v120 > 3999)
  {
    if (*(uint64_t *)v120 > 4255)
    {
      if (*(void *)v120 == 4256)
      {
        v94 = (unsigned __int8 *)v121 + 8;
        v95 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v96 = v95;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v98 = *v94++;
          v99 = &v95[i];
          char *v99 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v98 >> 4];
          v99[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v98 & 0xF];
        }
        id v78 = [NSString alloc];
        v79 = v96;
        uint64_t v80 = 64;
      }
      else
      {
        if (*(void *)v120 != 4512) {
          goto LABEL_88;
        }
        v82 = (unsigned __int8 *)v121 + 8;
        v83 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v84 = v83;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v86 = *v82++;
          v87 = &v83[j];
          char *v87 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v86 >> 4];
          v87[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v86 & 0xF];
        }
        id v78 = [NSString alloc];
        v79 = v84;
        uint64_t v80 = 128;
      }
    }
    else if (*(void *)v120 == 4000)
    {
      v88 = (unsigned __int8 *)v121 + 8;
      v89 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v90 = v89;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v92 = *v88++;
        v93 = &v89[k];
        char *v93 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v92 >> 4];
        v93[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v92 & 0xF];
      }
      id v78 = [NSString alloc];
      v79 = v90;
      uint64_t v80 = 32;
    }
    else
    {
      if (*(void *)v120 != 4001) {
        goto LABEL_88;
      }
      v72 = (unsigned __int8 *)v121 + 8;
      v73 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v74 = v73;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v76 = *v72++;
        v77 = &v73[m];
        char *v77 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v76 >> 4];
        v77[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v76 & 0xF];
      }
      id v78 = [NSString alloc];
      v79 = v74;
      uint64_t v80 = 40;
    }
    v100 = (void *)[v78 initWithBytesNoCopy:v79 length:v80 encoding:4 freeWhenDone:1];
    uint64_t v81 = [v100 hash];

    goto LABEL_85;
  }
  if (*(uint64_t *)v120 <= 2999)
  {
    if (*(void *)v120 != 1000)
    {
      if (*(void *)v120 != 2000) {
        goto LABEL_88;
      }
LABEL_77:
      uint64_t v81 = DWORD2(v121[0]);
      goto LABEL_85;
    }
    goto LABEL_71;
  }
  if (*(void *)v120 == 3000) {
    goto LABEL_77;
  }
  if (*(void *)v120 == 3001)
  {
LABEL_71:
    uint64_t v81 = *((void *)&v121[0] + 1);
    goto LABEL_85;
  }
LABEL_88:
  v101 = [MEMORY[0x263F08690] currentHandler];
  v102 = [NSString stringWithUTF8String:"NSUInteger _MSVHashGetHash(MSVHash)"];
  [v101 handleFailureInFunction:v102 file:@"MSVHasher+Algorithms.h" lineNumber:301 description:@"Cannot obtain hash from unknown hasher algorithm"];

  uint64_t v81 = 0;
LABEL_85:
  if ((v19[6] & v81) == v19[7]) {
    objc_storeStrong((id *)(*(void *)(v19[5] + 8) + 40), a2);
  }
}

void __110___MPCMusicPlayerControllerServer__onQueue_setNowPlayingItem_itemIdentifier_remoteCommandSenderID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = [v3 statusCode];

  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x263F11B30], 5, @"Unable to play item %@", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __79___MPCMusicPlayerControllerServer_setNowPlayingItem_itemIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setNowPlayingItem:itemIdentifier:remoteCommandSenderID:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void __62___MPCMusicPlayerControllerServer_getNowPlayingAtIndex_reply___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) playbackEngine];
  id v6 = [v2 queueController];

  id v3 = [v6 contentItemIDAtIndex:*(void *)(a1 + 48)];
  if (v3)
  {
    uint64_t v4 = [v6 itemForContentItemID:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) _nowPlayingWithItem:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  [v3 setContentItemID:v4];
}

void __55___MPCMusicPlayerControllerServer__nowPlayingWithItem___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  [v3 setContentItemID:v4];
}

void __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 queueController];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke_2;
  id v12 = &unk_2643BF230;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v4;
  id v6 = v3;
  unint64_t v7 = objc_msgSend(v5, "msv_compactMap:", &v9);
  unint64_t v8 = objc_msgSend(v7, "copy", v9, v10, v11, v12);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __73___MPCMusicPlayerControllerServer_getNowPlayingsForContentItemIDs_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) itemForContentItemID:a2];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) _nowPlayingWithItem:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __58___MPCMusicPlayerControllerServer_getNowPlayingWithReply___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) playbackEngine];
  id v5 = [v2 queueController];

  id v3 = [v5 currentItem];
  uint64_t v4 = [*(id *)(a1 + 32) _nowPlayingWithItem:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end