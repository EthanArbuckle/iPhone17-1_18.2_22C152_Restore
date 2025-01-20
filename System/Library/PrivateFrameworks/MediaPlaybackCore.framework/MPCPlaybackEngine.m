@interface MPCPlaybackEngine
+ (BOOL)isRemotePlayerService;
+ (BOOL)isSystemMusic;
+ (BOOL)isSystemPodcasts;
+ (BOOL)supportsVideoViewController;
+ (void)preheatPlayback;
- (BOOL)_shouldIgnorePlaybackSessionError:(id)a3;
- (BOOL)disableAutoPlay;
- (BOOL)disableRepeat;
- (BOOL)disableShuffle;
- (BOOL)hasScheduledPlaybackStatePreservation;
- (BOOL)isAudioAnalyzerEnabled;
- (BOOL)isPictureInPictureSupported;
- (BOOL)isQueueHandoffSupported;
- (BOOL)isRestoringPlaybackState;
- (BOOL)isStarted;
- (BOOL)isStateRestorationSupported;
- (BOOL)isSystemMusicApplication;
- (BOOL)isSystemPodcastsApplication;
- (BOOL)isVideoSupported;
- (BOOL)isVocalAttenuationAvailable;
- (BOOL)isVocalAttenuationEnabled;
- (BOOL)needsUISnapshot;
- (BOOL)skipWithDirectionShouldJumpToItemStart:(int64_t)a3;
- (MPAVRoute)pickedRoute;
- (MPAVRoutingController)routingController;
- (MPCAudioSpectrumAnalyzer)audioAnalyzer;
- (MPCPlaybackEngine)initWithParameters:(id)a3;
- (MPCPlaybackEngine)initWithPlayerID:(id)a3;
- (MPCPlaybackEngineActiveItem)activeItem;
- (MPCPlaybackEngineDelegate)delegate;
- (MPCPlaybackEngineEventStream)eventStream;
- (MPCPlaybackEngineInitializationParameters)initializationParameters;
- (MPCPlaybackIntent)fallbackPlaybackIntent;
- (MPCQueueController)queueController;
- (MPCVideoOutput)videoOutput;
- (MPCWhiskyController)vocalAttenuationController;
- (NSString)audioSessionCategory;
- (NSString)description;
- (NSString)engineID;
- (NSString)hostingSharedSessionID;
- (NSString)playerID;
- (NSString)targetContentItemID;
- (NSXPCListenerEndpoint)serverEndpoint;
- (_MPCLeaseManager)leaseManager;
- (_MPCMediaRemotePublisher)mediaRemotePublisher;
- (_MPCMusicPlayerControllerServer)musicPlayerControllerServer;
- (_MPCPlaybackEngineEventObserving)eventObserver;
- (_MPCPlaybackEnginePlayer)player;
- (_MPCPlaybackEngineSessionManager)sessionManager;
- (_MPCReportingController)reportingController;
- (_MPCSleepTimerController)sleepTimerController;
- (_MPCTranscriptAlignmentController)transcriptAlignmentController;
- (double)currentAudioProcessingDelay;
- (double)mapPlaybackTimeToUserTime:(double)a3;
- (double)mapUserTimeToPlaybackTime:(double)a3;
- (float)relativeVolume;
- (float)vocalLevel;
- (id)swiftStorage;
- (unint64_t)audioSessionOptions;
- (void)_detectCrashLoopForSessionIdentifier:(id)a3 block:(id)a4;
- (void)_initializePlaybackStack;
- (void)addEngineObserver:(id)a3;
- (void)becomeActive;
- (void)beginScanningWithDirection:(int64_t)a3 identifier:(NSString *)a4 completion:(id)a5;
- (void)behavior:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4;
- (void)behavior:(id)a3 didChangeExplicitContentState:(int64_t)a4;
- (void)behavior:(id)a3 didChangeRepeatType:(int64_t)a4;
- (void)behavior:(id)a3 didChangeShuffleType:(int64_t)a4;
- (void)behavior:(id)a3 didEndSharePlaySessionWithReason:(int64_t)a4;
- (void)behavior:(id)a3 didReceiveSharedListeningEvent:(id)a4;
- (void)dealloc;
- (void)initializeSwiftStack;
- (void)invalidate;
- (void)loadSessionWithIdentifier:(NSString *)a3 completion:(id)a4;
- (void)queueController:(id)a3 didChangeTargetContentItemID:(id)a4;
- (void)queueController:(id)a3 didDetectMismatchForActiveContentItemID:(id)a4 targetContentItemID:(id)a5;
- (void)queueControllerDidChangeContents:(id)a3;
- (void)queueControllerDidReachUnexpectedEndOfQueue:(id)a3;
- (void)relativeVolumeDidUpdateToVolume:(float)a3;
- (void)reloadQueueForReason:(int64_t)a3 completion:(id)a4;
- (void)removeEngineObserver:(id)a3;
- (void)reportUserBackgroundedApplication;
- (void)requestAuthorizationForExplicitItem:(id)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)restoreStateWithCompletion:(id)a3;
- (void)routingController:(id)a3 pickedRouteDidChange:(id)a4;
- (void)schedulePlaybackStatePreservation;
- (void)setAudioAnalyzerEnabled:(BOOL)a3;
- (void)setAudioSessionCategory:(id)a3;
- (void)setAudioSessionOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAutoPlay:(BOOL)a3;
- (void)setDisableRepeat:(BOOL)a3;
- (void)setDisableShuffle:(BOOL)a3;
- (void)setFallbackPlaybackIntent:(id)a3;
- (void)setNeedsUISnapshot:(BOOL)a3;
- (void)setPictureInPictureSupported:(BOOL)a3;
- (void)setQueueController:(id)a3;
- (void)setQueueHandoffSupported:(BOOL)a3;
- (void)setRelativeVolume:(float)a3;
- (void)setRestoringPlaybackState:(BOOL)a3;
- (void)setScheduledPlaybackStatePreservation:(BOOL)a3;
- (void)setStateRestorationSupported:(BOOL)a3;
- (void)setSwiftStorage:(id)a3;
- (void)setVideoSupported:(BOOL)a3;
- (void)setVocalAttenuationEnabled:(BOOL)a3;
- (void)setVocalLevel:(float)a3;
- (void)start;
@end

@implementation MPCPlaybackEngine

- (BOOL)isSystemPodcastsApplication
{
  v2 = objc_opt_class();

  return [v2 isSystemPodcasts];
}

