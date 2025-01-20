@interface _MPCMediaRemotePublisher
- (BOOL)hasInitializedSupportedCommands;
- (BOOL)isEngineRestoringState;
- (BOOL)isMediaServerAvailable;
- (MPCPlaybackEngine)playbackEngine;
- (MPNowPlayingInfoCenter)infoCenter;
- (MPRemoteCommandCenter)commandCenter;
- (NSDictionary)lastPerformanceMetrics;
- (NSString)hostingSharedSessionID;
- (_MPCMediaRemotePublisher)initWithPlaybackEngine:(id)a3;
- (_MPCMediaRemotePublisher_Swift)swift;
- (id)_exportableSessionTypes;
- (id)_supportedSessionTypes;
- (id)getQOSDialogForError:(id)a3 withItem:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 artworkCatalogForContentItem:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (id)nowPlayingInfoCenter:(id)a3 childContentItemIDAtIndex:(int64_t)a4 ofItem:(id)a5;
- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4;
- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4;
- (id)nowPlayingInfoCenter:(id)a3 contentItemIDsFromOffset:(int64_t)a4 toOffset:(int64_t)a5 nowPlayingIndex:(int64_t *)a6;
- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5;
- (id)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5;
- (id)nowPlayingInfoCenter:(id)a3 remoteArtworkForContentItem:(id)a4 format:(id)a5 size:(CGSize)a6 completion:(id)a7;
- (id)nowPlayingInfoCenter:(id)a3 transcriptAlignmentsForContentItem:(id)a4 completion:(id)a5;
- (id)playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:(id)a3;
- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3;
- (id)playbackQueuePropertiesForNowPlayingInfoCenter:(id)a3;
- (unint64_t)vocalAttenuationUnavailabilityReasons;
- (void)__updateSupportedCommands;
- (void)_activeSharedSessionDidChange:(id)a3;
- (void)_beginBackgroundTaskUntilPlayCommandWithCommand:(id)a3 timeout:(double)a4;
- (void)_commandEventDidTimeoutNotification:(id)a3;
- (void)_durationAvailableNotification:(id)a3;
- (void)_enqueueFallbackIntentIfNeededForCommandEvent:(id)a3 play:(BOOL)a4 completion:(id)a5;
- (void)_leaveSharedSessionWithCommandID:(id)a3 completion:(id)a4;
- (void)_performCommandEvent:(id)a3 completion:(id)a4;
- (void)_performDebugEvent:(id)a3 completion:(id)a4;
- (void)_performSkipChapterCommand:(unsigned int)a3 withCommandID:(id)a4 completion:(id)a5;
- (void)_updateLaunchCommands;
- (void)_updateSupportedCommands;
- (void)accountManager:(id)a3 didChangeAccounts:(id)a4;
- (void)becomeActive;
- (void)becomeActiveIfNeededWithCommandID:(id)a3 completion:(id)a4;
- (void)commandCenter:(id)a3 didTimeoutCommandEvent:(id)a4 statusHandler:(id)a5;
- (void)deactivateAudioSessionIfIdle:(int64_t)a3;
- (void)dealloc;
- (void)engine:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4;
- (void)engine:(id)a3 didChangeQueueController:(id)a4;
- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4;
- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4;
- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4;
- (void)engine:(id)a3 didChangeToItem:(id)a4;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)engineDidBlockVocalAttenuation:(id)a3;
- (void)engineDidEndStateRestoration:(id)a3;
- (void)engineDidLoseMediaServices:(id)a3;
- (void)engineDidResetMediaServices:(id)a3;
- (void)engineWillBeginStateRestoration:(id)a3;
- (void)getShouldRestoreStateWithCompletion:(id)a3;
- (void)invalidateQueueTypesWithReason:(id)a3;
- (void)invalidateSessionTypesWithReason:(id)a3;
- (void)leaveSharedSessionWithCommandID:(id)a3 remoteControlInterface:(id)a4 completion:(id)a5;
- (void)nowPlayingInfoCenter:(id)a3 didBeginLyricsEvent:(id)a4;
- (void)nowPlayingInfoCenter:(id)a3 didEndLyricsEvent:(id)a4;
- (void)nowPlayingInfoCenter:(id)a3 didEndMigrationWithIdentifier:(id)a4 error:(id)a5;
- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationForRequest:(id)a4 completion:(id)a5;
- (void)nowPlayingInfoCenter:(id)a3 willBeginSessionMigrationWithIdentifier:(id)a4;
- (void)performSetQueue:(id)a3 completion:(id)a4;
- (void)performSetQueueWithIntent:(id)a3 completion:(id)a4;
- (void)publishIfNeeded;
- (void)reportUserBackgroundedApplication;
- (void)setEngineRestoringState:(BOOL)a3;
- (void)setInitializedSupportedCommands:(BOOL)a3;
- (void)setLastPerformanceMetrics:(id)a3;
- (void)setMediaServerAvailable:(BOOL)a3;
- (void)updatePlaybackMetrics:(id)a3;
@end

@implementation _MPCMediaRemotePublisher

- (id)_supportedSessionTypes
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = +[MPCQueueController allKnownSessionTypes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138543618;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        BOOL v11 = +[MPCQueueController isSupportedSessionType:forEngine:reason:](MPCQueueController, "isSupportedSessionType:forEngine:reason:", v10, v2, &v17, v16);
        id v12 = v17;
        if (v11)
        {
          [v3 addObject:v10];
        }
        else
        {
          v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            uint64_t v23 = v10;
            __int16 v24 = 2114;
            id v25 = v12;
            _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[Publisher] _supportedSessionTypes excluding session type [not supported] sessionType=%{public}@ reason=%{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (void)invalidateSessionTypesWithReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[Publisher] invalidateSessionTypesWithReason [] reason=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(_MPCMediaRemotePublisher *)self _updateSupportedCommands];
  [(_MPCMediaRemotePublisher *)self _updateLaunchCommands];
}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (![(NSArray *)self->_accounts isEqualToArray:v5])
  {
    int v6 = (NSArray *)[v5 copy];
    accounts = self->_accounts;
    self->_accounts = v6;

    uint64_t v8 = [(NSArray *)self->_accounts firstObject];
    if ([v8 isActiveAccount])
    {
      v9 = [v8 storeFrontIdentifier];
      if (![(NSString *)self->_activeAccountStoreFrontIdentifier isEqualToString:v9])
      {
        objc_storeStrong((id *)&self->_activeAccountStoreFrontIdentifier, v9);
        uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          v15 = v9;
          _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[Publisher] Updating active account storefront: %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
      int v11 = [v8 hasCatalogPlaybackCapability];
      if (self->_activeAccountAllowsSubscriptionPlayback != v11)
      {
        int v12 = v11;
        self->_activeAccountAllowsSubscriptionPlayback = v11;
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 67109120;
          LODWORD(v15) = v12;
          _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[Publisher] Updating active account subscription capabilities: %{BOOL}u", (uint8_t *)&v14, 8u);
        }
      }
    }
    [(_MPCMediaRemotePublisher *)self publishIfNeeded];
    [(_MPCMediaRemotePublisher *)self _updateLaunchCommands];
  }
}

- (void)_updateLaunchCommands
{
}

- (unint64_t)vocalAttenuationUnavailabilityReasons
{
  v3 = +[MPCPlaybackAccountManager sharedManager];
  id v4 = [v3 activeAccount];

  id v5 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  int v6 = [v5 queueController];
  id v7 = [v6 currentItem];
  int v8 = MSVDeviceSupportsVocalAttenuation();
  int v9 = [v4 hasCatalogPlaybackCapability];
  uint64_t v10 = [v6 musicSharePlay];

  uint64_t v11 = [v5 vocalAttenuationController];
  int v12 = (void *)v11;
  if (v11) {
    v13 = *(void **)(v11 + 80);
  }
  else {
    v13 = 0;
  }
  uint64_t v14 = v8 ^ 1u;
  if (!v9) {
    v14 |= 2uLL;
  }
  if (v10) {
    uint64_t v15 = v14 | 8;
  }
  else {
    uint64_t v15 = v14;
  }
  id v16 = v13;

  if (v16) {
    unint64_t v17 = v15 | 0x10;
  }
  else {
    unint64_t v17 = v15;
  }
  if (![v7 supportsVocalAttenuation]) {
    v17 |= 0x20uLL;
  }

  return v17;
}

- (void)becomeActive
{
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDsFromOffset:(int64_t)a4 toOffset:(int64_t)a5 nowPlayingIndex:(int64_t *)a6
{
  int v9 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  uint64_t v10 = [v9 queueController];

  if (v10)
  {
    uint64_t v11 = [v10 contentItemIDsFromOffset:a4 toOffset:a5 mode:1 nowPlayingIndex:a6];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  }

  return v11;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v7 = [v6 queueController];

  int v8 = [v7 itemForContentItemID:v5];
  int v9 = [v8 contentItem];
  uint64_t v10 = [v7 currentItem];
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = v10;
      v22 = v8;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v11 = [v10 chapters];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            unint64_t v17 = [v16 identifier];
            char v18 = [v17 isEqualToString:v5];

            if (v18)
            {
              id v19 = v16;

              uint64_t v10 = v21;
              int v8 = v22;
              goto LABEL_13;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = v21;
      int v8 = v22;
    }
  }
  id v19 = v9;
LABEL_13:

  return v19;
}

