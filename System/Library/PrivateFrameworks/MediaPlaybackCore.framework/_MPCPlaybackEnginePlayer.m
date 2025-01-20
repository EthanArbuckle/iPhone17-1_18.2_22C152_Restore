@interface _MPCPlaybackEnginePlayer
+ (id)describePlayer:(id)a3;
- (AVPlayerViewController)playerViewController;
- (BOOL)_isAVKitSkipAction:(id)a3;
- (BOOL)_itemConfigurationIsIncompatibleWithVocalAttenuationState:(id)a3;
- (BOOL)autoPlayWhenLikelyToKeepUp;
- (BOOL)hasPlayedSuccessfully;
- (BOOL)isReloadingPlaybackContext;
- (BOOL)lastReportedVocalAttenuationEnabledState;
- (MFAssetLoading)assetLoader;
- (MFPlaybackStackController)playbackStackController;
- (MPAVItem)currentItem;
- (MPCAVItemTrace)playbackStartTrace;
- (MPCExternalPlaybackController)externalPlaybackController;
- (MPCItemBookmarker)bookmarker;
- (MPCLeaseController)leaseController;
- (MPCMediaFoundationTranslator)translator;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackEngineEventStreamDeferralAssertion)evsDeferralAssertionForFirstAudioFrame;
- (MPCPlaybackErrorController)errorController;
- (MPCPlayerItemConfigurator)configurator;
- (MRCriticalSectionToken)criticalSectionToken;
- (NSDictionary)_stateDictionary;
- (NSNumber)currentRelativeVolume;
- (_MPCAudioSessionController)transientAudioSessionController;
- (_MPCPlaybackEnginePlayer)initWithPlaybackEngine:(id)a3;
- (double)_adjustPlayerTimeForAudioTapProcessing:(double)a3;
- (double)applicationMusicPlayerCrossFadeDuration;
- (double)currentTime;
- (float)currentRate;
- (float)relativeVolume;
- (id)_MPAVItemForMFQueuePlayerItem:(id)a3;
- (int64_t)applicationMusicPlayerTransitionType;
- (int64_t)jumpIdentifier;
- (int64_t)state;
- (int64_t)stateBeforeInterruption;
- (unint64_t)stateHandle;
- (void)_logTimeJumpForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 userInitiated:(BOOL)a6 timeStamp:(id)a7;
- (void)_performSkipForUserAction:(id)a3;
- (void)_playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 time:(double)a6;
- (void)_setupPlaybackStackWithPlaybackEngine:(id)a3;
- (void)_updateActiveFormatForQueueItem:(id)a3;
- (void)assetLoadingDidCompleteForItem:(id)a3 error:(id)a4;
- (void)assetLoadingDidStartForItem:(id)a3;
- (void)becomeActiveWithCompletion:(id)a3;
- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 source:(int64_t)a5 timeStamp:(id)a6;
- (void)deactivateAudioSessionIfIdle:(int64_t)a3;
- (void)dealloc;
- (void)didPerformPlayerOperationWithPlayerIdentifier:(id)a3 items:(id)a4 operation:(id)a5;
- (void)didReachEndOfQueueWithReason:(id)a3;
- (void)didReportSignpostWithType:(int64_t)a3;
- (void)donateMetricsToPlayerItem:(id)a3;
- (void)effectiveRateDidChangeTo:(float)a3 forItem:(id)a4 timeStamp:(id)a5;
- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4;
- (void)engine:(id)a3 didChangeQueueController:(id)a4;
- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4;
- (void)engine:(id)a3 willRemoveQueueController:(id)a4;
- (void)errorResolutionDidEndForItem:(id)a3 error:(id)a4 resolution:(int64_t)a5;
- (void)errorResolutionDidStartForItem:(id)a3 error:(id)a4;
- (void)finalizeSetQueue:(id)a3 completion:(id)a4;
- (void)finalizeStateRestoreWithCompletion:(id)a3;
- (void)firstFrameWillRenderForItem:(id)a3 timeStamp:(id)a4;
- (void)firstVideoFrameWasRenderedForItem:(id)a3 timeStamp:(id)a4;
- (void)interruptionDidBeginWithInterruptor:(id)a3 timeStamp:(id)a4;
- (void)interruptionDidFinishForInterruptor:(id)a3 shouldResume:(BOOL)a4 timeStamp:(id)a5;
- (void)invalidateEVSDeferralAssertionForFirstAudioFrame;
- (void)itemDidBecomeCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5;
- (void)itemDidFailToLoad:(id)a3 silently:(BOOL)a4 error:(id)a5 timeStamp:(id)a6;
- (void)itemDidFailToPlayToEnd:(id)a3 error:(id)a4 timeStamp:(id)a5;
- (void)itemDidPlayToEnd:(id)a3 timeStamp:(id)a4;
- (void)itemDidResignCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5;
- (void)itemIsReadyForMetrics:(id)a3 accessLog:(id)a4;
- (void)itemIsReadyToPlay:(id)a3 timeStamp:(id)a4;
- (void)jumpToTime:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)mediaServicesInterruptionDidBeginWithItemAtDeath:(id)a3 timeAtDeath:(double)a4 timeStamp:(id)a5;
- (void)mediaServicesInterruptionDidEndWithTimeStamp:(id)a3;
- (void)mediaServicesPurgeDidOccurWithTimeStamp:(id)a3;
- (void)overlappedPlaybackDidEndFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7;
- (void)overlappedPlaybackWillBeginFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7;
- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4;
- (void)pauseForSleepTimerWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)pauseWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5;
- (void)pauseWithIdentifier:(id)a3 completion:(id)a4;
- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5;
- (void)playbackBufferStateDidChangeToState:(int64_t)a3 forItem:(id)a4 timeStamp:(id)a5;
- (void)playbackDidReachQueueEndWithTimeStamp:(id)a3;
- (void)playbackDidStartForItem:(id)a3 rate:(float)a4 fromStalling:(BOOL)a5 timeStamp:(id)a6;
- (void)playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 timeStamp:(id)a6;
- (void)playbackIsBlockedOnNonPlayableItem:(id)a3;
- (void)playbackIsLikelyToKeepUp:(BOOL)a3 forItem:(id)a4 timeStamp:(id)a5;
- (void)playbackRateDidChangeNotifiedForItem:(id)a3 newRate:(float)a4 reason:(id)a5 participantIdentifier:(id)a6 timeStamp:(id)a7;
- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 timeStamp:(id)a5;
- (void)playbackTimeDidChangeTo:(double)a3 forItem:(id)a4 reason:(int64_t)a5 timeStamp:(id)a6;
- (void)playbackWaitingToPlayForItem:(id)a3 reason:(id)a4 timeStamp:(id)a5;
- (void)relativeVolumeDidChangeTo:(float)a3 timeStamp:(id)a4;
- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4;
- (void)renderingModeDidChange:(int64_t)a3 timeStamp:(id)a4;
- (void)routeDidChange:(BOOL)a3 metadata:(id)a4 timeStamp:(id)a5;
- (void)screenRecordingDidChange:(BOOL)a3 timeStamp:(id)a4;
- (void)setApplicationMusicPlayerCrossFadeDuration:(double)a3;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3;
- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4;
- (void)setAssetLoader:(id)a3;
- (void)setAutoPlayWhenLikelyToKeepUp:(BOOL)a3;
- (void)setBookmarker:(id)a3;
- (void)setConfigurator:(id)a3;
- (void)setCriticalSectionToken:(id)a3;
- (void)setCurrentRelativeVolume:(id)a3;
- (void)setErrorController:(id)a3;
- (void)setEvsDeferralAssertionForFirstAudioFrame:(id)a3;
- (void)setExternalPlaybackController:(id)a3;
- (void)setJumpIdentifier:(int64_t)a3;
- (void)setLastReportedVocalAttenuationEnabledState:(BOOL)a3;
- (void)setLeaseController:(id)a3;
- (void)setPlaybackStackController:(id)a3;
- (void)setPlaybackStartTrace:(id)a3;
- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5;
- (void)setRelativeVolume:(float)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setTransientAudioSessionController:(id)a3;
- (void)setTranslator:(id)a3;
- (void)setupPlaybackStackIfNeeded;
- (void)stackControllerDidCancelTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 reason:(id)a6;
- (void)stackControllerDidCreateTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 parameters:(id)a6;
- (void)stateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 timeStamp:(id)a5;
- (void)takeEVSDeferralAssertionForFirstAudioFrame;
- (void)timeControlStatusDidChange:(int64_t)a3 waitingReason:(id)a4 timeStamp:(id)a5;
- (void)togglePlaybackWithIdentifier:(id)a3 completion:(id)a4;
- (void)tracksDidChangeForItem:(id)a3 timeStamp:(id)a4;
- (void)updateAudioSession;
- (void)updateAudioSessionSpeechDetection;
- (void)userActionDidBegin:(id)a3;
- (void)userActionDidEnd:(id)a3 error:(id)a4;
- (void)userSeekCompletedForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 timeStamp:(id)a6;
- (void)willPerformPlayerOperationWithPlayerIdentifier:(id)a3 operation:(id)a4 reason:(id)a5;
@end

@implementation _MPCPlaybackEnginePlayer

- (void)_setupPlaybackStackWithPlaybackEngine:(id)a3
{
  id v48 = a3;
  BOOL v5 = +[MPCPlaybackEngine isSystemPodcasts];
  if (v5)
  {
    v6 = objc_alloc_init(MFPodcastsPlaybackDefaults);
  }
  else
  {
    v6 = [MEMORY[0x263F12178] standardUserDefaults];
  }
  v7 = v6;
  BOOL v8 = v5;
  v9 = [[MPCMediaFoundationTranslator alloc] initWithPlaybackEngine:v48];
  translator = self->_translator;
  self->_translator = v9;

  v11 = [[MPCAssetLoader alloc] initWithDelegate:self];
  assetLoader = self->_assetLoader;
  self->_assetLoader = (MFAssetLoading *)v11;

  v13 = [[MPCExternalPlaybackController alloc] initWithPlaybackEngine:v48 translator:self->_translator];
  externalPlaybackController = self->_externalPlaybackController;
  self->_externalPlaybackController = v13;

  v15 = [[MPCPlaybackErrorController alloc] initWithPlaybackEngine:v48 translator:self->_translator externalPlaybackRouter:self->_externalPlaybackController];
  errorController = self->_errorController;
  self->_errorController = v15;

  v17 = [[MPCItemBookmarker alloc] initWithPlaybackEngine:v48 translator:self->_translator];
  bookmarker = self->_bookmarker;
  self->_bookmarker = v17;

  v19 = [MPCLeaseController alloc];
  v20 = self->_translator;
  v21 = [v48 leaseManager];
  v22 = [(MPCLeaseController *)v19 initWithTranslator:v20 leaseManager:v21];
  leaseController = self->_leaseController;
  self->_leaseController = v22;

  v24 = [MFPlaybackStackControllerImplementation alloc];
  v25 = [v48 playerID];
  v26 = [v48 engineID];
  v27 = [(MFPlaybackStackControllerImplementation *)v24 initWithPlayerID:v25 engineID:v26 queueController:self->_translator assetLoader:self->_assetLoader errorController:self->_errorController externalPlaybackController:self->_externalPlaybackController leaseController:self->_leaseController defaults:v7 behavior:v8 queue:MEMORY[0x263EF83A0]];
  [(_MPCPlaybackEnginePlayer *)self setPlaybackStackController:v27];

  v28 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (!v28)
  {
    v47 = [MEMORY[0x263F08690] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"_MPCPlaybackEnginePlayer.m" lineNumber:697 description:@"_setupPlaybackStackWithPlaybackEngine failed to create a new MFPlaybackStackController"];
  }
  v29 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v29 setDelegate:self];

  v30 = [v48 initializationParameters];
  v31 = [v30 audioSession];

  if (v31)
  {
    v32 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v33 = [v48 initializationParameters];
    v34 = [v33 audioSession];
    [v32 setupForManagedSessionWithAudioSession:v34];
  }
  v35 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [(MPCLeaseController *)self->_leaseController setStackController:v35];

  v36 = [MPCPlayerItemConfigurator alloc];
  v37 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v38 = [(MPCPlayerItemConfigurator *)v36 initWithPlaybackEngine:v48 stackController:v37 translator:self->_translator];
  configurator = self->_configurator;
  self->_configurator = v38;

  [(MFAssetLoading *)self->_assetLoader setConfigurator:self->_configurator];
  v40 = [v48 queueController];
  v41 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v42 = [v41 currentItem];
  v43 = [v42 contentItemID];
  [v40 _playerItemDidBecomeActiveWithContentItemID:v43];

  [(_MPCPlaybackEnginePlayer *)self setTransientAudioSessionController:0];
  [(_MPCPlaybackEnginePlayer *)self updateAudioSession];
  self->_jumpIdentifier = 0;
  v44 = [(_MPCPlaybackEnginePlayer *)self currentRelativeVolume];

  if (v44)
  {
    v45 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v46 = [(_MPCPlaybackEnginePlayer *)self currentRelativeVolume];
    [v46 floatValue];
    objc_msgSend(v45, "setRelativeVolume:");
  }
}

- (MPAVItem)currentItem
{
  v3 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v4 = [v3 currentQueueItem];
  BOOL v5 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v4];

  return (MPAVItem *)v5;
}

- (id)_MPAVItemForMFQueuePlayerItem:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 772, @"Invalid parameter not satisfying: %@", @"item == nil || [(MPAVItem *)item isKindOfClass:[MPAVItem class]]" object file lineNumber description];
    }
  }
  id v6 = v5;
  v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  objc_msgSend(v6, "setCurrentItemTransition:", objc_msgSend(v7, "currentItemTransition"));

  return v6;
}

- (MFPlaybackStackController)playbackStackController
{
  return self->_playbackStackController;
}

- (double)currentTime
{
  v2 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)updateAudioSession
{
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  double v3 = [v11 audioSessionCategory];
  uint64_t v4 = [v11 audioSessionOptions];
  uint64_t v5 = [v3 isEqualToString:*MEMORY[0x263EF9068]] ^ 1;
  id v6 = [(_MPCPlaybackEnginePlayer *)self transientAudioSessionController];

  if (v6)
  {
    v7 = [(_MPCPlaybackEnginePlayer *)self transientAudioSessionController];
    [(MFAudioSessionConfiguration *)v7 updateAudioSession:v3 options:v4 routeSharingPolicy:v5];
  }
  else
  {
    v7 = [[MFAudioSessionConfiguration alloc] initWithCategory:v3 routeSharingPolicy:v5 options:v4];
    BOOL v8 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    [v8 updateAudioSessionWithConfiguration:v7];

    v9 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    int64_t v10 = [(_MPCPlaybackEnginePlayer *)self applicationMusicPlayerTransitionType];
    [(_MPCPlaybackEnginePlayer *)self applicationMusicPlayerCrossFadeDuration];
    objc_msgSend(v9, "setApplicationMusicPlayerTransitionType:duration:", v10);
  }
}

- (_MPCAudioSessionController)transientAudioSessionController
{
  return self->_transientAudioSessionController;
}

- (void)setTransientAudioSessionController:(id)a3
{
}

- (void)setPlaybackStackController:(id)a3
{
}

- (NSNumber)currentRelativeVolume
{
  return self->_currentRelativeVolume;
}

- (int64_t)applicationMusicPlayerTransitionType
{
  return self->_applicationMusicPlayerTransitionType;
}

- (double)applicationMusicPlayerCrossFadeDuration
{
  return self->_applicationMusicPlayerCrossFadeDuration;
}

- (AVPlayerViewController)playerViewController
{
  v2 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  double v3 = [v2 videoViewController];

  return (AVPlayerViewController *)v3;
}

- (_MPCPlaybackEnginePlayer)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MPCPlaybackEnginePlayer;
  uint64_t v5 = [(_MPCPlaybackEnginePlayer *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    [v4 addEngineObserver:v6];
    v7 = objc_alloc_init(_MPCAudioSessionController);
    transientAudioSessionController = v6->_transientAudioSessionController;
    v6->_transientAudioSessionController = v7;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke;
    v11[3] = &unk_2643C34D8;
    v9 = v6;
    v12 = v9;
    v9->_stateHandle = __51___MPCPlaybackEnginePlayer_initWithPlaybackEngine___block_invoke((uint64_t)v11);
    v9->_jumpIdentifier = 0;
    [(_MPCPlaybackEnginePlayer *)v9 prewarm];
  }
  return v6;
}

- (void)reloadItemsKeepingCurrentItem:(BOOL)a3 allowReuse:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v6 reloadItemsKeepingCurrentItem:v5 allowReuse:v4];
}

- (void)itemDidResignCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  v12 = [v11 engineID];
  objc_super v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v9];
  if (!v13)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 1032, @"Invalid parameter not satisfying: %@", @"queueItem != nil" object file lineNumber description];
  }
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = +[MFDescription forItemChangeSource:a4];
    if (v10) {
      [v10 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v22 = v13;
    __int16 v23 = 2114;
    v24 = v15;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidResignCurrent - %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
  }
  if (a4 == 1)
  {
    [v13 _didResignActivePlayerItem];
    v17 = [v11 queueController];
    v18 = [v17 music];
    if ([v18 repeatType] == 1)
    {

      goto LABEL_15;
    }
    char v19 = [v13 isInOverlappedTransition];

    if ((v19 & 1) == 0)
    {
      v17 = [(_MPCPlaybackEnginePlayer *)self translator];
      [v17 setMPAVItem:0 forMFPlayerItem:v9];
      goto LABEL_15;
    }
  }
  else if (!a4)
  {
    v17 = [v11 queueController];
    [v17 playerItemDidResignCurrent:v13];
LABEL_15:
  }
}

