@interface AVPlayerController
+ (BOOL)cachedIsPictureInPictureSupported;
+ (id)_sortedAudibleOption:(id)a3;
+ (id)canonicalLanguageIdentifierFromString:(id)a3;
+ (id)keyPathsForValuesAffectingActiveRate;
+ (id)keyPathsForValuesAffectingAllowsExternalPlayback;
+ (id)keyPathsForValuesAffectingCanPause;
+ (id)keyPathsForValuesAffectingCanPlay;
+ (id)keyPathsForValuesAffectingCanScanBackward;
+ (id)keyPathsForValuesAffectingCanScanForward;
+ (id)keyPathsForValuesAffectingCanSeek;
+ (id)keyPathsForValuesAffectingCanSeekChapterBackward;
+ (id)keyPathsForValuesAffectingCanSeekChapterForward;
+ (id)keyPathsForValuesAffectingCanSeekFrameBackward;
+ (id)keyPathsForValuesAffectingCanSeekFrameForward;
+ (id)keyPathsForValuesAffectingCanSeekToBeginning;
+ (id)keyPathsForValuesAffectingCanSeekToEnd;
+ (id)keyPathsForValuesAffectingCanTogglePlayback;
+ (id)keyPathsForValuesAffectingCompletelySeekable;
+ (id)keyPathsForValuesAffectingContentDimensions;
+ (id)keyPathsForValuesAffectingContentDuration;
+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes;
+ (id)keyPathsForValuesAffectingCurrentAudioMediaSelectionOption;
+ (id)keyPathsForValuesAffectingCurrentLegibleMediaSelectionOption;
+ (id)keyPathsForValuesAffectingCurrentTime;
+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes;
+ (id)keyPathsForValuesAffectingCurrentVideoMediaSelectionOption;
+ (id)keyPathsForValuesAffectingDefaultPlaybackRate;
+ (id)keyPathsForValuesAffectingError;
+ (id)keyPathsForValuesAffectingExternalPlaybackActive;
+ (id)keyPathsForValuesAffectingExternalPlaybackType;
+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime;
+ (id)keyPathsForValuesAffectingHasAudioMediaSelectionOptions;
+ (id)keyPathsForValuesAffectingHasContent;
+ (id)keyPathsForValuesAffectingHasContentChapters;
+ (id)keyPathsForValuesAffectingHasEnabledAudio;
+ (id)keyPathsForValuesAffectingHasEnabledVideo;
+ (id)keyPathsForValuesAffectingHasLegibleMediaSelectionOptions;
+ (id)keyPathsForValuesAffectingHasLiveStreamingContent;
+ (id)keyPathsForValuesAffectingHasMediaSelectionOptions;
+ (id)keyPathsForValuesAffectingHasReadableTimecodes;
+ (id)keyPathsForValuesAffectingHasSeekableLiveStreamingContent;
+ (id)keyPathsForValuesAffectingHasShareableContent;
+ (id)keyPathsForValuesAffectingHasTrimmableContent;
+ (id)keyPathsForValuesAffectingHasVideo;
+ (id)keyPathsForValuesAffectingLoadedTimeRanges;
+ (id)keyPathsForValuesAffectingMaxTime;
+ (id)keyPathsForValuesAffectingMaximumVideoResolution;
+ (id)keyPathsForValuesAffectingMinTime;
+ (id)keyPathsForValuesAffectingPictureInPicturePossible;
+ (id)keyPathsForValuesAffectingPlayableOffline;
+ (id)keyPathsForValuesAffectingPlaying;
+ (id)keyPathsForValuesAffectingPlayingOnExternalScreen;
+ (id)keyPathsForValuesAffectingPreferredDisplayCriteria;
+ (id)keyPathsForValuesAffectingRate;
+ (id)keyPathsForValuesAffectingReadyToPlay;
+ (id)keyPathsForValuesAffectingReversePlaybackEndTime;
+ (id)keyPathsForValuesAffectingSeekableTimeRanges;
+ (id)keyPathsForValuesAffectingStatus;
+ (id)keyPathsForValuesAffectingStreaming;
+ (id)keyPathsForValuesAffectingTimeControlStatus;
+ (id)keyPathsForValuesAffectingUsesExternalPlaybackWhileExternalScreenIsActive;
+ (id)keyPathsForValuesAffectingVolume;
+ (id)keyPathsForValuesAffectingpreferredTransform;
+ (void)initialize;
+ (void)setCachedIsPictureInPictureSupported:(BOOL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal;
- (AVAsset)assetBeingPrepared;
- (AVAsset)currentAssetIfReady;
- (AVAssetTrack)currentAudioTrack;
- (AVAssetTrack)currentVideoTrack;
- (AVCoordinatedPlaybackSuspension)scrubCoordinatorSuspension;
- (AVInterstitialController)interstitialController;
- (AVMediaSelectionOption)currentVideoMediaSelectionOption;
- (AVObservationController)observationController;
- (AVPlayer)activePlayer;
- (AVPlayer)player;
- (AVPlayerController)init;
- (AVPlayerController)initWithPlayer:(id)a3;
- (AVPlayerControllerDelegate)internalDelegate;
- (AVPlayerLayer)playerLayerForReducingResources;
- (AVTimecodeController)timecodeController;
- (AVValueTiming)maxTiming;
- (AVValueTiming)minTiming;
- (AVValueTiming)timing;
- (BOOL)_assetContainsProResRaw:(id)a3;
- (BOOL)_assetIsMarkedNotSerializable:(id)a3;
- (BOOL)_assetIsRestrictedFromSaving:(id)a3;
- (BOOL)_isScanningTV;
- (BOOL)_mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup;
- (BOOL)_willAutomaticallySelectLegibleFallbackForLanguageMismatch;
- (BOOL)allowsAudioPlayback;
- (BOOL)allowsExternalPlayback;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)avkit_isAVPlayerControllerOrSubclass;
- (BOOL)canPlay;
- (BOOL)canPlayImmediately;
- (BOOL)canScanBackward;
- (BOOL)canScanForward;
- (BOOL)canSeek;
- (BOOL)canSeekChapterBackward;
- (BOOL)canSeekChapterForward;
- (BOOL)canSeekFrameBackward;
- (BOOL)canSeekFrameForward;
- (BOOL)canTogglePictureInPicture;
- (BOOL)canTogglePlayback;
- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused;
- (BOOL)closedCaptionsEnabled;
- (BOOL)coordinatedPlaybackActive;
- (BOOL)handlesAudioSessionInterruptions;
- (BOOL)hasAudioMediaSelectionOptions;
- (BOOL)hasBegunInspection;
- (BOOL)hasContent;
- (BOOL)hasContentChapters;
- (BOOL)hasEnabledAudio;
- (BOOL)hasEnabledVideo;
- (BOOL)hasLegibleMediaSelectionOptions;
- (BOOL)hasLiveStreamingContent;
- (BOOL)hasMediaSelectionOptions;
- (BOOL)hasProtectedContent;
- (BOOL)hasReadableTimecodes;
- (BOOL)hasSeekableLiveStreamingContent;
- (BOOL)hasShareableContent;
- (BOOL)hasTimecodes;
- (BOOL)hasTrimmableContent;
- (BOOL)hasVideo;
- (BOOL)isAtLiveEdge;
- (BOOL)isAtMaxTime;
- (BOOL)isAtMinTime;
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompletelySeekable;
- (BOOL)isComposable;
- (BOOL)isDisablingAutomaticTermination;
- (BOOL)isDisplayingNonForcedOnlyLegibleOption;
- (BOOL)isExternalPlaybackActive;
- (BOOL)isInspectionSuspended;
- (BOOL)isLooping;
- (BOOL)isMuted;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPictureInPictureInterrupted;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPictureInPictureSupported;
- (BOOL)isPlayableOffline;
- (BOOL)isPlaybackSuspended;
- (BOOL)isPlaying;
- (BOOL)isPlayingHDRContent;
- (BOOL)isPlayingOnExternalScreen;
- (BOOL)isPlayingOnMatchPointDevice;
- (BOOL)isPlayingOnSecondScreen;
- (BOOL)isPreventingIdleDisplaySleep;
- (BOOL)isPreventingIdleSystemSleep;
- (BOOL)isReadyToPlay;
- (BOOL)isReducingResourcesForPictureInPicture;
- (BOOL)isScrubbing;
- (BOOL)isSeeking;
- (BOOL)isSeekingInternal;
- (BOOL)isStreaming;
- (BOOL)setLegibleMediaOptionVisibility:(BOOL)a3 prefersLastKnownCaptionType:(BOOL)a4 prefersSystemLanguage:(BOOL)a5;
- (BOOL)shouldLoadVisualMediaSelectionOptions;
- (BOOL)startGeneratingTimecodesUsingBlock:(id)a3;
- (BOOL)subtitlesActive;
- (BOOL)touchBarRequiresLinearPlayback;
- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive;
- (BSSimpleAssertion)reduceResourceUsageAssertion;
- (CGAffineTransform)preferredTransform;
- (CGSize)contentDimensions;
- (CGSize)maximumVideoResolution;
- (CGSize)presentationSize;
- (NSArray)availableMetadataFormats;
- (NSArray)contentChapters;
- (NSArray)photosensitivityRegions;
- (NSArray)visualMediaSelectionOptions;
- (NSDate)currentDate;
- (NSDate)currentOrEstimatedDate;
- (NSDictionary)metadata;
- (NSError)error;
- (NSString)externalPlaybackAirPlayDeviceLocalizedName;
- (NSString)pipActivitySessionIdentifier;
- (OS_dispatch_queue)assetInspectionQueue;
- (OS_dispatch_source)seekTimer;
- (double)_adjustedSeekTimeFromTime:(double)a3 toTime:(double)a4;
- (double)activeRate;
- (double)contentDuration;
- (double)contentDurationWithinEndTimes;
- (double)currentTime;
- (double)currentTimeWithinEndTimes;
- (double)defaultPlaybackRate;
- (double)initialScrubbingTime;
- (double)maxTime;
- (double)minTime;
- (double)rate;
- (double)rateBeforeScrubBegan;
- (double)seekToTime;
- (double)suspendedRate;
- (double)timecodeObservationInterval;
- (double)volume;
- (float)nominalFrameRate;
- (id)_createMetadataDictionaryForCurrentAsset;
- (id)_languageCodesFromLanguageIdentifiers:(id)a3;
- (id)_optionsForGroup:(id)a3;
- (id)_outputContext;
- (id)_photosensitiveDisplayTimes;
- (id)_playableLegibleMediaSelectionOptions;
- (id)_preferredLanguageCodes;
- (id)_queuePlayer;
- (id)_selectedMediaOptionWithMediaCharacteristic:(id)a3;
- (id)_timecodeTrack;
- (id)audioMediaSelectionOptions;
- (id)audioOptions;
- (id)audioWaveform;
- (id)currentAudioMediaSelectionOption;
- (id)currentEnabledAssetTrackForMediaType:(id)a3;
- (id)currentLegibleMediaSelectionOption;
- (id)legibleMediaSelectionOptions;
- (id)legibleOptions;
- (id)loadTimecodeControllerIfNeeded;
- (id)loadedTimeRanges;
- (id)maxFrameCountString;
- (id)maxTimecode;
- (id)mediaSelectionGroupForMediaCharacteristic:(id)a3;
- (id)preferredDisplayCriteria;
- (id)scanningDelays;
- (id)seekableTimeRanges;
- (id)timecodeForCurrentTime;
- (id)visualOptions;
- (int64_t)captionAppearanceDisplayType;
- (int64_t)externalPlaybackType;
- (int64_t)frameNumberForCurrentTime;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (uint64_t)_mainPlayerIsWaitingForInterstitialPlayback;
- (void)_beginPlaybackSuspension_AVFoundationStrategy;
- (void)_cancelOutstandingAtLiveEdgeStateUpdates;
- (void)_cancelPendingSeeksIfNeeded;
- (void)_commonInit;
- (void)_disableLegibleMediaSelectionOptions:(id)a3;
- (void)_enableAutoMediaSelection:(id)a3;
- (void)_endPlaybackSuspension_AVFoundationStrategy;
- (void)_ensureUserCaptionDisplayType:(int64_t)a3;
- (void)_observeValueForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5;
- (void)_performAutomaticMediaSelectionForUserCaptionDisplayType:(int64_t)a3;
- (void)_playAtRate:(double)a3;
- (void)_prepareAssetForInspectionIfNeeded;
- (void)_retryPlayImmediatelyIfNeeded;
- (void)_scheduleAtLiveEdgeStateUpdateIfNeeded;
- (void)_scheduleAtLiveEdgeStateUpdateWithTimeInterval:(double)a3;
- (void)_setMediaOption:(id)a3 mediaCharacteristic:(id)a4;
- (void)_setMinTiming:(id)a3 maxTiming:(id)a4;
- (void)_setMostRecentChosenOption:(id)a3;
- (void)_setNeedsAtLiveEdgeStateUpdate;
- (void)_setPlaybackSuspended:(BOOL)a3;
- (void)_setRate_AVFoundationStrategy:(double)a3;
- (void)_setSuspendedRate:(double)a3;
- (void)_setupInterstitialController;
- (void)_startSuspendingPlayback;
- (void)_stopSuspendingPlayback;
- (void)_throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext:(id)a3;
- (void)_updateActivePlayer;
- (void)_updateAtLiveEdgeStateAndScheduleTimerIfNeeded;
- (void)_updateAtLiveEdgeStateIfNeeded;
- (void)_updateCoordinatedPlaybackActive;
- (void)_updateCurrentAudioTrackIfNeeded;
- (void)_updateCurrentVideoTrackIfNeeded;
- (void)_updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded;
- (void)_updateIsPlayingHDRContentIfNeeded;
- (void)_updateMetadata;
- (void)_updateMinMaxTimingIfNeeded;
- (void)_updatePhotosensitivityRegions;
- (void)_updatePlayerMutedState;
- (void)_updatePlayingOnMatchPointDeviceIfNeeded;
- (void)_updateRateForScrubbingAndSeeking;
- (void)_updateScanningBackwardRate;
- (void)_updateScanningForwardRate;
- (void)acquireResourceReductionAssertion;
- (void)actuallySeekToTime;
- (void)autoplay:(id)a3;
- (void)beginPlaybackSuspension;
- (void)beginReducingResourcesForPictureInPicturePlayerLayer:(id)a3;
- (void)beginScanningBackward:(id)a3;
- (void)beginScanningForward:(id)a3;
- (void)beginScrubbing;
- (void)beginScrubbing:(id)a3;
- (void)changeVolumeToMaximum:(id)a3;
- (void)changeVolumeToMinimum:(id)a3;
- (void)dealloc;
- (void)decreaseVolume:(id)a3;
- (void)endPlaybackSuspension;
- (void)endReducingResourcesForPictureInPicturePlayerLayer:(id)a3;
- (void)endScanningBackward:(id)a3;
- (void)endScanningForward:(id)a3;
- (void)endScrubbing;
- (void)endScrubbing:(id)a3;
- (void)gotoEndOfSeekableRanges:(id)a3;
- (void)increaseVolume:(id)a3;
- (void)observationInfo;
- (void)pause:(id)a3;
- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3;
- (void)play:(id)a3;
- (void)reloadAudioOptions;
- (void)reloadLegibleOptions;
- (void)reloadOptions;
- (void)reloadOptionsAndCurrentSelections;
- (void)reloadOptionsAssumingMediaOptionsMayHaveChanged:(BOOL)a3;
- (void)reloadVisualOptions;
- (void)resumePlaybackCoordinatorIfSuspended;
- (void)scanBackward:(id)a3;
- (void)scanForward:(id)a3;
- (void)seekByTimeInterval:(double)a3;
- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5;
- (void)seekChapterBackward:(id)a3;
- (void)seekChapterForward:(id)a3;
- (void)seekFrameBackward:(id)a3;
- (void)seekFrameForward:(id)a3;
- (void)seekOrStepByFrameCount:(int64_t)a3;
- (void)seekToBeginning:(id)a3;
- (void)seekToCMTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)seekToChapter:(id)a3;
- (void)seekToEnd:(id)a3;
- (void)seekToFrame:(int64_t)a3;
- (void)seekToTime:(double)a3;
- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5;
- (void)seekToTimecode:(id)a3;
- (void)selectedMediaOptionMayHaveChanged;
- (void)selectedMediaOptionMayHaveChanged:(BOOL)a3;
- (void)setActivePlayer:(id)a3;
- (void)setActiveRate:(double)a3;
- (void)setAllowsAudioPlayback:(BOOL)a3;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setAssetBeingPrepared:(id)a3;
- (void)setAssetInspectionQueue:(id)a3;
- (void)setAtLiveEdge:(BOOL)a3;
- (void)setAtMaxTime:(BOOL)a3;
- (void)setAtMinTime:(BOOL)a3;
- (void)setAudioMediaSelectionOptions:(id)a3;
- (void)setAvailableMetadataFormats:(id)a3;
- (void)setCanTogglePictureInPicture:(BOOL)a3;
- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)a3;
- (void)setCaptionAppearanceDisplayType:(int64_t)a3;
- (void)setCompatibleWithAirPlayVideo:(BOOL)a3;
- (void)setComposable:(BOOL)a3;
- (void)setContentChapters:(id)a3;
- (void)setCoordinatedPlaybackActive:(BOOL)a3;
- (void)setCurrentAssetIfReady:(id)a3;
- (void)setCurrentAssetMediaOption:(id)a3;
- (void)setCurrentAudioMediaSelectionOption:(id)a3;
- (void)setCurrentAudioTrack:(id)a3;
- (void)setCurrentLegibleMediaSelectionOption:(id)a3;
- (void)setCurrentVideoTrack:(id)a3;
- (void)setDefaultPlaybackRate:(double)a3;
- (void)setDisablingAutomaticTermination:(BOOL)a3;
- (void)setExternalPlaybackAirPlayDeviceLocalizedName:(id)a3;
- (void)setForwardPlaybackEndTime:(id *)a3;
- (void)setHandlesAudioSessionInterruptions:(BOOL)a3;
- (void)setHasBegunInspection:(BOOL)a3;
- (void)setHasProtectedContent:(BOOL)a3;
- (void)setInitialScrubbingTime:(double)a3;
- (void)setInspectionSuspended:(BOOL)a3;
- (void)setInternalDelegate:(id)a3;
- (void)setInterstitialController:(id)a3;
- (void)setLegibleMediaSelectionOptions:(id)a3;
- (void)setLegibleMediaSelectionOptions:(id)a3 audioMediaSelectionOptions:(id)a4 assumeMediaOptionMayHaveChanged:(BOOL)a5;
- (void)setLooping:(BOOL)a3;
- (void)setMaxTime:(double)a3;
- (void)setMaxTiming:(id)a3;
- (void)setMediaOptionCriteriaAlwaysOn:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMinTime:(double)a3;
- (void)setMinTiming:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setObservationInfo:(void *)a3;
- (void)setPhotosensitivityRegions:(id)a3;
- (void)setPictureInPictureActive:(BOOL)a3;
- (void)setPictureInPictureInterrupted:(BOOL)a3;
- (void)setPictureInPictureSupported:(BOOL)a3;
- (void)setPipActivitySessionIdentifier:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayerForReducingResources:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPlayingOnMatchPointDevice:(BOOL)a3;
- (void)setPlayingOnSecondScreen:(BOOL)a3;
- (void)setPresentationSize:(CGSize)a3;
- (void)setPreventingIdleDisplaySleep:(BOOL)a3;
- (void)setPreventingIdleSystemSleep:(BOOL)a3;
- (void)setRate:(double)a3;
- (void)setRateBeforeScrubBegan:(double)a3;
- (void)setRateWithForce:(double)a3;
- (void)setReduceResourceUsageAssertion:(id)a3;
- (void)setReversePlaybackEndTime:(id *)a3;
- (void)setScanningTV:(BOOL)a3;
- (void)setScrubCoordinatorSuspension:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSeekToTime:(double)a3;
- (void)setSeekToTimeInternal:(id *)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setSeekingInternal:(BOOL)a3;
- (void)setShouldLoadVisualMediaSelectionOptions:(BOOL)a3;
- (void)setTiming:(id)a3;
- (void)setTouchBarRequiresLinearPlayback:(BOOL)a3;
- (void)setVisualMediaSelectionOptions:(id)a3;
- (void)setVolume:(double)a3;
- (void)skipBackwardThirtySeconds:(id)a3;
- (void)startInspectionIfNeeded;
- (void)startKVO;
- (void)startUsingNetworkResourcesForLiveStreamingWhilePaused;
- (void)stopGeneratingTimecodes;
- (void)stopUsingNetworkResourcesForLiveStreamingWhilePaused;
- (void)suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary;
- (void)throttledSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5;
- (void)toggleMuted:(id)a3;
- (void)togglePlayback:(id)a3;
- (void)togglePlaybackEvenWhenInBackground:(id)a3;
- (void)updateAtMinMaxTime;
- (void)updateMinMaxTiming;
- (void)updateTiming;
@end

@implementation AVPlayerController

- (void)observationInfo
{
  return self->_observationInfo;
}

- (void)setObservationInfo:(void *)a3
{
  self->_observationInfo = a3;
}

- (AVAsset)currentAssetIfReady
{
  return (AVAsset *)self->_observationController;
}

+ (id)keyPathsForValuesAffectingContentDimensions
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"readyToPlay";
  v6[1] = @"presentationSize";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (AVPlayerController)initWithPlayer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AVPlayerController initWithPlayer:]";
    __int16 v18 = 2048;
    id v19 = v5;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s player: %p", buf, 0x16u);
  }

  v15.receiver = self;
  v15.super_class = (Class)AVPlayerController;
  v7 = [(AVPlayerController *)&v15 init];
  v8 = v7;
  if (v7)
  {
    [(AVPlayerController *)v7 _commonInit];
    v8->_inspectionSuspended = 1;
    v9 = [[AVObservationController alloc] initWithOwner:v8];
    double activeRate = v8->_activeRate;
    *(void *)&v8->_double activeRate = v9;

    v8->_availableMetadataFormats = (NSArray *)0x7FF8000000000000;
    BYTE5(v8->_liveEdgeTimer) = [(id)objc_opt_class() cachedIsPictureInPictureSupported];
    v8->_handlesAudioSessionInterruptions = 0;
    objc_storeStrong((id *)&v8->_canTogglePictureInPicture, a3);
    LOBYTE(v8->_liveStreamMaxTiming) = 1;
    BYTE1(v8->_liveEdgeTimer) = 0;
    BYTE3(v8->_photosensitivityMetadataHandler) = 0;
    [(AVPlayerController *)v8 startInspectionIfNeeded];
    [*(id *)&v8->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F16000] object:0 notificationCenter:0 observationHandler:&__block_literal_global_22812];
    v11 = [v5 backgroundPIPAuthorizationToken];
    uint64_t v12 = [v11 copy];
    scrubCoordinatorSuspension = v8->_scrubCoordinatorSuspension;
    v8->_scrubCoordinatorSuspension = (AVCoordinatedPlaybackSuspension *)v12;

    v8->_seekTimer = (OS_dispatch_source *)MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
    [(AVPlayerController *)v8 _updateActivePlayer];
  }

  return v8;
}

- (void)startInspectionIfNeeded
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (![(AVPlayerController *)self isInspectionSuspended]
    && ![(AVPlayerController *)self hasBegunInspection]
    && !self->_isDeallocating)
  {
    [(AVPlayerController *)self setHasBegunInspection:1];
    objc_initWeak(&location, self);
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F1FA58] object:0 notificationCenter:0 observationHandler:&__block_literal_global_44_22778];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F1FA68] object:0 notificationCenter:0 observationHandler:&__block_literal_global_44_22778];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F16050] object:0 notificationCenter:0 observationHandler:&__block_literal_global_46_22779];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F16020] object:0 notificationCenter:0 observationHandler:&__block_literal_global_48];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F16060] object:*(void *)&self->_canTogglePictureInPicture notificationCenter:0 observationHandler:&__block_literal_global_51_22780];
    double activeRate = self->_activeRate;
    v4 = [MEMORY[0x1E4F153E0] sharedInstance];
    [*(id *)&activeRate startObservingNotificationForName:*MEMORY[0x1E4F15000] object:v4 notificationCenter:0 observationHandler:&__block_literal_global_56_22781];

    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F1C370] object:0 notificationCenter:0 observationHandler:&__block_literal_global_68];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_captionAppearanceSettingsChangeNotificationCallback, (CFStringRef)*MEMORY[0x1E4F31218], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_audibleMediaSettingsChangeNotificationCallback, (CFStringRef)*MEMORY[0x1E4F31210], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(AVPlayerController *)self startKVO];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F16040] object:0 notificationCenter:0 observationHandler:&__block_literal_global_71];
    [*(id *)&self->_activeRate startObservingNotificationForName:@"AVAirMessageDispatcherDidChangeTargetNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_74];
    double v7 = self->_activeRate;
    v8 = [*(id *)&self->_canTogglePictureInPicture _playbackCoordinatorWithoutTriggeringFullSetup];
    [*(id *)&v7 startObservingNotificationForName:*MEMORY[0x1E4F15FD8] object:v8 notificationCenter:0 observationHandler:&__block_literal_global_77];

    [(AVPlayerController *)self _updateCoordinatedPlaybackActive];
    [(AVPlayerController *)self _updatePhotosensitivityRegions];
    [*(id *)&self->_activeRate startObservingNotificationForName:*MEMORY[0x1E4F15F10] object:0 notificationCenter:0 observationHandler:&__block_literal_global_80];
    uint64_t v9 = *(void *)&self->_canTogglePictureInPicture;
    if (v9) {
      id v10 = (id)[*(id *)&self->_activeRate startObserving:v9 keyPath:@"muted" includeInitialValue:1 observationHandler:&__block_literal_global_88];
    }
    internalDelegate = self->_internalDelegate;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4_89;
    v21 = &unk_1E5FC44F8;
    objc_copyWeak(&v22, &location);
    dispatch_async(internalDelegate, &v18);
    [(AVPlayerController *)self _setupInterstitialController];
    double v12 = self->_activeRate;
    pipActivitySessionIdentifier = self->_pipActivitySessionIdentifier;
    v24[0] = @"interstitialPlayer.rate";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v15 = (id)[*(id *)&v12 startObserving:pipActivitySessionIdentifier keyPaths:v14 observationHandler:&__block_literal_global_97];

    [*(id *)&self->_activeRate startObservingNotificationForName:@"AVKitCurrentInterstitialEventChangedNotification" object:self->_pipActivitySessionIdentifier notificationCenter:0 observationHandler:&__block_literal_global_99];
    v16 = [(AVPlayerController *)self internalDelegate];
    LOBYTE(pipActivitySessionIdentifier) = objc_opt_respondsToSelector();

    if (pipActivitySessionIdentifier)
    {
      v17 = [(AVPlayerController *)self internalDelegate];
      [v17 playerControllerDidCompleteInspection:self];
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_updateActivePlayer
{
  if (-[AVPlayerController _mainPlayerIsWaitingForInterstitialPlayback](self))
  {
    player = self->_player;
    v4 = [(AVPlayerController *)self interstitialController];
    id v5 = [v4 interstitialPlayer];

    if (player == v5) {
      return;
    }
    id v7 = [(AVPlayerController *)self interstitialController];
    v6 = [v7 interstitialPlayer];
    [(AVPlayerController *)self setActivePlayer:v6];
  }
  else
  {
    id v7 = [(AVPlayerController *)self player];
    -[AVPlayerController setActivePlayer:](self, "setActivePlayer:");
  }
}

- (void)setActivePlayer:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    p_player = &self->_player;
    objc_storeStrong((id *)p_player, a3);
    id v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_player;
      int v9 = 136315394;
      id v10 = "-[AVPlayerController setActivePlayer:]";
      __int16 v11 = 2112;
      double v12 = v8;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Updated player to: %@ player", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (uint64_t)_mainPlayerIsWaitingForInterstitialPlayback
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 player];
  uint64_t v3 = [v2 timeControlStatus];

  v4 = [a1 player];
  id v5 = [v4 reasonForWaitingToPlay];

  if (v3 == 1) {
    uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F16090]];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_commonInit
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avkit.seekQueue", v3);
  seekQueue = self->_seekQueue;
  self->_seekQueue = v4;

  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  id v7 = (AVAsset *)dispatch_queue_create("com.apple.avkit.playerControllerAssetInspectionQueue", v6);
  currentAssetIfReady = self->_currentAssetIfReady;
  self->_currentAssetIfReady = v7;

  int v9 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
  __int16 v11 = (AVPlayerControllerDelegate *)dispatch_queue_create("com.apple.avkit.playerControllerBackgroundQueue", v10);
  internalDelegate = self->_internalDelegate;
  self->_internalDelegate = v11;

  self->_reduceResourceUsageAssertion = (BSSimpleAssertion *)0x3FF0000000000000;
  self->_currentVideoTrack = (AVAssetTrack *)0x7FF8000000000000;
  uint64_t v13 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_presentationSize.height = *MEMORY[0x1E4F1F9F8];
  *(void *)&self->_seekToTimeInternal.timescale = *(void *)(v13 + 16);
  self->_captionAppearanceDisplayType = 0x7FF8000000000000;
  BYTE2(self->_photosensitivityMetadataHandler) = 1;
}

- (BOOL)isPlayingOnSecondScreen
{
  return LOBYTE(self->_rateBeforeForceScanning);
}

+ (BOOL)cachedIsPictureInPictureSupported
{
  return AVPlayerControllerCachedIsPictureInPictureSupported;
}

+ (id)keyPathsForValuesAffectingReadyToPlay
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"status"];
}

+ (id)keyPathsForValuesAffectingRate
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"activePlayer.rate"];
}

- (BOOL)isExternalPlaybackActive
{
  v2 = [(AVPlayerController *)self player];
  char v3 = [v2 isExternalPlaybackActive];

  return v3;
}

- (BOOL)allowsExternalPlayback
{
  v2 = [(AVPlayerController *)self player];
  char v3 = [v2 allowsExternalPlayback];

  return v3;
}

- (double)defaultPlaybackRate
{
  v2 = [(AVPlayerController *)self player];
  [v2 defaultRate];
  double v4 = v3;

  return v4;
}

- (BOOL)isPlayingOnExternalScreen
{
  if ([(AVPlayerController *)self isExternalPlaybackActive]) {
    return 1;
  }

  return [(AVPlayerController *)self isPlayingOnSecondScreen];
}

- (double)rate
{
  v2 = [(AVPlayerController *)self activePlayer];
  [v2 rate];
  double v4 = v3;

  return v4;
}

- (AVPlayer)activePlayer
{
  return self->_player;
}

- (BOOL)hasEnabledAudio
{
  v2 = [(AVPlayerController *)self player];
  float v3 = [v2 currentItem];
  char v4 = [v3 hasEnabledAudio];

  return v4;
}

- (AVPlayer)player
{
  return *(AVPlayer **)&self->_canTogglePictureInPicture;
}

- (BOOL)isInspectionSuspended
{
  return self->_inspectionSuspended;
}

- (AVInterstitialController)interstitialController
{
  return (AVInterstitialController *)self->_pipActivitySessionIdentifier;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  if (LOBYTE(self->_rateBeforeForceScanning) != a3)
  {
    BOOL v3 = a3;
    LOBYTE(self->_rateBeforeForceScanning) = a3;
    id v5 = [(AVPlayerController *)self player];
    id v7 = v5;
    if (v3)
    {
      BYTE1(self->_rateBeforeForceScanning) = [v5 preventsDisplaySleepDuringVideoPlayback];

      id v5 = [(AVPlayerController *)self player];
      id v7 = v5;
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = BYTE1(self->_rateBeforeForceScanning);
    }
    [v5 setPreventsDisplaySleepDuringVideoPlayback:v6];
  }
}

- (void)setHandlesAudioSessionInterruptions:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_handlesAudioSessionInterruptions != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "NO";
      int v7 = 136315650;
      v8 = "-[AVPlayerController(AVPlayerControllerExternalPlaybackSupportInternal) setHandlesAudioSessionInterruptions:]";
      id v10 = "handlesAudioSessionInterruptions";
      __int16 v9 = 2080;
      if (v3) {
        uint64_t v6 = "YES";
      }
      __int16 v11 = 2080;
      double v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_handlesAudioSessionInterruptions = v3;
  }
}

- (void)setInternalDelegate:(id)a3
{
}

- (BOOL)avkit_isAVPlayerControllerOrSubclass
{
  return 1;
}

- (void)setInspectionSuspended:(BOOL)a3
{
  if (self->_inspectionSuspended != a3)
  {
    self->_inspectionSuspended = a3;
    if (!a3)
    {
      if ([(AVPlayerController *)self hasBegunInspection])
      {
        [(AVPlayerController *)self _prepareAssetForInspectionIfNeeded];
      }
      else
      {
        [(AVPlayerController *)self startInspectionIfNeeded];
      }
    }
  }
}

- (NSString)pipActivitySessionIdentifier
{
  return (NSString *)&self->_scrubCoordinatorSuspension->super.isa;
}

+ (id)keyPathsForValuesAffectingCurrentLegibleMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.appliesMediaSelectionCriteriaAutomatically", @"currentAssetIfReady", @"player.currentItem.currentMediaSelection", @"legibleMediaSelectionOptions", @"captionAppearanceDisplayType", 0);
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.status", @"player.currentItem", @"player.currentItem.status", 0);
}

+ (id)keyPathsForValuesAffectingTimeControlStatus
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.timeControlStatus", @"interstitialController.interstitialPlayer.timeControlStatus", 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (dyld_program_sdk_at_least() & 1) == 0) {
    AVPlayerControllerAutoplayEnabled = 1;
  }
}