+ (BOOL)isSystemPodcasts
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication();

  return IsSystemPodcastApplication;
}

+ (BOOL)isSystemMusic
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

  return IsSystemMediaApplication;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return self->_eventStream;
}

- (id)swiftStorage
{
  return self->_swiftStorage;
}

- (void)setSwiftStorage:(id)a3
{
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_144(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "StateRestore-Load", "", v7, 2u);
  }

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3 == 0, v3);
}

- (void)setVideoSupported:(BOOL)a3
{
  self->_videoSupported = a3;
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (void)becomeActive
{
}

- (MPCQueueController)queueController
{
  return self->_queueController;
}

- (_MPCPlaybackEnginePlayer)player
{
  return self->_player;
}

- (NSString)engineID
{
  return self->_engineID;
}

- (_MPCLeaseManager)leaseManager
{
  return self->_leaseManager;
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (BOOL)isVideoSupported
{
  return self->_videoSupported;
}

- (BOOL)isPictureInPictureSupported
{
  return self->_pictureInPictureSupported;
}

- (BOOL)isAudioAnalyzerEnabled
{
  return self->_audioAnalyzerEnabled;
}

- (MPCPlaybackIntent)fallbackPlaybackIntent
{
  return self->_fallbackPlaybackIntent;
}

- (MPCWhiskyController)vocalAttenuationController
{
  return self->_vocalAttenuationController;
}

- (BOOL)disableShuffle
{
  return self->_disableShuffle;
}

- (BOOL)disableRepeat
{
  return self->_disableRepeat;
}

- (float)vocalLevel
{
  v2 = [(MPCPlaybackEngine *)self vocalAttenuationController];
  if (v2) {
    float v3 = v2[10];
  }
  else {
    float v3 = 0.0;
  }

  return v3;
}

- (_MPCTranscriptAlignmentController)transcriptAlignmentController
{
  return self->_transcriptAlignmentController;
}

- (BOOL)disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)setFallbackPlaybackIntent:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<MPCPlaybackEngine: %p engineID=%@ playerID=%@>", self, self->_engineID, self->_playerID];
}

- (BOOL)isQueueHandoffSupported
{
  return self->_queueHandoffSupported;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (BOOL)isVocalAttenuationEnabled
{
  return self->_vocalAttenuationEnabled;
}

id __36__MPCPlaybackEngine_preheatPlayback__block_invoke()
{
  v0 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21BB87000, v0, OS_LOG_TYPE_DEFAULT, "Starting playback preheating...", v7, 2u);
  }

  id v1 = +[MPCFairPlayPerformanceController sharedController];
  id v2 = (id)[MEMORY[0x263F12320] ubiquitousIdentifierWithStoreAdamID:1];
  float v3 = [MEMORY[0x263F11D68] sharedController];
  id v4 = (id)[v3 musicSubscriptionStatus];

  id v5 = (id)[MEMORY[0x263F12250] sharedStoreArtworkDataSource];
  return (id)[MEMORY[0x263F89110] sharedMonitor];
}

- (void)setQueueController:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  os_signpost_id_t v6 = (MPCQueueController *)a3;
  p_queueController = &self->_queueController;
  queueController = self->_queueController;
  if (queueController != v6)
  {
    if (queueController)
    {
      v9 = [(MPCPlaybackEngine *)self eventObserver];
      [v9 engine:self willRemoveQueueController:v6];

      v10 = [(MPCQueueController *)self->_queueController playbackEngine];

      if (v10 == self)
      {
        v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [(MPCPlaybackEngine *)self engineID];
          v13 = [(MPCQueueController *)v6 sessionID];
          v14 = [(MPCQueueController *)self->_queueController sessionID];
          *(_DWORD *)buf = 138543874;
          v35 = v12;
          __int16 v36 = 2114;
          v37 = v13;
          __int16 v38 = 2114;
          v39 = v14;
          _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController=%{public}@ | disconnecting [previous controller still connected] queueController=%{public}@", buf, 0x20u);
        }
        [(MPCQueueController *)self->_queueController willDisconnectFromPlaybackEngine:self];
      }
      [(MPCQueueController *)self->_queueController didDisconnectFromPlaybackEngine:self];
      v15 = self->_queueController;
    }
    else
    {
      v15 = 0;
    }
    v16 = [(MPCQueueController *)v15 musicSharePlay];
    [v16 setMusicSharePlayBehaviorDelegate:0];

    v17 = [(MPCQueueController *)*p_queueController music];
    [v17 setMusicBehaviorDelegate:0];

    [(MPCQueueController *)*p_queueController setDelegate:0];
    v18 = [(MPCQueueController *)v6 musicSharePlay];

    if (v18) {
      [(MPCPlaybackEngine *)self setVocalAttenuationEnabled:0];
    }
    objc_storeStrong((id *)&self->_queueController, a3);
    v19 = [(MPCQueueController *)self->_queueController playbackEngine];
    v20 = v19;
    if (v19 != self)
    {
      if (v19)
      {
        v33 = [MEMORY[0x263F08690] currentHandler];
        [v33 handleFailureInMethod:a2, self, @"MPCPlaybackEngine.m", 524, @"Attempt to share QueueController with two players: %@ != %@", v20, self object file lineNumber description];
      }
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [(MPCPlaybackEngine *)self engineID];
        v23 = [(MPCQueueController *)v6 sessionID];
        *(_DWORD *)buf = 138543618;
        v35 = v22;
        __int16 v36 = 2114;
        v37 = v23;
        _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController:%{public}@ | connecting [new controller not connected]", buf, 0x16u);
      }
      [(MPCQueueController *)self->_queueController willConnectToPlaybackEngine:self];
    }
    [(MPCQueueController *)self->_queueController setDelegate:self];
    v24 = [(MPCQueueController *)self->_queueController music];
    [v24 setMusicBehaviorDelegate:self];

    v25 = [(MPCQueueController *)self->_queueController musicSharePlay];
    [v25 setMusicSharePlayBehaviorDelegate:self];

    v26 = [(MPCPlaybackEngine *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v27 = [v26 requestedPropertySetForEngine:self];
      v28 = [(MPCQueueController *)self->_queueController musicSharePlay];
      [v28 setRequestedPropertySetForEvents:v27];
    }
    [(MPCQueueController *)self->_queueController didConnectToPlaybackEngine:self];
    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [(MPCPlaybackEngine *)self engineID];
      v31 = [(MPCQueueController *)self->_queueController sessionID];
      *(_DWORD *)buf = 138543618;
      v35 = v30;
      __int16 v36 = 2114;
      v37 = v31;
      _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "[ENG:%{public}@] setQueueController:%{public}@ | didChangeQueueController", buf, 0x16u);
    }
    v32 = [(MPCPlaybackEngine *)self eventObserver];
    [v32 engine:self didChangeQueueController:v6];
  }
}