- (id)playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  v3 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v4 = [v3 queueController];
  id v5 = [v4 music];

  if (v5)
  {
    int v6 = [v4 currentItem];
    id v7 = [v3 eventStream];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __102___MPCMediaRemotePublisher_PlaybackQueue__playbackQueueAuxilaryNowPlayingInfoForNowPlayingInfoCenter___block_invoke;
    id v16 = &unk_2643BFAF8;
    id v17 = v6;
    id v8 = v6;
    uint64_t v9 = [v7 performQueryReturningBOOL:&v13];
    uint64_t v18 = *MEMORY[0x263F54BA8];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", v9, v13, v14, v15, v16);
    v19[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  v3 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v4 = [v3 queueController];

  id v5 = [v4 sessionID];

  return v5;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (id)playbackQueuePropertiesForNowPlayingInfoCenter:(id)a3
{
  v3 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v4 = [v3 queueController];

  id v5 = [v4 upNextBehavior];
  if (v5)
  {
    int v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v7 = [v4 currentItem];
    id v8 = [v7 contentItemID];
    uint64_t v9 = [v5 tailInsertionContentItemIDForTargetContentItemID:v8];
    [v6 setObject:v9 forKeyedSubscript:@"tailInsertionContentItemID"];

    uint64_t v10 = [v5 displayItemCount];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v4 currentItem];
      char v13 = [v12 isRadioItem];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = [NSNumber numberWithInteger:v11];
        [v6 setObject:v14 forKeyedSubscript:@"totalItemCount"];
      }
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkCatalogForContentItem:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  int v6 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v7 = [v6 queueController];
  id v8 = [v7 itemForContentItemID:v5];
  uint64_t v9 = [v6 player];
  uint64_t v10 = [v9 currentItem];

  double v11 = 0.0;
  if (v8 == v10)
  {
    uint64_t v12 = [v6 player];
    [v12 currentTime];
    double v11 = v13;
  }
  uint64_t v14 = [v8 artworkCatalogForPlaybackTime:v11];

  return v14;
}

- (void)engineDidEndStateRestoration:(id)a3
{
  self->_engineRestoringState = 0;
}

- (void)__updateSupportedCommands
{
  uint64_t v447 = *MEMORY[0x263EF8340];
  if (![(_MPCMediaRemotePublisher *)self hasInitializedSupportedCommands]) {
    return;
  }
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  int v6 = v5;
  unint64_t v414 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateSupportedCommands", "", buf, 2u);
  }
  os_signpost_id_t spid = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v7 = [WeakRetained queueController];
  id v8 = [v7 currentItem];
  uint64_t v9 = [v7 behaviorImpl];
  int v424 = [v9 isEmpty];

  uint64_t v10 = [v7 behaviorType];
  v422 = v7;
  double v11 = [v7 sessionID];
  uint64_t v12 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackSessionCommand];
  [v12 setCurrentPlaybackSessionIdentifier:v11];

  double v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v422 sessionID];
    *(_DWORD *)buf = 138543618;
    v444 = v14;
    __int16 v445 = 2114;
    v446 = v8;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_INFO, "[Publisher] _updateSupportedCommands sessionIdentifier=%{public}@ currentItem=%{public}@", buf, 0x16u);
  }
  int v15 = [v8 isAlwaysLive];
  id v16 = [(MPRemoteCommandCenter *)self->_commandCenter changePlaybackPositionCommand];
  id v17 = self;
  uint64_t v18 = [MEMORY[0x263EFF980] array];
  id v19 = [MEMORY[0x263EFF980] array];
  if (v15) {
    [v18 addObject:@"live streaming content"];
  }
  int v417 = v15;
  long long v20 = [(MPRemoteCommandCenter *)self->_commandCenter changePlaybackPositionCommand];
  [v20 setCanBeControlledByScrubbing:v15 ^ 1u];

  long long v21 = [WeakRetained transcriptAlignmentController];
  v22 = v21;
  unint64_t v416 = v10;
  if (v21) {
    uint64_t v23 = [v21 isEnabled];
  }
  else {
    uint64_t v23 = 0;
  }
  long long v24 = [(MPRemoteCommandCenter *)self->_commandCenter changePlaybackPositionCommand];
  [v24 setSupportsReferencePosition:v23];

  if ([v18 count])
  {
    unint64_t v25 = 0x263EFF000;
    unint64_t v26 = v416;
    int v27 = v417;
    if (![v18 count])
    {
      v361 = [MEMORY[0x263F08690] currentHandler];
      v362 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v361 handleFailureInFunction:v362 file:@"_MPCMediaRemotePublisher.m" lineNumber:1020 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
      unint64_t v26 = v416;
    }
    [v16 setUnsupportedReasons:v18];
    if ([v16 hasTargets]) {
      [v16 removeTarget:v17 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v16 setUnsupportedReasons:0];
    unint64_t v25 = 0x263EFF000uLL;
    unint64_t v26 = v416;
    int v27 = v417;
    if (([v16 hasTargets] & 1) == 0) {
      [v16 addTarget:v17 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v16, "setEnabled:", objc_msgSend(v19, "count") == 0);
    [v16 setDisabledReasons:v19];
  }

  uint64_t v28 = [(MPRemoteCommandCenter *)self->_commandCenter changePlaybackRateCommand];
  v29 = v17;
  v30 = [*(id *)(v25 + 2432) array];
  v31 = [*(id *)(v25 + 2432) array];
  if (([v8 supportsRateChange] & 1) == 0) {
    [v30 addObject:@"item does not support rate changes"];
  }
  if (v27) {
    [v30 addObject:@"live streaming content"];
  }
  if (v26 != 4) {
    [v31 addObject:@"hidden for Music"];
  }
  if ([v30 count])
  {
    if (![v30 count])
    {
      v363 = [MEMORY[0x263F08690] currentHandler];
      v364 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v363 handleFailureInFunction:v364 file:@"_MPCMediaRemotePublisher.m" lineNumber:1026 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
      unint64_t v26 = v416;
    }
    [v28 setUnsupportedReasons:v30];
    if ([v28 hasTargets]) {
      [v28 removeTarget:v29 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v28 setUnsupportedReasons:0];
    if (([v28 hasTargets] & 1) == 0) {
      [v28 addTarget:v29 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v28, "setEnabled:", objc_msgSend(v31, "count") == 0);
    [v28 setDisabledReasons:v31];
  }

  v32 = [(MPRemoteCommandCenter *)self->_commandCenter setSleepTimerCommand];
  v33 = v29;
  v34 = [*(id *)(v25 + 2432) array];
  v35 = [*(id *)(v25 + 2432) array];
  if (v26 != 4)
  {
    [v34 addObject:@"sleep timers for podcasts"];
    [v35 addObject:@"hidden for Music"];
  }
  if ([v34 count])
  {
    if (![v34 count])
    {
      v365 = [MEMORY[0x263F08690] currentHandler];
      v366 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v365 handleFailureInFunction:v366 file:@"_MPCMediaRemotePublisher.m" lineNumber:1032 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
    }
    [v32 setUnsupportedReasons:v34];
    if ([v32 hasTargets]) {
      [v32 removeTarget:v33 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v32 setUnsupportedReasons:0];
    if (([v32 hasTargets] & 1) == 0) {
      [v32 addTarget:v33 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v32, "setEnabled:", objc_msgSend(v35, "count") == 0);
    [v32 setDisabledReasons:v35];
  }

  v36 = [(MPRemoteCommandCenter *)self->_commandCenter seekForwardCommand];
  v37 = v33;
  v38 = [*(id *)(v25 + 2432) array];
  v39 = [*(id *)(v25 + 2432) array];
  v40 = [v422 musicSharePlay];

  if (v40) {
    [v38 addObject:@"shared listening does not support FF"];
  }
  if (v27) {
    [v38 addObject:@"live streaming content"];
  }
  if (([v8 supportsFastForward] & 1) == 0) {
    [v38 addObject:@"AV does not support FF"];
  }
  if ([v38 count])
  {
    if (![v38 count])
    {
      v367 = [MEMORY[0x263F08690] currentHandler];
      v368 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v367 handleFailureInFunction:v368 file:@"_MPCMediaRemotePublisher.m" lineNumber:1042 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
    }
    [v36 setUnsupportedReasons:v38];
    if ([v36 hasTargets]) {
      [v36 removeTarget:v37 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v36 setUnsupportedReasons:0];
    if (([v36 hasTargets] & 1) == 0) {
      [v36 addTarget:v37 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v36, "setEnabled:", objc_msgSend(v39, "count") == 0);
    [v36 setDisabledReasons:v39];
  }

  v41 = [(MPRemoteCommandCenter *)self->_commandCenter seekBackwardCommand];
  v42 = v37;
  v43 = [*(id *)(v25 + 2432) array];
  v44 = [*(id *)(v25 + 2432) array];
  v45 = [v422 musicSharePlay];

  if (v45) {
    [v43 addObject:@"shared listening does not support RW"];
  }
  if (v27) {
    [v43 addObject:@"live streaming content"];
  }
  if (([v8 supportsRewind] & 1) == 0) {
    [v43 addObject:@"AV does not support RW"];
  }
  if ([v43 count])
  {
    if (![v43 count])
    {
      v369 = [MEMORY[0x263F08690] currentHandler];
      v370 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v369 handleFailureInFunction:v370 file:@"_MPCMediaRemotePublisher.m" lineNumber:1051 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
    }
    [v41 setUnsupportedReasons:v43];
    if ([v41 hasTargets]) {
      [v41 removeTarget:v42 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v41 setUnsupportedReasons:0];
    if (([v41 hasTargets] & 1) == 0) {
      [v41 addTarget:v42 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v41, "setEnabled:", objc_msgSend(v44, "count") == 0);
    [v41 setDisabledReasons:v44];
  }

  char v46 = [v8 prefersSeekOverSkip];
  if (!v8) {
    v46 |= [WeakRetained isSystemPodcastsApplication];
  }
  v47 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
  v48 = v42;
  v49 = [*(id *)(v25 + 2432) array];
  v50 = [*(id *)(v25 + 2432) array];
  if (v27) {
    [v49 addObject:@"live streaming content"];
  }
  if ((v46 & 1) == 0) {
    [v50 addObject:@"item prefers seek over skip"];
  }
  if ([v49 count])
  {
    if (![v49 count])
    {
      v371 = [MEMORY[0x263F08690] currentHandler];
      v372 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v371 handleFailureInFunction:v372 file:@"_MPCMediaRemotePublisher.m" lineNumber:1061 description:@"Must provide reason for unsupported command"];

      int v27 = v417;
    }
    [v47 setUnsupportedReasons:v49];
    if ([v47 hasTargets]) {
      [v47 removeTarget:v48 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v47 setUnsupportedReasons:0];
    if (([v47 hasTargets] & 1) == 0) {
      [v47 addTarget:v48 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v47, "setEnabled:", objc_msgSend(v50, "count") == 0);
    [v47 setDisabledReasons:v50];
  }

  v51 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
  v52 = v48;
  v53 = [MEMORY[0x263EFF980] array];
  v54 = [MEMORY[0x263EFF980] array];
  if (v27) {
    [v53 addObject:@"live streaming content"];
  }
  if ((v46 & 1) == 0) {
    [v54 addObject:@"item prefers seek over skip"];
  }
  if ([v53 count])
  {
    if (![v53 count])
    {
      v373 = [MEMORY[0x263F08690] currentHandler];
      v374 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v373 handleFailureInFunction:v374 file:@"_MPCMediaRemotePublisher.m" lineNumber:1065 description:@"Must provide reason for unsupported command"];
    }
    [v51 setUnsupportedReasons:v53];
    if ([v51 hasTargets]) {
      [v51 removeTarget:v52 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v51 setUnsupportedReasons:0];
    if (([v51 hasTargets] & 1) == 0) {
      [v51 addTarget:v52 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v51, "setEnabled:", objc_msgSend(v54, "count") == 0);
    [v51 setDisabledReasons:v54];
  }

  v55 = [(MPRemoteCommandCenter *)self->_commandCenter previousTrackCommand];
  v56 = v52;
  v57 = [MEMORY[0x263EFF980] array];
  v58 = [MEMORY[0x263EFF980] array];
  if (v424) {
    [v57 addObject:@"behavior has no items"];
  }
  v59 = @"uninitialized queueController";
  if (v422) {
    v59 = 0;
  }
  v60 = v59;
  v423 = v8;
  v61 = [v8 contentItemID];
  v434 = v60;
  char v62 = [v422 canPreviousTrackForContentItemID:v61 reason:&v434];
  v63 = v434;

  if ((v62 & 1) == 0) {
    [v58 addObject:v63];
  }

  if ([v57 count])
  {
    v64 = v423;
    if (![v57 count])
    {
      v375 = [MEMORY[0x263F08690] currentHandler];
      v376 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v375 handleFailureInFunction:v376 file:@"_MPCMediaRemotePublisher.m" lineNumber:1072 description:@"Must provide reason for unsupported command"];
    }
    [v55 setUnsupportedReasons:v57];
    if ([v55 hasTargets]) {
      [v55 removeTarget:v56 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v55 setUnsupportedReasons:0];
    v64 = v423;
    if (([v55 hasTargets] & 1) == 0) {
      [v55 addTarget:v56 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v55, "setEnabled:", objc_msgSend(v58, "count") == 0);
    [v55 setDisabledReasons:v58];
  }

  v65 = [(MPRemoteCommandCenter *)self->_commandCenter nextTrackCommand];
  v66 = v56;
  v67 = [MEMORY[0x263EFF980] array];
  v68 = [MEMORY[0x263EFF980] array];
  if (v424) {
    [v67 addObject:@"behavior has no items"];
  }
  v69 = v60;
  v70 = [v64 contentItemID];
  v433 = v69;
  char v71 = [v422 canNextTrackForContentItemID:v70 reason:&v433];
  v72 = v433;

  if ((v71 & 1) == 0) {
    [v68 addObject:v72];
  }
  if ([v423 isPlaceholder]) {
    [v68 addObject:@"loading item"];
  }

  if ([v67 count])
  {
    if (![v67 count])
    {
      v377 = [MEMORY[0x263F08690] currentHandler];
      v378 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v377 handleFailureInFunction:v378 file:@"_MPCMediaRemotePublisher.m" lineNumber:1079 description:@"Must provide reason for unsupported command"];
    }
    [v65 setUnsupportedReasons:v67];
    if ([v65 hasTargets]) {
      [v65 removeTarget:v66 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v65 setUnsupportedReasons:0];
    if (([v65 hasTargets] & 1) == 0) {
      [v65 addTarget:v66 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v65, "setEnabled:", objc_msgSend(v68, "count") == 0);
    [v65 setDisabledReasons:v68];
  }

  v73 = [(MPRemoteCommandCenter *)self->_commandCenter createRadioStationCommand];
  v74 = v66;
  v75 = [MEMORY[0x263EFF980] array];
  v76 = [MEMORY[0x263EFF980] array];
  if (v424) {
    [v75 addObject:@"behavior has no items"];
  }
  v77 = [v422 upNextBehavior];
  char v78 = [v77 allowsQueueModifications];

  if ((v78 & 1) == 0) {
    [v75 addObject:@"queue does not allow modification"];
  }
  if (!v74[32]) {
    [v75 addObject:@"active account does not allow subscription playback"];
  }
  if (v417) {
    [v75 addObject:@"live streaming content"];
  }
  if ([v423 isPlaceholder]) {
    [v75 addObject:@"loading item"];
  }
  v79 = [v423 modelGenericObject];
  v80 = [v79 flattenedGenericObject];
  uint64_t v81 = [v80 type];

  if (v81 != 1) {
    [v75 addObject:@"item is not a Song"];
  }
  if ([v75 count])
  {
    if (![v75 count])
    {
      v379 = [MEMORY[0x263F08690] currentHandler];
      v380 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v379 handleFailureInFunction:v380 file:@"_MPCMediaRemotePublisher.m" lineNumber:1088 description:@"Must provide reason for unsupported command"];
    }
    [v73 setUnsupportedReasons:v75];
    if ([v73 hasTargets]) {
      [v73 removeTarget:v74 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v73 setUnsupportedReasons:0];
    if (([v73 hasTargets] & 1) == 0) {
      [v73 addTarget:v74 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v73, "setEnabled:", objc_msgSend(v76, "count") == 0);
    [v73 setDisabledReasons:v76];
  }

  v82 = [(MPRemoteCommandCenter *)self->_commandCenter reorderQueueCommand];
  v83 = v74;
  v84 = [MEMORY[0x263EFF980] array];
  v85 = [MEMORY[0x263EFF980] array];
  if (v424) {
    [v84 addObject:@"behavior has no items"];
  }
  v86 = [v422 upNextBehavior];
  char v87 = [v86 allowsQueueModifications];

  if ((v87 & 1) == 0) {
    [v84 addObject:@"queue does not allow modifications"];
  }
  if ([v84 count])
  {
    if (![v84 count])
    {
      v381 = [MEMORY[0x263F08690] currentHandler];
      v382 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v381 handleFailureInFunction:v382 file:@"_MPCMediaRemotePublisher.m" lineNumber:1093 description:@"Must provide reason for unsupported command"];
    }
    [v82 setUnsupportedReasons:v84];
    if ([v82 hasTargets]) {
      [v82 removeTarget:v83 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v82 setUnsupportedReasons:0];
    if (([v82 hasTargets] & 1) == 0) {
      [v82 addTarget:v83 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v82, "setEnabled:", objc_msgSend(v85, "count") == 0);
    [v82 setDisabledReasons:v85];
  }

  v88 = [(MPRemoteCommandCenter *)self->_commandCenter removeFromPlaybackQueueCommand];
  v89 = v83;
  v90 = [MEMORY[0x263EFF980] array];
  v91 = [MEMORY[0x263EFF980] array];
  if (v424) {
    [v90 addObject:@"behavior has no items"];
  }
  v92 = [v422 upNextBehavior];
  char v93 = [v92 allowsQueueModifications];

  if ((v93 & 1) == 0) {
    [v90 addObject:@"queue does not allow modifications"];
  }
  unint64_t v94 = v416;
  if ([v90 count])
  {
    if (![v90 count])
    {
      v383 = [MEMORY[0x263F08690] currentHandler];
      v384 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v383 handleFailureInFunction:v384 file:@"_MPCMediaRemotePublisher.m" lineNumber:1097 description:@"Must provide reason for unsupported command"];

      unint64_t v94 = v416;
    }
    [v88 setUnsupportedReasons:v90];
    if ([v88 hasTargets]) {
      [v88 removeTarget:v89 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v88 setUnsupportedReasons:0];
    if (([v88 hasTargets] & 1) == 0) {
      [v88 addTarget:v89 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v88, "setEnabled:", objc_msgSend(v91, "count") == 0);
    [v88 setDisabledReasons:v91];
  }

  if (v422)
  {
    v95 = [v422 music];

    if (v95)
    {
      v420 = 0;
      int v96 = 1;
    }
    else
    {
      v97 = NSString;
      if (v94 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"unknown/%lld", v94);
        v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v98 = off_2643BFBB8[v94];
      }
      v420 = [v97 stringWithFormat:@"%@ behavior", v98];

      int v96 = 0;
    }
  }
  else
  {
    int v96 = 0;
    v420 = @"uninitialized queueController";
  }
  v99 = [v422 music];
  v432 = @"<MISSING REASON>";
  char v100 = [v99 canUserChangeRepeatTypeWithReason:&v432];
  v415 = v432;

  v101 = [v422 music];
  uint64_t v102 = [v101 repeatType];

  v103 = [(MPRemoteCommandCenter *)self->_commandCenter changeRepeatModeCommand];
  v104 = v89;
  v105 = [MEMORY[0x263EFF980] array];
  v106 = [MEMORY[0x263EFF980] array];
  if ((v96 & 1) == 0) {
    [v105 addObject:v420];
  }
  if (v424) {
    [v105 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableRepeat]) {
    [v105 addObject:@"disabled for playback engine"];
  }
  if (v417) {
    [v105 addObject:@"live streaming content"];
  }
  int v419 = v96;
  char v107 = v96 ^ 1;
  char v108 = v96 ^ 1 | v100;
  if ((v108 & 1) == 0) {
    [v105 addObject:v415];
  }
  v109 = [(MPRemoteCommandCenter *)self->_commandCenter changeRepeatModeCommand];
  [v109 setCurrentRepeatType:v102];

  if ([v105 count])
  {
    if (![v105 count])
    {
      v412 = [MEMORY[0x263F08690] currentHandler];
      v385 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v412 handleFailureInFunction:v385 file:@"_MPCMediaRemotePublisher.m" lineNumber:1124 description:@"Must provide reason for unsupported command"];
    }
    [v103 setUnsupportedReasons:v105];
    char v110 = v419;
    if ([v103 hasTargets]) {
      [v103 removeTarget:v104 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v103 setUnsupportedReasons:0];
    if (([v103 hasTargets] & 1) == 0) {
      [v103 addTarget:v104 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v103, "setEnabled:", objc_msgSend(v106, "count") == 0);
    [v103 setDisabledReasons:v106];
    char v110 = v419;
  }

  v111 = [(MPRemoteCommandCenter *)self->_commandCenter advanceRepeatModeCommand];
  v112 = v104;
  v113 = [MEMORY[0x263EFF980] array];
  v114 = [MEMORY[0x263EFF980] array];
  if ((v110 & 1) == 0) {
    [v113 addObject:v420];
  }
  if (v424) {
    [v113 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableRepeat]) {
    [v113 addObject:@"disabled for playback engine"];
  }
  if (v417) {
    [v113 addObject:@"live streaming content"];
  }
  if ((v108 & 1) == 0) {
    [v113 addObject:v415];
  }
  v115 = [(MPRemoteCommandCenter *)self->_commandCenter advanceRepeatModeCommand];
  [v115 setCurrentRepeatType:v102];

  if ([v113 count])
  {
    char v116 = v419;
    if (![v113 count])
    {
      v386 = [MEMORY[0x263F08690] currentHandler];
      v387 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v386 handleFailureInFunction:v387 file:@"_MPCMediaRemotePublisher.m" lineNumber:1134 description:@"Must provide reason for unsupported command"];

      char v116 = v419;
    }
    [v111 setUnsupportedReasons:v113];
    if ([v111 hasTargets]) {
      [v111 removeTarget:v112 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v111 setUnsupportedReasons:0];
    char v116 = v419;
    if (([v111 hasTargets] & 1) == 0) {
      [v111 addTarget:v112 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v111, "setEnabled:", objc_msgSend(v114, "count") == 0);
    [v111 setDisabledReasons:v114];
  }

  v117 = [v422 music];
  v431 = @"<MISSING REASON>";
  char v118 = [v117 canUserChangeShuffleModeWithReason:&v431];
  v418 = v431;

  v119 = [v422 music];
  uint64_t v120 = [v119 shuffleType];

  v121 = [(MPRemoteCommandCenter *)self->_commandCenter changeShuffleModeCommand];
  v122 = v112;
  unint64_t v123 = 0x263EFF000uLL;
  v124 = [MEMORY[0x263EFF980] array];
  v125 = [MEMORY[0x263EFF980] array];
  if ((v116 & 1) == 0) {
    [v124 addObject:v420];
  }
  if (v424) {
    [v124 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableShuffle]) {
    [v124 addObject:@"disabled for playback engine"];
  }
  char v126 = v107 | v118;
  v127 = v418;
  if ((v126 & 1) == 0) {
    [v124 addObject:v418];
  }
  v128 = [(MPRemoteCommandCenter *)self->_commandCenter changeShuffleModeCommand];
  [v128 setCurrentShuffleType:v120];

  if ([v124 count])
  {
    char v129 = v419;
    if (![v124 count])
    {
      v388 = [MEMORY[0x263F08690] currentHandler];
      v389 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v388 handleFailureInFunction:v389 file:@"_MPCMediaRemotePublisher.m" lineNumber:1147 description:@"Must provide reason for unsupported command"];

      v127 = v418;
      char v129 = v419;
    }
    [v121 setUnsupportedReasons:v124];
    if ([v121 hasTargets]) {
      [v121 removeTarget:v122 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v121 setUnsupportedReasons:0];
    char v129 = v419;
    if (([v121 hasTargets] & 1) == 0) {
      [v121 addTarget:v122 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v121, "setEnabled:", objc_msgSend(v125, "count") == 0);
    [v121 setDisabledReasons:v125];
  }

  v130 = [(MPRemoteCommandCenter *)self->_commandCenter advanceShuffleModeCommand];
  v131 = v122;
  v132 = [MEMORY[0x263EFF980] array];
  v133 = [MEMORY[0x263EFF980] array];
  if ((v129 & 1) == 0) {
    [v132 addObject:v420];
  }
  if (v424) {
    [v132 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableShuffle]) {
    [v132 addObject:@"disabled for playback engine"];
  }
  if ((v126 & 1) == 0) {
    [v132 addObject:v127];
  }
  v134 = [(MPRemoteCommandCenter *)self->_commandCenter advanceShuffleModeCommand];
  [v134 setCurrentShuffleType:v120];

  if ([v132 count])
  {
    int v135 = v419;
    if (![v132 count])
    {
      v390 = [MEMORY[0x263F08690] currentHandler];
      v391 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v390 handleFailureInFunction:v391 file:@"_MPCMediaRemotePublisher.m" lineNumber:1156 description:@"Must provide reason for unsupported command"];

      int v135 = v419;
    }
    [v130 setUnsupportedReasons:v132];
    if ([v130 hasTargets]) {
      [v130 removeTarget:v131 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v130 setUnsupportedReasons:0];
    int v135 = v419;
    if (([v130 hasTargets] & 1) == 0) {
      [v130 addTarget:v131 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v130, "setEnabled:", objc_msgSend(v133, "count") == 0);
    [v130 setDisabledReasons:v133];
  }

  v136 = [(MPRemoteCommandCenter *)self->_commandCenter reshuffleCommand];
  v137 = v131;
  v138 = [MEMORY[0x263EFF980] array];
  v139 = [MEMORY[0x263EFF980] array];
  if ((v135 & 1) == 0) {
    [v138 addObject:v420];
  }
  if (v424) {
    [v138 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableShuffle]) {
    [v138 addObject:@"disabled for playback engine"];
  }
  if ((v126 & 1) == 0) {
    [v138 addObject:v127];
  }
  if ([v138 count])
  {
    v140 = v422;
    if (![v138 count])
    {
      v392 = [MEMORY[0x263F08690] currentHandler];
      v393 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v392 handleFailureInFunction:v393 file:@"_MPCMediaRemotePublisher.m" lineNumber:1164 description:@"Must provide reason for unsupported command"];

      v127 = v418;
      int v135 = v419;
    }
    [v136 setUnsupportedReasons:v138];
    if ([v136 hasTargets]) {
      [v136 removeTarget:v137 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v136 setUnsupportedReasons:0];
    v140 = v422;
    if (([v136 hasTargets] & 1) == 0) {
      [v136 addTarget:v137 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v136, "setEnabled:", objc_msgSend(v139, "count") == 0);
    [v136 setDisabledReasons:v139];
  }

  v141 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
  v142 = v137;
  v143 = [MEMORY[0x263EFF980] array];
  v144 = [MEMORY[0x263EFF980] array];
  if ((v135 & 1) == 0) {
    [v143 addObject:v420];
  }
  if (v424) {
    [v143 addObject:@"behavior has no items"];
  }
  if ([WeakRetained disableAutoPlay]) {
    [v143 addObject:@"disabled for playback engine"];
  }
  if (v135)
  {
    v145 = [v140 music];
    if ([v145 autoPlayEnabled]) {
      uint64_t v146 = 3;
    }
    else {
      uint64_t v146 = 2;
    }

    v147 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    [v147 addObject:&unk_26CC18E10];
    if ((v424 & 1) == 0)
    {
      v148 = [v422 music];
      id v430 = 0;
      int v149 = [v148 canUserEnableAutoPlayWithReason:&v430];
      id v150 = v430;

      if (v149) {
        [v147 addObject:&unk_26CC18E28];
      }

      unint64_t v123 = 0x263EFF000;
      LOBYTE(v135) = v419;
    }
    v151 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
    [v151 setCurrentQueueEndAction:v146];

    v152 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
    [v152 setSupportedQueueEndActions:v147];

    v140 = v422;
    v127 = v418;
  }
  else
  {
    v153 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
    [v153 setCurrentQueueEndAction:1];

    v147 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
    [v147 setSupportedQueueEndActions:MEMORY[0x263EFFA68]];
  }

  if ([v143 count])
  {
    if (![v143 count])
    {
      v394 = [MEMORY[0x263F08690] currentHandler];
      v395 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v394 handleFailureInFunction:v395 file:@"_MPCMediaRemotePublisher.m" lineNumber:1192 description:@"Must provide reason for unsupported command"];

      v140 = v422;
    }
    [v141 setUnsupportedReasons:v143];
    if ([v141 hasTargets]) {
      [v141 removeTarget:v142 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v141 setUnsupportedReasons:0];
    if (([v141 hasTargets] & 1) == 0) {
      [v141 addTarget:v142 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v141, "setEnabled:", objc_msgSend(v144, "count") == 0);
    [v141 setDisabledReasons:v144];
  }

  v154 = [(MPRemoteCommandCenter *)self->_commandCenter shareQueueCommand];
  v155 = v142;
  v156 = [*(id *)(v123 + 2432) array];
  v157 = [*(id *)(v123 + 2432) array];
  if ((v135 & 1) == 0) {
    [v156 addObject:v420];
  }
  v158 = [v140 musicSharePlay];

  if (v158) {
    [v156 addObject:@"already in shared listening mode"];
  }
  if (v424) {
    [v156 addObject:@"behavior has no items"];
  }
  v159 = v422;
  if (![v423 storeSubscriptionAdamID]) {
    [v156 addObject:@"item doesn't have subscription adam id"];
  }
  if ([v156 count])
  {
    if (![v156 count])
    {
      v396 = [MEMORY[0x263F08690] currentHandler];
      v397 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v396 handleFailureInFunction:v397 file:@"_MPCMediaRemotePublisher.m" lineNumber:1198 description:@"Must provide reason for unsupported command"];

      v159 = v422;
    }
    [v154 setUnsupportedReasons:v156];
    if ([v154 hasTargets]) {
      [v154 removeTarget:v155 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v154 setUnsupportedReasons:0];
    if (([v154 hasTargets] & 1) == 0) {
      [v154 addTarget:v155 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v154, "setEnabled:", objc_msgSend(v157, "count") == 0);
    [v154 setDisabledReasons:v157];
  }

  v160 = [(MPRemoteCommandCenter *)self->_commandCenter shareQueueCommand];
  [v160 setTimeout:30.0];

  v161 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
  id v162 = v155;
  v163 = [*(id *)(v123 + 2432) array];
  uint64_t v164 = [*(id *)(v123 + 2432) array];
  unint64_t v165 = v123;
  v166 = (void *)v164;
  v167 = [*(id *)(v165 + 2432) arrayWithCapacity:4];
  if (v423)
  {
    v168 = [v159 upNextBehavior];

    if (v168)
    {
      v169 = [v159 upNextBehavior];
      v170 = [v423 contentItemID];
      int v171 = [v169 isSupportedInsertionPosition:0 fromContentItemID:v170 reason:0];

      if (v171) {
        [v167 addObject:&unk_26CC18E40];
      }
      v172 = v422;
      v173 = [v422 upNextBehavior];
      v174 = [v423 contentItemID];
      int v175 = [v173 isSupportedInsertionPosition:1 fromContentItemID:v174 reason:0];

      if (v175
        && ([v167 addObject:&unk_26CC18E58],
            [v422 music],
            v176 = objc_claimAutoreleasedReturnValue(),
            v176,
            v176))
      {
        v177 = [v422 music];
        v178 = [v423 contentItemID];
        v179 = [v177 lastSectionContentItemIDForTargetContentItemID:v178];

        v180 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
        [v180 setLastSectionContentItemID:v179];

        v172 = v422;
      }
      else
      {
        v179 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
        [v179 setLastSectionContentItemID:0];
      }

      v181 = [v172 upNextBehavior];
      v182 = [v423 contentItemID];
      int v183 = [v181 isSupportedInsertionPosition:2 fromContentItemID:v182 reason:0];

      if (v183) {
        [v167 addObject:&unk_26CC18E10];
      }
      v184 = [v422 upNextBehavior];
      v185 = [v423 contentItemID];
      int v186 = [v184 isSupportedInsertionPosition:3 fromContentItemID:v185 reason:0];

      v159 = v422;
      if (v186) {
        [v167 addObject:&unk_26CC18E28];
      }
    }
  }
  v187 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
  [v187 setSupportedInsertionPositions:v167];

  v188 = [v159 upNextBehavior];

  if (!v188) {
    [v166 addObject:@"current behavior is not upNextBehavior"];
  }
  v189 = [v159 upNextBehavior];
  char v190 = [v189 allowsQueueModifications];

  if ((v190 & 1) == 0) {
    [v166 addObject:@"queue does not allow modifications"];
  }
  if (!v423) {
    [v166 addObject:@"no current item in queue"];
  }
  if (![v167 count]) {
    [v166 addObject:@"queue does not support any insertion positions"];
  }

  if ([v163 count])
  {
    if (![v163 count])
    {
      v398 = [MEMORY[0x263F08690] currentHandler];
      v399 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v398 handleFailureInFunction:v399 file:@"_MPCMediaRemotePublisher.m" lineNumber:1238 description:@"Must provide reason for unsupported command"];
    }
    [v161 setUnsupportedReasons:v163];
    if ([v161 hasTargets]) {
      [v161 removeTarget:v162 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v161 setUnsupportedReasons:0];
    if (([v161 hasTargets] & 1) == 0) {
      [v161 addTarget:v162 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v161, "setEnabled:", objc_msgSend(v166, "count") == 0);
    [v161 setDisabledReasons:v166];
  }

  v191 = [v162 _supportedSessionTypes];
  v192 = [v162 _exportableSessionTypes];
  v193 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackSessionCommand];
  id v194 = v162;
  v195 = [MEMORY[0x263EFF980] array];
  v196 = [MEMORY[0x263EFF980] array];
  v197 = [MEMORY[0x263F12178] standardUserDefaults];
  int v198 = [v197 disableQHO];

  if (v198) {
    [v195 addObject:@"QHO disabled by defaults"];
  }
  if (([WeakRetained isQueueHandoffSupported] & 1) == 0) {
    [v195 addObject:@"engine not configured for QHO"];
  }
  if (![v191 count]) {
    [v195 addObject:@"no supported session types"];
  }
  v199 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackSessionCommand];
  [v199 setSupportedSessionTypes:v191];

  v200 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackSessionCommand];
  [v200 setExportableSessionTypes:v192];

  if ([v195 count])
  {
    if (![v195 count])
    {
      v400 = [MEMORY[0x263F08690] currentHandler];
      v401 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v400 handleFailureInFunction:v401 file:@"_MPCMediaRemotePublisher.m" lineNumber:1249 description:@"Must provide reason for unsupported command"];
    }
    [v193 setUnsupportedReasons:v195];
    if ([v193 hasTargets]) {
      [v193 removeTarget:v194 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v193 setUnsupportedReasons:0];
    if (([v193 hasTargets] & 1) == 0) {
      [v193 addTarget:v194 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v193, "setEnabled:", objc_msgSend(v196, "count") == 0);
    [v193 setDisabledReasons:v196];
  }

  if (v416 == 4)
  {
    v201 = +[MPCPodcastsDefaultsHelper standard];
    v202 = [_MPCPodcastsPlaybackRateHelper alloc];
    v203 = [WeakRetained player];
    [v203 currentRate];
    int v205 = v204;
    v206 = [WeakRetained player];
    uint64_t v207 = [v206 state];
    LODWORD(v208) = v205;
    v425 = [(_MPCPodcastsPlaybackRateHelper *)v202 initWithCurrentRate:v207 playbackState:v208];

    v209 = [(MPRemoteCommandCenter *)self->_commandCenter changePlaybackRateCommand];
    v210 = +[_MPCPodcastsPlaybackRateHelper supportedPlaybackRates];
    [v209 setSupportedPlaybackRates:v210];

    [(_MPCPodcastsPlaybackRateHelper *)v425 preferredPlaybackRateForDisplay];
    objc_msgSend(v209, "setPreferredRate:");
    v211 = NSNumber;
    [v201 skipForwardInterval];
    v212 = objc_msgSend(v211, "numberWithDouble:");
    v442 = v212;
    v213 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v442 count:1];
    v214 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
    [v214 setPreferredIntervals:v213];

    v215 = NSNumber;
    [v201 skipBackwardInterval];
    v216 = objc_msgSend(v215, "numberWithDouble:");
    v441 = v216;
    v217 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v441 count:1];
    v218 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
    [v218 setPreferredIntervals:v217];

    v219 = [WeakRetained sleepTimerController];
    [v219 time];
    double v221 = v220;
    v222 = [(MPRemoteCommandCenter *)self->_commandCenter setSleepTimerCommand];
    [v222 setTime:v221];

    v223 = [WeakRetained sleepTimerController];
    uint64_t v224 = [v223 stopMode];
    v225 = [(MPRemoteCommandCenter *)self->_commandCenter setSleepTimerCommand];
    [v225 setStopMode:v224];

    v226 = v201;
    v227 = [WeakRetained sleepTimerController];
    [v227 fireDate];
    double v229 = v228;
    v230 = [(MPRemoteCommandCenter *)self->_commandCenter setSleepTimerCommand];
    [v230 setFireDate:v229];

    v232 = v423;
    v231 = v425;
    unint64_t v233 = 0x263EFF000uLL;
  }
  else
  {
    v232 = v423;
    unint64_t v233 = 0x263EFF000;
    if (v423 || ![WeakRetained isSystemPodcastsApplication]) {
      goto LABEL_350;
    }
    v226 = +[MPCPodcastsDefaultsHelper standard];
    v234 = NSNumber;
    [v226 skipForwardInterval];
    v235 = objc_msgSend(v234, "numberWithDouble:");
    v440 = v235;
    v236 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v440 count:1];
    v237 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
    [v237 setPreferredIntervals:v236];

    v238 = NSNumber;
    [v226 skipBackwardInterval];
    v231 = objc_msgSend(v238, "numberWithDouble:");
    v439 = v231;
    v209 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v439 count:1];
    v227 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
    [v227 setPreferredIntervals:v209];
  }

LABEL_350:
  if ([v232 stationAllowsItemLiking]) {
    uint64_t v239 = 1;
  }
  else {
    uint64_t v239 = 2;
  }
  v240 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
  [v240 setPresentationStyle:v239];

  uint64_t v241 = [v232 isLikedStateEnabled];
  v242 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
  [v242 setEnabled:v241];

  BOOL v243 = [v232 likedState] == 2;
  v244 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
  [v244 setActive:v243];

  v245 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
  [v245 setPresentationStyle:v239];

  uint64_t v246 = [v232 isLikedStateEnabled];
  v247 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
  [v247 setEnabled:v246];

  BOOL v248 = [v232 likedState] == 3;
  v249 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
  [v249 setActive:v248];

  v250 = [v232 modelGenericObject];
  v251 = [v250 flattenedGenericObject];
  uint64_t v252 = [v251 anyObject];

  v253 = [(MPRemoteCommandCenter *)self->_commandCenter addNowPlayingItemToLibraryCommand];
  os_unfair_lock_lock((os_unfair_lock_t)v194 + 4);
  v254 = (void *)*((void *)v194 + 1);
  v428[0] = MEMORY[0x263EF8330];
  v428[1] = 3221225472;
  v428[2] = __53___MPCMediaRemotePublisher___updateSupportedCommands__block_invoke;
  v428[3] = &unk_2643BF748;
  id v421 = v253;
  id v429 = v421;
  [v254 setStatusBlock:v428];
  [*((id *)v194 + 1) configureWithModelObject:v252];
  os_unfair_lock_unlock((os_unfair_lock_t)v194 + 4);
  v255 = [(MPRemoteCommandCenter *)self->_commandCenter ratingCommand];
  id v256 = v194;
  v257 = [*(id *)(v233 + 2432) array];
  v258 = [*(id *)(v233 + 2432) array];
  if (([v232 supportsRating] & 1) == 0) {
    [v257 addObject:@"item does not support ratings"];
  }
  v259 = v422;
  if ([v257 count])
  {
    if (![v257 count])
    {
      v402 = [MEMORY[0x263F08690] currentHandler];
      v403 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v402 handleFailureInFunction:v403 file:@"_MPCMediaRemotePublisher.m" lineNumber:1313 description:@"Must provide reason for unsupported command"];

      v259 = v422;
    }
    [v255 setUnsupportedReasons:v257];
    if ([v255 hasTargets]) {
      [v255 removeTarget:v256 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v255 setUnsupportedReasons:0];
    if (([v255 hasTargets] & 1) == 0) {
      [v255 addTarget:v256 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v255, "setEnabled:", objc_msgSend(v258, "count") == 0);
    [v255 setDisabledReasons:v258];
  }

  v260 = [(MPRemoteCommandCenter *)self->_commandCenter leaveSharedPlaybackSessionCommand];
  id v261 = v256;
  v262 = [*(id *)(v233 + 2432) array];
  v263 = [*(id *)(v233 + 2432) array];
  v264 = [v259 musicSharePlay];

  if (!v264) {
    [v262 addObject:@"not in shared listening mode"];
  }
  v265 = [(MPRemoteCommandCenter *)self->_commandCenter leaveSharedPlaybackSessionCommand];
  [v265 setSkipSerializedEventDelivery:1];

  v426 = (void *)v252;
  if ([v262 count])
  {
    if (![v262 count])
    {
      v404 = [MEMORY[0x263F08690] currentHandler];
      v405 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v404 handleFailureInFunction:v405 file:@"_MPCMediaRemotePublisher.m" lineNumber:1318 description:@"Must provide reason for unsupported command"];
    }
    [v260 setUnsupportedReasons:v262];
    if ([v260 hasTargets]) {
      [v260 removeTarget:v261 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v260 setUnsupportedReasons:0];
    if (([v260 hasTargets] & 1) == 0) {
      [v260 addTarget:v261 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v260, "setEnabled:", objc_msgSend(v263, "count") == 0);
    [v260 setDisabledReasons:v263];
  }

  char v266 = [v261 vocalAttenuationUnavailabilityReasons];
  v267 = [(MPRemoteCommandCenter *)self->_commandCenter prepareVocalsControlCommand];
  id v268 = v261;
  v269 = [*(id *)(v233 + 2432) array];
  v270 = [*(id *)(v233 + 2432) array];
  if (v266) {
    [v269 addObject:@"vocal attenuation is not supported on this device"];
  }
  if ((v266 & 2) != 0) {
    [v269 addObject:@"Active account cannot play catalog content"];
  }
  if ((v266 & 0x10) != 0)
  {
    uint64_t v271 = [WeakRetained vocalAttenuationController];
    v272 = (void *)v271;
    if (v271) {
      v273 = *(void **)(v271 + 80);
    }
    else {
      v273 = 0;
    }
    id v274 = v273;
    v275 = [v274 explanation];
    [v269 addObject:v275];
  }
  v276 = [WeakRetained vocalAttenuationController];
  if (!v276 || (uint64_t v277 = v276[9], v276, v277 != 2))
  {
    v278 = [WeakRetained vocalAttenuationController];
    if (-[MPCWhiskyController isVocalAttenuationAvailable](v278)) {
      v279 = @"engine is ready for vocal attenuation";
    }
    else {
      v279 = @"engine cannot prepare for vocal attenuation";
    }
    [v270 addObject:v279];
  }
  if ([v269 count])
  {
    if (![v269 count])
    {
      v406 = [MEMORY[0x263F08690] currentHandler];
      v407 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v406 handleFailureInFunction:v407 file:@"_MPCMediaRemotePublisher.m" lineNumber:1343 description:@"Must provide reason for unsupported command"];
    }
    [v267 setUnsupportedReasons:v269];
    if ([v267 hasTargets]) {
      [v267 removeTarget:v268 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v267 setUnsupportedReasons:0];
    if (([v267 hasTargets] & 1) == 0) {
      [v267 addTarget:v268 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v267, "setEnabled:", objc_msgSend(v270, "count") == 0);
    [v267 setDisabledReasons:v270];
  }

  v280 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  id v281 = v268;
  uint64_t v282 = [*(id *)(v233 + 2432) array];
  unint64_t v283 = v233;
  v284 = (void *)v282;
  v285 = [*(id *)(v283 + 2432) array];
  if (v266)
  {
    [v284 addObject:@"vocal attenuation is not supported on this device"];
    if ((v266 & 2) == 0)
    {
LABEL_397:
      if ((v266 & 8) == 0) {
        goto LABEL_399;
      }
      goto LABEL_398;
    }
  }
  else if ((v266 & 2) == 0)
  {
    goto LABEL_397;
  }
  [v284 addObject:@"Active account cannot play catalog content"];
  if ((v266 & 8) != 0) {
LABEL_398:
  }
    [v284 addObject:@"vocal attenuation is disabled in shared listening mode"];
LABEL_399:
  uint64_t v286 = [WeakRetained vocalAttenuationController];
  v287 = (void *)v286;
  if (v286) {
    v288 = *(void **)(v286 + 80);
  }
  else {
    v288 = 0;
  }
  id v289 = v288;

  if (!v289)
  {
    v290 = [WeakRetained vocalAttenuationController];
    uint64_t v291 = -[MPCWhiskyController isVocalAttenuationAvailable](v290);

    if ((v291 & 1) == 0) {
      [v284 addObject:@"engine is not ready for vocal attenuation"];
    }
  }
  if ((v266 & 0x20) != 0) {
    [v285 addObject:@"current item does not support vocal attenuation"];
  }
  v292 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  [v292 setDisabledReason:0];

  if ([v423 supportsVocalAttenuation])
  {
    if ((v266 & 0x10) != 0)
    {
      uint64_t v293 = [WeakRetained vocalAttenuationController];
      v294 = (void *)v293;
      if (v293) {
        v295 = *(void **)(v293 + 80);
      }
      else {
        v295 = 0;
      }
      id v296 = v295;
      v297 = [v296 explanation];
      [v285 addObject:v297];
    }
    uint64_t v298 = [WeakRetained vocalAttenuationController];
    v299 = (void *)v298;
    if (v298) {
      v300 = *(void **)(v298 + 80);
    }
    else {
      v300 = 0;
    }
    id v301 = v300;

    if (v301)
    {
      uint64_t v302 = [WeakRetained vocalAttenuationController];
      v303 = (void *)v302;
      if (v302) {
        v304 = *(void **)(v302 + 80);
      }
      else {
        v304 = 0;
      }
      id v305 = v304;
      uint64_t v306 = [v305 reason];

      switch(v306)
      {
        case 0:
          v307 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
          v308 = v307;
          uint64_t v309 = 0;
          goto LABEL_424;
        case 1:
          v307 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
          v308 = v307;
          uint64_t v309 = 4;
          goto LABEL_424;
        case 2:
          v307 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
          v308 = v307;
          uint64_t v309 = 5;
          goto LABEL_424;
        case 3:
          v307 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
          v308 = v307;
          uint64_t v309 = 6;
LABEL_424:
          [v307 setDisabledReason:v309];

          break;
        default:
          break;
      }
    }
  }
  [WeakRetained vocalLevel];
  int v311 = v310;
  v312 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  LODWORD(v313) = v311;
  [v312 setVocalsLevel:v313];

  uint64_t v314 = [WeakRetained vocalAttenuationController];
  v315 = (void *)v314;
  int v316 = 0;
  int v317 = 0;
  if (v314) {
    int v317 = *(_DWORD *)(v314 + 56);
  }
  v318 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  LODWORD(v319) = v317;
  [v318 setMinVocalsLevel:v319];

  uint64_t v320 = [WeakRetained vocalAttenuationController];
  v321 = (void *)v320;
  if (v320) {
    int v316 = *(_DWORD *)(v320 + 60);
  }
  v322 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  LODWORD(v323) = v316;
  [v322 setMaxVocalsLevel:v323];

  uint64_t v324 = [WeakRetained isVocalAttenuationEnabled];
  v325 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  [v325 setVocalsControlActive:v324];

  v326 = [WeakRetained pickedRoute];
  uint64_t v327 = [v326 isAirPlayRoute] ^ 1;
  v328 = [(MPRemoteCommandCenter *)self->_commandCenter vocalsControlCommand];
  [v328 setContinuous:v327];

  if ([v284 count])
  {
    v329 = v422;
    if (![v284 count])
    {
      v408 = [MEMORY[0x263F08690] currentHandler];
      v409 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v408 handleFailureInFunction:v409 file:@"_MPCMediaRemotePublisher.m" lineNumber:1391 description:@"Must provide reason for unsupported command"];

      v329 = v422;
    }
    [v280 setUnsupportedReasons:v284];
    if ([v280 hasTargets]) {
      [v280 removeTarget:v281 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v280 setUnsupportedReasons:0];
    v329 = v422;
    if (([v280 hasTargets] & 1) == 0) {
      [v280 addTarget:v281 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v280, "setEnabled:", objc_msgSend(v285, "count") == 0);
    [v280 setDisabledReasons:v285];
  }

  v330 = [v329 upNextBehavior];
  v331 = [v423 contentItemID];
  v332 = [v330 tailInsertionContentItemIDForTargetContentItemID:v331];

  v333 = [(MPRemoteCommandCenter *)self->_commandCenter clearUpNextCommand];
  v334 = (id *)v281;
  v335 = [MEMORY[0x263EFF980] array];
  v336 = [MEMORY[0x263EFF980] array];
  v337 = [v329 upNextBehavior];

  if (v337)
  {
    if (v332) {
      goto LABEL_439;
    }
  }
  else
  {
    [v336 addObject:@"current behavior is not upNextBehavior"];
    if (v332) {
      goto LABEL_439;
    }
  }
  [v335 addObject:@"no active up next queue"];
LABEL_439:
  if ([v335 count])
  {
    if (![v335 count])
    {
      v410 = [MEMORY[0x263F08690] currentHandler];
      v411 = [NSString stringWithUTF8String:"-[_MPCMediaRemotePublisher __updateSupportedCommands]"];
      [v410 handleFailureInFunction:v411 file:@"_MPCMediaRemotePublisher.m" lineNumber:1398 description:@"Must provide reason for unsupported command"];
    }
    [v333 setUnsupportedReasons:v335];
    if ([v333 hasTargets]) {
      [v333 removeTarget:v334 action:sel__performCommandEvent_completion_];
    }
  }
  else
  {
    [v333 setUnsupportedReasons:0];
    if (([v333 hasTargets] & 1) == 0) {
      [v333 addTarget:v334 action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
    }
    objc_msgSend(v333, "setEnabled:", objc_msgSend(v336, "count") == 0);
    [v333 setDisabledReasons:v336];
  }

  if (MSVDeviceOSIsInternalInstall())
  {
    v338 = [(MPRemoteCommandCenter *)self->_commandCenter debugCommand];
    char v339 = [v338 hasTargets];

    if ((v339 & 1) == 0)
    {
      v340 = [(MPRemoteCommandCenter *)self->_commandCenter debugCommand];
      [v340 addTarget:v334 action:sel__performDebugEvent_completion_ usingExtendedStatus:1];
    }
    v341 = [(MPRemoteCommandCenter *)self->_commandCenter debugCommand];
    [v341 setSupportedSubsystems:&unk_26CC19520];

    v437[0] = @"com.apple.Music.performance";
    v342 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v334[17]);
    v437[1] = @"com.apple.Music.queue";
    v438[0] = v342;
    v343 = NSString;
    v344 = [v422 revisionString];
    v345 = [v423 contentItemID];
    v346 = [v343 stringWithFormat:@"%@&currentItem=%@", v344, v345];
    v438[1] = v346;
    v347 = [NSDictionary dictionaryWithObjects:v438 forKeys:v437 count:2];
    v348 = [(MPRemoteCommandCenter *)self->_commandCenter debugCommand];
    [v348 setSubsystemRevisions:v347];
  }
  v349 = [(MPRemoteCommandCenter *)self->_commandCenter _debugCommandDescriptions];
  v350 = objc_msgSend(v349, "msv_compactMap:", &__block_literal_global_325);

  id v351 = v334[9];
  id v352 = v350;
  id v353 = v351;
  v354 = v352;
  v355 = v352;
  if (v352 == v353) {
    goto LABEL_456;
  }
  v356 = v353;
  char v357 = [v352 isEqual:v353];

  if ((v357 & 1) == 0)
  {
    objc_storeStrong(v334 + 9, v350);
    v355 = [v334 playbackEngine];
    v354 = [v355 eventStream];
    v435 = @"remote-control-commands";
    id v436 = v352;
    v358 = [NSDictionary dictionaryWithObjects:&v436 forKeys:&v435 count:1];
    [v354 emitEventType:@"remote-control-commands-changed" payload:v358];

LABEL_456:
  }
  v359 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v360 = v359;
  if (v414 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v359))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v360, OS_SIGNPOST_INTERVAL_END, spid, "UpdateSupportedCommands", "", buf, 2u);
  }
}

- (BOOL)hasInitializedSupportedCommands
{
  return self->_initializedSupportedCommands;
}

- (void)engineWillBeginStateRestoration:(id)a3
{
  self->_engineRestoringState = 1;
}

- (void)publishIfNeeded
{
  if (![(_MPCMediaRemotePublisher *)self isEngineRestoringState])
  {
    v3 = [(_MPCMediaRemotePublisher *)self playbackEngine];
    if ([v3 isStarted])
    {
      os_signpost_id_t v4 = +[MPCPlaybackAccountManager sharedManager];
      int v5 = [v4 hasLoadedInitialAccounts];

      if (v5)
      {
        if (![(_MPCMediaRemotePublisher *)self hasInitializedSupportedCommands])
        {
          int v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v106 = 0;
            _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[Publisher] publishIfNeeded: first publish", v106, 2u);
          }

          id v7 = [(MPRemoteCommandCenter *)self->_commandCenter playCommand];
          [v7 setUnsupportedReasons:0];

          id v8 = [(MPRemoteCommandCenter *)self->_commandCenter playCommand];
          char v9 = [v8 hasTargets];

          if ((v9 & 1) == 0)
          {
            uint64_t v10 = [(MPRemoteCommandCenter *)self->_commandCenter playCommand];
            [v10 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          double v11 = [(MPRemoteCommandCenter *)self->_commandCenter pauseCommand];
          [v11 setUnsupportedReasons:0];

          uint64_t v12 = [(MPRemoteCommandCenter *)self->_commandCenter pauseCommand];
          char v13 = [v12 hasTargets];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [(MPRemoteCommandCenter *)self->_commandCenter pauseCommand];
            [v14 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          int v15 = [(MPRemoteCommandCenter *)self->_commandCenter stopCommand];
          [v15 setUnsupportedReasons:0];

          id v16 = [(MPRemoteCommandCenter *)self->_commandCenter stopCommand];
          char v17 = [v16 hasTargets];

          if ((v17 & 1) == 0)
          {
            uint64_t v18 = [(MPRemoteCommandCenter *)self->_commandCenter stopCommand];
            [v18 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          id v19 = [(MPRemoteCommandCenter *)self->_commandCenter togglePlayPauseCommand];
          [v19 setUnsupportedReasons:0];

          long long v20 = [(MPRemoteCommandCenter *)self->_commandCenter togglePlayPauseCommand];
          char v21 = [v20 hasTargets];

          if ((v21 & 1) == 0)
          {
            v22 = [(MPRemoteCommandCenter *)self->_commandCenter togglePlayPauseCommand];
            [v22 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          uint64_t v23 = [(MPRemoteCommandCenter *)self->_commandCenter nextTrackCommand];
          [v23 setUnsupportedReasons:0];

          long long v24 = [(MPRemoteCommandCenter *)self->_commandCenter nextTrackCommand];
          char v25 = [v24 hasTargets];

          if ((v25 & 1) == 0)
          {
            unint64_t v26 = [(MPRemoteCommandCenter *)self->_commandCenter nextTrackCommand];
            [v26 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          int v27 = [(MPRemoteCommandCenter *)self->_commandCenter previousTrackCommand];
          [v27 setUnsupportedReasons:0];

          uint64_t v28 = [(MPRemoteCommandCenter *)self->_commandCenter previousTrackCommand];
          char v29 = [v28 hasTargets];

          if ((v29 & 1) == 0)
          {
            v30 = [(MPRemoteCommandCenter *)self->_commandCenter previousTrackCommand];
            [v30 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v31 = [(MPRemoteCommandCenter *)self->_commandCenter playItemInQueueCommand];
          [v31 setUnsupportedReasons:0];

          v32 = [(MPRemoteCommandCenter *)self->_commandCenter playItemInQueueCommand];
          char v33 = [v32 hasTargets];

          if ((v33 & 1) == 0)
          {
            v34 = [(MPRemoteCommandCenter *)self->_commandCenter playItemInQueueCommand];
            [v34 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          if (_os_feature_enabled_impl())
          {
            v35 = [(MPRemoteCommandCenter *)self->_commandCenter performDialogActionCommand];
            [v35 setUnsupportedReasons:0];

            v36 = [(MPRemoteCommandCenter *)self->_commandCenter performDialogActionCommand];
            char v37 = [v36 hasTargets];

            if ((v37 & 1) == 0)
            {
              v38 = [(MPRemoteCommandCenter *)self->_commandCenter performDialogActionCommand];
              [v38 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
            }
          }
          v39 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v39 setUnsupportedReasons:0];

          v40 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          char v41 = [v40 hasTargets];

          if ((v41 & 1) == 0)
          {
            v42 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
            [v42 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v43 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v43 registerSupportedQueueType:8];

          v44 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v44 registerSupportedQueueType:7];

          v45 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v45 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.radio"];

          char v46 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v46 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.tracklist"];

          if (_os_feature_enabled_impl())
          {
            v47 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
            [v47 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.sharedlistening"];
          }
          v48 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v48 registerSupportedCustomQueueIdentifier:@"com.apple.mediaplayer.playbackcontext"];

          v49 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v49 registerSupportedCustomQueueIdentifier:@"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"];

          v50 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackQueueCommand];
          [v50 setTimeout:30.0];

          v51 = [(MPRemoteCommandCenter *)self->_commandCenter setPlaybackSessionCommand];
          [v51 setTimeout:30.0];

          v52 = [(MPRemoteCommandCenter *)self->_commandCenter prepareForSetPlaybackQueueCommand];
          [v52 setUnsupportedReasons:0];

          v53 = [(MPRemoteCommandCenter *)self->_commandCenter prepareForSetPlaybackQueueCommand];
          char v54 = [v53 hasTargets];

          if ((v54 & 1) == 0)
          {
            v55 = [(MPRemoteCommandCenter *)self->_commandCenter prepareForSetPlaybackQueueCommand];
            [v55 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v56 = [(MPRemoteCommandCenter *)self->_commandCenter prepareForSetPlaybackQueueCommand];
          [v56 setSkipSerializedEventDelivery:1];

          v57 = [(MPRemoteCommandCenter *)self->_commandCenter prepareForSetPlaybackQueueCommand];
          [v57 setTimeout:30.0];

          v58 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          [v58 setUnsupportedReasons:0];

          v59 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          char v60 = [v59 hasTargets];

          if ((v60 & 1) == 0)
          {
            v61 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
            [v61 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          char v62 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          [v62 registerSupportedQueueType:7];

          v63 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          [v63 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.radio"];

          v64 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          [v64 registerSupportedCustomQueueIdentifier:@"com.apple.music.playbackqueue.tracklist"];

          v65 = [(MPRemoteCommandCenter *)self->_commandCenter insertIntoPlaybackQueueCommand];
          [v65 registerSupportedCustomQueueIdentifier:@"com.apple.mediaplayer.playbackcontext"];

          v66 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
          [v66 setPreferredIntervals:&unk_26CC194F0];

          v67 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
          [v67 setPreferredIntervals:&unk_26CC19508];

          v68 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
          [v68 setUnsupportedReasons:0];

          v69 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
          char v70 = [v69 hasTargets];

          if ((v70 & 1) == 0)
          {
            char v71 = [(MPRemoteCommandCenter *)self->_commandCenter skipForwardCommand];
            [v71 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v72 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
          [v72 setUnsupportedReasons:0];

          v73 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
          char v74 = [v73 hasTargets];

          if ((v74 & 1) == 0)
          {
            v75 = [(MPRemoteCommandCenter *)self->_commandCenter skipBackwardCommand];
            [v75 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v76 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
          [v76 setUnsupportedReasons:0];

          v77 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
          char v78 = [v77 hasTargets];

          if ((v78 & 1) == 0)
          {
            v79 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
            [v79 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v80 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
          [v80 setUnsupportedReasons:0];

          uint64_t v81 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
          char v82 = [v81 hasTargets];

          if ((v82 & 1) == 0)
          {
            v83 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
            [v83 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          v84 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
          v85 = [v84 localizedStringForKey:@"REMOTE_CONTROL_LIKE_TRACK_RADIO" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          v86 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
          [v86 setLocalizedTitle:v85];

          char v87 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
          uint64_t v88 = [v87 localizedStringForKey:@"REMOTE_CONTROL_LIKE_TRACK_SHORT" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          v89 = [(MPRemoteCommandCenter *)self->_commandCenter likeCommand];
          [v89 setLocalizedShortTitle:v88];

          v90 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
          [v90 setUnsupportedReasons:0];

          v91 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
          LOBYTE(v88) = [v91 hasTargets];

          if ((v88 & 1) == 0)
          {
            v92 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
            [v92 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          char v93 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
          unint64_t v94 = [v93 localizedStringForKey:@"REMOTE_CONTROL_DISLIKE_TRACK_RADIO" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          v95 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
          [v95 setLocalizedTitle:v94];

          int v96 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
          uint64_t v97 = [v96 localizedStringForKey:@"REMOTE_CONTROL_DISLIKE_TRACK_SHORT" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
          v98 = [(MPRemoteCommandCenter *)self->_commandCenter dislikeCommand];
          [v98 setLocalizedShortTitle:v97];

          v99 = [(MPRemoteCommandCenter *)self->_commandCenter addNowPlayingItemToLibraryCommand];
          [v99 setUnsupportedReasons:0];

          char v100 = [(MPRemoteCommandCenter *)self->_commandCenter addNowPlayingItemToLibraryCommand];
          LOBYTE(v97) = [v100 hasTargets];

          if ((v97 & 1) == 0)
          {
            v101 = [(MPRemoteCommandCenter *)self->_commandCenter addNowPlayingItemToLibraryCommand];
            [v101 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          uint64_t v102 = [(MPRemoteCommandCenter *)self->_commandCenter addItemToLibraryCommand];
          [v102 setUnsupportedReasons:0];

          v103 = [(MPRemoteCommandCenter *)self->_commandCenter addItemToLibraryCommand];
          char v104 = [v103 hasTargets];

          if ((v104 & 1) == 0)
          {
            v105 = [(MPRemoteCommandCenter *)self->_commandCenter addItemToLibraryCommand];
            [v105 addTarget:self action:sel__performCommandEvent_completion_ usingExtendedStatus:1];
          }
          [(_MPCMediaRemotePublisher *)self setInitializedSupportedCommands:1];
          [(_MPCMediaRemotePublisher *)self __updateSupportedCommands];
        }
        [(_MPCMediaRemotePublisher *)self _updateSupportedCommands];
      }
    }
  }
}

- (void)_updateSupportedCommands
{
  if (!self->_commandUpdateScheduled)
  {
    self->_commandUpdateScheduled = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52___MPCMediaRemotePublisher__updateSupportedCommands__block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)isEngineRestoringState
{
  return self->_engineRestoringState;
}

- (void)setInitializedSupportedCommands:(BOOL)a3
{
  self->_initializedSupportedCommands = a3;
}

- (id)_exportableSessionTypes
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  if ([v2 isVocalAttenuationEnabled])
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [Suntory mode is active]", buf, 2u);
    }
    id v4 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    int v5 = [v2 queueController];
    v3 = v5;
    if (v5)
    {
      int v6 = [v5 currentItem];
      id v7 = v6;
      if (v6)
      {
        long long v20 = v6;
        char v21 = v2;
        id v8 = [v6 contentItemID];
        char v9 = +[MPCQueueController allKnownSessionTypes];
        id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(NSObject **)(*((void *)&v23 + 1) + 8 * i);
              id v22 = 0;
              int v16 = [v3 isExportableSessionType:v15 forContentItemID:v8 reason:&v22];
              id v17 = v22;
              if (v16)
              {
                [v4 addObject:v15];
              }
              else
              {
                uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v28 = v15;
                  __int16 v29 = 2114;
                  id v30 = v17;
                  _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes excluding session type [not exportable] sessionType=%{public}@ reason=%{public}@", buf, 0x16u);
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }

        id v7 = v20;
        v2 = v21;
      }
      else
      {
        id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v28 = v3;
          _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [queueController: %p currentItem is nil]", buf, 0xCu);
        }
        id v4 = (id)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[Publisher] _exportableSessionTypes empty [queueController is nil]", buf, 2u);
      }
      id v4 = (id)MEMORY[0x263EFFA68];
    }
  }

  return v4;
}

- (void)engine:(id)a3 didChangeQueueController:(id)a4
{
  [(MPNowPlayingInfoCenter *)self->_infoCenter invalidatePlaybackQueue];

  [(_MPCMediaRemotePublisher *)self publishIfNeeded];
}

- (void)engine:(id)a3 didChangeToItem:(id)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(MPNowPlayingInfoCenter *)self->_infoCenter invalidatePlaybackQueue];

  [(_MPCMediaRemotePublisher *)self publishIfNeeded];
}

- (_MPCMediaRemotePublisher)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_MPCMediaRemotePublisher;
  int v5 = [(_MPCMediaRemotePublisher *)&v32 init];
  int v6 = v5;
  if (v5)
  {
    v5->_libraryAddStatusObserverLock._os_unfair_lock_opaque = 0;
    id v7 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51___MPCMediaRemotePublisher_initWithPlaybackEngine___block_invoke;
    block[3] = &unk_2643C5FC8;
    id v8 = v6;
    v31 = v8;
    dispatch_async(v7, block);

    objc_storeWeak((id *)&v8->_playbackEngine, v4);
    [v4 addEngineObserver:v8];
    char v9 = +[MPCPlaybackAccountManager sharedManager];
    [v9 registerObserver:v8];

    id v10 = [v4 initializationParameters];
    uint64_t v11 = [v10 remoteCommandCenter];
    commandCenter = v8->_commandCenter;
    v8->_commandCenter = (MPRemoteCommandCenter *)v11;

    [(MPRemoteCommandCenter *)v8->_commandCenter setWantsSerializedEventDelivery:1];
    [(MPRemoteCommandCenter *)v8->_commandCenter setDelegate:v8];
    uint64_t v13 = [v4 initializationParameters];
    uint64_t v14 = [v13 nowPlayingInfoCenter];
    infoCenter = v8->_infoCenter;
    v8->_infoCenter = (MPNowPlayingInfoCenter *)v14;

    [(MPNowPlayingInfoCenter *)v8->_infoCenter setPlaybackQueueDataSource:v8];
    [(MPNowPlayingInfoCenter *)v8->_infoCenter setPlaybackEngine:v4];
    v8->_mediaServerAvailable = 1;
    int v16 = [[_MPCMediaRemotePublisher_Swift alloc] initWithPublisher:v8];
    swift = v8->_swift;
    v8->_swift = v16;

    uint64_t v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v8 selector:sel__activeSharedSessionDidChange_ name:*MEMORY[0x263F54830] object:0];
    [v18 addObserver:v8 selector:sel__durationAvailableNotification_ name:*MEMORY[0x263F110F8] object:0];
    [v18 addObserver:v8 selector:sel__likedStateChangedNotification_ name:*MEMORY[0x263F11108] object:0];
    [v18 addObserver:v8 selector:sel__commandEventDidTimeoutNotification_ name:*MEMORY[0x263F11C68] object:0];
    id v19 = [MEMORY[0x263F54890] sharedLocalEndpoint];
    long long v20 = [v19 groupSessionInfo];
    uint64_t v21 = [v20 identifier];
    hostingSharedSessionID = v8->_hostingSharedSessionID;
    v8->_hostingSharedSessionID = (NSString *)v21;

    if (+[MPCPlaybackEngine isSystemPodcasts])
    {
      long long v23 = +[MPCPodcastsDefaultsHelper standard];
      long long v24 = [MEMORY[0x263F089F8] podcastsSkipForwardIntervalDefaultDidChange];
      [v18 addObserver:v8 selector:sel__podcastsSkipIntervalDidChange_ name:v24 object:v23];

      long long v25 = [MEMORY[0x263F089F8] podcastsSkipBackwardIntervalDefaultDidChange];
      [v18 addObserver:v8 selector:sel__podcastsSkipIntervalDidChange_ name:v25 object:v23];
    }
    long long v26 = [MEMORY[0x263F12178] standardUserDefaults];
    uint64_t v27 = [v26 artworkCacheLimit];
    [MEMORY[0x263F11D30] setCacheLimit:v27 forCacheIdentifier:@"images" cacheReference:v8];
    uint64_t v28 = [v26 exportableArtworkCacheLimit];
    [MEMORY[0x263F11D30] setCacheLimit:v28 forCacheIdentifier:@"exportables" cacheReference:v8];
    +[MPCQueueController registerPublisher:v8];
    [(_MPCMediaRemotePublisher *)v8 _updateLaunchCommands];
  }
  return v6;
}

- (MPNowPlayingInfoCenter)infoCenter
{
  return self->_infoCenter;
}

- (NSString)hostingSharedSessionID
{
  return self->_hostingSharedSessionID;
}

- (MPRemoteCommandCenter)commandCenter
{
  return self->_commandCenter;
}

- (void)updatePlaybackMetrics:(id)a3
{
  id v13 = a3;
  if (MSVDeviceOSIsInternalInstall())
  {
    int v5 = [v13 objectForKeyedSubscript:@"metrics"];
    int v6 = [v5 firstObject];

    id v7 = [v6 objectForKeyedSubscript:@"segments"];
    objc_msgSend(v7, "msv_reduceIntoDouble:by:", &__block_literal_global_105, 0.0);
    double v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    uint64_t v11 = [WeakRetained queueController];
    uint64_t v12 = [v11 currentItem];

    [v12 setLastPlayPerformanceTime:v9];
    objc_storeStrong((id *)&self->_lastPerformanceMetrics, a3);
  }
}

- (void)getShouldRestoreStateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F12178] standardUserDefaults];
  if ([v4 shouldSkipNextStateRestoration])
  {
    [v4 clearShouldSkipNextStateRestoration];
  }
  else if (![v4 disableStateRestoration])
  {
    int v5 = objc_opt_class();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64___MPCMediaRemotePublisher_getShouldRestoreStateWithCompletion___block_invoke;
    v6[3] = &unk_2643C58A8;
    id v7 = v3;
    [v5 getPendingCommandTypesWithCompletion:v6];

    goto LABEL_6;
  }
  (*((void (**)(id, void))v3 + 2))(v3, 0);
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_swift, 0);
  objc_storeStrong((id *)&self->_hostingSharedSessionID, 0);
  objc_storeStrong((id *)&self->_commandCenter, 0);
  objc_storeStrong((id *)&self->_infoCenter, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_setPlaybackQueueExtendedTimeGuard, 0);
  objc_storeStrong((id *)&self->_lastCommandDescriptions, 0);
  objc_storeStrong((id *)&self->_nextPreviousTrackCooldownTimer, 0);
  objc_storeStrong((id *)&self->_activeAccountStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_libraryAddStatusObserver, 0);
}

- (void)setLastPerformanceMetrics:(id)a3
{
}

- (NSDictionary)lastPerformanceMetrics
{
  return self->_lastPerformanceMetrics;
}

- (void)setMediaServerAvailable:(BOOL)a3
{
  self->_mediaServerAvailable = a3;
}

- (BOOL)isMediaServerAvailable
{
  return self->_mediaServerAvailable;
}

- (void)setEngineRestoringState:(BOOL)a3
{
  self->_engineRestoringState = a3;
}

- (_MPCMediaRemotePublisher_Swift)swift
{
  return self->_swift;
}

- (void)_performSkipChapterCommand:(unsigned int)a3 withCommandID:(id)a4 completion:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  uint64_t v11 = [v10 player];
  [v11 currentTime];
  double v13 = v12;

  uint64_t v14 = [v10 queueController];
  int v15 = [v14 currentItem];

  id v16 = v15;
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v16;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, item has an unexpected type.", buf, 0xCu);
    }

    uint64_t v21 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2101, @"Current item has an unexpected type: %@.", v16);
    goto LABEL_10;
  }
  id v17 = [v16 chapters];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    long long v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v16;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, item does not have chapters.", buf, 0xCu);
    }

    uint64_t v21 = (void *)MEMORY[0x263F121D0];
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2101, @"Current item does not have chapters: %@.", v16);
    goto LABEL_10;
  }
  if (a3 == 101)
  {
    uint64_t v19 = [v16 previousChapterBefore:v13];
LABEL_16:
    long long v25 = (void *)v19;
    if (v19)
    {
      long long v26 = [v10 player];
      [v25 startTime];
      double v28 = v27;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __80___MPCMediaRemotePublisher__performSkipChapterCommand_withCommandID_completion___block_invoke;
      v30[3] = &unk_2643C59E0;
      id v31 = v16;
      id v32 = v25;
      id v33 = v9;
      id v22 = v25;
      [v26 jumpToTime:v8 identifier:v30 completion:v28];

      long long v23 = v31;
      goto LABEL_11;
    }
    goto LABEL_18;
  }
  if (a3 == 100)
  {
    uint64_t v19 = [v16 nextChapterAfter:v13];
    goto LABEL_16;
  }
LABEL_18:
  __int16 v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v16;
    _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "❗️Cannot skip chapters for current item: %{public}@, unable to find next chapter.", buf, 0xCu);
  }

  uint64_t v21 = (void *)MEMORY[0x263F121D0];
  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2101, @"Unable to find next chapter for current item: %@.", v16);
LABEL_10:
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  long long v23 = [v21 statusWithCode:200 error:v22];
  (*((void (**)(id, void *))v9 + 2))(v9, v23);
LABEL_11:
}

- (void)performSetQueue:(id)a3 completion:(id)a4
{
  int v6 = (objc_class *)MEMORY[0x263F12238];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [(_MPCMediaRemotePublisher *)self commandCenter];
  uint64_t v11 = [v10 setPlaybackQueueCommand];
  id v13 = (id)[v9 initWithCommand:v11 playbackQueue:v8];

  double v12 = [(_MPCMediaRemotePublisher *)self swift];
  [v12 performSetQueueWithEvent:v13 completion:v7];
}

- (void)performSetQueueWithIntent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65___MPCMediaRemotePublisher_performSetQueueWithIntent_completion___block_invoke;
  v10[3] = &unk_2643C1CC0;
  double v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [v9 getRemotePlaybackQueueWithDestination:1 completion:v10];
}

- (void)_performCommandEvent:(id)a3 completion:(id)a4
{
  v624[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v430 = a4;
  unsigned int v443 = [v6 mediaRemoteCommandType];
  val = self;
  id v7 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  v434 = [v7 queueController];
  MPCRemoteCommandDescriptionCopy(v443);
  id v441 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v6 commandID];
  if (v443 - 21 <= 1)
  {
    int v9 = [v6 isNegative];
    id v10 = @"YES";
    if (v9) {
      id v10 = @"NO";
    }
    uint64_t v11 = [v441 stringByAppendingFormat:@" (%@)", v10];

    id v441 = (id)v11;
  }
  double v12 = [v7 eventStream];
  id v13 = [NSString stringWithFormat:@"Command %@", v8];
  v432 = [v12 eventDeliveryDeferralAssertionOfType:1 forReason:v13 withTimeout:5.0];

  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v6 interfaceID];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v441;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v620 = v15;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: received MRMediaRemoteCommand type=%{public}@ id=%{public}@ interface=%{public}@", buf, 0x20u);
  }
  id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t spid = (char *)os_signpost_id_make_with_pointer(v16, v8);

  if (v443)
  {
    if (v443 == 122)
    {
      id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      uint64_t v18 = v17;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "PerformCommandSetPlaybackQueue";
        long long v20 = "";
LABEL_15:
        id v22 = v18;
        os_signpost_id_t v23 = (os_signpost_id_t)spid;
        uint32_t v24 = 2;
LABEL_19:
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v23, v19, v20, buf, v24);
      }
    }
    else
    {
      long long v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      uint64_t v18 = v25;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        uint64_t v26 = [v441 UTF8String];
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = v26;
        uint64_t v19 = "PerformCommandOther";
        long long v20 = "command=%{public, signpost.telemetry:string1, name=command}s";
        id v22 = v18;
        os_signpost_id_t v23 = (os_signpost_id_t)spid;
        uint32_t v24 = 12;
        goto LABEL_19;
      }
    }
  }
  else
  {
    uint64_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    uint64_t v18 = v21;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = "PerformCommandPlay";
      long long v20 = "";
      goto LABEL_15;
    }
  }

  v428 = _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext((uint64_t)"-[_MPCMediaRemotePublisher _performCommandEvent:completion:]", v441);
  double v27 = [v6 mediaRemoteOptions];
  v452 = (void *)[v27 mutableCopy];

  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54D60]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54C88]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54D78]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54DA8]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54DB8]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54CB0]];
  [v452 setObject:0 forKeyedSubscript:*MEMORY[0x263F54C78]];
  [v452 setObject:0 forKeyedSubscript:@"playbackContext"];
  [v452 setObject:0 forKeyedSubscript:@"sharedListeningIntentToken"];
  [v452 setObject:0 forKeyedSubscript:@"kMRMediaRemoteOptionSenderID"];
  double v28 = [v7 eventStream];
  v624[0] = v8;
  v623[0] = @"remote-control-id";
  v623[1] = @"remote-control-type";
  __int16 v29 = [NSNumber numberWithUnsignedInt:v443];
  v624[1] = v29;
  v623[2] = @"remote-control-source";
  id v30 = [v6 sourceID];
  v624[2] = v30;
  v623[3] = @"remote-control-associated-participant-id";
  id v31 = [v6 associatedParticipantIdentifier];
  id v32 = v31;
  if (!v31)
  {
    id v32 = [MEMORY[0x263EFF9D0] null];
  }
  v623[4] = @"remote-control-options";
  id v33 = (void *)MEMORY[0x263EFFA78];
  if (v452) {
    id v33 = v452;
  }
  v624[3] = v32;
  v624[4] = v33;
  v34 = [NSDictionary dictionaryWithObjects:v624 forKeys:v623 count:5];
  [v28 emitEventType:@"remote-control-begin" payload:v34];

  if (!v31) {
  *(void *)buf = 0;
  }
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v620 = __Block_byref_object_copy__3441;
  v621 = __Block_byref_object_dispose__3442;
  id v622 = 0;
  objc_initWeak(&location, val);
  id v35 = [v7 eventStream];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke;
  aBlock[3] = &unk_2643BF7B8;
  id v424 = v432;
  id v597 = v424;
  v598 = val;
  id v36 = v6;
  id v599 = v36;
  double v433 = COERCE_DOUBLE(v441);
  double v600 = v433;
  id v37 = v8;
  id v601 = v37;
  id v425 = v35;
  id v602 = v425;
  v606 = buf;
  id v422 = v430;
  id v604 = v422;
  objc_copyWeak(v607, &location);
  unsigned int v608 = v443;
  v607[1] = spid;
  id v38 = v7;
  id v603 = v38;
  id v423 = v428;
  id v605 = v423;
  v39 = _Block_copy(aBlock);
  v592[0] = MEMORY[0x263EF8330];
  v592[1] = 3221225472;
  v592[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_380;
  v592[3] = &unk_2643BF7E0;
  id v40 = v38;
  id v593 = v40;
  id v41 = v37;
  id v594 = v41;
  id v42 = v39;
  id v595 = v42;
  v427 = (void (**)(void))_Block_copy(v592);
  v588[0] = MEMORY[0x263EF8330];
  v588[1] = 3221225472;
  v588[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_385;
  v588[3] = &unk_2643BF7E0;
  id v43 = v40;
  id v589 = v43;
  id v44 = v41;
  id v590 = v44;
  id v45 = v42;
  id v591 = v45;
  id v429 = (void (**)(void))_Block_copy(v588);
  v586[0] = MEMORY[0x263EF8330];
  v586[1] = 3221225472;
  v586[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_387;
  v586[3] = &unk_2643BF808;
  id v46 = v36;
  id v587 = v46;
  v431 = (uint64_t (**)(void))_Block_copy(v586);
  v584[0] = MEMORY[0x263EF8330];
  v584[1] = 3221225472;
  v584[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_395;
  v584[3] = &unk_2643BF808;
  id v47 = v46;
  id v585 = v47;
  v426 = (uint64_t (**)(void))_Block_copy(v584);
  v48 = val;
  uint64_t v49 = v443;
  if (![(_MPCMediaRemotePublisher *)val isMediaServerAvailable])
  {
    v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);
    if (v443 != 139)
    {
      if (v51)
      {
        char v62 = [v47 interfaceID];
        *(_DWORD *)v613 = 138543874;
        double v614 = v433;
        __int16 v615 = 2114;
        id v616 = v44;
        __int16 v617 = 2114;
        id v618 = v62;
        _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_INFO, "❕-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: mediaserverd unavailable [failing command] type=%{public}@ id=%{public}@ interface=%{public}@", v613, 0x20u);
      }
      v63 = (void *)MEMORY[0x263F121D0];
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 1000, @"mediaserverd not available to perform command");
      id v442 = (id)objc_claimAutoreleasedReturnValue();
      v64 = [v63 statusWithCode:1501 error:v442];
      (*((void (**)(id, void *))v45 + 2))(v45, v64);

      goto LABEL_43;
    }
    if (v51)
    {
      v52 = [v47 interfaceID];
      *(_DWORD *)v613 = 138543874;
      double v614 = v433;
      __int16 v615 = 2114;
      id v616 = v44;
      __int16 v617 = 2114;
      id v618 = v52;
      _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_INFO, "❕-[_MPCMediaRemotePublisher _performCommandEvent:completion:]: mediaserverd unavailable [allowing command] type=%{public}@ id=%{public}@ interface=%{public}@", v613, 0x20u);
    }
    v48 = val;
    uint64_t v49 = v443;
  }
  id v442 = [v47 contentItemID];
  if (!v95 & v53)
  {
    switch((int)v49)
    {
      case 100:
      case 101:
        if ([v434 behaviorType] == 4)
        {
          [(_MPCMediaRemotePublisher *)v48 _performSkipChapterCommand:v49 withCommandID:v44 completion:v45];
          goto LABEL_43;
        }
        v249 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v613 = 138543618;
          double v614 = v433;
          __int16 v615 = 2114;
          id v616 = v44;
          _os_log_impl(&dword_21BB87000, v249, OS_LOG_TYPE_ERROR, "❗️Unsupported command: %{public}@ id=%{public}@", v613, 0x16u);
        }
        goto LABEL_92;
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 123:
      case 126:
      case 136:
      case 137:
      case 138:
      case 141:
        goto LABEL_90;
      case 121:
        id v235 = v47;
        v236 = [v235 stationURL];
        if (v236)
        {
          v237 = +[MPCPlaybackIntent radioPlaybackIntentWithStationURL:v236];
          [v237 setPlayActivityFeatureName:@"siri"];
          v238 = [v235 contextID];
          [v237 setSiriReferenceIdentifier:v238];

          v489[0] = MEMORY[0x263EF8330];
          v489[1] = 3221225472;
          v489[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_597;
          v489[3] = &unk_2643C6110;
          id v239 = v237;
          id v490 = v239;
          id v491 = v45;
          [(_MPCMediaRemotePublisher *)val performSetQueueWithIntent:v239 completion:v489];

          v240 = v490;
        }
        else
        {
          v315 = [v43 player];
          id v239 = [v315 currentItem];

          if (v239)
          {
            int v316 = [v239 modelGenericObject];
            v240 = [v316 flattenedGenericObject];

            if ([v240 type] == 1)
            {
              int v317 = [v240 song];
              v318 = +[MPCPlaybackIntent radioPlaybackIntentFromSong:v317];

              [v318 setPlayActivityFeatureName:@"now_playing"];
              double v319 = [v235 contextID];
              [v318 setSiriReferenceIdentifier:v319];

              if (v318)
              {
                uint64_t v320 = [v434 music];
                BOOL v321 = v320 == 0;

                if (v321)
                {
                  v480[0] = MEMORY[0x263EF8330];
                  v480[1] = 3221225472;
                  v480[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_621;
                  v480[3] = &unk_2643C6110;
                  id v482 = v45;
                  id v395 = v318;
                  id v481 = v395;
                  [(_MPCMediaRemotePublisher *)val performSetQueueWithIntent:v395 completion:v480];

                  v322 = v482;
                }
                else
                {
                  v483[0] = MEMORY[0x263EF8330];
                  v483[1] = 3221225472;
                  v483[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_607;
                  v483[3] = &unk_2643C5B50;
                  id v395 = v318;
                  id v484 = v395;
                  id v488 = v45;
                  id v485 = v434;
                  id v486 = v239;
                  v487 = val;
                  [v395 getRemotePlaybackQueueWithDestination:1 completion:v483];

                  v322 = v484;
                }
              }
              else
              {
                v412 = (void *)MEMORY[0x263F121D0];
                v413 = (void *)MEMORY[0x263F087E8];
                v451 = [v240 song];
                unint64_t v414 = objc_msgSend(v413, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3000, @"Failed to get radio intent from song: %@", v451);
                v415 = [v412 statusWithCode:200 error:v414];
                (*((void (**)(id, void *))v45 + 2))(v45, v415);

                id v395 = 0;
              }
            }
            else
            {
              [v240 type];
              NSStringFromMPModelGenericObjectType();
              id v395 = (id)objc_claimAutoreleasedReturnValue();
              v396 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v396, OS_LOG_TYPE_ERROR))
              {
                double v398 = [v43 engineID];
                *(_DWORD *)v613 = 138543874;
                double v614 = v398;
                __int16 v615 = 2114;
                id v616 = v44;
                __int16 v617 = 2114;
                id v618 = v395;
                double v449 = v398;
                _os_log_impl(&dword_21BB87000, v396, OS_LOG_TYPE_ERROR, "[PBLSH:%{public}@] _performCommandEvent:%{public}@… | failing CreateRadioStation command [unsupported model object type] type=%{public}@", v613, 0x20u);
              }
              v399 = (void *)MEMORY[0x263F121D0];
              v450 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Unsupported model object type %@", v395);
              v400 = [v399 statusWithCode:200 error:v450];
              (*((void (**)(id, void *))v45 + 2))(v45, v400);
            }
          }
          else
          {
            v389 = (void *)MEMORY[0x263F121D0];
            v240 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2, @"Cannot create station with seed item without current item");
            id v395 = [v389 statusWithCode:100 error:v240];
            (*((void (**)(id, id))v45 + 2))(v45, v395);
          }
        }
        goto LABEL_43;
      case 122:
        id v181 = v47;
        if (MSVDeviceIsAudioAccessory())
        {
          v182 = [v43 player];
          int v183 = [v182 criticalSectionToken];
          BOOL v184 = v183 == 0;

          if (v184)
          {
            v185 = [MEMORY[0x263F548B8] enterCriticalSection];
            [v182 setCriticalSectionToken:v185];
          }
          v48 = val;
        }
        int v186 = [(_MPCMediaRemotePublisher *)v48 swift];
        v492[0] = MEMORY[0x263EF8330];
        v492[1] = 3221225472;
        v492[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_578;
        v492[3] = &unk_2643BF9E8;
        id v493 = v43;
        id v497 = v45;
        id v187 = v181;
        id v494 = v187;
        id v495 = v44;
        v496 = v48;
        [v186 performSetQueueWithEvent:v187 completion:v492];

        goto LABEL_43;
      case 124:
        id v188 = v47;
        switch([v188 stopMode])
        {
          case 0:
            v189 = [v43 sleepTimerController];
            [v189 reset];
            goto LABEL_261;
          case 1:
            v189 = [v43 sleepTimerController];
            v346 = [v188 time];
            [v346 doubleValue];
            objc_msgSend(v189, "startSleepTimerWithTimeRemaining:");

            goto LABEL_261;
          case 2:
            v189 = [v43 sleepTimerController];
            [v189 startSleepTimerForChapterEnd];
            goto LABEL_261;
          case 3:
            v189 = [v43 sleepTimerController];
            [v189 startSleepTimerForItemEnd];
LABEL_261:

            v48 = val;
            break;
          default:
            break;
        }
        [(_MPCMediaRemotePublisher *)v48 _updateSupportedCommands];
        v347 = [MEMORY[0x263F121D0] successStatus];
        (*((void (**)(id, void *))v45 + 2))(v45, v347);

        goto LABEL_43;
      case 125:
        id v190 = v47;
        v191 = [v434 upNextBehavior];
        char v192 = [v191 allowsQueueModifications];

        if ((v192 & 1) == 0)
        {
          v285 = (void *)MEMORY[0x263F121D0];
          objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 4, @"Cannot modify queue due to iAP lockout");
          id v198 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v286 = [v285 statusWithCode:1002 error:v198];
          (*((void (**)(id, __CFString *))v45 + 2))(v45, v286);
          goto LABEL_321;
        }
        if ([v190 insertionPosition] == 3)
        {
          v193 = [v190 insertAfterContentItemID];
          BOOL v194 = v193 == 0;

          if (v194)
          {
            v403 = (void *)MEMORY[0x263F121D0];
            objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Insert operation indicated specific insertion position type, but no content item ID provided.");
            id v198 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v286 = [v403 statusWithCode:1006 error:v198];
            (*((void (**)(id, __CFString *))v45 + 2))(v45, v286);
            goto LABEL_321;
          }
        }
        v195 = [v434 upNextBehavior];
        uint64_t v196 = [v190 insertionPosition];
        v197 = [v434 targetContentItemID];
        id v536 = 0;
        LOBYTE(v196) = [v195 isSupportedInsertionPosition:v196 fromContentItemID:v197 reason:&v536];
        id v198 = v536;

        if (v196) {
          goto LABEL_135;
        }
        v342 = [v434 music];
        if (v342 && [v190 insertionPosition] == 2)
        {
          v343 = [v190 mediaRemoteOptions];
          v344 = [v343 objectForKeyedSubscript:@"_MPCOverrideAllowsInsertionPositionLast"];
          char v345 = [v344 BOOLValue];

          if (v345)
          {
LABEL_135:
            v199 = [v434 upNextBehavior];
            BOOL v200 = v199 == 0;

            if (v200)
            {
              v404 = (void *)MEMORY[0x263F121D0];
              objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"InsertIntoPlaybackQueue not possible without up next behavior.");
              uint64_t v286 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v405 = [v404 statusWithCode:200 error:v286];
              (*((void (**)(id, void *))v45 + 2))(v45, v405);
            }
            else
            {
              v532[0] = MEMORY[0x263EF8330];
              v532[1] = 3221225472;
              v532[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_521;
              v532[3] = &unk_2643C5620;
              uint64_t v447 = v434;
              v533 = v447;
              id v201 = v190;
              id v534 = v201;
              id v535 = v45;
              v202 = (void (**)(void))_Block_copy(v532);
              v203 = [v201 mediaRemoteOptions];
              int v204 = [v203 objectForKey:@"MPCRemoteCommandEventOptionShouldPlayInsertedContent"];
              LODWORD(v201) = [v204 BOOLValue];

              if (v201)
              {
                v530[0] = MEMORY[0x263EF8330];
                v530[1] = 3221225472;
                v530[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_526;
                v530[3] = &unk_2643C54B8;
                v531 = v202;
                [(__CFString *)v447 performAllowingEditsToChangeCurrentItem:v530];
              }
              else
              {
                v202[2](v202);
              }

              uint64_t v286 = v533;
            }
            goto LABEL_321;
          }
        }
        else
        {
        }
        v392 = (void *)MEMORY[0x263F121D0];
        v393 = (void *)MEMORY[0x263F087E8];
        unint64_t v394 = [v190 insertionPosition];
        if (v394 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown/%ld", v394);
          uint64_t v286 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v286 = off_2643BFB90[v394];
        }
        v407 = objc_msgSend(v393, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Insert operation indicated unsupported insertion position: %@ [%@]", v286, v198);
        v408 = [v392 statusWithCode:1006 error:v407];
        (*((void (**)(id, void *))v45 + 2))(v45, v408);

LABEL_321:
        goto LABEL_43;
      case 127:
      case 128:
        id v70 = v47;
        char v71 = [v70 mediaRemoteOptions];
        v72 = [v71 objectForKey:*MEMORY[0x263F54DB0]];
        uint64_t v73 = [v72 longLongValue];

        char v74 = [v43 player];
        v444 = [v74 currentItem];

        if (v73 && v73 != [v444 persistentID])
        {
          id v258 = objc_alloc(MEMORY[0x263F12028]);
          id v259 = objc_alloc(MEMORY[0x263F11DB0]);
          v260 = [MEMORY[0x263F12028] kindWithVariants:1];
          v471[0] = MEMORY[0x263EF8330];
          v471[1] = 3221225472;
          v471[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_648;
          v471[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
          v471[4] = v73;
          id v261 = (void *)[v259 initWithSource:@"MediaRemotePublisher" modelKind:v260 block:v471];
          v77 = (void *)[v258 initWithIdentifiers:v261 block:&__block_literal_global_656];

          uint64_t v78 = 0;
          int v79 = 1;
        }
        else
        {
          v75 = [v444 modelGenericObject];
          v76 = [v75 flattenedGenericObject];
          v77 = [v76 anyObject];

          os_unfair_lock_lock(&val->_libraryAddStatusObserverLock);
          uint64_t v78 = [(MPLibraryAddStatusObserver *)val->_libraryAddStatusObserver currentStatus];
          os_unfair_lock_unlock(&val->_libraryAddStatusObserverLock);
          int v79 = 0;
        }
        if (v77)
        {
          v262 = [MEMORY[0x263F121D0] successStatus];
          (*((void (**)(id, void *))v45 + 2))(v45, v262);

          if ([v70 isNegative])
          {
            if (v78 == 1) {
              int v263 = 1;
            }
            else {
              int v263 = v79;
            }
            if (v263 == 1)
            {
              id v264 = objc_alloc_init(MEMORY[0x263F11F18]);
              [v264 setModelObject:v77];
              [v264 performWithResponseHandler:&__block_literal_global_660];
LABEL_183:
            }
LABEL_193:

            goto LABEL_43;
          }
          if (v78 == 1) {
            int v267 = v79;
          }
          else {
            int v267 = 1;
          }
          if (v267 != 1) {
            goto LABEL_193;
          }
          int v268 = (v78 & 0xFFFFFFFFFFFFFFFELL) == 2 ? 1 : v79;
          if (v268 != 1) {
            goto LABEL_193;
          }
          id v264 = objc_alloc_init(MEMORY[0x263F120D8]);
          [v264 appendSection:&stru_26CBCA930];
          [v264 appendItem:v77];
          id v266 = objc_alloc_init(MEMORY[0x263F11F30]);
          [v266 setShouldLibraryAdd:1];
          [v266 setModelObjects:v264];
          [v266 performWithResponseHandler:&__block_literal_global_665];
        }
        else
        {
          v265 = (void *)MEMORY[0x263F121D0];
          objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Unable to find item to add to library: trackID=%lld currentItem=%@", v73, v444);
          id v264 = (id)objc_claimAutoreleasedReturnValue();
          id v266 = [v265 statusWithCode:100 error:v264];
          (*((void (**)(id, id))v45 + 2))(v45, v266);
        }

        goto LABEL_183;
      case 129:
        if (v442)
        {
          int v205 = [v434 upNextBehavior];
          v501[0] = MEMORY[0x263EF8330];
          v501[1] = 3221225472;
          v501[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_12;
          v501[3] = &unk_2643C6110;
          id v503 = v45;
          id v502 = v47;
          [v205 removeContentItemID:v442 completion:v501];

          goto LABEL_43;
        }
        v312 = (void *)MEMORY[0x263F121D0];
        double v313 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Cannot find item to remove: %@", 0);
        uint64_t v314 = [v312 statusWithCode:100 error:v313];
        (*((void (**)(id, void *))v45 + 2))(v45, v314);

        goto LABEL_44;
      case 130:
        id v206 = v47;
        v527[0] = MEMORY[0x263EF8330];
        v527[1] = 3221225472;
        v527[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_4_527;
        v527[3] = &unk_2643C6110;
        id v529 = v45;
        id v207 = v206;
        id v528 = v207;
        double v208 = _Block_copy(v527);
        v209 = [v207 insertBeforeContextItemID];
        if ([v209 length])
        {
          v210 = [v434 upNextBehavior];
          [v210 moveContentItemID:v442 beforeContentItemID:v209 completion:v208];
        }
        else
        {
          v210 = [v207 insertAfterContextItemID];
          if ([v210 length])
          {
            v331 = [v434 upNextBehavior];
            [v331 moveContentItemID:v442 afterContentItemID:v210 completion:v208];
          }
        }

        goto LABEL_43;
      case 131:
LABEL_45:
        uint64_t v65 = [v434 behaviorType];
        int v66 = v49 & 0xFFFFFFFE;
        if (v65 != 4) {
          goto LABEL_50;
        }
        v67 = +[MPCPodcastsDefaultsHelper standard];
        if ([v67 remoteSkipInsteadOfNextTrack] && v66 == 4 && (v431[2]() & 1) == 0)
        {
          char v310 = v426[2]();

          if ((v310 & 1) == 0)
          {
            int v311 = +[MPCPodcastsDefaultsHelper standard];
            if (v443 == 4)
            {
              [v311 skipForwardInterval];
              v427[2]();
            }
            else
            {
              [v311 skipBackwardInterval];
              v429[2]();
            }

            goto LABEL_43;
          }
        }
        else
        {
        }
LABEL_50:
        v68 = [v43 queueController];
        double spida = [v68 currentItem];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v419 = *(id *)&spida;
        }
        else {
          id v419 = 0;
        }
        uint64_t v88 = [v43 player];
        [v88 currentTime];
        double v90 = v89;

        v91 = [v419 chapters];
        uint64_t v92 = [v91 count];

        char v93 = [v419 nextChapterAfter:v90];

        unint64_t v94 = [v419 previousChapterBefore:v90];

        if (v443 != 4 || v93 == 0)
        {
          BOOL v95 = v443 != 5 || v94 == 0;
          char v96 = !v95;
        }
        else
        {
          char v96 = 1;
        }
        if (v65 != 4 || v66 != 4) {
          goto LABEL_76;
        }
        uint64_t v97 = +[MPCPodcastsDefaultsHelper standard];
        if ([v97 remoteSkipInsteadOfNextTrack] & 1) != 0 || (v431[2]())
        {
        }
        else
        {
          char v332 = v426[2]();

          if (((v92 != 0) & ~v332 & v96) != 0)
          {
            if (v443 == 4) {
              uint64_t v333 = 100;
            }
            else {
              uint64_t v333 = 101;
            }
            [(_MPCMediaRemotePublisher *)val _performSkipChapterCommand:v333 withCommandID:v44 completion:v45];
            goto LABEL_282;
          }
        }
LABEL_76:
        v98 = [v47 mediaRemoteOptions];
        v99 = [v98 objectForKeyedSubscript:*MEMORY[0x263F54DB0]];
        uint64_t v100 = [v99 longLongValue];

        if (v443 == 5)
        {
          v101 = [*(id *)&spida contentItemID];
          id v566 = 0;
          char v102 = [v434 canPreviousTrackForContentItemID:v101 reason:&v566];
          id v418 = v566;

          if ((v102 & 1) == 0)
          {
            v103 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v613 = 138543618;
              double v614 = spida;
              __int16 v615 = 2114;
              id v616 = v418;
              _os_log_impl(&dword_21BB87000, v103, OS_LOG_TYPE_ERROR, "❗️Cannot skip backwards from current item: %{public}@ [%{public}@]", v613, 0x16u);
            }

            char v104 = (void *)MEMORY[0x263F121D0];
            objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2101, @"Current item forbids skipping backwards: %@ [%@]", *(void *)&spida, v418);
            id v105 = (id)objc_claimAutoreleasedReturnValue();
            v106 = [v104 statusWithCode:200 error:v105];
            (*((void (**)(id, void *))v45 + 2))(v45, v106);

LABEL_281:
LABEL_282:

            goto LABEL_43;
          }
        }
        else
        {
          char v107 = [*(id *)&spida contentItemID];
          id v565 = 0;
          char v108 = [v434 canNextTrackForContentItemID:v107 reason:&v565];
          id v418 = v565;

          if ((v108 & 1) == 0)
          {
            v254 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v613 = 138543618;
              double v614 = spida;
              __int16 v615 = 2114;
              id v616 = v418;
              _os_log_impl(&dword_21BB87000, v254, OS_LOG_TYPE_ERROR, "❗️Cannot skip forwards from current item: %{public}@ [%{public}@]", v613, 0x16u);
            }

            v255 = (void *)MEMORY[0x263F121D0];
            objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2101, @"Current item forbids skipping forwards: %@ [%@]", *(void *)&spida, v418);
            id v105 = (id)objc_claimAutoreleasedReturnValue();
            id v256 = [v255 statusWithCode:200 error:v105];
            (*((void (**)(id, void *))v45 + 2))(v45, v256);

            goto LABEL_281;
          }
        }
        if (v442 || v100)
        {
          v257 = [(_MPCMediaRemotePublisher *)val swift];
          v561[0] = MEMORY[0x263EF8330];
          v561[1] = 3221225472;
          v561[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_448;
          v561[3] = &unk_2643BF920;
          id v562 = v434;
          id v563 = v45;
          uint64_t v564 = v100;
          [v257 findContentItemIDWithIncomingContentItemID:v442 trackID:v100 completion:v561];

          id v105 = v562;
        }
        else
        {
          id v105 = v47;
          char v109 = [v105 isRequestingDefermentToPlaybackQueuePosition];
          if (v443 == 5) {
            int v110 = -1;
          }
          else {
            int v110 = 1;
          }
          v111 = [v105 mediaRemoteOptions];
          v112 = [v111 objectForKeyedSubscript:@"MPCRemoteCommandEventOptionSkipImmediatelyKey"];
          int v417 = [v112 BOOLValue];

          if ((v109 & 1) != 0 || ![v43 skipWithDirectionShouldJumpToItemStart:v443 != 5])
          {
            v555[0] = MEMORY[0x263EF8330];
            v555[1] = 3221225472;
            v555[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_3_460;
            v555[3] = &unk_2643BF948;
            id v556 = v434;
            id v557 = v43;
            __int16 v445 = _Block_copy(v555);
            if (val->_nextPreviousTrackCooldownTimer)
            {
              int64_t v271 = val->_deferredTrackChangeDelta + v110;
              val->_deferredTrackChangeDelta = v271;
              if (v417)
              {
                uint64_t v272 = objc_msgSend(NSString, "stringWithFormat:", @"🛎  Forced [pending delta %ld]", v271);
                v273 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v272;

                dispatch_time_t v274 = 0;
              }
              else
              {
                uint64_t v367 = objc_msgSend(NSString, "stringWithFormat:", @"⏲  Deferred [pending delta %ld]", v271);
                v368 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v367;

                dispatch_time_t v274 = dispatch_time(0, 350000000);
              }
              dispatch_source_set_timer((dispatch_source_t)val->_nextPreviousTrackCooldownTimer, v274, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
            }
            else
            {
              dispatch_source_t v348 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
              nextPreviousTrackCooldownTimer = val->_nextPreviousTrackCooldownTimer;
              val->_nextPreviousTrackCooldownTimer = (OS_dispatch_source *)v348;

              v350 = val->_nextPreviousTrackCooldownTimer;
              dispatch_time_t v351 = dispatch_time(0, 350000000);
              dispatch_source_set_timer(v350, v351, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
              id v352 = val->_nextPreviousTrackCooldownTimer;
              handler[0] = MEMORY[0x263EF8330];
              handler[1] = 3221225472;
              handler[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_477;
              handler[3] = &unk_2643C55A8;
              handler[4] = val;
              id v353 = v445;
              id v554 = v353;
              dispatch_source_set_event_handler(v352, handler);
              dispatch_resume((dispatch_object_t)val->_nextPreviousTrackCooldownTimer);
              uint64_t v354 = [NSString stringWithFormat:@"🛎  Immediate"];
              v355 = *(void **)(*(void *)&buf[8] + 40);
              *(void *)(*(void *)&buf[8] + 40) = v354;

              (*((void (**)(id, void))v353 + 2))(v353, v110);
            }
            v113 = [MEMORY[0x263F121D0] successStatus];
            (*((void (**)(id, void *))v45 + 2))(v45, v113);
            char v118 = &v556;
            v119 = &v557;
          }
          else
          {
            __int16 v445 = [v43 player];
            v113 = [v43 player];
            v114 = [v113 currentItem];
            v115 = [v114 playbackInfoStartTime];
            [v115 doubleValue];
            double v117 = v116;
            v558[0] = MEMORY[0x263EF8330];
            v558[1] = 3221225472;
            v558[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_456;
            v558[3] = &unk_2643C6110;
            id v560 = v45;
            id v559 = v43;
            [v445 jumpToTime:v44 identifier:v558 completion:v117];

            char v118 = &v560;
            v119 = &v559;
          }
        }
        goto LABEL_281;
      case 132:
        v211 = [v43 queueController];
        BOOL v212 = [v211 behaviorType] == 4;

        if (v212)
        {
          id v213 = [MEMORY[0x263F121D0] successStatus];
          (*((void (**)(id, id))v45 + 2))(v45, v213);
        }
        else
        {
          id v213 = v47;
          double v287 = [v213 userIdentity];
          v288 = +[MPCPlaybackAccountManager sharedManager];
          id v289 = [v288 accountForUserIdentity:*(void *)&v287];

          if (v289)
          {
            v290 = [v43 leaseManager];
            v498[0] = MEMORY[0x263EF8330];
            v498[1] = 3221225472;
            v498[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_563;
            v498[3] = &unk_2643C6110;
            id v500 = v45;
            id v499 = v289;
            [v290 prepareForPlaybackWithAccount:v499 completion:v498];

            uint64_t v291 = v500;
          }
          else
          {
            v361 = _MPCLogCategoryPlayback();
            if (os_log_type_enabled(v361, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v613 = 138412290;
              double v614 = v287;
              _os_log_impl(&dword_21BB87000, v361, OS_LOG_TYPE_ERROR, "❗️[Skipping PrepareForSetQueue] No playback account found for user identity: %@", v613, 0xCu);
            }

            uint64_t v291 = [MEMORY[0x263F121D0] successStatus];
            (*((void (**)(id, void *))v45 + 2))(v45, v291);
          }
        }
        if (MSVDeviceIsAudioAccessory())
        {
          v362 = dispatch_get_global_queue(21, 0);
          dispatch_async(v362, &__block_literal_global_572);

          dispatch_async(v362, &__block_literal_global_575);
        }
        goto LABEL_43;
      case 133:
        id v214 = v47;
        uint64_t v215 = [v214 type];
        id v479 = 0;
        v448 = (void *)v215;
        BOOL v216 = +[MPCQueueController isSupportedSessionType:v215 forEngine:v43 reason:&v479];
        id spidb = v479;
        if (v216)
        {
          id v217 = [v214 identifier];
          if (![v217 length])
          {
            v356 = (void *)MEMORY[0x263F121D0];
            v279 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3104, @"Migration identifier missing");
            id v357 = [v356 statusWithCode:200 error:v279];
            (*((void (**)(id, id))v45 + 2))(v45, v357);
LABEL_314:

            goto LABEL_315;
          }
          v218 = [v43 eventStream];
          v611 = @"session-id";
          id v612 = v217;
          v219 = [NSDictionary dictionaryWithObjects:&v612 forKeys:&v611 count:1];
          [v218 emitEventType:@"session-migrate-begin" payload:v219];

          double v220 = +[_MPCQueueControllerBehaviorPodcastsTransportableExtension defaultSessionType];
          if ([v448 isEqualToString:v220])
          {

LABEL_284:
            v371 = _MPCLogCategoryPodcastsBehavior();
            if (os_log_type_enabled(v371, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v613 = 0;
              _os_log_impl(&dword_21BB87000, v371, OS_LOG_TYPE_DEFAULT, "Received legacy Podcasts queue from handoff", v613, 2u);
            }

            v279 = [v214 playbackSessionData];
            v420 = (void *)MEMORY[0x263F08928];
            v372 = (void *)MEMORY[0x263EFFA08];
            v610[0] = objc_opt_class();
            v610[1] = objc_opt_class();
            v373 = [MEMORY[0x263EFF8C0] arrayWithObjects:v610 count:2];
            v374 = [v372 setWithArray:v373];
            id v478 = 0;
            id v421 = [v420 unarchivedObjectOfClasses:v374 fromData:v279 error:&v478];
            id v357 = v478;

            if (v357)
            {
              v375 = (void *)MEMORY[0x263F121D0];
              v376 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCPlaybackEngineInternalError", 3101, v357, @"Unabled to decode session");
              v377 = [v375 statusWithCode:200 error:v376];
              (*((void (**)(id, void *))v45 + 2))(v45, v377);
            }
            else
            {
              uint64_t v406 = MRSystemAppPlaybackQueueCreate();
              MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
              v376 = (void *)[objc_alloc(MEMORY[0x263F11D98]) initWithMediaRemotePlaybackQueue:v406 options:0];
              [v376 setRequestingImmediatePlayback:0];
              v476[0] = MEMORY[0x263EF8330];
              v476[1] = 3221225472;
              v476[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_635;
              v476[3] = &unk_2643C5830;
              id v477 = v45;
              [(_MPCMediaRemotePublisher *)val performSetQueue:v376 completion:v476];
              v377 = v477;
            }

            goto LABEL_314;
          }
          v369 = +[_MPCQueueControllerBehaviorPodcastsTransportableExtension fallbackSessionType];
          int v370 = [v448 isEqualToString:v369];

          if (v370) {
            goto LABEL_284;
          }
          v409 = [v43 leaseManager];
          [v409 setCanStealLeaseIfNeeded];

          v410 = [v43 player];
          [v410 pauseWithIdentifier:v44 completion:&__block_literal_global_638];

          v411 = [(_MPCMediaRemotePublisher *)val swift];
          v472[0] = MEMORY[0x263EF8330];
          v472[1] = 3221225472;
          v472[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_2_639;
          v472[3] = &unk_2643C59E0;
          id v473 = v43;
          id v217 = v217;
          id v474 = v217;
          id v475 = v45;
          [v411 performSetSessionWithEvent:v214 completion:v472];

          v279 = v473;
        }
        else
        {
          v275 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
          {
            double v276 = [v214 type];
            *(_DWORD *)v613 = 138543618;
            double v614 = v276;
            __int16 v615 = 2114;
            id v616 = spidb;
            _os_log_impl(&dword_21BB87000, v275, OS_LOG_TYPE_ERROR, "Unsupported sessionType [SetPlaybackSession] type=%{public}@ reason=%{public}@", v613, 0x16u);
          }
          uint64_t v277 = (void *)MEMORY[0x263F121D0];
          v278 = (void *)MEMORY[0x263F087E8];
          id v217 = [v214 type];
          v279 = objc_msgSend(v278, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Unsupported sessionType %@", v217);
          v280 = [v277 statusWithCode:200 error:v279];
          (*((void (**)(id, void *))v45 + 2))(v45, v280);
        }
LABEL_315:

        goto LABEL_43;
      case 134:
        v508[0] = MEMORY[0x263EF8330];
        v508[1] = 3221225472;
        v508[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_9_544;
        v508[3] = &unk_2643C55A8;
        id v509 = v434;
        id v510 = v45;
        [v509 performAllowingEditsToChangeCurrentItem:v508];

        goto LABEL_43;
      case 135:
        id v221 = v47;
        uint64_t v222 = [v221 queueEndAction];
        int v223 = [v43 disableAutoPlay];
        if (v222 == 3) {
          int v224 = v223;
        }
        else {
          int v224 = 0;
        }
        if (v224 == 1)
        {
          v225 = (void *)MEMORY[0x263F121D0];
          objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"playback engine autoplay disabled");
          v226 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v227 = [v225 statusWithCode:200 error:v226];
          (*((void (**)(id, void *))v45 + 2))(v45, v227);
        }
        else
        {
          id v281 = [v434 music];
          BOOL v282 = v281 == 0;

          if (v282)
          {
            v358 = (void *)MEMORY[0x263F121D0];
            v359 = (void *)MEMORY[0x263F087E8];
            unint64_t v360 = [v434 behaviorType];
            if (v360 >= 6)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"unknown/%lld", v360);
              v226 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v226 = off_2643BFBB8[v360];
            }
            v401 = objc_msgSend(v359, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"unsupported command [%@ behavior]", v226);
            v402 = [v358 statusWithCode:200 error:v401];
            (*((void (**)(id, void *))v45 + 2))(v45, v402);
          }
          else
          {
            unint64_t v283 = [v434 music];
            v284 = [v434 targetContentItemID];
            v504[0] = MEMORY[0x263EF8330];
            v504[1] = 3221225472;
            v504[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_11;
            v504[3] = &unk_2643BF9C0;
            v506 = (__CFString *)v45;
            BOOL v507 = v222 == 3;
            id v505 = v221;
            [v283 setAutoPlayEnabled:v222 == 3 targetContentItemID:v284 completion:v504];

            v226 = v506;
          }
        }

        goto LABEL_43;
      case 139:
        v465[0] = MEMORY[0x263EF8330];
        v465[1] = 3221225472;
        v465[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_673;
        v465[3] = &unk_2643BFA58;
        id v466 = v45;
        [(_MPCMediaRemotePublisher *)v48 _leaveSharedSessionWithCommandID:v44 completion:v465];

        goto LABEL_43;
      case 140:
        double v228 = [MEMORY[0x263F121D0] successStatus];
        (*((void (**)(id, void *))v45 + 2))(v45, v228);

        goto LABEL_43;
      case 142:
        double v229 = [v434 musicSharePlay];
        BOOL v230 = v229 == 0;

        if (v230)
        {
          id v323 = v47;
          int v324 = [v43 isVocalAttenuationEnabled];
          v325 = [v323 active];
          BOOL v326 = v325 == 0;

          if (!v326)
          {
            uint64_t v327 = [v323 active];
            objc_msgSend(v43, "setVocalAttenuationEnabled:", objc_msgSend(v327, "BOOLValue"));
          }
          int v328 = [v43 isVocalAttenuationEnabled];
          v329 = [v323 level];
          if (v329)
          {
            v330 = [v323 level];
            [v330 floatValue];
          }
          else
          {
            v330 = [MEMORY[0x263F12178] standardUserDefaults];
            [v330 defaultVocalLevel];
          }
          objc_msgSend(v43, "setVocalLevel:");

          if (v324 == v328)
          {
            v391 = [MEMORY[0x263F121D0] successStatus];
            (*((void (**)(id, void *))v45 + 2))(v45, v391);
          }
          else
          {
            [(_MPCMediaRemotePublisher *)val _updateSupportedCommands];
            v456[0] = MEMORY[0x263EF8330];
            v456[1] = 3221225472;
            v456[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_704;
            v456[3] = &unk_2643BFAD0;
            id v390 = v43;
            char v460 = v324;
            id v457 = v390;
            v458 = val;
            id v459 = v45;
            [v390 reloadQueueForReason:1 completion:v456];

            v391 = v457;
          }
        }
        else
        {
          v231 = (void *)MEMORY[0x263F121D0];
          v232 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Vocal attenuator is disabled in shared listening mode");
          unint64_t v233 = [v231 statusWithCode:200 error:v232];
          (*((void (**)(id, void *))v45 + 2))(v45, v233);
        }
        goto LABEL_43;
      case 143:
        uint64_t v241 = [v43 vocalAttenuationController];
        if (v241 && (BOOL v242 = v241[9] == 2, v241, v242))
        {
          BOOL v243 = [v43 vocalAttenuationController];
          -[MPCWhiskyController prepareForProcessing](v243);

          v244 = [MEMORY[0x263F121D0] successStatus];
          (*((void (**)(id, void *))v45 + 2))(v45, v244);
        }
        else
        {
          unint64_t v416 = [MEMORY[0x263F121D0] statusWithCode:0];
          (*((void (**)(id, void *))v45 + 2))(v45, v416);
        }
        goto LABEL_43;
      case 144:
        v245 = [v434 upNextBehavior];
        uint64_t v246 = [v43 queueController];
        v247 = [v246 targetContentItemID];
        [v245 clearAllItemsAfterContentItemID:v247];

        BOOL v248 = [MEMORY[0x263F121D0] successStatus];
        (*((void (**)(id, void *))v45 + 2))(v45, v248);

        goto LABEL_43;
      case 145:
        v234 = [(_MPCMediaRemotePublisher *)v48 swift];
        v453[0] = MEMORY[0x263EF8330];
        v453[1] = 3221225472;
        v453[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_711;
        v453[3] = &unk_2643C6110;
        id v455 = v45;
        id v454 = v47;
        [v234 performDialogActionForCommandEvent:v454 completion:v453];

        goto LABEL_43;
      default:
        if (v49 == 25020)
        {
          v80 = [v43 player];
          uint64_t v81 = [v80 currentItem];
          BOOL v82 = v81 == 0;

          if (v82)
          {
            v337 = (void *)MEMORY[0x263F121D0];
            v338 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2, @"Failed to share queue [no current item]");
            char v339 = [v337 statusWithCode:200 error:v338];
            (*((void (**)(id, void *))v45 + 2))(v45, v339);
          }
          else
          {
            v83 = [v434 musicSharePlay];
            BOOL v84 = v83 == 0;

            if (v84)
            {
              v363 = _MPCLogCategoryPlayback();
              v364 = v363;
              if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v363))
              {
                *(_WORD *)v613 = 0;
                _os_signpost_emit_with_name_impl(&dword_21BB87000, v364, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "shareQueue:getTracklist", "", v613, 2u);
              }

              v365 = [v434 music];
              v366 = [v434 targetContentItemID];
              v461[0] = MEMORY[0x263EF8330];
              v461[1] = 3221225472;
              v461[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_680;
              v461[3] = &unk_2643BFAA8;
              v464 = spid;
              id v463 = v45;
              id v462 = v47;
              [v365 getSharedQueueTracklistWithStartingContentItemID:v366 completion:v461];
            }
            else
            {
              v85 = (void *)MEMORY[0x263F121D0];
              v86 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Cannot get a shared queue tracklist [already in a shared queue] queueController=%@", v434);
              char v87 = [v85 statusWithCode:200 error:v86];
              (*((void (**)(id, void *))v45 + 2))(v45, v87);
            }
          }
        }
        else
        {
LABEL_90:
          v249 = _MPCLogCategoryPlayback();
          if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v613 = 138543618;
            double v614 = v433;
            __int16 v615 = 2114;
            id v616 = v44;
            _os_log_impl(&dword_21BB87000, v249, OS_LOG_TYPE_ERROR, "❗️Unsupported command: %{public}@ id=%{public}@", v613, 0x16u);
          }
LABEL_92:

          uint64_t v120 = (void *)MEMORY[0x263F121D0];
          v121 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Unsupported command event: %@", v47);
          v122 = [v120 statusWithCode:200 error:v121];
          (*((void (**)(id, void *))v45 + 2))(v45, v122);
        }
        goto LABEL_43;
    }
  }
  switch((int)v49)
  {
    case 0:
      v576[0] = MEMORY[0x263EF8330];
      v576[1] = 3221225472;
      v576[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_420;
      v576[3] = &unk_2643BF8A8;
      id v582 = v45;
      id v577 = v43;
      id v578 = v434;
      id v579 = v44;
      objc_copyWeak(&v583, &location);
      v580 = val;
      id v581 = v47;
      [(_MPCMediaRemotePublisher *)val becomeActiveIfNeededWithCommandID:v579 completion:v576];

      objc_destroyWeak(&v583);
      break;
    case 1:
    case 3:
      char v54 = [v43 player];
      v55 = [v54 currentItem];
      BOOL v56 = v55 == 0;

      if (v56)
      {
        v251 = (void *)MEMORY[0x263F121D0];
        uint64_t v252 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2, @"Cannot pause because there is no current item.");
        v253 = [v251 statusWithCode:100 error:v252];
        (*((void (**)(id, void *))v45 + 2))(v45, v253);
      }
      else
      {
        v57 = [v47 mediaRemoteOptions];
        v58 = [v57 objectForKeyedSubscript:@"MPCRemoteCommandEventOptionPauseFadeoutDurationKey"];
        [v58 doubleValue];
        double v60 = v59;

        v61 = [v43 player];
        v573[0] = MEMORY[0x263EF8330];
        v573[1] = 3221225472;
        v573[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5;
        v573[3] = &unk_2643C44B8;
        id v574 = v45;
        double v575 = v60;
        [v61 pauseWithFadeout:v44 identifier:v573 completion:v60];
      }
      break;
    case 2:
      v567[0] = MEMORY[0x263EF8330];
      v567[1] = 3221225472;
      v567[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6;
      v567[3] = &unk_2643BF8F8;
      id v572 = v45;
      id v568 = v43;
      id v569 = v44;
      v570 = v48;
      id v571 = v47;
      [(_MPCMediaRemotePublisher *)v48 becomeActiveIfNeededWithCommandID:v569 completion:v567];

      break;
    case 4:
    case 5:
      goto LABEL_45;
    case 6:
      v125 = [v434 music];
      uint64_t v126 = [v125 shuffleType];

      id v127 = v47;
      v128 = [v434 music];
      char v129 = [v434 targetContentItemID];
      v511[0] = MEMORY[0x263EF8330];
      v511[1] = 3221225472;
      v511[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_543;
      v511[3] = &unk_2643C1A48;
      id v513 = v45;
      BOOL v514 = v126 == 0;
      id v130 = v127;
      id v512 = v130;
      [v128 setShuffleType:v514 targetContentItemID:v129 completion:v511];

      break;
    case 7:
      v131 = [v434 music];
      uint64_t v132 = [v131 repeatType];

      id v133 = v47;
      v134 = [v434 music];
      if (v132) {
        uint64_t v135 = v132 == 2;
      }
      else {
        uint64_t v135 = 2;
      }
      v519[0] = MEMORY[0x263EF8330];
      v519[1] = 3221225472;
      v519[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_538;
      v519[3] = &unk_2643C1A48;
      id v521 = v45;
      uint64_t v522 = v135;
      id v136 = v133;
      id v520 = v136;
      [v134 setRepeatType:v135 completion:v519];

      break;
    case 8:
      v48->_hasBeganFastForward = 1;
      v549[0] = MEMORY[0x263EF8330];
      v549[1] = 3221225472;
      v549[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_485;
      v549[3] = &unk_2643C6110;
      v549[4] = v48;
      id v550 = v45;
      [v43 beginScanningWithDirection:1 identifier:v44 completion:v549];

      break;
    case 9:
    case 11:
      if (v48->_hasBeganRewind || v48->_hasBeganFastForward)
      {
        *(_WORD *)&v48->_hasBeganFastForward = 0;
        v69 = [v43 player];
        v547[0] = MEMORY[0x263EF8330];
        v547[1] = 3221225472;
        v547[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_8_492;
        v547[3] = &unk_2643C5830;
        id v548 = v45;
        [v69 endScanningWithIdentifier:v44 completion:v547];
      }
      else
      {
        v334 = (void *)MEMORY[0x263F121D0];
        v335 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2100, @"Attempting to stop scanning without scanning");
        v336 = [v334 statusWithCode:1007 error:v335];
        (*((void (**)(id, void *))v45 + 2))(v45, v336);
      }
      break;
    case 10:
      v48->_hasBeganRewind = 1;
      v551[0] = MEMORY[0x263EF8330];
      v551[1] = 3221225472;
      v551[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_6_481;
      v551[3] = &unk_2643C6110;
      v551[4] = v48;
      id v552 = v45;
      [v43 beginScanningWithDirection:0 identifier:v44 completion:v551];

      break;
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 23:
      goto LABEL_90;
    case 17:
      [v47 interval];
      v427[2]();
      break;
    case 18:
      [v47 interval];
      v429[2]();
      break;
    case 19:
      id v137 = v47;
      uint64_t v138 = [v434 behaviorType];
      [v137 playbackRate];
      float v140 = v139;
      if (v138 != 4) {
        goto LABEL_109;
      }
      v141 = [_MPCPodcastsPlaybackRateHelper alloc];
      v142 = [v43 player];
      [v142 currentRate];
      int v144 = v143;
      v145 = [v43 player];
      uint64_t v146 = [v145 state];
      LODWORD(v147) = v144;
      v148 = [(_MPCPodcastsPlaybackRateHelper *)v141 initWithCurrentRate:v146 playbackState:v147];

      if ([(_MPCPodcastsPlaybackRateHelper *)v148 canHandlePlaybackRateChangeForCommandEvent:v137])
      {
        [(_MPCPodcastsPlaybackRateHelper *)v148 updatedPlaybackRateForChangePlaybackRateCommandEvent:v137];
        float v140 = v149;

LABEL_109:
        id v150 = [v43 player];
        v467[0] = MEMORY[0x263EF8330];
        v467[1] = 3221225472;
        v467[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_669;
        v467[3] = &unk_2643BFA30;
        id v469 = v45;
        id v151 = v137;
        id v468 = v151;
        objc_copyWeak(&v470, &location);
        *(float *)&double v152 = v140;
        [v150 setRate:v44 identifier:v467 completion:v152];

        objc_destroyWeak(&v470);
      }
      else
      {
        v340 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v340, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v613 = 134349056;
          double v614 = v140;
          _os_log_impl(&dword_21BB87000, v340, OS_LOG_TYPE_DEBUG, "Rate is set to either min or max speed: %{public}f", v613, 0xCu);
        }

        v341 = [MEMORY[0x263F121D0] statusWithCode:1007];
        (*((void (**)(id, void *))v45 + 2))(v45, v341);
      }
      break;
    case 20:
      id v153 = v47;
      if (v442)
      {
        id v154 = v442;
      }
      else
      {
        uint64_t v298 = [v43 player];
        v299 = [v298 currentItem];
        id v154 = [v299 contentItemID];
      }
      v300 = [v43 queueController];
      id v301 = [v300 itemForContentItemID:v154];

      [v153 rating];
      objc_msgSend(v301, "setRating:");
      uint64_t v302 = [MEMORY[0x263F121D0] successStatus];
      (*((void (**)(id, void *))v45 + 2))(v45, v302);

      break;
    case 21:
      id v123 = v47;
      if (v442)
      {
        id v124 = v442;
      }
      else
      {
        v292 = [v43 player];
        uint64_t v293 = [v292 currentItem];
        id v124 = [v293 contentItemID];
      }
      v294 = [v43 queueController];
      v295 = [v294 itemForContentItemID:v124];

      if ([v123 isNegative])
      {
        if ([v295 likedState] != 2) {
          goto LABEL_214;
        }
        id v296 = [v123 userIdentity];
        [v295 setLikedState:1 forUserIdentity:v296];
      }
      else
      {
        if ([v295 likedState] == 2) {
          goto LABEL_214;
        }
        id v296 = [v123 userIdentity];
        [v295 setLikedState:2 forUserIdentity:v296];
      }

      [(_MPCMediaRemotePublisher *)val publishIfNeeded];
      goto LABEL_214;
    case 22:
      id v123 = v47;
      if (v442)
      {
        id v124 = v442;
      }
      else
      {
        v303 = [v43 player];
        v304 = [v303 currentItem];
        id v124 = [v304 contentItemID];
      }
      id v305 = [v43 queueController];
      v295 = [v305 itemForContentItemID:v124];

      if ([v123 isNegative])
      {
        if ([v295 likedState] != 3) {
          goto LABEL_214;
        }
        uint64_t v306 = [v123 userIdentity];
        [v295 setLikedState:1 forUserIdentity:v306];
      }
      else
      {
        if ([v295 likedState] == 3) {
          goto LABEL_214;
        }
        uint64_t v306 = [v123 userIdentity];
        [v295 setLikedState:3 forUserIdentity:v306];
      }

      [(_MPCMediaRemotePublisher *)val publishIfNeeded];
LABEL_214:
      v297 = [MEMORY[0x263F121D0] successStatus];
      (*((void (**)(id, void *))v45 + 2))(v45, v297);

      break;
    case 24:
      v155 = [v43 player];
      v446 = [v155 currentItem];

      if (v446)
      {
        id vala = v47;
        v156 = [vala nowPlayingContentItemID];
        BOOL v157 = v156 == 0;

        if (!v157)
        {
          v158 = [vala nowPlayingContentItemID];
          v159 = [v446 contentItemID];
          id v160 = v158;
          id v161 = v159;
          if (v160 == v161)
          {
          }
          else
          {
            id v162 = v161;
            char v163 = [v160 isEqual:v161];

            if ((v163 & 1) == 0)
            {
              uint64_t v164 = _MPCLogCategoryPlayback();
              if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
              {
                double v165 = [vala nowPlayingContentItemID];
                v166 = [v446 contentItemID];
                *(_DWORD *)v613 = 138543618;
                double v614 = v165;
                __int16 v615 = 2114;
                id v616 = v166;
                _os_log_impl(&dword_21BB87000, v164, OS_LOG_TYPE_ERROR, "❗️SeekToPlaybackPosition failed. Could not seek for non-current item id: %{public}@ [currentItem is %{public}@]", v613, 0x16u);
              }
              v167 = (void *)MEMORY[0x263F087E8];
              v168 = [vala nowPlayingContentItemID];
              v169 = [v446 contentItemID];
              v170 = objc_msgSend(v167, "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Cannot seek item (%@) with different current item (%@)", v168, v169);
              int v171 = objc_msgSend(v170, "mpc_remoteCommandStatus");
              (*((void (**)(id, void *))v45 + 2))(v45, v171);

              goto LABEL_291;
            }
          }
        }
        v542[0] = MEMORY[0x263EF8330];
        v542[1] = 3221225472;
        v542[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_499;
        v542[3] = &unk_2643BF970;
        id v378 = v43;
        id v543 = v378;
        id v544 = v44;
        id v379 = v45;
        id v546 = v379;
        id v308 = vala;
        id v545 = v308;
        spidc = (void (**)(void))_Block_copy(v542);
        v380 = [v308 referenceTime];
        if (v380)
        {
          v381 = [v308 referenceTime];
          [v381 doubleValue];

          v382 = [v378 transcriptAlignmentController];
          [v308 positionTime];
          double v384 = v383;
          v385 = [v308 referenceTime];
          [v385 doubleValue];
          double v387 = v386;
          v537[0] = MEMORY[0x263EF8330];
          v537[1] = 3221225472;
          v537[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_501;
          v537[3] = &unk_2643BF998;
          id v538 = v378;
          id v539 = v308;
          id v540 = v379;
          v388 = spidc;
          v541 = v388;
          [v382 resolveWith:v537 referenceTime:v384 completionHandler:v387];

          v168 = v543;
LABEL_291:

          break;
        }
        [v308 positionTime];
        spidc[2]();

        uint64_t v309 = v543;
      }
      else
      {
        v307 = (void *)MEMORY[0x263F121D0];
        objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2, @"Cannot jumpToTime without a current item.");
        id v308 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v309 = [v307 statusWithCode:100 error:v308];
        (*((void (**)(id, void *))v45 + 2))(v45, v309);
      }

      break;
    case 25:
      id v172 = v47;
      unint64_t v173 = [v172 repeatType];
      if (v173 >= 3)
      {
        v269 = (void *)MEMORY[0x263F121D0];
        int v175 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Unsupported repeatType %ld", v173);
        v270 = [v269 statusWithCode:200 error:v175];
        (*((void (**)(id, void *))v45 + 2))(v45, v270);
      }
      else
      {
        v174 = [v434 music];
        v523[0] = MEMORY[0x263EF8330];
        v523[1] = 3221225472;
        v523[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_5_531;
        v523[3] = &unk_2643C1A48;
        id v525 = v45;
        unint64_t v526 = v173;
        id v524 = v172;
        [v174 setRepeatType:v173 completion:v523];

        int v175 = v525;
      }

      break;
    case 26:
      id v176 = v47;
      uint64_t v177 = [v176 shuffleType];
      v178 = [v434 music];
      v179 = [v434 targetContentItemID];
      v515[0] = MEMORY[0x263EF8330];
      v515[1] = 3221225472;
      v515[2] = __60___MPCMediaRemotePublisher__performCommandEvent_completion___block_invoke_7_539;
      v515[3] = &unk_2643C1A48;
      id v517 = v45;
      uint64_t v518 = v177;
      id v180 = v176;
      id v516 = v180;
      [v178 setShuffleType:v177 targetContentItemID:v179 completion:v515];

      break;
    default:
      JUMPOUT(0);
  }
LABEL_43:

LABEL_44:
  objc_destroyWeak(v607);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (void)_beginBackgroundTaskUntilPlayCommandWithCommand:(id)a3 timeout:(double)a4
{
  id v6 = _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext((uint64_t)"-[_MPCMediaRemotePublisher _beginBackgroundTaskUntilPlayCommandWithCommand:timeout:]", a3);
  id v7 = objc_alloc(MEMORY[0x263F54ED0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84___MPCMediaRemotePublisher__beginBackgroundTaskUntilPlayCommandWithCommand_timeout___block_invoke;
  v11[3] = &unk_2643BF790;
  id v12 = v6;
  id v8 = v6;
  int v9 = (MSVBlockGuard *)[v7 initWithTimeout:v11 interruptionHandler:a4];
  setPlaybackQueueExtendedTimeGuard = self->_setPlaybackQueueExtendedTimeGuard;
  self->_setPlaybackQueueExtendedTimeGuard = v9;
}

- (void)_performDebugEvent:(id)a3 completion:(id)a4
{
  __int16 v29 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v8 = [v6 mediaRemoteOptions];

  int v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F54D30]];

  id v10 = v9;
  uint64_t v11 = v10;
  if (v10 == @"com.apple.Music.performance"
    || (int v12 = [(__CFString *)v10 isEqual:@"com.apple.Music.performance"], v11, v12))
  {
    lastPerformanceMetrics = self->_lastPerformanceMetrics;
    if (lastPerformanceMetrics)
    {
      uint64_t v14 = [MEMORY[0x263F08900] dataWithJSONObject:lastPerformanceMetrics options:0 error:0];
      if (!v14)
      {
        int v15 = [MEMORY[0x263F121D0] statusWithCode:100];
        v29[2](v29, v15);
      }
      id v16 = [MEMORY[0x263F121D0] statusWithCode:0 customData:v14 type:@"com.public.json"];
      v29[2](v29, v16);
      goto LABEL_18;
    }
    uint32_t v24 = (void *)MEMORY[0x263F121D0];
    uint64_t v25 = 100;
LABEL_15:
    uint64_t v14 = [v24 statusWithCode:v25];
    v29[2](v29, v14);
    goto LABEL_19;
  }
  id v17 = v11;
  if (v17 != @"com.apple.Music.queue")
  {
    uint64_t v18 = v17;
    int v19 = [(__CFString *)v17 isEqual:@"com.apple.Music.queue"];

    if (!v19)
    {
      uint64_t v26 = v18;
      if (v26 != @"com.apple.Music.events")
      {
        double v27 = v26;
        [(__CFString *)v26 isEqual:@"com.apple.Music.events"];
      }
      uint32_t v24 = (void *)MEMORY[0x263F121D0];
      uint64_t v25 = 200;
      goto LABEL_15;
    }
  }
  long long v20 = [v7 queueController];
  uint64_t v14 = v20;
  if (v20)
  {
    id v16 = [v20 debugDescription];
    uint64_t v21 = (void *)MEMORY[0x263F121D0];
    id v22 = [v16 dataUsingEncoding:4];
    os_signpost_id_t v23 = [v21 statusWithCode:0 customData:v22 type:@"com.public.text"];
    v29[2](v29, v23);
  }
  else
  {
    double v28 = (void *)MEMORY[0x263F121D0];
    id v16 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2, @"No queueController");
    id v22 = [v28 statusWithCode:100 error:v16];
    v29[2](v29, v22);
  }

LABEL_18:
LABEL_19:
}

- (void)_enqueueFallbackIntentIfNeededForCommandEvent:(id)a3 play:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  uint64_t v11 = [v8 contextID];
  if (!v11) {
    goto LABEL_8;
  }
  int v12 = (void *)v11;
  id v13 = [v8 contextID];
  uint64_t v14 = [v10 queueController];
  id v15 = [v14 sessionID];
  if (v13 == v15)
  {

    goto LABEL_8;
  }
  id v16 = v15;
  char v17 = [v13 isEqual:v15];

  if (v17)
  {
LABEL_8:
    int v19 = 1;
    goto LABEL_9;
  }
  uint64_t v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent not using fallback intent [contextID does not match queueController.sessionID]", buf, 2u);
  }

  int v19 = 0;
LABEL_9:
  long long v20 = [v8 mediaRemoteOptions];
  uint64_t v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F54CC8]];
  int v22 = [v21 BOOLValue];

  if (v22)
  {
    os_signpost_id_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent not using fallback intent [command option to disable]", buf, 2u);
    }

    int v19 = 0;
  }
  uint64_t v24 = [v10 fallbackPlaybackIntent];
  uint64_t v25 = (void *)v24;
  if (v19 && v24)
  {
    uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[Publisher] _enqueueFallbackIntentIfNeededForCommandEvent attempting reload with fallback playback context", buf, 2u);
    }

    if (v6) {
      uint64_t v27 = 20;
    }
    else {
      uint64_t v27 = 10;
    }
    [v25 setActionAfterQueueLoad:v27];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __90___MPCMediaRemotePublisher__enqueueFallbackIntentIfNeededForCommandEvent_play_completion___block_invoke;
    v31[3] = &unk_2643C5830;
    id v32 = v9;
    [(_MPCMediaRemotePublisher *)self performSetQueueWithIntent:v25 completion:v31];
    double v28 = v32;
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x263F121D0];
    double v28 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 1, @"Failing due to no content in the player and no fallback intent.");
    id v30 = [v29 statusWithCode:100 error:v28];
    (*((void (**)(id, void *))v9 + 2))(v9, v30);
  }
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  id v5 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v4 = [v5 player];
  [v4 deactivateAudioSessionIfIdle:a3];
}

- (void)becomeActiveIfNeededWithCommandID:(id)a3 completion:(id)a4
{
  v70[2] = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v33 = a4;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v66[3] = 0;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SessionActivation", "", buf, 2u);
  }

  uint64_t v11 = MSVNanoIDCreateTaggedPointer();
  int v12 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v13 = [v12 eventStream];
  v69[0] = @"session-activation-id";
  v69[1] = @"session-activation-command-id";
  v70[0] = v11;
  uint64_t v14 = v34;
  if (!v34)
  {
    uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  }
  v70[1] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  [v13 emitEventType:@"session-activation-begin" payload:v15];

  if (!v34) {
  id v16 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  }
  char v17 = [v16 delegate];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke;
  aBlock[3] = &unk_2643BF590;
  id v18 = v17;
  id v62 = v18;
  v64 = v67;
  id v19 = v16;
  id v63 = v19;
  long long v20 = _Block_copy(aBlock);
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_5;
  v57[3] = &unk_2643BF5E0;
  id v21 = v18;
  id v58 = v21;
  double v60 = v67;
  id v22 = v19;
  id v59 = v22;
  os_signpost_id_t v23 = _Block_copy(v57);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_9;
  v51[3] = &unk_2643BF630;
  id v24 = v22;
  id v52 = v24;
  char v53 = self;
  char v54 = v68;
  v55 = v66;
  SEL v56 = a2;
  uint64_t v25 = _Block_copy(v51);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_2_157;
  v44[3] = &unk_2643BF658;
  v44[4] = self;
  os_signpost_id_t v50 = v8;
  id v26 = v11;
  id v45 = v26;
  id v47 = v66;
  v48 = v68;
  uint64_t v49 = v67;
  id v27 = v33;
  id v46 = v27;
  double v28 = _Block_copy(v44);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_159;
  v39[3] = &unk_2643BF6D0;
  id v40 = v25;
  id v41 = v28;
  id v42 = v23;
  id v29 = v20;
  id v43 = v29;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __73___MPCMediaRemotePublisher_becomeActiveIfNeededWithCommandID_completion___block_invoke_7_168;
  v35[3] = &unk_2643BF6F8;
  id v30 = v42;
  id v36 = v30;
  id v31 = v40;
  id v37 = v31;
  id v32 = v41;
  id v38 = v32;
  (*((void (**)(id, void *, void *))v20 + 2))(v29, v39, v35);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v68, 8);
}

- (void)_activeSharedSessionDidChange:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54838]];

  if ([v4 isHosted] && (objc_msgSend(v4, "isPlaceholder") & 1) == 0)
  {
    id v5 = [v4 identifier];
  }
  else
  {
    id v5 = 0;
  }
  id v7 = v5;
  id v6 = v5;
  msv_dispatch_on_main_queue();
}

- (void)_durationAvailableNotification:(id)a3
{
  v32[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_MPCMediaRemotePublisher *)self publishIfNeeded];
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 object];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    id v9 = [WeakRetained queueController];
    id v10 = [v9 currentItem];
    if (v7 == v10)
    {
      [v7 durationIfAvailable];

      uint64_t v11 = [v7 modelGenericObject];
      int v12 = [v11 flattenedGenericObject];
      id v13 = [v12 anyObject];
      id WeakRetained = [v13 identifiers];

      uint64_t v14 = [v7 queueSectionID];
      uint64_t v15 = [v7 queueItemID];
      double v28 = [v7 playbackInfo];
      objc_msgSend(v7, "_expectedStopTimeWithPlaybackInfo:");
      double v17 = v16;
      id v27 = [(_MPCMediaRemotePublisher *)self playbackEngine];
      id v18 = [v27 eventStream];
      v31[0] = @"item-ids";
      id v19 = WeakRetained;
      if (!WeakRetained)
      {
        id v19 = [MEMORY[0x263EFF9D0] null];
      }
      v32[0] = v19;
      v32[1] = v14;
      v31[1] = @"queue-section-id";
      v31[2] = @"queue-item-id";
      v32[2] = v15;
      v31[3] = @"item-metadata";
      v29[0] = @"item-duration";
      long long v20 = NSNumber;
      objc_msgSend(v7, "durationIfAvailable", v14);
      id v21 = objc_msgSend(v20, "numberWithDouble:");
      v29[1] = @"item-end-boundary";
      v30[0] = v21;
      id v22 = [NSNumber numberWithDouble:v17];
      v30[1] = v22;
      [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      v24 = os_signpost_id_t v23 = (void *)v15;
      v32[3] = v24;
      uint64_t v25 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
      [v18 emitEventType:@"item-update" payload:v25];

      if (!WeakRetained) {
    }
      }
    else
    {
    }
  }
}

- (void)_commandEventDidTimeoutNotification:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  commandCenter = self->_commandCenter;
  id v7 = [v5 command];
  LODWORD(commandCenter) = [(MPRemoteCommandCenter *)commandCenter containsCommand:v7];

  if (commandCenter)
  {
    os_signpost_id_t v8 = [(_MPCMediaRemotePublisher *)self playbackEngine];
    id v9 = [v8 eventStream];
    v16[0] = @"remote-control-id";
    id v10 = [v5 commandID];
    v16[1] = @"remote-control-status";
    v17[0] = v10;
    uint64_t v11 = [v4 userInfo];
    int v12 = [v11 objectForKeyedSubscript:@"status"];
    uint64_t v15 = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    v17[1] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v9 emitEventType:@"remote-control-timeout" payload:v14];
  }
}

- (void)commandCenter:(id)a3 didTimeoutCommandEvent:(id)a4 statusHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v10 = [v9 eventStream];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79___MPCMediaRemotePublisher_commandCenter_didTimeoutCommandEvent_statusHandler___block_invoke;
  v13[3] = &unk_2643BF4F0;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 performQuery:v13];
}

- (void)nowPlayingInfoCenter:(id)a3 didEndLyricsEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 startDate];
    id v8 = [v5 endDate];
    id v9 = [v5 token];
    id v10 = [v9 identifier];
    id v11 = [v5 token];
    id v12 = [v11 userInfo];
    int v29 = 138544130;
    double v30 = *(double *)&v7;
    __int16 v31 = 2114;
    id v32 = v8;
    __int16 v33 = 2114;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v12;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_INFO, "Lyrics end event: %{public}@ - %{public}@, ID = %{public}@, Info = %{public}@", (uint8_t *)&v29, 0x2Au);
  }
  id v13 = [v5 endDate];
  id v14 = [v5 startDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 > 0.0)
  {
    double v17 = [v5 token];
    id v18 = [(_MPCMediaRemotePublisher *)self playbackEngine];
    id v19 = [v17 identifier];

    if (!v19)
    {
      long long v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138543362;
        double v30 = *(double *)&v17;
        _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "Lyrics end event: missing lyrics identifier. Token = %{public}@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_18;
    }
    long long v20 = [v18 queueController];
    id v21 = [v17 identifier];
    id v22 = [v20 itemForContentItemID:v21];

    if (v22)
    {
      os_signpost_id_t v23 = [v22 modelGenericObject];
      id v24 = [v23 flattenedGenericObject];

      if (v24 && [v24 type] == 1)
      {
        uint64_t v25 = objc_alloc_init(MPCReportingLyricsViewEvent);
        id v26 = [v24 song];
        [(MPCReportingLyricsViewEvent *)v25 setModelSong:v26];

        id v27 = [v22 modelPlayEvent];
        [(MPCReportingLyricsViewEvent *)v25 setModelPlayEvent:v27];

        [(MPCReportingLyricsViewEvent *)v25 setFeatureName:@"now_playing"];
        [(MPCReportingLyricsViewEvent *)v25 setVisibleDuration:v16];
        [(MPCReportingLyricsViewEvent *)v25 setSourceType:1];
        double v28 = [v18 reportingController];
        [v28 recordLyricsViewEvent:v25];
        goto LABEL_16;
      }
    }
    else
    {
      id v24 = 0;
    }
    uint64_t v25 = (MPCReportingLyricsViewEvent *)os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(&v25->super, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    double v28 = [v17 identifier];
    int v29 = 138543362;
    double v30 = *(double *)&v28;
    _os_log_impl(&dword_21BB87000, &v25->super, OS_LOG_TYPE_ERROR, "Lyrics end event: no song found for contentItemID %{public}@", (uint8_t *)&v29, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  double v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v29 = 134349056;
    double v30 = v16;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "Lyrics end event: invalid duration for reporting. Duration = %{public}g", (uint8_t *)&v29, 0xCu);
  }
LABEL_19:
}

- (void)nowPlayingInfoCenter:(id)a3 didBeginLyricsEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 startDate];
    id v7 = [v4 token];
    id v8 = [v7 identifier];
    id v9 = [v4 token];
    id v10 = [v9 userInfo];
    int v11 = 138543874;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    double v16 = v10;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_INFO, "Lyrics begin event: %{public}@, Lyrics ID = %{public}@, Info = %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)invalidateQueueTypesWithReason:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[Publisher] invalidateQueueTypesWithReason [] reason=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(_MPCMediaRemotePublisher *)self _updateSupportedCommands];
  [(_MPCMediaRemotePublisher *)self _updateLaunchCommands];
}

- (void)engineDidBlockVocalAttenuation:(id)a3
{
  id v4 = a3;
  if ([v4 isVocalAttenuationEnabled])
  {
    [v4 setVocalAttenuationEnabled:0];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    id v7 = __59___MPCMediaRemotePublisher_engineDidBlockVocalAttenuation___block_invoke;
    uint64_t v8 = &unk_2643C4B00;
    id v9 = v4;
    id v10 = self;
    [v9 reloadQueueForReason:1 completion:&v5];
  }
  [(_MPCMediaRemotePublisher *)self _updateSupportedCommands];
}

- (void)engineDidResetMediaServices:(id)a3
{
  self->_mediaServerAvailable = 1;
}

- (void)engineDidLoseMediaServices:(id)a3
{
  self->_mediaServerAvailable = 0;
}

- (void)engine:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4
{
  uint64_t v6 = [(MPRemoteCommandCenter *)self->_commandCenter changeQueueEndActionCommand];
  [v6 setCurrentQueueEndAction:a4];

  [(_MPCMediaRemotePublisher *)self _updateSupportedCommands];
}

- (void)engine:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v5 = [(MPRemoteCommandCenter *)self->_commandCenter changeShuffleModeCommand];
  [v5 setCurrentShuffleType:a4];
}

- (void)engine:(id)a3 didChangeRepeatType:(int64_t)a4
{
  id v5 = [(MPRemoteCommandCenter *)self->_commandCenter changeRepeatModeCommand];
  [v5 setCurrentRepeatType:a4];
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating playback queue because %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(MPNowPlayingInfoCenter *)self->_infoCenter invalidatePlaybackQueue];
  [(_MPCMediaRemotePublisher *)self publishIfNeeded];
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
}

- (void)_leaveSharedSessionWithCommandID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  int v7 = [v6 queueController];
  id v8 = [v7 musicSharePlay];

  if (v8)
  {
    uint64_t v9 = [v7 musicSharePlay];
    [v9 endSynchronizedPlayback];

    id v10 = [v6 sessionManager];
    int v11 = [v10 stateRestorationSessionIdentifier];

    if ([v11 length])
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke;
      v18[3] = &unk_2643C6110;
      v18[4] = self;
      id v19 = v5;
      [v6 loadSessionWithIdentifier:v11 completion:v18];
      id v12 = v19;
    }
    else
    {
      __int16 v15 = objc_opt_new();
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      void v16[2] = __72___MPCMediaRemotePublisher__leaveSharedSessionWithCommandID_completion___block_invoke_3;
      v16[3] = &unk_2643C5830;
      id v17 = v5;
      [(_MPCMediaRemotePublisher *)self performSetQueue:v15 completion:v16];

      id v12 = v17;
    }
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x263F121D0];
    int v11 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 5, @"Cannot leave shared session [not in shared session] queueController=%@", v7);
    id v14 = [v13 statusWithCode:200 error:v11];
    (*((void (**)(id, void *))v5 + 2))(v5, v14);
  }
}

- (void)leaveSharedSessionWithCommandID:(id)a3 remoteControlInterface:(id)a4 completion:(id)a5
{
  v24[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 length])
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_MPCMediaRemotePublisher.m", 361, @"Invalid parameter not satisfying: %@", @"commandID.length > 0" object file lineNumber description];
  }
  if (![v10 length])
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_MPCMediaRemotePublisher.m", 362, @"Invalid parameter not satisfying: %@", @"remoteControlInterface.length > 0" object file lineNumber description];
  }
  id v12 = [(MPRemoteCommandCenter *)self->_commandCenter leaveSharedPlaybackSessionCommand];
  id v13 = objc_alloc(MEMORY[0x263F121B8]);
  uint64_t v14 = [v12 mediaRemoteCommandType];
  uint64_t v15 = *MEMORY[0x263F54D60];
  v23[0] = *MEMORY[0x263F54C88];
  v23[1] = v15;
  v24[0] = v9;
  v24[1] = v10;
  double v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v17 = (void *)[v13 initWithCommand:v12 mediaRemoteType:v14 options:v16];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94___MPCMediaRemotePublisher_leaveSharedSessionWithCommandID_remoteControlInterface_completion___block_invoke;
  v21[3] = &unk_2643C56A8;
  id v22 = v11;
  id v18 = v11;
  [v12 invokeCommandWithEvent:v17 completion:v21];
}

