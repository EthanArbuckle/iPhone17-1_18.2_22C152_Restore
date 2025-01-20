@interface MPCMediaRemotePublisher
@end

@implementation MPCMediaRemotePublisher

id __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"commandType"];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 99990) {
    id v5 = 0;
  }
  else {
    id v5 = v2;
  }

  return v5;
}

uint64_t __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSupportedCommands];
}

uint64_t __102___MPCMediaRemotePublisher_PlaybackQueue__playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter___block_invoke(uint64_t a1, void *a2)
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 findPreviousEventWithType:@"device-changed" matchingPayload:0];
  id v5 = v4;
  if (!v4) {
    goto LABEL_3;
  }
  v6 = [v4 payload];
  v7 = [v6 objectForKeyedSubscript:@"device-metadata"];
  v8 = [v7 objectForKeyedSubscript:@"focus-mode-private-listening-enabled"];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = v9 == 1;
  if (!v9)
  {
LABEL_3:
    uint64_t v11 = [*(id *)(a1 + 32) queueSectionID];
    v12 = (void *)v11;
    if (!v11)
    {
      uint64_t v10 = 1;
LABEL_22:

      goto LABEL_23;
    }
    v34 = @"queue-section-id";
    v35[0] = v11;
    uint64_t v10 = 1;
    v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v14 = [v3 findPreviousEventWithType:@"queue-add" matchingPayload:v13];

    if (v14)
    {
      v15 = [v14 payload];
      v16 = [v15 objectForKeyedSubscript:@"private-listening-source"];
      uint64_t v17 = [v16 integerValue];

      switch(v17)
      {
        case 3:
          v18 = [v14 payload];
          v19 = v18;
          v20 = @"queue-reporting-metadata";
LABEL_11:
          v21 = [v18 objectForKeyedSubscript:v20];
          v22 = [v21 objectForKeyedSubscript:@"private-listening-enabled"];

          if (v22)
          {
            uint64_t v10 = [v22 BOOLValue];
LABEL_20:

            goto LABEL_21;
          }
LABEL_16:
          uint64_t v10 = 1;
          goto LABEL_20;
        case 2:
          v23 = [v14 payload];
          v22 = [v23 objectForKeyedSubscript:@"account-id"];

          if (v22)
          {
            v33[0] = @"account-begin";
            v33[1] = @"account-update";
            v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
            v31 = @"account-id";
            v32 = v22;
            v25 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            v26 = [v3 findPreviousEventWithTypes:v24 matchingPayload:v25];

            v27 = [v26 payload];
            v28 = [v27 objectForKeyedSubscript:@"account-metadata"];
            v29 = [v28 objectForKeyedSubscript:@"private-listening-enabled"];

            if (v29) {
              uint64_t v10 = [v29 BOOLValue];
            }
            else {
              uint64_t v10 = 1;
            }

            goto LABEL_20;
          }
          goto LABEL_16;
        case 1:
          v18 = [v5 payload];
          v19 = v18;
          v20 = @"device-metadata";
          goto LABEL_11;
      }
      uint64_t v10 = 1;
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

uint64_t __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke_2;
  v2[3] = &unk_2643BF720;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F121B0] updateLaunchCommandsWithConfigurationHandler:v2];
}

void __49___MPCMediaRemotePublisher__updateLaunchCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 playCommand];
  [v3 setEnabled:1];

  uint64_t v4 = [v19 prepareForSetPlaybackQueueCommand];
  [v4 setEnabled:1];

  id v5 = [v19 setPlaybackQueueCommand];
  [v5 setEnabled:1];

  v6 = [v19 setPlaybackQueueCommand];
  [v6 registerSupportedQueueType:8];

  v7 = [v19 setPlaybackQueueCommand];
  [v7 registerSupportedQueueType:7];

  v8 = [v19 setPlaybackQueueCommand];
  [v8 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.radio"];

  uint64_t v9 = [v19 setPlaybackQueueCommand];
  [v9 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.tracklist"];

  uint64_t v10 = [v19 setPlaybackQueueCommand];
  [v10 registerSupportedCustomQueueIdentifier:@"com.apple.mediaplayer.playbackcontext"];

  uint64_t v11 = [v19 setPlaybackQueueCommand];
  [v11 registerSupportedCustomQueueIdentifier:@"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"];

  v12 = [*(id *)(a1 + 32) _supportedSessionTypes];
  v13 = [MEMORY[0x263F12178] standardUserDefaults];
  if ([v13 disableQHO])
  {
    LODWORD(a1) = 0;
  }
  else
  {
    v14 = [*(id *)(a1 + 32) playbackEngine];
    LODWORD(a1) = [v14 isQueueHandoffSupported];
  }
  if ([v12 count]) {
    a1 = a1;
  }
  else {
    a1 = 0;
  }
  v15 = [v19 setPlaybackSessionCommand];
  [v15 setEnabled:a1];

  v16 = [v19 setPlaybackSessionCommand];
  [v16 setSupportedSessionTypes:v12];

  uint64_t v17 = [v19 preloadPlaybackSessionCommand];
  [v17 setEnabled:a1];

  v18 = [v19 preloadPlaybackSessionCommand];
  [v18 setSupportedSessionTypes:v12];
}

uint64_t __52___MPCMediaRemotePublisher__updateSupportedCommands__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__updateSupportedCommands");
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  return result;
}

void __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F11DC8]);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
  id v5 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke_2;
  block[3] = &unk_2643C5FC8;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 - 1;
  [*(id *)(a1 + 32) setActive:a2 == 1];
  id v9 = *(id *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  v6 = v5;
  if (v3 >= 3) {
    [v5 addObject:@"Item not addable"];
  }
  if ([v4 count])
  {
    if (![v4 count])
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]_block_invoke"];
      [v7 handleFailureInFunction:v8 file:@"_MPCMediaRemotePublisher.m" lineNumber:1305 description:@"Must provide reason for unsupported command"];
    }
    [v9 setUnsupportedReasons:v4];
    if ([v9 hasTargets]) {
      [v9 removeTarget:0 action:0];
    }
  }
  else
  {
    [v9 setUnsupportedReasons:0];
    if (([v9 hasTargets] & 1) == 0) {
      [v9 addTarget:0 action:0 usingExtendedStatus:1];
    }
    objc_msgSend(v9, "setEnabled:", objc_msgSend(v6, "count") == 0);
    [v9 setDisabledReasons:v6];
  }
}