- (MPCPlaybackEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCPlaybackEngineDelegate *)WeakRetained;
}

- (void)restoreStateWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCPlaybackEngineSessionManager *)self->_sessionManager stateRestorationSessionIdentifier];
  os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  if (v5)
  {
    os_signpost_id_t v8 = os_signpost_id_generate(v6);

    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StateRestore", "", buf, 2u);
    }

    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(MPCPlaybackEngine *)self engineID];
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = self;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | requested playback state restoration [] engine=%{public}@", buf, 0x16u);
    }
    [(MPCPlaybackEngine *)self setRestoringPlaybackState:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke;
    v14[3] = &unk_2643C4530;
    os_signpost_id_t v17 = v8;
    v14[4] = self;
    id v16 = v4;
    id v15 = v5;
    [(MPCPlaybackEngine *)self _detectCrashLoopForSessionIdentifier:v15 block:v14];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(MPCPlaybackEngine *)self engineID];
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = self;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | skipping playback state restoration [no stateRestorationSessionID in session manager] engine=%{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_140(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) setRestoringPlaybackState:0];
  os_signpost_id_t v6 = [*(id *)(a1 + 32) eventObserver];
  [v6 engineDidEndStateRestoration:*(void *)(a1 + 32)];

  [*(id *)(*(void *)(a1 + 32) + 72) publishIfNeeded];
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = a2;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v8, OS_SIGNPOST_INTERVAL_END, v9, "StateRestore", "didRestore=%{BOOL}u", buf, 8u);
  }

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = [*(id *)(a1 + 32) engineID];
      v13 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      v24 = v12;
      __int16 v25 = 1024;
      int v26 = a2;
      __int16 v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[PSP:%{public}@] restoreStateWithCompletion | finished playback state restoration [] didRestore=%{BOOL}u error=%{public}@", buf, 0x1Cu);
    }
    if ((a2 & 1) == 0)
    {
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [*(id *)(a1 + 32) engineID];
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | clearing state restoration identifier [state restoration failed]", buf, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 32) + 88) setStateRestorationSessionIdentifier:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [*(id *)(a1 + 32) engineID];
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      __int16 v25 = 1024;
      int v26 = a2;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion | finished playback state restoration [] didRestore=%{BOOL}u", buf, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_signpost_id_t v17 = *(void **)(*(void *)(a1 + 32) + 96);
  if (a2 && v17)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_141;
    v21[3] = &unk_2643C54B8;
    id v22 = *(id *)(a1 + 48);
    [v17 performAfterEdits:v21];
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 48);
    v19 = *(void (**)(uint64_t))(v18 + 16);
    id v20 = v17;
    v19(v18);
  }
}

- (void)setRestoringPlaybackState:(BOOL)a3
{
  self->_restoringPlaybackState = a3;
}

void __64__MPCPlaybackEngine__detectCrashLoopForSessionIdentifier_block___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_detectCrashLoopForSessionIdentifier:(id)a3 block:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = NSString;
  playerID = self->_playerID;
  os_signpost_id_t v9 = a4;
  v10 = [v7 stringWithFormat:@"stateRestoration-%@", playerID];
  v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v12 = [v11 dictionaryForKey:v10];
  v13 = (void *)v12;
  v14 = (void *)MEMORY[0x263EFFA78];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  id v16 = [v15 objectForKeyedSubscript:@"attempts"];
  uint64_t v17 = [v16 integerValue];

  uint64_t v18 = [v15 objectForKeyedSubscript:@"identifier"];

  LODWORD(v15) = [v18 isEqualToString:v6];
  if (v15) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(MPCPlaybackEngine *)self engineID];
    *(_DWORD *)buf = 138543874;
    v32 = v21;
    __int16 v33 = 2114;
    id v34 = v6;
    __int16 v35 = 2048;
    uint64_t v36 = v19 + 1;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] _detectCrashLoopForSessionIdentifier: | sessionIdentifier=%{public}@ attempt=%ld", buf, 0x20u);
  }
  id v22 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v29[1] = @"attempts";
  v30[0] = v6;
  v29[0] = @"identifier";
  v23 = [NSNumber numberWithInteger:v19 + 1];
  v30[1] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v22 setObject:v24 forKey:v10];

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __64__MPCPlaybackEngine__detectCrashLoopForSessionIdentifier_block___block_invoke;
  v27[3] = &unk_2643C5FC8;
  id v28 = v10;
  __int16 v25 = (void (*)(void *, BOOL, void *))v9[2];
  id v26 = v10;
  v25(v9, v19 < 2, v27);
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v7 = v6;
  if (a2)
  {
    os_signpost_id_t v8 = *(void *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StateRestore-WaitingForAccounts", "", buf, 2u);
    }

    os_signpost_id_t v9 = [*(id *)(a1 + 32) eventObserver];
    [v9 engineWillBeginStateRestoration:*(void *)(a1 + 32)];

    v10 = +[MPCPlaybackAccountManager sharedManager];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_138;
    v20[3] = &unk_2643C4508;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
    v20[4] = v11;
    id v22 = v12;
    v23 = v5;
    id v21 = *(id *)(a1 + 40);
    [v10 performAfterLoadingAccounts:v20];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = [*(id *)(a1 + 32) engineID];
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v26 = v13;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[PSP:%{public}@] restoreStateWithCompletion: | skipping restore [too many failed attempts] sessionIdentifier=%{public}@", buf, 0x16u);
    }
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    id v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v16, OS_SIGNPOST_INTERVAL_END, v17, "StateRestore", "didRestore=NO", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) setStateRestorationSessionIdentifier:0];
    [*(id *)(a1 + 32) setRestoringPlaybackState:0];
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 59, @"Unable to restore state. Too many failed attempts.");
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v19);

    v5[2](v5);
  }
}

- (BOOL)isSystemMusicApplication
{
  id v2 = objc_opt_class();

  return [v2 isSystemMusic];
}