- (id)getQOSDialogForError:(id)a3 withItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_MPCMediaRemotePublisher *)self swift];
  id v9 = [v8 getSwiftQOSDialogForError:v7 withItem:v6];

  return v9;
}

- (void)reportUserBackgroundedApplication
{
  id v5 = [(MPRemoteCommandCenter *)self->_commandCenter pauseCommand];
  id v3 = [(MPRemoteCommandCenter *)self->_commandCenter pauseCommand];
  id v4 = (void *)[v3 newCommandEvent];
  [v5 invokeCommandWithEvent:v4 completion:&__block_literal_global_3839];
}

- (void)dealloc
{
  +[MPCQueueController unregisterPublisher:self];
  id v3 = +[MPCPlaybackAccountManager sharedManager];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_MPCMediaRemotePublisher;
  [(_MPCMediaRemotePublisher *)&v4 dealloc];
}

- (void)nowPlayingInfoCenter:(id)a3 didEndMigrationWithIdentifier:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
    {
      int v18 = 134218498;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "MPCMediaRemotePublisher: %p -  [Lease] - Session migration did end with error [Stealing the lease back] - identifier:%{public}@ - error:%{public}@", (uint8_t *)&v18, 0x20u);
    }

    id v12 = [v9 leaseManager];
    [v12 setCanStealLeaseIfNeeded];

    id v13 = [v9 player];
    uint64_t v14 = [v13 currentItem];
    [v14 prepareForRate:0 completionHandler:0.0];

    id v10 = [v9 player];
    uint64_t v15 = [v10 currentItem];
    LODWORD(v16) = 1.0;
    [v15 prepareForRate:0 completionHandler:v16];
  }
  else if (v11)
  {
    int v18 = 134218242;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "MPCMediaRemotePublisher: %p -  [Lease] - Session migration did end - identifier:%{public}@", (uint8_t *)&v18, 0x16u);
  }

  id v17 = [v9 leaseManager];
  [v17 endIgnoringLeaseEndEventsForReason:v7];
}

