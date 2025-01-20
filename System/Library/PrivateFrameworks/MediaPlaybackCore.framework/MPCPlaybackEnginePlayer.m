@interface MPCPlaybackEnginePlayer
@end

@implementation MPCPlaybackEnginePlayer

uint64_t __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v1 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v4, &location);
  uint64_t v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

void __54___MPCPlaybackEnginePlayer_donateMetricsToPlayerItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentItem];
  id v47 = [v2 avPlayerItem];

  v3 = *(void **)(a1 + 40);
  id v4 = objc_msgSend(v47, "mpc_playerItemIdentifier");
  LODWORD(v3) = [v3 isEqual:v4];

  if (v3)
  {
    v5 = [*(id *)(a1 + 48) musicTotalTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v5, @"msc_MPP");

    v6 = [*(id *)(a1 + 48) musicWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v6, @"msc_MWT");

    v7 = [*(id *)(a1 + 48) mediaPlayerTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v7, @"msc_MPT");

    v8 = [*(id *)(a1 + 48) setQueueCommandSendTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v8, @"msc_SQ");

    v9 = [*(id *)(a1 + 48) queueLoadWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v9, @"msc_QL");

    v10 = [*(id *)(a1 + 48) assetLoadWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v10, @"msc_AL");

    v11 = [*(id *)(a1 + 48) readyToPlayStatusWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v11, @"msc_RTP");

    v12 = [*(id *)(a1 + 48) rateChangeWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v12, @"msc_RC");

    v13 = [*(id *)(a1 + 48) firstAudioFrameWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v13, @"msc_FAF");

    v14 = [*(id *)(a1 + 48) playCommandWaitTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v14, @"msc_playCmdWait");

    v15 = NSNumber;
    v16 = [*(id *)(a1 + 48) eventType];
    v17 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isEqualToString:", @"FirstItem"));
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v17, @"msc_firstItem");

    v18 = [*(id *)(a1 + 48) isFirstPlay];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v18, @"msc_firstPlay");

    v19 = [*(id *)(a1 + 48) featureName];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v19, @"msc_featureName");

    v20 = [*(id *)(a1 + 48) queueType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v20, @"msc_queueType");

    v21 = [*(id *)(a1 + 48) isShuffled];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v21, @"msc_shuffled");

    v22 = [*(id *)(a1 + 48) isAutoPlayEnabled];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v22, @"msc_autoPlay");

    v23 = [*(id *)(a1 + 48) isSharePlay];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v23, @"msc_sharePlay");

    v24 = [*(id *)(a1 + 48) isRemoteSetQueue];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v24, @"msc_remoteSQ");

    v25 = [*(id *)(a1 + 48) assetType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v25, @"msc_asstType");

    v26 = [*(id *)(a1 + 48) assetSource];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v26, @"msc_asstSource");

    v27 = [*(id *)(a1 + 48) assetLocation];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v27, @"msc_asstLoc");

    v28 = [*(id *)(a1 + 48) isDelegatedPlayback];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v28, @"msc_delegatedPB");

    v29 = [*(id *)(a1 + 48) hasOnlinePlaybackKeys];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v29, @"msc_onlinePBkeys");

    v30 = [*(id *)(a1 + 48) hasOfflinePlaybackKeys];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v30, @"msc_offlinePBkeys");

    v31 = [*(id *)(a1 + 48) routeInfo];
    v32 = [v31 objectForKeyedSubscript:@"type"];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v32, @"msc_routeType");

    v33 = [*(id *)(a1 + 48) networkType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v33, @"msc_nwType");

    v34 = [*(id *)(a1 + 48) isActiveAccount];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v34, @"msc_acrtiveAccount");

    v35 = [*(id *)(a1 + 48) hasAccountInfo];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v35, @"msc_accountInfo");

    v36 = [*(id *)(a1 + 48) isReplacingPlayback];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v36, @"msc_replacingPB");

    v37 = [*(id *)(a1 + 48) errorResolution];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v37, @"msc_errorResAppld");

    v38 = [*(id *)(a1 + 48) errorSignature];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v38, @"msc_errorSig");

    v39 = [*(id *)(a1 + 48) experimentID];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v39, @"msc_experimentID");

    v40 = [*(id *)(a1 + 48) treatmentID];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v40, @"msc_treatmentID");

    v41 = [*(id *)(a1 + 48) endpointType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v41, @"msc_endpointType");

    v42 = [*(id *)(a1 + 48) seekBeforePlaying];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v42, @"msc_seek");

    v43 = [*(id *)(a1 + 48) queueCommandType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v43, @"msc_queueComType");

    v44 = [*(id *)(a1 + 48) networkTime];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v44, @"msc_nwTime");

    v45 = [*(id *)(a1 + 48) assetProtectionType];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v45, @"msc_protectionType");

    v46 = [*(id *)(a1 + 48) storefront];
    objc_msgSend(v47, "mpc_setReportingValue:forKey:", v46, @"msc_storefront");
  }
}