- (id)_playableLegibleMediaSelectionOptions
{
  BOOL v3 = [(AVPlayerController *)self currentAssetIfReady];
  char v4 = objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B80]);

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F16538];
    uint64_t v6 = [(AVPlayerController *)self _optionsForGroup:v4];
    int v7 = [v5 playableMediaSelectionOptionsFromArray:v6];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)_languageCodesFromLanguageIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F1CA20]);
        double v12 = objc_msgSend(v11, "initWithLocaleIdentifier:", v10, (void)v15);
        uint64_t v13 = [v12 languageCode];

        if (v13 && ([v4 containsObject:v13] & 1) == 0) {
          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_preferredLanguageCodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(AVPlayerController *)self player];
  id v5 = [v4 legibleFallbackMediaSelectionCriteria];
  uint64_t v6 = [v5 preferredLanguages];

  uint64_t v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if (v6) {
    [v3 addObjectsFromArray:v6];
  }
  if (v7) {
    [v3 addObjectsFromArray:v7];
  }
  uint64_t v8 = [(AVPlayerController *)self _languageCodesFromLanguageIdentifiers:v3];

  return v8;
}

- (BOOL)_willAutomaticallySelectLegibleFallbackForLanguageMismatch
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPlayerController *)self player];
  int v4 = [v3 allowsLegibleFallbackForAllAudibleMediaSelections];

  if (v4)
  {
    id v5 = [(AVPlayerController *)self currentAudioMediaSelectionOption];
    uint64_t v6 = [(AVPlayerController *)self legibleMediaSelectionOptions];
    uint64_t v7 = v6;
    if (v5 && [v6 count])
    {
      uint64_t v8 = [(AVPlayerController *)self _preferredLanguageCodes];
      __int16 v9 = [v5 locale];
      uint64_t v10 = [v9 languageCode];
      char v11 = [v8 containsObject:v10];

      if (v11)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v13 = v7;
        uint64_t v12 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12)
        {
          uint64_t v20 = v9;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v13);
              }
              long long v16 = [*(id *)(*((void *)&v21 + 1) + 8 * i) locale];
              long long v17 = [v16 languageCode];
              char v18 = [v8 containsObject:v17];

              if (v18)
              {
                LOBYTE(v12) = 1;
                goto LABEL_18;
              }
            }
            uint64_t v12 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
LABEL_18:
          __int16 v9 = v20;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (void)_setMostRecentChosenOption:(id)a3
{
  id v5 = a3;
  id v3 = [v5 extendedLanguageTag];
  if (([v5 hasMediaCharacteristic:*MEMORY[0x1E4F15B68]] & 1) != 0
    || objc_msgSend(v5, "avkit_preferredSortIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v4 = v3;
    id v3 = 0;
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_8;
  }
  if ([v5 hasMediaCharacteristic:*MEMORY[0x1E4F15B80]])
  {
    int v4 = +[AVKitGlobalSettings shared];
    [v4 setMostRecentLegibleLanguageCode:v3];
LABEL_7:

    goto LABEL_8;
  }
  if ([v5 hasMediaCharacteristic:*MEMORY[0x1E4F15B00]])
  {
    int v4 = +[AVKitGlobalSettings shared];
    [v4 setMostRecentAudioLanguageCode:v3];
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)_mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup
{
  id v3 = [(AVPlayerController *)self player];
  int v4 = [v3 currentItem];

  id v5 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v6 = objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B80]);

  if (v6)
  {
    uint64_t v7 = [v4 currentMediaSelection];
    char v8 = [v7 mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_selectedMediaOptionWithMediaCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerController *)self player];
  uint64_t v6 = [v5 currentItem];

  uint64_t v7 = [(AVPlayerController *)self currentAssetIfReady];
  char v8 = objc_msgSend(v7, "avkit_mediaSelectionGroupForMediaCharacteristic:", v4);

  if (v8)
  {
    __int16 v9 = [v6 currentMediaSelection];
    uint64_t v10 = [v9 selectedMediaOptionInMediaSelectionGroup:v8];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_setMediaOption:(id)a3 mediaCharacteristic:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315650;
    long long v23 = "-[AVPlayerController(AVMediaSelection) _setMediaOption:mediaCharacteristic:]";
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s mediaOption: %{public}@ mediaCharacteristic: %{public}@", (uint8_t *)&v22, 0x20u);
  }

  if (v6
    && [v7 isEqualToString:*MEMORY[0x1E4F15B80]]
    && ([v6 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]] & 1) == 0)
  {
    uint64_t v9 = [v6 extendedLanguageTag];
    uint64_t v10 = (void *)v9;
    if (v9) {
      char v11 = (__CFString *)v9;
    }
    else {
      char v11 = @"und";
    }
    objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, v11);

    MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, (CFStringRef)self->_lastKnownPersistedExtendedLanguageTag);
    [(AVPlayerController *)self _ensureUserCaptionDisplayType:2];
  }
  uint64_t v12 = [(AVPlayerController *)self player];
  id v13 = [v12 currentItem];

  uint64_t v14 = [(AVPlayerController *)self currentAssetIfReady];
  long long v15 = objc_msgSend(v14, "avkit_mediaSelectionGroupForMediaCharacteristic:", v7);

  if (v15)
  {
    long long v16 = [v13 currentMediaSelection];
    long long v17 = [v16 selectedMediaOptionInMediaSelectionGroup:v15];
    char v18 = [v6 propertyList];
    uint64_t v19 = [v17 propertyList];
    char v20 = [v18 isEqual:v19];

    if (v20)
    {
      long long v21 = _AVLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        long long v23 = "-[AVPlayerController(AVMediaSelection) _setMediaOption:mediaCharacteristic:]";
        _os_log_impl(&dword_1B05B7000, v21, OS_LOG_TYPE_DEFAULT, "%s Skipped setting identical option.", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      [v13 selectMediaOption:v6 inMediaSelectionGroup:v15];
    }
  }
}

- (void)setMediaOptionCriteriaAlwaysOn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_subtitleAutomaticallyEnabledState");
  id v6 = [(AVPlayerController *)self currentAssetIfReady];

  if (v6)
  {
    id v7 = [(AVPlayerController *)self player];
    int v8 = [v7 appliesMediaSelectionCriteriaAutomatically];

    int v9 = v3 & v8;
    int64_t v10 = [(AVPlayerController *)self captionAppearanceDisplayType];
    BOOL v11 = [(AVPlayerController *)self isDisplayingNonForcedOnlyLegibleOption];
    BOOL v12 = [(AVPlayerController *)self _willAutomaticallySelectLegibleFallbackForLanguageMismatch];
    id v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = "NO";
      *(_DWORD *)v35 = 136317186;
      *(void *)&v35[4] = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
      if (v9) {
        long long v15 = "YES";
      }
      else {
        long long v15 = "NO";
      }
      *(_WORD *)&v35[12] = 2082;
      *(void *)&v35[14] = v15;
      if (v8) {
        long long v16 = "YES";
      }
      else {
        long long v16 = "NO";
      }
      *(_WORD *)&v35[22] = 2082;
      v36 = (void *)v16;
      if (v10 == 1) {
        long long v17 = "YES";
      }
      else {
        long long v17 = "NO";
      }
      *(_WORD *)v37 = 2048;
      if (v10) {
        char v18 = "NO";
      }
      else {
        char v18 = "YES";
      }
      *(void *)&v37[2] = v5;
      if (v12) {
        uint64_t v19 = "YES";
      }
      else {
        uint64_t v19 = "NO";
      }
      *(_WORD *)&v37[10] = 2082;
      if (v10 == 2) {
        char v20 = "YES";
      }
      else {
        char v20 = "NO";
      }
      *(void *)&v37[12] = v17;
      if (v11) {
        uint64_t v14 = "YES";
      }
      *(_WORD *)&v37[20] = 2082;
      *(void *)&v37[22] = v18;
      __int16 v38 = 2082;
      v39 = v19;
      __int16 v40 = 2082;
      v41 = v20;
      __int16 v42 = 2082;
      v43 = v14;
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s \nmediaOption:\nenableSubtitles: %{public}s\nplayerAppliesMediaSelectionCriteriaAutomatically: %{public}s\nautoSubtitlesActive: %lu\nisDisplayTypeAutomatic: %{public}s\nisDisplayTypeForcedOnly: %{public}s \nLanguageMismatch: %{public}s\nalwaysOn: %{public}s\nisDisplayingNonForcedOnlyLegibleOption: %{public}s", v35, 0x5Cu);
    }

    if (((v9 ^ 1 | v11) & 1) == 0)
    {
      if (!v12)
      {
        __int16 v26 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
        id v27 = [v26 localeIdentifier];
        uint64_t v28 = +[AVPlayerController canonicalLanguageIdentifierFromString:v27];

        CFArrayRef v29 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
        v30 = _AVLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v35 = 136315650;
          *(void *)&v35[4] = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
          *(_WORD *)&v35[12] = 2114;
          *(void *)&v35[14] = v28;
          *(_WORD *)&v35[22] = 2112;
          v36 = v29;
          _os_log_impl(&dword_1B05B7000, v30, OS_LOG_TYPE_DEFAULT, "%s mediaOption: enableSubtitles: Setting preferred caption language to %{public}@, %@", v35, 0x20u);
        }

        CFRelease(v29);
        MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v28);
        [(AVPlayerController *)self _performAutomaticMediaSelectionForUserCaptionDisplayType:2];
      }
      uint64_t v31 = 2;
      if (v10) {
        uint64_t v31 = v5;
      }
      if (v10 == 1) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = v31;
      }
      goto LABEL_55;
    }
    if (v3 || v5 != 1)
    {
      int v33 = v5 != 2 || v3;
      if (v33) {
        uint64_t v32 = v5;
      }
      else {
        uint64_t v32 = 0;
      }
      if ((v33 | v12)) {
        goto LABEL_55;
      }
      [(AVPlayerController *)self _ensureUserCaptionDisplayType:0];
    }
    else if (v10 != 1 || !v12)
    {
      [(AVPlayerController *)self _enableAutoMediaSelection:self];
    }
    uint64_t v32 = 0;
LABEL_55:
    if (v32 == v5) {
      return;
    }
    v34 = _AVLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 136315394;
      *(void *)&v35[4] = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = v32;
      _os_log_impl(&dword_1B05B7000, v34, OS_LOG_TYPE_DEFAULT, "%s mediaOption: set subtitle state: %d", v35, 0x12u);
    }

    long long v23 = +[AVKitGlobalSettings shared];
    __int16 v24 = v23;
    uint64_t v25 = v32;
    goto LABEL_59;
  }
  if (!v3 && v5)
  {
    int v22 = _AVLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 136315138;
      *(void *)&v35[4] = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
      _os_log_impl(&dword_1B05B7000, v22, OS_LOG_TYPE_DEFAULT, "%s mediaOption: init subtitle state, current asset not ready", v35, 0xCu);
    }

    [(AVPlayerController *)self _enableAutoMediaSelection:self];
    long long v23 = +[AVKitGlobalSettings shared];
    __int16 v24 = v23;
    uint64_t v25 = 0;
LABEL_59:
    objc_msgSend(v23, "setSubtitleAutomaticallyEnabledState:", v25, *(_OWORD *)v35, *(void *)&v35[16], v36, *(_OWORD *)v37, *(void *)&v37[16]);
  }
}

- (void)setCurrentAssetMediaOption:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVPlayerController *)self player];
  id v8 = [v5 currentItem];

  id v6 = [(AVPlayerController *)self currentAssetIfReady];
  id v7 = objc_msgSend(v6, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B80]);

  [v8 selectMediaOption:v4 inMediaSelectionGroup:v7];
}

- (BOOL)subtitlesActive
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self player];
  int v4 = [v3 appliesMediaSelectionCriteriaAutomatically];

  int64_t v5 = [(AVPlayerController *)self captionAppearanceDisplayType];
  int64_t v6 = [(AVPlayerController *)self captionAppearanceDisplayType];
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "NO";
    if (v4) {
      int v9 = "YES";
    }
    else {
      int v9 = "NO";
    }
    int v13 = 136315906;
    uint64_t v14 = "-[AVPlayerController(AVMediaSelection) subtitlesActive]";
    if (v5 == 1) {
      int64_t v10 = "YES";
    }
    else {
      int64_t v10 = "NO";
    }
    long long v16 = v9;
    __int16 v15 = 2082;
    __int16 v17 = 2082;
    char v18 = v10;
    if (!v6) {
      id v8 = "YES";
    }
    __int16 v19 = 2082;
    char v20 = v8;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s mediaOption: playerAppliesMediaSelectionCriteriaAutomatically:%{public}s isDisplayTypeAutomatic:%{public}s isDisplayTypeForcedOnly:%{public}s", (uint8_t *)&v13, 0x2Au);
  }

  return v5 != 1 && v6 != 0;
}

- (BOOL)setLegibleMediaOptionVisibility:(BOOL)a3 prefersLastKnownCaptionType:(BOOL)a4 prefersSystemLanguage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v7 = a3;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  int v9 = [(AVPlayerController *)self player];
  int v10 = [v9 appliesMediaSelectionCriteriaAutomatically];

  if (!v10)
  {
    uint64_t v25 = *MEMORY[0x1E4F15B80];
    __int16 v26 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B80]];
    id v27 = v26;
    if (v26)
    {
      uint64_t v28 = *MEMORY[0x1E4F15B20];
      if ([v26 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]] == v7)
      {
        CFArrayRef v29 = (void *)MEMORY[0x1E4F16538];
        if ((v7 & 1) == 0)
        {
          v30 = [(AVPlayerController *)self _playableLegibleMediaSelectionOptions];
          uint64_t v70 = v28;
          uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
          uint64_t v32 = [v29 mediaSelectionOptionsFromArray:v30 withMediaCharacteristics:v31];
          goto LABEL_45;
        }
LABEL_44:
        v30 = [(AVPlayerController *)self legibleMediaSelectionOptions];
        uint64_t v71 = v28;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        uint64_t v32 = [v29 mediaSelectionOptionsFromArray:v30 withoutMediaCharacteristics:v31];
LABEL_45:
        v36 = (void *)v32;

        v37 = self->_lastKnownPersistedExtendedLanguageTag;
        if (!v37)
        {
          v53 = [v27 locale];
          id v38 = [v53 languageCode];

          if (!v38
            || ([(AVPlayerController *)self _preferredLanguageCodes],
                v54 = objc_claimAutoreleasedReturnValue(),
                int v55 = [v54 containsObject:v38],
                v54,
                !v55))
          {
            v37 = 0;
LABEL_70:

            goto LABEL_71;
          }
          v37 = [v27 extendedLanguageTag];

          if (!v37)
          {
LABEL_71:
            v56 = (void *)MEMORY[0x1E4F16538];
            v57 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
            v58 = [v56 mediaSelectionOptionsFromArray:v36 withLocale:v57];
            id v52 = [v58 firstObject];

            if (v52 || (v7 & 1) == 0)
            {
LABEL_74:
              v59 = _AVLog();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType"
                      ":prefersSystemLanguage:]";
                __int16 v74 = 2114;
                id v75 = v52;
                _os_log_impl(&dword_1B05B7000, v59, OS_LOG_TYPE_DEFAULT, "%s Setting legible selection option: %{public}@", buf, 0x16u);
              }

              [(AVPlayerController *)self _setMediaOption:v52 mediaCharacteristic:v25];
              if ((v7 & 1) == 0) {
                [(AVPlayerController *)self _disableLegibleMediaSelectionOptions:0];
              }
              BOOL v24 = 1;
            }
            else
            {
              id v52 = 0;
              BOOL v24 = 0;
            }

            goto LABEL_80;
          }
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v38 = v36;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          v62 = v36;
          uint64_t v63 = v25;
          v64 = v27;
          uint64_t v41 = *(void *)v66;
LABEL_48:
          uint64_t v42 = 0;
          while (1)
          {
            if (*(void *)v66 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v65 + 1) + 8 * v42);
            uint64_t v44 = [v43 extendedLanguageTag];
            char v45 = [v44 isEqualToString:v37];

            if (v45) {
              break;
            }
            if (v40 == ++v42)
            {
              uint64_t v40 = [v38 countByEnumeratingWithState:&v65 objects:v69 count:16];
              if (v40) {
                goto LABEL_48;
              }
              uint64_t v25 = v63;
              id v27 = v64;
              v36 = v62;
              goto LABEL_70;
            }
          }
          id v52 = v43;

          uint64_t v25 = v63;
          id v27 = v64;
          v36 = v62;
          if (v52) {
            goto LABEL_74;
          }
          goto LABEL_71;
        }
        goto LABEL_70;
      }
    }
    else if (v7)
    {
      CFArrayRef v29 = (void *)MEMORY[0x1E4F16538];
      uint64_t v28 = *MEMORY[0x1E4F15B20];
      goto LABEL_44;
    }
    BOOL v24 = 0;
LABEL_80:

    return v24;
  }
  int64_t v11 = [(AVPlayerController *)self captionAppearanceDisplayType];
  uint64_t v12 = LastKnownCaptionAppearanceDisplayType;
  BOOL v13 = [(AVPlayerController *)self isDisplayingNonForcedOnlyLegibleOption];
  BOOL v14 = [(AVPlayerController *)self _willAutomaticallySelectLegibleFallbackForLanguageMismatch];
  __int16 v15 = _AVLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = "NO";
    *(_DWORD *)buf = 136316930;
    v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefersSystemLanguage:]";
    if (v7) {
      __int16 v17 = "YES";
    }
    else {
      __int16 v17 = "NO";
    }
    __int16 v74 = 2082;
    id v75 = (id)v17;
    if (v11) {
      char v18 = "NO";
    }
    else {
      char v18 = "YES";
    }
    __int16 v76 = 2082;
    v77 = "YES";
    if (v11 == 1) {
      __int16 v19 = "YES";
    }
    else {
      __int16 v19 = "NO";
    }
    __int16 v78 = 2082;
    if (v11 == 2) {
      char v20 = "YES";
    }
    else {
      char v20 = "NO";
    }
    v79 = v18;
    if (v13) {
      uint64_t v21 = "YES";
    }
    else {
      uint64_t v21 = "NO";
    }
    __int16 v80 = 2082;
    if (v14) {
      long long v16 = "YES";
    }
    v81 = v19;
    __int16 v82 = 2082;
    v83 = v20;
    __int16 v84 = 2082;
    v85 = v21;
    __int16 v86 = 2082;
    v87 = v16;
    _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s Calculating caption appearance type to set, given: visible: %{public}s, playerAppliesMediaSelectionCriteriaAutomatically:%{public}s captionAppearanceDisplayType forcedOnly: %{public}s, automatic: %{public}s, alwaysOn: %{public}s, isDisplayingNonForcedOnlyLegibleOption: %{public}s, willAutomaticallySelectLegibleFallbackForLanguageMismatch: %{public}s", buf, 0x52u);
  }

  if (((v7 ^ 1 | v13) & 1) == 0 && v11 != 2)
  {
    BOOL v22 = v12 == 1 && v14;
    if (v22 && v11 != 1 && !v5)
    {
      long long v23 = _AVLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1B05B7000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to automatic", buf, 0xCu);
      }
LABEL_31:

      BOOL v24 = 1;
      [(AVPlayerController *)self _performAutomaticMediaSelectionForUserCaptionDisplayType:1];
      return v24;
    }
    LastKnownCaptionAppearanceDisplayType = v11;
    if (v5)
    {
      v46 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
      v47 = [v46 localeIdentifier];
      v48 = +[AVPlayerController canonicalLanguageIdentifierFromString:v47];

      CFArrayRef v49 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
      v50 = _AVLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        __int16 v74 = 2114;
        id v75 = v48;
        __int16 v76 = 2112;
        v77 = (const char *)v49;
        _os_log_impl(&dword_1B05B7000, v50, OS_LOG_TYPE_DEFAULT, "%s Setting preferred caption language to %{public}@, %@", buf, 0x20u);
      }

      CFRelease(v49);
      MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v48);
    }
    v51 = _AVLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefersSystemLanguage:]";
      _os_log_impl(&dword_1B05B7000, v51, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to always on", buf, 0xCu);
    }

    v34 = self;
    uint64_t v35 = 2;
    goto LABEL_90;
  }
  BOOL v24 = 0;
  if ((v7 & 1) == 0 && v11)
  {
    if (v6)
    {
      int v33 = _AVLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1B05B7000, v33, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type back to last known type", buf, 0xCu);
      }

      v34 = self;
      uint64_t v35 = v12;
    }
    else
    {
      if (v12 == 1 && !v14 && v11 != 1)
      {
        long long v23 = _AVLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefe"
                "rsSystemLanguage:]";
          _os_log_impl(&dword_1B05B7000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to automatic", buf, 0xCu);
        }
        goto LABEL_31;
      }
      LastKnownCaptionAppearanceDisplayType = v11;
      v60 = _AVLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1B05B7000, v60, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to forced only", buf, 0xCu);
      }

      v34 = self;
      uint64_t v35 = 0;
    }
LABEL_90:
    [(AVPlayerController *)v34 _performAutomaticMediaSelectionForUserCaptionDisplayType:v35];
    return 1;
  }
  return v24;
}

- (void)_enableAutoMediaSelection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[AVPlayerController(AVMediaSelection) _enableAutoMediaSelection:]";
    __int16 v9 = 1024;
    int v10 = 969;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  BOOL v5 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  if (([v5 containsObject:*MEMORY[0x1E4F15B90]] & 1) != 0
    || ([v5 containsObject:*MEMORY[0x1E4F15B30]] & 1) != 0)
  {
    uint64_t v6 = 2;
  }
  else if ([v5 containsObject:*MEMORY[0x1E4F15B38]])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }
  [(AVPlayerController *)self _performAutomaticMediaSelectionForUserCaptionDisplayType:v6];
}

- (void)_disableLegibleMediaSelectionOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[AVPlayerController(AVMediaSelection) _disableLegibleMediaSelectionOptions:]";
    __int16 v7 = 1024;
    int v8 = 962;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  [(AVPlayerController *)self _performAutomaticMediaSelectionForUserCaptionDisplayType:0];
}

- (void)_performAutomaticMediaSelectionForUserCaptionDisplayType:(int64_t)a3
{
  [(AVPlayerController *)self _ensureUserCaptionDisplayType:a3];
  int v4 = [(AVPlayerController *)self player];
  id v7 = [v4 currentItem];

  int v5 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v6 = objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B80]);

  [v7 selectMediaOptionAutomaticallyInMediaSelectionGroup:v6];
}

- (void)_ensureUserCaptionDisplayType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self captionAppearanceDisplayType] != a3)
  {
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      id v7 = "-[AVPlayerController(AVMediaSelection) _ensureUserCaptionDisplayType:]";
      __int16 v8 = 2048;
      int64_t v9 = [(AVPlayerController *)self captionAppearanceDisplayType];
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Changing MACaptionAppearanceDisplayType: %ld -> %ld", (uint8_t *)&v6, 0x20u);
    }

    MACaptionAppearanceSetDisplayType(kMACaptionAppearanceDomainUser, (MACaptionAppearanceDisplayType)a3);
  }
}

- (BOOL)isDisplayingNonForcedOnlyLegibleOption
{
  v2 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B80]];
  BOOL v3 = v2;
  if (v2) {
    int v4 = [v2 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)legibleOptions
{
  v71[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self currentAssetIfReady];
  v58 = objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B80]);

  if (!v58)
  {
    __int16 v26 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_42;
  }
  int v4 = [(AVPlayerController *)self player];
  int v5 = [v4 currentItem];
  int v6 = [v5 currentMediaSelection];
  id v7 = [v6 selectedMediaOptionInMediaSelectionGroup:v58];

  __int16 v8 = (void *)MEMORY[0x1E4F16538];
  int64_t v9 = [(AVPlayerController *)self _optionsForGroup:v58];
  v57 = [v8 playableMediaSelectionOptionsFromArray:v9];

  __int16 v10 = (void *)MEMORY[0x1E4F16538];
  v71[0] = *MEMORY[0x1E4F15B20];
  uint64_t v11 = v71[0];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
  v54 = [v10 mediaSelectionOptionsFromArray:v57 withoutMediaCharacteristics:v12];

  BOOL v13 = (void *)MEMORY[0x1E4F16538];
  uint64_t v14 = *MEMORY[0x1E4F15B58];
  v70[0] = v11;
  v70[1] = v14;
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  v53 = [v13 mediaSelectionOptionsFromArray:v57 withMediaCharacteristics:v15];

  int v55 = [v54 arrayByAddingObjectsFromArray:v53];
  objc_msgSend(MEMORY[0x1E4F16540], "avkit_recentLegibleLanguageCode");
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  recentLegibleLanguageForLastSort = self->_recentLegibleLanguageForLastSort;
  if (v56 != recentLegibleLanguageForLastSort
    && (!v56 || !recentLegibleLanguageForLastSort || !-[NSString isEqualToString:](v56, "isEqualToString:")))
  {
LABEL_17:
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy_;
    v66[4] = __Block_byref_object_dispose_;
    id v67 = 0;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke;
    v65[3] = &unk_1E5FC2108;
    v65[4] = v66;
    v36 = (void *)MEMORY[0x1B3E963E0](v65);
    _UpdatePreferredMediaSelectionOptions(v55);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke_2;
    v63[3] = &unk_1E5FC2150;
    id v52 = v36;
    id v64 = v52;
    v37 = [v55 sortedArrayUsingComparator:v63];
    id v38 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v41 = v37;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (!v42)
    {
LABEL_37:

      if ([v38 count])
      {
        v48 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
        v68[0] = v48;
        CFArrayRef v49 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
        v68[1] = v49;
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
        __int16 v26 = [v50 arrayByAddingObjectsFromArray:v38];
      }
      else
      {
        __int16 v26 = 0;
      }

      _Block_object_dispose(v66, 8);
      goto LABEL_41;
    }
    uint64_t v43 = *(void *)v60;
LABEL_19:
    uint64_t v44 = 0;
    while (1)
    {
      if (*(void *)v60 != v43) {
        objc_enumerationMutation(v41);
      }
      char v45 = *(void **)(*((void *)&v59 + 1) + 8 * v44);
      v46 = [v45 extendedLanguageTag];
      if (!v46 || ![v45 isMain]) {
        goto LABEL_29;
      }
      if ([v39 containsObject:v46]) {
        break;
      }
      [v38 addObject:v45];
      [v39 addObject:v46];
      if ([v45 isCC]) {
        goto LABEL_35;
      }
LABEL_30:

      if (v42 == ++v44)
      {
        uint64_t v47 = [v41 countByEnumeratingWithState:&v59 objects:v69 count:16];
        uint64_t v42 = v47;
        if (!v47) {
          goto LABEL_37;
        }
        goto LABEL_19;
      }
    }
    if ([v45 isCC] && (objc_msgSend(v40, "containsObject:", v46) & 1) == 0)
    {
      [v38 addObject:v45];
LABEL_35:
      [v40 addObject:v46];
      goto LABEL_30;
    }
    if (([v38 containsObject:v45] & 1) != 0 || !objc_msgSend(v45, "isEqual:", v7)) {
      goto LABEL_30;
    }
LABEL_29:
    [v38 addObject:v45];
    goto LABEL_30;
  }
  __int16 v17 = (void *)MEMORY[0x1E4F1CA80];
  char v18 = [v55 valueForKey:@"avkit_persistentIdentifier"];
  __int16 v19 = [v17 setWithArray:v18];

  char v20 = [(AVPlayerController *)self currentLegibleMediaSelectionOption];
  if (v20)
  {
    uint64_t v21 = [(AVPlayerController *)self currentLegibleMediaSelectionOption];
    BOOL v22 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
    if (v21 == v22)
    {

      goto LABEL_12;
    }
    long long v23 = [(AVPlayerController *)self currentLegibleMediaSelectionOption];
    BOOL v24 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
    BOOL v25 = v23 == v24;

    if (!v25)
    {
      char v20 = [(AVPlayerController *)self currentLegibleMediaSelectionOption];
      uint64_t v21 = objc_msgSend(v20, "avkit_persistentIdentifier");
      [v19 addObject:v21];
LABEL_12:
    }
  }
  id v27 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v28 = [(AVPlayerController *)self legibleMediaSelectionOptions];
  CFArrayRef v29 = [v28 valueForKey:@"avkit_persistentIdentifier"];
  v30 = [v27 setWithArray:v29];

  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
  uint64_t v32 = objc_msgSend(v31, "avkit_persistentIdentifier");
  [v30 removeObject:v32];

  int v33 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
  v34 = objc_msgSend(v33, "avkit_persistentIdentifier");
  [v30 removeObject:v34];

  uint64_t v35 = [v55 count];
  if (v35 != [v19 count] || (objc_msgSend(v30, "isEqualToSet:", v19) & 1) == 0)
  {

    goto LABEL_17;
  }
  __int16 v26 = [(AVPlayerController *)self legibleMediaSelectionOptions];

LABEL_41:
LABEL_42:

  return v26;
}

uint64_t __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = MACaptionAppearancePrefCopyPreferAccessibleCaptions();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }

  return [v2 BOOLValue];
}

uint64_t __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  if ([v7 isCC]
    && ([v7 extendedLanguageTag], int64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    if (![v8 isCC]) {
      goto LABEL_29;
    }
    uint64_t v12 = [v8 extendedLanguageTag];
    uint64_t v10 = v12 != 0;
  }
  else
  {
    uint64_t v10 = [v7 languageCompare:v8];
    if (!v10)
    {
      if ([v7 isAuxiliary])
      {
        int v11 = [v8 isAuxiliary];
LABEL_11:
        uint64_t v10 = v11 ^ 1u;
        goto LABEL_34;
      }
      if ([v7 isEasyReader])
      {
        if (([v8 isAuxiliary] & 1) == 0)
        {
          int v11 = [v8 isEasyReader];
          goto LABEL_11;
        }
LABEL_33:
        uint64_t v10 = -1;
        goto LABEL_34;
      }
      int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      int v14 = [v7 isSDH];
      if (v13)
      {
        if (v14)
        {
          unsigned int v15 = [v8 isSDH];
LABEL_23:
          uint64_t v10 = v15 - 1;
          goto LABEL_34;
        }
        int v16 = [v7 isCC];
        char v17 = [v8 isSDH];
        if (v16)
        {
          if ((v17 & 1) == 0)
          {
            unsigned int v15 = [v8 isCC];
            goto LABEL_23;
          }
LABEL_29:
          uint64_t v10 = 1;
          goto LABEL_34;
        }
        if (v17 & 1) != 0 || ([v8 isCC]) {
          goto LABEL_29;
        }
LABEL_32:
        if (([v8 isEasyReader] & 1) == 0)
        {
          uint64_t v10 = [v8 isAuxiliary] << 63 >> 63;
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      if (v14)
      {
        if (([v8 isCC] & 1) == 0
          && ([v8 isEasyReader] & 1) == 0
          && ([v8 isAuxiliary] & 1) == 0)
        {
          int v11 = [v8 isSDH];
          goto LABEL_11;
        }
        goto LABEL_33;
      }
      if (![v7 isCC])
      {
        if ([v8 isSDH] & 1) != 0 || (objc_msgSend(v8, "isCC")) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      if ([v8 isCC])
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = -1;
        if (([v8 isEasyReader] & 1) == 0 && !objc_msgSend(v8, "isAuxiliary")) {
          uint64_t v10 = 1;
        }
      }
    }
  }
LABEL_34:

  return v10;
}

- (id)audioOptions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v4 = objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B00]);

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F16538];
    id v6 = [(AVPlayerController *)self _optionsForGroup:v4];
    id v7 = [v5 playableMediaSelectionOptionsFromArray:v6];

    _UpdatePreferredMediaSelectionOptions(v7);
    id v8 = +[AVPlayerController _sortedAudibleOption:v7];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy_;
    v23[4] = __Block_byref_object_dispose_;
    id v24 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52__AVPlayerController_AVMediaSelection__audioOptions__block_invoke;
    v22[3] = &unk_1E5FC2108;
    v22[4] = v23;
    int64_t v9 = (unsigned int (**)(void))MEMORY[0x1B3E963E0](v22);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          unsigned int v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (!objc_msgSend(v15, "isAC3Only", (void)v18) || v9[2](v9)) {
            [v10 addObject:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v12);
    }

    int v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];

    _Block_object_dispose(v23, 8);
  }
  else
  {
    int v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

uint64_t __52__AVPlayerController_AVMediaSelection__audioOptions__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = NSNumber;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F153E0], "sharedInstance", 0);
    id v5 = [v4 audioFormats];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue] == 1667326771)
          {
            uint64_t v6 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    uint64_t v9 = [v3 numberWithBool:v6];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return [v2 BOOLValue];
}

- (id)visualOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v4 = objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E4F15B98]);

  if (v4)
  {
    id v5 = [v4 options];
    uint64_t v6 = (void *)MEMORY[0x1E4F16538];
    uint64_t v7 = [(AVPlayerController *)self _optionsForGroup:v4];
    id v8 = [v6 playableMediaSelectionOptionsFromArray:v7];

    if (v5 != v8 && ([v5 isEqualToArray:v8] & 1) == 0)
    {
      uint64_t v9 = _AVLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        long long v15 = "-[AVPlayerController(AVMediaSelection) visualOptions]";
        __int16 v16 = 2114;
        char v17 = v5;
        __int16 v18 = 2114;
        long long v19 = v8;
        _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s group.options != playable options from filtered options for group; unfiltered options: %{public}@; filterd "
          "options: %{public}@",
          (uint8_t *)&v14,
          0x20u);
      }
    }
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    if (v5) {
      uint64_t v10 = v5;
    }
    id v11 = v10;

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v12 = [(AVPlayerController *)self currentAssetIfReady];

  if (v12)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      long long v15 = "-[AVPlayerController(AVMediaSelection) visualOptions]";
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s currentAsset is ready but reports no media selection group for AVMediaCharacteristicVisual", (uint8_t *)&v14, 0xCu);
    }
    id v11 = MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  id v11 = MEMORY[0x1E4F1CBF0];