- (void)_initializePlaybackStack
{
  float v3 = [[_MPCPlaybackEngineEventStreamInitializationParameters alloc] initWithPlaybackEngineParameters:self->_initializationParameters engineID:self->_engineID];
  id v4 = [[MPCPlaybackEngineEventStream alloc] initWithParameters:v3];
  eventStream = self->_eventStream;
  self->_eventStream = v4;

  if (([(id)objc_opt_class() isSystemMusic] & 1) == 0
    && ([(id)objc_opt_class() isSystemPodcasts] & 1) == 0)
  {
    [(MPCPlaybackEngineEventStream *)self->_eventStream setTransactionDebounceTime:0.0];
  }
  id v6 = [[MPCPlaybackEngineEnvironmentConsumer alloc] initWithPlaybackEngine:self];
  [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v6];
  if (([(id)objc_opt_class() isSystemPodcasts] & 1) == 0)
  {
    v7 = objc_alloc_init(MPCAMSEngagementEventConsumer);
    [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v7];
    os_signpost_id_t v8 = objc_alloc_init(MPCPlayActivityFeedEventConsumer);
    [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v8];
    os_signpost_id_t v9 = [[MPCAssistantAnalyticsEventConsumer alloc] initWithPlaybackEngine:self];
    [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v9];
  }
  v10 = objc_alloc_init(MPCRTCEventConsumer);
  [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v10];
  uint64_t v11 = objc_alloc_init(MPCPlaybackEngineLoggingConsumer);
  [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v11];
  uint64_t v12 = [[MPCPlayPerfConsumer alloc] initWithPlaybackEngine:self];
  [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v12];
  if (_os_feature_enabled_impl()
    && MSVDeviceSupportsVocalAttenuation()
    && ICCurrentApplicationIsSystemApp())
  {
    v13 = objc_alloc_init(MPCVocalAttenuationPowerLogConsumer);
    [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v13];
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    uint64_t v14 = objc_alloc_init(MPCAutoBugCaptureEventConsumer);
    [(MPCPlaybackEngineEventStream *)self->_eventStream addConsumer:v14];
  }
  id v15 = [[_MPCMediaRemotePublisher alloc] initWithPlaybackEngine:self];
  mediaRemotePublisher = self->_mediaRemotePublisher;
  self->_mediaRemotePublisher = v15;

  if ((MSVDeviceIsAudioAccessory() & 1) == 0)
  {
    os_signpost_id_t v17 = [[_MPCMusicPlayerControllerServer alloc] initWithPlaybackEngine:self];
    musicPlayerControllerServer = self->_musicPlayerControllerServer;
    self->_musicPlayerControllerServer = v17;
  }
  uint64_t v19 = [[_MPCLeaseManager alloc] initWithPlaybackEngine:self];
  leaseManager = self->_leaseManager;
  self->_leaseManager = v19;

  id v21 = [[_MPCPlaybackEnginePlayer alloc] initWithPlaybackEngine:self];
  player = self->_player;
  self->_player = v21;

  if (+[MPCPlaybackEngine supportsVideoViewController])
  {
    v23 = [[_MPCVideoViewControllerMediaFoundationImplementation alloc] initWithPlaybackEngine:self];
    videoOutput = self->_videoOutput;
    self->_videoOutput = (MPCVideoOutput *)v23;
  }
  __int16 v25 = [[_MPCReportingController alloc] initWithPlaybackEngine:self];
  reportingController = self->_reportingController;
  self->_reportingController = v25;

  __int16 v27 = [[_MPCPlaybackEngineSessionManager alloc] initWithPlaybackEngine:self];
  sessionManager = self->_sessionManager;
  self->_sessionManager = v27;

  uint64_t v29 = +[MPCContentAgeRequirementManager sharedManager];
  [v29 setDelegate:self];

  [(MPCPlaybackEngine *)self initializeSwiftStack];
  if (_os_feature_enabled_impl()
    && MSVDeviceSupportsVocalAttenuation()
    && ICCurrentApplicationIsSystemApp())
  {
    v30 = [[MPCWhiskyController alloc] initWithPlaybackEngine:self];
    vocalAttenuationController = self->_vocalAttenuationController;
    self->_vocalAttenuationController = v30;
  }
  if ([(id)objc_opt_class() isSystemPodcasts])
  {
    v32 = [[_MPCSleepTimerController alloc] initWithPlaybackEngine:self];
    sleepTimerController = self->_sleepTimerController;
    self->_sleepTimerController = v32;
  }
  if ([(id)objc_opt_class() isSystemPodcasts])
  {
    id v34 = [[_MPCTranscriptAlignmentController alloc] initWithPlaybackEngine:self];
    transcriptAlignmentController = self->_transcriptAlignmentController;
    self->_transcriptAlignmentController = v34;

    uint64_t v36 = self->_eventStream;
    uint64_t v37 = [(_MPCTranscriptAlignmentController *)self->_transcriptAlignmentController eventConsumer];
    [(MPCPlaybackEngineEventStream *)v36 addConsumer:v37];
  }
  id v38 = objc_alloc(MEMORY[0x263F11D28]);
  v39 = (objc_class *)objc_opt_class();
  uint64_t v40 = NSStringFromClass(v39);
  v41 = (MPAVRoutingController *)[v38 initWithName:v40];
  routingController = self->_routingController;
  self->_routingController = v41;

  [(MPAVRoutingController *)self->_routingController setDelegate:self];
  v43 = self->_routingController;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __45__MPCPlaybackEngine__initializePlaybackStack__block_invoke;
  v44[3] = &unk_2643C45A8;
  v44[4] = self;
  [(MPAVRoutingController *)v43 fetchAvailableRoutesWithCompletionQueue:MEMORY[0x263EF83A0] completionHandler:v44];
}

+ (BOOL)supportsVideoViewController
{
  if (MSVDeviceIsAudioAccessory()) {
    return 0;
  }
  else {
    return !+[MPCPlaybackEngine isRemotePlayerService];
  }
}

+ (BOOL)isRemotePlayerService
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  float v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.MediaPlayer.RemotePlayerService"];

  return v4;
}

- (void)addEngineObserver:(id)a3
{
  eventObserver = self->_eventObserver;
  id v4 = a3;
  id v5 = [(_MPCPlaybackEngineEventObserving *)eventObserver objects];
  [v5 addObject:v4];
}

- (MPCPlaybackEngineInitializationParameters)initializationParameters
{
  return self->_initializationParameters;
}