- (void)currentItemWillChangeFromItem:(id)a3 toItem:(id)a4 source:(int64_t)a5 timeStamp:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  v15 = [v14 engineID];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 925, @"Invalid parameter not satisfying: %@", @"previous == nil || [(MPAVItem *)previous isKindOfClass:[MPAVItem class]]" object file lineNumber description];

    if (!v12) {
      goto LABEL_6;
    }
  }
  else if (!v12)
  {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 926, @"Invalid parameter not satisfying: %@", @"current == nil || [(MPAVItem *)current isKindOfClass:[MPAVItem class]]" object file lineNumber description];
  }
LABEL_6:
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = +[MFDescription forItemChangeSource:a5];
    if (v13) {
      [v13 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v33 = v11;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    v37 = v17;
    __int16 v38 = 2114;
    v39 = v18;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - currentItemWillChangeFromItem - %{public}@ -> %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x3Eu);
  }
  char v19 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  [v13 time];
  objc_msgSend(v19, "currentItemWillChangeFromItem:toItem:time:", v11, v12);

  id v20 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v12];
  v21 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];
  v22 = v21;
  if (a5 == 1)
  {
    [v21 _willResignActivePlayerItem];
    [v20 _willBecomeActivePlayerItem];
  }
  else if (!a5)
  {
    __int16 v23 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
    v24 = [v23 eventObserver];
    [v24 engine:v23 willChangeToItem:v20 fromItem:v22];
  }
  __int16 v25 = [(_MPCPlaybackEnginePlayer *)self playbackStartTrace];
  id v26 = [v25 item];
  if (v26 == v20)
  {
  }
  else
  {
    uint64_t v27 = v26;
    char v28 = [v26 isEqual:v20];

    if ((v28 & 1) == 0)
    {
      v29 = [(_MPCPlaybackEnginePlayer *)self playbackStartTrace];
      [v29 cancel];

      [(_MPCPlaybackEnginePlayer *)self setPlaybackStartTrace:0];
    }
  }
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (MPCAVItemTrace)playbackStartTrace
{
  return self->_playbackStartTrace;
}

- (void)setPlaybackStartTrace:(id)a3
{
}

- (void)itemDidBecomeCurrent:(id)a3 source:(int64_t)a4 timeStamp:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v12 = [v11 engineID];
  if (v9)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v9];
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = +[MFDescription forItemChangeSource:a4];
      if (v10) {
        [v10 hostTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2114;
      v55 = v13;
      __int16 v56 = 2114;
      v57 = v15;
      __int16 v58 = 2114;
      v59 = v20;
      _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidBecomeCurrent - %{public}@ [Source: %{public}@] - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
    }
    if (a4 == 1)
    {
      v21 = [(_MPCPlaybackEnginePlayer *)self translator];
      [v21 setMPAVItem:v13 forMFPlayerItem:v9];

      [v13 _didBecomeActivePlayerItem];
      v22 = [(_MPCPlaybackEnginePlayer *)self configurator];
      [v22 updatePlayerConfiguration];

      __int16 v23 = [v11 leaseManager];
      [v23 prepareForCurrentItemPlayback];

      v24 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      uint64_t v25 = [v24 currentState];
      id v26 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      uint64_t v27 = v26;
      if (v25 == 1) {
        [v26 targetRate];
      }
      else {
        [v26 rate];
      }
      int v29 = v28;

      LODWORD(v30) = v29;
      [v13 prepareForRate:&__block_literal_global_178 completionHandler:v30];
    }
    v31 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
    [v10 time];
    objc_msgSend(v31, "itemDidBecomeCurrent:time:", v9);

    v32 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v33 = [v32 currentState];

    if (v33 == 1) {
      [(_MPCPlaybackEnginePlayer *)self takeEVSDeferralAssertionForFirstAudioFrame];
    }
    if (!a4)
    {
      __int16 v34 = [v11 queueController];
      [v34 playerItemDidBecomeCurrent:v13];

      id v35 = [v11 queueController];
      __int16 v36 = [v35 currentItem];

      if (v36 == v13)
      {
        v49 = [v11 eventObserver];
        [v49 engine:v11 didChangeToItem:v13];

        [v11 schedulePlaybackStatePreservation];
      }
      else
      {
        v52[0] = @"current queuecontroller item";
        v37 = NSString;
        __int16 v38 = [v11 queueController];
        v39 = [v38 currentItem];
        uint64_t v40 = [v37 stringWithFormat:@"%@", v39];
        v52[1] = @"current player item";
        v53[0] = v40;
        v41 = [NSString stringWithFormat:@"%@", v13];
        v53[1] = v41;
        v42 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

        v43 = (void *)MEMORY[0x263F54EC8];
        uint64_t v44 = *MEMORY[0x263F54E80];
        v51 = v42;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
        [v43 snapshotWithDomain:v44 type:@"Bug" subType:@"itemDidBecomeCurrent" context:@"Mismatch between playback stack current item and queue controller current item" triggerThresholdValues:0 events:v45 completion:0];

        v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [v11 queueController];
          id v48 = [v47 currentItem];
          LODWORD(time.value) = 138543618;
          *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
          LOWORD(time.flags) = 2114;
          *(void *)((char *)&time.flags + 2) = v48;
          _os_log_impl(&dword_21BB87000, v46, OS_LOG_TYPE_DEFAULT, "Mismatch between playback stack current item %{public}@ and queue controller current item %{public}@", (uint8_t *)&time, 0x16u);
        }
      }
    }
  }
  else
  {
    if (a4)
    {
      v50 = [MEMORY[0x263F08690] currentHandler];
      [v50 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 963, @"Invalid parameter not satisfying: %@", @"source == MFItemChangeSourceQueue" object file lineNumber description];
    }
    v16 = [v11 queueController];
    v17 = [v16 targetContentItemID];

    if (!v17)
    {
      v18 = [v11 queueController];
      [v18 playerItemDidBecomeCurrent:0];
    }
    char v19 = [v11 eventObserver];
    [v19 engine:v11 didChangeToItem:0];

    [v11 schedulePlaybackStatePreservation];
  }
}

- (MPCItemBookmarker)bookmarker
{
  return self->_bookmarker;
}

- (void)engine:(id)a3 didChangeQueueController:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(_MPCPlaybackEnginePlayer *)self setupPlaybackStackIfNeeded];
  BOOL v8 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  int v9 = [v8 isModeSolo];

  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  int v11 = [v10 isModeShared];

  id v12 = [v7 musicSharePlay];

  if (v9 && v12)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    [v13 setupForShared];
LABEL_7:

    goto LABEL_8;
  }
  if (v11 && !v12)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    [v13 setupForSolo];
    goto LABEL_7;
  }
LABEL_8:
  v14 = [(_MPCPlaybackEnginePlayer *)self translator];
  v15 = [v14 playbackCoordinator];

  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v6 engineID];
    v18 = [v7 sessionID];
    char v19 = [v7 musicSharePlay];
    *(_DWORD *)buf = 138544130;
    int v29 = v17;
    __int16 v30 = 2114;
    v31 = v18;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2114;
    id v35 = v19;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] engine:didChangeQueueController: | updating playback coordinator [new queue controller] playbackCoordinator=%{public}@ musicSharePlayBehavior=%{public}@", buf, 0x2Au);
  }
  if (v12)
  {
    id v20 = [v7 musicSharePlay];
    [v20 updatePlaybackCoordinator:v15];
  }
  else
  {
    [v15 setDelegate:0];
  }
  self->_jumpIdentifier = 0;
  v21 = (void *)MEMORY[0x263F087E8];
  v22 = [v7 sessionID];
  __int16 v23 = objc_msgSend(v21, "msv_errorWithDomain:code:debugDescription:", @"MPCEnginePlayerError", 8, @"Cancelled to setup a new queue with sessionID %@", v22);

  v24 = [(_MPCPlaybackEnginePlayer *)self errorController];
  [v24 resetWithReason:v23];

  uint64_t v25 = [(_MPCPlaybackEnginePlayer *)self translator];
  [v25 invalidateCache];

  id v26 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v27 = [v7 sessionID];
  [v26 setupForNewQueueWithSessionID:v27];
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)setupPlaybackStackIfNeeded
{
  if (!self->_playbackStackController)
  {
    double v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    os_signpost_id_t v4 = os_signpost_id_generate(v3);

    BOOL v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PlaybackStackInitialSetup", "", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    [(_MPCPlaybackEnginePlayer *)self _setupPlaybackStackWithPlaybackEngine:WeakRetained];

    BOOL v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    int v9 = v8;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)id v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_END, v4, "PlaybackStackInitialSetup", " enableTelemetry=YES ", v10, 2u);
    }
  }
}

- (MPCPlaybackErrorController)errorController
{
  return self->_errorController;
}

- (BOOL)isReloadingPlaybackContext
{
  return self->_reloadingPlaybackContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRelativeVolume, 0);
  objc_storeStrong((id *)&self->_evsDeferralAssertionForFirstAudioFrame, 0);
  objc_storeStrong((id *)&self->_transientAudioSessionController, 0);
  objc_storeStrong((id *)&self->_playbackStartTrace, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_leaseController, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_externalPlaybackController, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_bookmarker, 0);
  objc_storeStrong((id *)&self->_playbackStackController, 0);
  objc_storeStrong((id *)&self->_criticalSectionToken, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setApplicationMusicPlayerCrossFadeDuration:(double)a3
{
  self->_applicationMusicPlayerCrossFadeDuration = a3;
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3
{
  self->_applicationMusicPlayerTransitionType = a3;
}

- (void)setLastReportedVocalAttenuationEnabledState:(BOOL)a3
{
  self->_lastReportedVocalAttenuationEnabledState = a3;
}

- (BOOL)lastReportedVocalAttenuationEnabledState
{
  return self->_lastReportedVocalAttenuationEnabledState;
}

- (void)setCurrentRelativeVolume:(id)a3
{
}

- (void)setEvsDeferralAssertionForFirstAudioFrame:(id)a3
{
}

- (MPCPlaybackEngineEventStreamDeferralAssertion)evsDeferralAssertionForFirstAudioFrame
{
  return self->_evsDeferralAssertionForFirstAudioFrame;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setConfigurator:(id)a3
{
}

- (MPCPlayerItemConfigurator)configurator
{
  return self->_configurator;
}

- (void)setLeaseController:(id)a3
{
}

- (MPCLeaseController)leaseController
{
  return self->_leaseController;
}

- (void)setAssetLoader:(id)a3
{
}

- (MFAssetLoading)assetLoader
{
  return self->_assetLoader;
}

- (void)setExternalPlaybackController:(id)a3
{
}

- (MPCExternalPlaybackController)externalPlaybackController
{
  return self->_externalPlaybackController;
}

- (void)setErrorController:(id)a3
{
}

- (void)setTranslator:(id)a3
{
}

- (void)setBookmarker:(id)a3
{
}

- (void)setCriticalSectionToken:(id)a3
{
}

- (MRCriticalSectionToken)criticalSectionToken
{
  return self->_criticalSectionToken;
}

- (void)setJumpIdentifier:(int64_t)a3
{
  self->_jumpIdentifier = a3;
}

- (int64_t)jumpIdentifier
{
  return self->_jumpIdentifier;
}

- (void)setAutoPlayWhenLikelyToKeepUp:(BOOL)a3
{
  self->_autoPlayWhenLikelyToKeepUp = a3;
}

- (BOOL)autoPlayWhenLikelyToKeepUp
{
  return self->_autoPlayWhenLikelyToKeepUp;
}

- (void)donateMetricsToPlayerItem:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = [v3 AVPlayerItemPerformanceMetrics];
  BOOL v5 = [v4 objectForKeyedSubscript:@"identifier"];

  BOOL v8 = v3;
  id v6 = v3;
  id v7 = v5;
  msv_dispatch_on_main_queue();
}

- (void)invalidateEVSDeferralAssertionForFirstAudioFrame
{
  id v3 = [(_MPCPlaybackEnginePlayer *)self evsDeferralAssertionForFirstAudioFrame];
  [v3 invalidate];

  [(_MPCPlaybackEnginePlayer *)self setEvsDeferralAssertionForFirstAudioFrame:0];

  [(_MPCPlaybackEnginePlayer *)self setCriticalSectionToken:0];
}

- (void)takeEVSDeferralAssertionForFirstAudioFrame
{
  id v3 = [(_MPCPlaybackEnginePlayer *)self evsDeferralAssertionForFirstAudioFrame];

  if (!v3)
  {
    id v6 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
    os_signpost_id_t v4 = [v6 eventStream];
    BOOL v5 = [v4 eventDeliveryDeferralAssertionOfType:1 forReason:@"Waiting First Audio Frame" withTimeout:5.0];
    [(_MPCPlaybackEnginePlayer *)self setEvsDeferralAssertionForFirstAudioFrame:v5];
  }
}

- (void)assetLoadingDidStartForItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v4];
  id v6 = [v5 queueSectionID];
  id v7 = [v5 queueItemID];
  if ([v6 length])
  {
    if ([v7 length])
    {
      BOOL v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
      int v9 = [v8 queueController];
      id v10 = [v9 targetContentItemID];
      id v11 = [v4 contentItemID];
      if (v10 == v11)
      {
      }
      else
      {
        id v12 = v11;
        char v13 = [v10 isEqual:v11];

        if ((v13 & 1) == 0) {
          goto LABEL_13;
        }
      }
      [(_MPCPlaybackEnginePlayer *)self takeEVSDeferralAssertionForFirstAudioFrame];
LABEL_13:
      v15 = [v8 eventStream];
      v16 = NSNumber;
      v17 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "timeControlStatus"));
      v21[2] = v18;
      char v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:3];
      [v15 emitEventType:@"asset-load-begin" payload:v19];

      goto LABEL_14;
    }
    BOOL v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      v14 = "Unexpected assetLoadingDidStartForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v6;
      v14 = "Unexpected assetLoadingDidStartForItem: without sectionID: %{public}@ %{public}@";
LABEL_10:
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_FAULT, v14, buf, 0x16u);
    }
  }
LABEL_14:
}

- (void)assetLoadingDidCompleteForItem:(id)a3 error:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  int v9 = [v8 engineID];
  id v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v6];
  id v11 = [v10 queueSectionID];
  id v12 = [v10 queueItemID];
  if (![(_MPCPlaybackEnginePlayer *)v11 length])
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 138543618;
    id v72 = v6;
    __int16 v73 = 2114;
    v74 = v11;
    uint64_t v25 = "Unexpected assetLoadingDidCompleteForItem: without sectionID: %{public}@ %{public}@";
LABEL_19:
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_46;
  }
  if (![(_MPCPlaybackEnginePlayer *)v12 length])
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 138543618;
    id v72 = v6;
    __int16 v73 = 2114;
    v74 = v12;
    uint64_t v25 = "Unexpected assetLoadingDidCompleteForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_19;
  }
  v63 = v9;
  v64 = v12;
  char v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v14 = [v13 currentQueueItem];

  if (v10 == v14
    && [v8 isVocalAttenuationEnabled]
    && [(_MPCPlaybackEnginePlayer *)self _itemConfigurationIsIncompatibleWithVocalAttenuationState:v10])
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v72 = v63;
      __int16 v73 = 2114;
      v74 = self;
      __int16 v75 = 2114;
      v76 = v10;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - [AP] - Asset loading did finish - Unable to stream asset in vocal attenuation mode [turning off VA] - QueueItem: %{public}@", buf, 0x20u);
    }

    v16 = [v8 vocalAttenuationController];
    -[MPCWhiskyController setEnabled:](v16, 0);
  }
  if (v7)
  {
    id v61 = v6;
    id v17 = v7;
    v18 = [v8 eventStream];
    v69[0] = @"queue-section-id";
    v69[1] = @"queue-item-id";
    v70[0] = v11;
    v70[1] = v64;
    v69[2] = @"rtc-service-id";
    char v19 = [v10 rtcReportingServiceIdentifier];
    uint64_t v20 = v19;
    if (!v19)
    {
      uint64_t v20 = [MEMORY[0x263EFF9D0] null];
    }
    v70[2] = v20;
    v70[3] = v17;
    v69[3] = @"asset-load-error";
    v69[4] = @"time-control-status";
    v21 = NSNumber;
    v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    id v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
    v70[4] = v23;
    __int16 v24 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:5];
    [v18 emitEventType:@"asset-load-end" payload:v24];

    if (!v19) {
    id v7 = v17;
    }
    id v6 = v61;
    int v9 = v63;
    id v12 = v64;
  }
  else
  {
    uint64_t v26 = [(_MPCPlaybackEnginePlayer *)self translator];
    [v26 setMPAVItem:v10 forMFPlayerItem:v6];

    v18 = [v10 modelGenericObject];
    uint64_t v27 = [v18 anyObject];
    uint64_t v60 = [v27 identifiers];

    int v28 = [v10 modelPlayEvent];
    int v29 = [v28 genericObjectRepresentation];
    __int16 v30 = [v29 anyObject];
    v62 = [v30 identifiers];

    if ([v18 type] == 1)
    {
      v31 = [v18 song];
      uint64_t v32 = [v31 isArtistUploadedContent];
    }
    else
    {
      uint64_t v32 = 0;
    }
    v59 = [v8 eventStream];
    v67[0] = @"queue-section-id";
    v67[1] = @"queue-item-id";
    v68[0] = v11;
    v68[1] = v64;
    v67[2] = @"rtc-service-id";
    uint64_t v33 = [v10 rtcReportingServiceIdentifier];
    v57 = (void *)v33;
    if (!v33)
    {
      uint64_t v33 = [MEMORY[0x263EFF9D0] null];
    }
    v50 = (void *)v33;
    v68[2] = v33;
    v67[3] = @"item-ids";
    uint64_t v34 = (uint64_t)v60;
    if (!v60)
    {
      uint64_t v34 = [MEMORY[0x263EFF9D0] null];
    }
    v49 = (void *)v34;
    v68[3] = v34;
    v67[4] = @"item-kind";
    uint64_t v35 = [v60 modelKind];
    __int16 v58 = (void *)v35;
    if (!v35)
    {
      uint64_t v35 = [MEMORY[0x263EFF9D0] null];
    }
    id v48 = (void *)v35;
    v68[4] = v35;
    v67[5] = @"item-metadata";
    v65[0] = @"item-has-video";
    __int16 v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isVideoContent"));
    v66[0] = v56;
    v65[1] = @"item-duration";
    [v10 durationFromExternalMetadata];
    uint64_t v36 = NSNumber;
    [v10 durationFromExternalMetadata];
    v55 = objc_msgSend(v36, "numberWithDouble:");
    v66[1] = v55;
    v65[2] = @"item-initial-position";
    uint64_t v37 = [v10 initialPlaybackStartTime];
    __int16 v38 = &unk_26CC18C00;
    v54 = (void *)v37;
    if (v37) {
      __int16 v38 = (void *)v37;
    }
    v66[2] = v38;
    v65[3] = @"item-artist-uploaded";
    v53 = [NSNumber numberWithBool:v32];
    v66[3] = v53;
    v65[4] = @"item-is-start-item";
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isStartItem"));
    v52 = v65[5] = @"item-is-placeholder";
    v66[4] = v52;
    v66[5] = MEMORY[0x263EFFA80];
    v51 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:6];
    v68[5] = v51;
    v67[6] = @"container-ids";
    uint64_t v39 = (uint64_t)v62;
    if (!v62)
    {
      uint64_t v39 = [MEMORY[0x263EFF9D0] null];
    }
    v68[6] = v39;
    v67[7] = @"container-kind";
    uint64_t v40 = objc_msgSend(v62, "modelKind", v39);
    v41 = v40;
    if (!v40)
    {
      v41 = [MEMORY[0x263EFF9D0] null];
    }
    v68[7] = v41;
    v67[8] = @"time-control-status";
    v42 = NSNumber;
    v43 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v44 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "timeControlStatus"));
    v68[8] = v44;
    v45 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:9];
    [v59 emitEventType:@"asset-load-end" payload:v45];

    if (!v40) {
    id v12 = v64;
    }
    if (!v62) {

    }
    id v7 = 0;
    v46 = v58;
    int v9 = v63;
    if (!v58)
    {

      v46 = 0;
    }

    if (!v60) {
    if (!v57)
    }
  }