LABEL_15:

  return v11;
}

- (void)reloadVisualOptions
{
  id v3 = [(AVPlayerController *)self visualOptions];
  [(AVPlayerController *)self setVisualMediaSelectionOptions:v3];
}

- (void)reloadLegibleOptions
{
  kdebug_trace();
  id v6 = [(AVPlayerController *)self legibleOptions];
  kdebug_trace();
  if (v6) {
    id v3 = v6;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(AVPlayerController *)self setLegibleMediaSelectionOptions:v3 audioMediaSelectionOptions:0 assumeMediaOptionMayHaveChanged:0];
  objc_msgSend(MEMORY[0x1E4F16540], "avkit_recentLegibleLanguageCode");
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  recentLegibleLanguageForLastSort = self->_recentLegibleLanguageForLastSort;
  self->_recentLegibleLanguageForLastSort = v4;
}

- (void)reloadAudioOptions
{
  kdebug_trace();
  id v4 = [(AVPlayerController *)self audioOptions];
  kdebug_trace();
  if (v4) {
    id v3 = v4;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(AVPlayerController *)self setLegibleMediaSelectionOptions:0 audioMediaSelectionOptions:v3 assumeMediaOptionMayHaveChanged:0];
}

- (void)reloadOptionsAssumingMediaOptionsMayHaveChanged:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  uint64_t v5 = [(AVPlayerController *)self audioOptions];
  id v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    id v8 = (void *)v5;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v8;

  kdebug_trace();
  kdebug_trace();
  uint64_t v9 = [(AVPlayerController *)self legibleOptions];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = (void *)v9;
  }
  else {
    id v11 = v7;
  }
  id v12 = v11;

  kdebug_trace();
  kdebug_trace();
  [(AVPlayerController *)self setLegibleMediaSelectionOptions:v12 audioMediaSelectionOptions:v17 assumeMediaOptionMayHaveChanged:v3];
  kdebug_trace();
  if ([(AVPlayerController *)self shouldLoadVisualMediaSelectionOptions])
  {
    uint64_t v13 = [(AVPlayerController *)self visualOptions];
    int v14 = (void *)v13;
    if (v13) {
      long long v15 = (void *)v13;
    }
    else {
      long long v15 = v7;
    }
    id v16 = v15;

    [(AVPlayerController *)self setVisualMediaSelectionOptions:v16];
  }
}

- (void)reloadOptionsAndCurrentSelections
{
}

- (void)reloadOptions
{
}

- (void)selectedMediaOptionMayHaveChanged:(BOOL)a3
{
  BOOL v40 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_cachedSelectedLegibleMediaSelectionOption = &self->_cachedSelectedLegibleMediaSelectionOption;
  uint64_t v5 = self->_cachedSelectedLegibleMediaSelectionOption;
  id v6 = self->_cachedSelectedAudioMediaSelectionOption;
  uint64_t v7 = self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation;
  id v8 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B80]];
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation, v8);
  int v9 = [v8 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]];
  int64_t v10 = [(AVPlayerController *)self externalPlaybackType];
  id v41 = v7;
  int v11 = [(AVMediaSelectionOption *)v7 isEqual:v8];
  if (v10 == 1
    && ((![(AVPlayerController *)self handlesAudioSessionInterruptions] | v11) & 1) == 0
    && ![(AVPlayerController *)self _mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup])
  {
    int64_t v12 = [(AVPlayerController *)self captionAppearanceDisplayType];
    if (v9)
    {
      if ([(AVPlayerController *)self captionAppearanceDisplayType] != 2)
      {
LABEL_24:
        [(AVPlayerController *)self _ensureUserCaptionDisplayType:v12];
        goto LABEL_25;
      }
      uint64_t v13 = MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
      if (([v13 containsObject:*MEMORY[0x1E4F15B90]] & 1) == 0
        && ([v13 containsObject:*MEMORY[0x1E4F15B30]] & 1) == 0
        && ([v13 containsObject:*MEMORY[0x1E4F15B38]] & 1) == 0)
      {
        int v14 = _AVLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
          _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s Enabling automatic display type because receiver changed captions to forced-only.", buf, 0xCu);
        }

        int64_t v12 = 1;
      }
    }
    else
    {
      if (!v8) {
        goto LABEL_24;
      }
      lastKnownPersistedExtendedLanguageTag = self->_lastKnownPersistedExtendedLanguageTag;
      id v16 = [v8 extendedLanguageTag];
      LOBYTE(lastKnownPersistedExtendedLanguageTag) = [(NSString *)lastKnownPersistedExtendedLanguageTag isEqualToString:v16];

      if (lastKnownPersistedExtendedLanguageTag) {
        goto LABEL_24;
      }
      id v17 = _AVLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = self->_lastKnownPersistedExtendedLanguageTag;
        long long v19 = [v8 extendedLanguageTag];
        *(_DWORD *)buf = 136315650;
        uint64_t v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
        __int16 v44 = 2114;
        p_isa = v18;
        __int16 v46 = 2114;
        uint64_t v47 = v19;
        _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "%s Persisting preferences for remote legible option change: %{public}@ -> %{public}@", buf, 0x20u);
      }
      uint64_t v20 = [v8 extendedLanguageTag];
      long long v21 = (void *)v20;
      if (v20) {
        BOOL v22 = (__CFString *)v20;
      }
      else {
        BOOL v22 = @"und";
      }
      objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, v22);

      uint64_t v23 = [v8 extendedLanguageTag];
      uint64_t v13 = (void *)v23;
      if (v23) {
        CFStringRef v24 = (const __CFString *)v23;
      }
      else {
        CFStringRef v24 = @"und";
      }
      MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v24);
      int64_t v12 = 2;
    }

    goto LABEL_24;
  }
LABEL_25:
  BOOL v25 = v6;
  uint64_t v26 = [(AVPlayerController *)self currentLegibleMediaSelectionOption];
  id v27 = [(AVPlayerController *)self currentAudioMediaSelectionOption];
  uint64_t v28 = [(AVMediaSelectionOption *)v26 propertyList];
  [(AVMediaSelectionOption *)v5 propertyList];
  v30 = CFArrayRef v29 = v5;
  char v31 = [v28 isEqual:v30];

  if ((v31 & 1) == 0 && v26 != v29)
  {
    uint64_t v32 = _AVLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
      __int16 v44 = 2114;
      p_isa = (NSString *)&v26->super.isa;
      _os_log_impl(&dword_1B05B7000, v32, OS_LOG_TYPE_DEFAULT, "%s Selected legible option: %{public}@ ", buf, 0x16u);
    }

    objc_storeStrong((id *)p_cachedSelectedLegibleMediaSelectionOption, v26);
    BOOL v40 = 1;
  }
  int v33 = v29;
  v34 = [(AVMediaSelectionOption *)v27 propertyList];
  uint64_t v35 = [(AVMediaSelectionOption *)v25 propertyList];
  char v36 = [v34 isEqual:v35];

  if ((v36 & 1) == 0 && v27 != v25)
  {
    v37 = _AVLog();
    id v38 = v41;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
      __int16 v44 = 2114;
      p_isa = (NSString *)&v27->super.isa;
      _os_log_impl(&dword_1B05B7000, v37, OS_LOG_TYPE_DEFAULT, "%s Selected audible option: %{public}@ ", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_cachedSelectedAudioMediaSelectionOption, v27);
    goto LABEL_36;
  }
  id v38 = v41;
  if (v40)
  {
LABEL_36:
    uint64_t v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 postNotificationName:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:self];
  }
}

- (void)selectedMediaOptionMayHaveChanged
{
}

- (id)_optionsForGroup:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVPlayerController *)self currentAssetIfReady];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v6 = [v5 assetCache];
  if (([v6 isPlayableOffline] & 1) == 0)
  {

    goto LABEL_9;
  }
  *(void *)&address.sa_len = 528;
  *(void *)&address.sa_data[6] = 0;
  uint64_t v7 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &address);
  if (v7)
  {
    id v8 = v7;
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(v7, &flags))
    {
      char v9 = flags;
      if ((flags & 6) == 2)
      {
        CFRelease(v8);

        if ((v9 & 0x10) != 0) {
          goto LABEL_12;
        }
LABEL_9:
        id v10 = [v4 options];
        goto LABEL_28;
      }
    }
    CFRelease(v8);
  }

LABEL_12:
  int v11 = [v5 assetCache];
  uint64_t v12 = [v11 mediaSelectionOptionsInMediaSelectionGroup:v4];
  uint64_t v13 = (void *)v12;
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  if (v12) {
    long long v15 = (void *)v12;
  }
  else {
    long long v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v15;

  id v16 = (void *)MEMORY[0x1E4F1CA80];
  id v33 = v4;
  uint64_t v17 = [v4 options];
  __int16 v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v14;
  }
  uint64_t v20 = [v16 setWithArray:v19];

  long long v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v20 minusSet:v21];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    uint64_t v26 = *MEMORY[0x1E4F15BC8];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        CFArrayRef v29 = [v28 mediaType];
        int v30 = [v29 isEqualToString:v26];

        if (v30)
        {
          uint64_t v31 = [v10 arrayByAddingObject:v28];

          id v10 = (id)v31;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v24);
  }

  id v4 = v33;
LABEL_28:

  return v10;
}

- (id)mediaSelectionGroupForMediaCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVPlayerController *)self currentAssetIfReady];
  id v6 = objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", v4);

  return v6;
}

- (void)setCurrentLegibleMediaSelectionOption:(id)a3
{
  id v8 = a3;
  MACaptionAppearanceDisplayType DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
  if (DisplayType != kMACaptionAppearanceDisplayTypeAlwaysOn) {
    LastKnownCaptionAppearanceMACaptionAppearanceDisplayType DisplayType = DisplayType;
  }
  objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    [(AVPlayerController *)self _disableLegibleMediaSelectionOptions:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      [(AVPlayerController *)self _enableAutoMediaSelection:self];
    }
    else
    {
      [(AVPlayerController *)self _setMediaOption:v8 mediaCharacteristic:*MEMORY[0x1E4F15B80]];
      [(AVPlayerController *)self _setMostRecentChosenOption:v8];
      [(AVPlayerController *)self reloadLegibleOptions];
    }
  }
  uint64_t v7 = +[AVKitGlobalSettings shared];
  [v7 setSubtitleAutomaticallyEnabledState:0];
}

- (id)currentLegibleMediaSelectionOption
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B80]];
  id v4 = [(AVPlayerController *)self legibleMediaSelectionOptions];
  if (![v4 count])
  {

    goto LABEL_32;
  }
  char v5 = [v3 hasMediaCharacteristic:*MEMORY[0x1E4F15B58]];

  if (v5) {
    goto LABEL_32;
  }
  char v6 = [v3 hasMediaCharacteristic:*MEMORY[0x1E4F15B20]];
  int64_t v7 = [(AVPlayerController *)self captionAppearanceDisplayType];
  int64_t v8 = [(AVPlayerController *)self captionAppearanceDisplayType];
  int64_t v9 = [(AVPlayerController *)self captionAppearanceDisplayType];
  id v10 = [(AVPlayerController *)self player];
  int v11 = [v10 appliesMediaSelectionCriteriaAutomatically];

  BOOL v12 = [(AVPlayerController *)self _mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup];
  BOOL v13 = v12;
  if (v8 == 1 && v11) {
    goto LABEL_28;
  }
  if (v6)
  {
    if (v7) {
      char v14 = v12;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0)
    {
      long long v15 = _AVLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315906;
        id v22 = "-[AVPlayerController(AVMediaSelection) currentLegibleMediaSelectionOption]";
        __int16 v23 = 2114;
        uint64_t v24 = v3;
        __int16 v25 = 2048;
        int64_t v26 = [(AVPlayerController *)self captionAppearanceDisplayType];
        __int16 v27 = 1024;
        int v28 = 0;
        _os_log_error_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_ERROR, "*** %s Received a forced-only media selection (%{public}@) when display type was NOT forced-only (was %ld). mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup: %d. ***", (uint8_t *)&v21, 0x26u);
      }
    }
    if (!v13 || !v7) {
      goto LABEL_19;
    }
LABEL_28:
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
    goto LABEL_29;
  }
  if (!v3 && !v7)
  {
LABEL_19:
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
LABEL_29:
    uint64_t v19 = (void *)v16;

    BOOL v3 = v19;
    goto LABEL_30;
  }
  if (v9 != 2 && v12)
  {
    if (!v7)
    {
      __int16 v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        id v22 = "-[AVPlayerController(AVMediaSelection) currentLegibleMediaSelectionOption]";
        __int16 v23 = 2114;
        uint64_t v24 = v3;
        _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "*** %s Received a non-forced-only media selection (%{public}@) from automatic media selection when display type was forced-only. ***", (uint8_t *)&v21, 0x16u);
      }
    }
    goto LABEL_28;
  }
LABEL_30:
  if (!v3)
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
  }
LABEL_32:

  return v3;
}

- (void)setLegibleMediaSelectionOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v5 = (NSArray *)a3;
  legibleMediaSelectionOptions = self->_legibleMediaSelectionOptions;
  p_legibleMediaSelectionOptions = &self->_legibleMediaSelectionOptions;
  if (legibleMediaSelectionOptions != v5)
  {
    int64_t v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaSelectionOptions:]";
      __int16 v11 = 2114;
      BOOL v12 = v5;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s LegibleMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_legibleMediaSelectionOptions, a3);
  }
}

- (id)legibleMediaSelectionOptions
{
  return self->_legibleMediaSelectionOptions;
}

- (BOOL)hasLegibleMediaSelectionOptions
{
  v2 = [(AVPlayerController *)self legibleMediaSelectionOptions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (AVMediaSelectionOption)currentVideoMediaSelectionOption
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B98]];
  id v4 = [(AVPlayerController *)self visualMediaSelectionOptions];
  if ([v4 containsObject:v3]) {
    char v5 = v3;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  if (v6 != v3)
  {
    int64_t v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[AVPlayerController(AVMediaSelection) currentVideoMediaSelectionOption]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Have visual option %{}@ selected but it is not in our options list", (uint8_t *)&v9, 0x16u);
    }
  }

  return (AVMediaSelectionOption *)v6;
}

- (void)setCurrentAudioMediaSelectionOption:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F15B00];
  id v5 = a3;
  [(AVPlayerController *)self _setMediaOption:v5 mediaCharacteristic:v4];
  [(AVPlayerController *)self _setMostRecentChosenOption:v5];

  [(AVPlayerController *)self reloadAudioOptions];
}

- (id)currentAudioMediaSelectionOption
{
  id v3 = [(AVPlayerController *)self _selectedMediaOptionWithMediaCharacteristic:*MEMORY[0x1E4F15B00]];
  uint64_t v4 = [(AVPlayerController *)self audioMediaSelectionOptions];
  if ([v4 containsObject:v3]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setVisualMediaSelectionOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (NSArray *)a3;
  visualMediaSelectionOptions = self->_visualMediaSelectionOptions;
  p_visualMediaSelectionOptions = &self->_visualMediaSelectionOptions;
  if (visualMediaSelectionOptions != v5)
  {
    int64_t v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[AVPlayerController(AVMediaSelection) setVisualMediaSelectionOptions:]";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s VisualMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_visualMediaSelectionOptions, a3);
  }
}

- (void)setAudioMediaSelectionOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (NSArray *)a3;
  audioMediaSelectionOptions = self->_audioMediaSelectionOptions;
  p_audioMediaSelectionOptions = &self->_audioMediaSelectionOptions;
  if (audioMediaSelectionOptions != v5)
  {
    int64_t v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[AVPlayerController(AVMediaSelection) setAudioMediaSelectionOptions:]";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_audioMediaSelectionOptions, a3);
  }
}

- (NSArray)visualMediaSelectionOptions
{
  return self->_visualMediaSelectionOptions;
}

- (id)audioMediaSelectionOptions
{
  return self->_audioMediaSelectionOptions;
}

- (void)setLegibleMediaSelectionOptions:(id)a3 audioMediaSelectionOptions:(id)a4 assumeMediaOptionMayHaveChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  if (v8 && ![(NSArray *)self->_audioMediaSelectionOptions isEqualToArray:v8])
  {
    [(AVPlayerController *)self setAudioMediaSelectionOptions:v8];
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  if (v10 && ![(NSArray *)self->_legibleMediaSelectionOptions isEqualToArray:v10])
  {
    [(AVPlayerController *)self setLegibleMediaSelectionOptions:v10];
    goto LABEL_10;
  }
  if ((v9 | v5) == 1) {
LABEL_10:
  }
    [(AVPlayerController *)self selectedMediaOptionMayHaveChanged:1];
}

- (BOOL)hasAudioMediaSelectionOptions
{
  v2 = [(AVPlayerController *)self audioMediaSelectionOptions];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (BOOL)hasMediaSelectionOptions
{
  if ([(AVPlayerController *)self hasAudioMediaSelectionOptions]) {
    return 1;
  }

  return [(AVPlayerController *)self hasLegibleMediaSelectionOptions];
}

- (BOOL)closedCaptionsEnabled
{
  return _AXSClosedCaptionsEnabled() != 0;
}

+ (id)_sortedAudibleOption:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_49_1974];
}

uint64_t __61__AVPlayerController_AVMediaSelection___sortedAudibleOption___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioLanguageCompare:");
}

+ (id)keyPathsForValuesAffectingHasLegibleMediaSelectionOptions
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"legibleMediaSelectionOptions"];
}

+ (id)keyPathsForValuesAffectingCurrentVideoMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"visualMediaSelectionOptions", @"currentAssetIfReady", 0);
}

+ (id)keyPathsForValuesAffectingCurrentAudioMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentAssetIfReady", @"audioMediaSelectionOptions", 0);
}

+ (id)keyPathsForValuesAffectingHasAudioMediaSelectionOptions
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"audioMediaSelectionOptions"];
}

+ (id)keyPathsForValuesAffectingHasMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"hasAudioMediaSelectionOptions", @"hasLegibleMediaSelectionOptions", 0);
}

+ (id)canonicalLanguageIdentifierFromString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (__CFString *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      int v9 = "+[AVPlayerController(AVMediaSelection) canonicalLanguageIdentifierFromString:]";
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v8, 0xCu);
    }
  }
  if (canonicalLanguageIdentifierFromString__createQueueOnceToken != -1) {
    dispatch_once(&canonicalLanguageIdentifierFromString__createQueueOnceToken, &__block_literal_global_2002);
  }
  if (v3) {
    BOOL v5 = v3;
  }
  else {
    BOOL v5 = @"NilString";
  }
  id v6 = [(id)canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v3];
    [(id)canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

uint64_t __78__AVPlayerController_AVMediaSelection__canonicalLanguageIdentifierFromString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache;
  canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitivityRegions, 0);
  objc_storeStrong((id *)&self->_playerLayerForReducingResources, 0);
  objc_destroyWeak((id *)&self->_interstitialController);
  objc_storeStrong((id *)&self->_pipActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_scrubCoordinatorSuspension, 0);
  objc_storeStrong((id *)&self->_rateBeforeScrubBegan, 0);
  objc_storeStrong((id *)&self->_contentChapters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_initialScrubbingTime, 0);
  objc_storeStrong((id *)&self->_currentAudioTrack, 0);
  objc_storeStrong((id *)&self->_maxTiming, 0);
  objc_storeStrong((id *)&self->_minTiming, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_externalPlaybackAirPlayDeviceLocalizedName, 0);
  objc_storeStrong((id *)&self->_assetBeingPrepared, 0);
  objc_storeStrong((id *)&self->_assetInspectionQueue, 0);
  objc_storeStrong((id *)&self->_currentAssetIfReady, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_activeRate, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_canTogglePictureInPicture, 0);
  objc_storeStrong((id *)&self->_muted, 0);
  objc_storeStrong((id *)&self->_updatePlayingOnMatchPointDeviceThrottleTimer, 0);
  objc_storeStrong((id *)&self->_lastTimePlayingOnMatchPointDeviceWasUpdated, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_destroyWeak((id *)&self->_timecodeController);
  objc_storeStrong((id *)&self->_touchBarRequiresLinearPlayback, 0);
  objc_storeStrong((id *)&self->_playingOnSecondScreen, 0);
  objc_storeStrong((id *)&self->_liveStreamMinTiming, 0);
  objc_storeStrong((id *)&self->_preScanningRate, 0);
  objc_storeStrong((id *)&self->_seekQueue, 0);
  objc_storeStrong(&self->_retryPlayingImmediatelyBlock, 0);
  objc_storeStrong((id *)&self->_rateToRestoreAfterAudioSessionInterruptionEnds, 0);
  objc_storeStrong(&self->_timecodePeriodicObserverToken, 0);
  objc_storeStrong(&self->_updateAtMinMaxTimePeriodicObserverToken, 0);
  objc_storeStrong((id *)&self->_recentLegibleLanguageForLastSort, 0);
  objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, 0);
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation, 0);
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_cachedSelectedAudioMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionOptions, 0);
  objc_storeStrong((id *)&self->_visualMediaSelectionOptions, 0);

  objc_storeStrong((id *)&self->_audioMediaSelectionOptions, 0);
}

- (BOOL)coordinatedPlaybackActive
{
  return self->_allowsPictureInPicturePlayback;
}

- (double)suspendedRate
{
  return *(double *)&self->_captionAppearanceDisplayType;
}

- (BOOL)isPlaybackSuspended
{
  return self->_disablingAutomaticTermination;
}

- (void)setCaptionAppearanceDisplayType:(int64_t)a3
{
  self->_seekTimer = (OS_dispatch_source *)a3;
}

- (int64_t)captionAppearanceDisplayType
{
  return (int64_t)self->_seekTimer;
}

- (void)setShouldLoadVisualMediaSelectionOptions:(BOOL)a3
{
  self->_preventingIdleDisplaySleep = a3;
}

- (BOOL)shouldLoadVisualMediaSelectionOptions
{
  return self->_preventingIdleDisplaySleep;
}

- (OS_dispatch_source)seekTimer
{
  return (OS_dispatch_source *)self->_photosensitivityRegions;
}

- (void)setScanningTV:(BOOL)a3
{
  self->_preventingIdleSystemSleep = a3;
}

- (BOOL)_isScanningTV
{
  return self->_preventingIdleSystemSleep;
}

- (void)setPhotosensitivityRegions:(id)a3
{
}

- (NSArray)photosensitivityRegions
{
  return (NSArray *)self->_playerLayerForReducingResources;
}

- (void)setPlayerLayerForReducingResources:(id)a3
{
}

- (AVPlayerLayer)playerLayerForReducingResources
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interstitialController);

  return (AVPlayerLayer *)WeakRetained;
}

- (void)setInterstitialController:(id)a3
{
}

- (void)setPlayingOnMatchPointDevice:(BOOL)a3
{
  self->_compatibleWithAirPlayVideo = a3;
}

- (BOOL)isPlayingOnMatchPointDevice
{
  return self->_compatibleWithAirPlayVideo;
}

- (void)setHasBegunInspection:(BOOL)a3
{
  self->_hasProtectedContent = a3;
}

- (BOOL)hasBegunInspection
{
  return self->_hasProtectedContent;
}

- (void)setPipActivitySessionIdentifier:(id)a3
{
}

- (void)setCanTogglePictureInPicture:(BOOL)a3
{
  self->_composable = a3;
}

- (BOOL)canTogglePictureInPicture
{
  return self->_composable;
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  self->_seeking = a3;
}

- (BOOL)isPictureInPictureActive
{
  return self->_seeking;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_seekingInternal = a3;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_seekingInternal;
}

- (void)setDisablingAutomaticTermination:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (BOOL)isDisablingAutomaticTermination
{
  return self->_pictureInPictureSupported;
}

- (void)setPreventingIdleDisplaySleep:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isPreventingIdleDisplaySleep
{
  return self->_scrubbing;
}

- (void)setPreventingIdleSystemSleep:(BOOL)a3
{
  self->_atMinTime = a3;
}

- (BOOL)isPreventingIdleSystemSleep
{
  return self->_atMinTime;
}

- (void)setScrubCoordinatorSuspension:(id)a3
{
}

- (AVCoordinatedPlaybackSuspension)scrubCoordinatorSuspension
{
  return *(AVCoordinatedPlaybackSuspension **)&self->_rateBeforeScrubBegan;
}

- (void)setRateBeforeScrubBegan:(double)a3
{
  *(double *)&self->_availableMetadataFormats = a3;
}

- (double)rateBeforeScrubBegan
{
  return *(double *)&self->_availableMetadataFormats;
}

- (void)setCompatibleWithAirPlayVideo:(BOOL)a3
{
  self->_atMaxTime = a3;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return self->_atMaxTime;
}

- (void)setAvailableMetadataFormats:(id)a3
{
}

- (NSArray)availableMetadataFormats
{
  return self->_contentChapters;
}

- (void)setHasProtectedContent:(BOOL)a3
{
  self->_atLiveEdge = a3;
}

- (BOOL)hasProtectedContent
{
  return self->_atLiveEdge;
}

- (void)setComposable:(BOOL)a3
{
  self->_isPlayingHDRContent = a3;
}

- (BOOL)isComposable
{
  return self->_isPlayingHDRContent;
}

- (void)setContentChapters:(id)a3
{
}

- (NSArray)contentChapters
{
  return (NSArray *)self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return *(NSDictionary **)&self->_initialScrubbingTime;
}

- (void)setInitialScrubbingTime:(double)a3
{
  self->_seekToTime = a3;
}

- (double)initialScrubbingTime
{
  return self->_seekToTime;
}

- (void)setSeekToTime:(double)a3
{
  *(double *)&self->_currentVideoTrack = a3;
}

- (double)seekToTime
{
  return *(double *)&self->_currentVideoTrack;
}

- (void)setSeekToTimeInternal:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal
{
  objc_copyStruct(retstr, &self->_presentationSize.height, 24, 1, 0);
  return result;
}

- (void)setSeeking:(BOOL)a3
{
  HIBYTE(self->_liveEdgeTimer) = a3;
}

- (BOOL)isSeeking
{
  return HIBYTE(self->_liveEdgeTimer);
}

- (void)setSeekingInternal:(BOOL)a3
{
  BYTE6(self->_liveEdgeTimer) = a3;
}

- (BOOL)isSeekingInternal
{
  return BYTE6(self->_liveEdgeTimer) & 1;
}

- (void)setCurrentVideoTrack:(id)a3
{
}

- (AVAssetTrack)currentVideoTrack
{
  return self->_currentAudioTrack;
}

- (void)setCurrentAudioTrack:(id)a3
{
}

- (AVAssetTrack)currentAudioTrack
{
  return (AVAssetTrack *)self->_maxTiming;
}

- (void)setMaxTiming:(id)a3
{
}

- (AVValueTiming)maxTiming
{
  return self->_minTiming;
}

- (void)setMinTiming:(id)a3
{
}

- (AVValueTiming)minTiming
{
  return self->_timing;
}

- (void)setTiming:(id)a3
{
}

- (AVValueTiming)timing
{
  return (AVValueTiming *)self->_externalPlaybackAirPlayDeviceLocalizedName;
}

- (void)setExternalPlaybackAirPlayDeviceLocalizedName:(id)a3
{
}

- (NSString)externalPlaybackAirPlayDeviceLocalizedName
{
  return (NSString *)&self->_assetBeingPrepared->super.isa;
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
  BYTE5(self->_liveEdgeTimer) = a3;
}

- (BOOL)isPictureInPictureSupported
{
  return BYTE5(self->_liveEdgeTimer);
}

- (void)setAssetBeingPrepared:(id)a3
{
}

- (AVAsset)assetBeingPrepared
{
  return (AVAsset *)self->_assetInspectionQueue;
}

- (void)setAssetInspectionQueue:(id)a3
{
}

- (OS_dispatch_queue)assetInspectionQueue
{
  return (OS_dispatch_queue *)self->_currentAssetIfReady;
}

- (void)setCurrentAssetIfReady:(id)a3
{
}

- (void)setPresentationSize:(CGSize)a3
{
  *(CGSize *)&self->_suspendedRate = a3;
}

- (CGSize)presentationSize
{
  double suspendedRate = self->_suspendedRate;
  double width = self->_presentationSize.width;
  result.height = width;
  result.double width = suspendedRate;
  return result;
}

- (AVObservationController)observationController
{
  return *(AVObservationController **)&self->_activeRate;
}

- (void)setActiveRate:(double)a3
{
  *(double *)&self->_activePlayer = a3;
}

- (void)setScrubbing:(BOOL)a3
{
  BYTE4(self->_liveEdgeTimer) = a3;
}

- (BOOL)isScrubbing
{
  return BYTE4(self->_liveEdgeTimer);
}

- (void)setAtMinTime:(BOOL)a3
{
  BYTE3(self->_liveEdgeTimer) = a3;
}

- (BOOL)isAtMinTime
{
  return BYTE3(self->_liveEdgeTimer);
}

- (void)setAtMaxTime:(BOOL)a3
{
  BYTE2(self->_liveEdgeTimer) = a3;
}

- (BOOL)isAtMaxTime
{
  return BYTE2(self->_liveEdgeTimer);
}

- (void)setPlayer:(id)a3
{
}

- (double)_adjustedSeekTimeFromTime:(double)a3 toTime:(double)a4
{
  int64_t v7 = [(AVPlayerController *)self activePlayer];
  int v8 = [(AVPlayerController *)self player];

  if (v7 == v8)
  {
    int v9 = [(AVPlayerController *)self interstitialController];
    [v9 timeToSeekAfterUserNavigatedFromTime:a3 toTime:a4];
    a4 = v10;
  }
  return a4;
}

- (void)_setupInterstitialController
{
  BOOL v3 = objc_alloc_init(AVInterstitialController);
  uint64_t v4 = [(AVPlayerController *)self player];
  [(AVInterstitialController *)v3 setPlayer:v4];

  [(AVPlayerController *)self willChangeValueForKey:@"interstitialController"];
  objc_storeStrong((id *)&self->_pipActivitySessionIdentifier, v3);
  [(AVPlayerController *)self didChangeValueForKey:@"interstitialController"];
  objc_initWeak(&location, self);
  pipActivitySessionIdentifier = self->_pipActivitySessionIdentifier;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayerController__setupInterstitialController__block_invoke;
  void v6[3] = &unk_1E5FC4338;
  objc_copyWeak(&v7, &location);
  [(NSString *)pipActivitySessionIdentifier setDidLeaveRequiredInterstitialTimeRangeBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__AVPlayerController__setupInterstitialController__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained seekToTime:a2 toleranceBefore:0.0 toleranceAfter:0.0];
}

- (void)_prepareAssetForInspectionIfNeeded
{
  if (![(AVPlayerController *)self isReadyToPlay]) {
    goto LABEL_3;
  }
  BOOL v3 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v4 = [(AVPlayerController *)self player];
  BOOL v5 = [v4 currentItem];
  id v6 = [v5 asset];

  if (v3 != v6) {
LABEL_3:
  }
    [(AVPlayerController *)self setCurrentAssetIfReady:0];
  id v7 = [(AVPlayerController *)self assetBeingPrepared];
  int v8 = [(AVPlayerController *)self player];
  int v9 = [v8 currentItem];
  double v10 = [v9 asset];

  if (v7 != v10) {
    [(AVPlayerController *)self setAssetBeingPrepared:0];
  }
  uint64_t v11 = [(AVPlayerController *)self assetBeingPrepared];
  uint64_t v12 = v11;
  if (v11
    || (v11 = [(AVPlayerController *)self isReadyToPlay], uint64_t v12 = 0, !v11)
    || (v11 = [(AVPlayerController *)self isInspectionSuspended], uint64_t v12 = 0, (v11 & 1) != 0))
  {
    MEMORY[0x1F41817F8](v11, v12);
  }
  else
  {
    id v28 = [(AVPlayerController *)self player];
    uint64_t v13 = [v28 currentItem];
    uint64_t v14 = [v13 asset];
    if (v14)
    {
      long long v15 = (void *)v14;
      uint64_t v16 = [(AVPlayerController *)self currentAssetIfReady];
      uint64_t v17 = [(AVPlayerController *)self player];
      __int16 v18 = [v17 currentItem];
      uint64_t v19 = [v18 asset];

      if (v16 != v19)
      {
        uint64_t v20 = [(AVPlayerController *)self player];
        int v21 = [v20 currentItem];
        id v22 = [v21 asset];
        [(AVPlayerController *)self setAssetBeingPrepared:v22];

        objc_initWeak(&location, self);
        __int16 v23 = [(AVPlayerController *)self player];
        uint64_t v24 = [v23 currentItem];
        objc_initWeak(&from, v24);

        id v25 = objc_loadWeakRetained(&from);
        int64_t v26 = [v25 asset];
        objc_initWeak(&v33, v26);

        __int16 v27 = [(AVPlayerController *)self assetInspectionQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke;
        block[3] = &unk_1E5FC4310;
        objc_copyWeak(&v30, &from);
        objc_copyWeak(&v31, &v33);
        objc_copyWeak(&v32, &location);
        dispatch_async(v27, block);

        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v3 = objc_loadWeakRetained(a1 + 5);
  uint64_t v4 = a1 + 6;
  id v5 = objc_loadWeakRetained(a1 + 6);
  if (v5)
  {
    id v6 = v5;
    id v7 = [WeakRetained asset];

    if (v7 == v3)
    {
      int v8 = [&unk_1F094A490 arrayByAddingObject:@"preferredDisplayCriteria"];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2;
      v9[3] = &unk_1E5FC42E8;
      objc_copyWeak(&v12, v4);
      id v10 = v3;
      id v11 = WeakRetained;
      [v10 loadValuesAsynchronouslyForKeys:v8 completionHandler:v9];

      objc_destroyWeak(&v12);
    }
  }
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2(id *a1)
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__22598;
  id v12 = __Block_byref_object_dispose__22599;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = [v2 assetInspectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_489;
    block[3] = &unk_1E5FC4298;
    id v5 = a1[4];
    id v7 = &v8;
    id v6 = a1[5];
    dispatch_async(v3, block);
  }
  _Block_object_dispose(&v8, 8);
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_489(uint64_t a1)
{
  v12[12] = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2_490;
  v9[3] = &unk_1E5FC4298;
  id v10 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v7;
  long long v11 = v7;
  id v3 = (void (**)(void))MEMORY[0x1B3E963E0](v9);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C18]);
  id v5 = [v4 firstObject];

  if (v5)
  {
    v12[0] = @"nominalFrameRate";
    v12[1] = @"availableMetadataFormats";
    v12[2] = @"commonMetadata";
    v12[3] = @"enabled";
    v12[4] = @"languageCode";
    v12[5] = @"mediaType";
    v12[6] = @"metadata";
    v12[7] = @"minFrameDuration";
    v12[8] = @"extendedLanguageTag";
    v12[9] = @"mediaCharacteristics";
    v12[10] = @"availableTrackAssociationTypes";
    v12[11] = @"currentVideoTrack.preferredTransform";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:12];
    [v5 loadValuesAsynchronouslyForKeys:v6 completionHandler:v3];
  }
  else if (*(void *)(a1 + 32))
  {
    v3[2](v3);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_4;
    block[3] = &unk_1E5FC42C0;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2_490(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_3;
  block[3] = &unk_1E5FC4298;
  id v5 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) assetBeingPrepared];

  if (v2 == v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAssetBeingPrepared:0];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) asset];

  if (v4 == v5)
  {
    long long v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    [v6 setCurrentAssetIfReady:v7];
  }
}