- (void)start
{
  self->_started = 1;
  [(_MPCMusicPlayerControllerServer *)self->_musicPlayerControllerServer startServer];
  [(_MPCMediaRemotePublisher *)self->_mediaRemotePublisher publishIfNeeded];
  [(id)objc_opt_class() preheatPlayback];
  float v3 = [(MPCPlaybackEngineInitializationParameters *)self->_initializationParameters nowPlayingInfoCenter];
  id v9 = [v3 playerPath];

  id v4 = [v9 client];
  id v5 = [v4 parentApplicationBundleIdentifier];

  if (v5)
  {
    id v6 = [v9 origin];
    v7 = [v9 client];
    os_signpost_id_t v8 = [v7 parentApplicationBundleIdentifier];
    MRMediaRemoteSetParentApplication();
  }
}

+ (void)preheatPlayback
{
  id v2 = dispatch_get_global_queue(25, 0);
  dispatch_async(v2, &__block_literal_global_25774);
}

- (MPCPlaybackEngine)initWithPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = [[_MPCPlaybackEnginePlayerIDInitializationParameters alloc] initWithPlayerID:v4];

  id v6 = [(MPCPlaybackEngine *)self initWithParameters:v5];
  return v6;
}

- (MPCPlaybackEngine)initWithParameters:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlaybackEngine;
  v7 = [(MPCPlaybackEngine *)&v19 init];
  if (v7)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
    {
      os_signpost_id_t v17 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v18 = [MEMORY[0x263F08B88] callStackSymbols];
      [v17 handleFailureInMethod:a2, v7, @"MPCPlaybackEngine.m", 116, @"MPCPlaybackEngine API must be called on the main thread. %@", v18 object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_initializationParameters, a3);
    os_signpost_id_t v8 = [v6 playerID];
    uint64_t v9 = [v8 copy];
    playerID = v7->_playerID;
    v7->_playerID = (NSString *)v9;

    uint64_t v11 = MSVNanoIDCreateTaggedPointer();
    engineID = v7->_engineID;
    v7->_engineID = (NSString *)v11;

    objc_storeStrong((id *)&v7->_audioSessionCategory, (id)*MEMORY[0x263EF9060]);
    v7->_queueHandoffSupported = 1;
    uint64_t v13 = [MEMORY[0x263F12188] proxyForObjects:MEMORY[0x263EFFA68] protocol:&unk_26CC1BCA8];
    eventObserver = v7->_eventObserver;
    v7->_eventObserver = (_MPCPlaybackEngineEventObserving *)v13;

    [(MPCPlaybackEngine *)v7 _initializePlaybackStack];
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v7;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "Created new playback engine: %{public}@", buf, 0xCu);
    }
  }
  return v7;
}

- (void)queueController:(id)a3 didChangeTargetContentItemID:(id)a4
{
  id v5 = a3;
  [(MPCPlaybackEngine *)self schedulePlaybackStatePreservation];
  BOOL v6 = [v5 targetContentItemSource] == 3;
  uint64_t v7 = [v5 targetContentItemSource];

  id v8 = [(MPCPlaybackEngine *)self player];
  [v8 reloadItemsKeepingCurrentItem:v6 allowReuse:v7 != 6];
}

- (void)queueController:(id)a3 didDetectMismatchForActiveContentItemID:(id)a4 targetContentItemID:(id)a5
{
  id v5 = [(MPCPlaybackEngine *)self player];
  [v5 reloadItemsKeepingCurrentItem:0 allowReuse:1];
}

void __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasScheduledPlaybackStatePreservation])
  {
    [*(id *)(a1 + 32) setScheduledPlaybackStatePreservation:0];
    if ([*(id *)(a1 + 32) isStateRestorationSupported])
    {
      int v2 = [*(id *)(a1 + 32) isRestoringPlaybackState];
      float v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (!v2)
      {
        if (v4)
        {
          uint64_t v7 = [*(id *)(a1 + 32) engineID];
          *(_DWORD *)buf = 138543362;
          v10 = v7;
          _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | saving playback state [debounced]", buf, 0xCu);
        }
        float v3 = [*(id *)(a1 + 32) sessionManager];
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke_170;
        v8[3] = &unk_2643C4558;
        v8[4] = *(void *)(a1 + 32);
        [v3 saveSessionWithCompletion:v8];
        goto LABEL_12;
      }
      if (v4)
      {
        id v5 = [*(id *)(a1 + 32) engineID];
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        BOOL v6 = "[PSP:%{public}@] schedulePlaybackStatePreservation | skipping playback state preservation [engine is curren"
             "tly restoring state]";
LABEL_8:
        _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      }
    }
    else
    {
      float v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) engineID];
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        BOOL v6 = "[PSP:%{public}@] schedulePlaybackStatePreservation | skipping playback state preservation [not supported by client]";
        goto LABEL_8;
      }
    }
LABEL_12:
  }
}

- (BOOL)isStateRestorationSupported
{
  return [(_MPCPlaybackEngineSessionManager *)self->_sessionManager isStateRestorationSupported];
}

- (_MPCPlaybackEngineSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (BOOL)isRestoringPlaybackState
{
  return self->_restoringPlaybackState;
}

void __45__MPCPlaybackEngine__initializePlaybackStack__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) routingController];
  uint64_t v3 = [v2 pickedRoute];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 216);
  *(void *)(v4 + 216) = v3;

  id v8 = [*(id *)(a1 + 32) eventObserver];
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 pickedRoute];
  [v8 engine:v6 didReceivePickedRouteChange:v7];
}

- (MPAVRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (MPAVRoutingController)routingController
{
  return self->_routingController;
}

- (void)routingController:(id)a3 pickedRouteDidChange:(id)a4
{
  objc_storeStrong((id *)&self->_pickedRoute, a4);
  id v6 = a4;
  id v7 = [(MPCPlaybackEngine *)self eventObserver];
  [v7 engine:self didReceivePickedRouteChange:v6];
}

- (_MPCPlaybackEngineEventObserving)eventObserver
{
  return self->_eventObserver;
}

- (void)schedulePlaybackStatePreservation
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (![(MPCPlaybackEngine *)self hasScheduledPlaybackStatePreservation])
  {
    [(MPCPlaybackEngine *)self setScheduledPlaybackStatePreservation:1];
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(MPCPlaybackEngine *)self engineID];
      *(_DWORD *)buf = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | scheduling in 1.5s", buf, 0xCu);
    }
    dispatch_time_t v5 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
}