LABEL_46:
}

- (void)renderingModeDidChange:(int64_t)a3 timeStamp:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v7 = [v6 engineID];
  BOOL v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    __int16 v17 = 2114;
    v18 = self;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - renderingModeDidChange:%ld", buf, 0x20u);
  }

  int v9 = [(_MPCPlaybackEnginePlayer *)self currentItem];
  if ([v9 isAssetLoaded]) {
    [(_MPCPlaybackEnginePlayer *)self _updateActiveFormatForQueueItem:v9];
  }
  id v10 = [v6 eventStream];
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"audio-rendering-mode");
  v14 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v10 emitEventType:@"audio-rendering-mode-changed" payload:v12];
}

- (void)itemIsReadyForMetrics:(id)a3 accessLog:(id)a4
{
  uint64_t v44 = self;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v45 = v5;
  id v7 = [v5 events];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "performanceMetrics", v44);

        if (v13)
        {
          v14 = [v12 performanceMetrics];
          [v6 addEntriesFromDictionary:v14];
        }
        [v12 observedBitrate];
        if (v15 > 0.0)
        {
          v16 = NSNumber;
          [v12 observedBitrate];
          __int16 v17 = objc_msgSend(v16, "numberWithDouble:");
          [v6 setObject:v17 forKeyedSubscript:@"observedBitrate"];
        }
        [v12 indicatedBitrate];
        if (v18 > 0.0)
        {
          __int16 v19 = NSNumber;
          [v12 indicatedBitrate];
          int64_t v20 = objc_msgSend(v19, "numberWithDouble:");
          [v6 setObject:v20 forKeyedSubscript:@"indicatedBitrate"];
        }
        [v12 startupTime];
        if (v21 > 0.0)
        {
          v22 = NSNumber;
          [v12 startupTime];
          id v23 = objc_msgSend(v22, "numberWithDouble:");
          [v6 setObject:v23 forKeyedSubscript:@"startupTime"];
        }
        [v12 segmentsDownloadedDuration];
        if (v24 > 0.0)
        {
          uint64_t v25 = NSNumber;
          [v12 segmentsDownloadedDuration];
          uint64_t v26 = objc_msgSend(v25, "numberWithDouble:");
          [v6 setObject:v26 forKeyedSubscript:@"segmentsDownloadedDuration"];
        }
        if ([v12 numberOfBytesTransferred] >= 1)
        {
          uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "numberOfBytesTransferred"));
          [v6 setObject:v27 forKeyedSubscript:@"numberOfBytesTransferred"];
        }
        int v28 = [v12 playbackSessionID];

        if (v28)
        {
          int v29 = [v12 playbackSessionID];
          [v6 setObject:v29 forKeyedSubscript:@"playbackSessionID"];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v9);
  }

  __int16 v30 = [v48 avPlayerItem];
  v31 = objc_msgSend(v30, "mpc_playerItemIdentifier");
  [v6 setObject:v31 forKeyedSubscript:@"identifier"];

  uint64_t v32 = [(_MPCPlaybackEnginePlayer *)v44 playbackEngine];
  uint64_t v33 = [v32 engineID];
  uint64_t v34 = [(_MPCPlaybackEnginePlayer *)v44 _MPAVItemForMFQueuePlayerItem:v48];
  v47 = [v34 queueSectionID];
  v46 = [v34 queueItemID];
  id v49 = 0;
  uint64_t v35 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v49];
  id v36 = v49;
  if (v36)
  {
    uint64_t v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v57 = v33;
      __int16 v58 = 2048;
      v59 = v44;
      __int16 v60 = 2114;
      id v61 = v36;
      __int16 v62 = 2114;
      v63 = v6;
      _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - performanceMetricsPostedForItem received bad metrics - error: %{public}@ - metrics: %{public}@", buf, 0x2Au);
    }
    __int16 v38 = (void *)v35;

    uint64_t v39 = 0;
  }
  else
  {
    __int16 v38 = (void *)v35;
    uint64_t v39 = (void *)[[NSString alloc] initWithData:v35 encoding:4];
  }
  uint64_t v40 = (void *)v33;
  v41 = objc_msgSend(v32, "eventStream", v44);
  v54[0] = @"queue-section-id";
  v54[1] = @"queue-item-id";
  v55[0] = v47;
  v55[1] = v46;
  v54[2] = @"av-player-item-performance-metrics";
  v42 = v39;
  if (!v39)
  {
    v42 = [MEMORY[0x263EFF9D0] null];
  }
  v55[2] = v42;
  v43 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];
  [v41 emitEventType:@"item-ready-for-metrics" payload:v43];

  if (!v39) {
}
  }

- (void)didPerformPlayerOperationWithPlayerIdentifier:(id)a3 items:(id)a4 operation:(id)a5
{
  v16[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v12 = [v11 eventStream];
  v15[0] = @"player-identifier";
  v15[1] = @"player-operation";
  v16[0] = v8;
  v16[1] = v10;
  v15[2] = @"player-items";
  uint64_t v13 = v9;
  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
  }
  v16[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v12 emitEventType:@"player-operation-end" payload:v14];

  if (!v9) {
}
  }

- (void)willPerformPlayerOperationWithPlayerIdentifier:(id)a3 operation:(id)a4 reason:(id)a5
{
  void v15[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v12 = [v11 eventStream];
  v14[0] = @"player-identifier";
  v14[1] = @"player-operation";
  v15[0] = v10;
  v15[1] = v9;
  v14[2] = @"player-operation-reason";
  v15[2] = v8;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  [v12 emitEventType:@"player-operation-begin" payload:v13];
}

- (void)stackControllerDidCancelTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 reason:(id)a6
{
  v23[6] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a4;
  id v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:a3];
  uint64_t v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];

  double v21 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  v14 = [v21 eventStream];
  v22[0] = @"outgoing-item-section-id";
  double v15 = [v12 queueSectionID];
  v23[0] = v15;
  v22[1] = @"outgoing-item-id";
  v16 = [v12 queueItemID];
  v23[1] = v16;
  v22[2] = @"incoming-item-section-id";
  __int16 v17 = [v13 queueSectionID];
  v23[2] = v17;
  v22[3] = @"incoming-item-id";
  double v18 = [v13 queueItemID];
  v23[3] = v18;
  v22[4] = @"transition-type";
  __int16 v19 = [NSNumber numberWithInteger:a5];
  v22[5] = @"transition-cancellation-reason";
  v23[4] = v19;
  v23[5] = v10;
  int64_t v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

  [v14 emitEventType:@"item-transition-cancelled" payload:v20];
}

- (void)stackControllerDidCreateTransitionFrom:(id)a3 to:(id)a4 type:(int64_t)a5 parameters:(id)a6
{
  v23[6] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a4;
  id v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:a3];
  uint64_t v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];

  double v21 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  v14 = [v21 eventStream];
  v22[0] = @"outgoing-item-section-id";
  double v15 = [v12 queueSectionID];
  v23[0] = v15;
  v22[1] = @"outgoing-item-id";
  v16 = [v12 queueItemID];
  v23[1] = v16;
  v22[2] = @"incoming-item-section-id";
  __int16 v17 = [v13 queueSectionID];
  v23[2] = v17;
  v22[3] = @"incoming-item-id";
  double v18 = [v13 queueItemID];
  v23[3] = v18;
  v22[4] = @"transition-type";
  __int16 v19 = [NSNumber numberWithInteger:a5];
  v22[5] = @"transition-parameters";
  v23[4] = v19;
  v23[5] = v10;
  int64_t v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

  [v14 emitEventType:@"item-transition-created" payload:v20];
}

- (void)errorResolutionDidEndForItem:(id)a3 error:(id)a4 resolution:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];

  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = +[MFDescription forErrorResolution:a5];
    int v14 = 138544386;
    double v15 = v11;
    __int16 v16 = 2114;
    __int16 v17 = self;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v13;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - errorResolutionDidEndForItem: - item=%{public}@ - error:%{public}@ - resolution:%{public}@", (uint8_t *)&v14, 0x34u);
  }
}

- (void)errorResolutionDidStartForItem:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138544130;
    id v12 = v9;
    __int16 v13 = 2114;
    int v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - errorResolutionDidStartForItem: - item=%{public}@ - error:%{public}@", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)didReportSignpostWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(_MPCPlaybackEnginePlayer *)self playbackStartTrace];
    [v5 endInterval];

    [(_MPCPlaybackEnginePlayer *)self setPlaybackStartTrace:0];
  }
  else if (!a3)
  {
    id v6 = [(_MPCPlaybackEnginePlayer *)self currentItem];
    id v4 = +[MPCAVItemTrace traceIntervalWithName:@"MPTRACE_PLAYBACK_PLAYBACKSTART" item:v6 beginEvent:731643908 endEvent:731643912];
    [(_MPCPlaybackEnginePlayer *)self setPlaybackStartTrace:v4];
  }
}

- (void)relativeVolumeDidChangeTo:(float)a3 timeStamp:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  *(float *)&double v8 = a3;
  id v9 = [NSNumber numberWithFloat:v8];
  [(_MPCPlaybackEnginePlayer *)self setCurrentRelativeVolume:v9];

  *(float *)&double v10 = a3;
  [v7 relativeVolumeDidUpdateToVolume:v10];
  int v11 = [v7 engineID];
  id v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = a3;
    if (v6) {
      [v6 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    int v14 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2050;
    double v16 = v13;
    __int16 v17 = 2114;
    id v18 = v14;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - relativeVolumeDidChangeTo: - volume=%{public}f - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);
  }
}

- (void)firstVideoFrameWasRenderedForItem:(id)a3 timeStamp:(id)a4
{
  v40[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  double v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v6];
  id v11 = v7;
  id v12 = v11;
  if (v11)
  {
    [v11 hostTime];
    if ((v35 & 0x100000000) != 0)
    {
      [v12 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v33, (uint64_t)time);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_6:
  long long v31 = *(_OWORD *)time;
  long long v32 = *(_OWORD *)&time[16];
  [v12 userSecondsSinceReferenceDate];
  uint64_t v14 = v13;

  [v12 time];
  double v16 = v15;
  __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      [v12 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138544130;
    *(void *)&time[4] = v9;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(void *)&time[24] = v10;
    LOWORD(v40[0]) = 2114;
    *(void *)((char *)v40 + 2) = v18;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - firstVideoFrameWasRenderedForItem: - item=%{public}@ - timeStamp:%{public}@", time, 0x2Au);
  }
  uint64_t v19 = [v10 queueSectionID];
  __int16 v20 = [v10 queueItemID];
  if (![v19 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v19;
    int v28 = "Unexpected firstVideoFrameWasRenderedForItem: without sectionID: %{public}@ %{public}@";
LABEL_18:
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_FAULT, v28, time, 0x16u);
    goto LABEL_19;
  }
  if (![v20 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v20;
    int v28 = "Unexpected firstVideoFrameWasRenderedForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_18;
  }
  id v21 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  [v21 eventStream];
  v22 = id v30 = v6;
  v37[0] = @"queue-section-id";
  v37[1] = @"queue-item-id";
  v38[0] = v19;
  v38[1] = v20;
  v37[2] = @"item-start-position";
  id v23 = [NSNumber numberWithDouble:v16];
  v38[2] = v23;
  v37[3] = @"time-control-status";
  int v29 = v9;
  uint64_t v24 = NSNumber;
  uint64_t v25 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v26 = objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "timeControlStatus"));
  v38[3] = v26;
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
  *(_OWORD *)CMTime time = v31;
  *(_OWORD *)&time[16] = v32;
  v40[0] = v14;
  [v22 emitEventType:@"item-first-video-frame" payload:v27 atTime:time];

  id v9 = v29;
  id v6 = v30;
LABEL_19:
}

- (void)playbackIsBlockedOnNonPlayableItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Playback stuck on non-playable item: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  double v8 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v4];
  id v9 = [v5 queueController];
  [v9 playerItemDidBecomeCurrent:v8];
}

- (void)mediaServicesPurgeDidOccurWithTimeStamp:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v6 = [v5 engineID];
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      [v4 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v6;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v23 = v8;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services Resource Reclamation occurred - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);
  }
  uint64_t v19 = v4;
  id v9 = (void *)v6;

  int v10 = [v5 eventStream];
  v20[0] = @"session-id";
  id v11 = [v5 queueController];
  __int16 v12 = [v11 sessionID];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
  }
  v20[1] = @"time-control-status";
  v21[0] = v13;
  __int16 v14 = NSNumber;
  id v15 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
  v21[1] = v16;
  __int16 v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v10 emitEventType:@"media-server-purge" payload:v17];

  if (!v12) {
  id v18 = [v5 eventObserver];
  }
  [v18 engineDidReceiveMediaServicesPurge:v5];

  [(_MPCPlaybackEnginePlayer *)self updateAudioSession];
}

- (void)mediaServicesInterruptionDidEndWithTimeStamp:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v6 = [v5 engineID];
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      [v4 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v6;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v23 = v8;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were restored - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);
  }
  uint64_t v19 = v4;
  id v9 = (void *)v6;

  int v10 = [v5 eventStream];
  v20[0] = @"session-id";
  id v11 = [v5 queueController];
  __int16 v12 = [v11 sessionID];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF9D0] null];
  }
  v20[1] = @"time-control-status";
  v21[0] = v13;
  __int16 v14 = NSNumber;
  id v15 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
  v21[1] = v16;
  __int16 v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v10 emitEventType:@"media-server-reset" payload:v17];

  if (!v12) {
  id v18 = [v5 eventObserver];
  }
  [v18 engineDidResetMediaServices:v5];

  [(_MPCPlaybackEnginePlayer *)self updateAudioSession];
  [(_MPCPlaybackEnginePlayer *)self updateAudioSessionSpeechDetection];
}

- (void)mediaServicesInterruptionDidBeginWithItemAtDeath:(id)a3 timeAtDeath:(double)a4 timeStamp:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];
  uint64_t v26 = v9;
  if (v8)
  {
    __int16 v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v8];
    uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        [v9 hostTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      __int16 v14 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time), v9);
      LODWORD(time.value) = 138544386;
      *(CMTimeValue *)((char *)&time.value + 4) = v11;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = self;
      HIWORD(time.epoch) = 2114;
      id v30 = v12;
      __int16 v31 = 2048;
      double v32 = a4;
      __int16 v33 = 2114;
      uint64_t v34 = v14;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were interrupted - item:%{public}@ - time:%.3fs - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
    }
  }
  else
  {
    __int16 v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    if (v9) {
      [v9 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time), v9);
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v30 = v13;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Media Services were interrupted - no item at death - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);
  }