- (id)scanningDelays
{
  BOOL v3 = [(AVPlayerController *)self hasEnabledAudio];
  BOOL v4 = [(AVPlayerController *)self hasEnabledVideo];
  id v5 = &unk_1F094A460;
  if (!v3) {
    id v5 = 0;
  }
  if (v4) {
    return &unk_1F094A478;
  }
  else {
    return v5;
  }
}

- (void)_updateRateForScrubbingAndSeeking
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      long long v6 = "-[AVPlayerController _updateRateForScrubbingAndSeeking]";
      _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v5, 0xCu);
    }
  }
  if (![(AVPlayerController *)self isSeeking]
    && ![(AVPlayerController *)self isPlaybackSuspended])
  {
    BOOL v4 = [(AVPlayerController *)self isScrubbing];
    [(AVPlayerController *)self rateBeforeScrubBegan];
    if (!v4)
    {
      [(AVPlayerController *)self rateBeforeScrubBegan];
      -[AVPlayerController setRate:](self, "setRate:");
      [(AVPlayerController *)self setRateBeforeScrubBegan:NAN];
    }
  }
}

- (void)_updatePlayerMutedState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!BYTE1(self->_photosensitivityMetadataHandler))
  {
    BOOL v3 = [(AVPlayerController *)self player];
    BOOL v4 = v3;
    if (LOBYTE(self->_photosensitivityMetadataHandler))
    {
      if (([v3 isMuted] & 1) == 0)
      {
        BOOL v5 = 1;
LABEL_6:
        long long v6 = _AVLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315650;
          uint64_t v8 = "-[AVPlayerController _updatePlayerMutedState]";
          __int16 v9 = 2112;
          id v10 = v4;
          __int16 v11 = 1024;
          BOOL v12 = v5;
          _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Updating %@ muted state to %d", (uint8_t *)&v7, 0x1Cu);
        }

        BYTE1(self->_photosensitivityMetadataHandler) = 1;
        [v4 setMuted:v5];
        BYTE1(self->_photosensitivityMetadataHandler) = 0;
      }
    }
    else
    {
      BOOL v5 = BYTE2(self->_photosensitivityMetadataHandler) == 0;
      if ([v3 isMuted] != v5) {
        goto LABEL_6;
      }
    }
  }
}

- (void)_updateMetadata
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self currentAssetIfReady];
  if (v3)
  {
    val = self;
    BOOL v4 = dispatch_group_create();
    uint64_t v13 = v3;
    BOOL v5 = [v3 commonMetadata];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
          dispatch_group_enter(v4);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __37__AVPlayerController__updateMetadata__block_invoke;
          v17[3] = &unk_1E5FC4698;
          __int16 v18 = v4;
          [v10 loadValuesAsynchronouslyForKeys:&unk_1F094A448 completionHandler:v17];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    objc_initWeak(&location, val);
    __int16 v11 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__AVPlayerController__updateMetadata__block_invoke_2;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v15, &location);
    dispatch_group_notify(v4, v11, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    BOOL v3 = v13;
  }
}

void __37__AVPlayerController__updateMetadata__block_invoke(uint64_t a1)
{
}

void __37__AVPlayerController__updateMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained _createMetadataDictionaryForCurrentAsset];
    if ([v4 count])
    {
      BOOL v5 = [v3 _createMetadataDictionaryForCurrentAsset];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __37__AVPlayerController__updateMetadata__block_invoke_3;
      v7[3] = &unk_1E5FC4180;
      objc_copyWeak(&v9, v1);
      id v8 = v5;
      id v6 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);

      objc_destroyWeak(&v9);
    }
  }
}

void __37__AVPlayerController__updateMetadata__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*(void *)(a1 + 32)];
  [WeakRetained setMetadata:v2];
}

- (id)_outputContext
{
  id v2 = [(AVPlayerController *)self player];
  BOOL v3 = [v2 outputContext];

  return v3;
}

- (id)_timecodeTrack
{
  BOOL v3 = [(AVPlayerController *)self currentAssetIfReady];
  BOOL v4 = objc_msgSend(v3, "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C18]);
  BOOL v5 = [v4 firstObject];
  uint64_t v6 = *MEMORY[0x1E4F15C10];
  uint64_t v7 = objc_msgSend(v5, "avkit_associatedTracksOfType:", *MEMORY[0x1E4F15C10]);
  id v8 = [v7 firstObject];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    __int16 v11 = [(AVPlayerController *)self currentAssetIfReady];
    BOOL v12 = objc_msgSend(v11, "avkit_tracksWithMediaType:", v6);
    id v10 = [v12 firstObject];
  }

  return v10;
}

- (void)_stopSuspendingPlayback
{
  [(AVPlayerController *)self _setPlaybackSuspended:0];
  [(AVPlayerController *)self resumePlaybackCoordinatorIfSuspended];

  [(AVPlayerController *)self _endPlaybackSuspension_AVFoundationStrategy];
}

- (void)_startSuspendingPlayback
{
  [(AVPlayerController *)self suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary];
  [(AVPlayerController *)self _beginPlaybackSuspension_AVFoundationStrategy];

  [(AVPlayerController *)self _setPlaybackSuspended:1];
}

- (void)_setSuspendedRate:(double)a3
{
  if (*(double *)&self->_captionAppearanceDisplayType != a3) {
    *(double *)&self->_captionAppearanceMACaptionAppearanceDisplayType DisplayType = a3;
  }
}

- (void)_setPlaybackSuspended:(BOOL)a3
{
  if (self->_disablingAutomaticTermination != a3) {
    self->_disablingAutomaticTermination = a3;
  }
}

- (void)_endPlaybackSuspension_AVFoundationStrategy
{
  [(AVPlayerController *)self setRate:*(double *)&self->_captionAppearanceDisplayType];

  [(AVPlayerController *)self _setSuspendedRate:NAN];
}

- (id)_createMetadataDictionaryForCurrentAsset
{
  id v2 = [(AVPlayerController *)self currentAssetIfReady];
  BOOL v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 commonMetadata];
    BOOL v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = *MEMORY[0x1E4F15CD0];
    uint64_t v7 = *MEMORY[0x1E4F15DE0];
    id v8 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v4 withKey:*MEMORY[0x1E4F15CD0] keySpace:*MEMORY[0x1E4F15DE0]];
    id v9 = [v8 firstObject];
    id v10 = [v9 stringValue];

    if (v10 && [v10 length]) {
      [v5 setObject:v10 forKeyedSubscript:v6];
    }
    __int16 v11 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v4 filteredByIdentifier:*MEMORY[0x1E4F15DB0]];
    BOOL v12 = [v11 firstObject];
    uint64_t v13 = [v12 stringValue];

    if (v13 && [v13 length]) {
      [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F15EF8]];
    }
    uint64_t v29 = v10;
    uint64_t v14 = *MEMORY[0x1E4F15CA8];
    id v15 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v4 withKey:*MEMORY[0x1E4F15CA8] keySpace:v7];
    uint64_t v16 = [v15 firstObject];
    uint64_t v17 = [v16 stringValue];

    if (v17 && [v17 length]) {
      [v5 setObject:v17 forKeyedSubscript:v14];
    }
    __int16 v18 = v5;
    uint64_t v19 = *MEMORY[0x1E4F15C90];
    long long v20 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v4 withKey:*MEMORY[0x1E4F15C90] keySpace:v7];
    long long v21 = [v20 firstObject];
    long long v22 = [v21 stringValue];

    if (v22 && [v22 length]) {
      [v18 setObject:v22 forKeyedSubscript:v19];
    }
    uint64_t v23 = *MEMORY[0x1E4F15C98];
    uint64_t v24 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v4 withKey:*MEMORY[0x1E4F15C98] keySpace:v7];
    id v25 = [v24 firstObject];
    int64_t v26 = [v25 dataValue];

    if (v26 && [v26 length])
    {
      __int16 v27 = [MEMORY[0x1E4FB1818] imageWithData:v26];
      if (v27) {
        [v18 setObject:v27 forKeyedSubscript:v23];
      }
    }
  }

  return 0;
}

- (void)_cancelPendingSeeksIfNeeded
{
  objc_initWeak(&location, self);
  seekQueue = self->_seekQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__AVPlayerController__cancelPendingSeeksIfNeeded__block_invoke;
  v4[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(seekQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__AVPlayerController__cancelPendingSeeksIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    [WeakRetained setSeekingInternal:0];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    long long v6 = v7;
    uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v3 = v8;
    [v2 setSeekToTimeInternal:&v7];
    *(_OWORD *)(v2 + 172) = v6;
    *(void *)(v2 + 188) = v3;
    *(_OWORD *)(v2 + 196) = v6;
    *(void *)(v2 + 212) = v3;
    BOOL v4 = [v2 player];
    id v5 = [v4 currentItem];
    [v5 cancelPendingSeeks];
  }
}

- (void)_beginPlaybackSuspension_AVFoundationStrategy
{
  [(AVPlayerController *)self rate];
  -[AVPlayerController _setSuspendedRate:](self, "_setSuspendedRate:");

  [(AVPlayerController *)self setRate:0.0];
}

- (id)_photosensitiveDisplayTimes
{
  uint64_t v3 = [(AVPlayerController *)self player];
  BOOL v4 = [v3 currentItem];

  id v5 = [(NSTimer *)self->_updatePlayingOnMatchPointDeviceThrottleTimer photosensitivityRegions];
  long long v6 = [v4 currentDate];
  long long v7 = +[AVPhotosensitiveTimeRange timeRangesFromMetadata:v5 initialDate:v6];

  return v7;
}

- (void)_updatePhotosensitivityRegions
{
  [(AVPlayerController *)self setPhotosensitivityRegions:0];
  if (_AXSPhotosensitiveMitigationEnabled())
  {
    uint64_t v3 = [(AVPlayerController *)self observationController];
    [v3 startObservingNotificationForName:@"AVPlayerItemPhotosensitiveRegionsChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_442];

    BOOL v4 = [AVPlayerItemPhotosensitivityMetadataHandler alloc];
    id v9 = [(AVPlayerController *)self player];
    id v5 = [(NSTimer *)v9 currentItem];
    long long v6 = [(AVPlayerItemPhotosensitivityMetadataHandler *)v4 initWithPlayerItem:v5];
    updatePlayingOnMatchPointDeviceThrottleTimer = self->_updatePlayingOnMatchPointDeviceThrottleTimer;
    self->_updatePlayingOnMatchPointDeviceThrottleTimer = v6;

    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = self->_updatePlayingOnMatchPointDeviceThrottleTimer;
    self->_updatePlayingOnMatchPointDeviceThrottleTimer = 0;
  }
}

void __52__AVPlayerController__updatePhotosensitivityRegions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v5 = [a4 object];
  long long v6 = [v9 player];
  long long v7 = [v6 currentItem];

  if ([v7 isEqual:v5])
  {
    uint64_t v8 = [v9 _photosensitiveDisplayTimes];
    [v9 setPhotosensitivityRegions:v8];
  }
}

- (void)_cancelOutstandingAtLiveEdgeStateUpdates
{
  id v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v3 cancelPerformSelector:sel__updateAtLiveEdgeStateAndScheduleTimerIfNeeded target:self argument:0];
}

- (void)_updateAtLiveEdgeStateIfNeeded
{
  BOOL v3 = [(AVPlayerController *)self hasLiveStreamingContent];
  int v4 = ![(AVPlayerController *)self hasSeekableLiveStreamingContent];
  if (v4)
  {
    uint64_t v12 = v3 & v4;
  }
  else
  {
    [(AVPlayerController *)self maxTime];
    double v6 = v5;
    double v7 = fabs(v5);
    [(AVPlayerController *)self currentTime];
    BOOL v10 = fabs(v8) == INFINITY || v7 == INFINITY;
    double v11 = vabdd_f64(v6, v8);
    if (v10) {
      double v11 = NAN;
    }
    uint64_t v12 = v11 <= 10.0;
  }

  [(AVPlayerController *)self setAtLiveEdge:v12];
}

- (void)_updateAtLiveEdgeStateAndScheduleTimerIfNeeded
{
  if (BYTE3(self->_photosensitivityMetadataHandler))
  {
    [(AVPlayerController *)self _cancelOutstandingAtLiveEdgeStateUpdates];
    BYTE3(self->_photosensitivityMetadataHandler) = 0;
    [(AVPlayerController *)self _updateAtLiveEdgeStateIfNeeded];
    if ([(AVPlayerController *)self hasSeekableLiveStreamingContent])
    {
      [(AVPlayerController *)self _scheduleAtLiveEdgeStateUpdateIfNeeded];
    }
  }
}

- (void)_setNeedsAtLiveEdgeStateUpdate
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (!BYTE3(self->_photosensitivityMetadataHandler))
  {
    BYTE3(self->_photosensitivityMetadataHandler) = 1;
    BOOL v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v5[0] = *MEMORY[0x1E4F1C4B0];
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v3 performSelector:sel__updateAtLiveEdgeStateAndScheduleTimerIfNeeded target:self argument:0 order:0 modes:v4];
  }
}

- (void)_scheduleAtLiveEdgeStateUpdateWithTimeInterval:(double)a3
{
  [*(id *)&self->_muted invalidate];
  double v5 = *(void **)&self->_muted;
  *(void *)&self->_muted = 0;

  objc_initWeak(&location, self);
  double v6 = (void *)MEMORY[0x1E4F1CB00];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__AVPlayerController__scheduleAtLiveEdgeStateUpdateWithTimeInterval___block_invoke;
  v9[3] = &unk_1E5FC4480;
  objc_copyWeak(&v10, &location);
  uint64_t v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:v9 block:a3];
  double v8 = *(void **)&self->_muted;
  *(void *)&self->_muted = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__AVPlayerController__scheduleAtLiveEdgeStateUpdateWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAtLiveEdgeStateIfNeeded];
}

- (void)_scheduleAtLiveEdgeStateUpdateIfNeeded
{
  [(AVPlayerController *)self rate];
  double v4 = v3;
  [(AVPlayerController *)self currentTime];
  double v6 = v5;
  [(AVPlayerController *)self maxTime];
  double v8 = vabdd_f64(v7, v6);
  if (v4 < 1.0)
  {
    if (v8 >= 10.0) {
      return;
    }
    goto LABEL_3;
  }
  if (v4 > 1.0 && v8 >= 10.0)
  {
LABEL_3:
    -[AVPlayerController _scheduleAtLiveEdgeStateUpdateWithTimeInterval:](self, "_scheduleAtLiveEdgeStateUpdateWithTimeInterval:");
  }
}

- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AVPlayerController *)self player];
  double v4 = [v5 currentItem];
  [v4 setCanUseNetworkResourcesForLiveStreamingWhilePaused:v3];
}

- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
{
  id v2 = [(AVPlayerController *)self player];
  BOOL v3 = [v2 currentItem];
  char v4 = [v3 canUseNetworkResourcesForLiveStreamingWhilePaused];

  return v4;
}

- (BOOL)isReducingResourcesForPictureInPicture
{
  id v2 = [(AVPlayerController *)self reduceResourceUsageAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BSSimpleAssertion)reduceResourceUsageAssertion
{
  return (BSSimpleAssertion *)*(id *)&self->_playingOnSecondScreen;
}

- (void)setReduceResourceUsageAssertion:(id)a3
{
  id v5 = a3;
  id v6 = *(id *)&self->_playingOnSecondScreen;
  if (v6 != v5)
  {
    id v7 = v5;
    [v6 invalidate];
    objc_storeStrong((id *)&self->_playingOnSecondScreen, a3);
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](v6, v5);
}

- (void)acquireResourceReductionAssertion
{
  BOOL v3 = [(AVPlayerController *)self player];
  char v4 = [v3 currentItem];
  [v4 preferredPeakBitRate];
  id v6 = v5;

  id v7 = [(AVPlayerController *)self player];
  double v8 = [v7 currentItem];
  [v8 preferredForwardBufferDuration];
  id v10 = v9;

  objc_initWeak(&location, self);
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __55__AVPlayerController_acquireResourceReductionAssertion__block_invoke;
  uint64_t v16 = &unk_1E5FC4270;
  objc_copyWeak(v17, &location);
  v17[1] = v6;
  v17[2] = v10;
  uint64_t v12 = (void *)[v11 initWithIdentifier:@"AVPlayerControllerResourceReductionIdentifier" forReason:@"Reducing Resources for Picture in Picture" invalidationBlock:&v13];
  -[AVPlayerController setReduceResourceUsageAssertion:](self, "setReduceResourceUsageAssertion:", v12, v13, v14, v15, v16);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __55__AVPlayerController_acquireResourceReductionAssertion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Resource Reduction assertion was invalidated.", v10, 2u);
    }

    char v4 = [WeakRetained playerLayerForReducingResources];
    id v5 = [WeakRetained player];
    [v4 setPlayer:v5];

    if ([WeakRetained isStreaming]
      && (*(double *)(a1 + 40) != 0.0 || *(double *)(a1 + 48) != 0.0))
    {
      id v6 = [WeakRetained player];
      id v7 = [v6 currentItem];
      [v7 setPreferredPeakBitRate:*(double *)(a1 + 40)];

      double v8 = [WeakRetained player];
      id v9 = [v8 currentItem];
      [v9 setPreferredForwardBufferDuration:*(double *)(a1 + 48)];
    }
  }
}

- (void)endReducingResourcesForPictureInPicturePlayerLayer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[AVPlayerController endReducingResourcesForPictureInPicturePlayerLayer:]";
    __int16 v8 = 1024;
    int v9 = 4036;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  id v5 = [(AVPlayerController *)self reduceResourceUsageAssertion];
  [v5 invalidate];

  [(AVPlayerController *)self setPlayerLayerForReducingResources:0];
}

- (void)beginReducingResourcesForPictureInPicturePlayerLayer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[AVPlayerController beginReducingResourcesForPictureInPicturePlayerLayer:]";
    __int16 v20 = 1024;
    int v21 = 4016;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v18, 0x12u);
  }

  [(AVPlayerController *)self setPlayerLayerForReducingResources:v4];
  int v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = [v6 objectForKey:@"PIPStashBufferDuration"];
  [v7 floatValue];
  float v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v11 = [v10 objectForKey:@"PIPStashPeakBitRate"];
  [v11 floatValue];
  float v13 = v12;

  [(AVPlayerController *)self acquireResourceReductionAssertion];
  [v4 setPlayer:0];

  if ([(AVPlayerController *)self isStreaming] && (v13 != 0.0 || v9 != 0.0))
  {
    uint64_t v14 = [(AVPlayerController *)self player];
    id v15 = [v14 currentItem];
    [v15 setPreferredPeakBitRate:v13];

    uint64_t v16 = [(AVPlayerController *)self player];
    uint64_t v17 = [v16 currentItem];
    [v17 setPreferredForwardBufferDuration:v9];
  }
}

- (void)setPictureInPictureInterrupted:(BOOL)a3
{
  if (self->_pictureInPictureInterrupted != a3)
  {
    self->_pictureInPictureInterrupted = a3;
    if (a3)
    {
      if ([(AVPlayerController *)self isPlaying])
      {
        [(AVPlayerController *)self pauseForAllCoordinatedPlaybackParticipants:0];
      }
    }
  }
}

- (BOOL)isPictureInPictureInterrupted
{
  return self->_pictureInPictureInterrupted;
}

- (BOOL)isPictureInPicturePossible
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self pipActivitySessionIdentifier];

  if (v3) {
    goto LABEL_2;
  }
  if (![(AVPlayerController *)self isPictureInPictureSupported]
    || [(AVPlayerController *)self isPlayingOnExternalScreen])
  {
    goto LABEL_9;
  }
  int64_t v4 = [(AVPlayerController *)self status];
  if (v4 == 1) {
    return v4;
  }
  if (v4 == 2
    && ([(AVPlayerController *)self hasVideo]
     || [(AVPlayerController *)self hasEnabledVideo]))
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_9:
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "yes";
      if ([(AVPlayerController *)self isPictureInPictureSupported]) {
        id v7 = "yes";
      }
      else {
        id v7 = "no";
      }
      if ([(AVPlayerController *)self isPlayingOnExternalScreen]) {
        float v8 = "yes";
      }
      else {
        float v8 = "no";
      }
      int64_t v9 = [(AVPlayerController *)self status];
      if (![(AVPlayerController *)self hasVideo]
        && ![(AVPlayerController *)self hasEnabledVideo])
      {
        int v6 = "no";
      }
      uint64_t v10 = [(AVPlayerController *)self pipActivitySessionIdentifier];
      int v12 = 136316418;
      float v13 = "-[AVPlayerController isPictureInPicturePossible]";
      __int16 v14 = 2080;
      id v15 = v7;
      __int16 v16 = 2080;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      int64_t v19 = v9;
      __int16 v20 = 2080;
      int v21 = v6;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s !isPictureInPicturePossible. supported = %s, isPlayingOnExternalScreen = %s, status = %ld, hasVideo = %s; pip"
        "ActivitySessionIdentifier = %{public}@",
        (uint8_t *)&v12,
        0x3Eu);
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self isExternalPlaybackActive]
    && [(AVPlayerController *)self externalPlaybackType] == 1)
  {
    BOOL v3 = [(AVPlayerController *)self _outputContext];
    int64_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v28 = "-[AVPlayerController _updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded]";
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Using output context %@", buf, 0x16u);
    }

    if ([v3 supportsMultipleOutputDevices])
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      __int16 v18 = v3;
      int v6 = [v3 outputDevices];
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
            id v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) deviceName];
            int v12 = (void *)[v11 copy];
            float v13 = v12;
            if (v12)
            {
              id v14 = v12;
            }
            else
            {
              AVLocalizedString(@"EXTERNAL_PLAYBACK_DEVICE_NAME_NIL");
              id v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v15 = v14;

            [v5 addObject:v15];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v8);
      }

      __int16 v16 = [v5 componentsJoinedByString:@" + "];

      BOOL v3 = v18;
    }
    else
    {
      __int16 v16 = [v3 deviceName];
    }
  }
  else
  {
    __int16 v16 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerController__updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded__block_invoke;
  block[3] = &unk_1E5FC4180;
  objc_copyWeak(&v21, (id *)buf);
  id v20 = v16;
  id v17 = v16;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __79__AVPlayerController__updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setExternalPlaybackAirPlayDeviceLocalizedName:*(void *)(a1 + 32)];
}

- (int64_t)externalPlaybackType
{
  if (![(AVPlayerController *)self isExternalPlaybackActive]
    || ([(AVPlayerController *)self player],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int64_t v4 = [v3 externalPlaybackType],
        v3,
        v4 != 1)
    && v4 != 2)
  {
    if ([(AVPlayerController *)self isPlayingOnSecondScreen]) {
      return 2;
    }
    else {
      return 0;
    }
  }
  return v4;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVPlayerController *)self player];
  [v4 setAllowsExternalPlayback:v3];
}

- (void)_updateMinMaxTimingIfNeeded
{
  if (!self->_hasSetUpSeekableLiveStreamState
    && [(AVPlayerController *)self hasLiveStreamingContent])
  {
    self->_hasSetUpSeekableLiveStreamState = 1;
    [(AVPlayerController *)self updateMinMaxTiming];
  }
}

- (void)updateMinMaxTiming
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (![(AVPlayerController *)self isReadyToPlay]
    || ![(AVPlayerController *)self hasLiveStreamingContent])
  {
    goto LABEL_23;
  }
  BOOL v3 = [(AVPlayerController *)self seekableTimeRanges];
  id v4 = (void *)[v3 count];

  if (!v4)
  {
LABEL_24:
    [(AVPlayerController *)self minTime];
    long long v36 = +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
    goto LABEL_25;
  }
  memset(v45, 0, sizeof(v45));
  long long v44 = 0u;
  id v5 = [(AVPlayerController *)self seekableTimeRanges];
  int v6 = [v5 firstObject];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 CMTimeRangeValue];
  }
  else
  {
    memset(v45, 0, sizeof(v45));
    long long v44 = 0u;
  }

  if ((BYTE12(v44) & 1) == 0
    || (BYTE4(v45[1]) & 1) == 0
    || *((void *)&v45[1] + 1)
    || (*((void *)&v45[0] + 1) & 0x8000000000000000) != 0)
  {
LABEL_23:
    id v4 = 0;
    goto LABEL_24;
  }
  uint64_t v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = CACurrentMediaTime();
    uint64_t v10 = [(AVPlayerController *)self player];
    id v11 = [v10 currentItem];
    [v11 seekableTimeRangesLastModifiedTime];
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v9 - v12;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "Modifying seekableTimeRange by: %f", buf, 0xCu);
  }
  float v13 = [(AVPlayerController *)self minTiming];
  [v13 currentValue];
  double v15 = v14;

  __int16 v16 = [(AVPlayerController *)self maxTiming];
  [v16 currentValue];
  double v18 = v17;

  *(_OWORD *)buf = v44;
  *(void *)&buf[16] = *(void *)&v45[0];
  double Seconds = CMTimeGetSeconds((CMTime *)buf);
  *(_OWORD *)buf = v44;
  *(void *)&buf[16] = *(void *)&v45[0];
  double v20 = CMTimeGetSeconds((CMTime *)buf);
  *(_OWORD *)buf = *(_OWORD *)((char *)v45 + 8);
  *(void *)&buf[16] = *((void *)&v45[1] + 1);
  double v21 = v20 + CMTimeGetSeconds((CMTime *)buf);
  double v22 = CACurrentMediaTime();
  long long v23 = [(AVPlayerController *)self player];
  long long v24 = [v23 currentItem];
  [v24 seekableTimeRangesLastModifiedTime];
  double v26 = v21 + v22 - v25;

  if (LOBYTE(self->_liveStreamMaxTiming)) {
    double v27 = 0.0;
  }
  else {
    double v27 = 1.0;
  }
  id v28 = [(AVPlayerController *)self player];
  __int16 v29 = [v28 currentItem];
  [v29 liveUpdateInterval];
  double v31 = v30;

  BOOL v32 = 1;
  BOOL v33 = 1;
  if (fabs(v31) == INFINITY || v31 <= 1.0) {
    goto LABEL_28;
  }
  if (vabdd_f64(v15, Seconds) <= v31 + 3.0)
  {
    long long v34 = [(AVPlayerController *)self minTiming];
    [v34 rate];
    BOOL v33 = v35 != v27;
  }
  BOOL v32 = vabdd_f64(v18, v26) > v31 + 3.0;
  if (v33 || v32)
  {
LABEL_28:
    +[AVValueTiming currentTimeStamp];
    long long v36 = +[AVValueTiming valueTimingWithAnchorValue:Seconds anchorTimeStamp:v37 rate:v27];
    +[AVValueTiming currentTimeStamp];
    id v4 = +[AVValueTiming valueTimingWithAnchorValue:v26 anchorTimeStamp:v38 rate:1.0];
    uint64_t v39 = _AVLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AVPlayerController updateMinMaxTiming]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3776;
      _os_log_impl(&dword_1B05B7000, v39, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
    }

    BOOL v40 = _AVLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v31;
      _os_log_impl(&dword_1B05B7000, v40, OS_LOG_TYPE_DEFAULT, "segmentDuration: %f", buf, 0xCu);
    }

    uint64_t v41 = _AVLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      [v36 rate];
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = Seconds;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v42;
      __int16 v47 = 2048;
      double v48 = v15;
      __int16 v49 = 2048;
      double v50 = vabdd_f64(v15, Seconds);
      _os_log_impl(&dword_1B05B7000, v41, OS_LOG_TYPE_DEFAULT, "minTimingNeedsUpdate: %d, new minTiming with minTime: %f, rate: %f, old minTime: %f, delta: %f", buf, 0x30u);
    }

    uint64_t v43 = _AVLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = v26;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v18;
      __int16 v47 = 2048;
      double v48 = vabdd_f64(v18, v26);
      _os_log_impl(&dword_1B05B7000, v43, OS_LOG_TYPE_DEFAULT, "maxTimingNeedsUpdate: %d, new maxTiming with maxTime: %f old maxTime: %f, delta: %f", buf, 0x26u);
    }
  }
  else
  {
    long long v36 = [(AVPlayerController *)self minTiming];
    id v4 = [(AVPlayerController *)self maxTiming];
  }
  if (!v36) {
    goto LABEL_24;
  }
LABEL_25:
  if (!v4)
  {
    [(AVPlayerController *)self maxTime];
    id v4 = +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  }
  [(AVPlayerController *)self _setMinTiming:v36 maxTiming:v4];
}

- (void)updateTiming
{
  if ([(AVPlayerController *)self isReadyToPlay]
    && ([(AVPlayerController *)self player],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 currentItem],
        id v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = (OpaqueCMTimebase *)[v4 timebase],
        v4,
        v3,
        v5))
  {
    memset(&v19, 0, sizeof(v19));
    CMTimebaseGetTime(&v19, v5);
    double EffectiveRate = CMTimebaseGetEffectiveRate(v5);
    if (EffectiveRate == 0.0)
    {
      CMTime time = v19;
      double Seconds = CMTimeGetSeconds(&time);
      double v8 = NAN;
      double v9 = 0.0;
    }
    else
    {
      double v11 = EffectiveRate;
      +[AVValueTiming currentTimeStamp];
      double v13 = v12;
      double v14 = [(AVPlayerController *)self player];
      double v15 = [v14 currentItem];
      __int16 v16 = v15;
      if (v15) {
        [v15 currentTime];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      CMTime time = v18;
      double v17 = CMTimeGetSeconds(&time);

      CMTime time = v19;
      double v8 = v13 + fabs((v17 - CMTimeGetSeconds(&time)) / v11);
      double Seconds = v17;
      double v9 = v11;
    }
  }
  else
  {
    double Seconds = NAN;
    double v8 = NAN;
    double v9 = NAN;
  }
  uint64_t v10 = +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", Seconds, v8, v9, *(_OWORD *)&v18.value, v18.epoch);
  [(AVPlayerController *)self setTiming:v10];
}

- (void)seekChapterBackward:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self canSeekChapterBackward])
  {
    memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    id v4 = [(AVPlayerController *)self player];
    id v5 = v4;
    if (v4) {
      [v4 currentTime];
    }
    else {
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v6 = [(AVPlayerController *)self contentChapters];
    uint64_t v7 = [v6 reverseObjectEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        memset(&v26, 0, sizeof(v26));
        [v12 startTime];
        CMTimeMakeWithSeconds(&v26, v13, preferredTimescale.timescale);
        memset(&v25, 0, sizeof(v25));
        [v12 startTime];
        double v15 = v14;
        [v12 duration];
        CMTimeMakeWithSeconds(&v25, v15 + v16 * 0.333333333, preferredTimescale.timescale);
        memset(&v24, 0, sizeof(v24));
        [v12 startTime];
        double v18 = v17;
        [v12 duration];
        CMTimeMakeWithSeconds(&v24, v18 + v19, preferredTimescale.timescale);
        CMTime time1 = preferredTimescale;
        CMTime v23 = v25;
        if (CMTimeCompare(&time1, &v23) >= 1)
        {
          CMTime time1 = preferredTimescale;
          CMTime v23 = v24;
          if (CMTimeCompare(&time1, &v23) < 1) {
            break;
          }
        }
        CMTime time1 = preferredTimescale;
        CMTime v23 = v24;
        if (CMTimeCompare(&time1, &v23) > 0) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v9) {
            goto LABEL_7;
          }
          goto LABEL_18;
        }
      }
      id v20 = v12;
      CMTime time1 = v26;

      if (!v20) {
        return;
      }
      CMTime v26 = time1;
      CMTime v25 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTime v24 = v25;
      [(AVPlayerController *)self seekToCMTime:&v26 toleranceBefore:&v25 toleranceAfter:&v24];
      double v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      BOOL v33 = @"AVPlayerControllerDidSeekChapterChapterKey";
      id v34 = v20;
      double v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      [v21 postNotificationName:@"AVPlayerControllerDidSeekChapterNotification" object:self userInfo:v22];

      uint64_t v7 = v20;
    }
LABEL_18:
  }
}