- (BOOL)hasScheduledPlaybackStatePreservation
{
  return self->_scheduledPlaybackStatePreservation;
}

- (void)setVocalAttenuationEnabled:(BOOL)a3
{
  if (self->_vocalAttenuationEnabled != a3)
  {
    self->_vocalAttenuationEnabled = a3;
    id v3 = [(MPCPlaybackEngine *)self player];
    [v3 updateAudioSessionSpeechDetection];
  }
}

- (void)setScheduledPlaybackStatePreservation:(BOOL)a3
{
  self->_scheduledPlaybackStatePreservation = a3;
}

- (void)setStateRestorationSupported:(BOOL)a3
{
  BOOL v3 = a3;
  -[_MPCPlaybackEngineSessionManager setStateRestorationSupported:](self->_sessionManager, "setStateRestorationSupported:");
  if (v3)
  {
    [(MPCPlaybackEngine *)self schedulePlaybackStatePreservation];
  }
}

- (NSString)playerID
{
  return self->_playerID;
}

- (NSString)hostingSharedSessionID
{
  int v2 = [(MPCPlaybackEngine *)self mediaRemotePublisher];
  BOOL v3 = [v2 hostingSharedSessionID];

  return (NSString *)v3;
}

- (_MPCMediaRemotePublisher)mediaRemotePublisher
{
  return self->_mediaRemotePublisher;
}

void __54__MPCPlaybackEngine_schedulePlaybackStatePreservation__block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) _shouldIgnorePlaybackSessionError:v6];
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [*(id *)(a1 + 32) engineID];
        int v15 = 138543618;
        id v16 = v10;
        __int16 v17 = 2114;
        id v18 = v6;
        uint64_t v11 = "[PSP:%{public}@] schedulePlaybackStatePreservation | unable to preserve playback state [encountered ignora"
              "ble error] error=%{public}@";
        uint64_t v12 = v9;
        uint32_t v13 = 22;
LABEL_7:
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_FAULT, "[PSP:%{public}@] schedulePlaybackStatePreservation | failed to archiving playback state [] error=%{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [*(id *)(a1 + 32) engineID];
      int v15 = 138543362;
      id v16 = v10;
      uint64_t v11 = "[PSP:%{public}@] schedulePlaybackStatePreservation | saved playback state";
      uint64_t v12 = v9;
      uint32_t v13 = 12;
      goto LABEL_7;
    }
  }
}

- (void)setAudioAnalyzerEnabled:(BOOL)a3
{
  if (self->_audioAnalyzerEnabled != a3)
  {
    BOOL v3 = a3;
    self->_audioAnalyzerEnabled = a3;
    id v5 = [MEMORY[0x263F12178] standardUserDefaults];
    char v6 = [v5 disableAudioAnalysis];

    if (!v3 || (v6 & 1) != 0)
    {
      audioAnalyzer = self->_audioAnalyzer;
      self->_audioAnalyzer = 0;
    }
    else
    {
      int v7 = [[MPCAudioSpectrumAnalyzer alloc] initWithPlaybackEngine:self];
      audioAnalyzer = self->_audioAnalyzer;
      self->_audioAnalyzer = v7;
    }
  }
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_138(uint64_t a1)
{
  int v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v3, OS_SIGNPOST_INTERVAL_END, v4, "StateRestore-WaitingForAccounts", "", buf, 2u);
  }

  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  char v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 64);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "StateRestore-MRCheck", "", buf, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 72);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_139;
  v10[3] = &unk_2643C44E0;
  uint64_t v14 = *(void *)(a1 + 64);
  v10[4] = v8;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  [v9 getShouldRestoreStateWithCompletion:v10];
}

void __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_139(uint64_t a1, int a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_signpost_id_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = a2;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "StateRestore-MRCheck", "shouldRestore=%{BOOL}u", buf, 8u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_140;
  aBlock[3] = &unk_2643C4490;
  uint64_t v7 = *(void *)(a1 + 64);
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v23 = v7;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v10 = v9;
  if (a2)
  {
    os_signpost_id_t v11 = *(void *)(a1 + 64);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "StateRestore-Load", "", buf, 2u);
    }

    id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 32) engineID];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v13;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | beginning playback state restoration", buf, 0xCu);
    }
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__MPCPlaybackEngine_restoreStateWithCompletion___block_invoke_144;
    v17[3] = &unk_2643C44B8;
    uint64_t v19 = *(void *)(a1 + 64);
    id v18 = v8;
    [v14 loadSessionWithIdentifier:v15 completion:v17];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v16;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@] restoreStateWithCompletion: | skipping playback state restoration [MediaRemote commands pending]", buf, 0xCu);
    }

    (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)initializeSwiftStack
{
  int v2 = self;
  MPCPlaybackEngine.initializeSwiftStack()();
}

- (void)loadSessionWithIdentifier:(NSString *)a3 completion:(id)a4
{
  os_signpost_id_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C644E8, (uint64_t)v7);
}

- (void)reloadQueueForReason:(int64_t)a3 completion:(id)a4
{
  os_signpost_id_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C644D8, (uint64_t)v7);
}

- (void)beginScanningWithDirection:(int64_t)a3 identifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a4;
  os_signpost_id_t v11 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C644C8, (uint64_t)v9);
}

- (BOOL)skipWithDirectionShouldJumpToItemStart:(int64_t)a3
{
  os_signpost_id_t v4 = self;
  LOBYTE(a3) = MPCPlaybackEngine.skipShouldJumpToItemStart(direction:)(a3);

  return a3 & 1;
}