void __64___MPCMediaRemotePublisher_getShouldRestoreStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) integerValue];
        if (v10 == 122)
        {
          char v7 = 1;
        }
        else if (v10 == 133)
        {
          char v6 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
    char v7 = 0;
  }
  char v11 = (v7 | v6) ^ 1;
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v3 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 67109378;
    int v19 = v11 & 1;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[Publisher] getShouldRestoreState: %{BOOL}u pendingCommands=%{public}@", buf, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80___MPCMediaRemotePublisher__performSkipChapterCommand_withCommandID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v5;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapter for current item: %{public}@,skipForward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0x16u);
    }

    char v6 = (void *)MEMORY[0x263F121D0];
    char v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) startTime];
    int v10 = objc_msgSend(v7, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2004, v3, @"Failed to jumpToTime:%g", v9);
    char v11 = [v6 statusWithCode:200 error:v10];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    v13 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v6 = v5;
  id v7 = v8;
  msv_dispatch_on_main_queue();
}

void __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32) || (uint64_t v7 = *(void *)(a1 + 40)) == 0)
  {
    id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "❗️Failed to generate playback queue: %{public}@ %{public}@", buf, 0x16u);
    }

    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, *(void *)(a1 + 32), @"Failed to build playback queue from intent %@", *(void *)(a1 + 48));
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_718;
    v9[3] = &unk_2643C5830;
    id v8 = *(void **)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [v8 performSetQueue:v7 completion:v9];
    id v6 = v10;
  }
}

uint64_t __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke_718(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (_os_feature_enabled_impl()
    && MSVDeviceOSIsInternalInstall()
    && (MSVDeviceIsInternalCarry() & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v5 = [v4 objectForKey:@"ICStoreServerError"];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F89028];
      id v8 = [v5 objectForKeyedSubscript:@"code"];
      uint64_t v9 = [v8 integerValue];
      id v10 = [v5 objectForKeyedSubscript:@"userInfo"];
      char v11 = [v5 objectForKeyedSubscript:@"message"];
      uint64_t v12 = objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:userInfo:debugDescription:", v7, v9, 0, v10, @"%@", v11);

      uint64_t v13 = [MEMORY[0x263F121D0] statusWithCode:200 error:v12];

      id v3 = (id)v13;
    }
  }
  if (![v3 statusCode])
  {
    __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v24 = *(void *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 64);
    int v19 = [*(id *)(a1 + 48) interfaceID];
    *(_DWORD *)buf = 138544130;
    uint64_t v52 = v24;
    __int16 v53 = 2114;
    uint64_t v54 = v23;
    __int16 v55 = 2114;
    v56 = v19;
    __int16 v57 = 2114;
    id v58 = v3;
    __int16 v20 = "-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: type=%{public}@ id=%{public}@ interface=%{public"
          "}@ status=%{public}@";
    v21 = v16;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_14;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v14 = [*(id *)(a1 + 40) swift];
    uint64_t v15 = [v14 processStatus:v3 withCommandEvent:*(void *)(a1 + 48)];

    id v3 = (id)v15;
  }
  __int16 v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 64);
    int v19 = [*(id *)(a1 + 48) interfaceID];
    *(_DWORD *)buf = 138544130;
    uint64_t v52 = v18;
    __int16 v53 = 2114;
    uint64_t v54 = v17;
    __int16 v55 = 2114;
    v56 = v19;
    __int16 v57 = 2114;
    id v58 = v3;
    __int16 v20 = "❗️-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: type=%{public}@ id=%{public}@ interface=%{publ"
          "ic}@ status=%{public}@";
    v21 = v16;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
LABEL_14:
    _os_log_impl(&dword_21BB87000, v21, v22, v20, buf, 0x2Au);
  }
LABEL_15:

  v25 = *(void **)(a1 + 72);
  v50[0] = *(void *)(a1 + 64);
  v49[0] = @"remote-control-id";
  v49[1] = @"remote-control-internal-status";
  v26 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  v27 = v26;
  if (!v26)
  {
    v27 = [MEMORY[0x263EFF9D0] null];
  }
  v50[1] = v27;
  v49[2] = @"remote-control-status";
  id v48 = v3;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v50[2] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  [v25 emitEventType:@"remote-control-end" payload:v29];

  if (!v26) {
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  id v31 = [v3 analyticSignature];
  uint64_t v32 = [v31 UTF8String];

  int v33 = *(_DWORD *)(a1 + 128);
  if (!v33)
  {
    if (WeakRetained)
    {
      v43 = (void *)WeakRetained[10];
      WeakRetained[10] = 0;
    }
    v44 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v37 = v44;
    os_signpost_id_t v45 = *(void *)(a1 + 120);
    if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v52 = v32;
    v46 = "PerformCommandPlay";
    goto LABEL_40;
  }
  if (v33 != 122)
  {
    v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v37 = v47;
    os_signpost_id_t v45 = *(void *)(a1 + 120);
    if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v47)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v52 = v32;
    v46 = "PerformCommandOther";
LABEL_40:
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v37, OS_SIGNPOST_INTERVAL_END, v45, v46, " enableTelemetry=YES status=%{public, signpost.telemetry:string2, name=status}s", buf, 0xCu);
LABEL_41:

    goto LABEL_42;
  }
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v35 = v34;
  os_signpost_id_t v36 = *(void *)(a1 + 120);
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v52 = v32;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v35, OS_SIGNPOST_INTERVAL_END, v36, "PerformCommandSetPlaybackQueue", " enableTelemetry=YES status=%{public, signpost.telemetry:string2, name=status}s", buf, 0xCu);
  }

  if (WeakRetained && ![v3 statusCode])
  {
    v37 = *(id *)(a1 + 48);
    v38 = [v37 playbackQueue];
    if (([v38 isRequestingImmediatePlayback] & 1) == 0)
    {
      v39 = [*(id *)(a1 + 80) player];
      v40 = [v39 currentItem];

      if (v40)
      {
        id v41 = v38;
        if ([v41 _mediaRemotePlaybackQueue])
        {
          v42 = [v41 siriReferenceIdentifier];

          if (v42) {
            [WeakRetained _beginBackgroundTaskUntilPlayCommandWithCommand:*(void *)(a1 + 56) timeout:30.0];
          }
        }
      }
    }

    goto LABEL_41;
  }