- (BOOL)canSeekChapterBackward
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self canSeek])
  {
    BOOL v3 = [(AVPlayerController *)self player];
    id v4 = v3;
    if (v3) {
      [v3 currentTime];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CMTime time = v20;
    double Seconds = CMTimeGetSeconds(&time);

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(AVPlayerController *)self contentChapters];
    uint64_t v5 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v17;
      double v9 = floor(Seconds * 1000000.0);
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v11 startTime];
          double v13 = v12;
          [v11 duration];
          if (v9 > floor((v13 + v14 * 0.333333333) * 1000000.0))
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v5 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)seekChapterForward:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self canSeekChapterForward])
  {
    memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    id v4 = [(AVPlayerController *)self player];
    uint64_t v5 = v4;
    if (v4) {
      [v4 currentTime];
    }
    else {
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v6 = [(AVPlayerController *)self contentChapters];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        memset(&v18, 0, sizeof(v18));
        [v11 startTime];
        CMTimeMakeWithSeconds(&v18, v12, preferredTimescale.timescale);
        CMTime time1 = preferredTimescale;
        CMTime time2 = v18;
        if (CMTimeCompare(&time1, &time2) < 0) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
      id v13 = v11;
      CMTime time1 = v18;

      if (!v13) {
        return;
      }
      CMTime v18 = time1;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      CMTime v16 = time2;
      [(AVPlayerController *)self seekToCMTime:&v18 toleranceBefore:&time2 toleranceAfter:&v16];
      double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      CMTime v25 = @"AVPlayerControllerDidSeekChapterChapterKey";
      id v26 = v13;
      double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v14 postNotificationName:@"AVPlayerControllerDidSeekChapterNotification" object:self userInfo:v15];

      int v6 = v13;
    }
LABEL_16:
  }
}

- (BOOL)canSeekChapterForward
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self canSeek])
  {
    BOOL v3 = [(AVPlayerController *)self player];
    id v4 = v3;
    if (v3) {
      [v3 currentTime];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    CMTime time = v17;
    double Seconds = CMTimeGetSeconds(&time);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [(AVPlayerController *)self contentChapters];
    uint64_t v5 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v14;
      double v9 = floor(Seconds * 1000000.0);
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) startTime];
          if (v9 < floor(v11 * 1000000.0))
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v5 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)seekToChapter:(id)a3
{
  [a3 startTime];

  -[AVPlayerController seekToTime:](self, "seekToTime:");
}

- (void)endScrubbing:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    double v9 = "-[AVPlayerController endScrubbing:]";
    __int16 v10 = 1024;
    int v11 = 3562;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  int64_t scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount > 0) {
    goto LABEL_7;
  }
  int v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8) = 0;
    _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Error: Calls to endScrubbing: must be balanced with calls to beginScrubbing:", (uint8_t *)&v8, 2u);
  }

  int64_t scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount >= 1)
  {
LABEL_7:
    int64_t v7 = scrubbingCount - 1;
    self->_int64_t scrubbingCount = v7;
    if (!v7) {
      [(AVPlayerController *)self endScrubbing];
    }
  }
}

- (void)beginScrubbing:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int64_t v7 = "-[AVPlayerController beginScrubbing:]";
    __int16 v8 = 1024;
    int v9 = 3550;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  int64_t scrubbingCount = self->_scrubbingCount;
  if (!scrubbingCount)
  {
    [(AVPlayerController *)self beginScrubbing];
    int64_t scrubbingCount = self->_scrubbingCount;
  }
  self->_int64_t scrubbingCount = scrubbingCount + 1;
}

- (void)gotoEndOfSeekableRanges:(id)a3
{
  long long v7 = *MEMORY[0x1E4F1FA10];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  long long v5 = v7;
  uint64_t v6 = v8;
  long long v3 = v7;
  uint64_t v4 = v8;
  [(AVPlayerController *)self seekToCMTime:&v7 toleranceBefore:&v5 toleranceAfter:&v3];
}

- (void)skipBackwardThirtySeconds:(id)a3
{
  uint64_t v4 = [(AVPlayerController *)self player];
  id v11 = [v4 currentItem];

  if (v11)
  {
    long long v5 = [(AVPlayerController *)self minTiming];

    if (v5)
    {
      uint64_t v6 = [(AVPlayerController *)self minTiming];
      [v6 currentValue];
      double v8 = v7;

      if ([(AVPlayerController *)self isSeeking]) {
        [(AVPlayerController *)self seekToTime];
      }
      else {
        [(AVPlayerController *)self currentTime];
      }
      double v10 = v9 + -30.0;
      if (v8 > v10) {
        double v10 = v8;
      }
      [(AVPlayerController *)self seekToTime:v10];
    }
  }
}

- (void)seekOrStepByFrameCount:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = self;
    [(AVPlayerController *)self pauseForAllCoordinatedPlaybackParticipants:1];
    long long v5 = [(AVPlayerController *)v4 player];
    uint64_t v6 = [v5 currentItem];

    if (a3 < 1)
    {
      if ([v6 canStepBackward])
      {
        double v7 = v31;
        if (v6)
        {
          [v6 reversePlaybackEndTime];
          if (v31[12])
          {
            [v6 reversePlaybackEndTime];
            CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if (CMTimeCompare(&time1, &time2))
            {
LABEL_21:
              memset(&v29, 0, sizeof(v29));
LABEL_22:
              [v6 currentTime];
LABEL_23:
              memset(time, 0, sizeof(time));
              long long v37 = 0u;
              long long v38 = 0u;
              long long v13 = [v6 tracks];
              uint64_t v14 = [v13 countByEnumeratingWithState:time objects:&time2 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                CMTime v25 = v4;
                uint64_t v16 = **(void **)&time[16];
                uint64_t v17 = *MEMORY[0x1E4F15C18];
                do
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (**(void **)&time[16] != v16) {
                      objc_enumerationMutation(v13);
                    }
                    long long v19 = *(void **)(*(void *)&time[8] + 8 * i);
                    uint64_t v20 = [v19 assetTrack];
                    if ([v19 isEnabled])
                    {
                      long long v21 = [v20 mediaType];
                      if ([v21 isEqualToString:v17])
                      {
                        char v22 = [v20 isEnabled];

                        if (v22) {
                          goto LABEL_36;
                        }
                      }
                      else
                      {
                      }
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:time objects:&time2 count:16];
                }
                while (v15);
                uint64_t v20 = 0;
LABEL_36:
                uint64_t v4 = v25;
              }
              else
              {
                uint64_t v20 = 0;
              }

              memset(&time2, 0, sizeof(time2));
              if (!v20
                || (*(CMTime *)CMTime time = v29,
                    objc_msgSend(v20, "avkit_timeForFrameSteppedByFrameCount:fromFrameAtTime:", a3, time),
                    (time2.flags & 0x1D) != 1))
              {
                CMTimeMake(&rhs, a3, 4);
                CMTime lhs = v29;
                CMTimeAdd((CMTime *)time, &lhs, &rhs);
                CMTime time2 = *(CMTime *)time;
              }
              uint64_t v23 = _AVLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(CMTime *)CMTime time = time2;
                Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
                *(_DWORD *)CMTime time = 136315394;
                *(void *)&time[4] = "-[AVPlayerController seekOrStepByFrameCount:]";
                *(_WORD *)&time[12] = 2048;
                *(Float64 *)&time[14] = Seconds;
                _os_log_impl(&dword_1B05B7000, v23, OS_LOG_TYPE_DEFAULT, "%s sampleBasedSeekTarget: %f", time, 0x16u);
              }

              *(CMTime *)CMTime time = time2;
              CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
              CMTime v26 = lhs;
              [(AVPlayerController *)v4 seekToCMTime:time toleranceBefore:&lhs toleranceAfter:&v26];

              goto LABEL_44;
            }
          }
LABEL_16:
          [v6 stepByCount:a3];
          id v11 = _AVLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(time2.value) = 136315394;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[AVPlayerController seekOrStepByFrameCount:]";
            LOWORD(time2.flags) = 2048;
            *(void *)((char *)&time2.flags + 2) = a3;
            _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s stepByCount: %ld", (uint8_t *)&time2, 0x16u);
          }

LABEL_44:
          return;
        }
LABEL_15:
        void *v7 = 0;
        v7[1] = 0;
        v7[2] = 0;
        goto LABEL_16;
      }
    }
    else if ([v6 canStepForward])
    {
      double v7 = v34;
      if (v6)
      {
        [v6 forwardPlaybackEndTime];
        if (v34[12])
        {
          [v6 forwardPlaybackEndTime];
          double v8 = [(AVPlayerController *)v4 player];
          double v9 = [v8 currentItem];
          double v10 = v9;
          if (v9) {
            [v9 duration];
          }
          else {
            memset(&v32, 0, sizeof(v32));
          }
          int32_t v12 = CMTimeCompare(&v33, &v32);

          if (v12) {
            goto LABEL_21;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    memset(&v29, 0, sizeof(v29));
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
}

- (void)seekFrameBackward:(id)a3
{
  if ([(AVPlayerController *)self canSeekFrameBackward])
  {
    [(AVPlayerController *)self seekOrStepByFrameCount:-1];
  }
}

- (BOOL)canSeekFrameBackward
{
  if ([(AVPlayerController *)self isAtMinTime]) {
    return 0;
  }

  return [(AVPlayerController *)self canSeek];
}

- (void)seekFrameForward:(id)a3
{
  if ([(AVPlayerController *)self canSeekFrameForward])
  {
    [(AVPlayerController *)self seekOrStepByFrameCount:1];
  }
}

- (BOOL)canSeekFrameForward
{
  if ([(AVPlayerController *)self isAtMaxTime]) {
    return 0;
  }

  return [(AVPlayerController *)self canSeek];
}

- (void)seekToEnd:(id)a3
{
}

- (void)seekToBeginning:(id)a3
{
}

- (void)endScanningBackward:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315394;
    id v11 = "-[AVPlayerController endScanningBackward:]";
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningBackward: %d", buf, 0x12u);
  }

  if (BYTE5(self->_toleranceAfter.epoch))
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v8 = @"AVPlayerControllerScanningDirectionKey";
    double v9 = &unk_1F094A1A8;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v6 postNotificationName:@"AVPlayerControllerDidEndScanningNotification" object:self userInfo:v7];

    BYTE5(self->_toleranceAfter.epoch) = 0;
    [(AVPlayerController *)self setRate:*(double *)&self->_scanningCount];
    [(AVPlayerController *)self resumePlaybackCoordinatorIfSuspended];
  }
}

- (void)_updateScanningBackwardRate
{
  [(AVPlayerController *)self rate];
  if (v3 == 0.0)
  {
    [(AVPlayerController *)self setRate:-0.5];
    return;
  }
  long double v4 = v3;
  BOOL v5 = [(AVPlayerController *)self canScanBackward];
  double v6 = 2.0;
  if (v5) {
    double v6 = 60.0;
  }
  if (v6 > -v4)
  {
    if (v4 >= 4.0)
    {
      double v8 = ceil(log2(v4));
      double v9 = -1.0;
    }
    else
    {
      double v7 = 2.0;
      if (v4 > -2.0)
      {
LABEL_13:
        [(AVPlayerController *)self setRate:-v7];
        goto LABEL_14;
      }
      double v8 = floor(log2(-v4));
      double v9 = 1.0;
    }
    double v7 = exp2(v8 + v9);
    goto LABEL_13;
  }
LABEL_14:
  double v10 = [(AVPlayerController *)self scanningDelays];
  if ((unint64_t)[v10 count] > *(void *)&self->_isScanningForward)
  {
    id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:");
    [v11 doubleValue];
    double v13 = v12;

    ++*(void *)&self->_isScanningForward;
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AVPlayerController__updateScanningBackwardRate__block_invoke;
    block[3] = &unk_1E5FC4698;
    void block[4] = self;
    dispatch_after(v14, MEMORY[0x1E4F14428], block);
  }
}

unsigned char *__49__AVPlayerController__updateScanningBackwardRate__block_invoke(uint64_t a1)
{
  CGSize result = *(unsigned char **)(a1 + 32);
  if (result[221]) {
    return (unsigned char *)[result _updateScanningBackwardRate];
  }
  return result;
}

- (void)beginScanningBackward:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = BYTE4(self->_toleranceAfter.epoch);
    int v6 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315650;
    double v13 = "-[AVPlayerController beginScanningBackward:]";
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d isScanningBackward: %d", buf, 0x18u);
  }

  if (!BYTE5(self->_toleranceAfter.epoch) && !BYTE4(self->_toleranceAfter.epoch))
  {
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v10 = @"AVPlayerControllerScanningDirectionKey";
    id v11 = &unk_1F094A1A8;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"AVPlayerControllerDidBeginScanningNotification" object:self userInfo:v8];

    *(void *)&self->_isScanningForward = 0;
    BYTE5(self->_toleranceAfter.epoch) = 1;
    [(AVPlayerController *)self rate];
    self->_scanningCount = v9;
    [(AVPlayerController *)self suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary];
    [(AVPlayerController *)self _updateScanningBackwardRate];
  }
}

- (void)scanBackward:(id)a3
{
  if ([(AVPlayerController *)self canScanBackward])
  {
    double v4 = -32.0;
  }
  else
  {
    [(AVPlayerController *)self defaultPlaybackRate];
    double v4 = -v5;
  }
  [(AVPlayerController *)self rate];
  long double v7 = v6;
  double v8 = 2.0;
  if (v7 > v4)
  {
    if (v7 >= 4.0)
    {
      double v9 = ceil(log2(v7));
      double v10 = -1.0;
    }
    else
    {
      if (v7 > -2.0) {
        goto LABEL_10;
      }
      double v9 = floor(log2(-v7));
      double v10 = 1.0;
    }
    double v8 = exp2(v9 + v10);
  }
LABEL_10:
  double v11 = -v8;

  [(AVPlayerController *)self setRate:v11];
}

- (BOOL)canScanBackward
{
  double v3 = [(AVPlayerController *)self player];
  double v4 = [v3 currentItem];
  if ([v4 canPlayFastReverse]
    && ![(AVPlayerController *)self touchBarRequiresLinearPlayback])
  {
    BOOL v5 = ![(AVPlayerController *)self isPictureInPictureInterrupted];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)endScanningForward:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = BYTE4(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315394;
    double v11 = "-[AVPlayerController endScanningForward:]";
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d", buf, 0x12u);
  }

  if (BYTE4(self->_toleranceAfter.epoch))
  {
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v8 = @"AVPlayerControllerScanningDirectionKey";
    double v9 = &unk_1F094A190;
    long double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v6 postNotificationName:@"AVPlayerControllerDidEndScanningNotification" object:self userInfo:v7];

    BYTE4(self->_toleranceAfter.epoch) = 0;
    [(AVPlayerController *)self setRate:*(double *)&self->_scanningCount];
    [(AVPlayerController *)self resumePlaybackCoordinatorIfSuspended];
  }
}

- (void)_updateScanningForwardRate
{
  [(AVPlayerController *)self rate];
  if (v3 == 0.0)
  {
    [(AVPlayerController *)self setRate:0.5];
    return;
  }
  long double v4 = v3;
  BOOL v5 = [(AVPlayerController *)self canScanForward];
  double v6 = 60.0;
  if (!v5) {
    double v6 = 2.0;
  }
  if (v4 < v6)
  {
    if (v4 <= -4.0)
    {
      double v8 = ceil(log2(-v4));
      double v9 = -1.0;
    }
    else
    {
      double v7 = 2.0;
      if (v4 < 2.0)
      {
LABEL_13:
        [(AVPlayerController *)self setRate:v7];
        goto LABEL_14;
      }
      double v8 = floor(log2(v4));
      double v9 = 1.0;
    }
    double v7 = exp2(v8 + v9);
    goto LABEL_13;
  }
LABEL_14:
  double v10 = [(AVPlayerController *)self scanningDelays];
  if ((unint64_t)[v10 count] > *(void *)&self->_isScanningForward)
  {
    double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:");
    [v11 doubleValue];
    double v13 = v12;

    ++*(void *)&self->_isScanningForward;
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AVPlayerController__updateScanningForwardRate__block_invoke;
    block[3] = &unk_1E5FC4698;
    void block[4] = self;
    dispatch_after(v14, MEMORY[0x1E4F14428], block);
  }
}

unsigned char *__48__AVPlayerController__updateScanningForwardRate__block_invoke(uint64_t a1)
{
  CGSize result = *(unsigned char **)(a1 + 32);
  if (result[220]) {
    return (unsigned char *)[result _updateScanningForwardRate];
  }
  return result;
}

- (void)beginScanningForward:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = BYTE4(self->_toleranceAfter.epoch);
    int v6 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315650;
    double v13 = "-[AVPlayerController beginScanningForward:]";
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d    isScanningBackward: %d", buf, 0x18u);
  }

  if (!BYTE4(self->_toleranceAfter.epoch) && !BYTE5(self->_toleranceAfter.epoch))
  {
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v10 = @"AVPlayerControllerScanningDirectionKey";
    double v11 = &unk_1F094A190;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v7 postNotificationName:@"AVPlayerControllerDidBeginScanningNotification" object:self userInfo:v8];

    *(void *)&self->_isScanningForward = 0;
    BYTE4(self->_toleranceAfter.epoch) = 1;
    [(AVPlayerController *)self rate];
    self->_scanningCount = v9;
    [(AVPlayerController *)self suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary];
    [(AVPlayerController *)self _updateScanningForwardRate];
  }
}

- (void)scanForward:(id)a3
{
  if ([(AVPlayerController *)self canScanForward])
  {
    double v4 = 32.0;
  }
  else
  {
    [(AVPlayerController *)self defaultPlaybackRate];
    double v4 = v5;
  }
  [(AVPlayerController *)self rate];
  double v7 = 2.0;
  if (v6 < v4)
  {
    if (v6 <= -4.0)
    {
      double v8 = ceil(log2(-v6));
      double v9 = -1.0;
    }
    else
    {
      double v7 = 2.0;
      if (v6 < 2.0) {
        goto LABEL_10;
      }
      double v8 = floor(log2(v6));
      double v9 = 1.0;
    }
    double v7 = exp2(v8 + v9);
  }
LABEL_10:

  [(AVPlayerController *)self setRate:v7];
}

- (BOOL)canScanForward
{
  double v3 = [(AVPlayerController *)self player];
  double v4 = [v3 currentItem];
  if ([v4 canPlayFastForward]
    && ![(AVPlayerController *)self touchBarRequiresLinearPlayback])
  {
    BOOL v5 = ![(AVPlayerController *)self isPictureInPictureInterrupted];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  if ([(AVPlayerController *)self isSeeking])
  {
    [(AVPlayerController *)self seekToTime];
    [(AVPlayerController *)self seekToTime];
    double v10 = v9;
  }
  else
  {
    double v11 = [(AVPlayerController *)self timing];
    [v11 currentValue];
    double v10 = v12;
  }
  double v13 = v10 + a3;
  [(AVPlayerController *)self minTime];
  double v14 = v13;
  if (v15 > v13)
  {
    [(AVPlayerController *)self minTime];
    double v14 = v16;
  }
  [(AVPlayerController *)self maxTime];
  if (v14 >= v17)
  {
    [(AVPlayerController *)self maxTime];
    goto LABEL_10;
  }
  [(AVPlayerController *)self minTime];
  double v18 = v13;
  if (v19 > v13)
  {
    [(AVPlayerController *)self minTime];
LABEL_10:
    double v18 = v20;
  }
  [(AVPlayerController *)self seekToTime];
  if (v18 != v21 && (v18 < v18 - a4 || v18 > v18 + a5)) {
    [(AVPlayerController *)self _cancelPendingSeeksIfNeeded];
  }
  uint64_t v23 = [(AVPlayerController *)self timing];
  [v23 currentValue];
  double v25 = v24;

  [(AVPlayerController *)self _adjustedSeekTimeFromTime:v25 toTime:v13];
  if (v13 == v26) {
    double v26 = v13;
  }

  [(AVPlayerController *)self seekToTime:v26 toleranceBefore:a4 toleranceAfter:a5];
}

- (void)seekByTimeInterval:(double)a3
{
}

- (void)actuallySeekToTime
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self canSeek])
  {
    [(AVPlayerController *)self setSeekingInternal:1];
    double v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [(AVPlayerController *)self seekToTimeInternal];
      Float64 Seconds = CMTimeGetSeconds(&time);
      CMTime v17 = *(CMTime *)(&self->_pendingSeek + 4);
      Float64 v5 = CMTimeGetSeconds(&v17);
      CMTime v17 = *(CMTime *)((char *)&self->_toleranceBefore.epoch + 4);
      Float64 v6 = CMTimeGetSeconds(&v17);
      LODWORD(v17.value) = 136315906;
      *(CMTimeValue *)((char *)&v17.value + 4) = (CMTimeValue)"-[AVPlayerController actuallySeekToTime]";
      LOWORD(v17.flags) = 2048;
      *(Float64 *)((char *)&v17.flags + 2) = Seconds;
      HIWORD(v17.epoch) = 2048;
      Float64 v18 = v5;
      __int16 v19 = 2048;
      Float64 v20 = v6;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s time: %f toleranceBefore: %f toleranceAfter: %f", (uint8_t *)&v17, 0x2Au);
    }

    objc_initWeak(&location, self);
    double v7 = [(AVPlayerController *)self player];
    [(AVPlayerController *)self seekToTimeInternal];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_376;
    v10[3] = &unk_1E5FC4220;
    objc_copyWeak(&v11, &location);
    CMTime v17 = *(CMTime *)(&self->_pendingSeek + 4);
    long long v8 = *(_OWORD *)((char *)&self->_toleranceBefore.epoch + 4);
    uint64_t v9 = *(void *)&self->_toleranceAfter.flags;
    [v7 seekToTime:v12 toleranceBefore:&v17 toleranceAfter:&v8 completionHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak((id *)&v17, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v16, (id *)&v17);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)&v17);
  }
}

void __40__AVPlayerController_actuallySeekToTime__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSeeking:0];
}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_376(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    Float64 v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      Float64 v6 = "NO";
      if (a2) {
        Float64 v6 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      id v11 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "Seek completed: %s", buf, 0xCu);
    }

    double v7 = WeakRetained[20];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_377;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v9, v3);
    dispatch_async(v7, block);
    objc_destroyWeak(&v9);
  }
}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_377(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[168])
    {
      WeakRetained[168] = 0;
      [WeakRetained actuallySeekToTime];
    }
    else
    {
      [WeakRetained setSeekingInternal:0];
      long long v8 = *MEMORY[0x1E4F1F9F8];
      long long v5 = v8;
      uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      uint64_t v4 = v9;
      [v3 setSeekToTimeInternal:&v8];
      *(_OWORD *)(v3 + 172) = v5;
      *(void *)(v3 + 188) = v4;
      *(_OWORD *)(v3 + 196) = v5;
      *(void *)(v3 + 212) = v4;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_2;
      block[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v7, v1);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v7);
    }
  }
}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setSeeking:0];
    [v2 _updateRateForScrubbingAndSeeking];
    id WeakRetained = v2;
  }
}

- (void)throttledSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  if (![(AVPlayerController *)self canSeek]) {
    return;
  }
  memset(&v37, 0, sizeof(v37));
  [(AVPlayerController *)self minTime];
  CMTimeMakeWithSeconds(&v37, v9, 60000);
  memset(&v36, 0, sizeof(v36));
  [(AVPlayerController *)self maxTime];
  CMTimeMakeWithSeconds(&v36, v10, 60000);
  if ([(AVPlayerController *)self isStreaming]
    && ![(AVPlayerController *)self hasLiveStreamingContent])
  {
    id v11 = [(AVPlayerController *)self seekableTimeRanges];
    uint64_t v12 = [v11 firstObject];
    double v13 = v12;
    if (v12) {
      [v12 CMTimeRangeValue];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRangeGetEnd(&time2, &range);
    CMTime time1 = v36;
    CMTimeMinimum(&time, &time1, &time2);
    CMTime v36 = time;
  }
  BOOL v14 = [(AVPlayerController *)self hasSeekableLiveStreamingContent];
  uint64_t v15 = MEMORY[0x1E4F1FA48];
  if (v14)
  {
    long long v16 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&a5->var0 = *MEMORY[0x1E4F1FA48];
    int64_t v17 = *(void *)(v15 + 16);
    a5->int64_t var3 = v17;
    *(_OWORD *)&a4->var0 = v16;
    a4->int64_t var3 = v17;
  }
  CMTime time = (CMTime)*a3;
  CMTime time1 = v37;
  if (CMTimeCompare(&time, &time1) < 0 || (~a3->var2 & 9) == 0)
  {
    *(CMTime *)a3 = v37;
    Float64 v18 = a4;
LABEL_20:
    *(_OWORD *)&v18->var0 = *(_OWORD *)v15;
    v18->int64_t var3 = *(void *)(v15 + 16);
    unsigned int var2 = a3->var2;
    goto LABEL_21;
  }
  CMTime time = (CMTime)*a3;
  CMTime time1 = v36;
  if (CMTimeCompare(&time, &time1) > 0 || (unsigned int var2 = a3->var2, (~var2 & 5) == 0))
  {
    if ([(AVPlayerController *)self hasSeekableLiveStreamingContent]
      || ![(AVPlayerController *)self hasLiveStreamingContent])
    {
      *(CMTime *)a3 = v36;
    }
    else
    {
      Float64 v20 = [(AVPlayerController *)self maxTiming];
      [v20 currentValue];
      CMTimeMakeWithSeconds(&time, v21, 60000);
      *(CMTime *)a3 = time;
    }
    Float64 v18 = a5;
    goto LABEL_20;
  }
LABEL_21:
  if (var2)
  {
    CMTime time = (CMTime)*a3;
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    double Seconds = NAN;
  }
  [(AVPlayerController *)self setSeeking:1];
  [(AVPlayerController *)self setSeekToTime:Seconds];
  objc_initWeak((id *)&time, self);
  seekQueue = self->_seekQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __73__AVPlayerController_throttledSeekToTime_toleranceBefore_toleranceAfter___block_invoke;
  v24[3] = &unk_1E5FC4248;
  objc_copyWeak(&v25, (id *)&time);
  long long v26 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v28 = *(_OWORD *)&a4->var0;
  int64_t v29 = a4->var3;
  long long v30 = *(_OWORD *)&a5->var0;
  int64_t v31 = a5->var3;
  dispatch_async(seekQueue, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)&time);
}

void __73__AVPlayerController_throttledSeekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v6 = *(_OWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 56);
    [WeakRetained setSeekToTimeInternal:&v6];
    long long v4 = *(_OWORD *)(a1 + 64);
    *(void *)(v3 + 188) = *(void *)(a1 + 80);
    *(_OWORD *)(v3 + 172) = v4;
    long long v5 = *(_OWORD *)(a1 + 88);
    *(void *)(v3 + 212) = *(void *)(a1 + 104);
    *(_OWORD *)(v3 + 196) = v5;
    if ([v3 isSeekingInternal]) {
      v3[168] = 1;
    }
    else {
      [v3 actuallySeekToTime];
    }
  }
}

- (void)seekToCMTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a5;
  [(AVPlayerController *)self throttledSeekToTime:&v7 toleranceBefore:&v6 toleranceAfter:&v5];
}

- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  AVTimeIntervalToCMTime(&v10, a3);
  AVTimeIntervalToCMTime(&v9, a4);
  AVTimeIntervalToCMTime(&v8, a5);
  [(AVPlayerController *)self seekToCMTime:&v10 toleranceBefore:&v9 toleranceAfter:&v8];
}

- (void)resumePlaybackCoordinatorIfSuspended
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = [(AVPlayerController *)self scrubCoordinatorSuspension];

  if (v3)
  {
    long long v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[AVPlayerController resumePlaybackCoordinatorIfSuspended]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Ending coordination suspension.", buf, 0xCu);
    }

    memset(buf, 0, sizeof(buf));
    uint64_t v11 = 0;
    [(AVPlayerController *)self seekToTimeInternal];
    if ((buf[12] & 1) == 0)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(AVPlayerController *)self player];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = v5;
      if (v5)
      {
        [v5 currentTime];
      }
      else
      {
        long long v8 = 0uLL;
        uint64_t v9 = 0;
      }
      *(_OWORD *)buf = v8;
      uint64_t v11 = v9;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(AVPlayerController *)self scrubCoordinatorSuspension];
    long long v8 = *(_OWORD *)buf;
    uint64_t v9 = v11;
    [v7 endProposingNewTime:&v8];

    [(AVPlayerController *)self setScrubCoordinatorSuspension:0];
  }
}

- (void)suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = [(AVPlayerController *)self scrubCoordinatorSuspension];

  if (!v3)
  {
    long long v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s Starting coordination suspension.", (uint8_t *)&v8, 0xCu);
    }

    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(AVPlayerController *)self player];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v5 _playbackCoordinatorWithoutTriggeringFullSetup];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [v6 beginSuspensionForReason:*MEMORY[0x1E4F15A20]];
    [(AVPlayerController *)self setScrubCoordinatorSuspension:v7];
  }
}

- (void)endScrubbing
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = "-[AVPlayerController endScrubbing]";
    __int16 v15 = 1024;
    int v16 = 2984;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  [(AVPlayerController *)self setScrubbing:0];
  [(AVPlayerController *)self _updateRateForScrubbingAndSeeking];
  long long v4 = +[AVKitGlobalSettings shared];
  char v5 = [v4 showsTVControls];

  if ((v5 & 1) == 0)
  {
    [(AVPlayerController *)self initialScrubbingTime];
    double v7 = v6;
    [(AVPlayerController *)self currentTime];
    double v9 = v8;
    if ([(AVPlayerController *)self isSeekingInternal])
    {
      [(AVPlayerController *)self seekToTimeInternal];
      double Seconds = CMTimeGetSeconds(&time);
      if (fabs(Seconds) != INFINITY) {
        double v9 = Seconds;
      }
    }
    [(AVPlayerController *)self _adjustedSeekTimeFromTime:v7 toTime:v9];
    if (fabs(v11) != INFINITY && v11 != v9) {
      -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:");
    }
  }
  [(AVPlayerController *)self resumePlaybackCoordinatorIfSuspended];
}

- (void)beginScrubbing
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    char v5 = "-[AVPlayerController beginScrubbing]";
    __int16 v6 = 1024;
    int v7 = 2967;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  [(AVPlayerController *)self setScrubbing:1];
  [(AVPlayerController *)self suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary];
  [(AVPlayerController *)self _updateRateForScrubbingAndSeeking];
  [(AVPlayerController *)self _cancelPendingSeeksIfNeeded];
  [(AVPlayerController *)self currentTime];
  -[AVPlayerController setInitialScrubbingTime:](self, "setInitialScrubbingTime:");
}

- (void)seekToTime:(double)a3
{
}

- (BOOL)canSeek
{
  int32_t v3 = [(AVPlayerController *)self isReadyToPlay];
  if (!v3) {
    return v3;
  }
  if ([(AVPlayerController *)self touchBarRequiresLinearPlayback]
    || [(AVPlayerController *)self isPictureInPictureInterrupted])
  {
    goto LABEL_4;
  }
  if ([(AVPlayerController *)self hasLiveStreamingContent])
  {
    LOBYTE(v3) = [(AVPlayerController *)self hasSeekableLiveStreamingContent];
    return v3;
  }
  memset(v16, 0, sizeof(v16));
  long long v15 = 0u;
  int v4 = [(AVPlayerController *)self seekableTimeRanges];
  char v5 = [v4 firstObject];
  __int16 v6 = v5;
  if (v5)
  {
    [v5 CMTimeRangeValue];
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    long long v15 = 0u;
  }

  int v7 = HIDWORD(v15);
  if ((BYTE12(v15) & 1) == 0)
  {
LABEL_14:
    LOBYTE(v3) = 1;
    return v3;
  }
  int v8 = DWORD1(v16[1]);
  int v9 = BYTE4(v16[1]) & 1;
  uint64_t v10 = *((void *)&v16[1] + 1);
  uint64_t v11 = *((void *)&v16[0] + 1);
  if ((BYTE4(v16[1]) & 1) != 0 && !*((void *)&v16[1] + 1) && (*((void *)&v16[0] + 1) & 0x8000000000000000) == 0)
  {
    CMTime time1 = *(CMTime *)((char *)v16 + 8);
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    int32_t v3 = CMTimeCompare(&time1, &v13);
    if (!v3) {
      return v3;
    }
    int v7 = HIDWORD(v15);
    if ((BYTE12(v15) & 1) == 0) {
      goto LABEL_14;
    }
    int v8 = DWORD1(v16[1]);
    uint64_t v10 = *((void *)&v16[1] + 1);
    uint64_t v11 = *((void *)&v16[0] + 1);
    int v9 = BYTE4(v16[1]) & 1;
  }
  LOBYTE(v3) = 1;
  if (v9 && !v10 && (v11 & 0x8000000000000000) == 0)
  {
    if ((~v7 & 0x11) == 0)
    {
LABEL_4:
      LOBYTE(v3) = 0;
      return v3;
    }
    LOBYTE(v3) = (~v8 & 0x11) != 0;
  }
  return v3;
}

- (int64_t)timeControlStatus
{
  if (-[AVPlayerController _mainPlayerIsWaitingForInterstitialPlayback](self))
  {
    int32_t v3 = [(AVPlayerController *)self interstitialController];
    int v4 = [v3 interstitialPlayer];
    int64_t v5 = [v4 timeControlStatus];
  }
  else
  {
    int32_t v3 = [(AVPlayerController *)self player];
    int64_t v5 = [v3 timeControlStatus];
  }

  return v5;
}

- (id)currentEnabledAssetTrackForMediaType:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = v4;
  if ((id)*MEMORY[0x1E4F15BA8] == v4)
  {
    uint64_t v7 = [(AVPlayerController *)self currentAudioMediaSelectionOption];
  }
  else
  {
    if ((id)*MEMORY[0x1E4F15C18] != v4)
    {
      __int16 v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(AVPlayerController *)self currentVideoMediaSelectionOption];
  }
  __int16 v6 = (void *)v7;