- (void)relativeVolumeDidUpdateToVolume:(float)a3
{
  os_signpost_id_t v4 = self;
  MPCPlaybackEngine.relativeVolumeDidUpdate(to:)(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocalAttenuationController, 0);
  objc_storeStrong((id *)&self->_pickedRoute, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);
  objc_storeStrong(&self->_swiftStorage, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_targetContentItemID, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_transcriptAlignmentController, 0);
  objc_storeStrong((id *)&self->_sleepTimerController, 0);
  objc_storeStrong((id *)&self->_leaseManager, 0);
  objc_storeStrong((id *)&self->_reportingController, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_queueController, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_musicPlayerControllerServer, 0);
  objc_storeStrong((id *)&self->_mediaRemotePublisher, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_eventObserver, 0);
  objc_storeStrong((id *)&self->_fallbackPlaybackIntent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_engineID, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

- (void)setRelativeVolume:(float)a3
{
  self->_relativeVolume = a3;
}

- (float)relativeVolume
{
  return self->_relativeVolume;
}

- (MPCAudioSpectrumAnalyzer)audioAnalyzer
{
  return self->_audioAnalyzer;
}

- (MPCPlaybackEngineActiveItem)activeItem
{
  return self->_activeItem;
}

- (NSString)targetContentItemID
{
  return self->_targetContentItemID;
}

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (_MPCSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (_MPCReportingController)reportingController
{
  return self->_reportingController;
}

- (_MPCMusicPlayerControllerServer)musicPlayerControllerServer
{
  return self->_musicPlayerControllerServer;
}

- (void)setNeedsUISnapshot:(BOOL)a3
{
  self->_needsUISnapshot = a3;
}

- (BOOL)needsUISnapshot
{
  return self->_needsUISnapshot;
}

- (void)requestAuthorizationForExplicitItem:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 == 1) {
      os_signpost_id_t v11 = @"Age Gating";
    }
    else {
      os_signpost_id_t v11 = @"None";
    }
    *(_DWORD *)buf = 134218498;
    if (a4 == 2) {
      os_signpost_id_t v11 = @"Age Verification";
    }
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Received request to authorize explicit item - item=%{public}@ - reason=%{public}@", buf, 0x20u);
  }

  id v12 = [(MPCPlaybackEngine *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__MPCPlaybackEngine_requestAuthorizationForExplicitItem_reason_completion___block_invoke;
    v15[3] = &unk_2643C45D0;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [v12 engine:self requiresAuthorizationToPlayItem:v16 reason:a4 authorizationHandler:v15];
  }
  else
  {
    if (a4 == 1) {
      id v13 = @"Age Gating";
    }
    else {
      id v13 = @"None";
    }
    if (a4 == 2) {
      id v13 = @"Age Verification";
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 42, @"Explicit content not allowed [unable to handle request] - item=%@ - reason=%@", v8, v13);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
  }
}

void __75__MPCPlaybackEngine_requestAuthorizationForExplicitItem_reason_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    os_signpost_id_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      int v14 = 134218498;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Explicit content not allowed [request failed] - item=%{public}@ - error=%{public}@", (uint8_t *)&v14, 0x20u);
    }

    id v9 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      uint64_t v12 = a1[5];
      id v13 = @"not allowed";
      if (a2) {
        id v13 = @"allowed";
      }
      int v14 = 134218498;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: requestAuthorizationForExplicitItem:reason:completion: - Explicit content %{public}@ [request succeeded] - item=%{public}@", (uint8_t *)&v14, 0x20u);
    }

    id v9 = *(void (**)(void))(a1[6] + 16);
  }
  v9();
}

- (BOOL)_shouldIgnorePlaybackSessionError:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:@"MPCPlaybackSessionManagerError"];

  BOOL v6 = v5 && (unint64_t)([v3 code] - 1) < 3;
  return v6;
}

- (void)behavior:(id)a3 didReceiveSharedListeningEvent:(id)a4
{
  id v6 = a4;
  int v5 = [(MPCPlaybackEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 engine:self didReceiveSharedListeningEvent:v6];
  }
}

- (void)behavior:(id)a3 didChangeExplicitContentState:(int64_t)a4
{
  id v6 = [(MPCPlaybackEngine *)self player];
  int v5 = [v6 currentItem];
  [v5 setExplicitContentState:a4];
}

- (void)behavior:(id)a3 didEndSharePlaySessionWithReason:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = NSString;
  uint64_t v7 = MSVNanoIDCreateTaggedPointer();
  uint64_t v8 = [v6 stringWithFormat:@"LeaveSharedSession:%@", v7];

  if (a4)
  {
    if (a4 == 2)
    {
      id v9 = 0;
      v10 = @"CannotHostAndParticipateInDistinctSharedSessions";
    }
    else if (a4 == 1)
    {
      id v9 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackEngineInternalError", 2201, @"LiveLink unexpectedly disconnected");
      v10 = @"UnexpectedDisconnect";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown/%d", a4);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
    v10 = @"OutOfItems";
  }
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    id v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v8;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: sharePlaySessionDidEnd: calling publisher.leaveSharedSession [%{public}@] commandID=%{public}@", buf, 0x20u);
  }

  mediaRemotePublisher = self->_mediaRemotePublisher;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__MPCPlaybackEngine_behavior_didEndSharePlaySessionWithReason___block_invoke;
  v15[3] = &unk_2643C4580;
  v15[4] = self;
  __int16 v16 = v10;
  id v17 = v9;
  id v13 = v9;
  int v14 = v10;
  [(_MPCMediaRemotePublisher *)mediaRemotePublisher leaveSharedSessionWithCommandID:v8 remoteControlInterface:@"MPCPlaybackEngine <MusicSharePlayDelegate>" completion:v15];
}

void __63__MPCPlaybackEngine_behavior_didEndSharePlaySessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_signpost_id_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134218498;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "PlaybackEngine %p: sharePlaySessionDidEnd: publisher.leaveSharedSession [%{public}@] complete status=%{public}@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 engine:*(void *)(a1 + 32) didEndSharedListeningSessionWithError:*(void *)(a1 + 48)];
  }
}

- (void)behavior:(id)a3 didChangeActionAtQueueEnd:(int64_t)a4
{
  id v6 = [(MPCPlaybackEngine *)self eventObserver];
  [v6 engine:self didChangeActionAtQueueEnd:a4];
}

- (void)behavior:(id)a3 didChangeShuffleType:(int64_t)a4
{
  id v6 = [(MPCPlaybackEngine *)self eventObserver];
  [v6 engine:self didChangeShuffleType:a4];
}

- (void)behavior:(id)a3 didChangeRepeatType:(int64_t)a4
{
  id v6 = [(MPCPlaybackEngine *)self eventObserver];
  [v6 engine:self didChangeRepeatType:a4];
}

- (void)queueControllerDidReachUnexpectedEndOfQueue:(id)a3
{
  os_signpost_id_t v4 = NSString;
  uint64_t v5 = MSVNanoIDCreateTaggedPointer();
  id v8 = [v4 stringWithFormat:@"UnexpectedEndOfQueue_%@", v5];

  id v6 = [(MPCPlaybackEngine *)self player];
  [v6 pauseWithIdentifier:v8 completion:&__block_literal_global_184];

  uint64_t v7 = [(MPCPlaybackEngine *)self player];
  [v7 didReachEndOfQueueWithReason:@"UnexpectedEndOfQueue"];
}