LABEL_13:
  id v15 = (void *)v11;

  uint64_t v16 = [(_MPCPlaybackEnginePlayer *)self translator];
  [v16 invalidateCache];

  __int16 v17 = [v10 eventStream];
  v27[0] = @"session-id";
  id v18 = [v10 queueController];
  uint64_t v19 = [v18 sessionID];
  __int16 v20 = v19;
  if (!v19)
  {
    __int16 v20 = [MEMORY[0x263EFF9D0] null];
  }
  v27[1] = @"time-control-status";
  v28[0] = v20;
  id v21 = NSNumber;
  __int16 v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  id v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
  v28[1] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v17 emitEventType:@"media-server-died" payload:v24];

  if (!v19) {
  uint64_t v25 = [v10 eventObserver];
  }
  [v25 engineDidLoseMediaServices:v10];
}

- (void)userActionDidEnd:(id)a3 error:(id)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 source] && !-[_MPCPlaybackEnginePlayer _isAVKitSkipAction:](self, "_isAVKitSkipAction:", v6))
  {
    id v8 = [MEMORY[0x263F121D0] successStatus];
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x263F121D0] statusWithCode:200 error:v7];

      id v8 = (void *)v9;
    }
    int v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
    uint64_t v11 = [v10 eventStream];
    v19[0] = @"remote-control-id";
    __int16 v12 = [v6 identifier];
    v20[0] = v12;
    v19[1] = @"remote-control-status";
    id v18 = v8;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v20[1] = v13;
    v19[2] = @"time-control-status";
    __int16 v14 = NSNumber;
    id v15 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "timeControlStatus"));
    void v20[2] = v16;
    __int16 v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
    [v11 emitEventType:@"remote-control-end" payload:v17];
  }
}

- (void)userActionDidBegin:(id)a3
{
  v36[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 source])
  {
    if ([(_MPCPlaybackEnginePlayer *)self _isAVKitSkipAction:v4])
    {
      [(_MPCPlaybackEnginePlayer *)self _performSkipForUserAction:v4];
      goto LABEL_15;
    }
    unint64_t v5 = [v4 type];
    if (v5 > 8) {
      uint64_t v6 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v6 = dword_21BEF16E0[v5];
    }
    double v27 = 0.0;
    memset(v26, 0, sizeof(v26));
    MPCPlaybackEngineEventGetMonotonicTime(v26);
    id v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    int v8 = [v7 isModeShared];

    if (!v8)
    {
LABEL_14:
      id v15 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
      uint64_t v16 = [v15 eventStream];
      v35[0] = @"remote-control-id";
      __int16 v17 = [v4 identifier];
      v36[0] = v17;
      v35[1] = @"remote-control-type";
      id v18 = [NSNumber numberWithUnsignedInt:v6];
      v36[1] = v18;
      v35[2] = @"remote-control-source";
      uint64_t v19 = [v4 sourceID];
      v36[2] = v19;
      v35[3] = @"remote-control-options";
      __int16 v20 = [v4 options];
      v36[3] = v20;
      v35[4] = @"time-control-status";
      id v21 = NSNumber;
      __int16 v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      id v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "timeControlStatus"));
      v36[4] = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
      long long v29 = v26[0];
      long long v30 = v26[1];
      double v31 = v27;
      [v16 emitEventType:@"remote-control-begin" payload:v24 atTime:&v29];

      goto LABEL_15;
    }
    id v9 = [v4 timeStamp];
    int v10 = v9;
    if (v9)
    {
      [v9 hostTime];
      if ((v33 & 0x100000000) != 0)
      {
        [v10 hostTime];
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v28, (uint64_t)&v29);
LABEL_13:
        uint64_t v11 = v29;
        uint64_t v12 = *((void *)&v30 + 1);
        objc_msgSend(v10, "userSecondsSinceReferenceDate", *((void *)&v29 + 1), (void)v30);
        double v14 = v13;

        *(void *)&v26[0] = v11;
        *(int64x2_t *)((char *)v26 + 8) = vaddq_s64(v25, vdupq_n_s64(0xFFFFFFFFFFFFFFFBLL));
        *((void *)&v26[1] + 1) = v12;
        double v27 = v14 + -0.000000005;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(&v29);
    goto LABEL_13;
  }
LABEL_15:
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v6 = [v5 engineID];
  id v7 = [v5 eventObserver];
  [v7 engine:v5 didReachEndOfQueueWithReason:v4];

  int v8 = [v5 eventStream];
  __int16 v20 = @"session-id";
  id v9 = [v5 queueController];
  int v10 = [v9 sessionID];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  v21[0] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v8 emitEventType:@"session-reset" payload:v12];

  if (!v10) {
  double v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    id v15 = v6;
    __int16 v16 = 2114;
    __int16 v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - end of queue reached [%{public}@]", (uint8_t *)&v14, 0x20u);
  }
}

- (void)screenRecordingDidChange:(BOOL)a3 timeStamp:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  int v8 = [v7 engineID];

  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      [v6 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138543874;
    *(void *)&time[4] = v8;
    *(_WORD *)&time[12] = 1024;
    *(_DWORD *)&time[14] = v4;
    *(_WORD *)&time[18] = 2114;
    *(void *)&time[20] = v10;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-🚔 Enforcing policy due to screen recording. setMuted/setHidden: %{BOOL}u - timeStamp:%{public}@", time, 0x1Cu);
  }
  uint64_t v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v12 = [v11 eventStream];
  double v13 = v12;
  if (v4) {
    int v14 = @"policy-begin";
  }
  else {
    int v14 = @"policy-end";
  }
  [v12 emitEventType:v14 payload:MEMORY[0x263EFFA78]];
}

- (void)tracksDidChangeForItem:(id)a3 timeStamp:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  int v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v7];

  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      [v6 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v9;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    int v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - tracksDidChange: - item=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);
  }
  [(_MPCPlaybackEnginePlayer *)self _updateActiveFormatForQueueItem:v10];
}

- (void)playbackIsLikelyToKeepUp:(BOOL)a3 forItem:(id)a4 timeStamp:(id)a5
{
  BOOL v6 = a3;
  v56[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];

  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v8];
  id v13 = v9;
  int v14 = v13;
  if (v13)
  {
    [v13 hostTime];
    if ((v49 & 0x100000000) != 0)
    {
      [v14 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v47, (uint64_t)buf);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(buf);
LABEL_6:
  long long v45 = *(_OWORD *)buf;
  long long v46 = *(_OWORD *)&buf[16];
  [v14 userSecondsSinceReferenceDate];
  uint64_t v16 = v15;

  [v14 time];
  double v18 = v17;
  id v19 = [v12 queueSectionID];
  __int16 v20 = [v12 queueItemID];
  if (![v19 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v19;
    int64x2_t v25 = "Unexpected playbackIsLikelyToKeepUp:forItem: without sectionID: %{public}@ %{public}@";
LABEL_17:
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_29;
  }
  if (![v20 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    int64x2_t v25 = "Unexpected playbackIsLikelyToKeepUp:forItem: without itemID: %{public}@ %{public}@";
    goto LABEL_17;
  }
  uint64_t v44 = v11;
  id v21 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  __int16 v22 = [v21 queueController];
  id v23 = [v22 currentItem];

  if (v12 == v23)
  {
    if (v6)
    {
      +[MPCAVItemTrace traceWithName:@"MPTRACE_PLAYBACK_STREAM_LIKELYTOKEEPUP" item:v12 event:731643956];
      uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (v14) {
          [v14 hostTime];
        }
        else {
          memset(buf, 0, 24);
        }
        double v27 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)buf));
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v12;
        LOWORD(v56[0]) = 2114;
        *(void *)((char *)v56 + 2) = v27;
        _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackIsLikelyToKeepUp: - Likely - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);
      }
      CMTime v28 = [v21 eventObserver];
      [v28 engine:v21 didAchieveLikelyToKeepUpWithItem:v12];

      uint64_t v29 = [v21 eventStream];
      v53[0] = @"queue-section-id";
      v53[1] = @"queue-item-id";
      v54[0] = v19;
      v54[1] = v20;
      void v53[2] = @"item-start-position";
      v43 = [NSNumber numberWithDouble:v18];
      v54[2] = v43;
      v53[3] = @"time-control-status";
      long long v30 = NSNumber;
      double v31 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      uint64_t v32 = [v31 timeControlStatus];
      uint64_t v33 = v30;
      uint64_t v34 = (void *)v29;
      uint64_t v35 = [v33 numberWithInteger:v32];
      void v54[3] = v35;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:4];
      *(_OWORD *)buf = v45;
      *(_OWORD *)&uint8_t buf[16] = v46;
      v56[0] = v16;
      uint64_t v37 = @"item-buffer-ready";
    }
    else
    {
      +[MPCAVItemTrace traceWithName:@"MPTRACE_PLAYBACK_STREAM_UNLIKELYTOKEEPUP" item:v12 event:731643960];
      uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        if (v14) {
          [v14 hostTime];
        }
        else {
          memset(buf, 0, 24);
        }
        __int16 v38 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)buf));
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v12;
        LOWORD(v56[0]) = 2114;
        *(void *)((char *)v56 + 2) = v38;
        _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackIsLikelyToKeepUp: - Unlikely - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);
      }
      uint64_t v39 = [v21 eventStream];
      v51[0] = @"queue-section-id";
      v51[1] = @"queue-item-id";
      v52[0] = v19;
      v52[1] = v20;
      v51[2] = @"item-end-position";
      v43 = [NSNumber numberWithDouble:v18];
      void v52[2] = v43;
      v51[3] = @"time-control-status";
      uint64_t v40 = NSNumber;
      double v31 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      uint64_t v41 = [v31 timeControlStatus];
      v42 = v40;
      uint64_t v34 = (void *)v39;
      uint64_t v35 = [v42 numberWithInteger:v41];
      v52[3] = v35;
      uint64_t v36 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
      *(_OWORD *)buf = v45;
      *(_OWORD *)&uint8_t buf[16] = v46;
      v56[0] = v16;
      uint64_t v37 = @"item-buffer-stall";
    }
    [v34 emitEventType:v37 payload:v36 atTime:buf];
  }
  uint64_t v11 = v44;
LABEL_29:
}

- (void)playbackBufferStateDidChangeToState:(int64_t)a3 forItem:(id)a4 timeStamp:(id)a5
{
  void v54[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];

  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v8];
  id v13 = v9;
  int v14 = v13;
  if (v13)
  {
    [v13 hostTime];
    if ((v47 & 0x100000000) != 0)
    {
      [v14 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v45, (uint64_t)buf);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(buf);
LABEL_6:
  long long v43 = *(_OWORD *)buf;
  long long v44 = *(_OWORD *)&buf[16];
  [v14 userSecondsSinceReferenceDate];
  uint64_t v16 = v15;

  [v14 time];
  double v18 = v17;
  id v19 = [v12 queueSectionID];
  __int16 v20 = [v12 queueItemID];
  if (![v19 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v19;
    int64x2_t v25 = "Unexpected playbackBufferStateDidChangeToState:forItem: without sectionID: %{public}@ %{public}@";
LABEL_18:
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_30;
  }
  if (![v20 length])
  {
    id v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    int64x2_t v25 = "Unexpected playbackBufferStateDidChangeToState:forItem: without itemID: %{public}@ %{public}@";
    goto LABEL_18;
  }
  v42 = v11;
  id v21 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  __int16 v22 = [v21 queueController];
  id v23 = [v22 currentItem];

  if (v12 != v23)
  {
LABEL_29:
    uint64_t v11 = v42;
    goto LABEL_30;
  }
  uint64_t v11 = v42;
  if (a3 == 1)
  {
    +[MPCAVItemTrace traceWithName:@"MPTRACE_PLAYBACK_STREAM_RANDRY" item:v12 event:731643952];
    uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        [v14 hostTime];
      }
      else {
        memset(buf, 0, 24);
      }
      uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)buf));
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v12;
      LOWORD(v54[0]) = 2114;
      *(void *)((char *)v54 + 2) = v37;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackBufferStateDidChangeToState: - state=Empty - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);
    }
    uint64_t v41 = [v21 eventStream];
    v49[0] = @"queue-section-id";
    v49[1] = @"queue-item-id";
    v50[0] = v19;
    v50[1] = v20;
    v49[2] = @"item-end-position";
    uint64_t v40 = [NSNumber numberWithDouble:v18];
    v50[2] = v40;
    v49[3] = @"time-control-status";
    __int16 v38 = NSNumber;
    uint64_t v35 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v36 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v35, "timeControlStatus"));
    v50[3] = v36;
    uint64_t v39 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
    *(_OWORD *)buf = v43;
    *(_OWORD *)&uint8_t buf[16] = v44;
    v54[0] = v16;
    uint64_t v34 = v41;
    [v41 emitEventType:@"item-buffer-stall" payload:v39 atTime:buf];

    double v31 = (void *)v40;
    goto LABEL_28;
  }
  if (!a3)
  {
    +[MPCAVItemTrace traceWithName:@"MPTRACE_PLAYBACK_STREAM_BUFFERFULL" item:v12 event:731643948];
    uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        [v14 hostTime];
      }
      else {
        memset(buf, 0, 24);
      }
      double v27 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)buf));
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v12;
      LOWORD(v54[0]) = 2114;
      *(void *)((char *)v54 + 2) = v27;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackBufferStateDidChangeToState: - state=Full - item=%{public}@ - timeStamp:%{public}@", buf, 0x2Au);
    }
    CMTime v28 = [v21 eventObserver];
    [v28 engine:v21 didAchieveLikelyToKeepUpWithItem:v12];

    uint64_t v29 = [v21 eventStream];
    v51[0] = @"queue-section-id";
    v51[1] = @"queue-item-id";
    v52[0] = v19;
    v52[1] = v20;
    v51[2] = @"time-control-status";
    long long v30 = NSNumber;
    double v31 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v32 = [v31 timeControlStatus];
    uint64_t v33 = v30;
    uint64_t v34 = (void *)v29;
    uint64_t v35 = [v33 numberWithInteger:v32];
    void v52[2] = v35;
    uint64_t v36 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
    *(_OWORD *)buf = v43;
    *(_OWORD *)&uint8_t buf[16] = v44;
    v54[0] = v16;
    [v34 emitEventType:@"item-buffer-finish" payload:v36 atTime:buf];
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:
}

- (void)interruptionDidFinishForInterruptor:(id)a3 shouldResume:(BOOL)a4 timeStamp:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];

  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      [v9 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2114;
    int64x2_t v25 = v13;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - interruptionDidFinishForInterruptor:shouldResume: - interruptor=%{public}@ - shouldResume=%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x30u);
  }
  int v14 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v15 = [v14 eventStream];
  v18[0] = @"interrupt-name";
  v18[1] = @"interrupt-should-resume";
  v19[0] = v8;
  uint64_t v16 = [NSNumber numberWithBool:v6];
  v19[1] = v16;
  double v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v15 emitEventType:@"interrupt-end" payload:v17];
}

- (void)interruptionDidBeginWithInterruptor:(id)a3 timeStamp:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      [v7 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v9;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    __int16 v20 = v11;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - interruptionDidBeginWithInterruptor - interruptor=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);
  }
  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v13 = [v12 eventStream];
  uint64_t v15 = @"interrupt-name";
  id v16 = v6;
  int v14 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v13 emitEventType:@"interrupt-begin" payload:v14];
}

- (void)stateDidChangeFromState:(int64_t)a3 toState:(int64_t)a4 timeStamp:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v29 = a5;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  CMTime v28 = [v8 engineID];

  uint64_t v9 = 3;
  switch(a4)
  {
    case 0:
      uint64_t v9 = 0;
      uint64_t v10 = 3;
      goto LABEL_10;
    case 1:
      uint64_t v9 = 2;
      goto LABEL_6;
    case 2:
      uint64_t v9 = 1;
LABEL_6:
      int64_t v27 = a4;
      break;
    case 3:
      uint64_t v9 = 4;
      goto LABEL_9;
    case 4:
      uint64_t v9 = 5;
      goto LABEL_9;
    case 5:
LABEL_9:
      uint64_t v10 = 1000;
LABEL_10:
      int64_t v27 = v10;
      break;
    case 6:
      int64_t v27 = 1;
      uint64_t v9 = 2;
      break;
    case 7:
      int64_t v27 = 4;
      uint64_t v9 = 6;
      break;
    default:
      int64_t v27 = 0;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  uint64_t v11 = 3;
  switch(a3)
  {
    case 0:
      uint64_t v11 = 0;
      int64_t v12 = 3;
      break;
    case 1:
      uint64_t v11 = 2;
      goto LABEL_18;
    case 2:
      uint64_t v11 = 1;
LABEL_18:
      int64_t v12 = a3;
      break;
    case 3:
      uint64_t v11 = 4;
      goto LABEL_21;
    case 4:
      uint64_t v11 = 5;
      goto LABEL_21;
    case 5:
LABEL_21:
      int64_t v12 = 1000;
      break;
    case 6:
      int64_t v12 = 1;
      uint64_t v11 = 2;
      break;
    case 7:
      int64_t v12 = 4;
      uint64_t v11 = 6;
      break;
    default:
      int64_t v12 = 0;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = +[MFDescription forPlayerState:a3];
    uint64_t v15 = +[MFDescription forPlayerState:a4];
    if (v29) {
      [v29 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138545410;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    double v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    __int16 v34 = 2048;
    int64_t v35 = v12;
    __int16 v36 = 2114;
    uint64_t v37 = v15;
    __int16 v38 = 2048;
    uint64_t v39 = v9;
    __int16 v40 = 2048;
    int64_t v41 = v27;
    __int16 v42 = 2114;
    long long v43 = v16;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - stateDidChange - [%{public}@/MP:%ld/NP:%ld -> %{public}@/MP:%ld/NP:%ld] - timeStamp:%{public}@", (uint8_t *)&time, 0x5Cu);
  }
  double v17 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  id v18 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  __int16 v19 = [v18 currentQueueItem];
  [(_MPCPlaybackEnginePlayer *)self currentTime];
  double v21 = v20;
  __int16 v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v22 rate];
  LODWORD(v24) = v23;
  [v17 playbackStateDidChangeFromState:a3 toState:a4 forItem:v19 time:v21 rate:v24];

  if (a3 != a4)
  {
    int64x2_t v25 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
    uint64_t v26 = [v25 eventObserver];
    [v26 engine:v25 didChangeToState:v27];
  }
}

- (void)routeDidChange:(BOOL)a3 metadata:(id)a4 timeStamp:(id)a5
{
  BOOL v6 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];

  int64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 routeDescription];
    int v14 = [v8 isAirplay];
    if (v9) {
      [v9 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 1024;
    BOOL v35 = v6;
    __int16 v36 = 2114;
    uint64_t v37 = v13;
    __int16 v38 = 1024;
    int v39 = v14;
    __int16 v40 = 2114;
    int64_t v41 = v15;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - routeDidChange - shouldPause=%{BOOL}u - route:%{public}@ - isAirplay=%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x36u);
  }
  CMTime v28 = (void *)v11;
  id v29 = v9;

  int64_t v27 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v16 = [v27 eventStream];
  v32[0] = @"route-metadata";
  v30[0] = @"route-description";
  double v17 = [v8 routeDescription];
  id v18 = v17;
  if (!v17)
  {
    id v18 = [MEMORY[0x263EFF9D0] null];
  }
  v30[1] = @"route-is-airplay";
  v31[0] = v18;
  objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isAirplay"));
  __int16 v19 = v26 = v8;
  v31[1] = v19;
  double v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v33[0] = v20;
  v32[1] = @"route-should-pause";
  double v21 = [NSNumber numberWithBool:v6];
  v33[1] = v21;
  v32[2] = @"time-control-status";
  __int16 v22 = NSNumber;
  int v23 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  double v24 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "timeControlStatus"));
  v33[2] = v24;
  int64x2_t v25 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  [v16 emitEventType:@"audio-route-changed" payload:v25];

  if (!v17) {
}
  }