LABEL_42:
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_380(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) player];
  uint64_t v5 = [v4 currentItem];

  if ([v5 durationIsValid])
  {
    [v5 durationInSeconds];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.79769313e308;
  }
  id v8 = [*(id *)(a1 + 32) player];
  [v8 currentTime];
  double v10 = v9 + a2;

  if (v10 >= v7) {
    double v10 = v7;
  }
  char v11 = [*(id *)(a1 + 32) player];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2;
  v13[3] = &unk_2643C44B8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  double v15 = v10;
  [v11 jumpToTime:v12 identifier:v13 completion:v10];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_385(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) player];
  [v4 currentTime];
  double v6 = v5 - a2;

  double v7 = [*(id *)(a1 + 32) player];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_386;
  v9[3] = &unk_2643C44B8;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  double v11 = fmax(v6, 0.0);
  [v7 jumpToTime:v8 identifier:v9 completion:v11];
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_387(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaRemoteOptions];
  id v2 = [v1 objectForKey:*MEMORY[0x263F54D60]];

  if ([v2 isEqualToString:@"com.apple.siri"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"com.apple.MediaAssistant"];
  }

  return v3;
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_395(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mediaRemoteOptions];
  id v2 = [v1 objectForKey:*MEMORY[0x263F54D60]];

  uint64_t v3 = [&unk_26CC19538 containsObject:v2];
  return v3;
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_420(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ((uint64_t)a2 <= 0)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    double v11 = (void *)MEMORY[0x263F121D0];
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 1001, v5, @"Failed to activate audio session");
    uint64_t v13 = [v11 statusWithCode:200 error:v12];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v13);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_424;
    aBlock[3] = &unk_2643BF858;
    id v20 = *(id *)(a1 + 32);
    id v23 = *(id *)(a1 + 72);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    objc_copyWeak(v24, (id *)(a1 + 80));
    v24[1] = a2;
    double v6 = (void (**)(void *, void, void *))_Block_copy(aBlock);
    double v7 = [*(id *)(a1 + 32) queueController];
    uint64_t v8 = [v7 currentItem];

    if (v8)
    {
      double v9 = [MEMORY[0x263F121D0] successStatus];
      v6[2](v6, 0, v9);
    }
    else
    {
      id v14 = *(void **)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 64);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4;
      v16[3] = &unk_2643BF880;
      uint64_t v17 = v6;
      id v18 = *(id *)(a1 + 72);
      [v14 _enqueueFallbackIntentIfNeededForCommandEvent:v15 play:1 completion:v16];

      double v9 = v17;
    }

    objc_destroyWeak(v24);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263F121D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2001, a2, @"Failed to pauseWithFadeout:%g", *(void *)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 <= 0)
  {
    uint64_t v13 = *(void *)(a1 + 64);
    id v14 = (void *)MEMORY[0x263F121D0];
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 1001, v5, @"Cannot toggle play/pause because audio session activation failed.");
    __int16 v16 = [v14 statusWithCode:200 error:v15];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7;
    aBlock[3] = &unk_2643BF8D0;
    id v26 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v25 = v5;
    double v6 = (void (**)(void *, void, void *))_Block_copy(aBlock);
    double v7 = [*(id *)(a1 + 32) player];
    uint64_t v8 = [v7 state];

    if (v8 != 2)
    {
      double v9 = [*(id *)(a1 + 32) leaseManager];
      [v9 setCanStealLeaseIfNeeded];
    }
    uint64_t v10 = [*(id *)(a1 + 32) player];
    double v11 = [v10 currentItem];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263F121D0] successStatus];
      v6[2](v6, 0, v12);
    }
    else
    {
      uint64_t v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 56);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9;
      v19[3] = &unk_2643BF880;
      id v20 = v6;
      id v21 = *(id *)(a1 + 64);
      [v17 _enqueueFallbackIntentIfNeededForCommandEvent:v18 play:v8 != 2 completion:v19];

      uint64_t v12 = v20;
    }
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_448(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v14 = 0;
    int v5 = [v4 canJumpToContentItemID:v3 reason:&v14];
    id v6 = v14;
    if (v5)
    {
      [*(id *)(a1 + 32) jumpToContentItemID:v3 direction:2];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = [MEMORY[0x263F121D0] successStatus];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = (void *)MEMORY[0x263F121D0];
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 4, @"Cannot play item in queue due to item policy: %@", v6);
      uint64_t v13 = [v12 statusWithCode:200 error:v8];
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v13);

      id v6 = (id)v13;
    }
  }
  else
  {
    double v9 = (void *)MEMORY[0x263F121D0];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Cannot find item by trackID: %lld", *(void *)(a1 + 48));
    id v6 = [v9 statusWithCode:100 error:v8];
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_456(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = (void *)MEMORY[0x263F121D0];
  id v13 = v3;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = [*(id *)(a1 + 32) player];
    uint64_t v8 = [v7 currentItem];
    double v9 = [v8 initialPlaybackStartTime];
    [v9 doubleValue];
    uint64_t v11 = objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2004, v13, @"Failed jumpToTime:%lf", v10);
    uint64_t v12 = [v5 statusWithCode:200 error:v11];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v12);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_460(uint64_t a1, uint64_t a2)
{
  char v12 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) contentItemIDWithCurrentItemOffset:a2 mode:2 didReachEnd:&v12];
  if (v12)
  {
    if (a2 >= 1)
    {
      [*(id *)(a1 + 32) jumpToFirstContentItemWithSource:6];
      int v5 = NSString;
      id v6 = [MEMORY[0x263F08C38] UUID];
      uint64_t v7 = [v6 UUIDString];
      uint64_t v8 = [v5 stringWithFormat:@"endOfQueuePause_%@", v7];

      double v9 = [*(id *)(a1 + 40) player];
      [v9 pauseWithFadeout:v8 identifier:&__block_literal_global_467 completion:0.0];

      uint64_t v10 = [*(id *)(a1 + 40) player];
      [v10 didReachEndOfQueueWithReason:@"nextTrack"];
    }
  }
  else
  {
    if (a2 < 1) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    [*(id *)(a1 + 32) jumpToContentItemID:v4 direction:v11];
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_477(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  if (*(void *)(*(void *)(a1 + 32) + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_481(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2005, a2, @"Failed to begin rewinding");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_485(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2005, a2, @"Failed to begin fast-forwarding");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_492(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x263F121D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2006, a2, @"Failed to end scanning");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_499(uint64_t a1, double a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) player];
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_500;
  v6[3] = &unk_2643C6110;
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [v4 jumpToTime:v5 identifier:v6 completion:a2];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_501(id *a1, double a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_502;
  block[3] = &unk_2643C4508;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  double v9 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_521(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) upNextBehavior];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) targetContentItemID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_522;
  v5[3] = &unk_2643C5830;
  id v6 = *(id *)(a1 + 48);
  [v2 performInsertCommand:v3 targetContentItemID:v4 completion:v5];
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_526(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_527(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x263F121D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3002, a2, @"Failed to move item: %@", *(void *)(a1 + 32));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_531(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F121D0];
    uint64_t v4 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3004, a2, @"Failed to setRepeatType: %ld", *(void *)(a1 + 48));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v3 statusWithCode:200 error:v8];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    if ([*(id *)(a1 + 32) preservesRepeatMode])
    {
      id v6 = [MEMORY[0x263F12178] standardUserDefaults];
      [v6 setMusicRepeatType:*(void *)(a1 + 48)];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_538(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F121D0];
    uint64_t v4 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3004, a2, @"Failed to setRepeatType: %ld", *(void *)(a1 + 48));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v3 statusWithCode:200 error:v8];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    if ([*(id *)(a1 + 32) preservesRepeatMode])
    {
      id v6 = [MEMORY[0x263F12178] standardUserDefaults];
      [v6 setMusicRepeatType:*(void *)(a1 + 48)];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_539(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F121D0];
    uint64_t v4 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3005, a2, @"Failed to setShuffleType: %ld", *(void *)(a1 + 48));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v3 statusWithCode:200 error:v8];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    if ([*(id *)(a1 + 32) preservesShuffleMode])
    {
      id v6 = [MEMORY[0x263F12178] standardUserDefaults];
      [v6 setMusicShuffleType:*(void *)(a1 + 48)];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_543(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F121D0];
    uint64_t v4 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3005, a2, @"Failed to setShuffleType: %ld", *(void *)(a1 + 48));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v3 statusWithCode:200 error:v8];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    if ([*(id *)(a1 + 32) preservesShuffleMode])
    {
      id v6 = [MEMORY[0x263F12178] standardUserDefaults];
      [v6 setMusicShuffleType:*(void *)(a1 + 48)];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9_544(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) music];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_10;
  v3[3] = &unk_2643C5830;
  id v4 = *(id *)(a1 + 40);
  [v2 reshuffleWithTargetContentItemID:0 completion:v3];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3006, a2, @"Failed to setAutoPlayEnabled: %{BOOL}u", *(unsigned __int8 *)(a1 + 48));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 statusWithCode:200 error:v10];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
  else
  {
    if ([*(id *)(a1 + 32) preservesQueueEndAction])
    {
      BOOL v6 = [*(id *)(a1 + 32) queueEndAction] == 3;
      uint64_t v7 = [MEMORY[0x263F12178] standardUserDefaults];
      id v8 = [*(id *)(a1 + 32) userIdentity];
      [v7 setAutoPlayEnabled:v6 forUserIdentity:v8];
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x263F121D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3003, a2, @"Failed to remove item: %@", *(void *)(a1 + 32));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_563(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 domain];
  if ([v3 isEqualToString:*MEMORY[0x263F88F00]])
  {
    uint64_t v4 = [v13 code];

    id v5 = v13;
    if (v4 == -7403)
    {
      BOOL v6 = (void *)MEMORY[0x263F121D0];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 102, v13, @"Account is not authenticated: %@", *(void *)(a1 + 32));
      uint64_t v9 = [v6 statusWithCode:1401 error:v8];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

      goto LABEL_8;
    }
  }
  else
  {

    id v5 = v13;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = (void *)MEMORY[0x263F121D0];
  if (v5)
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 199, v5, @"Account failed to prepareToPlay: %@", *(void *)(a1 + 32));
    char v12 = [v11 statusWithCode:200 error:v8];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
  else
  {
    id v8 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
  }
