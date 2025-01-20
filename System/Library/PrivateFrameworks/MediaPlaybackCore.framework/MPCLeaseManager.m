@interface MPCLeaseManager
@end

@implementation MPCLeaseManager

void __53___MPCLeaseManager__updateStateForPlaybackPrevention__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) shouldPreventPlayback];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v28 = v5;
      __int16 v29 = 2114;
      uint64_t v30 = v6;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Pausing [current item (%{public}@) requested playback prevention]", buf, 0x16u);
    }

    v7 = NSString;
    v8 = MSVNanoIDCreateTaggedPointer();
    v3 = [v7 stringWithFormat:@"LeasePreventionPause_%@", v8];

    [*(id *)(a1 + 48) pauseForLeasePreventionWithIdentifier:v3 completion:&__block_literal_global_27291];
    uint64_t v9 = [*(id *)(a1 + 32) leasePlaybackPreventionState];
    v10 = [*(id *)(a1 + 32) leaseStatus];
    if (v9 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      v12 = [WeakRetained delegate];
      if (objc_opt_respondsToSelector())
      {
        v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
        v14 = [v10 stateReasonDialog];
        v15 = [v14 responseDictionary];
        [v13 setObject:v15 forKeyedSubscript:@"MPCErrorUserInfoKeyStoreDialogDictionary"];

        [v13 setObject:v10 forKeyedSubscript:@"MPCErrorUserInfoKeyLeaseStatus"];
        v16 = [v10 stateReasonDialogMetricsDictionary];
        [v13 setObject:v16 forKeyedSubscript:@"MPCErrorUserInfoKeyMetricsDictionary"];

        v17 = [*(id *)(a1 + 32) playbackError];
        [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x263F08608]];

        v18 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCError" code:30 userInfo:v13];
        v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          uint64_t v28 = v20;
          __int16 v29 = 2114;
          uint64_t v30 = v21;
          __int16 v31 = 2114;
          v32 = v13;
          _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Notifying delegate of lease prevention [engine:didPauseForLeaseEndWithError:] - item: %{public}@ - userInfo: %{public}@", buf, 0x20u);
        }

        [v12 engine:WeakRetained didPauseForLeaseEndWithError:v18];
      }
      else if (objc_opt_respondsToSelector())
      {
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          uint64_t v25 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          uint64_t v28 = v25;
          __int16 v29 = 2114;
          uint64_t v30 = v26;
          _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Notifying delegate of lease prevention [engineDidPauseForLeaseEnd:] - item: %{public}@", buf, 0x16u);
        }

        [v12 engineDidPauseForLeaseEnd:WeakRetained];
      }
    }
  }
  else if (v4)
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v28 = v22;
    __int16 v29 = 2114;
    uint64_t v30 = v23;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Ignoring lease playback prevention [lease being acquired] - item:%{public}@", buf, 0x16u);
  }
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  msv_dispatch_sync_on_queue();
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_11;
    v9[3] = &unk_2643C4B58;
    v9[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v10 reloadFairPlayKeyStatusWithCompletionHandler:v9];
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished [no subscription lease session] error: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: failed [failed to reload FairPlay key status] error: %{public}@", buf, 0x16u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  uint64_t v9 = [MEMORY[0x263F12178] standardUserDefaults];
  [v9 HomePodPFSQForcedLeaseRenewThreshold];
  double v11 = v10;

  id v12 = [MEMORY[0x263F89108] currentDeviceInfo];
  if ([v12 isAudioAccessory])
  {
    id v13 = [*(id *)(a1 + 40) lastPlaybackRequestDate];
    if (!v13)
    {

      goto LABEL_16;
    }
    v14 = [*(id *)(a1 + 40) lastPlaybackRequestDate];
    [v14 timeIntervalSinceNow];
    double v16 = v15;

    if (v16 < -v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (([v5 hasOnlinePlaybackKeys] & 1) != 0 || objc_msgSend(v5, "hasOfflinePlaybackKeys"))
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v17;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished [already had lease with playback keys]. status: %{public}@", buf, 0x16u);
    }
    goto LABEL_4;
  }
LABEL_16:
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = v19;
    __int16 v30 = 2112;
    id v31 = v20;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: renewing lease account: %@", buf, 0x16u);
  }

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F891E8]) initWithRequestContext:*(void *)(a1 + 56)];
  [v21 setShouldPreventLeaseAcquisition:1];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_15;
  v24[3] = &unk_2643C4B30;
  uint64_t v22 = *(void **)(a1 + 40);
  v24[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v26, &location);
  id v25 = *(id *)(a1 + 64);
  id v23 = (id)[v22 performPlaybackRequest:v21 completionHandler:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
LABEL_19:
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x263F087E8] errorForICError:a4 response:a2];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  double v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = objc_msgSend(v8, "msv_description");
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v13;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: finished", buf, 0xCu);
  }

  if ([v7 isNotEmpty])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v15 = [WeakRetained playbackEngine];
    double v16 = [v15 eventStream];
    v18[0] = @"network-operation-type";
    v18[1] = @"network-operation-reason";
    v19[0] = &unk_26CC192C0;
    v19[1] = @"Preparing for playback";
    v18[2] = @"blocks-playback";
    v18[3] = @"network-metrics";
    v19[2] = MEMORY[0x263EFFA80];
    v19[3] = v7;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    [v16 emitEventType:@"network-operation" payload:v17];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_2(uint64_t a1)
{
  char v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) hashedDSID];
  id v6 = [v2 objectForKeyedSubscript:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v5 = [*(id *)(a1 + 40) hashedDSID];
  [v4 setObject:0 forKeyedSubscript:v5];

  v6[2](v6, *(void *)(a1 + 48));
}

void __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke_2;
  v3[3] = &unk_2643C4A88;
  id v4 = *(id *)(a1 + 32);
  [a2 reloadFairPlayKeyStatusWithCompletionHandler:v3];
}

void __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 hasOnlinePlaybackKeys], v5);
}

@end