LABEL_7:
  int v8 = [v6 track];
  int v9 = [(AVPlayerController *)self player];
  uint64_t v10 = [v9 currentItem];
  uint64_t v11 = [v10 tracks];

  if (v8)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          Float64 v18 = [v17 assetTrack];
          if (v18 == v8)
          {
            char v19 = [v17 isEnabled];

            if (v19)
            {
              id v26 = v8;
              goto LABEL_33;
            }
          }
          else
          {
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
  if ([(AVPlayerController *)self isStreaming])
  {
    long long v30 = v6;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = v11;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
LABEL_22:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v31 + 1) + 8 * v24);
        id v26 = [v25 assetTrack];
        if ([v25 isEnabled])
        {
          long long v27 = [v26 mediaType];

          if (v27 == v5) {
            break;
          }
        }

        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v22) {
            goto LABEL_22;
          }
          goto LABEL_29;
        }
      }

      __int16 v6 = v30;
      if (v26) {
        goto LABEL_34;
      }
    }
    else
    {
LABEL_29:

      __int16 v6 = v30;
    }
  }
  id v12 = [(AVPlayerController *)self currentAssetIfReady];
  long long v28 = objc_msgSend(v12, "avkit_tracksWithMediaType:", v5);
  id v26 = [v28 firstObject];

LABEL_33:
LABEL_34:

  return v26;
}

- (void)_updatePlayingOnMatchPointDeviceIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int32_t v3 = [(AVPlayerController *)self _outputContext];
  id v4 = [v3 outputDevices];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) deviceSubType];
        if (v10 <= 0x11 && ((1 << v10) & 0x30800) != 0) {
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVPlayerController__updatePlayingOnMatchPointDeviceIfNeeded__block_invoke;
  block[3] = &unk_1E5FC46C0;
  objc_copyWeak(&v13, &location);
  char v14 = v7 & 1;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__AVPlayerController__updatePlayingOnMatchPointDeviceIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPlayingOnMatchPointDevice:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = v5;
  if (!self->_backgroundQueue)
  {
    objc_initWeak(&location, self);
    goto LABEL_7;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:");
  double v8 = v7;
  objc_initWeak(&location, self);
  if (v8 > 0.25)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_backgroundQueue, v6);
    internalDelegate = self->_internalDelegate;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke;
    block[3] = &unk_1E5FC4180;
    id v19 = v4;
    objc_copyWeak(&v20, &location);
    dispatch_async(internalDelegate, block);
    objc_destroyWeak(&v20);

    goto LABEL_8;
  }
  if (!self->_lastTimePlayingOnMatchPointDeviceWasUpdated)
  {
    if (self->_backgroundQueue)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:");
      double v10 = 0.25 - v9;
    }
    else
    {
      double v10 = 0.0;
    }
    double v12 = fmax(v10, 0.01);
    id v13 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _OWORD v16[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_2;
    v16[3] = &unk_1E5FC4480;
    objc_copyWeak(&v17, &location);
    char v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:v16 block:v12];
    lastTimePlayingOnMatchPointDeviceWasUpdated = self->_lastTimePlayingOnMatchPointDeviceWasUpdated;
    self->_lastTimePlayingOnMatchPointDeviceWasUpdated = v14;

    objc_destroyWeak(&v17);
  }
LABEL_8:
  objc_destroyWeak(&location);
}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextID];
  int32_t v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _outputContext];
  uint64_t v6 = [v5 contextID];
  int v7 = [v2 isEqualToString:v6];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v3);
    [v8 _updatePlayingOnMatchPointDeviceIfNeeded];
  }
}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int32_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[42];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_3;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [MEMORY[0x1E4F1C9C8] now];
    id v2 = (void *)*((void *)WeakRetained + 43);
    *((void *)WeakRetained + 43) = v1;

    [WeakRetained _updatePlayingOnMatchPointDeviceIfNeeded];
    [*((id *)WeakRetained + 44) invalidate];
    int32_t v3 = (void *)*((void *)WeakRetained + 44);
    *((void *)WeakRetained + 44) = 0;
  }
}

- (void)_updateCurrentVideoTrackIfNeeded
{
  int32_t v3 = [(AVPlayerController *)self currentAssetIfReady];

  if (v3)
  {
    uint64_t v4 = [(AVPlayerController *)self currentEnabledAssetTrackForMediaType:*MEMORY[0x1E4F15C18]];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(AVPlayerController *)self setCurrentVideoTrack:v4];
}

- (void)_updateCurrentAudioTrackIfNeeded
{
  int32_t v3 = [(AVPlayerController *)self currentAssetIfReady];

  if (v3)
  {
    uint64_t v4 = [(AVPlayerController *)self currentEnabledAssetTrackForMediaType:*MEMORY[0x1E4F15BA8]];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(AVPlayerController *)self setCurrentAudioTrack:v4];
}

- (void)_updateCoordinatedPlaybackActive
{
  int32_t v3 = [*(id *)&self->_canTogglePictureInPicture _playbackCoordinatorWithoutTriggeringFullSetup];
  uint64_t v4 = [v3 otherParticipants];
  BOOL v5 = [v4 count] != 0;

  [(AVPlayerController *)self setCoordinatedPlaybackActive:v5];
}

- (BOOL)_assetContainsProResRaw:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [a3 tracks];
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v5 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v6 = [v5 formatDescriptions];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          char v9 = 0;
          uint64_t v10 = *(void *)v19;
LABEL_8:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v6);
            }
            FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v18 + 1) + 8 * v11));
            if (MediaSubType == 1634759272 || MediaSubType == 1634759278) {
              char v9 = 1;
            }
            if (MediaSubType == 1634759272 || MediaSubType == 1634759278) {
              break;
            }
            if (v8 == ++v11)
            {
              uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v8) {
                goto LABEL_8;
              }
              break;
            }
          }

          if (v9)
          {
            LOBYTE(v3) = 1;
            goto LABEL_27;
          }
        }
        else
        {
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v3);
  }
LABEL_27:

  return v3;
}

- (BOOL)_assetIsMarkedNotSerializable:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVPlayerController *)self availableMetadataFormats];
  uint64_t v6 = *MEMORY[0x1E4F15D18];
  if (![v5 containsObject:*MEMORY[0x1E4F15D18]]) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F16558];
  uint64_t v8 = objc_msgSend(v4, "avkit_metadataForFormat:", v6);
  char v9 = [v7 metadataItemsFromArray:v8 withKey:@"com.apple.motion.notserializable" keySpace:*MEMORY[0x1E4F15DF8]];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
LABEL_4:
    uint64_t v12 = *MEMORY[0x1E4F15D10];
    if ([v5 containsObject:*MEMORY[0x1E4F15D10]])
    {
      id v13 = objc_msgSend(v4, "avkit_metadataForFormat:", v12);
      char v14 = (void *)MEMORY[0x1E4F16558];
      uint64_t v15 = [NSNumber numberWithUnsignedInt:1853055350];
      long long v16 = [v14 metadataItemsFromArray:v13 withKey:v15 keySpace:*MEMORY[0x1E4F15DF0]];

      if ([v16 count])
      {
        uint64_t v17 = [v16 objectAtIndex:0];
        long long v18 = [v17 dataValue];

        unsigned int v20 = 0;
        [v18 getBytes:&v20 length:4];
        BOOL v11 = HIBYTE(v20) & 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)audioWaveform
{
  return 0;
}

- (BOOL)_assetIsRestrictedFromSaving:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AVPlayerController *)self _assetIsMarkedNotSerializable:v4];
  BOOL v6 = [(AVPlayerController *)self hasProtectedContent];
  uint64_t v7 = [v4 availableVideoDynamicRanges];
  uint64_t v8 = [NSNumber numberWithInt:5];
  char v9 = [v7 containsObject:v8];

  LOBYTE(self) = [(AVPlayerController *)self _assetContainsProResRaw:v4];
  return self | v6 | v5 | v9;
}

- (BOOL)hasShareableContent
{
  uint64_t v3 = [(AVPlayerController *)self player];
  id v4 = [v3 currentItem];

  if (v4)
  {
    BOOL v5 = [(AVPlayerController *)self currentAssetIfReady];
    if (v5 && ![(AVPlayerController *)self _assetIsRestrictedFromSaving:v5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v5 URL];
        char isKindOfClass = v8 != 0;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)hasTrimmableContent
{
  uint64_t v3 = [(AVPlayerController *)self player];
  id v4 = [v3 currentItem];
  BOOL v5 = [v4 asset];

  if (v5 && [(AVPlayerController *)self isCompletelySeekable])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = 1;
    }
    else {
      char v6 = [v5 isComposable];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  [(AVPlayerController *)self _updateMinMaxTimingIfNeeded];
  LODWORD(v3) = [(AVPlayerController *)self hasLiveStreamingContent];
  if (v3)
  {
    uint64_t v3 = [(AVPlayerController *)self minTiming];
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = [(AVPlayerController *)self maxTiming];
      if (v5)
      {
        char v6 = (void *)v5;
        uint64_t v7 = [(AVPlayerController *)self player];
        uint64_t v8 = [v7 currentItem];
        [v8 seekableTimeRangesLastModifiedTime];
        if (v9 != 0.0)
        {
          uint64_t v10 = [(AVPlayerController *)self player];
          BOOL v11 = [v10 currentItem];
          [v11 liveUpdateInterval];
          if (fabs(v12) != INFINITY)
          {
            id v13 = [(AVPlayerController *)self player];
            char v14 = [v13 currentItem];
            [v14 liveUpdateInterval];
            double v16 = v15;

            if (v16 > 1.0)
            {
              +[AVValueTiming currentTimeStamp];
              double v18 = v17;
              long long v19 = [(AVPlayerController *)self minTiming];
              [v19 valueForTimeStamp:v18];
              double v21 = v20;

              long long v22 = [(AVPlayerController *)self maxTiming];
              [v22 valueForTimeStamp:v18];
              double v24 = v23;

              LOBYTE(v3) = v24 - v21 > 30.0;
              return v3;
            }
LABEL_11:
            LOBYTE(v3) = 0;
            return v3;
          }
        }
      }

      goto LABEL_11;
    }
  }
  return v3;
}

- (BOOL)hasLiveStreamingContent
{
  if ([(AVPlayerController *)self isReadyToPlay]
    && ([(AVPlayerController *)self hasEnabledAudio]
     || [(AVPlayerController *)self hasEnabledVideo]))
  {
    uint64_t v3 = [(AVPlayerController *)self player];
    id v4 = [v3 currentItem];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 duration];
      if (v12)
      {
        uint64_t v7 = [(AVPlayerController *)self player];
        uint64_t v8 = [v7 currentItem];
        double v9 = v8;
        if (v8)
        {
          [v8 duration];
          BOOL v6 = (v11 >> 4) & 1;
        }
        else
        {
          LOBYTE(v6) = 0;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isPlayableOffline
{
  id v2 = [(AVPlayerController *)self currentAssetIfReady];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 assetCache];
    char v4 = [v3 isPlayableOffline];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isStreaming
{
  id v2 = [(AVPlayerController *)self currentAssetIfReady];
  uint64_t v3 = [v2 valueForKey:@"streaming"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hasContentChapters
{
  id v2 = [(AVPlayerController *)self contentChapters];
  uint64_t v3 = v2;
  BOOL v4 = v2 && [v2 count];

  return v4;
}

- (BOOL)hasEnabledVideo
{
  id v2 = [(AVPlayerController *)self player];
  uint64_t v3 = [v2 currentItem];
  char v4 = [v3 hasEnabledVideo];

  return v4;
}

- (BOOL)hasVideo
{
  id v2 = [(AVPlayerController *)self player];
  uint64_t v3 = [v2 currentItem];
  char v4 = [v3 hasVideo];

  return v4;
}

- (id)loadedTimeRanges
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(AVPlayerController *)self isReadyToPlay])
  {
    uint64_t v3 = [(AVPlayerController *)self player];
    char v4 = [v3 currentItem];
    uint64_t v5 = [v4 loadedTimeRanges];

    [(AVPlayerController *)self contentDuration];
    if (v5)
    {
      double v7 = v6;
      uint64_t v8 = 0;
      if ([v5 count] && v7 > 0.0)
      {
        double v9 = [MEMORY[0x1E4F1CA48] array];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = v5;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              memset(v21, 0, sizeof(v21));
              long long v20 = 0u;
              if (v15) {
                [v15 CMTimeRangeValue];
              }
              *(_OWORD *)&v19.value = v20;
              v19.epoch = *(void *)&v21[0];
              double v16 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v19) / v7];
              [v9 addObject:v16];

              CMTime v19 = *(CMTime *)((char *)v21 + 8);
              double v17 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v19) / v7];
              [v9 addObject:v17];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v12);
        }

        uint64_t v8 = (void *)[v9 copy];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)seekableTimeRanges
{
  id v2 = [(AVPlayerController *)self player];
  uint64_t v3 = [v2 currentItem];
  char v4 = [v3 seekableTimeRanges];

  return v4;
}

- (double)currentTimeWithinEndTimes
{
  [(AVPlayerController *)self currentTime];
  double v4 = v3;
  [(AVPlayerController *)self minTime];
  return v4 - v5;
}

- (NSDate)currentOrEstimatedDate
{
  if ([(AVPlayerController *)self hasLiveStreamingContent])
  {
    if ([(AVPlayerController *)self isReadyToPlay])
    {
      double v3 = [(AVPlayerController *)self player];
      double v4 = [v3 currentItem];
    }
    else
    {
      double v4 = 0;
    }
    double v6 = [v4 currentDate];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v4 currentEstimatedDate];
    }
    double v5 = v8;
  }
  else
  {
    double v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSDate)currentDate
{
  if ([(AVPlayerController *)self hasLiveStreamingContent])
  {
    double v3 = [(AVPlayerController *)self player];
    double v4 = [v3 currentItem];
    double v5 = [v4 currentDate];
  }
  else
  {
    double v5 = 0;
  }

  return (NSDate *)v5;
}

- (double)contentDurationWithinEndTimes
{
  [(AVPlayerController *)self maxTime];
  double v4 = v3;
  [(AVPlayerController *)self minTime];
  return v4 - v5;
}

- (void)_setMinTiming:(id)a3 maxTiming:(id)a4
{
  id v6 = a4;
  [(AVPlayerController *)self setMinTiming:a3];
  [(AVPlayerController *)self setMaxTiming:v6];
}

- (void)setForwardPlaybackEndTime:(id *)a3
{
  double v4 = [(AVPlayerController *)self player];
  double v5 = [v4 currentItem];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v5 setForwardPlaybackEndTime:&v6];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  id v7 = [(AVPlayerController *)self player];
  double v4 = [v7 currentItem];
  double v5 = v4;
  if (v4)
  {
    [v4 forwardPlaybackEndTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (void)setMaxTime:(double)a3
{
  double v5 = [(AVPlayerController *)self player];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v5 currentItem];

  if (v6 && ![(AVPlayerController *)self hasLiveStreamingContent])
  {
    [(AVPlayerController *)self contentDuration];
    if (v7 == a3)
    {
      id v8 = [(AVPlayerController *)self player];
      double v9 = [v8 currentItem];
      id v10 = v9;
      if (v9) {
        [v9 duration];
      }
      else {
        memset(v12, 0, sizeof(v12));
      }
      [v6 setForwardPlaybackEndTime:v12];
    }
    else
    {
      CMTimeMakeWithSeconds(&v11, a3, 90000);
      [v6 setForwardPlaybackEndTime:&v11];
    }
  }
}

- (double)maxTime
{
  memset(&v11[1], 0, sizeof(CMTime));
  [(AVPlayerController *)self forwardPlaybackEndTime];
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v11[0] = v11[1];
    double Seconds = CMTimeGetSeconds(v11);
    if (fabs(Seconds) == INFINITY) {
      return NAN;
    }
    else {
      return Seconds;
    }
  }
  else
  {
    [(AVPlayerController *)self contentDuration];
    double v4 = v5;
    double v6 = fabs(v5);
    if (v6 >= INFINITY && v6 <= INFINITY)
    {
      if ([(AVPlayerController *)self hasSeekableLiveStreamingContent]
        && ([(AVPlayerController *)self maxTiming],
            double v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        id v8 = [(AVPlayerController *)self maxTiming];
        [v8 currentValue];
        double v4 = v9;
      }
      else
      {
        return NAN;
      }
    }
  }
  return v4;
}

- (void)setReversePlaybackEndTime:(id *)a3
{
  double v4 = [(AVPlayerController *)self player];
  double v5 = [v4 currentItem];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v5 setReversePlaybackEndTime:&v6];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime
{
  id v7 = [(AVPlayerController *)self player];
  double v4 = [v7 currentItem];
  double v5 = v4;
  if (v4)
  {
    [v4 reversePlaybackEndTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->int64_t var3 = 0;
  }

  return result;
}

- (void)setMinTime:(double)a3
{
  double v5 = [(AVPlayerController *)self player];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v5 currentItem];

  if (v6 && ![(AVPlayerController *)self hasLiveStreamingContent])
  {
    CMTimeMakeWithSeconds(&v7, a3, 90000);
    [v6 setReversePlaybackEndTime:&v7];
  }
}

- (double)minTime
{
  memset(&v9[1], 0, sizeof(CMTime));
  [(AVPlayerController *)self reversePlaybackEndTime];
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v9[0] = v9[1];
    double Seconds = CMTimeGetSeconds(v9);
    if (fabs(Seconds) == INFINITY) {
      return NAN;
    }
    else {
      return Seconds;
    }
  }
  else
  {
    double v4 = 0.0;
    if ([(AVPlayerController *)self hasSeekableLiveStreamingContent])
    {
      double v5 = [(AVPlayerController *)self minTiming];

      if (v5)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(AVPlayerController *)self minTiming];
        [v6 currentValue];
        double v4 = v7;
      }
    }
  }
  return v4;
}

- (double)currentTime
{
  if (![(AVPlayerController *)self isReadyToPlay]) {
    return NAN;
  }
  double v3 = [(AVPlayerController *)self player];
  double v4 = [v3 currentItem];
  double v5 = v4;
  if (v4) {
    [v4 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);

  double v8 = fabs(Seconds);
  BOOL v9 = v8 < INFINITY;
  BOOL v10 = v8 <= INFINITY;
  double result = NAN;
  if (v9) {
    double result = Seconds;
  }
  if (!v10) {
    return Seconds;
  }
  return result;
}

- (CGSize)contentDimensions
{
  if ([(AVPlayerController *)self isReadyToPlay])
  {
    [(AVPlayerController *)self presentationSize];
  }
  else
  {
    double v4 = NAN;
    double v3 = NAN;
  }
  result.height = v4;
  result.double width = v3;
  return result;
}

- (float)nominalFrameRate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = [(AVPlayerController *)self currentAssetIfReady];

  if (!v3) {
    return NAN;
  }
  double v4 = [(AVPlayerController *)self currentAssetIfReady];
  double v5 = objc_msgSend(v4, "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C18]);

  memset(&v23, 0, sizeof(v23));
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(AVPlayerController *)self player];
  double v7 = v6;
  if (v6) {
    [v6 currentTime];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v14) {
          [*(id *)(*((void *)&v19 + 1) + 8 * i) timeRange];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        CMTime v17 = v23;
        if (CMTimeRangeContainsTime(&range, &v17))
        {
          [v14 nominalFrameRate];
          float v8 = v15;
          goto LABEL_19;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  float v8 = NAN;
LABEL_19:

  return v8;
}

- (double)contentDuration
{
  id v2 = [(AVPlayerController *)self player];
  double v3 = [v2 currentItem];
  double v4 = v3;
  if (v3) {
    [v3 duration];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CMTime time = v7;
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (BOOL)hasContent
{
  id v2 = [(AVPlayerController *)self player];
  double v3 = [v2 currentItem];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setCoordinatedPlaybackActive:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_allowsPictureInPicturePlayback != a3)
  {
    BOOL v3 = a3;
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      CMTime v7 = "-[AVPlayerController setCoordinatedPlaybackActive:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s coordinatedPlaybackActive set to %d", (uint8_t *)&v6, 0x12u);
    }

    self->_allowsPictureInPicturePlayback = v3;
  }
}

- (void)toggleMuted:(id)a3
{
  uint64_t v4 = [(AVPlayerController *)self isMuted] ^ 1;

  [(AVPlayerController *)self setMuted:v4];
}

- (void)setAllowsAudioPlayback:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (BYTE2(self->_photosensitivityMetadataHandler) != a3)
  {
    BOOL v3 = a3;
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      CMTime v7 = "-[AVPlayerController setAllowsAudioPlayback:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    BYTE2(self->_photosensitivityMetadataHandler) = v3;
    [(AVPlayerController *)self _updatePlayerMutedState];
  }
}

- (BOOL)allowsAudioPlayback
{
  return BYTE2(self->_photosensitivityMetadataHandler);
}

- (void)setMuted:(BOOL)a3
{
  if (LOBYTE(self->_photosensitivityMetadataHandler) != a3)
  {
    LOBYTE(self->_photosensitivityMetadataHandler) = a3;
    [(AVPlayerController *)self _updatePlayerMutedState];
  }
}

- (BOOL)isMuted
{
  return (BOOL)self->_photosensitivityMetadataHandler;
}

- (void)changeVolumeToMaximum:(id)a3
{
}

- (void)changeVolumeToMinimum:(id)a3
{
}

- (void)decreaseVolume:(id)a3
{
  [(AVPlayerController *)self volume];
  double v5 = fmax(v4 + -0.0625, 0.0);

  [(AVPlayerController *)self setVolume:v5];
}

- (void)increaseVolume:(id)a3
{
  [(AVPlayerController *)self volume];
  double v5 = fmin(v4 + 0.0625, 1.0);

  [(AVPlayerController *)self setVolume:v5];
}

- (void)setVolume:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    BOOL v9 = "-[AVPlayerController setVolume:]";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %f", (uint8_t *)&v8, 0x16u);
  }

  int v6 = [(AVPlayerController *)self player];
  *(float *)&double v7 = a3;
  [v6 setVolume:v7];
}

- (double)volume
{
  id v2 = [(AVPlayerController *)self player];
  [v2 volume];
  double v4 = v3;

  return v4;
}

- (void)endPlaybackSuspension
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  float v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[AVPlayerController endPlaybackSuspension]";
    __int16 v9 = 1024;
    int v10 = 2029;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  int64_t playbackSuspensionCount = self->_playbackSuspensionCount;
  if (playbackSuspensionCount > 0) {
    goto LABEL_7;
  }
  double v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v7) = 0;
    _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Error: Calls to endPlaybackSuspension must be balanced with calls to beginPlaybackSuspension.", (uint8_t *)&v7, 2u);
  }

  int64_t playbackSuspensionCount = self->_playbackSuspensionCount;
  if (playbackSuspensionCount >= 1)
  {
LABEL_7:
    int64_t v6 = playbackSuspensionCount - 1;
    self->_int64_t playbackSuspensionCount = v6;
    if (!v6) {
      [(AVPlayerController *)self _stopSuspendingPlayback];
    }
  }
}

- (void)beginPlaybackSuspension
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  float v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int64_t v6 = "-[AVPlayerController beginPlaybackSuspension]";
    __int16 v7 = 1024;
    int v8 = 2017;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  int64_t playbackSuspensionCount = self->_playbackSuspensionCount;
  if (!playbackSuspensionCount)
  {
    [(AVPlayerController *)self _startSuspendingPlayback];
    int64_t playbackSuspensionCount = self->_playbackSuspensionCount;
  }
  self->_int64_t playbackSuspensionCount = playbackSuspensionCount + 1;
}

- (void)updateAtMinMaxTime
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__AVPlayerController_updateAtMinMaxTime__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__AVPlayerController_updateAtMinMaxTime__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (![WeakRetained isReadyToPlay])
  {
    BOOL v5 = 0;
LABEL_10:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  memset(&v20, 0, sizeof(v20));
  id v2 = [WeakRetained player];
  id v3 = [v2 currentItem];
  double v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }

  if ([WeakRetained isLooping])
  {
    BOOL v5 = 0;
  }
  else
  {
    int64_t v6 = [WeakRetained player];
    __int16 v7 = [v6 currentItem];
    playbackMinTimeForPlayerItem((uint64_t)&time2, v7);
    CMTime time1 = v20;
    BOOL v5 = CMTimeCompare(&time1, &time2) < 1;
  }
  if ([WeakRetained isLooping]) {
    goto LABEL_10;
  }
  uint64_t v9 = [WeakRetained player];
  int v10 = [v9 currentItem];
  uint64_t v11 = [WeakRetained player];
  uint64_t v12 = [v11 currentItem];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 duration];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  playbackMaxTimeForPlayerItemAndContentDuration((uint64_t)&v17, v10, (uint64_t)&v14);
  CMTime time1 = v20;
  BOOL v8 = CMTimeCompare(&time1, &v17) >= 0;

LABEL_15:
  objc_msgSend(WeakRetained, "setAtMinTime:", v5, v14, v15, v16);
  [WeakRetained setAtMaxTime:v8];
}

- (void)setLooping:(BOOL)a3
{
  if (self->_looping != a3)
  {
    BOOL v3 = a3;
    self->_looping = a3;
    BOOL v5 = [(AVPlayerController *)self player];
    int64_t v6 = v5;
    if (v3)
    {
      self->_int64_t actionAtItemEnd = [v5 actionAtItemEnd];

      BOOL v5 = [(AVPlayerController *)self player];
      int64_t v6 = v5;
      int64_t actionAtItemEnd = 2;
    }
    else
    {
      int64_t actionAtItemEnd = self->_actionAtItemEnd;
    }
    [v5 setActionAtItemEnd:actionAtItemEnd];

    [(AVPlayerController *)self updateAtMinMaxTime];
  }
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (BOOL)isPlayingHDRContent
{
  return (BOOL)self->_liveEdgeTimer;
}

- (void)setTouchBarRequiresLinearPlayback:(BOOL)a3
{
  if (LOBYTE(self->_defaultPlaybackRate) != a3)
  {
    LOBYTE(self->_defaultPlaybackRate) = a3;
    if (a3)
    {
      [(AVPlayerController *)self endScrubbing];
      [(AVPlayerController *)self _cancelPendingSeeksIfNeeded];
    }
  }
}

- (BOOL)touchBarRequiresLinearPlayback
{
  return LOBYTE(self->_defaultPlaybackRate);
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F74F68];
  id v8 = a3;
  BOOL v5 = [v4 sharedAVSystemController];
  int64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  __int16 v7 = [v6 bundleIdentifier];
  [v5 setAttribute:v7 forKey:*MEMORY[0x1E4F74AA8] error:0];

  [(AVPlayerController *)self togglePlayback:v8];
}

- (void)togglePlayback:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (![(AVPlayerController *)self isPlaying])
  {
    double v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int64_t v6 = "-[AVPlayerController togglePlayback:]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES", (uint8_t *)&v5, 0xCu);
    }
  }
  [(AVPlayerController *)self setPlaying:[(AVPlayerController *)self isPlaying] ^ 1];
}

- (BOOL)canTogglePlayback
{
  BOOL v3 = [(AVPlayerController *)self isReadyToPlay];
  if (v3) {
    LOBYTE(v3) = ![(AVPlayerController *)self isPictureInPictureInterrupted];
  }
  return v3;
}

- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = @"NO";
    if (v3) {
      int64_t v6 = @"YES";
    }
    int v8 = 136315394;
    uint64_t v9 = "-[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s notifyCoordinatedPlayback of pause: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v3)
  {
    [(AVPlayerController *)self setPlaying:0];
  }
  else
  {
    [(AVPlayerController *)self setRateBeforeScrubBegan:NAN];
    uint64_t v7 = [(AVPlayerController *)self player];
    [v7 pauseWithoutAffectingCoordinatedPlayback];
  }
}

- (void)pause:(id)a3
{
}

- (void)autoplay:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(AVPlayerController *)self isPlaying])
  {
    if (AVPlayerControllerAutoplayEnabled == 1
      && ![(AVPlayerController *)self coordinatedPlaybackActive])
    {
      int64_t v6 = [(AVPlayerController *)self player];
      uint64_t v7 = [v6 currentItem];
      int v8 = [v7 isPlaybackLikelyToKeepUp];

      if (!v8)
      {
        BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
        return;
      }
      double v4 = _AVLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v9 = 136315138;
      __int16 v10 = "-[AVPlayerController autoplay:]";
      int v5 = "%s setPlaying:YES (AVPlayerControllerAutoplayEnabled)";
    }
    else
    {
      double v4 = _AVLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        [(AVPlayerController *)self setPlaying:1];
        return;
      }
      int v9 = 136315138;
      __int16 v10 = "-[AVPlayerController autoplay:]";
      int v5 = "%s setPlaying:YES";
    }
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, 0xCu);
    goto LABEL_7;
  }
}

- (void)play:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int64_t v6 = "-[AVPlayerController play:]";
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES", (uint8_t *)&v5, 0xCu);
  }

  [(AVPlayerController *)self setPlaying:1];
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[AVPlayerController setPlaying:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  [(AVPlayerController *)self setRateBeforeScrubBegan:NAN];
  if (v3)
  {
    objc_initWeak((id *)buf, self);
    seekQueue = self->_seekQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async(seekQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(AVPlayerController *)self setRate:0.0];
  }
}

void __33__AVPlayerController_setPlaying___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = [WeakRetained activePlayer];
    int v5 = [v4 currentItem];
    int64_t v6 = [v3 _queuePlayer];
    uint64_t v7 = [v6 items];
    unint64_t v8 = [v7 count];

    if (v8 > 1 || ([v3 isSeekingInternal] & 1) != 0 || v3[168]) {
      goto LABEL_5;
    }
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(&v31, 0, sizeof(v31));
    }
    __int16 v10 = [v4 currentItem];
    __int16 v11 = v10;
    if (v10) {
      [v10 duration];
    }
    else {
      memset(v28, 0, sizeof(v28));
    }
    playbackMaxTimeForPlayerItemAndContentDuration((uint64_t)&lhs, v5, (uint64_t)v28);
    CMTimeMake(&rhs, 1, 1200);
    CMTimeSubtract(&v30, &lhs, &rhs);
    int32_t v12 = CMTimeCompare(&v31, &v30);

    if (v12 < 0)
    {
LABEL_5:
      if (v5)
      {
        [v5 currentTime];
        playbackMinTimeForPlayerItem((uint64_t)&time2, v5);
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      }
      if (CMTimeCompare(&time1, &time2) < 0 && [v3 hasLiveStreamingContent])
      {
        playbackMinTimeForPlayerItem((uint64_t)v17, v5);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __33__AVPlayerController_setPlaying___block_invoke_4;
        v15[3] = &unk_1E5FC4220;
        int v9 = &v16;
        objc_copyWeak(&v16, v1);
        long long v22 = *MEMORY[0x1E4F1FA48];
        uint64_t v23 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        long long v20 = v22;
        uint64_t v21 = v23;
        [v4 seekToTime:v17 toleranceBefore:&v22 toleranceAfter:&v20 completionHandler:v15];
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__AVPlayerController_setPlaying___block_invoke_6;
        block[3] = &unk_1E5FC44F8;
        int v9 = &v14;
        objc_copyWeak(&v14, v1);
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      playbackMinTimeForPlayerItem((uint64_t)v26, v5);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __33__AVPlayerController_setPlaying___block_invoke_2;
      v24[3] = &unk_1E5FC4220;
      int v9 = &v25;
      objc_copyWeak(&v25, v1);
      long long v22 = *MEMORY[0x1E4F1FA48];
      uint64_t v23 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v20 = v22;
      uint64_t v21 = v23;
      [v4 seekToTime:v26 toleranceBefore:&v22 toleranceAfter:&v20 completionHandler:v24];
    }
    objc_destroyWeak(v9);
  }
}

void __33__AVPlayerController_setPlaying___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke_3;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v3);
  }
}

void __33__AVPlayerController_setPlaying___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke_5;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v3);
  }
}

void __33__AVPlayerController_setPlaying___block_invoke_6(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  [v1 defaultPlaybackRate];
  objc_msgSend(v1, "setRate:");
}

void __33__AVPlayerController_setPlaying___block_invoke_5(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  [v1 defaultPlaybackRate];
  objc_msgSend(v1, "setRate:");
}

void __33__AVPlayerController_setPlaying___block_invoke_3(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  [v1 defaultPlaybackRate];
  objc_msgSend(v1, "setRate:");
}

- (BOOL)isPlaying
{
  [(AVPlayerController *)self rate];
  return v2 != 0.0;
}

- (BOOL)canPlay
{
  BOOL v3 = [(AVPlayerController *)self isReadyToPlay];
  if (v3) {
    LOBYTE(v3) = ![(AVPlayerController *)self isPictureInPictureInterrupted];
  }
  return v3;
}

- (BOOL)canPlayImmediately
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVPlayerController *)self player];
  double v4 = [v3 currentItem];
  char v5 = [v4 isPlaybackBufferEmpty];

  if (v5)
  {
    LODWORD(v6) = 0;
  }
  else
  {
    uint64_t v7 = [(AVPlayerController *)self player];
    unint64_t v8 = [v7 currentItem];
    int v9 = [v8 loadedTimeRanges];

    memset(&v26, 0, sizeof(v26));
    CMTimeMakeWithSeconds(&v26, 1.0, 90000);
    memset(&v25, 0, sizeof(v25));
    __int16 v10 = [(AVPlayerController *)self player];
    __int16 v11 = v10;
    if (v10) {
      [v10 currentTime];
    }
    else {
      memset(&v25, 0, sizeof(v25));
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v9;
    uint64_t v6 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
    if (v6)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          memset(&buf, 0, sizeof(buf));
          if (v15) {
            [v15 CMTimeRangeValue];
          }
          CMTimeRange range = buf;
          CMTime time = v25;
          if (CMTimeRangeContainsTime(&range, &time))
          {
            range.start = v25;
            CMTime time = v26;
            CMTimeAdd(&v18, &range.start, &time);
            CMTimeRange range = buf;
            if (CMTimeRangeContainsTime(&range, &v18))
            {
              LODWORD(v6) = 1;
              goto LABEL_19;
            }
          }
        }
        uint64_t v6 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  id v16 = _AVLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.start.value) = 67109120;
    HIDWORD(buf.start.value) = v6;
    _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "Can play immediately: %d", (uint8_t *)&buf, 8u);
  }

  return v6;
}