LABEL_8:
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_578(uint64_t a1, void *a2)
{
  v60[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) player];
    id v5 = [v4 criticalSectionToken];

    if (v5)
    {
      BOOL v6 = [*(id *)(a1 + 32) player];
      [v6 setCriticalSectionToken:0];
    }
  }
  uint64_t v7 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", @"MPCError", 27);

  if (!v7)
  {
    id v13 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", @"MPCPodcastsBehaviorError", 6);

    if (v13)
    {
      uint64_t v8 = *(void *)(a1 + 64);
      id v14 = (void *)MEMORY[0x263F121D0];
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 1, v3, @"No playable content found");
      uint64_t v11 = v14;
      uint64_t v12 = 100;
      goto LABEL_8;
    }
    __int16 v16 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", @"MPCMusicBehaviorError", 10);

    if (v16)
    {
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 40), "mpc_clientPreferredLanguages");
      uint64_t v18 = [v17 firstObject];

      int v19 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      uint64_t v54 = [v19 localizedStringForKey:@"CLEAR_QUEUE_ALERT_MESSAGE" value:0 table:@"MediaPlaybackCore" localization:v18];
      id v20 = [v19 localizedStringForKey:@"CLEAR_QUEUE_ALERT_ACTION_CANCEL" value:0 table:@"MediaPlaybackCore" localization:v18];
      id v21 = [v19 localizedStringForKey:@"CLEAR_QUEUE_ALERT_ACTION_CLEAR" value:0 table:@"MediaPlaybackCore" localization:v18];
      id v22 = [MEMORY[0x263F121C0] dialogWithTitle:0 message:v54];
      id v23 = [MEMORY[0x263F121C8] actionWithTitle:v20 type:1 commandEvent:0];
      [v22 addAction:v23];

      id v24 = *(void **)(a1 + 40);
      uint64_t v59 = @"selectedAction";
      v60[0] = @"clearQueue";
      id v25 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
      id v26 = (void *)[v24 copyWithDialogOptions:v25];

      v27 = [MEMORY[0x263F121C8] actionWithTitle:v21 type:2 commandEvent:v26];
      [v22 addAction:v27];

      uint64_t v28 = *(void *)(a1 + 64);
      v29 = [MEMORY[0x263F121D0] statusWithCode:200 dialog:v22];
      (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);
    }
    else
    {
      uint64_t v30 = *(void *)(a1 + 64);
      id v31 = objc_msgSend(v3, "mpc_remoteCommandStatus");
      if (v31)
      {
        (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);
      }
      else
      {
        uint64_t v32 = [MEMORY[0x263F121D0] successStatus];
        (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v32);
      }
      int v33 = [MEMORY[0x263F12178] standardUserDefaults];
      int v34 = [v33 forceDisableUpNext];

      if (v34)
      {
        uint64_t v18 = [*(id *)(a1 + 32) queueController];
        uint64_t v35 = [v18 upNextBehavior];
        if (!v35) {
          goto LABEL_12;
        }
        os_signpost_id_t v36 = (void *)v35;
        v37 = [v18 upNextBehavior];
        int v38 = [v37 allowsQueueModifications];

        if (!v38) {
          goto LABEL_12;
        }
        v39 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [*(id *)(a1 + 32) engineID];
          uint64_t v41 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v56 = v40;
          __int16 v57 = 2114;
          uint64_t v58 = v41;
          _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | disabling queue modifications [user default forced]", buf, 0x16u);
        }
        v42 = [v18 upNextBehavior];
        v43 = v42;
        uint64_t v44 = 0;
      }
      else
      {
        os_signpost_id_t v45 = [MEMORY[0x263F12178] standardUserDefaults];
        int v46 = [v45 ignoreDisableUpNext];

        if (!v46) {
          goto LABEL_9;
        }
        uint64_t v18 = [*(id *)(a1 + 32) queueController];
        uint64_t v47 = [v18 upNextBehavior];
        if (!v47) {
          goto LABEL_12;
        }
        id v48 = (void *)v47;
        v49 = [v18 upNextBehavior];
        char v50 = [v49 allowsQueueModifications];

        if (v50) {
          goto LABEL_12;
        }
        v51 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v52 = [*(id *)(a1 + 32) engineID];
          uint64_t v53 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v56 = v52;
          __int16 v57 = 2114;
          uint64_t v58 = v53;
          _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | enabling queue modifications [user default ignored]", buf, 0x16u);
        }
        v42 = [v18 upNextBehavior];
        v43 = v42;
        uint64_t v44 = 1;
      }
      [v42 setAllowsQueueModifications:v44];

      [*(id *)(a1 + 56) _updateSupportedCommands];
    }