- (void)queueControllerDidChangeContents:(id)a3
{
  [(MPCPlaybackEngine *)self schedulePlaybackStatePreservation];
  os_signpost_id_t v4 = [(MPCPlaybackEngine *)self eventObserver];
  [v4 engine:self didChangeQueueWithReason:@"Queue Controller Contents Changed"];

  id v5 = [(MPCPlaybackEngine *)self player];
  [v5 reloadItemsKeepingCurrentItem:1 allowReuse:1];
}

- (double)mapPlaybackTimeToUserTime:(double)a3
{
  [(MPCPlaybackEngine *)self currentAudioProcessingDelay];
  return a3 - v4;
}

- (double)mapUserTimeToPlaybackTime:(double)a3
{
  [(MPCPlaybackEngine *)self currentAudioProcessingDelay];
  return v4 + a3;
}

- (BOOL)isVocalAttenuationAvailable
{
  if ([(_MPCMediaRemotePublisher *)self->_mediaRemotePublisher vocalAttenuationUnavailabilityReasons])
  {
    return 0;
  }
  vocalAttenuationController = self->_vocalAttenuationController;
  if (vocalAttenuationController && vocalAttenuationController->_state == 2) {
    return 1;
  }

  return -[MPCWhiskyController isVocalAttenuationAvailable](vocalAttenuationController);
}

- (double)currentAudioProcessingDelay
{
  id v3 = [(_MPCPlaybackEnginePlayer *)self->_player currentItem];
  double v4 = 0.0;
  if ([v3 supportsVocalAttenuation]
    && [v3 isConfiguredForVocalAttenuation]
    && [(MPCPlaybackEngine *)self isVocalAttenuationEnabled])
  {
    id v5 = [(MPCPlaybackEngine *)self vocalAttenuationController];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 processor];
      int v8 = [v7 isEnabled];

      if (v8)
      {
        uint64_t v9 = [v6 modelProvider];
        __int16 v10 = [v9 model];
        if (v10) {
          double v4 = v10[10];
        }
      }
    }
  }
  return v4;
}

- (void)setVocalLevel:(float)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(MPCPlaybackEngine *)self vocalAttenuationController];
  if (v5) {
    float v6 = v5[10];
  }
  else {
    float v6 = 0.0;
  }

  if (v6 != a3)
  {
    uint64_t v7 = [(MPCPlaybackEngine *)self vocalAttenuationController];
    if (v7)
    {
      float v9 = fminf(fmaxf(a3, v7[14]), v7[15]);
      float v10 = v7[10];
      if (v9 != v10)
      {
        v7[10] = v9;
        *(float *)&double v8 = v7[10];
        __int16 v16 = v7;
        [v7 _processorLevelForVocalLevel:v8];
        int v12 = v11;
        id v13 = [v16 processor];
        LODWORD(v14) = v12;
        [v13 setLevel:v14];

        uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2048;
          double v18 = v9;
          _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Vocal level changed: %3.2fui -> %3.2fui", buf, 0x20u);
        }

        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __37__MPCWhiskyController_setVocalLevel___block_invoke;
        double v18 = COERCE_DOUBLE(&unk_2643C5FC8);
        uint64_t v19 = v16;
        msv_dispatch_on_main_queue();
        uint64_t v7 = v16;
      }
    }
  }
}

- (NSXPCListenerEndpoint)serverEndpoint
{
  return [(_MPCMusicPlayerControllerServer *)self->_musicPlayerControllerServer endpoint];
}

- (void)reportUserBackgroundedApplication
{
}

- (void)removeEngineObserver:(id)a3
{
  eventObserver = self->_eventObserver;
  id v4 = a3;
  id v5 = [(_MPCPlaybackEngineEventObserving *)eventObserver objects];
  [v5 removeObject:v4];
}

- (void)invalidate
{
}

- (void)setDisableShuffle:(BOOL)a3
{
  if (self->_disableShuffle != a3)
  {
    self->_disableShuffle = a3;
    id v3 = [(MPCPlaybackEngine *)self mediaRemotePublisher];
    [v3 publishIfNeeded];
  }
}

- (void)setDisableRepeat:(BOOL)a3
{
  if (self->_disableRepeat != a3)
  {
    self->_disableRepeat = a3;
    id v3 = [(MPCPlaybackEngine *)self mediaRemotePublisher];
    [v3 publishIfNeeded];
  }
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  if (self->_disableAutoPlay != a3)
  {
    self->_disableAutoPlay = a3;
    id v3 = [(MPCPlaybackEngine *)self mediaRemotePublisher];
    [v3 publishIfNeeded];
  }
}

- (void)setAudioSessionOptions:(unint64_t)a3
{
  if (self->_audioSessionOptions != a3)
  {
    self->_audioSessionOptions = a3;
    [(_MPCPlaybackEnginePlayer *)self->_player updateAudioSession];
  }
}

- (void)setAudioSessionCategory:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MPCPlaybackEngine.m", 246, @"Invalid parameter not satisfying: %@", @"audioSessionCategory" object file lineNumber description];

    id v5 = 0;
  }
  if (![(NSString *)self->_audioSessionCategory isEqualToString:v5])
  {
    float v6 = (NSString *)[v9 copy];
    audioSessionCategory = self->_audioSessionCategory;
    self->_audioSessionCategory = v6;

    [(_MPCPlaybackEnginePlayer *)self->_player updateAudioSession];
  }
}

- (void)setQueueHandoffSupported:(BOOL)a3
{
  if (self->_queueHandoffSupported != a3)
  {
    self->_queueHandoffSupported = a3;
    if ([(_MPCMediaRemotePublisher *)self->_mediaRemotePublisher hasInitializedSupportedCommands])
    {
      mediaRemotePublisher = self->_mediaRemotePublisher;
      [(_MPCMediaRemotePublisher *)mediaRemotePublisher publishIfNeeded];
    }
  }
}

- (void)dealloc
{
  [(MPCPlaybackEngineEventStream *)self->_eventStream scheduleInvalidation];
  v3.receiver = self;
  v3.super_class = (Class)MPCPlaybackEngine;
  [(MPCPlaybackEngine *)&v3 dealloc];
}

@end