- (void)playbackWaitingToPlayForItem:(id)a3 reason:(id)a4 timeStamp:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  int64_t v12 = [v11 engineID];

  id v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v8];
  int v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      [v10 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v18 = v13;
    __int16 v19 = 2114;
    id v20 = v9;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackWaitingToPlayFor - item=%{public}@ - reason:%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
  }
  id v16 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  [v10 time];
  objc_msgSend(v16, "playbackDidStopForItem:time:", v8);
}

- (void)timeControlStatusDidChange:(int64_t)a3 waitingReason:(id)a4 timeStamp:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];

  int64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = +[MFDescription forTimeControlStatus:a3];
    if (v9) {
      [v9 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    int v14 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    __int16 v22 = v13;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = v14;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - timeControlStatusDidChange - status:%{public}@ - reason:%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
  }
  uint64_t v15 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v16 = [v15 eventStream];
  v19[0] = @"time-control-status";
  double v17 = [NSNumber numberWithInteger:a3];
  v19[1] = @"time-control-status-reason";
  v20[0] = v17;
  v20[1] = v8;
  id v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v16 emitEventType:@"time-control-status-changed" payload:v18];
}

- (void)firstFrameWillRenderForItem:(id)a3 timeStamp:(id)a4
{
  void v52[3] = *(double *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];
  id v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v6];
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [v7 time];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v10;
    LOWORD(v52[0]) = 2050;
    *(void *)((char *)v52 + 2) = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - firstFrameWillRenderForItem - item=%{public}@ - startTime:%{public}.2f", buf, 0x2Au);
  }

  id v13 = [v10 queueSectionID];
  int v14 = [v10 queueItemID];
  if (![v13 length])
  {
    __int16 v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      int v39 = "Unexpected firstFrameWillRenderForItem: without sectionID: %{public}@ %{public}@";
LABEL_18:
      _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_FAULT, v39, buf, 0x16u);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (![v14 length])
  {
    __int16 v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      int v39 = "Unexpected firstFrameWillRenderForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v15 = (OpaqueCMTimebase *)[v10 timebase];
  [v7 time];
  double v17 = v16;
  id v18 = v10;
  long long v43 = v8;
  __int16 v19 = v18;
  if (v17 >= 0.0) {
    double v20 = v17;
  }
  else {
    double v20 = 0.0;
  }
  [v18 initialPlaybackStartTime];
  v21 = __int16 v40 = v9;
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = [v19 lastChangeDirection];
  if (vabdd_f64(v20, v23) < 0.5) {
    double v25 = v23;
  }
  else {
    double v25 = v20;
  }
  if (v24) {
    double v20 = v25;
  }

  CMTimebaseGetTime(&time, v15);
  double Seconds = CMTimeGetSeconds(&time);
  v52[0] = 0.0;
  memset(buf, 0, sizeof(buf));
  MPCPlaybackEngineEventGetMonotonicTime(buf);
  double v27 = v20 - Seconds;
  CMTime v28 = [v43 eventStream];
  v49[0] = @"queue-section-id";
  v49[1] = @"queue-item-id";
  v50[0] = v13;
  v50[1] = v14;
  v49[2] = @"item-start-position";
  id v29 = [NSNumber numberWithDouble:v20];
  v50[2] = v29;
  v49[3] = @"event-time-offset";
  long long v30 = [NSNumber numberWithDouble:v27];
  v50[3] = v30;
  void v49[4] = @"time-control-status";
  id v41 = v7;
  double v31 = NSNumber;
  __int16 v32 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v33 = objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "timeControlStatus"));
  void v50[4] = v33;
  [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
  __int16 v34 = v42 = v6;
  v44[0] = *(_OWORD *)buf;
  v44[1] = *(_OWORD *)&buf[16];
  double v45 = v52[0];
  [v28 emitEventType:@"item-first-audio-frame" payload:v34 atTime:v44];

  id v9 = v40;
  id v8 = v43;
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  BOOL v35 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v27 + v52[0]];
  __int16 v36 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v47 = @"MPCPlaybackEngineFirstAudioFrameDateKey";
  uint64_t v48 = v35;
  uint64_t v37 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  [v36 postNotificationName:@"MPCPlaybackEngineFirstAudioFrameNotification" object:v43 userInfo:v37];

  id v6 = v42;
  id v7 = v41;

LABEL_20:
}

- (void)effectiveRateDidChangeTo:(float)a3 forItem:(id)a4 timeStamp:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v11 = [v10 engineID];
  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v9];

  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v8 time];
    int v21 = 138544386;
    double v22 = v11;
    __int16 v23 = 2114;
    uint64_t v24 = self;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    __int16 v27 = 2048;
    double v28 = a3;
    __int16 v29 = 2050;
    uint64_t v30 = v14;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - effectiveRateDidChange - item=%{public}@ - effectiveRate: %.2f - startTime:%{public}.2f", (uint8_t *)&v21, 0x34u);
  }

  uint64_t v15 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v16 = [v15 timeControlStatus];

  if ((unint64_t)(v16 - 1) <= 1)
  {
    [v8 time];
    -[_MPCPlaybackEnginePlayer _adjustPlayerTimeForAudioTapProcessing:](self, "_adjustPlayerTimeForAudioTapProcessing:");
    double v18 = v17;
    __int16 v19 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
    *(float *)&double v20 = a3;
    [v19 updateDurationSnapshotWithTime:v12 forItem:v18 rate:v20];
  }
}

- (void)playbackRateDidChangeNotifiedForItem:(id)a3 newRate:(float)a4 reason:(id)a5 participantIdentifier:(id)a6 timeStamp:(id)a7
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = (__CFString *)a5;
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  uint64_t v16 = (__CFString *)a6;
  id v17 = a7;
  double v18 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v19 = [v18 engineID];

  double v20 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v14];
  int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v17) {
      [v17 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    double v22 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138544898;
    *(void *)&time[4] = v19;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(void *)&time[24] = v20;
    *(_WORD *)__int16 v60 = 2048;
    *(double *)&v60[2] = a4;
    __int16 v61 = 2114;
    __int16 v62 = v15;
    __int16 v63 = 2114;
    v64 = v16;
    __int16 v65 = 2114;
    v66 = v22;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackRateDidChangeNotifiedForItem - item=%{public}@ - rate:%1.2f - reason:%{public}@ - participant:%{public}@ - timeStamp:%{public}@", time, 0x48u);
  }
  id v23 = v17;
  uint64_t v24 = v23;
  uint64_t v50 = v16;
  if (v23)
  {
    [v23 hostTime];
    if ((v55 & 0x100000000) != 0)
    {
      __int16 v25 = v15;
      [v24 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v53, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
  }
  __int16 v25 = v15;
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  long long v51 = *(_OWORD *)time;
  long long v52 = *(_OWORD *)&time[16];
  [v24 userSecondsSinceReferenceDate];
  uint64_t v27 = v26;

  double v28 = [v20 queueSectionID];
  uint64_t v48 = v20;
  __int16 v29 = [v20 queueItemID];
  uint64_t v49 = (void *)v19;
  if (![v28 length])
  {
    uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CMTime time = 138543618;
      *(void *)&time[4] = v14;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = v28;
      uint64_t v44 = "Unexpected playbackRateDidChangeNotifiedForItem: without sectionID: %{public}@ %{public}@";
LABEL_24:
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_FAULT, v44, time, 0x16u);
    }
LABEL_25:
    __int16 v36 = v25;
    __int16 v38 = v50;
    goto LABEL_26;
  }
  if (![v29 length])
  {
    uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CMTime time = 138543618;
      *(void *)&time[4] = v14;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = v29;
      uint64_t v44 = "Unexpected playbackRateDidChangeNotifiedForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v30 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v31 = [v30 eventStream];
  v57[0] = @"queue-section-id";
  v57[1] = @"queue-item-id";
  v58[0] = v28;
  v58[1] = v29;
  v57[2] = @"item-rate-change-position";
  uint64_t v47 = v14;
  __int16 v32 = NSNumber;
  [v24 time];
  double v45 = objc_msgSend(v32, "numberWithDouble:");
  v58[2] = v45;
  v57[3] = @"item-rate";
  *(float *)&double v33 = a4;
  uint64_t v34 = [NSNumber numberWithFloat:v33];
  uint64_t v46 = v29;
  BOOL v35 = (void *)v34;
  __int16 v36 = v25;
  if (v25) {
    uint64_t v37 = v25;
  }
  else {
    uint64_t v37 = &stru_26CBCA930;
  }
  v58[3] = v34;
  v58[4] = v37;
  v57[4] = @"item-rate-change-reason";
  v57[5] = @"item-rate-change-participant-id";
  __int16 v38 = v50;
  if (v50) {
    int v39 = v50;
  }
  else {
    int v39 = &stru_26CBCA930;
  }
  v58[5] = v39;
  v57[6] = @"time-control-status";
  __int16 v40 = NSNumber;
  id v41 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  id v42 = objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v41, "timeControlStatus"));
  v58[6] = v42;
  long long v43 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:7];
  *(_OWORD *)CMTime time = v51;
  *(_OWORD *)&time[16] = v52;
  *(void *)__int16 v60 = v27;
  [v31 emitEventType:@"item-rate-changed" payload:v43 atTime:time];

  uint64_t v14 = v47;
  __int16 v29 = v46;

LABEL_26:
}

- (void)playbackRateDidChangeToRate:(float)a3 forItem:(id)a4 timeStamp:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v9];
  uint64_t v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v12 = [v11 engineID];

  id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      [v8 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544386;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    double v21 = a3;
    __int16 v22 = 2114;
    id v23 = v14;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackRateDidChangeToRate - item=%{public}@ - rate:%1.2f - timeStamp:%{public}@", (uint8_t *)&time, 0x34u);
  }
  uint64_t v15 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  [v8 time];
  double v17 = v16;
  *(float *)&double v16 = a3;
  [v15 playbackRateDidChangeToRate:v9 forItem:v16 time:v17];
}

- (void)playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 timeStamp:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v15 = [v14 engineID];

  double v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [v13 time];
    uint64_t v18 = v17;
    if (v13) {
      [v13 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v15;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v21 = v10;
    __int16 v22 = 2114;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2048;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    __int16 v29 = v19;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidStopForItem- item=%{public}@ - source:%{public}@ - reason:%{public}@   - time:%.3fs - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);
  }
  [v13 time];
  -[_MPCPlaybackEnginePlayer _playbackDidStopForItem:source:reason:time:](self, "_playbackDidStopForItem:source:reason:time:", v10, v11, v12);
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
}

- (void)playbackDidStartForItem:(id)a3 rate:(float)a4 fromStalling:(BOOL)a5 timeStamp:(id)a6
{
  BOOL v7 = a5;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v67 = [v13 engineID];
  uint64_t v14 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      [v12 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double v16 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v67;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    __int16 v73 = v14;
    __int16 v74 = 2048;
    double v75 = a4;
    __int16 v76 = 1024;
    BOOL v77 = v7;
    __int16 v78 = 2114;
    v79 = v16;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidStartForItem:rate: - item=%{public}@ - rate:%1.2f - from stalling:%{BOOL}u - timeStamp:%{public}@", (uint8_t *)&time, 0x3Au);
  }
  if (v14)
  {
    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v55 = [MEMORY[0x263F08690] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"_MPCPlaybackEnginePlayer.m", 1492, @"Invalid parameter not satisfying: %@", @"queueItem != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_11;
    }
  }
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v13 playerID];
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v67;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = v18;
    HIWORD(time.epoch) = 2114;
    __int16 v73 = v14;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-PSP: Setting hasPlayedSuccessfully: [playbackDidStartForItem] playerID=%{public}@ item=%{public}@", (uint8_t *)&time, 0x20u);
  }
  +[MPCAVItemTrace traceWithName:@"MPTRACE_PLAYBACK_DID_START" item:v14 event:731643976];
  uint64_t v19 = [(_MPCPlaybackEnginePlayer *)self playbackStartTrace];
  [v19 endInterval];

  __int16 v20 = [(_MPCPlaybackEnginePlayer *)self errorController];
  [v20 setItemsHavePlayed:1];

  [v13 schedulePlaybackStatePreservation];
LABEL_11:
  [v12 time];
  double v22 = v21;
  id v23 = v14;
  __int16 v24 = v23;
  if (v22 < 0.0) {
    double v22 = 0.0;
  }
  id v25 = [v23 initialPlaybackStartTime];
  [v25 doubleValue];
  double v27 = v26;

  if ([v24 lastChangeDirection] && vabdd_f64(v22, v27) < 0.5) {
    double v22 = v27;
  }

  __int16 v28 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  *(float *)&double v29 = a4;
  [v28 playbackDidStartForItem:v11 time:v22 rate:v29];

  uint64_t v30 = [v24 queueSectionID];
  uint64_t v31 = [v24 queueItemID];
  if ([v30 length])
  {
    if ([v31 length])
    {
      id v66 = v12;
      if (v7)
      {
        int v32 = [(_MPCPlaybackEnginePlayer *)self lastReportedVocalAttenuationEnabledState];
        BOOL v33 = v32 == [v13 isVocalAttenuationEnabled];
        id v12 = v66;
        if (v33)
        {
LABEL_32:
          -[_MPCPlaybackEnginePlayer setLastReportedVocalAttenuationEnabledState:](self, "setLastReportedVocalAttenuationEnabledState:", [v13 isVocalAttenuationEnabled]);
          id v42 = [v13 eventObserver];
          *(float *)&double v54 = a4;
          [v42 engine:v13 didChangeItemElapsedTime:v22 rate:v54];
          goto LABEL_33;
        }
        v64 = [v13 eventStream];
        v68[0] = @"queue-section-id";
        v68[1] = @"queue-item-id";
        v69[0] = v30;
        v69[1] = v31;
        v68[2] = @"item-start-position";
        __int16 v63 = [NSNumber numberWithDouble:v22];
        v69[2] = v63;
        v68[3] = @"time-control-status";
        uint64_t v34 = NSNumber;
        __int16 v62 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
        __int16 v61 = objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v62, "timeControlStatus"));
        v69[3] = v61;
        v68[4] = @"supports-vocal-attenuation";
        __int16 v60 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "supportsVocalAttenuation"));
        v69[4] = v60;
        v68[5] = @"vocal-attenuation-available";
        v59 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationAvailable"));
        void v69[5] = v59;
        v68[6] = @"vocal-attenuation-enabled";
        __int16 v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationEnabled"));
        v69[6] = v58;
        v68[7] = @"vocal-attenuation-configured";
        uint64_t v57 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "isConfiguredForVocalAttenuation"));
        v69[7] = v57;
        v68[8] = @"vocal-attenuation-processing-delay";
        BOOL v35 = NSNumber;
        int v36 = [v24 supportsVocalAttenuation];
        double v37 = 0.0;
        if (v36)
        {
          objc_msgSend(v13, "currentAudioProcessingDelay", 0.0);
          double v37 = v38 * 1000.0;
        }
        int v39 = [v35 numberWithDouble:v37];
        v69[8] = v39;
        __int16 v40 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:9];
        id v41 = v64;
        [v64 emitEventType:@"item-vocal-attenuation-changed" payload:v40];
        id v12 = v66;
      }
      else
      {
        id v56 = v11;
        __int16 v65 = [v13 eventStream];
        v70[0] = @"event-time-offset";
        uint64_t v44 = NSNumber;
        [v12 time];
        __int16 v63 = [v44 numberWithDouble:v22 - v45];
        v71[0] = v63;
        v71[1] = v30;
        v70[1] = @"queue-section-id";
        v70[2] = @"queue-item-id";
        v71[2] = v31;
        v70[3] = @"item-start-position";
        __int16 v62 = [NSNumber numberWithDouble:v22];
        v71[3] = v62;
        v70[4] = @"time-control-status";
        uint64_t v46 = NSNumber;
        __int16 v61 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
        __int16 v60 = objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v61, "timeControlStatus"));
        v71[4] = v60;
        void v70[5] = @"item-rate";
        *(float *)&double v47 = a4;
        v59 = [NSNumber numberWithFloat:v47];
        v71[5] = v59;
        v70[6] = @"supports-vocal-attenuation";
        __int16 v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "supportsVocalAttenuation"));
        v71[6] = v58;
        v70[7] = @"vocal-attenuation-available";
        uint64_t v57 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationAvailable"));
        v71[7] = v57;
        v70[8] = @"vocal-attenuation-enabled";
        int v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isVocalAttenuationEnabled"));
        v71[8] = v39;
        v70[9] = @"vocal-attenuation-configured";
        __int16 v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v24, "isConfiguredForVocalAttenuation"));
        v71[9] = v40;
        v70[10] = @"vocal-attenuation-processing-delay";
        uint64_t v48 = NSNumber;
        int v49 = [v24 supportsVocalAttenuation];
        double v50 = 0.0;
        if (v49)
        {
          objc_msgSend(v13, "currentAudioProcessingDelay", 0.0);
          double v50 = v51 * 1000.0;
        }
        long long v52 = [v48 numberWithDouble:v50];
        v71[10] = v52;
        CMTime v53 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:11];
        id v41 = v65;
        [v65 emitEventType:@"item-resume" payload:v53];

        id v12 = v66;
        id v11 = v56;
      }

      goto LABEL_32;
    }
    id v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v31;
      long long v43 = "Unexpected playbackDidStartForItem: without itemID: %{public}@ %{public}@";
      goto LABEL_27;
    }
  }
  else
  {
    id v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
    {
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v11;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v30;
      long long v43 = "Unexpected playbackDidStartForItem: without sectionID: %{public}@ %{public}@";
LABEL_27:
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_FAULT, v43, (uint8_t *)&time, 0x16u);
    }
  }