- (void)nowPlayingInfoCenter:(id)a3 willBeginSessionMigrationWithIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "MPCMediaRemotePublisher: %p - [Lease] - Session migration will begin - identifier:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v8 = [v7 leaseManager];
  [v8 beginIgnoringLeaseEndEventsForReason:v5];
}

- (void)nowPlayingInfoCenter:(id)a3 getTransportablePlaybackSessionRepresentationForRequest:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __131___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_getTransportablePlaybackSessionRepresentationForRequest_completion___block_invoke;
  block[3] = &unk_2643C5620;
  id v12 = v7;
  id v13 = v8;
  void block[4] = self;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (id)nowPlayingInfoCenter:(id)a3 childContentItemIDAtIndex:(int64_t)a4 ofItem:(id)a5
{
  id v7 = objc_msgSend(a5, "identifier", a3);
  id v8 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v9 = [v8 queueController];

  id v10 = [v9 itemForContentItemID:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    id v12 = [v11 chapters];
    unint64_t v13 = [v12 count];

    if (v13 <= a4)
    {
      double v16 = 0;
    }
    else
    {
      uint64_t v14 = [v11 chapters];
      uint64_t v15 = [v14 objectAtIndex:a4];

      double v16 = [v15 identifier];
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (id)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:1];
  id v12 = [v9 identifier];
  unint64_t v13 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  uint64_t v14 = [v13 queueController];

  uint64_t v15 = [v14 itemForContentItemID:v12];
  if (objc_opt_respondsToSelector()) {
    id v16 = (id)[v15 nowPlayingInfoCenter:v8 lyricsForContentItem:v9 completion:v10];
  }
  else {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }

  return v11;
}

- (id)nowPlayingInfoCenter:(id)a3 transcriptAlignmentsForContentItem:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *, void))a5;
  id v8 = (void *)MEMORY[0x263F08AB8];
  id v9 = a4;
  id v10 = [v8 progressWithTotalUnitCount:1];
  id v11 = [v9 identifier];

  id v12 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  unint64_t v13 = [v12 queueController];
  uint64_t v14 = [v13 currentItem];
  uint64_t v15 = [v14 contentItemID];
  if ([v15 isEqualToString:v11])
  {
    id v16 = [v12 transcriptAlignmentController];

    if (v16)
    {
      id v17 = [v12 transcriptAlignmentController];
      [v17 startProcessing];

      int v18 = [v12 transcriptAlignmentController];
      id v19 = [v18 transcriptAlignments];
      v7[2](v7, v19, 0);

      [v10 setCompletedUnitCount:1];
      goto LABEL_6;
    }
  }
  else
  {
  }
  __int16 v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Content item not found");
  ((void (**)(id, void *, void *))v7)[2](v7, 0, v20);