LABEL_12:

    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = (void *)MEMORY[0x263F121D0];
  uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 101, v3, @"SharedQueue feature requires a subscription");
  uint64_t v11 = v9;
  uint64_t v12 = 1004;
LABEL_8:
  uint64_t v15 = [v11 statusWithCode:v12 error:v10];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v15);

LABEL_9:
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_597(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3001, @"Failed to load playback intent: %@", *(void *)(a1 + 32));
  objc_msgSend(v3, "mpc_remoteCommandStatus");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_607(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      v43 = v7;
      _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, "❗️Failed to generate create-station playback queue: %{public}@ %{public}@", buf, 0x16u);
    }

    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, v7, @"Failed to build create-station playback queue from intent %@", *(void *)(a1 + 32));
    id v21 = objc_msgSend(v18, "mpc_remoteCommandStatus");
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v21);
  }
  else
  {
    int v8 = _os_feature_enabled_impl();
    uint64_t v9 = [*(id *)(a1 + 40) music];
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v11 = [*(id *)(a1 + 48) contentItemID];
      [v10 prepareForCreateStationAfterContentItemID:v11];

      id v12 = objc_alloc(MEMORY[0x263F11DB8]);
      id v13 = [*(id *)(a1 + 56) commandCenter];
      id v14 = [v13 insertIntoPlaybackQueueCommand];
      v38[0] = *MEMORY[0x263F54C98];
      uint64_t v15 = [*(id *)(a1 + 40) targetContentItemID];
      uint64_t v16 = *MEMORY[0x263F54D18];
      v39[0] = v15;
      v39[1] = &unk_26CC18E70;
      v38[1] = v16;
      v38[2] = @"_MPCOverrideAllowsInsertionPositionLast";
      v39[2] = MEMORY[0x263EFFA88];
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
      uint64_t v18 = (void *)[v12 initWithCommand:v14 playbackQueue:v5 options:v17];

      int v19 = [*(id *)(a1 + 40) music];
      id v20 = [*(id *)(a1 + 40) targetContentItemID];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_615;
      v34[3] = &unk_2643C5830;
      id v35 = *(id *)(a1 + 64);
      [v19 performInsertCommand:v18 targetContentItemID:v20 completion:v34];

      id v21 = v35;
    }
    else
    {
      [v9 setRepeatType:0 completion:&__block_literal_global_618];

      id v25 = objc_alloc(MEMORY[0x263F11DB8]);
      id v26 = [*(id *)(a1 + 56) commandCenter];
      v27 = [v26 insertIntoPlaybackQueueCommand];
      uint64_t v36 = *MEMORY[0x263F54C98];
      uint64_t v28 = [*(id *)(a1 + 40) targetContentItemID];
      v37 = v28;
      v29 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v18 = (void *)[v25 initWithCommand:v27 playbackQueue:v5 options:v29];

      uint64_t v30 = [*(id *)(a1 + 40) music];
      id v31 = [*(id *)(a1 + 40) targetContentItemID];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_619;
      v32[3] = &unk_2643C5830;
      id v33 = *(id *)(a1 + 64);
      [v30 performInsertCommand:v18 targetContentItemID:v31 completion:v32];

      id v21 = v33;
    }
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_621(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️Reload with playback context failed with error: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3001, v3, @"Failed to load playback intent: %@", *(void *)(a1 + 32));
    uint64_t v7 = objc_msgSend(v6, "mpc_remoteCommandStatus");
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_635(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", @"MPCError", 27);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)MEMORY[0x263F121D0];
    uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 101, v3, @"SharedQueue feature requires a subscription");
    uint64_t v8 = [v6 statusWithCode:1004 error:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_INFO, "Resetting playback rate from handoff", v15, 2u);
    }

    uint64_t v10 = [MEMORY[0x263F12178] standardUserDefaults];
    LODWORD(v11) = 1.0;
    [v10 setPlaybackRate:v11];

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = objc_msgSend(v3, "mpc_remoteCommandStatus");
    if (v13)
    {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
    else
    {
      id v14 = [MEMORY[0x263F121D0] successStatus];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
    }
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_639(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) eventStream];
  uint64_t v5 = *(void *)(a1 + 40);
  v11[0] = @"session-id";
  v11[1] = @"session-migration-error";
  v12[0] = v5;
  id v6 = v3;
  if (!v3)
  {
    id v6 = [MEMORY[0x263EFF9D0] null];
  }
  v12[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v4 emitEventType:@"session-migrate-end" payload:v7];

  if (!v3) {
  uint64_t v8 = *(void *)(a1 + 48);
  }
  uint64_t v9 = objc_msgSend(v3, "mpc_remoteCommandStatus");
  if (v9)
  {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);
  }
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_648(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_649;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 setUniversalStoreIdentifiersWithBlock:v3];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_669(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️Change rate failed. (error = %{public}@)", buf, 0xCu);
    }

    uint64_t v5 = (void *)MEMORY[0x263F121D0];
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) playbackRate];
    WeakRetained = objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2003, v3, @"Failed to setRate:%g", v8);
    uint64_t v10 = [v5 statusWithCode:200 error:WeakRetained];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _updateSupportedCommands];
  }
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_673(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_680(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v9;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v12, "shareQueue:getTracklist", "error=%{public}@", buf, 0xCu);
  }

  if (v9)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, v9, @"Unable to build shared queue tracklist from current queue.");
    uint64_t v15 = (_MPCSharedListeningTracklistPlaybackContext *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v14 statusWithCode:200 error:v15];
    (*(void (**)(uint64_t, MPCPlaybackIntent *))(v13 + 16))(v13, v16);
  }
  else
  {
    uint64_t v15 = objc_alloc_init(_MPCSharedListeningTracklistPlaybackContext);
    [(_MPCSharedListeningTracklistPlaybackContext *)v15 setTracklist:v7];
    [(_MPCSharedListeningTracklistPlaybackContext *)v15 setStartItemIndexPath:v8];
    uint64_t v16 = objc_alloc_init(MPCPlaybackIntent);
    [(MPCPlaybackIntent *)v16 setTracklistToken:v15];
    [(MPCPlaybackIntent *)v16 setTracklistSource:6];
    uint64_t v17 = [*(id *)(a1 + 32) mediaRemoteOptions];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"com.apple.music.live-link-identity-json"];

    int v19 = [MEMORY[0x263F89188] payloadValueFromJSONValue:v18];
    id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v21 = v20;
    os_signpost_id_t v22 = *(void *)(a1 + 48);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "shareQueue:buildIntent", "", buf, 2u);
    }

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    id v24[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_689;
    v24[3] = &unk_2643BFA80;
    uint64_t v23 = *(void **)(a1 + 40);
    uint64_t v26 = *(void *)(a1 + 48);
    id v25 = v23;
    +[MPCPlaybackIntent buildSharedSessionIntentWithIntent:v16 identity:v19 extendedStatusCompletion:v24];
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_704(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setVocalAttenuationEnabled:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 32) vocalAttenuationController];
    -[MPCWhiskyController setEnabled:](v5, v4);

    [*(id *)(a1 + 40) _updateSupportedCommands];
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "[AP] - Error reloading asset for VA error:%{public}@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = (void *)MEMORY[0x263F121D0];
    id v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 0, v3, @"Reloading the item for vocal attenuation did not succeed");
    uint64_t v10 = [v8 statusWithCode:200 error:v9];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) isVocalAttenuationEnabled];
    os_signpost_id_t v12 = [*(id *)(a1 + 32) vocalAttenuationController];
    -[MPCWhiskyController setEnabled:](v12, v11);

    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_711(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️Failed to perform dialog action: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = (void *)MEMORY[0x263F121D0];
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) mediaRemoteOptions];
    id v9 = objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 6000, @"Failed to perform dialog action with options: %@", v8);
    uint64_t v10 = [v5 statusWithCode:200 error:v9];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    os_signpost_id_t v12 = [MEMORY[0x263F121D0] statusWithCode:110];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_689(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "shareQueue:buildIntent", "status=%{public}@", buf, 0xCu);
  }

  uint64_t v10 = [v6 error];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    os_signpost_id_t v12 = (void *)MEMORY[0x263F121D0];
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    id v14 = [v6 error];
    uint64_t v15 = objc_msgSend(v13, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, v14, @"Failed to build shared queue intent from current queue.");
    id v16 = [v12 statusWithCode:200 error:v15];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v16);
  }
  else if ([v6 type] == 3)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    id v14 = [v6 status];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v14);
  }
  else
  {
    uint64_t v18 = [v5 sharedListeningProperties];
    id v14 = [v18 sessionIdentifier];

    int v19 = [v5 sharedListeningProperties];
    id v20 = [v19 sessionKey];

    id v21 = [NSString stringWithFormat:@"?id=%@&key=%@", v14, v20];
    os_signpost_id_t v22 = [v21 dataUsingEncoding:4];

    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = [MEMORY[0x263F121D0] statusWithCode:0 customData:v22 type:@"com.apple.music.shared-session-url-components"];
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

uint64_t __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_649(uint64_t a1, void *a2)
{
  return [a2 setSubscriptionAdamID:*(void *)(a1 + 32)];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_615(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mpc_remoteCommandStatus");
  id v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_619(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mpc_remoteCommandStatus");
  id v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_573()
{
  id v0 = +[MPCPlaybackPerformanceController sharedController];
  [v0 warmCDNConnection];
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_570()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int inPropertyData = 1;
  OSStatus v0 = AudioServicesSetProperty(0x61637474u, 0, 0, 4u, &inPropertyData);
  if (v0)
  {
    OSStatus v1 = v0;
    uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v5 = v1;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "[Publisher] Failed to prewarm amps. error: %ld", buf, 0xCu);
    }
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263F121D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3005, a2, @"Failed to reshuffle");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_522(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_msgSend(v9, "msv_errorByUnwrappingDomain:code:", @"MPCError", 27);

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = (void *)MEMORY[0x263F121D0];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 101, v9, @"SharedQueue feature requires a subscription");
    uint64_t v7 = [v5 statusWithCode:1004 error:v6];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v9) {
      objc_msgSend(v9, "mpc_remoteCommandStatus");
    }
    else {
    uint64_t v6 = [MEMORY[0x263F121D0] successStatus];
    }
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_502(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) player];
  uint64_t v3 = [v2 currentItem];

  id v4 = [*(id *)(a1 + 40) nowPlayingContentItemID];
  id v5 = [v3 contentItemID];
  if (v4 == v5)
  {

    goto LABEL_7;
  }
  uint64_t v6 = v5;
  char v7 = [v4 isEqual:v5];

  if (v7)
  {
LABEL_7:
    (*(void (**)(double))(*(void *)(a1 + 56) + 16))(*(double *)(a1 + 64));
    goto LABEL_8;
  }
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = [*(id *)(a1 + 40) nowPlayingContentItemID];
    uint64_t v10 = [v3 contentItemID];
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Current item has changed: %{public}@ [currentItem is %{public}@]", buf, 0x16u);
  }
  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = [*(id *)(a1 + 40) nowPlayingContentItemID];
  id v14 = [v3 contentItemID];
  uint64_t v15 = objc_msgSend(v11, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Cannot seek item (%@) with different current item (%@)", v13, v14);
  id v16 = objc_msgSend(v15, "mpc_remoteCommandStatus");
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);