LABEL_33:
}

- (double)_adjustPlayerTimeForAudioTapProcessing:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];
  [v5 mapPlaybackTimeToUserTime:a3];
  double v8 = v7;
  if (v7 != a3)
  {
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138544130;
      id v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      double v16 = a3;
      __int16 v17 = 2048;
      double v18 = v8;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Adjusting time with current processing delay - time: %3.4f -> corrected time: %3.4f", (uint8_t *)&v11, 0x2Au);
    }
  }
  return v8;
}

- (void)_updateActiveFormatForQueueItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    double v8 = [v7 avPlayerItem];
    id v9 = [v8 currentStableVariantID];
    if (v9)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke;
      aBlock[3] = &unk_2643BE280;
      aBlock[4] = self;
      id v21 = v7;
      id v10 = v6;
      id v22 = v10;
      id v11 = v21;
      id v23 = v11;
      id v12 = (void (**)(void *, void *))_Block_copy(aBlock);
      __int16 v13 = [v11 audioFormatForStableVariantID:v9];
      if (v13)
      {
        v12[2](v12, v13);
      }
      else
      {
        uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v25 = v10;
          __int16 v26 = 2114;
          double v27 = self;
          __int16 v28 = 2114;
          double v29 = v9;
          _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - No session-data audio format found for stableVariantID=%{public}@", buf, 0x20u);
        }

        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __60___MPCPlaybackEnginePlayer__updateActiveFormatForQueueItem___block_invoke_202;
        void v15[3] = &unk_2643BE2A8;
        uint64_t v19 = v12;
        id v16 = v10;
        __int16 v17 = self;
        id v18 = v9;
        [v8 loadCurrentTrackAudioFormatWithCompletion:v15];
      }
    }
  }
}

- (void)itemIsReadyToPlay:(id)a3 timeStamp:(id)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v6];
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      [v7 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138544130;
    *(void *)&time[4] = v9;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(void *)&time[24] = v10;
    LOWORD(v32[0]) = 2114;
    *(void *)((char *)v32 + 2) = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemIsReadyToPlay - item=%{public}@ - timeStamp:%{public}@", time, 0x2Au);
  }
  id v13 = v7;
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 hostTime];
    if ((v27 & 0x100000000) != 0)
    {
      [v14 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v25, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  long long v23 = *(_OWORD *)time;
  long long v24 = *(_OWORD *)&time[16];
  [v14 userSecondsSinceReferenceDate];
  uint64_t v16 = v15;

  __int16 v17 = [v10 queueSectionID];
  id v18 = [v10 queueItemID];
  if (![v17 length])
  {
    uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v17;
    id v22 = "Unexpected itemIsReadyToPlay: without sectionID: %{public}@ %{public}@";
LABEL_18:
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_FAULT, v22, time, 0x16u);
    goto LABEL_19;
  }
  if (![v18 length])
  {
    uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v6;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v18;
    id v22 = "Unexpected itemIsReadyToPlay: without itemID: %{public}@ %{public}@";
    goto LABEL_18;
  }
  uint64_t v19 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  __int16 v20 = [v19 eventStream];
  v29[0] = @"queue-section-id";
  v29[1] = @"queue-item-id";
  v30[0] = v17;
  v30[1] = v18;
  id v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  *(_OWORD *)CMTime time = v23;
  *(_OWORD *)&time[16] = v24;
  v32[0] = v16;
  [v20 emitEventType:@"item-ready-to-play" payload:v21 atTime:time];

  [v10 reevaluateHasProtectedContent];
  [v10 reevaluateType];
  [(_MPCPlaybackEnginePlayer *)self _updateActiveFormatForQueueItem:v10];
LABEL_19:
}

- (void)itemDidPlayToEnd:(id)a3 timeStamp:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  double v8 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v7];
  id v9 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v10 = [v9 engineID];

  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      [v6 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544130;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v10;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidPlayToEnd - item=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x2Au);
  }
  id v13 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  [v6 time];
  objc_msgSend(v13, "itemDidPlayToEnd:time:", v7);

  uint64_t v14 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v15 = [v14 eventObserver];
  [v15 engine:v14 didEndPlaybackOfItem:v8];
}

- (void)itemDidFailToPlayToEnd:(id)a3 error:(id)a4 timeStamp:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v12 = [v11 engineID];

  id v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v8];
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      [v10 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138544386;
    *(void *)&time[4] = v12;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = self;
    *(_WORD *)&time[22] = 2114;
    *(void *)&time[24] = v13;
    *(_WORD *)id v42 = 2114;
    *(void *)&v42[2] = v9;
    __int16 v43 = 2114;
    uint64_t v44 = v15;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidFailToPlayToEnd - item=%{public}@ - error=%{public}@ - timeStamp:%{public}@", time, 0x34u);
  }
  id v16 = v10;
  __int16 v17 = v16;
  int v32 = (void *)v12;
  if (v16)
  {
    [v16 hostTime];
    if ((v37 & 0x100000000) != 0)
    {
      [v17 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v35, (uint64_t)time);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_11:
  long long v33 = *(_OWORD *)time;
  long long v34 = *(_OWORD *)&time[16];
  [v17 userSecondsSinceReferenceDate];
  uint64_t v19 = v18;

  uint64_t v20 = [v13 queueSectionID];
  id v21 = [v13 queueItemID];
  if (![v20 length])
  {
    id v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v8;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v20;
    double v29 = "Unexpected itemDidFailToPlayToEnd: without sectionID: %{public}@ %{public}@";
LABEL_22:
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_FAULT, v29, time, 0x16u);
    goto LABEL_23;
  }
  if (![v21 length])
  {
    id v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)CMTime time = 138543618;
    *(void *)&time[4] = v8;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = v21;
    double v29 = "Unexpected itemDidFailToPlayToEnd: without itemID: %{public}@ %{public}@";
    goto LABEL_22;
  }
  id v30 = v8;
  id v22 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v31 = [v22 eventStream];
  v39[0] = @"queue-section-id";
  v39[1] = @"queue-item-id";
  v40[0] = v20;
  v40[1] = v21;
  v39[2] = @"asset-load-error";
  long long v23 = v9;
  id v24 = v9;
  if (!v9)
  {
    long long v23 = [MEMORY[0x263EFF9D0] null];
  }
  v40[2] = v23;
  v39[3] = @"time-control-status";
  CMTime v25 = NSNumber;
  uint64_t v26 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "timeControlStatus"));
  v40[3] = v27;
  uint64_t v28 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  *(_OWORD *)CMTime time = v33;
  *(_OWORD *)&time[16] = v34;
  *(void *)id v42 = v19;
  [v31 emitEventType:@"item-failed" payload:v28 atTime:time];

  id v9 = v24;
  if (!v24) {

  }
  id v8 = v30;
LABEL_23:
}

- (void)itemDidFailToLoad:(id)a3 silently:(BOOL)a4 error:(id)a5 timeStamp:(id)a6
{
  BOOL v7 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v14 = [v13 engineID];
  uint64_t v15 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v12];

  id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      [v11 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    __int16 v17 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v14;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    uint64_t v20 = v15;
    __int16 v21 = 1024;
    BOOL v22 = v7;
    __int16 v23 = 2114;
    id v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v17;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - itemDidFailToLoad - item=%{public}@ - silently=%{BOOL}u - error=%{public}@ - timeStamp:%{public}@", (uint8_t *)&time, 0x3Au);
  }
  if (v7)
  {
    uint64_t v18 = [v13 queueController];
    [v18 playerItemDidBecomeCurrent:v15];
  }
  else
  {
    [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  }
}

- (void)userSeekCompletedForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 timeStamp:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v13 = [v12 engineID];
  uint64_t v14 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v10];
  [(_MPCPlaybackEnginePlayer *)self _adjustPlayerTimeForAudioTapProcessing:a5];
  double v16 = v15;
  __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      [v11 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544642;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    uint64_t v28 = v14;
    __int16 v29 = 2048;
    double v30 = a4;
    __int16 v31 = 2048;
    double v32 = v16;
    __int16 v33 = 2114;
    long long v34 = v18;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - userSeekCompletedForItem - item=%{public}@ - [%.2fs -> %.2fs]- timeStamp:%{public}@", (uint8_t *)&time, 0x3Eu);
  }
  uint64_t v19 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  uint64_t v20 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v20 effectiveRate];
  LODWORD(v22) = v21;
  [v19 updateDurationSnapshotWithTime:v10 forItem:v16 rate:v22];

  [(_MPCPlaybackEnginePlayer *)self _logTimeJumpForItem:v14 fromTime:1 toTime:v11 userInitiated:a4 timeStamp:v16];
  __int16 v23 = [v12 eventObserver];
  id v24 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v24 rate];
  LODWORD(v26) = v25;
  [v23 engine:v12 didChangeItemElapsedTime:v16 rate:v26];
}

- (void)playbackTimeDidChangeTo:(double)a3 forItem:(id)a4 reason:(int64_t)a5 timeStamp:(id)a6
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v13 = [v12 engineID];
  uint64_t v14 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v10];
  [(_MPCPlaybackEnginePlayer *)self _adjustPlayerTimeForAudioTapProcessing:a3];
  double v16 = v15;
  __int16 v17 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  uint64_t v18 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v18 effectiveRate];
  LODWORD(v20) = v19;
  [v17 updateDurationSnapshotWithTime:v10 forItem:v16 rate:v20];

  if ([v14 isAlwaysLive])
  {
    int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        [v11 hostTime];
      }
      else {
        memset(time, 0, 24);
      }
      double v32 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
      *(_DWORD *)CMTime time = 138544386;
      *(void *)&time[4] = v13;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(double *)&time[24] = v16;
      *(_WORD *)v71 = 2114;
      *(void *)&v71[2] = v14;
      __int16 v72 = 2114;
      double v73 = *(double *)&v32;
      __int16 v33 = "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - Live item [ignoring time change] - time:%.2fs - item=%{p"
            "ublic}@ - timeStamp:%{public}@";
LABEL_19:
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, v33, time, 0x34u);
LABEL_35:

      goto LABEL_36;
    }
    goto LABEL_36;
  }
  double v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  if ([v22 currentState] == 4)
  {

    goto LABEL_9;
  }
  __int16 v23 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  __int16 v61 = v13;
  uint64_t v24 = [v23 currentState];

  BOOL v25 = v24 == 3;
  id v13 = v61;
  if (!v25)
  {
    double v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v59 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      [v59 rate];
      double v29 = v28;
      uint64_t v57 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      [v57 effectiveRate];
      double v31 = v30;
      uint64_t v55 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      id v56 = +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", [v55 currentState]);
      double v54 = +[MFDescription forPlaybackTimeChangeReason:a5];
      if (v11) {
        [v11 hostTime];
      }
      else {
        memset(time, 0, 24);
      }
      CMTime v53 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
      *(_DWORD *)CMTime time = 138545410;
      id v13 = v61;
      *(void *)&time[4] = v61;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(double *)&time[24] = v16;
      *(_WORD *)v71 = 2048;
      *(double *)&v71[2] = v29;
      __int16 v72 = 2048;
      double v73 = v31;
      __int16 v74 = 2114;
      double v75 = v56;
      __int16 v76 = 2114;
      BOOL v77 = v14;
      __int16 v78 = 2114;
      v79 = v54;
      __int16 v80 = 2114;
      v81 = v53;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - Regular item [processing time change] - time:%.2fs - rate: %.2f - effectiveRate: %2f - state: %{public}@ - item=%{public}@ - reason:%{public}@ - timeStamp:%{public}@", time, 0x5Cu);
    }
    int v21 = [v14 contentItem];
    [v21 elapsedTimeTimestamp];
    double v35 = v34;
    [v21 calculatedElapsedTime];
    double v37 = v36;
    [v21 elapsedTimeTimestamp];
    if (a5 == 2 || a5 == 1 && v35 != v38)
    {
      [(_MPCPlaybackEnginePlayer *)self _logTimeJumpForItem:v14 fromTime:a5 == 2 toTime:v11 userInitiated:v37 timeStamp:v16];
LABEL_34:
      double v32 = [v12 eventObserver];
      double v50 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
      [v50 rate];
      LODWORD(v52) = v51;
      [v32 engine:v12 didChangeItemElapsedTime:v16 rate:v52];

      goto LABEL_35;
    }
    int v39 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v10];
    id v40 = v11;
    id v41 = v40;
    if (v40)
    {
      [v40 hostTime];
      if ((v66 & 0x100000000) != 0)
      {
        [v41 hostTime];
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v64, (uint64_t)time);
LABEL_31:
        long long v62 = *(_OWORD *)time;
        long long v63 = *(_OWORD *)&time[16];
        [v41 userSecondsSinceReferenceDate];
        uint64_t v43 = v42;

        uint64_t v44 = [v12 eventStream];
        v68[0] = @"queue-section-id";
        __int16 v58 = [v39 queueSectionID];
        v69[0] = v58;
        v68[1] = @"queue-item-id";
        [v39 queueItemID];
        v45 = __int16 v60 = v39;
        v69[1] = v45;
        v68[2] = @"item-end-position";
        uint64_t v46 = NSNumber;
        [v21 duration];
        if (v47 > a3) {
          double v47 = a3;
        }
        uint64_t v48 = objc_msgSend(v46, "numberWithDouble:", fmax(v47, 0.0));
        v69[2] = v48;
        int v49 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];
        *(_OWORD *)CMTime time = v62;
        *(_OWORD *)&time[16] = v63;
        *(void *)v71 = v43;
        [v44 emitEventType:@"item-position-tick" payload:v49 atTime:time];

        id v13 = v61;
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(time);
    goto LABEL_31;
  }
LABEL_9:
  int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      [v11 hostTime];
    }
    else {
      memset(time, 0, 24);
    }
    double v32 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
    *(_DWORD *)CMTime time = 138544386;
    *(void *)&time[4] = v13;
    *(_WORD *)&time[12] = 2114;
    *(void *)&time[14] = self;
    *(_WORD *)&time[22] = 2048;
    *(double *)&time[24] = v16;
    *(_WORD *)v71 = 2114;
    *(void *)&v71[2] = v14;
    __int16 v72 = 2114;
    double v73 = *(double *)&v32;
    __int16 v33 = "[%{public}@]-%{public}@ - playbackTimeDidChangeTo - FF or RW [ignoring time change to avoid time snaps] - time"
          ":%.2fs - item=%{public}@ - timeStamp:%{public}@";
    goto LABEL_19;
  }
LABEL_36:
}

- (void)playbackDidReachQueueEndWithTimeStamp:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];

  BOOL v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      [v4 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v6;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v10 = v8;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - playbackDidReachQueueEnd - timeStamp:%{public}@", (uint8_t *)&time, 0x20u);
  }
}

- (void)overlappedPlaybackDidEndFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  double v15 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v16 = [v15 engineID];
  __int16 v17 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];
  double v73 = v12;
  uint64_t v18 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v12];
  int v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [v13 startItemSourceTime];
    uint64_t v21 = v20;
    [v13 endItemSourceTime];
    uint64_t v23 = v22;
    if (v14) {
      [v14 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    id v87 = v11;
    *(_WORD *)v88 = 2048;
    *(void *)&v88[2] = v21;
    __int16 v89 = 2114;
    v90 = v73;
    __int16 v91 = 2048;
    uint64_t v92 = v23;
    __int16 v93 = 2114;
    v94 = v24;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - overlappedPlaybackDidEnd - %{public}@ [%3.2fs] -> %{public}@ [%3.2fs] - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);
  }
  BOOL v25 = [(_MPCPlaybackEnginePlayer *)self translator];
  [v25 setMPAVItem:0 forMFPlayerItem:v11];

  id v26 = v14;
  uint64_t v27 = v26;
  __int16 v72 = v11;
  long long v63 = (void *)v16;
  if (v26)
  {
    [v26 hostTime];
    if ((v80 & 0x100000000) != 0)
    {
      [v27 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v78, (uint64_t)&time);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v79 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(&time);
LABEL_11:
  int64x2_t v70 = *(int64x2_t *)&time.timescale;
  CMTimeValue value = time.value;
  id v69 = v87;
  [v27 userSecondsSinceReferenceDate];
  double v29 = v28;

  uint64_t v57 = [v15 eventStream];
  v84[0] = @"outgoing-item-section-id";
  v59 = [v17 queueSectionID];
  v85[0] = v59;
  v84[1] = @"outgoing-item-id";
  __int16 v58 = [v17 queueItemID];
  v85[1] = v58;
  v84[2] = @"transition-outgoing-item-source-time";
  v71 = v27;
  float v30 = NSNumber;
  [v13 startItemSourceTime];
  double v31 = objc_msgSend(v30, "numberWithDouble:");
  v85[2] = v31;
  v84[3] = @"transition-outgoing-item-target-time";
  double v32 = NSNumber;
  [v13 startItemTargetTime];
  __int16 v33 = objc_msgSend(v32, "numberWithDouble:");
  v85[3] = v33;
  v84[4] = @"incoming-item-section-id";
  [v18 queueSectionID];
  double v34 = v67 = v15;
  v85[4] = v34;
  v84[5] = @"incoming-item-id";
  double v35 = [v18 queueItemID];
  v85[5] = v35;
  v84[6] = @"transition-incoming-item-source-time";
  uint64_t v65 = v17;
  double v36 = NSNumber;
  [v13 endItemSourceTime];
  double v37 = objc_msgSend(v36, "numberWithDouble:");
  v85[6] = v37;
  v84[7] = @"transition-incoming-item-target-time";
  double v38 = v13;
  int v39 = NSNumber;
  uint64_t v66 = v38;
  [v38 endItemTargetTime];
  id v40 = objc_msgSend(v39, "numberWithDouble:");
  v85[7] = v40;
  v84[8] = @"transition-type";
  [NSNumber numberWithInteger:a6];
  id v41 = v64 = v18;
  v85[8] = v41;
  uint64_t v42 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:9];
  *(int64x2_t *)&time.timescale = v70;
  time.CMTimeValue value = value;
  id v87 = v69;
  *(double *)v88 = v29;
  [v57 emitEventType:@"overlapped-playback-did-end" payload:v42 atTime:&time];

  if (a6 == 1)
  {
    uint64_t v43 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
    [v43 itemTransitionWillBeginFrom:v72 to:v73 type:1 timeStamp:v71];

    __int16 v60 = [v67 eventStream];
    v82[0] = @"outgoing-item-section-id";
    long long v62 = [v65 queueSectionID];
    v83[0] = v62;
    v82[1] = @"outgoing-item-id";
    uint64_t v44 = [v65 queueItemID];
    v83[1] = v44;
    v82[2] = @"transition-outgoing-item-source-time";
    uint64_t v45 = NSNumber;
    [v66 startItemSourceTime];
    uint64_t v46 = objc_msgSend(v45, "numberWithDouble:");
    v83[2] = v46;
    v82[3] = @"transition-outgoing-item-target-time";
    double v47 = NSNumber;
    [v66 startItemTargetTime];
    uint64_t v48 = objc_msgSend(v47, "numberWithDouble:");
    v83[3] = v48;
    v82[4] = @"incoming-item-section-id";
    int v49 = [v64 queueSectionID];
    v83[4] = v49;
    v82[5] = @"incoming-item-id";
    double v50 = [v64 queueItemID];
    v83[5] = v50;
    v82[6] = @"transition-incoming-item-source-time";
    int v51 = NSNumber;
    [v66 endItemSourceTime];
    double v52 = objc_msgSend(v51, "numberWithDouble:");
    v83[6] = v52;
    v82[7] = @"transition-incoming-item-target-time";
    CMTime v53 = NSNumber;
    [v66 endItemTargetTime];
    double v54 = objc_msgSend(v53, "numberWithDouble:");
    v83[7] = v54;
    v82[8] = @"transition-type";
    uint64_t v55 = [NSNumber numberWithInteger:1];
    v83[8] = v55;
    id v56 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:9];
    CMTimeValue v74 = value;
    int64x2_t v75 = vaddq_s64(v70, vdupq_n_s64(1uLL));
    id v76 = v69;
    double v77 = v29 + 0.000000001;
    [v60 emitEventType:@"transition-did-end" payload:v56 atTime:&v74];
  }
}

- (void)overlappedPlaybackWillBeginFrom:(id)a3 to:(id)a4 transitionTime:(id)a5 transitionType:(int64_t)a6 timeStamp:(id)a7
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  double v15 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v16 = [v15 engineID];
  __int16 v72 = v11;
  __int16 v17 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v11];
  v71 = v12;
  uint64_t v18 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v12];
  int v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    [v13 startItemSourceTime];
    uint64_t v21 = v20;
    [v13 endItemSourceTime];
    uint64_t v23 = v22;
    if (v14) {
      [v14 hostTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds(&time));
    LODWORD(time.value) = 138544898;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = self;
    HIWORD(time.epoch) = 2114;
    v86 = v72;
    *(_WORD *)id v87 = 2048;
    *(void *)&v87[2] = v21;
    __int16 v88 = 2114;
    id v89 = v12;
    __int16 v90 = 2048;
    uint64_t v91 = v23;
    __int16 v92 = 2114;
    __int16 v93 = v24;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - overlappedPlaybackWillBegin - %{public}@ [%3.2fs] -> %{public}@ [%3.2fs] - timeStamp:%{public}@", (uint8_t *)&time, 0x48u);
  }
  id v25 = v14;
  id v26 = v25;
  if (v25)
  {
    [v25 hostTime];
    if ((v79 & 0x100000000) != 0)
    {
      [v26 hostTime];
      MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v77, (uint64_t)&time);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v80 = 0;
  }
  MPCPlaybackEngineEventGetMonotonicTime(&time);
LABEL_11:
  CMTime v66 = time;
  uint64_t v65 = v86;
  [v26 userSecondsSinceReferenceDate];
  double v28 = v27;
  long long v63 = (void *)v16;

  uint64_t v67 = v26;
  v68 = v18;
  id v69 = v17;
  CMTime v64 = v15;
  if (a6 == 1)
  {
    double v29 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
    [v29 itemTransitionWillBeginFrom:v72 to:v12 type:1 timeStamp:v67];

    id v56 = [v15 eventStream];
    v83[0] = @"outgoing-item-section-id";
    __int16 v61 = [v17 queueSectionID];
    v84[0] = v61;
    v83[1] = @"outgoing-item-id";
    v59 = [v17 queueItemID];
    v84[1] = v59;
    v83[2] = @"transition-outgoing-item-source-time";
    float v30 = NSNumber;
    [v13 startItemSourceTime];
    uint64_t v57 = objc_msgSend(v30, "numberWithDouble:");
    v84[2] = v57;
    v83[3] = @"transition-outgoing-item-target-time";
    double v31 = NSNumber;
    [v13 startItemTargetTime];
    double v32 = objc_msgSend(v31, "numberWithDouble:");
    v84[3] = v32;
    v83[4] = @"incoming-item-section-id";
    __int16 v33 = [v18 queueSectionID];
    v84[4] = v33;
    v83[5] = @"incoming-item-id";
    double v34 = [v18 queueItemID];
    v84[5] = v34;
    v83[6] = @"transition-incoming-item-source-time";
    double v35 = v13;
    double v36 = NSNumber;
    [v35 endItemSourceTime];
    double v37 = objc_msgSend(v36, "numberWithDouble:");
    v84[6] = v37;
    v83[7] = @"transition-incoming-item-target-time";
    double v38 = NSNumber;
    [v35 endItemTargetTime];
    int v39 = objc_msgSend(v38, "numberWithDouble:");
    v84[7] = v39;
    v83[8] = @"transition-type";
    id v40 = [NSNumber numberWithInteger:1];
    void v83[9] = @"transition-average-rate";
    v84[8] = v40;
    void v84[9] = &unk_26CC18BE8;
    id v41 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:10];
    CMTimeValue value = v66.value;
    v42.i64[0] = -1;
    v42.i64[1] = -1;
    int64x2_t v74 = vaddq_s64(*(int64x2_t *)&v66.timescale, v42);
    int64x2_t v75 = v65;
    double v76 = v28 + -0.000000001;
    [v56 emitEventType:@"transition-will-start" payload:v41 atTime:&value];

    double v15 = v64;
    id v13 = v35;
    uint64_t v18 = v68;

    __int16 v17 = v69;
  }
  __int16 v58 = [v15 eventStream];
  v81[0] = @"outgoing-item-section-id";
  long long v62 = [v17 queueSectionID];
  v82[0] = v62;
  v81[1] = @"outgoing-item-id";
  __int16 v60 = [v17 queueItemID];
  v82[1] = v60;
  v81[2] = @"transition-outgoing-item-source-time";
  uint64_t v43 = NSNumber;
  [v13 startItemSourceTime];
  uint64_t v44 = objc_msgSend(v43, "numberWithDouble:");
  v82[2] = v44;
  v81[3] = @"transition-outgoing-item-target-time";
  uint64_t v45 = NSNumber;
  [v13 startItemTargetTime];
  uint64_t v46 = objc_msgSend(v45, "numberWithDouble:");
  v82[3] = v46;
  v81[4] = @"incoming-item-section-id";
  double v47 = [v18 queueSectionID];
  v82[4] = v47;
  v81[5] = @"incoming-item-id";
  [v18 queueItemID];
  v49 = uint64_t v48 = v13;
  v82[5] = v49;
  v81[6] = @"transition-incoming-item-source-time";
  double v50 = NSNumber;
  [v48 endItemSourceTime];
  int v51 = objc_msgSend(v50, "numberWithDouble:");
  v82[6] = v51;
  v81[7] = @"transition-incoming-item-target-time";
  double v52 = NSNumber;
  [v48 endItemTargetTime];
  CMTime v53 = objc_msgSend(v52, "numberWithDouble:");
  v82[7] = v53;
  v81[8] = @"transition-type";
  double v54 = [NSNumber numberWithInteger:a6];
  v82[8] = v54;
  uint64_t v55 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:9];
  CMTime time = v66;
  v86 = v65;
  *(double *)id v87 = v28;
  [v58 emitEventType:@"overlapped-playback-will-start" payload:v55 atTime:&time];
}

- (void)engine:(id)a3 didChangeQueueWithReason:(id)a4
{
  id v13 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  unint64_t v5 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v5 currentTime];
  double v7 = v6;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  id v9 = [v8 currentItem];
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v10 effectiveRate];
  LODWORD(v12) = v11;
  [v13 updateDurationSnapshotWithTime:v9 forItem:v7 rate:v12];
}

- (void)engine:(id)a3 willRemoveQueueController:(id)a4
{
  id v5 = a4;
  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  double v6 = [v5 sessionID];

  [v7 teardownForQueueWithSessionID:v6];
}

- (BOOL)_itemConfigurationIsIncompatibleWithVocalAttenuationState:(id)a3
{
  id v3 = a3;
  if ([v3 supportsVocalAttenuation]) {
    int v4 = [v3 isConfiguredForVocalAttenuation] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_performSkipForUserAction:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  double v6 = [v5 engineID];
  if ([(_MPCPlaybackEnginePlayer *)self _isAVKitSkipAction:v4])
  {
    id v7 = [v5 mediaRemotePublisher];
    id v8 = [v7 commandCenter];

    if ([v4 type] == 7) {
      [v8 nextTrackCommand];
    }
    else {
    id v9 = [v8 previousTrackCommand];
    }
    id v10 = (void *)MEMORY[0x263F121B8];
    uint64_t v20 = @"MPCRemoteCommandEventOptionSkipImmediatelyKey";
    v21[0] = MEMORY[0x263EFFA88];
    int v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    double v12 = [v10 eventWithCommand:v9 mediaRemoteType:4 options:v11];

    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      double v15 = v6;
      __int16 v16 = 2114;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]-Triggering MR command %{public}@ from userAction: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    [v9 invokeCommandWithEvent:v12 completion:&__block_literal_global_163];
  }
}

- (BOOL)_isAVKitSkipAction:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([v3 type] - 7) > 1)
  {
    char v5 = 0;
  }
  else
  {
    id v4 = [v3 sourceID];
    char v5 = [v4 isEqualToString:@"AVMusicAppBehavior"];
  }
  return v5;
}

- (void)_playbackDidStopForItem:(id)a3 source:(id)a4 reason:(id)a5 time:(double)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v10];
  int v14 = [v13 queueSectionID];
  double v15 = [v13 queueItemID];
  if (![v14 length])
  {
    __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v30 = v10;
    __int16 v31 = 2114;
    double v32 = v14;
    id v25 = "Unexpected _playbackDidStopForItem: without sectionID: %{public}@ %{public}@";
LABEL_10:
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_FAULT, v25, buf, 0x16u);
    goto LABEL_11;
  }
  if (![v15 length])
  {
    __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v30 = v10;
    __int16 v31 = 2114;
    double v32 = v15;
    id v25 = "Unexpected _playbackDidStopForItem: without itemID: %{public}@ %{public}@";
    goto LABEL_10;
  }
  __int16 v16 = [(_MPCPlaybackEnginePlayer *)self bookmarker];
  [v16 playbackDidStopForItem:v10 time:a6];

  __int16 v17 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  __int16 v18 = [v17 eventStream];
  v27[0] = @"queue-section-id";
  v27[1] = @"queue-item-id";
  v28[0] = v14;
  v28[1] = v15;
  void v27[2] = @"item-end-position";
  id v19 = [NSNumber numberWithDouble:a6];
  void v28[2] = v19;
  v28[3] = v12;
  v27[3] = @"item-rate-change-reason";
  v27[4] = @"item-rate-change-source";
  id v26 = v11;
  v28[4] = v11;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
  [v18 emitEventType:@"item-pause" payload:v20];

  uint64_t v21 = [v17 eventObserver];
  uint64_t v22 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v22 rate];
  LODWORD(v24) = v23;
  [v21 engine:v17 didChangeItemElapsedTime:a6 rate:v24];

  if ([v12 isEqualToString:@"end of queue reached"]) {
    [v13 setInitialPlaybackStartTimeOverride:0];
  }
  id v11 = v26;
LABEL_11:
}

- (void)_logTimeJumpForItem:(id)a3 fromTime:(double)a4 toTime:(double)a5 userInitiated:(BOOL)a6 timeStamp:(id)a7
{
  BOOL v8 = a6;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  if (v8) {
    goto LABEL_5;
  }
  double v14 = a4 - a5;
  if (a4 - a5 < 0.0) {
    double v14 = -(a4 - a5);
  }
  if (v14 > 0.25)
  {
LABEL_5:
    double v15 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
    uint64_t v16 = [v15 engineID];
    __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = v15;
      int64_t jumpIdentifier = self->_jumpIdentifier;
      if (v13) {
        [v13 hostTime];
      }
      else {
        memset(time, 0, 24);
      }
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%0.9fs", CMTimeGetSeconds((CMTime *)time));
      *(_DWORD *)CMTime time = 138545154;
      *(void *)&time[4] = v16;
      *(_WORD *)&time[12] = 2114;
      *(void *)&time[14] = self;
      *(_WORD *)&time[22] = 2048;
      *(void *)&time[24] = jumpIdentifier;
      LOWORD(v49) = 1024;
      *(_DWORD *)((char *)&v49 + 2) = v8;
      HIWORD(v49) = 2048;
      double v50 = a4;
      __int16 v51 = 2048;
      double v52 = a5;
      __int16 v53 = 2048;
      double v54 = a5 - a4;
      __int16 v55 = 2114;
      id v56 = v20;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - _logTimeJumpForItem - jumpIdentifier: %ld - userInitiated:%{BOOL}u - %.2fs -> %.2fs [D:%.2fs]- timeStamp:%{public}@", time, 0x4Eu);

      double v15 = v18;
    }

    id v39 = v13;
    id v21 = v13;
    uint64_t v22 = v21;
    double v38 = (void *)v16;
    if (v21)
    {
      [v21 hostTime];
      if ((v44 & 0x100000000) != 0)
      {
        [v22 hostTime];
        MPCPlaybackEngineEventMonotonicTimeWithHostTime(&v42, (uint64_t)time);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
    }
    MPCPlaybackEngineEventGetMonotonicTime(time);
LABEL_15:
    long long v40 = *(_OWORD *)time;
    long long v41 = *(_OWORD *)&time[16];
    [v22 userSecondsSinceReferenceDate];
    uint64_t v24 = v23;

    id v25 = [(_MPCPlaybackEnginePlayer *)self _MPAVItemForMFQueuePlayerItem:v12];
    id v26 = [v25 queueSectionID];
    double v27 = [v25 queueItemID];
    if ([v26 length])
    {
      if ([v27 length])
      {
        [v15 eventStream];
        double v28 = v37 = v12;
        v46[0] = @"queue-section-id";
        v46[1] = @"queue-item-id";
        v47[0] = v26;
        v47[1] = v27;
        v46[2] = @"item-start-position";
        double v36 = [NSNumber numberWithDouble:a4];
        v47[2] = v36;
        v46[3] = @"item-end-position";
        double v29 = [NSNumber numberWithDouble:a5];
        v47[3] = v29;
        v46[4] = @"item-jump-user-initiated";
        id v30 = [NSNumber numberWithBool:v8];
        v47[4] = v30;
        v46[5] = @"item-jump-identifier";
        __int16 v31 = [NSNumber numberWithInteger:self->_jumpIdentifier];
        v47[5] = v31;
        [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];
        uint64_t v33 = v32 = v15;
        *(_OWORD *)CMTime time = v40;
        *(_OWORD *)&time[16] = v41;
        uint64_t v49 = v24;
        [v28 emitEventType:@"item-position-jump" payload:v33 atTime:time];

        double v15 = v32;
        id v12 = v37;
        ++self->_jumpIdentifier;
LABEL_24:
        id v13 = v39;

        goto LABEL_25;
      }
      double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)CMTime time = 138543618;
        *(void *)&time[4] = v12;
        *(_WORD *)&time[12] = 2114;
        *(void *)&time[14] = v27;
        double v35 = "Unexpected _logTimeJumpForItem: without itemID: %{public}@ %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)CMTime time = 138543618;
        *(void *)&time[4] = v12;
        *(_WORD *)&time[12] = 2114;
        *(void *)&time[14] = v26;
        double v35 = "Unexpected _logTimeJumpForItem: without sectionID: %{public}@ %{public}@";
LABEL_22:
        _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_FAULT, v35, time, 0x16u);
      }
    }

    goto LABEL_24;
  }