- (void)_retryPlayImmediatelyIfNeeded
{
  if (self->_retryPlayingImmediatelyBlock && [(AVPlayerController *)self canPlayImmediately])
  {
    BOOL v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "Retrying play immediately.", v5, 2u);
    }

    (*((void (**)(void))self->_retryPlayingImmediatelyBlock + 2))();
    id retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
    self->_id retryPlayingImmediatelyBlock = 0;
  }
}

- (void)setDefaultPlaybackRate:(double)a3
{
  if (a3 >= 0.05) {
    double v4 = a3;
  }
  else {
    double v4 = 0.05;
  }
  char v5 = [(AVPlayerController *)self player];
  *(float *)&double v6 = v4;
  [v5 setDefaultRate:v6];

  if ([(AVPlayerController *)self isPlaying]) {
    [(AVPlayerController *)self setRate:v4];
  }
  if (self->_rateToRestoreAfterAudioSessionInterruptionEnds)
  {
    uint64_t v7 = [NSNumber numberWithDouble:v4];
    rateToRestoreAfterAudioSessionInterruptionEnds = self->_rateToRestoreAfterAudioSessionInterruptionEnds;
    self->_rateToRestoreAfterAudioSessionInterruptionEnds = v7;
    MEMORY[0x1F41817F8](v7, rateToRestoreAfterAudioSessionInterruptionEnds);
  }
}

- (void)setRate:(double)a3
{
  rateToRestoreAfterAudioSessionInterruptionEnds = self->_rateToRestoreAfterAudioSessionInterruptionEnds;
  self->_rateToRestoreAfterAudioSessionInterruptionEnds = 0;

  [(AVPlayerController *)self _setRate_AVFoundationStrategy:a3];
  if (AVPlayerControllerAutoplayEnabled == 1) {
    BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 0;
  }
}

- (void)_setRate_AVFoundationStrategy:(double)a3
{
  if ([(AVPlayerController *)self isPlaybackSuspended])
  {
    *(double *)&self->_captionAppearanceMACaptionAppearanceDisplayType DisplayType = a3;
  }
  else
  {
    [(AVPlayerController *)self _playAtRate:a3];
  }
}

- (void)_playAtRate:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v5 = [(AVPlayerController *)self activePlayer];
  if (self->_shouldPlayImmediately)
  {
    BOOL v6 = [(AVPlayerController *)self canPlayImmediately];
    uint64_t v7 = _AVLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 == 0.0 || v6)
    {
      if (v8)
      {
        *(_DWORD *)CMTimeRange buf = 134217984;
        double v21 = a3;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Calling playImmediatelyAtRate: %f", buf, 0xCu);
      }

      id retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
      self->_id retryPlayingImmediatelyBlock = 0;

      *(float *)&double v16 = a3;
      [v5 playImmediatelyAtRate:v16];
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)CMTimeRange buf = 136315650;
        double v21 = COERCE_DOUBLE("-[AVPlayerController _playAtRate:]");
        __int16 v22 = 2048;
        double v23 = a3;
        __int16 v24 = 2048;
        CMTime v25 = v5;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %.1f on %p", buf, 0x20u);
      }

      *(float *)&double v9 = a3;
      [v5 setRate:v9];
      __int16 v10 = _AVLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "Could not play immediately, setting a play immediately retry block.", buf, 2u);
      }

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __34__AVPlayerController__playAtRate___block_invoke;
      id v17[3] = &unk_1E5FC41F8;
      double v19 = a3;
      id v18 = v5;
      __int16 v11 = (void *)MEMORY[0x1B3E963E0](v17);
      id v12 = self->_retryPlayingImmediatelyBlock;
      self->_id retryPlayingImmediatelyBlock = v11;
    }
  }
  else
  {
    uint64_t v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTimeRange buf = 136315650;
      double v21 = COERCE_DOUBLE("-[AVPlayerController _playAtRate:]");
      __int16 v22 = 2048;
      double v23 = a3;
      __int16 v24 = 2048;
      CMTime v25 = v5;
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s %.1f on %p", buf, 0x20u);
    }

    *(float *)&double v14 = a3;
    [v5 setRate:v14];
  }
}

uint64_t __34__AVPlayerController__playAtRate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v2 = _AVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 136315650;
    BOOL v8 = "-[AVPlayerController _playAtRate:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "%s immediately %.1f on %p", (uint8_t *)&v7, 0x20u);
  }

  double v5 = *(double *)(a1 + 40);
  *(float *)&double v5 = v5;
  return [*(id *)(a1 + 32) playImmediatelyAtRate:v5];
}

- (void)stopUsingNetworkResourcesForLiveStreamingWhilePaused
{
  uint64_t v3 = *(void *)&self->_liveStreamEventModePossible;
  if (v3 <= 0)
  {
    uint64_t v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v7 = 0;
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Calls to -[AVPlayerController stopUsingNetworkResourcesForLiveStreamingWhilePaused] must be counterbalanced with calls to -[AVPlayerController startUsingNetworkResourcesForLiveStreamingWhilePaused].", v7, 2u);
    }

    uint64_t v3 = *(void *)&self->_liveStreamEventModePossible;
  }
  *(void *)&self->_liveStreamEventModePossible = v3 - 1;
  if (v3 <= 1)
  {
    double v5 = [(AVPlayerController *)self player];
    BOOL v6 = [v5 currentItem];
    [v6 setCanUseNetworkResourcesForLiveStreamingWhilePaused:LOBYTE(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount)];
  }
}

- (void)startUsingNetworkResourcesForLiveStreamingWhilePaused
{
  uint64_t v2 = *(void *)&self->_liveStreamEventModePossible;
  *(void *)&self->_liveStreamEventModePossible = v2 + 1;
  if (!v2)
  {
    uint64_t v4 = [(AVPlayerController *)self player];
    double v5 = [v4 currentItem];
    LOBYTE(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = [v5 canUseNetworkResourcesForLiveStreamingWhilePaused];

    id v7 = [(AVPlayerController *)self player];
    BOOL v6 = [v7 currentItem];
    [v6 setCanUseNetworkResourcesForLiveStreamingWhilePaused:1];
  }
}

- (BOOL)isAtLiveEdge
{
  return BYTE1(self->_liveEdgeTimer);
}

- (void)setAtLiveEdge:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (BYTE1(self->_liveEdgeTimer) != a3)
  {
    BOOL v3 = a3;
    double v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "NO";
      int v8 = 136315650;
      __int16 v9 = "-[AVPlayerController setAtLiveEdge:]";
      __int16 v11 = "atLiveEdge";
      __int16 v10 = 2080;
      if (v3) {
        BOOL v6 = "YES";
      }
      __int16 v12 = 2080;
      uint64_t v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    BYTE1(self->_liveEdgeTimer) = v3;
    if (v3)
    {
      [(AVPlayerController *)self defaultPlaybackRate];
      if (v7 > 1.0) {
        [(AVPlayerController *)self setDefaultPlaybackRate:1.0];
      }
    }
  }
}

- (double)activeRate
{
  uint64_t v2 = [(AVPlayerController *)self activePlayer];
  [v2 rate];
  double v4 = v3;

  return v4;
}

- (void)_observeValueForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v107 = a4;
  id v108 = a5;
  if ([v8 isEqualToString:@"player.currentItem"])
  {
    __int16 v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "PlayerItemDidChange", (uint8_t *)&buf, 2u);
    }

    [(AVPlayerController *)self updateTiming];
    [(AVPlayerController *)self setMetadata:0];
    [(AVPlayerController *)self stopGeneratingTimecodes];
    __int16 v10 = *(void **)&self->_touchBarRequiresLinearPlayback;
    *(void *)&self->_touchBarRequiresLinearPlayback = 0;

    [(AVPlayerController *)self setComposable:0];
    [(AVPlayerController *)self setHasProtectedContent:0];
    [(AVPlayerController *)self setAvailableMetadataFormats:0];
    [(AVPlayerController *)self setCompatibleWithAirPlayVideo:0];
    [(AVPlayerController *)self setSeeking:0];
    objc_initWeak((id *)&location, self);
    seekQueue = self->_seekQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v160, (id *)&location);
    dispatch_async(seekQueue, block);
    [(AVPlayerController *)self setContentChapters:0];
    if (v108)
    {
      __int16 v12 = _AVLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v13;
        LOWORD(buf.start.flags) = 2048;
        *(void *)((char *)&buf.start.flags + 2) = v108;
        id v14 = v13;
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "New playerItem: <%{public}@: %p>", (uint8_t *)&buf, 0x16u);
      }
      LOBYTE(self->_liveStreamMaxTiming) = 1;
      [(AVPlayerController *)self updateAtMinMaxTime];
    }
    uint64_t v15 = [(AVPlayerController *)self reduceResourceUsageAssertion];

    if (v15)
    {
      double v16 = [(AVPlayerController *)self reduceResourceUsageAssertion];
      [v16 invalidate];

      [(AVPlayerController *)self acquireResourceReductionAssertion];
    }
    objc_destroyWeak(&v160);
    objc_destroyWeak((id *)&location);
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"currentAssetIfReady"])
  {
    CMTime v17 = [(AVPlayerController *)self currentAssetIfReady];
    if (v17)
    {
      id v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = objc_opt_class();
        LOWORD(buf.start.flags) = 2048;
        *(void *)((char *)&buf.start.flags + 2) = v17;
        id v19 = *(id *)((char *)&buf.start.value + 4);
        _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "New asset: <%{public}@: %p>", (uint8_t *)&buf, 0x16u);
      }
      objc_initWeak((id *)&buf, self);
      if ([v17 statusOfValueForKey:@"commonMetadata" error:0] == 2)
      {
        long long v20 = dispatch_get_global_queue(0, 0);
        v157[0] = MEMORY[0x1E4F143A8];
        v157[1] = 3221225472;
        v157[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_219;
        v157[3] = &unk_1E5FC44F8;
        objc_copyWeak(&v158, (id *)&buf);
        dispatch_async(v20, v157);

        objc_destroyWeak(&v158);
      }
      else
      {
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_2;
        v154[3] = &unk_1E5FC4180;
        id v155 = v17;
        objc_copyWeak(&v156, (id *)&buf);
        [v155 loadValuesAsynchronouslyForKeys:&unk_1F094A3A0 completionHandler:v154];
        objc_destroyWeak(&v156);
      }
      v151[0] = MEMORY[0x1E4F143A8];
      v151[1] = 3221225472;
      v151[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_3;
      v151[3] = &unk_1E5FC4180;
      id v27 = v17;
      id v152 = v27;
      objc_copyWeak(&v153, (id *)&buf);
      v106 = (void *)MEMORY[0x1B3E963E0](v151);
      if ([v27 statusOfValueForKey:@"availableChapterLocales" error:0] == 2)
      {
        uint64_t v28 = dispatch_get_global_queue(0, 0);
        v149[0] = MEMORY[0x1E4F143A8];
        v149[1] = 3221225472;
        v149[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_8;
        v149[3] = &unk_1E5FC41A8;
        uint64_t v29 = &v150;
        id v150 = v106;
        dispatch_async(v28, v149);
      }
      else
      {
        v146[0] = MEMORY[0x1E4F143A8];
        v146[1] = 3221225472;
        v146[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_9;
        v146[3] = &unk_1E5FC4648;
        id v147 = v27;
        v148 = v106;
        [v147 loadValuesAsynchronouslyForKeys:&unk_1F094A3D0 completionHandler:v146];
        uint64_t v29 = &v147;
        uint64_t v28 = v148;
      }

      v143[0] = MEMORY[0x1E4F143A8];
      v143[1] = 3221225472;
      v143[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_10;
      v143[3] = &unk_1E5FC4180;
      objc_copyWeak(&v145, (id *)&buf);
      id v30 = v27;
      id v144 = v30;
      v105 = (void *)MEMORY[0x1B3E963E0](v143);
      if ([v30 statusOfValueForKey:@"composable" error:0] == 2)
      {
        CMTime v31 = dispatch_get_global_queue(0, 0);
        v141[0] = MEMORY[0x1E4F143A8];
        v141[1] = 3221225472;
        v141[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_12;
        v141[3] = &unk_1E5FC41A8;
        long long v32 = &v142;
        id v142 = v105;
        dispatch_async(v31, v141);
      }
      else
      {
        v138[0] = MEMORY[0x1E4F143A8];
        v138[1] = 3221225472;
        v138[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_13;
        v138[3] = &unk_1E5FC4648;
        id v139 = v30;
        v140 = v105;
        [v139 loadValuesAsynchronouslyForKeys:&unk_1F094A3E8 completionHandler:v138];
        long long v32 = &v139;
        CMTime v31 = v140;
      }

      v135[0] = MEMORY[0x1E4F143A8];
      v135[1] = 3221225472;
      v135[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_14;
      v135[3] = &unk_1E5FC4180;
      objc_copyWeak(&v137, (id *)&buf);
      id v33 = v30;
      id v136 = v33;
      v104 = (void *)MEMORY[0x1B3E963E0](v135);
      if ([v33 statusOfValueForKey:@"hasProtectedContent" error:0] == 2)
      {
        long long v34 = dispatch_get_global_queue(0, 0);
        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_16;
        v133[3] = &unk_1E5FC41A8;
        long long v35 = &v134;
        id v134 = v104;
        dispatch_async(v34, v133);
      }
      else
      {
        v130[0] = MEMORY[0x1E4F143A8];
        v130[1] = 3221225472;
        v130[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_17;
        v130[3] = &unk_1E5FC4648;
        id v131 = v33;
        v132 = v104;
        [v131 loadValuesAsynchronouslyForKeys:&unk_1F094A400 completionHandler:v130];
        long long v35 = &v131;
        long long v34 = v132;
      }

      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_18;
      v127[3] = &unk_1E5FC4180;
      objc_copyWeak(&v129, (id *)&buf);
      id v36 = v33;
      id v128 = v36;
      long long v37 = (void *)MEMORY[0x1B3E963E0](v127);
      if ([v36 statusOfValueForKey:@"availableMetadataFormats" error:0] == 2)
      {
        long long v38 = dispatch_get_global_queue(0, 0);
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_20;
        v125[3] = &unk_1E5FC41A8;
        uint64_t v39 = &v126;
        id v126 = v37;
        dispatch_async(v38, v125);
      }
      else
      {
        v122[0] = MEMORY[0x1E4F143A8];
        v122[1] = 3221225472;
        v122[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_21;
        v122[3] = &unk_1E5FC4648;
        id v123 = v36;
        v124 = v37;
        [v123 loadValuesAsynchronouslyForKeys:&unk_1F094A418 completionHandler:v122];
        uint64_t v39 = &v123;
        long long v38 = v124;
      }

      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_22;
      v119[3] = &unk_1E5FC4180;
      objc_copyWeak(&v121, (id *)&buf);
      id v40 = v36;
      id v120 = v40;
      uint64_t v41 = (void *)MEMORY[0x1B3E963E0](v119);
      if ([v40 statusOfValueForKey:@"compatibleWithAirPlayVideo" error:0] == 2)
      {
        uint64_t v42 = dispatch_get_global_queue(0, 0);
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_24;
        v117[3] = &unk_1E5FC41A8;
        uint64_t v43 = &v118;
        id v118 = v41;
        dispatch_async(v42, v117);
      }
      else
      {
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_25;
        v114[3] = &unk_1E5FC4648;
        id v115 = v40;
        v116 = v41;
        [v115 loadValuesAsynchronouslyForKeys:&unk_1F094A430 completionHandler:v114];
        uint64_t v43 = &v115;
        uint64_t v42 = v116;
      }

      [(AVPlayerController *)self reloadOptions];
      objc_destroyWeak(&v121);

      objc_destroyWeak(&v129);
      objc_destroyWeak(&v137);

      objc_destroyWeak(&v145);
      objc_destroyWeak(&v153);

      objc_destroyWeak((id *)&buf);
    }

    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.currentItem.seekableTimeRanges"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v21 = v107;
    }
    else {
      double v21 = 0;
    }
    id v22 = v21;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v23 = v108;
    }
    else {
      double v23 = 0;
    }
    id v24 = v23;
    memset(&buf, 0, sizeof(buf));
    if ([v22 count])
    {
      CMTime v25 = [v22 firstObject];
      uint64_t v26 = v25;
      if (v25) {
        [v25 CMTimeRangeValue];
      }
      else {
        memset(&buf, 0, sizeof(buf));
      }
    }
    else
    {
      long long v47 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&buf.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&buf.start.epoch = v47;
      *(_OWORD *)&buf.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    }
    memset(&location, 0, sizeof(location));
    if ([v24 count])
    {
      v57 = [v24 firstObject];
      v58 = v57;
      if (v57) {
        [v57 CMTimeRangeValue];
      }
      else {
        memset(&location, 0, sizeof(location));
      }
    }
    else
    {
      long long v59 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&location.start.value = *MEMORY[0x1E4F1FA20];
      long long v60 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      *(_OWORD *)&location.start.epoch = v59;
      *(_OWORD *)&location.duration.timescale = v60;
    }
    long long v61 = _AVLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&buf.start.value;
      time.start.epoch = buf.start.epoch;
      Float64 Seconds = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&buf.start.value;
      time.start.epoch = buf.start.epoch;
      double v63 = CMTimeGetSeconds(&time.start);
      time.start = buf.duration;
      double v64 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&location.start.value;
      time.start.epoch = location.start.epoch;
      CMTimeValue v65 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&location.start.value;
      time.start.epoch = location.start.epoch;
      double v66 = CMTimeGetSeconds(&time.start);
      time.start = location.duration;
      Float64 v67 = CMTimeGetSeconds(&time.start);
      LODWORD(time.start.value) = 134218752;
      *(Float64 *)((char *)&time.start.value + 4) = Seconds;
      LOWORD(time.start.flags) = 2048;
      *(double *)((char *)&time.start.flags + 2) = v63 + v64;
      HIWORD(time.start.epoch) = 2048;
      time.duration.value = v65;
      LOWORD(time.duration.timescale) = 2048;
      *(double *)((char *)&time.duration.timescale + 2) = v66 + v67;
      _os_log_impl(&dword_1B05B7000, v61, OS_LOG_TYPE_DEFAULT, "SeekableTimeRanges changed {%f, %f} -> {%f, %f}.", (uint8_t *)&time, 0x2Au);
    }

    CMTimeRange time = buf;
    CMTimeRange range2 = location;
    if (!CMTimeRangeEqual(&time, &range2))
    {
      if (LOBYTE(self->_liveStreamMaxTiming))
      {
        if ((location.start.flags & 1) != 0
          && (location.duration.flags & 1) != 0
          && !location.duration.epoch
          && (location.duration.value & 0x8000000000000000) == 0
          && (buf.start.flags & 1) != 0
          && (buf.duration.flags & 1) != 0
          && !buf.duration.epoch
          && (buf.duration.value & 0x8000000000000000) == 0)
        {
          CMTimeRange time = location;
          *(_OWORD *)&range2.start.value = *(_OWORD *)&buf.start.value;
          range2.start.epoch = buf.start.epoch;
          if (!CMTimeRangeContainsTime(&time, &range2.start))
          {
            LOBYTE(self->_liveStreamMaxTiming) = 0;
            long long v68 = _AVLog();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              int liveStreamMaxTiming_low = LOBYTE(self->_liveStreamMaxTiming);
              LODWORD(time.start.value) = 67109120;
              HIDWORD(time.start.value) = liveStreamMaxTiming_low;
              _os_log_impl(&dword_1B05B7000, v68, OS_LOG_TYPE_DEFAULT, "liveStreamEventModePossible: %d", (uint8_t *)&time, 8u);
            }
          }
        }
      }
      [(AVPlayerController *)self updateMinMaxTiming];
    }

    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"hasLiveStreamingContent"])
  {
    [(AVPlayerController *)self updateMinMaxTiming];
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"timeControlStatus"])
  {
    long long v44 = [(AVPlayerController *)self player];
    CMTimeValue v45 = [v44 timeControlStatus];

    __int16 v46 = _AVLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = v45;
      _os_log_impl(&dword_1B05B7000, v46, OS_LOG_TYPE_DEFAULT, "Time control status = %ld", (uint8_t *)&buf, 0xCu);
    }

    if (v45)
    {
      if (v45 == 2)
      {
        self->_shouldPlayImmediately = 0;
        id retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
        self->_id retryPlayingImmediatelyBlock = 0;
      }
      else if (v45 == 1)
      {
        self->_shouldPlayImmediately = 1;
      }
    }
    else
    {
      id v79 = self->_retryPlayingImmediatelyBlock;
      self->_id retryPlayingImmediatelyBlock = 0;
    }
    [(AVPlayerController *)self _setNeedsAtLiveEdgeStateUpdate];
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.currentItem.playbackLikelyToKeepUp"])
  {
    double v48 = _AVLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v49 = [(AVPlayerController *)self player];
      double v50 = [v49 currentItem];
      int v51 = [v50 isPlaybackLikelyToKeepUp];
      id v52 = @"NO";
      if (v51) {
        id v52 = @"YES";
      }
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v52;
      _os_log_impl(&dword_1B05B7000, v48, OS_LOG_TYPE_DEFAULT, "Playback likely to keep up changed to: %@", (uint8_t *)&buf, 0xCu);
    }
    if (AVPlayerControllerAutoplayEnabled == 1
      && ![(AVPlayerController *)self coordinatedPlaybackActive])
    {
      if (BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount))
      {
        v53 = [(AVPlayerController *)self player];
        v54 = [v53 currentItem];
        int v55 = [v54 isPlaybackLikelyToKeepUp];

        if (v55)
        {
          v56 = _AVLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.start.value) = 136315138;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[AVPlayerController _observeValueForKeyPath:o"
                                                                          "ldValue:newValue:]";
            _os_log_impl(&dword_1B05B7000, v56, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES because AVPlayerControllerAutoplayEnabled", (uint8_t *)&buf, 0xCu);
          }

          [(AVPlayerController *)self setPlaying:1];
        }
      }
    }
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.currentItem.playbackBufferEmpty"])
  {
    uint64_t v70 = _AVLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = [(AVPlayerController *)self player];
      v72 = [v71 currentItem];
      LODWORD(buf.start.value) = 67109120;
      HIDWORD(buf.start.value) = [v72 isPlaybackBufferEmpty];
      _os_log_impl(&dword_1B05B7000, v70, OS_LOG_TYPE_DEFAULT, "isPlaybackBufferEmpty: %d", (uint8_t *)&buf, 8u);
    }
    if (AVPlayerControllerAutoplayEnabled == 1
      && ![(AVPlayerController *)self coordinatedPlaybackActive])
    {
      v73 = [(AVPlayerController *)self player];
      __int16 v74 = [v73 currentItem];
      if ([v74 isPlaybackBufferEmpty])
      {
        id v75 = [(AVPlayerController *)self player];
        __int16 v76 = [v75 currentItem];
        if ([v76 status] == 1)
        {
          [(AVPlayerController *)self rate];
          BOOL v78 = v77 > 0.0;

          if (v78) {
            BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
    [(AVPlayerController *)self _retryPlayImmediatelyIfNeeded];
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.currentItem.loadedTimeRanges"])
  {
    [(AVPlayerController *)self _retryPlayImmediatelyIfNeeded];
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.rate"])
  {
    id v81 = self->_retryPlayingImmediatelyBlock;
    self->_id retryPlayingImmediatelyBlock = 0;

    __int16 v82 = [(AVPlayerController *)self player];
    [v82 rate];
    float v84 = v83;

    v85 = _AVLog();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 134217984;
      *(double *)((char *)&buf.start.value + 4) = v84;
      _os_log_impl(&dword_1B05B7000, v85, OS_LOG_TYPE_DEFAULT, "Rate changed to: %f", (uint8_t *)&buf, 0xCu);
    }
LABEL_111:

    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"seekToTimeInternal"])
  {
    [(AVPlayerController *)self seekToTimeInternal];
    Float64 v86 = CMTimeGetSeconds(&v111);
    objc_initWeak((id *)&buf, self);
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_272;
    v109[3] = &unk_1E5FC41D0;
    objc_copyWeak(v110, (id *)&buf);
    v110[1] = *(id *)&v86;
    dispatch_async(MEMORY[0x1E4F14428], v109);
    objc_destroyWeak(v110);
    objc_destroyWeak((id *)&buf);
    goto LABEL_107;
  }
  if ([v8 isEqualToString:@"player.externalPlaybackActive"])
  {
    if ([(AVPlayerController *)self isExternalPlaybackActive])
    {
      v87 = [MEMORY[0x1E4FB1438] sharedApplication];
      if ([v87 applicationState] == 2)
      {
        BOOL v88 = [(AVPlayerController *)self isPlaying];

        if (v88)
        {
          v89 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
          v90 = [MEMORY[0x1E4F28B50] mainBundle];
          v91 = [v90 bundleIdentifier];
          [v89 setAttribute:v91 forKey:*MEMORY[0x1E4F74AA8] error:0];

          [(AVPlayerController *)self pauseForAllCoordinatedPlaybackParticipants:0];
        }
      }
      else
      {
      }
      if ([(AVPlayerController *)self externalPlaybackType] == 1)
      {
        v99 = +[AVAirMessageDispatcher shared];
        int v100 = [v99 haveAirPlayService];

        if (v100)
        {
          v101 = [(AVPlayerController *)self player];
          v102 = [v101 currentItem];
          objc_msgSend(v102, "avkit_airMessageSendToAppleTV");
        }
      }
    }
  }
  else
  {
    if ([v8 isEqualToString:@"audioFormats"])
    {
      [(AVPlayerController *)self reloadAudioOptions];
      goto LABEL_107;
    }
    if (![v8 isEqualToString:@"isPiPAvailable"])
    {
      v85 = _AVLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v103 = _AVMethodProem(self);
        LODWORD(buf.start.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v103;
        LOWORD(buf.start.flags) = 2112;
        *(void *)((char *)&buf.start.flags + 2) = v8;
        _os_log_error_impl(&dword_1B05B7000, v85, OS_LOG_TYPE_ERROR, "Failed to handle %@ %@", (uint8_t *)&buf, 0x16u);
      }
      goto LABEL_111;
    }
    v92 = [MEMORY[0x1E4F153E0] sharedInstance];
    unsigned int v93 = [v92 isPiPAvailable];

    v94 = [MEMORY[0x1E4F28B50] mainBundle];
    v95 = [v94 bundleIdentifier];
    int v96 = [v95 isEqualToString:@"com.apple.videos"];

    uint64_t v97 = v96 | v93;
    if ((v97 & 1) == 0)
    {
      v98 = _AVLog();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1B05B7000, v98, OS_LOG_TYPE_DEFAULT, "AVAudioSession indicates PIP is unavailable for this audio session", (uint8_t *)&buf, 2u);
      }
    }
    [(id)objc_opt_class() setCachedIsPictureInPictureSupported:v97];
    [(AVPlayerController *)self setPictureInPictureSupported:v97];
  }
LABEL_107:
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    [WeakRetained setSeekingInternal:0];
    long long v5 = *MEMORY[0x1E4F1F9F8];
    long long v4 = v5;
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v3 = v6;
    [v2 setSeekToTimeInternal:&v5];
    *(_OWORD *)(v2 + 172) = v4;
    *(void *)(v2 + 188) = v3;
    *(_OWORD *)(v2 + 196) = v4;
    *(void *)(v2 + 212) = v3;
  }
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_219(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMetadata];
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) statusOfValueForKey:@"commonMetadata" error:0] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _updateMetadata];
  }
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_3(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v3 = [v2 arrayByAddingObject:@"und"];
  long long v4 = objc_msgSend(v1, "avkit_chapterMetadataGroupsBestMatchingPreferredLanguages:", v3);

  long long v5 = dispatch_group_create();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v6;
        double v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = [v7 items];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
              dispatch_group_enter(v5);
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              void v24[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_4;
              v24[3] = &unk_1E5FC4698;
              CMTime v25 = v5;
              [v13 loadValuesAsynchronouslyForKeys:&unk_1F094A3B8 completionHandler:v24];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v19);
  }

  id v14 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_5;
  block[3] = &unk_1E5FC4180;
  id v22 = obj;
  id v15 = obj;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  dispatch_group_notify(v5, v14, block);

  objc_destroyWeak(&v23);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_9(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"availableChapterLocales" error:0];
  if (result == 2)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_10(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_11;
  v2[3] = &unk_1E5FC4180;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_13(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"composable" error:0];
  if (result == 2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_14(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_15;
  v2[3] = &unk_1E5FC4180;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_17(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"hasProtectedContent" error:0];
  if (result == 2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_18(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_19;
  v2[3] = &unk_1E5FC4180;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_21(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"availableMetadataFormats" error:0];
  if (result == 2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_22(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_23;
  v2[3] = &unk_1E5FC4180;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_25(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) statusOfValueForKey:@"compatibleWithAirPlayVideo" error:0];
  if (result == 2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_272(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSeekToTime:*(double *)(a1 + 40)];
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCompatibleWithAirPlayVideo:", objc_msgSend(*(id *)(a1 + 32), "isCompatibleWithAirPlayVideo"));
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) availableMetadataFormats];
  [WeakRetained setAvailableMetadataFormats:v2];
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHasProtectedContent:", objc_msgSend(*(id *)(a1 + 32), "hasProtectedContent"));
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setComposable:", objc_msgSend(*(id *)(a1 + 32), "isComposable"));
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_4(uint64_t a1)
{
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_5(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v14 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v27;
    uint64_t v16 = *MEMORY[0x1E4F15CD0];
    uint64_t v5 = *MEMORY[0x1E4F15DE0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "items", v14);
        uint64_t v9 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v8 withKey:v16 keySpace:v5];
        uint64_t v10 = [v9 lastObject];
        uint64_t v11 = [v10 stringValue];

        if (v7)
        {
          [v7 timeRange];
          *(_OWORD *)&time.value = v23;
          time.epoch = v24;
          double Seconds = CMTimeGetSeconds(&time);
          [v7 timeRange];
        }
        else
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v23 = 0u;
          memset(&time, 0, sizeof(time));
          double Seconds = CMTimeGetSeconds(&time);
          long long v21 = 0u;
          memset(v22, 0, sizeof(v22));
        }
        CMTime time = *(CMTime *)((char *)v22 + 8);
        uint64_t v13 = +[AVChapter playbackChapterWithStartTime:duration:number:title:imageFaultBlock:](AVChapter, "playbackChapterWithStartTime:duration:number:title:imageFaultBlock:", [v2 count] + 1, v11, 0, Seconds, CMTimeGetSeconds(&time));
        [v2 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  if ([v2 count])
  {
    [v2 sortUsingComparator:&__block_literal_global_235];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_7;
    block[3] = &unk_1E5FC4180;
    objc_copyWeak(&v20, (id *)(v14 + 40));
    id v19 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v20);
  }
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(a1 + 32)];
  [WeakRetained setContentChapters:v2];
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 startTime];
  double v7 = v6;
  [v5 startTime];
  if (v7 <= v8)
  {
    [v4 startTime];
    double v11 = v10;
    [v5 startTime];
    if (v11 < v12) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (BOOL)isCompletelySeekable
{
  uint64_t v3 = [(AVPlayerController *)self seekableTimeRanges];

  if (!v3) {
    return 0;
  }
  memset(&v16, 0, sizeof(v16));
  id v4 = [(AVPlayerController *)self player];
  id v5 = [v4 currentItem];
  double v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  *(_OWORD *)&v12.start.value = *MEMORY[0x1E4F1FA48];
  v12.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CMTimeRangeMake(&v16, &v12.start, &duration);

  double v8 = [(AVPlayerController *)self seekableTimeRanges];
  if ([v8 count] == 1)
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    double v10 = v9;
    if (v9) {
      [v9 CMTimeRangeValue];
    }
    else {
      memset(&range, 0, sizeof(range));
    }
    CMTimeRange v12 = v16;
    CMTimeRangeGetIntersection(&range1, &range, &v12);
    CMTimeRange v12 = v16;
    BOOL v7 = CMTimeRangeEqual(&range1, &v12) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSError)error
{
  uint64_t v3 = [(AVPlayerController *)self player];
  id v4 = [v3 error];

  if (!v4)
  {
    id v5 = [(AVPlayerController *)self player];
    double v6 = [v5 currentItem];
    id v4 = [v6 error];
  }

  return (NSError *)v4;
}

- (BOOL)isReadyToPlay
{
  return [(AVPlayerController *)self status] == 2;
}

- (int64_t)status
{
  uint64_t v3 = [(AVPlayerController *)self player];
  uint64_t v4 = [v3 status];

  if (!v4) {
    goto LABEL_10;
  }
  if (v4 != 1)
  {
    if (v4 == 2) {
      return 3;
    }
    else {
      return 0;
    }
  }
  double v6 = [(AVPlayerController *)self player];
  BOOL v7 = [v6 currentItem];
  uint64_t v8 = [v7 status];

  switch(v8)
  {
    case 0:
LABEL_10:
      uint64_t v9 = [(AVPlayerController *)self player];
      double v10 = [v9 currentItem];
      int64_t v5 = v10 != 0;

      return v5;
    case 2:
      return 3;
    case 1:
      return 2;
  }
  return 0;
}

- (id)_queuePlayer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(AVPlayerController *)self player];
    objc_opt_class();
    int v8 = 136315394;
    uint64_t v9 = "-[AVPlayerController _queuePlayer]";
    __int16 v10 = 1024;
    LOBYTE(v11) = objc_opt_isKindOfClass() & 1;
    int v11 = v11;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s queuePlayer: %d", (uint8_t *)&v8, 0x12u);
  }
  int64_t v5 = [(AVPlayerController *)self player];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(AVPlayerController *)self player];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t result = (CGAffineTransform *)self->_currentAudioTrack;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result preferredTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)startKVO
{
  v55[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v3 = [(AVPlayerController *)self observationController];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __30__AVPlayerController_startKVO__block_invoke;
  v44[3] = &unk_1E5FC40E8;
  objc_copyWeak(&v45, &location);
  uint64_t v4 = (void *)MEMORY[0x1B3E963E0](v44);
  int64_t v5 = [(AVPlayerController *)self assetInspectionQueue];
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  id v40 = __30__AVPlayerController_startKVO__block_invoke_2;
  uint64_t v41 = &unk_1E5FC4138;
  objc_copyWeak(&v43, &location);
  id v6 = v4;
  id v42 = v6;
  dispatch_async(v5, &v38);

  id v7 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, @"player.externalPlaybackActive", 1, v6, v38, v39, v40, v41);
  id v8 = (id)[v3 startObserving:self keyPath:@"player.currentItem" includeInitialValue:1 observationHandler:v6];
  id v9 = (id)[v3 startObserving:self keyPath:@"currentAssetIfReady" includeInitialValue:1 observationHandler:v6];
  id v10 = (id)[v3 startObserving:self keyPath:@"timeControlStatus" includeInitialValue:1 observationHandler:v6];
  id v11 = (id)[v3 startObserving:self keyPath:@"player.currentItem.seekableTimeRanges" includeInitialValue:1 observationHandler:v6];
  id v12 = (id)[v3 startObserving:self keyPath:@"player.currentItem.loadedTimeRanges" includeInitialValue:1 observationHandler:v6];
  id v13 = (id)[v3 startObserving:self keyPath:@"player.currentItem.playbackBufferEmpty" includeInitialValue:0 observationHandler:v6];
  if (AVPlayerControllerAutoplayEnabled == 1) {
    id v14 = (id)[v3 startObserving:self keyPath:@"player.currentItem.playbackLikelyToKeepUp" includeInitialValue:0 observationHandler:v6];
  }
  id v15 = (id)[v3 startObserving:self keyPath:@"player.rate" includeInitialValue:1 observationHandler:v6];
  id v16 = (id)[v3 startObserving:self keyPath:@"hasLiveStreamingContent" includeInitialValue:1 observationHandler:v6];
  id v17 = (id)[v3 startObserving:self keyPath:@"seekToTimeInternal" includeInitialValue:0 observationHandler:v6];
  uint64_t v18 = [(AVPlayerController *)self observationController];
  v55[0] = @"player.currentItem.presentationSize";
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  id v20 = (id)[v18 startObserving:self keyPaths:v19 includeInitialValue:1 observationHandler:&__block_literal_global_147];

  long long v21 = [(AVPlayerController *)self observationController];
  v54 = @"contentDimensions";
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  id v23 = (id)[v21 startObserving:self keyPaths:v22 includeInitialValue:0 observationHandler:&__block_literal_global_152];

  v53[0] = @"player.currentItem.asset";
  v53[1] = @"readyToPlay";
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  id v25 = (id)[v3 startObserving:self keyPaths:v24 includeInitialValue:1 observationHandler:&__block_literal_global_160];

  v52[0] = @"player.currentItem.duration";
  v52[1] = @"readyToPlay";
  long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  id v27 = (id)[v3 startObserving:self keyPaths:v26 includeInitialValue:1 observationHandler:&__block_literal_global_165];

  v51[0] = @"hasEnabledAudio";
  v51[1] = @"currentAudioMediaSelectionOption";
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  id v29 = (id)[v3 startObserving:self keyPaths:v28 observationHandler:&__block_literal_global_173];

  v50[0] = @"hasEnabledVideo";
  v50[1] = @"currentVideoMediaSelectionOption";
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  id v31 = (id)[v3 startObserving:self keyPaths:v30 observationHandler:&__block_literal_global_181];

  v49[0] = @"player.externalPlaybackActive";
  v49[1] = @"externalPlaybackType";
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  id v33 = (id)[v3 startObserving:self keyPaths:v32 includeInitialValue:1 observationHandler:&__block_literal_global_186_22754];

  double v48 = @"currentAssetIfReady";
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  id v35 = (id)[v3 startObserving:self keyPaths:v34 observationHandler:&__block_literal_global_188];

  long long v47 = @"player.currentItem.tracks";
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  id v37 = (id)[v3 startObserving:self keyPaths:v36 includeInitialValue:1 observationHandler:&__block_literal_global_193];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&location);
}