LABEL_8:
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_500(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Could not jump to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    id v5 = (void *)MEMORY[0x263F121D0];
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) positionTime];
    id v9 = objc_msgSend(v6, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2004, v3, @"Failed to jumpToTime:%g", v8);
    uint64_t v10 = [v5 statusWithCode:200 error:v9];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) player];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8;
    v6[3] = &unk_2643C6110;
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v4 togglePlaybackWithIdentifier:v5 completion:v6];
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 statusCode]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x263F121D0];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2002, a2, @"Failed to toggle playback");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = objc_msgSend(v3, "statusWithCode:error:", 200);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_424(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) leaseManager];
  [v6 setCanStealLeaseIfNeeded];

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    float v7 = 1.0;
    if ([*(id *)(a1 + 40) behaviorType] == 4)
    {
      +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate];
      float v7 = v8;
    }
    id v9 = [*(id *)(a1 + 32) player];
    uint64_t v10 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3;
    v14[3] = &unk_2643BF830;
    objc_copyWeak(v16, (id *)(a1 + 64));
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = *(void **)(a1 + 72);
    id v15 = v11;
    v16[1] = v12;
    *(float *)&double v13 = v7;
    [v9 playWithRate:v10 identifier:v14 completion:v13];

    objc_destroyWeak(v16);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 statusCode]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (v11)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x263F121D0];
    float v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2000, v11, @"Failed to playWithRate:1.0");
    float v8 = [v6 statusWithCode:200 error:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    [v4 deactivateAudioSessionIfIdle:*(void *)(a1 + 48)];
  }
  else
  {
    [WeakRetained _updateSupportedCommands];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_386(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️SkipBackward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x263F121D0];
    float v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2004, v3, @"Failed to jumpToTime:%g", *(void *)(a1 + 40));
    float v8 = [v6 statusWithCode:200 error:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v3;
      _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_ERROR, "❗️SkipForward failed. Could not skip to the specified time. (error = %{public}@)", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x263F121D0];
    float v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 2004, v3, @"Failed to jumpToTime:%g", *(void *)(a1 + 40));
    float v8 = [v6 statusWithCode:200 error:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

uint64_t __84___MPCMediaRemotePublisher__beginBackgroundTaskUntilPlayCommandWithCommand_timeout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90___MPCMediaRemotePublisher__enqueueFallbackIntentIfNeededForCommandEvent_play_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mpc_remoteCommandStatus");
  id v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    id v4 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    float v7 = [MEMORY[0x263EFF910] date];
    id v8 = objc_alloc(MEMORY[0x263F54ED0]);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2;
    v22[3] = &unk_2643BF518;
    uint64_t v25 = a1[6];
    id v9 = v7;
    id v23 = v9;
    id v10 = v6;
    id v24 = v10;
    id v11 = (void *)[v8 initWithDeallocHandler:v22];
    id v12 = (void *)a1[4];
    uint64_t v13 = a1[5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3;
    v16[3] = &unk_2643BF568;
    uint64_t v21 = a1[6];
    id v17 = v9;
    id v18 = v11;
    id v19 = v10;
    id v20 = v5;
    id v14 = v11;
    id v15 = v9;
    [v12 engine:v13 prepareForActivationWithCompletion:v16];
  }
  else
  {
    v5[2](v5);
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v10 = [MEMORY[0x263EFF910] date];
    id v11 = objc_alloc(MEMORY[0x263F54ED0]);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6;
    v27[3] = &unk_2643C66D8;
    uint64_t v31 = a1[6];
    id v12 = v10;
    id v28 = v12;
    id v13 = v9;
    id v30 = v13;
    id v14 = v7;
    id v29 = v14;
    id v15 = (void *)[v11 initWithDeallocHandler:v27];
    id v16 = (void *)a1[4];
    uint64_t v17 = a1[5];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7;
    v20[3] = &unk_2643BF5B8;
    uint64_t v26 = a1[6];
    id v21 = v12;
    id v22 = v15;
    id v24 = v13;
    id v23 = v14;
    id v25 = v8;
    id v18 = v15;
    id v19 = v12;
    [v16 engine:v17 didFailToActivateWithError:v23 resolution:v20];
  }
  else
  {
    (*((void (**)(id, id))v9 + 2))(v9, v7);
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!+[MPCPlaybackEngine isSystemMusic])
  {
    id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "publisher:bless", "", buf, 2u);
    }

    int v8 = MRMediaRemoteNowPlayingBless();
    if ((v8 & 1) == 0)
    {
      id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Failed to bless application", buf, 2u);
      }
    }
    id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "SDKPlayback");
    id v11 = v10;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v8;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v5, "publisher:bless", "success=%{BOOL}u", buf, 8u);
    }
  }
  id v12 = [*(id *)(a1 + 32) player];

  if (!v12)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_MPCMediaRemotePublisher.m" lineNumber:791 description:@"Playback engine implementation is nil"];
  }
  id v13 = [*(id *)(a1 + 32) player];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_152;
  v16[3] = &unk_2643BF608;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v17 = v3;
  id v14 = v3;
  [v13 becomeActiveWithCompletion:v16];
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_157(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 < 1)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v5;
      id v7 = "_MPCMediaRemotePublisher: Audio session was not activated error=%{public}@";
      int v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }
  else
  {
    [*(id *)(a1 + 32) becomeActive];
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "_MPCMediaRemotePublisher: Activated audio session [become active]";
      int v8 = v6;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SessionActivation", " enableTelemetry=YES ", buf, 2u);
  }

  id v13 = [*(id *)(a1 + 32) playbackEngine];
  id v14 = [v13 eventStream];
  v22[0] = *(void *)(a1 + 40);
  v21[0] = @"session-activation-id";
  v21[1] = @"session-activation-activated";
  id v15 = [NSNumber numberWithBool:a2 > 0];
  v22[1] = v15;
  v21[2] = @"session-activation-attempts";
  id v16 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v22[2] = v16;
  v21[3] = @"session-activation-av-time";
  id v17 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  v22[3] = v17;
  v21[4] = @"session-activation-client-time";
  long long v18 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  void v22[4] = v18;
  v21[5] = @"session-activation-error";
  id v19 = v5;
  if (!v5)
  {
    id v19 = [MEMORY[0x263EFF9D0] null];
  }
  v22[5] = v19;
  int v20 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];
  [v14 emitEventType:@"session-activation-end" payload:v20];

  if (!v5) {
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_159(id *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_160;
  v3[3] = &unk_2643BF6A8;
  uint64_t v2 = (void (**)(id, void *))a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v7 = a1[4];
  v2[2](v2, v3);
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7_168(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8_169;
  v7[3] = &unk_2643C37C0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9_170;
  v5[3] = &unk_2643C5830;
  id v6 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v4 + 16))(v4, a2, v7, v5);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8_169(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9_170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_160(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 <= 0)
  {
    if (v5)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3_164;
      void v12[3] = &unk_2643BF680;
      uint64_t v7 = *(void *)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = a2;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6_167;
      v9[3] = &unk_2643C44B8;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = a2;
      (*(void (**)(uint64_t, void *, void *, void *))(v7 + 16))(v7, v6, v12, v9);
    }
    else
    {
      id v8 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 1002, @"Session activation was cancelled by the user");
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3_164(uint64_t a1)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4_165;
  v8[3] = &unk_2643C37C0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5_166;
  v5[3] = &unk_2643C44B8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v7 = v4;
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v8, v5);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6_167(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4_165(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5_166(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_152(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a4;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v8 = [MEMORY[0x263F12178] standardUserDefaults];
  [v8 activationDelay];
  double v10 = v9;

  if (v10 <= 0.0)
  {
    id v13 = (id *)v18;
    v18[0] = *(id *)(a1 + 32);
    v18[1] = a2;
    id v14 = &v17;
    id v17 = v7;
    id v16 = v7;
    msv_dispatch_on_main_queue();
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v23 = v10;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Delaying audio activation [internal setting]: %gs", buf, 0xCu);
    }

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_153;
    block[3] = &unk_2643C6818;
    id v13 = (id *)v21;
    v21[0] = *(id *)(a1 + 32);
    v21[1] = a2;
    id v14 = &v20;
    id v20 = v7;
    id v15 = v7;
    dispatch_after(v12, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_153(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "_MPCMediaRemotePublisher: Finished delaying audio activation [internal setting]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_154(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - v2;
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              - v4;
  [*(id *)(a1 + 40) disarm];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8;
  v5[3] = &unk_2643BF540;
  char v9 = a2;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  }
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              - v2;
  uint64_t v3 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 53, @"Delegate failed to call completion for prepareForActivationWithCompletion:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24)
                                                              - v6;
  [*(id *)(a1 + 40) disarm];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4;
  v9[3] = &unk_2643BF540;
  char v13 = a2;
  id v7 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = v7;
  id v12 = *(id *)(a1 + 56);
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  }
}

void __58___MPCMediaRemotePublisher__activeSharedSessionDidChange___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v12 = v2;
  id v3 = *(id *)(*(void *)(a1 + 40) + 120);
  id v4 = v12;
  if (v3 != v12)
  {
    id v5 = v3;
    char v6 = [v3 isEqual:v12];

    if (v6) {
      goto LABEL_7;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 120), v2);
    id v7 = @"MediaRemote GroupSession started";
    if (!v12) {
      id v7 = @"MediaRemote GroupSession ended";
    }
    id v8 = *(void **)(a1 + 40);
    char v9 = v7;
    id v4 = [v8 playbackEngine];
    id v10 = [v4 queueController];
    id v11 = [v10 music];
    [v11 setHostingSharedSessionID:v12 reason:v9];
  }
LABEL_7:
}

void __79___MPCMediaRemotePublisher_commandCenter_didTimeoutCommandEvent_statusHandler___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v20 = @"remote-control-id";
  id v4 = [*(id *)(a1 + 32) commandID];
  v21[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  char v6 = [v3 findPreviousEventWithType:@"remote-control-begin" matchingPayload:v5];

  if (!v6)
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    id v17 = [*(id *)(a1 + 32) commandID];
    id v14 = objc_msgSend(v16, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5001, @"Failed to find CommandBegin event for commandID: %@", v17);

    id v7 = [MEMORY[0x263F121D0] statusWithCode:555 error:v14];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  id v7 = [v3 cursorUntilEvent:v6];
  id v8 = [v7 findPreviousEventWithType:@"session-activation-begin" matchingPayload:0];
  char v9 = v8;
  if (v8)
  {
    long long v18 = @"session-activation-id";
    id v10 = [v8 payload];
    id v11 = [v10 objectForKeyedSubscript:@"session-activation-id"];
    id v19 = v11;
    id v12 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    char v13 = [v7 findPreviousEventWithType:@"session-activation-end" matchingPayload:v12];

    if (v13)
    {
    }
    else
    {
      id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5010, @"Found SessionActivationBegin but not SessionActivationEnd event");
      if (v14) {
        goto LABEL_6;
      }
    }
  }
  id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5000, @"Publisher has no additional info for timeout");
LABEL_6:
  id v15 = [MEMORY[0x263F121D0] statusWithCode:555 error:v14];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_8:
}