void __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) playbackStackController];
  uint64_t v5 = [v4 renderingMode];
  if ((unint64_t)(v5 - 1) >= 5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }

  if ([v3 tier] == 4)
  {
    v7 = [*(id *)(a1 + 40) audioRoute];
    char v8 = (v6 == 0) & ~[v7 isSpatializationEnabled];

    if (v8) {
      uint64_t v6 = 1;
    }
  }
  if ([v3 renderingMode] != v6)
  {
    uint64_t v9 = [v3 audioFormatWithRenderingMode:v6];

    id v3 = (id)v9;
  }
  uint64_t v10 = [v3 tier];
  v11 = [*(id *)(a1 + 40) preferredFormat];
  uint64_t v12 = [v11 tier];

  if (v10 == v12)
  {
    uint64_t v13 = [v3 tier];
    v14 = [*(id *)(a1 + 40) preferredFormat];
    uint64_t v15 = [v14 tier];

    if (v13 == v15) {
      uint64_t v16 = 100;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 32);
    int v24 = 138543874;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v28 = 2114;
    id v29 = v3;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - [AF] - Updating active format : %{public}@", (uint8_t *)&v24, 0x20u);
  }

  [*(id *)(a1 + 40) updateActiveFormat:v3 justification:v16];
  v20 = [*(id *)(a1 + 32) playbackStackController];
  [v20 activeFormatDidChangeFor:*(void *)(a1 + 56)];

  v21 = [*(id *)(a1 + 32) playbackEngine];
  v22 = [v21 eventObserver];
  v23 = [v3 stableVariantID];
  [v22 engine:v21 didChangeCurrentItemVariantID:v23];
}

void __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    uint64_t v13 = *(id *)(a1 + 56);
    id v12 = v5;
    msv_dispatch_on_main_queue();

    char v8 = v13;
  }
  else
  {
    if (!v6) {
      goto LABEL_4;
    }
    char v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Failed to load track audio format for stableVariantID=%{public}@ error=%{public}@", buf, 0x2Au);
    }
  }

LABEL_4:
}

uint64_t __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __61___MPCPlaybackEnginePlayer_jumpToTime_identifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[7];
    int v9 = 138544130;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Set current time command %{public}@ completed - time=%f - error=%{public}@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __58___MPCPlaybackEnginePlayer_setRate_identifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    double v9 = *(float *)(a1 + 64);
    int v12 = 138544130;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    double v17 = v9;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Set rate command %{public}@ completed - rate=%f - error=%{public}@", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t v10 = [WeakRetained currentItem];
  LODWORD(v11) = *(_DWORD *)(a1 + 64);
  [v10 _setCurrentPlaybackRate:v11];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __65___MPCPlaybackEnginePlayer_endScanningWithIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-End seek command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke_96(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Play command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  [*(id *)(a1 + 48) invalidateEVSDeferralAssertionForFirstAudioFrame];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __77___MPCPlaybackEnginePlayer_pauseForLeasePreventionWithIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause for lease prevention %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __80___MPCPlaybackEnginePlayer_pauseForSleepTimerWithFadeout_identifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __67___MPCPlaybackEnginePlayer_pauseWithFadeout_identifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __59___MPCPlaybackEnginePlayer_pauseWithIdentifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Pause command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __63___MPCPlaybackEnginePlayer_playWithRate_identifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Play command %{public}@ completed - error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __55___MPCPlaybackEnginePlayer_becomeActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v7 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    int v17 = 138543874;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    id v20 = WeakRetained;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v12 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Set audio session active failed - error: %{public}@";
    id v13 = v9;
    uint32_t v14 = 32;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    int v17 = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2048;
    id v20 = WeakRetained;
    __int16 v12 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Set audio session active succeeded";
    id v13 = v9;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
LABEL_7:

  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id, double))(v16 + 16))(v16, a2, v5, -v7);
  }
}