LABEL_6:

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 infoForContentItem:(id)a4 completion:(id)a5
{
  id v7 = (void *)MEMORY[0x263F08AB8];
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = a4;
  id v10 = [v7 progressWithTotalUnitCount:1];
  id v11 = [v9 identifier];

  id v12 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  unint64_t v13 = [v12 queueController];

  uint64_t v14 = [v13 itemForContentItemID:v11];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = [v14 itemDescription];
    v8[2](v8, v16, 0);

    [v10 setCompletedUnitCount:1];
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 3, @"Content item not found");
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v17);
  }

  return v10;
}

- (id)nowPlayingInfoCenter:(id)a3 remoteArtworkForContentItem:(id)a4 format:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (id)*MEMORY[0x263F11B80];
  if (v15 == v13)
  {

    goto LABEL_5;
  }
  id v16 = v15;
  int v17 = [v13 isEqual:v15];

  if (v17)
  {
LABEL_5:
    id v19 = [(_MPCMediaRemotePublisher *)self nowPlayingInfoCenter:v11 artworkCatalogForContentItem:v12];
    [v19 setCacheIdentifier:@"exportables" forCacheReference:self];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __115___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_remoteArtworkForContentItem_format_size_completion___block_invoke;
    v21[3] = &unk_2643BFB48;
    id v22 = v14;
    [v19 requestExportableArtworkPropertiesWithCompletion:v21];

    goto LABEL_6;
  }
  int v18 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 29, @"request for unknown remote artwork format: %@", v13);
  (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v18);

LABEL_6:
  return 0;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x263F08AB8];
  id v13 = a4;
  id v14 = a3;
  id v15 = [v12 progressWithTotalUnitCount:1];
  id v16 = [(_MPCMediaRemotePublisher *)self nowPlayingInfoCenter:v14 artworkCatalogForContentItem:v13];

  if (v16)
  {
    [v16 setCacheIdentifier:@"images" forCacheReference:self];
    objc_msgSend(v16, "setFittingSize:", width, height);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __102___MPCMediaRemotePublisher_PlaybackQueue__nowPlayingInfoCenter_artworkForContentItem_size_completion___block_invoke;
    v19[3] = &unk_2643BFB20;
    id v21 = v11;
    id v20 = v15;
    [v16 requestImageWithCompletion:v19];
  }
  else
  {
    Error = (void *)MRMediaRemoteCreateError();
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, Error);
  }

  return v15;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  id v5 = [(_MPCMediaRemotePublisher *)self playbackEngine];
  id v6 = [v5 queueController];

  id v7 = [v6 contentItemIDWithCurrentItemOffset:a4 mode:1 didReachEnd:0];

  return v7;
}

@end