void __30__AVPlayerController_startKVO__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [v5 keyPath];
  id v7 = [v5 oldValue];
  id v8 = [v5 value];

  [WeakRetained _observeValueForKeyPath:v6 oldValue:v7 newValue:v8];
}

void __30__AVPlayerController_startKVO__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F153E0] sharedInstance];
  char v3 = [v2 isPiPAvailable];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVPlayerController_startKVO__block_invoke_3;
  block[3] = &unk_1E5FC4110;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = v3;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __30__AVPlayerController_startKVO__block_invoke_13(uint64_t a1, unsigned char *a2)
{
}

- (void)_updateIsPlayingHDRContentIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1 && FigIsHDRAllowedOnDevice())
  {
    uint64_t v2 = [a1 player];
    char v3 = [v2 currentItem];
    uint64_t v4 = [v3 tracks];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      uint64_t v9 = *MEMORY[0x1E4F15C18];
      uint64_t v10 = *MEMORY[0x1E4F15B18];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "assetTrack", (void)v20);
          if ([v12 isEnabled] && objc_msgSend(v13, "isEnabled"))
          {
            id v14 = [v13 mediaType];
            if ([v14 isEqualToString:v9])
            {
              int v15 = [v13 hasMediaCharacteristic:v10];

              if (v15)
              {

                int v16 = 1;
                goto LABEL_17;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    int v16 = 0;
LABEL_17:

    if (a1[384] != v16)
    {
      a1[384] = v16;
      id v17 = [a1 internalDelegate];
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        id v19 = [a1 internalDelegate];
        [v19 playerControllerDidUpdateIsPlayingHDRContent:a1];
      }
    }
  }
}

void __30__AVPlayerController_startKVO__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  [v2 _updateCurrentAudioTrackIfNeeded];
  [v2 _updateCurrentVideoTrackIfNeeded];
  -[AVPlayerController _updateIsPlayingHDRContentIfNeeded](v2);
}

void __30__AVPlayerController_startKVO__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  objc_initWeak(&location, v2);
  char v3 = v2[42];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__AVPlayerController_startKVO__block_invoke_11;
  v4[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__AVPlayerController_startKVO__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded];
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 _updateCurrentVideoTrackIfNeeded];
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 _updateCurrentAudioTrackIfNeeded];
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 updateTiming];
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 _prepareAssetForInspectionIfNeeded];
}

void __30__AVPlayerController_startKVO__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  id v4 = [v2 defaultCenter];
  [v4 postNotificationName:@"AVPlayerControllerContentDimensionsChangedNotification" object:v3];
}

void __30__AVPlayerController_startKVO__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 value];
  [v6 CGSizeValue];
  objc_msgSend(v5, "setPresentationSize:");
}

void __30__AVPlayerController_startKVO__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [WeakRetained _observeValueForKeyPath:@"isPiPAvailable" oldValue:0 newValue:v4];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 observationController];
  uint64_t v7 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v8 = (id)[v6 startObserving:v7 keyPath:@"audioFormats" includeInitialValue:0 observationHandler:*(void *)(a1 + 32)];

  id v12 = objc_loadWeakRetained(v2);
  uint64_t v9 = [v12 observationController];
  uint64_t v10 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v11 = (id)[v9 startObserving:v10 keyPath:@"isPiPAvailable" includeInitialValue:0 observationHandler:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_isDeallocating = 1;
  id v3 = [(AVPlayerController *)self observationController];
  [v3 stopAllObservation];

  id v4 = [(AVPlayerController *)self reduceResourceUsageAssertion];
  [v4 invalidate];

  [(AVPlayerController *)self setPlayerLayerForReducingResources:0];
  [(NSDate *)self->_lastTimePlayingOnMatchPointDeviceWasUpdated invalidate];
  lastTimePlayingOnMatchPointDeviceWasUpdated = self->_lastTimePlayingOnMatchPointDeviceWasUpdated;
  self->_lastTimePlayingOnMatchPointDeviceWasUpdated = 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E4F31210], 0);
  uint64_t v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, self, (CFNotificationName)*MEMORY[0x1E4F31218], 0);
  if (self->_updateAtMinMaxTimePeriodicObserverToken) {
    objc_msgSend(*(id *)&self->_canTogglePictureInPicture, "removeTimeObserver:");
  }
  [(AVPlayerController *)self stopGeneratingTimecodes];
  id retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
  self->_id retryPlayingImmediatelyBlock = 0;

  uint64_t v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTimeRange buf = 136315650;
    id v13 = "-[AVPlayerController dealloc]";
    __int16 v14 = 1024;
    int v15 = 843;
    __int16 v16 = 2048;
    id v17 = self;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  [*(id *)&self->_muted invalidate];
  uint64_t v10 = *(void **)&self->_muted;
  *(void *)&self->_muted = 0;

  v11.receiver = self;
  v11.super_class = (Class)AVPlayerController;
  [(AVPlayerController *)&v11 dealloc];
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlayingOnMatchPointDeviceIfNeeded];
}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 _updateActivePlayer];
}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 _updateActivePlayer];
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3_85(uint64_t a1, unsigned char *a2)
{
  if (!a2[369])
  {
    uint64_t v2 = a2;
    id v3 = [v2 player];
    objc_msgSend(v2, "setMuted:", objc_msgSend(v3, "isMuted"));
  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2_78(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 object];
  [v5 _throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext:v6];
}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_75(uint64_t a1, void *a2)
{
  return [a2 _updateCoordinatedPlaybackActive];
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3_72(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 externalPlaybackType];
  id v4 = _AVLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 1)
  {
    if (v5)
    {
      int v7 = 136315394;
      id v8 = "-[AVPlayerController startInspectionIfNeeded]_block_invoke_3";
      __int16 v9 = 2114;
      uint64_t v10 = (uint64_t)v2;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s have AirPlay to AppleTV for %{public}@", (uint8_t *)&v7, 0x16u);
    }

    id v4 = [v2 player];
    id v6 = [v4 currentItem];
    objc_msgSend(v6, "avkit_airMessageSendToAppleTV");
  }
  else if (v5)
  {
    int v7 = 136315394;
    id v8 = "-[AVPlayerController startInspectionIfNeeded]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = [v2 externalPlaybackType];
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s have AirPlay to AppleTV, but externalPlaybackType = %ld", (uint8_t *)&v7, 0x16u);
  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2_69(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v5 = a4;
  id v6 = [v9 player];
  int v7 = [v6 currentItem];
  id v8 = [v5 object];

  LODWORD(v5) = [v7 isEqual:v8];
  if (v5) {
    [v9 reloadOptionsAndCurrentSelections];
  }
}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_66(uint64_t a1, void *a2)
{
  return [a2 reloadOptions];
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_54(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 player];
    [v8 rate];
    double v10 = v9;
    uint64_t v11 = [v6 userInfo];
    int v36 = 134218242;
    double v37 = v10;
    __int16 v38 = 2112;
    uint64_t v39 = v11;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVAudioSessionInterruptionNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v36, 0x16u);
  }
  if ([v5 handlesAudioSessionInterruptions])
  {
    id v12 = [v6 userInfo];
    id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F15020]];
    uint64_t v14 = [v13 unsignedIntegerValue];

    if (!v14)
    {
      int v15 = _AVLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [v5[14] doubleValue];
        int v36 = 134217984;
        double v37 = *(double *)&v16;
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "AVAudioSessionInterruptionTypeEnded: %f", (uint8_t *)&v36, 0xCu);
      }

      id v17 = v5[14];
      if (v17)
      {
        id v18 = v17;
        id v19 = v5[14];
        v5[14] = 0;

        long long v20 = [v6 userInfo];
        long long v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F15008]];
        char v22 = [v21 unsignedIntegerValue];

        if (v22)
        {
          if (objc_opt_respondsToSelector())
          {
            long long v23 = [v5 internalDelegate];
            int v24 = [v23 playerControllerCanRestorePlaybackRateAfterAudioSessionDeactivation:v5];
          }
          else
          {
            int v24 = 0;
          }
          uint64_t v25 = [MEMORY[0x1E4FB1438] sharedApplication];
          if ([v25 applicationState]) {
            int v26 = [v5 isPictureInPictureActive] | v24;
          }
          else {
            int v26 = 1;
          }

          id v27 = _AVLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            if (v26) {
              long long v28 = "YES";
            }
            else {
              long long v28 = "NO";
            }
            int v36 = 136315650;
            double v37 = COERCE_DOUBLE("-[AVPlayerController startInspectionIfNeeded]_block_invoke");
            __int16 v38 = 2080;
            uint64_t v39 = "shouldRestoreRate";
            __int16 v40 = 2080;
            uint64_t v41 = v28;
            _os_log_impl(&dword_1B05B7000, v27, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v36, 0x20u);
          }

          id v29 = _AVLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            if (v24) {
              long long v30 = "YES";
            }
            else {
              long long v30 = "NO";
            }
            int v36 = 136315650;
            double v37 = COERCE_DOUBLE("-[AVPlayerController startInspectionIfNeeded]_block_invoke");
            __int16 v38 = 2080;
            uint64_t v39 = "delegateCanResumeAfterInterruption";
            __int16 v40 = 2080;
            uint64_t v41 = v30;
            _os_log_impl(&dword_1B05B7000, v29, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v36, 0x20u);
          }

          if (v26)
          {
            if ([v5 isPictureInPictureActive])
            {
              id v31 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
              uint64_t v32 = [MEMORY[0x1E4F28B50] mainBundle];
              id v33 = [v32 bundleIdentifier];
              [v31 setAttribute:v33 forKey:*MEMORY[0x1E4F74AA8] error:0];
            }
            if ([v5 hasLiveStreamingContent]) {
              [v5 gotoEndOfSeekableRanges:0];
            }
            [v18 floatValue];
            if (v34 != 0.0)
            {
              [v18 floatValue];
              [v5 setRate:v35];
            }
          }
        }
      }
    }
  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = [v5 player];
  [v7 rate];
  float v9 = v8;

  double v10 = _AVLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 userInfo];
    int v15 = 134218242;
    double v16 = v9;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVPlayerPlaybackWasInterruptedNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v15, 0x16u);
  }
  if ([v5 handlesAudioSessionInterruptions] && v9 != 0.0)
  {
    *(float *)&double v12 = v9;
    uint64_t v13 = [NSNumber numberWithFloat:v12];
    uint64_t v14 = (void *)v5[14];
    v5[14] = v13;
  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  double v16 = a2;
  id v5 = [a4 object];
  id v6 = [v16 player];
  int v7 = [v6 currentItem];

  if (v5 == v7)
  {
    if (AVPlayerControllerAutoplayEnabled == 1) {
      v16[273] = 0;
    }
    if ([v16 isLooping])
    {
      float v8 = [v16 player];
      [v8 rate];
      float v10 = v9;

      if (v10 >= 0.0) {
        [v16 seekToBeginning:0];
      }
      else {
        [v16 seekToEnd:0];
      }
    }
    uint64_t v11 = [v16 player];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [v16 player];
      uint64_t v13 = [v12 items];
      unint64_t v14 = [v13 count];

      if (v14 > 1) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"AVPlayerControllerPlaybackDidEndNotification" object:v16];
  }
LABEL_13:
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v5 = [a4 object];
  id v6 = [v9 player];
  int v7 = [v6 currentItem];

  if (v5 == v7)
  {
    float v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"AVPlayerControllerCurrentTimeJumpedNotification" object:v9];

    if (([v9 isScrubbing] & 1) == 0) {
      [v9 _setNeedsAtLiveEdgeStateUpdate];
    }
  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v5 = a4;
  if ([v10 isReadyToPlay])
  {
    id v6 = [v5 object];
    int v7 = [v10 player];
    float v8 = [v7 currentItem];
    uint64_t v9 = [v8 timebase];

    if (v6 == (void *)v9) {
      [v10 updateTiming];
    }
  }
}

void __37__AVPlayerController_initWithPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v2 = [v9 pipActivitySessionIdentifier];
  uint64_t v3 = [v9 player];
  id v4 = [v3 backgroundPIPAuthorizationToken];
  char v5 = [v2 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [v9 player];
    int v7 = [v6 backgroundPIPAuthorizationToken];
    [v9 setPipActivitySessionIdentifier:v7];

    float v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification" object:v9];
  }
}

- (AVPlayerController)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTimeRange buf = 136315394;
    id v9 = "-[AVPlayerController init]";
    __int16 v10 = 1024;
    int v11 = 457;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerController;
  id v4 = [(AVPlayerController *)&v7 init];
  char v5 = v4;
  if (v4)
  {
    [(AVPlayerController *)v4 _commonInit];
    BYTE1(v5->_liveEdgeTimer) = 0;
    BYTE3(v5->_photosensitivityMetadataHandler) = 0;
  }
  return v5;
}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"pictureInPictureSupported", @"status", @"hasVideo", @"hasEnabledVideo", @"playingOnExternalScreen", @"pipActivitySessionIdentifier", 0);
}

+ (id)keyPathsForValuesAffectingExternalPlaybackType
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.externalPlaybackActive", @"playingOnSecondScreen", 0);
}

+ (id)keyPathsForValuesAffectingExternalPlaybackActive
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.externalPlaybackActive"];
}

+ (id)keyPathsForValuesAffectingPlayingOnExternalScreen
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"externalPlaybackActive", @"playingOnSecondScreen", 0);
}

+ (id)keyPathsForValuesAffectingAllowsExternalPlayback
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.allowsExternalPlayback"];
}

+ (id)keyPathsForValuesAffectingCanSeekChapterBackward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"contentChapters", @"canSeek", 0);
}

+ (id)keyPathsForValuesAffectingCanSeekChapterForward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"contentChapters", @"canSeek", 0);
}

+ (id)keyPathsForValuesAffectingCanSeekFrameBackward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"atMinTime", @"canSeek", 0);
}

+ (id)keyPathsForValuesAffectingCanSeekFrameForward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"atMaxTime", @"canSeek", 0);
}

+ (id)keyPathsForValuesAffectingCanSeekToEnd
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"canSeek"];
}

+ (id)keyPathsForValuesAffectingCanSeekToBeginning
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"canSeek"];
}

+ (id)keyPathsForValuesAffectingCanScanBackward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.currentItem.canPlayFastReverse", @"touchBarRequiresLinearPlayback", @"pictureInPictureInterrupted", 0);
}

+ (id)keyPathsForValuesAffectingCanScanForward
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.currentItem.canPlayFastForward", @"touchBarRequiresLinearPlayback", @"pictureInPictureInterrupted", 0);
}

+ (id)keyPathsForValuesAffectingCanSeek
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"seekableTimeRanges", @"readyToPlay", @"hasLiveStreamingContent", @"hasSeekableLiveStreamingContent", @"touchBarRequiresLinearPlayback", @"pictureInPictureInterrupted", 0);
}

+ (id)keyPathsForValuesAffectingHasShareableContent
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"availableMetadataFormats", @"hasProtectedContent", @"currentAssetIfReady", 0);
}

+ (id)keyPathsForValuesAffectingHasTrimmableContent
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"completelySeekable", @"player.currentItem.asset", 0);
}

+ (id)keyPathsForValuesAffectingHasSeekableLiveStreamingContent
{
  v6[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"hasLiveStreamingContent";
  v6[1] = @"minTiming";
  v6[2] = @"maxTiming";
  void v6[3] = @"player.currentItem.liveUpdateInterval";
  void v6[4] = @"player.currentItem.seekableTimeRangesLastModifiedTime";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingHasLiveStreamingContent
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"readyToPlay";
  v6[1] = @"player.currentItem.duration";
  v6[2] = @"hasEnabledVideo";
  void v6[3] = @"hasEnabledAudio";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)keyPathsForValuesAffectingPlayableOffline
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"currentAssetIfReady"];
}

+ (id)keyPathsForValuesAffectingStreaming
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"currentAssetIfReady"];
}

+ (id)keyPathsForValuesAffectingHasContentChapters
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"contentChapters"];
}

+ (id)keyPathsForValuesAffectingHasEnabledVideo
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.hasEnabledVideo"];
}

+ (id)keyPathsForValuesAffectingHasVideo
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.hasVideo"];
}

+ (id)keyPathsForValuesAffectingHasEnabledAudio
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.hasEnabledAudio"];
}

+ (id)keyPathsForValuesAffectingLoadedTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.currentItem.loadedTimeRanges", @"readyToPlay", @"contentDuration", 0);
}

+ (id)keyPathsForValuesAffectingSeekableTimeRanges
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.seekableTimeRanges"];
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentTime", @"minTime", 0);
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"minTime", @"maxTime", 0);
}

+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.forwardPlaybackEndTime"];
}

+ (id)keyPathsForValuesAffectingMaxTime
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"forwardPlaybackEndTime", @"contentDuration", @"hasSeekableLiveStreamingContent", @"maxTiming", 0);
}

+ (id)keyPathsForValuesAffectingReversePlaybackEndTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.reversePlaybackEndTime"];
}

+ (id)keyPathsForValuesAffectingMinTime
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"reversePlaybackEndTime", @"hasSeekableLiveStreamingContent", @"minTiming", 0);
}

+ (id)keyPathsForValuesAffectingCurrentTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"timing"];
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.duration"];
}

+ (id)keyPathsForValuesAffectingHasContent
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem"];
}

+ (id)keyPathsForValuesAffectingVolume
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.volume"];
}

+ (id)keyPathsForValuesAffectingCanTogglePlayback
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"readyToPlay", @"pictureInPictureInterrupted", 0);
}

+ (id)keyPathsForValuesAffectingCanPause
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"readyToPlay"];
}

+ (id)keyPathsForValuesAffectingPlaying
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"rate"];
}

+ (id)keyPathsForValuesAffectingCanPlay
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"readyToPlay", @"pictureInPictureInterrupted", 0);
}

+ (id)keyPathsForValuesAffectingDefaultPlaybackRate
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.defaultRate", 0);
}

+ (id)keyPathsForValuesAffectingActiveRate
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"activePlayer.rate", 0);
}

+ (id)keyPathsForValuesAffectingCompletelySeekable
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.currentItem.duration", @"seekableTimeRanges", 0);
}

+ (id)keyPathsForValuesAffectingError
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"player.error", @"player.currentItem.error", 0);
}

+ (id)keyPathsForValuesAffectingpreferredTransform
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentVideoTrack.preferredTransform", 0);
}

+ (void)setCachedIsPictureInPictureSupported:(BOOL)a3
{
  AVPlayerControllerCachedIsPictureInPictureSupported = a3;
}

- (id)maxFrameCountString
{
  id v2 = [(AVPlayerController *)self timecodeController];
  uint64_t v3 = [v2 maxFrameCountString];

  return v3;
}

- (id)maxTimecode
{
  id v2 = [(AVPlayerController *)self timecodeController];
  uint64_t v3 = [v2 maxTimecodeString];

  return v3;
}

- (int64_t)frameNumberForCurrentTime
{
  id v3 = [(AVPlayerController *)self loadTimecodeControllerIfNeeded];
  id v4 = [(AVPlayerController *)self timecodeController];
  char v5 = [(AVPlayerController *)self player];
  id v6 = [v5 currentItem];
  objc_super v7 = v6;
  if (v6) {
    [v6 currentTime];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  int64_t v8 = [v4 calculateFrameNumberAtCMTime:v10];

  return v8;
}

- (id)timecodeForCurrentTime
{
  id v3 = [(AVPlayerController *)self loadTimecodeControllerIfNeeded];
  id v4 = [(AVPlayerController *)self timecodeController];
  char v5 = objc_msgSend(v4, "calculateTimecodeAtFrame:", -[AVPlayerController frameNumberForCurrentTime](self, "frameNumberForCurrentTime"));

  return v5;
}

- (void)seekToTimecode:(id)a3
{
  uint64_t v4 = [*(id *)&self->_touchBarRequiresLinearPlayback calculateFrameNumberAtTimecode:a3];
  if ((v4 & 0x8000000000000000) == 0)
  {
    [*(id *)&self->_touchBarRequiresLinearPlayback timeIntervalForFrameNumber:v4];
    -[AVPlayerController seekToTime:](self, "seekToTime:");
  }
}

- (void)stopGeneratingTimecodes
{
  if (self->_timecodePeriodicObserverToken)
  {
    id v3 = [(AVPlayerController *)self player];
    [v3 removeTimeObserver:self->_timecodePeriodicObserverToken];

    id timecodePeriodicObserverToken = self->_timecodePeriodicObserverToken;
    self->_id timecodePeriodicObserverToken = 0;
  }
}

- (BOOL)startGeneratingTimecodesUsingBlock:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (!self->_timecodePeriodicObserverToken)
  {
    objc_super v7 = (void *)[v4 copy];
    if (v7 && [(AVPlayerController *)self hasTimecodes])
    {
      int64_t v8 = [(AVPlayerController *)self loadTimecodeControllerIfNeeded];

      if (!v8)
      {
        BOOL v6 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_initWeak(&location, self);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __100__AVPlayerController_AVPlayerControllerTimecodeSupportInternal__startGeneratingTimecodesUsingBlock___block_invoke;
      v20[3] = &unk_1E5FC4360;
      objc_copyWeak(&v22, &location);
      id v21 = v7;
      id v9 = (void (**)(void, void))MEMORY[0x1B3E963E0](v20);
      __int16 v10 = [(AVPlayerController *)self player];
      int v11 = v10;
      if (v10) {
        [v10 currentTime];
      }
      else {
        memset(v19, 0, sizeof(v19));
      }
      ((void (**)(void, void *))v9)[2](v9, v19);

      uint64_t v12 = [(AVPlayerController *)self player];
      uint64_t v13 = [(AVPlayerController *)self timecodeController];
      unint64_t v14 = v13;
      if (v13) {
        [v13 observationInterval];
      }
      else {
        memset(v18, 0, sizeof(v18));
      }
      int v15 = [v12 addPeriodicTimeObserverForInterval:v18 queue:0 usingBlock:v9];
      id timecodePeriodicObserverToken = self->_timecodePeriodicObserverToken;
      self->_id timecodePeriodicObserverToken = v15;

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    BOOL v6 = 1;
    goto LABEL_15;
  }
  BOOL v6 = 1;
LABEL_16:

  return v6;
}

void __100__AVPlayerController_AVPlayerControllerTimecodeSupportInternal__startGeneratingTimecodesUsingBlock___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained timecodeController];
    long long v11 = *a2;
    uint64_t v12 = *((void *)a2 + 2);
    uint64_t v7 = [v6 calculateFrameNumberAtCMTime:&v11];

    int64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu F", v7);
    id v9 = [v5 timecodeController];
    __int16 v10 = [v9 calculateTimecodeAtFrame:v7];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)seekToFrame:(int64_t)a3
{
  [*(id *)&self->_touchBarRequiresLinearPlayback timeIntervalForFrameNumber:a3];

  -[AVPlayerController seekToTime:](self, "seekToTime:");
}

- (double)timecodeObservationInterval
{
  id v3 = [(AVPlayerController *)self loadTimecodeControllerIfNeeded];
  id v4 = [(AVPlayerController *)self timecodeController];
  char v5 = v4;
  if (v4) {
    [v4 observationInterval];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (id)loadTimecodeControllerIfNeeded
{
  if (!*(void *)&self->_touchBarRequiresLinearPlayback && [(AVPlayerController *)self hasTimecodes])
  {
    id v3 = [AVTimecodeController alloc];
    id v4 = [(AVPlayerController *)self _timecodeTrack];
    char v5 = [(AVPlayerController *)self currentAssetIfReady];
    BOOL v6 = objc_msgSend(v5, "avkit_tracksWithMediaType:", *MEMORY[0x1E4F15C18]);
    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = [(AVTimecodeController *)v3 initWithTimecodeTrack:v4 videoTrack:v7];
    id v9 = *(void **)&self->_touchBarRequiresLinearPlayback;
    *(void *)&self->_touchBarRequiresLinearPlayback = v8;
  }
  __int16 v10 = *(void **)&self->_touchBarRequiresLinearPlayback;

  return v10;
}

- (BOOL)hasTimecodes
{
  id v3 = [(AVPlayerController *)self _timecodeTrack];
  if (v3)
  {
    id v4 = [(AVPlayerController *)self player];
    char v5 = [v4 currentItem];
    BOOL v6 = v5;
    if (v5)
    {
      [v5 reversePlaybackEndTime];
      if ((v31 & 0x100000000) != 0)
      {
        id v9 = [(AVPlayerController *)self player];
        __int16 v10 = [v9 currentItem];
        id v21 = v10;
        id v22 = v9;
        if (v10) {
          [v10 reversePlaybackEndTime];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        char v7 = 0;
        BOOL v8 = 0;
        if (CMTimeCompare(&time1, &time2)) {
          goto LABEL_17;
        }
      }
      else
      {
        char v7 = 1;
      }
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      char v7 = 1;
      uint64_t v32 = 0;
    }
    long long v11 = [(AVPlayerController *)self player];
    uint64_t v12 = [v11 currentItem];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 forwardPlaybackEndTime];
      if ((v26 & 0x100000000) != 0)
      {
        long long v20 = [(AVPlayerController *)self player];
        unint64_t v14 = [v20 currentItem];
        int v15 = v14;
        if (v14) {
          [v14 forwardPlaybackEndTime];
        }
        else {
          memset(&v24, 0, sizeof(v24));
        }
        __int16 v17 = [(AVPlayerController *)self player];
        id v18 = [v17 currentItem];
        uint64_t v19 = v18;
        if (v18) {
          [v18 duration];
        }
        else {
          memset(&v23, 0, sizeof(v23));
        }
        BOOL v8 = CMTimeCompare(&v24, &v23) == 0;

        if (v7) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }

    BOOL v8 = 1;
    if (v7)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v8 = 0;
LABEL_19:

  return v8;
}

- (BOOL)hasReadableTimecodes
{
  if (![(AVPlayerController *)self hasTimecodes]) {
    return 0;
  }
  id v3 = [(AVPlayerController *)self loadTimecodeControllerIfNeeded];
  BOOL v4 = v3 != 0;

  return v4;
}

- (AVTimecodeController)timecodeController
{
  return (AVTimecodeController *)*(id *)&self->_touchBarRequiresLinearPlayback;
}

- (void)setRateWithForce:(double)a3
{
  double v5 = a3;
  if (!BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount))
  {
    if (fabs(a3) < 1.0) {
      return;
    }
    BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
    [(AVPlayerController *)self defaultPlaybackRate];
    double v16 = v15;
    [(AVPlayerController *)self rate];
    if (a3 >= v16)
    {
      *(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = v16;
    }
    else
    {
      [(AVPlayerController *)self rate];
      if (a3 <= -v16) {
        *(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = -v16;
      }
      else {
        *(void *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = 0;
      }
    }
    goto LABEL_4;
  }
  if (a3 == 0.0)
  {
    BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 0;
    [(AVPlayerController *)self setRate:*(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused];
LABEL_4:
    if (!BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount)) {
      return;
    }
  }
  LODWORD(a3) = 1.0;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  char v7 = [MEMORY[0x1E4F39C10] functionWithControlPoints:a3 :0.0 :v3 :v4];
  BOOL v8 = v7;
  double v9 = fabs(v5);
  if (v9 < 1.0) {
    double v9 = 1.0;
  }
  float v10 = v9;
  float v11 = (float)((float)(v10 + -1.0) / 5.6667) + 0.0;
  if (v9 >= 6.666667) {
    *(float *)&double v9 = 1.0;
  }
  else {
    *(float *)&double v9 = v11;
  }
  [v7 _solveForInput:v9];
  double v13 = floorf((float)(v12 * 58.0) + 2.0);
  if (v5 <= 0.0) {
    double v14 = -v13;
  }
  else {
    double v14 = v13;
  }

  [(AVPlayerController *)self setRate:v14];
}

- (CGSize)maximumVideoResolution
{
  double v3 = [(AVPlayerController *)self currentAssetIfReady];
  if (v3)
  {
    double v4 = [(AVPlayerController *)self currentAssetIfReady];
    [v4 maximumVideoResolution];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0x7FF8000000000000;
    uint64_t v6 = 0x7FF8000000000000;
  }

  double v9 = *(double *)&v6;
  double v10 = *(double *)&v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (id)preferredDisplayCriteria
{
  id v2 = [(AVPlayerController *)self currentAssetIfReady];
  double v3 = [v2 preferredDisplayCriteria];

  return v3;
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  id v2 = [(AVPlayerController *)self player];
  char v3 = [v2 usesExternalPlaybackWhileExternalScreenIsActive];

  return v3;
}

- (BOOL)handlesAudioSessionInterruptions
{
  return self->_handlesAudioSessionInterruptions;
}

- (AVPlayerControllerDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timecodeController);

  return (AVPlayerControllerDelegate *)WeakRetained;
}

+ (id)keyPathsForValuesAffectingHasReadableTimecodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentAssetIfReady", @"player.currentItem.reversePlaybackEndTime", @"player.currentItem.forwardPlaybackEndTime", 0);
}

+ (id)keyPathsForValuesAffectingMaximumVideoResolution
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"currentAssetIfReady"];
}

+ (id)keyPathsForValuesAffectingPreferredDisplayCriteria
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"currentAssetIfReady"];
}

+ (id)keyPathsForValuesAffectingUsesExternalPlaybackWhileExternalScreenIsActive
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.usesExternalPlaybackWhileExternalScreenIsActive"];
}

@end