uint64_t __59___MPCMediaRemotePublisher_engineDidBlockVocalAttenuation___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) vocalAttenuationController];
  -[MPCWhiskyController setEnabled:](v2, 0);

  id v3 = *(void **)(a1 + 40);

  return [v3 _updateSupportedCommands];
}

double __50___MPCMediaRemotePublisher_updatePlaybackMetrics___block_invoke(double a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:@"duration"];
  [v4 doubleValue];
  double v6 = v5 + a1;

  return v6;
}

void __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = objc_opt_new();
    [v3 performSetQueue:v4 completion:&__block_literal_global_93_3820];

    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = (void *)MEMORY[0x263F121D0];
    id v7 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3100, v10, @"Failed to load previous session");
    id v8 = [v6 statusWithCode:200 error:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
  }
}

void __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "mpc_remoteCommandStatus");
  id v5 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  else
  {
    id v4 = [MEMORY[0x263F121D0] successStatus];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

void __94___MPCMediaRemotePublisher_leaveSharedSessionWithCommandID_remoteControlInterface_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __131___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_getTransportablePlaybackSessionRepresentationForRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) playbackEngine];
  id v3 = [v2 queueController];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) preferredSessionType];
    if ([v3 behaviorType] == 4)
    {
      id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "Asking for Podcasts transportable items", buf, 2u);
      }

      id v6 = [v3 behaviorImpl];
      id v7 = [v6 queueTrackIdentifiers];
      id v30 = 0;
      id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:0 error:&v30];
      id v9 = v30;
      if (v9)
      {
        id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v34 = v9;
          _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "Unable to archive Podcasts queue: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        uint64_t v21 = *(void *)(a1 + 48);
        id v22 = (void *)MEMORY[0x263F12140];
        double v23 = [v3 sessionID];
        uint64_t v24 = [v22 responseWithIdentifier:v23 sessionType:v4 data:v8];
        (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, v24, 0);
      }
    }
    else
    {
      char v13 = [v3 currentItem];
      id v14 = [v13 contentItemID];
      id v29 = 0;
      int v15 = [v3 isExportableSessionType:v4 forContentItemID:v14 reason:&v29];
      id v6 = v29;

      if (v15)
      {
        id v16 = (void *)MEMORY[0x263F54F08];
        uint64_t v31 = *MEMORY[0x263F11C30];
        uint64_t v32 = &unk_26CC18E10;
        id v17 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        id v28 = 0;
        long long v18 = [v16 encodedDataWithRootObject:v3 userInfo:v17 error:&v28];
        id v7 = v28;

        uint64_t v19 = *(void *)(a1 + 48);
        if (v7)
        {
          (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v7);
        }
        else
        {
          uint64_t v25 = (void *)MEMORY[0x263F12140];
          uint64_t v26 = [v3 sessionID];
          uint64_t v27 = [v25 responseWithIdentifier:v26 sessionType:v4 data:v18];
          (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v27, 0);
        }
      }
      else
      {
        uint64_t v20 = *(void *)(a1 + 48);
        objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Session contains non-transportable content reason=%@", v6);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v7);
      }
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Session is empty");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

void __115___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_remoteArtworkForContentItem_format_size_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F08900];
    id v8 = [v5 jsonRepresentation];
    id v14 = 0;
    id v9 = [v7 dataWithJSONObject:v8 options:0 error:&v14];
    id v10 = v14;

    if (v10)
    {
      uint64_t v11 = 0;
      id v12 = v6;
      id v6 = v10;
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x263F12100]);
      id v12 = [v5 resolvedURLString];
      uint64_t v11 = (void *)[v13 initWithArtworkURLString:v12 templateData:v9];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_artworkForContentItem_size_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 29, a3, @"requestImageWithCompletionHandler: called with nil image.");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
}

@end