void __63___MPCPlaybackEnginePlayer_finalizeStateRestoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      double v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v14 = 138543874;
        uint64_t v15 = v7;
        __int16 v16 = 2048;
        int v17 = v5;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "[%{public}@]-MPCPlaybackEngineImplementation: %p - loadSessionWithQueueController - Load session failed - error: %{public}@", (uint8_t *)&v14, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      BOOL v10 = [WeakRetained playbackStackController];
      uint64_t v11 = [v10 currentQueueItem];

      __int16 v12 = [v11 contentItemID];
      id v13 = [v5 errorController];
      [v13 setPreferredFirstContentItemID:v12];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine implementation no longer exist");
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 0, @"PlaybackEngine finalizeSetQueue does not call completion");
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id v4 = (void *)MEMORY[0x263F54EC8];
  uint64_t v5 = *MEMORY[0x263F54E80];
  double v6 = [*(id *)(a1 + 32) description];
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v4 snapshotWithDomain:v5 type:@"Bug" subType:@"finalizeSetQueue" context:@"completion not called" triggerThresholdValues:0 events:v7 completion:0];
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F54EC8];
    uint64_t v5 = *MEMORY[0x263F54E80];
    double v6 = [*(id *)(a1 + 40) description];
    v8[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [v4 snapshotWithDomain:v5 type:@"Bug" subType:@"finalizeSetQueue" context:@"completion called multiple times" triggerThresholdValues:0 events:v7 completion:0];
  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  double v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      id v16 = WeakRetained;
      __int16 v17 = 2114;
      id v18 = v3;
      uint64_t v8 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - async performSetQueue failed - error: %{public}@";
      uint64_t v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl(&dword_21BB87000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2048;
    id v16 = WeakRetained;
    uint64_t v8 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - async performSetQueue completed";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_78(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v7 = [v3 playbackStackController];
    uint64_t v8 = [v7 modeDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v25 = v4;
    __int16 v26 = 2048;
    uint64_t v27 = v3;
    __int16 v28 = 2114;
    uint64_t v29 = v5;
    __int16 v30 = 1024;
    int v31 = v6;
    __int16 v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - calling setQueueWithInitialItem on playback stack - item: %{public}@ - play: %{BOOL}u - mode: %{public}@", buf, 0x30u);
  }
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_log_type_t v10 = (char *)os_signpost_id_generate(v9);

  uint32_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  uint64_t v12 = v11;
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v13 = *(unsigned __int8 *)(a1 + 72);
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v13;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "InitialItem", "shouldPlay=%{BOOL}u", buf, 8u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  uint64_t v14 = [*(id *)(a1 + 40) playbackStackController];
  BOOL v15 = *(unsigned char *)(a1 + 72) != 0;
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 56);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_79;
  v18[3] = &unk_2643BE190;
  v21[1] = v10;
  objc_copyWeak(v21, (id *)buf);
  id v20 = *(id *)(a1 + 64);
  char v22 = *(unsigned char *)(a1 + 73);
  id v19 = *(id *)(a1 + 32);
  char v23 = *(unsigned char *)(a1 + 72);
  [v14 setQueueWithInitialItem:v17 andPlay:v15 identifier:v16 completion:v18];

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

uint64_t __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_84(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)int v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PrepareForRate", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "Failed to set rate from user defaults: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_END, v7, "InitialItem", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = *(void *)(a1 + 40);
  if (!WeakRetained)
  {
    uint32_t v11 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine implementation no longer exist");
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);

    goto LABEL_14;
  }
  (*(void (**)(void, id))(v9 + 16))(*(void *)(a1 + 40), v4);
  os_log_type_t v10 = [WeakRetained evsDeferralAssertionForFirstAudioFrame];

  if (v10)
  {
    if (v4) {
      goto LABEL_7;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v21 = 138543618;
        uint64_t v22 = v13;
        __int16 v23 = 2048;
        id v24 = WeakRetained;
        uint64_t v14 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Keeping EVS deferral assertion alive until first audio "
              "frame for siri set queue";
LABEL_12:
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 65)) {
        goto LABEL_7;
      }
      BOOL v15 = [WeakRetained playbackStackController];
      [v15 effectiveRate];
      if (v16 != 0.0)
      {

        goto LABEL_7;
      }
      uint64_t v17 = [WeakRetained playbackStackController];
      [v17 targetRate];
      float v19 = v18;

      if (v19 <= 0.0)
      {
LABEL_7:
        [WeakRetained invalidateEVSDeferralAssertionForFirstAudioFrame];
        goto LABEL_14;
      }
      uint64_t v12 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = 138543618;
        uint64_t v22 = v20;
        __int16 v23 = 2048;
        id v24 = WeakRetained;
        uint64_t v14 = "[%{public}@]-MPCPlaybackEngineImplementation: %p - Keeping EVS deferral assertion alive until first audio "
              "frame for set queue with immediate play";
        goto LABEL_12;
      }
    }
  }
LABEL_14:
}

uint64_t __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = [WeakRetained _stateDictionary];
      uint64_t v6 = v5[2](v5, v9);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end