LABEL_25:
}

- (NSDictionary)_stateDictionary
{
  v30[7] = *MEMORY[0x263EF8340];
  v29[0] = @"playbackState";
  id v3 = NSNumber;
  double v28 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  double v27 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v28, "currentState"));
  v30[0] = v27;
  v29[1] = @"currentItem";
  id v26 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v4 = [v26 currentItem];
  char v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = @"@";
  }
  v30[1] = v6;
  void v29[2] = @"currentRate";
  id v7 = NSNumber;
  id v25 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v25 rate];
  uint64_t v24 = objc_msgSend(v7, "numberWithFloat:");
  void v30[2] = v24;
  v29[3] = @"currentTime";
  BOOL v8 = NSNumber;
  id v9 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v9 currentTime];
  id v10 = objc_msgSend(v8, "numberWithDouble:");
  v30[3] = v10;
  v29[4] = @"targetRate";
  id v11 = NSNumber;
  id v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v12 targetRate];
  id v13 = objc_msgSend(v11, "numberWithFloat:");
  v30[4] = v13;
  v29[5] = @"MediaFoundationStack";
  double v14 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  uint64_t v15 = [v14 stateDictionary];
  uint64_t v16 = (void *)v15;
  if (v15) {
    __int16 v17 = (__CFString *)v15;
  }
  else {
    __int16 v17 = @"@";
  }
  v30[5] = v17;
  v29[6] = @"engineID";
  __int16 v18 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  uint64_t v19 = [v18 engineID];
  uint64_t v20 = (void *)v19;
  id v21 = @"N/A";
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  v30[6] = v21;
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];

  return (NSDictionary *)v22;
}

- (float)relativeVolume
{
  id v3 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v3)
  {
    uint64_t v4 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    [v4 relativeVolume];
    float v6 = v5;
  }
  else
  {
    uint64_t v4 = [(_MPCPlaybackEnginePlayer *)self currentRelativeVolume];
    if (v4)
    {
      id v7 = [(_MPCPlaybackEnginePlayer *)self currentRelativeVolume];
      [v7 floatValue];
      float v6 = v8;
    }
    else
    {
      float v6 = 1.0;
    }
  }

  return v6;
}

- (void)setRelativeVolume:(float)a3
{
  float v5 = objc_msgSend(NSNumber, "numberWithFloat:");
  [(_MPCPlaybackEnginePlayer *)self setCurrentRelativeVolume:v5];

  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  *(float *)&double v6 = a3;
  [v7 setRelativeVolume:v6];
}

- (void)jumpToTime:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];

  id v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v12)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61___MPCPlaybackEnginePlayer_jumpToTime_identifier_completion___block_invoke;
    void v15[3] = &unk_2643BE258;
    id v16 = v11;
    id v17 = v8;
    double v19 = a3;
    id v18 = v9;
    [v13 jumpTo:v17 identifier:v15 completion:a3];
  }
  else
  {
    double v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer jumpToTime:identifier:completion:]");
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)setRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];

  id v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v12)
  {
    objc_initWeak(&location, self);
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58___MPCPlaybackEnginePlayer_setRate_identifier_completion___block_invoke;
    v16[3] = &unk_2643BE230;
    objc_copyWeak(&v20, &location);
    id v17 = v11;
    id v18 = v8;
    float v21 = a3;
    id v19 = v9;
    *(float *)&double v14 = a3;
    [v13 setRate:v18 identifier:v16 completion:v14];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer setRate:identifier:completion:]");
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }
}

- (void)endScanningWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v10)
  {
    id v11 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65___MPCPlaybackEnginePlayer_endScanningWithIdentifier_completion___block_invoke;
    v13[3] = &unk_2643C2DC0;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    [v11 endScanningWithIdentifier:v15 completion:v13];
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer endScanningWithIdentifier:completion:]");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)togglePlaybackWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v10)
  {
    id v11 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    uint64_t v12 = [v11 currentState];

    switch(v12)
    {
      case 0:
      case 2:
      case 7:
        [(_MPCPlaybackEnginePlayer *)self takeEVSDeferralAssertionForFirstAudioFrame];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
        id v14 = [WeakRetained queueController];
        float v15 = 1.0;
        if ([v14 behaviorType] == 4)
        {
          +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate];
          float v15 = v16;
        }

        id v17 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke_96;
        v25[3] = &unk_2643BE208;
        id v26 = v9;
        id v27 = v6;
        double v28 = self;
        id v29 = v7;
        *(float *)&double v18 = v15;
        [v17 playWithRate:v27 identifier:v25 completion:v18];

        id v19 = v26;
        break;
      case 1:
        [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
        float v21 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        void v30[2] = __68___MPCPlaybackEnginePlayer_togglePlaybackWithIdentifier_completion___block_invoke;
        v30[3] = &unk_2643C2DC0;
        id v31 = v9;
        id v32 = v6;
        id v33 = v7;
        [v21 pauseWithIdentifier:v32 completion:v30];

        id v19 = v31;
        break;
      default:
        [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
        uint64_t v22 = (void *)MEMORY[0x263F087E8];
        id v20 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
        uint64_t v23 = +[MFDescription forPlayerState:](MFDescription, "forPlayerState:", [v20 currentState]);
        uint64_t v24 = objc_msgSend(v22, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MPCError", 0, 0, @"Attemping to toggle playback with incompatible state - CurrentState:%@", v23);
        (*((void (**)(id, void *))v7 + 2))(v7, v24);

        goto LABEL_10;
    }
  }
  else
  {
    id v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer togglePlaybackWithIdentifier:completion:]");
    (*((void (**)(id, void *))v7 + 2))(v7, v20);
LABEL_10:
  }
}

- (void)pauseForLeasePreventionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v10)
  {
    id v11 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77___MPCPlaybackEnginePlayer_pauseForLeasePreventionWithIdentifier_completion___block_invoke;
    v13[3] = &unk_2643C2DC0;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    [v11 pauseForLeasePreventionWithIdentifier:v15 completion:v13];
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer pauseForLeasePreventionWithIdentifier:completion:]");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)pauseForSleepTimerWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];

  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v12)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80___MPCPlaybackEnginePlayer_pauseForSleepTimerWithFadeout_identifier_completion___block_invoke;
    void v15[3] = &unk_2643C2DC0;
    id v16 = v11;
    id v17 = v8;
    id v18 = v9;
    [v13 pauseForSleepTimerWithFadeOut:v17 identifier:v15 completion:a3];
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer pauseForSleepTimerWithFadeout:identifier:completion:]");
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)pauseWithFadeout:(double)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];

  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v12)
  {
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67___MPCPlaybackEnginePlayer_pauseWithFadeout_identifier_completion___block_invoke;
    void v15[3] = &unk_2643C2DC0;
    id v16 = v11;
    id v17 = v8;
    id v18 = v9;
    [v13 pauseWithFadeOut:v17 identifier:v15 completion:a3];
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer pauseWithFadeout:identifier:completion:]");
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)pauseWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v9 = [v8 engineID];

  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v10)
  {
    id v11 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59___MPCPlaybackEnginePlayer_pauseWithIdentifier_completion___block_invoke;
    v13[3] = &unk_2643C2DC0;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    [v11 pauseWithIdentifier:v15 completion:v13];
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer pauseWithIdentifier:completion:]");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

- (void)playWithRate:(float)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v11 = [v10 engineID];
  uint64_t v12 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];

  if (v12)
  {
    [(_MPCPlaybackEnginePlayer *)self takeEVSDeferralAssertionForFirstAudioFrame];
    id v13 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63___MPCPlaybackEnginePlayer_playWithRate_identifier_completion___block_invoke;
    v16[3] = &unk_2643C2DC0;
    id v17 = v11;
    id v18 = v8;
    id v19 = v9;
    *(float *)&double v14 = a3;
    [v13 playWithRate:v18 identifier:v16 completion:v14];
  }
  else
  {
    id v15 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 60, @"Playback engine stack has not been setup yet. Set a playback queue first before calling %s.", "-[_MPCPlaybackEnginePlayer playWithRate:identifier:completion:]");
    (*((void (**)(id, void *))v9 + 2))(v9, v15);
  }
}

- (BOOL)hasPlayedSuccessfully
{
  v2 = [(_MPCPlaybackEnginePlayer *)self errorController];
  char v3 = [v2 itemsHavePlayed];

  return v3;
}

- (int64_t)stateBeforeInterruption
{
  v2 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  unint64_t v3 = [v2 interruptedState];
  if (v3 > 7) {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v4 = qword_21BEF16A0[v3];
  }

  return v4;
}

- (int64_t)state
{
  v2 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  unint64_t v3 = [v2 currentState];
  if (v3 > 7) {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v4 = qword_21BEF16A0[v3];
  }

  return v4;
}

- (float)currentRate
{
  v2 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)updateAudioSessionSpeechDetection
{
  id v4 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  float v3 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  objc_msgSend(v4, "setInhibitSpeechDetection:", objc_msgSend(v3, "isVocalAttenuationEnabled"));
}

- (void)setApplicationMusicPlayerTransitionType:(int64_t)a3 withDuration:(double)a4
{
  -[_MPCPlaybackEnginePlayer setApplicationMusicPlayerTransitionType:](self, "setApplicationMusicPlayerTransitionType:");
  [(_MPCPlaybackEnginePlayer *)self setApplicationMusicPlayerCrossFadeDuration:a4];
  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v7 setApplicationMusicPlayerTransitionType:a3 duration:a4];
}

- (void)deactivateAudioSessionIfIdle:(int64_t)a3
{
  id v4 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  [v4 deactivateAudioSessionIfIdle:a3];
}

- (void)becomeActiveWithCompletion:(id)a3
{
  id v4 = a3;
  [(_MPCPlaybackEnginePlayer *)self setupPlaybackStackIfNeeded];
  objc_initWeak(&location, self);
  float v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];

  id v7 = [MEMORY[0x263EFF910] date];
  id v8 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55___MPCPlaybackEnginePlayer_becomeActiveWithCompletion___block_invoke;
  v12[3] = &unk_2643BE1E0;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v14 = v10;
  id v11 = v4;
  id v15 = v11;
  [v8 activateAudioSessionWithCompletion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)finalizeStateRestoreWithCompletion:(id)a3
{
  id v4 = a3;
  float v5 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  id v6 = [v5 engineID];
  objc_initWeak(&location, self);
  id v7 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63___MPCPlaybackEnginePlayer_finalizeStateRestoreWithCompletion___block_invoke;
  v10[3] = &unk_2643BFA30;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  id v9 = v6;
  id v11 = v9;
  [v7 restoreQueue:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)finalizeSetQueue:(id)a3 completion:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _Block_copy(a4);
  id v8 = objc_alloc(MEMORY[0x263F54ED0]);
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke;
  v67[3] = &unk_2643C55A8;
  id v9 = v7;
  id v69 = v9;
  id v10 = v6;
  id v68 = v10;
  id v11 = (void *)[v8 initWithDeallocHandler:v67];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_2;
  aBlock[3] = &unk_2643C59E0;
  id v45 = v11;
  id v64 = v45;
  id v46 = v9;
  id v66 = v46;
  id v12 = v10;
  id v65 = v12;
  id v13 = (void (**)(id, void))_Block_copy(aBlock);
  uint64_t v48 = [v12 commandID];
  id v14 = [(_MPCPlaybackEnginePlayer *)self playbackEngine];
  double v47 = [v14 engineID];
  id v15 = [v12 playbackQueue];
  int v16 = [v15 isRequestingImmediatePlayback];
  id v17 = [v15 siriReferenceIdentifier];
  BOOL v44 = v17 != 0;

  if (v16) {
    [(_MPCPlaybackEnginePlayer *)self takeEVSDeferralAssertionForFirstAudioFrame];
  }
  id v18 = [(_MPCPlaybackEnginePlayer *)self playbackStackController];
  id v19 = [v18 currentQueueItem];

  if (v19)
  {
    uint64_t v43 = v19;
    if (v16)
    {
      id v20 = v47;
    }
    else if (v17 {
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    }
           && [v15 shouldSkipWaitingForReadyToPlayStatus])
    {
      uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v71 = v47;
        __int16 v72 = 2048;
        double v73 = self;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - calling performSetQueue completion early (continued asynchronously)", buf, 0x16u);
      }

      v13[2](v13, 0);
      objc_initWeak((id *)buf, self);
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_77;
      v60[3] = &unk_2643BE168;
      objc_copyWeak(&v62, (id *)buf);
      id v61 = v47;
      id v20 = v47;
      uint64_t v24 = (void (**)(id, void))_Block_copy(v60);

      objc_destroyWeak(&v62);
      objc_destroyWeak((id *)buf);
      id v13 = v24;
    }
    else
    {
      id v20 = v47;
    }
    id v25 = [v14 queueController];
    id v26 = [v25 preferredFirstContentItemID];
    id v27 = [(_MPCPlaybackEnginePlayer *)self errorController];
    [v27 setPreferredFirstContentItemID:v26];

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    void v52[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_78;
    void v52[3] = &unk_2643BE1B8;
    id v53 = v20;
    double v54 = self;
    id v19 = v43;
    id v28 = v43;
    id v55 = v28;
    char v58 = v16;
    id v56 = v48;
    id v13 = v13;
    id v57 = v13;
    BOOL v59 = v44;
    id v29 = (void (**)(void))_Block_copy(v52);
    id v30 = v28;
    if ([v30 isAssetLoaded]
      && [v30 canUseLoadedAsset]
      && [v30 canReusePlayerItem]
      && v16)
    {
      id v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      os_signpost_id_t v32 = os_signpost_id_generate(v31);

      os_signpost_id_t v33 = v32;
      double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      double v35 = v34;
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21BB87000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PrepareForRate", "", buf, 2u);
      }

      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __56___MPCPlaybackEnginePlayer_finalizeSetQueue_completion___block_invoke_84;
      v49[3] = &unk_2643C1478;
      os_signpost_id_t v51 = v33;
      double v50 = v29;
      LODWORD(v36) = 1.0;
      [v30 prepareForRate:v49 completionHandler:v36];
    }
    else
    {
      v29[2](v29);
    }
    id v37 = [v14 queueController];
    uint64_t v38 = [v37 behaviorType];

    if (v38 == 4 && v16)
    {
      +[_MPCPodcastsPlaybackRateHelper preferredPlaybackRate];
      int v40 = v39;
      long long v41 = [v14 player];
      LODWORD(v42) = v40;
      [v41 setRate:@"userDefaultsRate" identifier:&__block_literal_global completion:v42];
    }
    uint64_t v22 = v47;
  }
  else
  {
    float v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    uint64_t v22 = v47;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v71 = v47;
      __int16 v72 = 2048;
      double v73 = self;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCPlaybackEngineImplementation: %p - finalizeSetQueue completed without a start item [empty queue]", buf, 0x16u);
    }

    v13[2](v13, 0);
    [(_MPCPlaybackEnginePlayer *)self invalidateEVSDeferralAssertionForFirstAudioFrame];
  }
}

- (void)dealloc
{
  MEMORY[0x21D49D7C0](self->_stateHandle, a2);
  v3.receiver = self;
  v3.super_class = (Class)_MPCPlaybackEnginePlayer;
  [(_MPCPlaybackEnginePlayer *)&v3 dealloc];
}

+ (id)describePlayer:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F12118] infoCenterForPlayerID:v3];
  float v5 = [v4 playbackQueueDataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 playbackEngine];
    id v7 = [v6 player];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [MEMORY[0x263F089D8] string];
      [v8 appendFormat:@"# Player: %@\n\n", v3];
      id v9 = [v7 _stateDictionary];
    }
    else
    {
      id v10 = NSString;
      id v11 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v11);
      id v8 = [v10 stringWithFormat:@"Unexpected implementation class found: %@", v9];
    }
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"No player found for %@", v3];
  }

  return v8;
}

@end