@interface AVPlayer
+ (AVPlayer)playerWithFigPlayer:(OpaqueFigPlayer *)a3;
+ (AVPlayer)playerWithPlayerItem:(AVPlayerItem *)item;
+ (AVPlayer)playerWithURL:(NSURL *)URL;
+ (AVPlayerHDRMode)availableHDRModes;
+ (BOOL)automaticallyNotifiesObserversOfAirPlayVideoActive;
+ (BOOL)automaticallyNotifiesObserversOfAutoSwitchStreamVariants;
+ (BOOL)automaticallyNotifiesObserversOfCurrentItem;
+ (BOOL)automaticallyNotifiesObserversOfExternalPlaybackActive;
+ (BOOL)automaticallyNotifiesObserversOfRate;
+ (BOOL)automaticallyNotifiesObserversOfUserVolume;
+ (BOOL)automaticallyNotifiesObserversOfUsesAirPlayVideoWhileAirPlayScreenIsActive;
+ (BOOL)automaticallyNotifiesObserversOfUsesAudioOnlyModeForExternalPlayback;
+ (BOOL)automaticallyNotifiesObserversOfUsesLegacyAutomaticWaitingBehavior;
+ (BOOL)automaticallyNotifiesObserversOfVibrationPattern;
+ (BOOL)eligibleForHDRPlayback;
+ (BOOL)isIAPDExtendedModeActive;
+ (BOOL)worksAroundConcurrentKVOCrash;
+ (id)_makePlayerName;
+ (id)keyPathsForValuesAffectingActionAtItemEnd;
+ (id)keyPathsForValuesAffectingClosedCaptionDisplayEnabled;
+ (id)keyPathsForValuesAffectingMuted;
+ (id)keyPathsForValuesAffectingVolume;
+ (id)makePlayerLoggingIdentifier;
+ (int)_createFigPlayerWithType:(int64_t)a3 options:(__CFDictionary *)a4 player:(OpaqueFigPlayer *)a5;
+ (void)checkForAvailableHDRModesChanges;
+ (void)fireAvailableHDRModesDidChangeNotification;
+ (void)fireEligibleForHDRPlaybackDidChangeNotification;
+ (void)initialize;
+ (void)registerForScreenConnectionChanges;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime;
- (AVAudioSession)audioSession;
- (AVLoggingIdentifier)loggingIdentifier;
- (AVPlayer)init;
- (AVPlayer)initWithDispatchQueue:(id)a3;
- (AVPlayer)initWithFigPlayer:(OpaqueFigPlayer *)a3;
- (AVPlayer)initWithPlayerItem:(AVPlayerItem *)item;
- (AVPlayer)initWithURL:(NSURL *)URL;
- (AVPlayerActionAtItemEnd)actionAtItemEnd;
- (AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy;
- (AVPlayerItem)currentItem;
- (AVPlayerMediaSelectionCriteria)legibleFallbackMediaSelectionCriteria;
- (AVPlayerMediaSelectionCriteria)mediaSelectionCriteriaForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (AVPlayerPlaybackCoordinator)playbackCoordinator;
- (AVPlayerStatus)status;
- (AVPlayerTimeControlStatus)timeControlStatus;
- (AVPlayerVideoOutput)videoOutput;
- (AVPlayerWaitingReason)reasonForWaitingToPlay;
- (BOOL)_CALayerDestinationIsTVOut;
- (BOOL)_airPlayVideoActive;
- (BOOL)_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock;
- (BOOL)_cachedNonForcedSubtitleDisplayEnabledForCurrentItem;
- (BOOL)_canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:(int64_t)a3;
- (BOOL)_carplayIsActive;
- (BOOL)_clientRequestedPlaybackCoordinator;
- (BOOL)_disallowsAutoPauseOnRouteRemovalIfNoAudio;
- (BOOL)_disallowsVideoLayerDisplayCompositing;
- (BOOL)_ensuresActiveAudioSessionWhenStartingPlayback;
- (BOOL)_externalPlaybackActive;
- (BOOL)_getDisplayVideoRange:(id *)a3 displaySize:(CGSize *)a4 refreshRate:(id *)a5;
- (BOOL)_handleSetRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7;
- (BOOL)_hasAssociatedAVPlayerLayerInPIPMode;
- (BOOL)_hasAssociatedOnscreenAVPlayerLayer;
- (BOOL)_hasCurrentInterstitialEvent;
- (BOOL)_hasForegroundLayers;
- (BOOL)_isAirPlayVideoActive;
- (BOOL)_isBufferedAirPlayActive;
- (BOOL)_isConnectedToPhysicalSecondScreen;
- (BOOL)_isDisplayingClosedCaptions;
- (BOOL)_isIAPDExtendedModeActive;
- (BOOL)_isInterstitialPlayer;
- (BOOL)_isMuted;
- (BOOL)_isPIPModePossible;
- (BOOL)_isVideoPlaybackAllowedWhileInBackground;
- (BOOL)_limitsBandwidthForCellularAccess;
- (BOOL)_participatesInAudioSession;
- (BOOL)_pausesAudioVisualPlaybackInBackground;
- (BOOL)_preservesAudioSessionSampleRate;
- (BOOL)_preventsSleepDuringVideoPlayback;
- (BOOL)_rateDidChangeNotificationIncludesExtendedDiagnosticPayload;
- (BOOL)_rateUpdateDuringTransitionDecided;
- (BOOL)_resumePlayback:(double)a3 error:(id *)a4;
- (BOOL)_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:(id)a3 modificationBlock:(id)a4 error:(id *)a5;
- (BOOL)_setRate:(float)a3 rateChangeReason:(int)a4 figPlayerSetRateHandler:(id)a5;
- (BOOL)_shouldDetachVideoLayersFromFigPlayer;
- (BOOL)_shouldLogPerformanceData;
- (BOOL)_silencesOtherPlaybackDuringPIP;
- (BOOL)_supportsAdvanceTimeForOverlappedPlayback;
- (BOOL)_suppressesAudioRendering;
- (BOOL)_usesLegacyAutomaticWaitingBehavior;
- (BOOL)allowsExternalPlayback;
- (BOOL)allowsLegibleFallbackForAllAudibleMediaSelections;
- (BOOL)allowsOutOfBandTextTrackRendering;
- (BOOL)allowsPixelBufferPoolSharing;
- (BOOL)appliesMediaSelectionCriteriaAutomatically;
- (BOOL)autoSwitchStreamVariants;
- (BOOL)automaticallyWaitsToMinimizeStalling;
- (BOOL)disallowsAMRAudio;
- (BOOL)disallowsHardwareAcceleratedVideoDecoder;
- (BOOL)isAudioPlaybackEnabledAtAllRates;
- (BOOL)isClosedCaptionDisplayEnabled;
- (BOOL)isDefunct;
- (BOOL)isDisplayingClosedCaptions;
- (BOOL)isExternalPlaybackActive;
- (BOOL)isMuted;
- (BOOL)isSilencedDueToConflictWithOtherPlayback;
- (BOOL)outputObscuredDueToInsufficientExternalProtection;
- (BOOL)prefersPlayingSilentlyWhenConflictingWithOtherPlayback;
- (BOOL)preparesItemsForPlaybackAsynchronously;
- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback;
- (BOOL)preventsDisplaySleepDuringVideoPlayback;
- (BOOL)shouldReduceResourceUsage;
- (BOOL)shouldWaitForVideoTarget;
- (BOOL)supportsSpeedRamps;
- (BOOL)usesAudioOnlyModeForExternalPlayback;
- (BOOL)usesDedicatedNotificationQueueForMediaServices;
- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive;
- (CGSize)_cachedPresentationSizeOfCurrentItem;
- (CGSize)_maximumAVPlayerLayerDisplaySize;
- (CGSize)dimensionsOfReservedVideoMemory;
- (CMClockRef)masterClock;
- (CMTime)currentTime;
- (NSArray)_displaysUsedForPlayback;
- (NSArray)taggedBufferOutputs;
- (NSArray)videoTargets;
- (NSError)error;
- (NSNumber)mxSessionID;
- (NSString)_STSLabel;
- (NSString)audioOutputDeviceUniqueID;
- (NSString)backgroundPIPAuthorizationToken;
- (NSString)captionPipelineStrategy;
- (NSString)captionRenderingStrategy;
- (NSString)multichannelAudioStrategy;
- (OpaqueFigPlayer)_copyFigPlayer;
- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinator;
- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinatorIfCreated;
- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialEventCoordinatorEnsuringItIsRemote:(BOOL)a3;
- (OpaqueFigVideoTarget)_interstitialVideoTargetForPrimaryVideoTarget:(OpaqueFigVideoTarget *)a3;
- (__CFDictionary)_createDictionaryWithDimensionsOfReservedVideoMemory:(CGSize)a3;
- (__CFString)figPlayerActionForActionAtItemEnd:(int64_t)a3;
- (__CVBuffer)_copyDisplayedPixelBuffer;
- (__CVBuffer)_copyDisplayedPixelBuffer:(id)a3;
- (float)_playerVolume;
- (float)_rate;
- (float)_userVolume;
- (float)defaultRate;
- (float)maxRateForAudioPlayback;
- (float)minRateForAudioPlayback;
- (float)rate;
- (float)volume;
- (id)_acquireBackgroundAssertion;
- (id)_ancillaryPerformanceInformationForDisplay;
- (id)_avPlayerLayers;
- (id)_cachedMediaSelectionCriteria;
- (id)_clientName;
- (id)_closedCaptionLayers;
- (id)_copyPerformanceDataForCurrentItem;
- (id)_externalPlaybackVideoGravity;
- (id)_fpNotificationNames;
- (id)_interstitialPlayerIfCreated;
- (id)_items;
- (id)_items_invokeOnIvarAccessQueue;
- (id)_nameForLogging;
- (id)_nameForLogging_fromIvarAccessQueue;
- (id)_pendingFigPlayerProperties;
- (id)_pendingFigPlayerPropertyForKey:(id)a3;
- (id)_performanceDictionary;
- (id)_pixelBufferAttributeMediator;
- (id)_playbackCoordinatorWithoutTriggeringFullSetup;
- (id)_playbackDisplaysForFigPlayer;
- (id)_playerCaptionLayers;
- (id)_rateDidChangeNotificationPayloadForAVFRateChangeReason:(id)a3 reasonIsExtendedDiagnostic:(BOOL)a4 rateChangeIdentifier:(id)a5 rateChangeOriginator:(id)a6;
- (id)_rateDidChangeNotificationPayloadForFigRateChangeReason:(int)a3 rateChangeIdentifier:(id)a4 rateChangeOriginator:(id)a5;
- (id)_rateState;
- (id)_stateDispatchQueue;
- (id)_subtitleLayers;
- (id)_synchronizeWithNewCurrentItem;
- (id)_unregisterAndReturnRetainedPrerollCompletionHandler;
- (id)_updateAudioSessionOnFigPlayer;
- (id)_videoLayers;
- (id)_weakReference;
- (id)_weakReferenceToPrimaryPlayer;
- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block;
- (id)closedCaptionsDisplayPublisher;
- (id)currentItemPublisher;
- (id)defaultMediaSelectionCriteriaForMediaCharacteristic:(id)a3;
- (id)expectedAssetTypes;
- (id)interstitialPlayer;
- (id)outputContext;
- (id)playerRole;
- (id)valueForUndefinedKey:(id)a3;
- (id)vibrationPattern;
- (int)_cancelPendingPrerollAndRegisterPrerollCompletionHandler:(id)a3;
- (int)_createPrerollID;
- (int64_t)_clientPriority;
- (int64_t)_externalProtectionStatus;
- (int64_t)_externalProtectionStatusCopiedFromFig;
- (int64_t)_extractFPExternalProtectionStatus:(id)a3;
- (int64_t)_itemOkayToPlayWhileTransitioningToBackground:(id)a3;
- (int64_t)externalPlaybackInterstitialSchedulingStrategy;
- (int64_t)externalPlaybackType;
- (int64_t)resourceConservationLevelWhilePaused;
- (uint64_t)preferredVideoDecoderGPURegistryID;
- (void)_addFPListeners;
- (void)_addItemToLinkedList_invokeOnIvarAccessQueue:(id)a3 afterItem:(id)a4;
- (void)_addLayer:(id)a3;
- (void)_addListenersToInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_addPlayerCaptionLayer:(id)a3;
- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3;
- (void)_advanceToNextItem;
- (void)_applyLinkedListOfItemsToFigPlayerUsingBlock:(id)a3;
- (void)_applyPlayQueueChangesToFigPlayerWithCompletionHandler:(id)a3;
- (void)_attachClosedCaptionLayersToFigPlayer;
- (void)_attachFigPlayerToSubtitleLayers;
- (void)_attachVideoLayersToFigPlayer;
- (void)_changeStatusToFailedWithError:(id)a3;
- (void)_createAndConfigureFigPlayerWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)_detachClosedCaptionLayersFromFigPlayer:(OpaqueFigPlayer *)a3;
- (void)_detachFigPlayerFromSubtitleLayers;
- (void)_detachVideoLayersForSuspension;
- (void)_detachVideoLayersFromFigPlayer:(OpaqueFigPlayer *)a3;
- (void)_didEnterBackground:(id)a3;
- (void)_enqueuePlayQueueModification_invokeOnIvarAccessQueue:(id)a3;
- (void)_ensureFigPlaybackCoordinatorIsConnected;
- (void)_ensureVideoLayersAreAttached;
- (void)_enumerateItemsUsingBlock:(id)a3;
- (void)_evaluateDisplaySizeOfAllAttachedLayers;
- (void)_insertItem:(id)a3 afterItem:(id)a4;
- (void)_itemIsReadyToPlay:(id)a3;
- (void)_layerForegroundStateChanged:(id)a3;
- (void)_linkAndSyncAudioSessionWithInterstitialPlayer:(id)a3;
- (void)_logPerformanceDataForCurrentItem;
- (void)_logPerformanceDataForPreviousItem;
- (void)_noteCurrentRemoteInterstitialEvent:(id)a3;
- (void)_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:(id)a3;
- (void)_noteNewPresentationSizeForPlayerItem:(id)a3;
- (void)_noteRemoteInterstitialEvents:(id)a3 forItem:(id)a4;
- (void)_removeAllItems;
- (void)_removeAllLayers;
- (void)_removeFPListeners;
- (void)_removeItem:(id)a3;
- (void)_removeItemFromLinkedList_invokeOnIvarAccessQueue:(id)a3;
- (void)_removeLayer:(id)a3;
- (void)_removeLayer:(id)a3 videoLayer:(id)a4 closedCaptionLayer:(id)a5 subtitleLayer:(id)a6 interstitialLayer:(id)a7;
- (void)_removeListenersFromInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_removePlayerCaptionLayer:(id)a3;
- (void)_removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:(id)a3;
- (void)_setActionAtItemEnd:(int64_t)a3 allowingAdvance:(BOOL)a4;
- (void)_setAncillaryPerformanceInformationForDisplay:(id)a3;
- (void)_setCALayerDestinationIsTVOut:(BOOL)a3;
- (void)_setClientName:(id)a3;
- (void)_setClientPriority:(int64_t)a3;
- (void)_setCurrentItem:(id)a3;
- (void)_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:(BOOL)a3;
- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3;
- (void)_setDisplaysUsedForPlayback:(id)a3;
- (void)_setEQPreset:(int)a3;
- (void)_setEnsuresActiveAudioSessionWhenStartingPlayback:(BOOL)a3;
- (void)_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_setFigPlaybackItemToMakeCurrent:(OpaqueFigPlaybackItem *)a3;
- (void)_setInterstitialEventCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3;
- (void)_setInterstitialPlayer:(id)a3;
- (void)_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:(id)a3;
- (void)_setInterstitialPlayerOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(id)a3;
- (void)_setIsInterstitialPlayer:(BOOL)a3;
- (void)_setLimitsBandwidthForCellularAccess:(BOOL)a3;
- (void)_setNeroVideoGravityOnFigPlayer;
- (void)_setOptions:(id)a3 onClosedCaptionLayer:(id)a4;
- (void)_setParticipatesInAudioSession:(BOOL)a3;
- (void)_setPausesAudioVisualPlaybackInBackground:(BOOL)a3;
- (void)_setPendingFigPlayerProperty:(id)a3 forKey:(id)a4;
- (void)_setPreferredLanguageList:(id)a3;
- (void)_setPreservesAudioSessionSampleRate:(BOOL)a3;
- (void)_setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)_setPrimaryPlayerNameForInterstitial:(id)a3;
- (void)_setRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7;
- (void)_setRateDidChangeNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3;
- (void)_setSTSLabel:(id)a3;
- (void)_setSeparated:(BOOL)a3 onClosedCaptionLayer:(id)a4;
- (void)_setSilencesOtherPlaybackDuringPIP:(BOOL)a3;
- (void)_setStoppingFadeOutDuration:(float)a3;
- (void)_setSupportsAdvanceTimeForOverlappedPlayback:(BOOL)a3;
- (void)_setSuppressesAudioRendering:(BOOL)a3;
- (void)_setUserVolume:(float)a3;
- (void)_setUsesLegacyAutomaticWaitingBehavior:(BOOL)a3;
- (void)_setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3;
- (void)_setWeakReferenceToPrimaryPlayer:(id)a3;
- (void)_startObservingPropertiesOfCurrentItem:(id)a3;
- (void)_updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer;
- (void)_updateClosedCaptionLayerBounds:(id)a3 videoRelativeToViewport:(const CGRect *)a4 captionsAvoidanceMargins:(const NSEdgeInsets *)a5;
- (void)_updateConnectionToSecondScreen;
- (void)_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression;
- (void)_updateDecoderPixelBufferAttributes:(id)a3 onFigPlayer:(OpaqueFigPlayer *)a4;
- (void)_updatePixelBufferAttributesForLayer:(id)a3;
- (void)_updateProxyTimebaseFromNewCurrentItem;
- (void)_updateVideoTargetOnFigPlayer:(id)a3 synchronously:(BOOL)a4;
- (void)_willEnterForeground:(id)a3;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)addTaggedBufferOutput:(id)a3;
- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3;
- (void)cancelPendingPrerolls;
- (void)dealloc;
- (void)pause;
- (void)pauseWithoutAffectingCoordinatedPlayback;
- (void)play;
- (void)playImmediatelyAtRate:(float)rate;
- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4;
- (void)prerollAtRate:(float)rate completionHandler:(void *)completionHandler;
- (void)prerollOperationDidComplete:(BOOL)a3 notificationPayload:(__CFDictionary *)a4;
- (void)removeAudioPlaybackRateLimits;
- (void)removeTaggedBufferOutput:(id)a3;
- (void)removeTimeObserver:(id)observer;
- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3;
- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3 synchronously:(BOOL)a4;
- (void)replaceCurrentItemWithPlayerItem:(AVPlayerItem *)item;
- (void)seekToDate:(NSDate *)date;
- (void)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler;
- (void)seekToTime:(CMTime *)time;
- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler;
- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter;
- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler;
- (void)setActionAtItemEnd:(AVPlayerActionAtItemEnd)actionAtItemEnd;
- (void)setActiveVideoTargetsForInterstitials:(unsigned __int8)a3;
- (void)setAllowsExternalPlayback:(BOOL)allowsExternalPlayback;
- (void)setAllowsLegibleFallbackForAllAudibleMediaSelections:(BOOL)a3;
- (void)setAllowsOutOfBandTextTrackRendering:(BOOL)a3;
- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3;
- (void)setAppliesMediaSelectionCriteriaAutomatically:(BOOL)appliesMediaSelectionCriteriaAutomatically;
- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID;
- (void)setAudioSession:(id)a3;
- (void)setAudiovisualBackgroundPlaybackPolicy:(AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy;
- (void)setAutoSwitchStreamVariants:(BOOL)a3;
- (void)setAutomaticallyWaitsToMinimizeStalling:(BOOL)automaticallyWaitsToMinimizeStalling;
- (void)setBackgroundPIPAuthorizationToken:(id)a3;
- (void)setCaptionPipelineStrategy:(id)a3;
- (void)setCaptionRenderingStrategy:(id)a3;
- (void)setClosedCaptionDisplayEnabled:(BOOL)closedCaptionDisplayEnabled;
- (void)setDefaultRate:(float)defaultRate;
- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3;
- (void)setDisallowsAMRAudio:(BOOL)a3;
- (void)setDisallowsHardwareAcceleratedVideoDecoder:(BOOL)a3;
- (void)setExpectedAssetTypes:(id)a3;
- (void)setExternalPlaybackInterstitialSchedulingStrategy:(int64_t)a3;
- (void)setExternalPlaybackVideoGravity:(AVLayerVideoGravity)externalPlaybackVideoGravity;
- (void)setLegibleFallbackMediaSelectionCriteria:(id)a3;
- (void)setLoggingIdentifier:(id)a3;
- (void)setMasterClock:(CMClockRef)masterClock;
- (void)setMaxRateForAudioPlayback:(float)a3;
- (void)setMediaSelectionCriteria:(AVPlayerMediaSelectionCriteria *)criteria forMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (void)setMinRateForAudioPlayback:(float)a3;
- (void)setMultichannelAudioStrategy:(id)a3;
- (void)setMuted:(BOOL)muted;
- (void)setOutputContext:(id)a3;
- (void)setPlayerRole:(id)a3;
- (void)setPlayerRole:(id)a3 synchronously:(BOOL)a4;
- (void)setPreferredVideoDecoderGPURegistryID:(uint64_t)preferredVideoDecoderGPURegistryID;
- (void)setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback:(BOOL)a3;
- (void)setPreparesItemsForPlaybackAsynchronously:(BOOL)a3;
- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback;
- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback;
- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 options:(id)a6;
- (void)setRate:(float)a3 withVolumeRampDuration:(id *)a4;
- (void)setRate:(float)rate;
- (void)setRate:(float)rate time:(CMTime *)itemTime atHostTime:(CMTime *)hostClockTime;
- (void)setResourceConservationLevelWhilePaused:(int64_t)a3;
- (void)setShouldReduceResourceUsage:(BOOL)a3;
- (void)setShouldWaitForVideoTarget:(BOOL)a3;
- (void)setSupportsSpeedRamps:(BOOL)a3;
- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive;
- (void)setUsesAudioOnlyModeForExternalPlayback:(BOOL)a3;
- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3;
- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)usesExternalPlaybackWhileExternalScreenIsActive;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVibrationPattern:(id)a3;
- (void)setVideoOutput:(id)a3;
- (void)setVideoOutput:(id)a3 withOwningTaggedBufferOutput:(id)a4;
- (void)setVolume:(float)volume;
- (void)syncAudioSessionToInterstitialPlayer:(id)a3;
@end

@implementation AVPlayer

uint64_t __48__AVPlayer__setPendingFigPlayerProperty_forKey___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(*(void *)(a1[5] + 8) + 208);
  if (v2) {
    return [v3 setObject:v2 forKey:a1[6]];
  }
  else {
    return [v3 removeObjectForKey:a1[6]];
  }
}

__n128 __48__AVPlayer__cachedPresentationSizeOfCurrentItem__block_invoke(uint64_t a1)
{
  v1 = (__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 504);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *v1;
  return result;
}

- (void)_setPendingFigPlayerProperty:(id)a3 forKey:(id)a4
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVPlayer__setPendingFigPlayerProperty_forKey___block_invoke;
  block[3] = &unk_1E57B2138;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

- (id)_pendingFigPlayerPropertyForKey:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVPlayer__pendingFigPlayerPropertyForKey___block_invoke;
  block[3] = &unk_1E57B3270;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (OpaqueFigPlayer)_copyFigPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__AVPlayer__copyFigPlayer__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueFigPlayer *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__AVPlayer__avPlayerLayers__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 680) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVPlayerMediaSelectionCriteria)legibleFallbackMediaSelectionCriteria
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__AVPlayer_AVPlayerLegibleFallback__legibleFallbackMediaSelectionCriteria__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (AVPlayerMediaSelectionCriteria *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)allowsLegibleFallbackForAllAudibleMediaSelections
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__AVPlayer_AVPlayerLegibleFallback__allowsLegibleFallbackForAllAudibleMediaSelections__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_cachedMediaSelectionCriteria
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__AVPlayer_AVPlayerAutomaticMediaSelection___cachedMediaSelectionCriteria__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __26__AVPlayer__copyFigPlayer__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __23__AVPlayer_currentItem__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 176);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __44__AVPlayer__pendingFigPlayerPropertyForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(*(void *)(a1[4] + 8) + 208) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (int64_t)_extractFPExternalProtectionStatus:(id)a3
{
  if (!a3) {
    return 1;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "allKeysForObject:", *MEMORY[0x1E4F33F10]), "count");
  return v4 != [a3 count];
}

- (void)setAutomaticallyWaitsToMinimizeStalling:(BOOL)automaticallyWaitsToMinimizeStalling
{
  BOOL v5 = [(AVPlayer *)self _hasCurrentInterstitialEvent];
  id v6 = [(AVPlayer *)self _nameForLogging];
  [(AVPlayer *)self willChangeValueForKey:@"timeControlStatus"];
  [(AVPlayer *)self willChangeValueForKey:@"reasonForWaitingToPlay"];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setAutomaticallyWaitsToMinimizeStalling___block_invoke;
  block[3] = &unk_1E57B39F0;
  BOOL v9 = v5;
  block[4] = self;
  block[5] = v6;
  BOOL v10 = automaticallyWaitsToMinimizeStalling;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayer *)self _updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer];
  [(AVPlayer *)self didChangeValueForKey:@"timeControlStatus"];
  [(AVPlayer *)self didChangeValueForKey:@"reasonForWaitingToPlay"];
}

- (AVPlayer)init
{
  v30.receiver = self;
  v30.super_class = (Class)AVPlayer;
  uint64_t v2 = [(AVPlayer *)&v30 init];
  if (v2)
  {
    id v3 = objc_alloc_init(AVPlayerInternal);
    v2->_player = v3;
    if (v3)
    {
      v2->_player->weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2];
      v2->_player->stateDispatchQueue = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      dispatch_retain((dispatch_object_t)v2->_player->stateDispatchQueue);
      uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->figConfigurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.figplayer", v4);
      BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->layerInteractionQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.playerlayer", v5);
      v2->_player->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayer.ivars");
      id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->currentItemPropertyUpdateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.current-item-properties", v6);
      uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.configuration", v7);
      if ([(id)objc_opt_class() worksAroundConcurrentKVOCrash]) {
        uint64_t v8 = AVMakeBlockSchedulerThatSerializesBlocksPrefersSynchronousExecutionAndAllowsReentrantExecution();
      }
      else {
        uint64_t v8 = AVMakeBlockSchedulerThatExecutesBlocksSynchronously();
      }
      v2->_player->KVOChangeSerializer = (AVBlockScheduler *)v8;
      BOOL v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_player->layersQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplayer.layers", v9);
      v2->_player->videoLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_player->closedCaptionLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_player->subtitleLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_player->avPlayerLayers = (NSHashTable *)(id)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v2->_player->videoTargets = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v2->_player->videoTargetsForInterstitialPlayer = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v2->_player->playerCaptionLayers = (NSHashTable *)(id)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v2->_player->items = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
      v2->_player->itemsInFigPlayQueue = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_player->queueModifications = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_player->externalPlaybackVideoGravity = (NSString *)@"AVLayerVideoGravityResizeAspect";
      v2->_player->pixelBufferAttributeMediator = objc_alloc_init(AVPixelBufferAttributeMediator);
      v2->_player->volume = 1.0;
      v2->_player->minRateForAudioPlayback = -INFINITY;
      v2->_player->maxRateForAudioPlayback = INFINITY;
      v2->_player->currentItemPresentationSize = (CGSize)*MEMORY[0x1E4F1DB30];
      v2->_player->currentItemNonForcedSubtitlesEnabled = 0;
      v2->_player->pendingFigPlayerProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_player->preventsDisplaySleepDuringVideoPlayback = 1;
      v2->_player->preventsAutomaticBackgroundingDuringVideoPlayback = 1;
      v2->_player->handlersToCallWhenReadyToPlay = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_player->displaysUsedForPlayback = 0;
      v2->_player->needsToCreateFigPlayer = 1;
      CMTimebaseRef timebaseOut = 0;
      HostTimeClock = CMClockGetHostTimeClock();
      if (!CMTimebaseCreateWithSourceClock(v10, HostTimeClock, &timebaseOut)) {
        CMTimebaseCreateReadOnlyTimebase();
      }
      if (timebaseOut) {
        CFRelease(timebaseOut);
      }
      v2->_player->loggingIdentifier = (AVLoggingIdentifier *)+[AVPlayer makePlayerLoggingIdentifier];
      v2->_player->audiovisualBackgroundPlaybackPolicy = 1;
      v2->_player->ensuresActiveAudioSessionWhenStartingPlayback = 1;
      v2->_player->prerollIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_player->nextPrerollIDToGenerate = 0;
      v2->_player->pendingPrerollID = 0;
      v2->_player->prerollCompletionHandler = 0;
      v2->_player->rateChangeIdentifier = 0;
      [(AVPlayer *)v2 setActionAtItemEnd:1];
      [(AVPlayer *)v2 setAllowsExternalPlayback:dyld_program_sdk_at_least()];
      if (dyld_program_sdk_at_least()) {
        [(AVPlayer *)v2 setAppliesMediaSelectionCriteriaAutomatically:1];
      }
      [(AVPlayer *)v2 _setPendingFigPlayerProperty:&unk_1EE5E1740 forKey:*MEMORY[0x1E4F34310]];
      int v12 = sWaitsToMinimizeStallingByDefault;
      v13 = [AVPlayerRateState alloc];
      if (v12 == 1)
      {
        uint64_t v14 = 1;
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 1;
      }
      v2->_player->rateState = [(AVPlayerRateState *)v13 initWithAutomaticallyWaitsToMinimizeStalling:v14 usesLegacyAutomaticWaitingBehavior:v15 timeControlStatus:0];
      [(AVPlayer *)v2 _updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer];
      v2->_player->playbackCoordinator = [[AVPlayerPlaybackCoordinator alloc] initWithPlayer:v2];
      v2->_player->applicationStateMonitor = (AVApplicationStateMonitor *)+[AVApplicationStateMonitor sharedApplicationStateMonitor];
      objc_initWeak((id *)&timebaseOut, v2);
      v16 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __16__AVPlayer_init__block_invoke;
      v28[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v29, (id *)&timebaseOut);
      v2->_player->didFinishSuspensionNotificationToken = (id)[v16 addObserverForName:@"_UIApplicationDidFinishSuspensionSnapshotNotification" object:0 queue:0 usingBlock:v28];
      v17 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __16__AVPlayer_init__block_invoke_2;
      v26[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v27, (id *)&timebaseOut);
      v2->_player->didEnterBackgroundNotificationToken = (id)[v17 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v26];
      v18 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __16__AVPlayer_init__block_invoke_3;
      v24[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v25, (id *)&timebaseOut);
      v2->_player->willEnterForegroundNotificationToken = (id)[v18 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:v24];
      v19 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __16__AVPlayer_init__block_invoke_4;
      v22[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v23, (id *)&timebaseOut);
      v2->_player->layerForegroundingChangeToken = (id)[v19 addObserverForName:@"AVPlayerLayerIsPartOfForegroundSceneDidChangeNotification" object:0 queue:0 usingBlock:v22];
      v2->_player->IAPDCallbackToken = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", v2);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2->_player->IAPDCallbackToken, (CFNotificationCallback)avplayer_iapdNotificationCallback, @"com.apple.iapd.notify.extendedMode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v2->_player->logPerformanceData = CFPreferencesGetAppBooleanValue(@"avplayer_logperformance", @"com.apple.avfoundation", 0) == 1;
      v2->_player->fullyInitializedAndNotDeallocating = 1;
      v2->_player->defaultRate = 1.0;
      v2->_player->participatesInAudioSession = 1;
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)&timebaseOut);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer
{
  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AVPlayer__updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

- (void)setAppliesMediaSelectionCriteriaAutomatically:(BOOL)appliesMediaSelectionCriteriaAutomatically
{
  BOOL v3 = appliesMediaSelectionCriteriaAutomatically;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v14 = appliesMediaSelectionCriteriaAutomatically;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke_2;
    v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v9 forKey:*MEMORY[0x1E4F34190]];
  }
}

+ (id)makePlayerLoggingIdentifier
{
  uint64_t v2 = objc_alloc_init(AVPlayerLoggingIdentifier);
  return v2;
}

+ (BOOL)worksAroundConcurrentKVOCrash
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AvoidConcurrentKVOForAVPlayerCurrentItem", @"com.apple.avfoundation", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlayer;
  -[AVPlayer addObserver:forKeyPath:options:context:](&v13, sel_addObserver_forKeyPath_options_context_, a3, a4, a5 & 0xFFFFFFFFFFFFFFFBLL);
  if ((a5 & 4) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)AVPlayer;
    [(AVPlayer *)&v12 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
    v11.receiver = self;
    v11.super_class = (Class)AVPlayer;
    [(AVPlayer *)&v11 removeObserver:a3 forKeyPath:a4 context:a6];
  }
}

- (void)setRate:(float)rate
{
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v3, 0, 23, 1);
}

- (void)_setRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a4;
  if (-[AVPlayer _handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_handleSetRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v19))
  {
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __104__AVPlayer__setRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke;
    v13[3] = &unk_1E57B39A0;
    v13[4] = self;
    long long v14 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    BOOL v17 = a5;
    int v16 = a6;
    BOOL v18 = a7;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v13);
  }
}

- (BOOL)_handleSetRate:(float)a3 withVolumeRampDuration:(id *)a4 playImmediately:(BOOL)a5 rateChangeReason:(int)a6 affectsCoordinatedPlayback:(BOOL)a7
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__AVPlayer__handleSetRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke;
  v8[3] = &unk_1E57B3978;
  BOOL v12 = a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  int v10 = a6;
  BOOL v13 = a7;
  v8[4] = self;
  float v11 = a3;
  return -[AVPlayer _setRate:rateChangeReason:figPlayerSetRateHandler:](self, "_setRate:rateChangeReason:figPlayerSetRateHandler:", *(void *)&a6, v8);
}

- (AVPlayerActionAtItemEnd)actionAtItemEnd
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer_actionAtItemEnd__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerActionAtItemEnd v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __22__AVPlayer__rateState__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 368) = *(void *)(result + 40);
  return result;
}

CFTypeRef __87__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialCoordinatorIfCreated__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 264);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __78__AVPlayer_AVPlayerInterstitialSupport_Internal___interstitialPlayerIfCreated__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 248);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __38__AVPlayer_setAllowsExternalPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 407) = *(unsigned char *)(result + 40);
  return result;
}

__n128 __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke_2(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 504) = result;
  return result;
}

uint64_t __18__AVPlayer_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 160);
  return result;
}

uint64_t __71__AVPlayer__rateDidChangeNotificationIncludesExtendedDiagnosticPayload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 616);
  return result;
}

uint64_t __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 496);
  return result;
}

id __80__AVPlayer_PlaybackCoordination___playbackCoordinatorWithoutTriggeringFullSetup__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 592);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __57__AVPlayer_AVPlayerAudioSessionParticipant__audioSession__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 216);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 520) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 600) = 1;
  return result;
}

uint64_t __71__AVPlayer_AVPlayerInterstitialSupport_Internal___isInterstitialPlayer__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 556);
  return result;
}

- (BOOL)_hasForegroundLayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(AVPlayer *)self _avPlayerLayers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      if (v5) {
        char v5 = 1;
      }
      else {
        char v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) _isPartOfForegroundScene];
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (void)_updateClosedCaptionLayerBounds:(id)a3 videoRelativeToViewport:(const CGRect *)a4 captionsAvoidanceMargins:(const NSEdgeInsets *)a5
{
  long long v9 = [(AVPlayer *)self _copyFigPlayer];
  long long v10 = (void *)MEMORY[0x199715AE0]();
  if (a3 && v9)
  {
    valuePtr[0] = 0;
    CFArrayRef v11 = [(AVPlayer *)self _closedCaptionLayers];
    if (v11
      && (CFArrayRef v12 = v11,
          v22.length = CFArrayGetCount(v11),
          v22.location = 0,
          valuePtr[0] = CFArrayGetFirstIndexOfValue(v12, v22, a3),
          valuePtr[0] < 0))
    {
      a4 = 0;
      CFDictionaryRef DictionaryRepresentation = 0;
      CFNumberRef v13 = 0;
    }
    else
    {
      CFNumberRef v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, valuePtr);
      if (v13)
      {
        [a3 bounds];
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v23);
        if (DictionaryRepresentation)
        {
          if (!a4 || (a4 = (const CGRect *)CGRectCreateDictionaryRepresentation(*a4)) != 0)
          {
            if (!a5
              || (FigGeometryDimensionMake(),
                  FigGeometryDimensionMake(),
                  FigGeometryDimensionMake(),
                  FigGeometryDimensionMake(),
                  FigGeometryMarginsMake(),
                  (a5 = (const NSEdgeInsets *)FigGeometryMarginsCopyAsDictionary()) != 0))
            {
              uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E4F33EC8], DictionaryRepresentation, *MEMORY[0x1E4F33EB8], 0);
              if (v15)
              {
                int v16 = v15;
                if (a4) {
                  [v15 setObject:a4 forKey:*MEMORY[0x1E4F33ED0]];
                }
                if (a5) {
                  [v16 setObject:a5 forKey:*MEMORY[0x1E4F33EC0]];
                }
                uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
                uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
                if (v18) {
                  uint64_t v19 = v18;
                }
                else {
                  uint64_t v19 = 0;
                }
                v20 = *(void (**)(uint64_t, void, void *))(v19 + 56);
                if (v20) {
                  v20(FigBaseObject, *MEMORY[0x1E4F341F8], v16);
                }
              }
              if (a5) {
                CFRelease(a5);
              }
            }
          }
        }
        else
        {
          a4 = 0;
        }
      }
      else
      {
        a4 = 0;
        CFDictionaryRef DictionaryRepresentation = 0;
      }
    }
    if (a4) {
      CFRelease(a4);
    }
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    if (v13) {
      CFRelease(v13);
    }
  }
  else if (!v9)
  {
    goto LABEL_35;
  }
  CFRelease(v9);
LABEL_35:
}

void __51__AVPlayer__evaluateDisplaySizeOfAllAttachedLayers__block_invoke(uint64_t a1)
{
  id v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  [*(id *)(a1 + 32) _maximumAVPlayerLayerDisplaySize];
  if (v2)
  {
    CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&v3);
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    long long v9 = *(void (**)(uint64_t, void, CFDictionaryRef))(v8 + 56);
    if (v9) {
      v9(FigBaseObject, *MEMORY[0x1E4F34380], DictionaryRepresentation);
    }
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    CFRelease(v2);
  }
}

- (CGSize)_maximumAVPlayerLayerDisplaySize
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(AVPlayer *)self _avPlayerLayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    double v8 = v3;
    double v9 = v2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        CFArrayRef v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 _displaySize];
        double v13 = v12;
        double v15 = v14;
        if ([v11 context])
        {
          if (v13 != v2 || v15 != v3)
          {
            [v11 opacity];
            if (v17 != 0.0 && v13 * v15 > v8 * v9)
            {
              double v8 = v15;
              double v9 = v13;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = v3;
    double v9 = v2;
  }
  double v19 = v9;
  double v20 = v8;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_avPlayerLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  double v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__avPlayerLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CGSize)_cachedPresentationSizeOfCurrentItem
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__AVPlayer__cachedPresentationSizeOfCurrentItem__block_invoke;
  v7[3] = &unk_1E57B2110;
  v7[4] = self;
  v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_evaluateDisplaySizeOfAllAttachedLayers
{
  layerInteractionQueue = self->_player->layerInteractionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer__evaluateDisplaySizeOfAllAttachedLayers__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(layerInteractionQueue, block);
}

- (id)_closedCaptionLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  double v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayer__closedCaptionLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __67__AVPlayer_AVPlayerMultitaskSupport___layerForegroundStateChanged___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_avPlayerLayers"), "containsObject:", objc_msgSend(*(id *)(a1 + 40), "object"));
  if (result)
  {
    char v3 = [*(id *)(a1 + 32) _hasForegroundLayers];
    double v4 = *(void **)(a1 + 32);
    if (v3)
    {
      return [v4 _ensureVideoLayersAreAttached];
    }
    else
    {
      return [v4 _detachVideoLayersForSuspension];
    }
  }
  return result;
}

uint64_t __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(*(void *)(v2 + 8) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke_2;
  block[3] = &unk_1E57B1E80;
  block[4] = v2;
  av_readwrite_dispatch_queue_write(v3, block);
  [*(id *)(a1 + 32) _ensureFigPlaybackCoordinatorIsConnected];
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interstitialPlayer"), "playbackCoordinator");
}

- (void)_ensureFigPlaybackCoordinatorIsConnected
{
  id v3 = [(AVPlayer *)self _playbackCoordinatorWithoutTriggeringFullSetup];
  if (([v3 _hasFigPlaybackCoordinator] & 1) == 0)
  {
    double v4 = [(AVPlayer *)self _copyFigPlayer];
    if (v4)
    {
      double v5 = v4;
      CFTypeRef cf = 0;
      uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      double v9 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v8 + 48);
      if (v9)
      {
        v9(FigBaseObject, *MEMORY[0x1E4F34338], *MEMORY[0x1E4F1CF80], &cf);
        if (cf)
        {
          objc_msgSend(v3, "setFigPlaybackCoordinator:");
          if (cf) {
            CFRelease(cf);
          }
        }
      }
      CFRelease(v5);
    }
  }
}

- (id)interstitialPlayer
{
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3052000000;
  uint64_t v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke;
  block[3] = &unk_1E57B3BB8;
  block[4] = self;
  void block[5] = &v19;
  void block[6] = &v23;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  if (*((unsigned char *)v20 + 24))
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3052000000;
    uint64_t v11 = __Block_byref_object_copy__5;
    long long v12 = __Block_byref_object_dispose__5;
    uint64_t v13 = 0;
    double v4 = self->_player->ivarAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke_2;
    v7[3] = &unk_1E57B3BE0;
    v7[4] = self;
    v7[5] = &v23;
    void v7[6] = &v8;
    v7[7] = &v14;
    av_readwrite_dispatch_queue_write(v4, v7);
    if (*((unsigned char *)v15 + 24))
    {
      [(AVPlayer *)self _linkAndSyncAudioSessionWithInterstitialPlayer:[(AVPlayer *)self _interstitialPlayerIfCreated]];
      if (v9[5]) {
        objc_msgSend((id)v24[5], "setOutputContext:");
      }
      objc_msgSend((id)v24[5], "setAllowsExternalPlayback:", -[AVPlayer allowsExternalPlayback](self, "allowsExternalPlayback"));
      objc_msgSend((id)v24[5], "setUsesExternalPlaybackWhileExternalScreenIsActive:", -[AVPlayer usesExternalPlaybackWhileExternalScreenIsActive](self, "usesExternalPlaybackWhileExternalScreenIsActive"));
    }

    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v14, 8);
  }
  id v5 = (id)v24[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v5;
}

- (BOOL)allowsExternalPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__AVPlayer_allowsExternalPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayer_usesExternalPlaybackWhileExternalScreenIsActive__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setUsesExternalPlaybackWhileExternalScreenIsActive:(BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  BOOL v3 = usesExternalPlaybackWhileExternalScreenIsActive;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v14 = usesExternalPlaybackWhileExternalScreenIsActive;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke_2;
    v12[3] = &unk_1E57B2228;
    v12[4] = self;
    v12[5] = v7;
    dispatch_sync(figConfigurationQueue, v12);
    CFRelease(v7);
  }
  else
  {
    char v9 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v10 = *v9;
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F343F8]];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v10 forKey:*MEMORY[0x1E4F343F0]];
  }
  id v11 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v11) {
    [v11 setUsesExternalPlaybackWhileExternalScreenIsActive:v3];
  }
}

void __67__AVPlayer_AVPlayerMultitaskSupport___ensureVideoLayersAreAttached__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(v2[1] + 780))
  {
    uint64_t v3 = [v2 _copyFigPlayer];
    if (v3)
    {
      double v4 = (const void *)v3;
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count"))
      {
        [*(id *)(a1 + 32) _attachVideoLayersToFigPlayer];
        if ((dyld_program_sdk_at_least() & 1) == 0
          && ((dyld_program_sdk_at_least() & 1) != 0
           || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_clientName"), "isEqualToString:", @"MusicPlayer")))
        {
          id v5 = *(void **)(a1 + 32);
          if (*(unsigned char *)(v5[1] + 777)) {
            objc_msgSend((id)objc_msgSend(v5, "currentItem"), "_hasEnabledVideo");
          }
        }
      }
      CFRelease(v4);
    }
  }
}

- (void)_ensureVideoLayersAreAttached
{
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__AVPlayer_AVPlayerMultitaskSupport___ensureVideoLayersAreAttached__block_invoke;
  v3[3] = &unk_1E57B1E80;
  v3[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v3);
}

uint64_t __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 404) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 397) = *(unsigned char *)(result + 40);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfRate
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfCurrentItem
{
  return 0;
}

id __27__AVPlayer__subtitleLayers__block_invoke(uint64_t a1)
{
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 664)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __24__AVPlayer__videoLayers__block_invoke(uint64_t a1)
{
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 656)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __32__AVPlayer__closedCaptionLayers__block_invoke(uint64_t a1)
{
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 672)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __94__AVPlayer_AVPlayerProtectedContentPrivate__outputObscuredDueToInsufficientExternalProtection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 470);
  return result;
}

- (void)_noteNewPresentationSizeForPlayerItem:(id)a3
{
  [(AVPlayer *)self willChangeValueForKey:@"cachedPresentationSizeOfCurrentItem"];
  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(currentItemPropertyUpdateQueue, v6);
  [(AVPlayer *)self didChangeValueForKey:@"cachedPresentationSizeOfCurrentItem"];
}

- (BOOL)_isInterstitialPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayer_AVPlayerInterstitialSupport_Internal___isInterstitialPlayer__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setCurrentItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  currentItem = self->_player->currentItem;
  if (currentItem != a3)
  {
    uint64_t v6 = currentItem;
    if (dword_1EB2D3AA0)
    {
      int v12 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v8 = a3;

    self->_player->currentItem = (AVPlayerItem *)a3;
    configurationQueue = self->_player->configurationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__AVPlayer__setCurrentItem___block_invoke;
    block[3] = &unk_1E57B2138;
    block[4] = v6;
    void block[5] = self;
    void block[6] = a3;
    dispatch_async(configurationQueue, block);
  }
}

uint64_t __27__AVPlayer__nameForLogging__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nameForLogging_fromIvarAccessQueue"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_nameForLogging_fromIvarAccessQueue
{
  if (!self->_player->loggingIdentifier) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  }
  loggingIdentifier = self->_player->loggingIdentifier;
  return (id)[(AVLoggingIdentifier *)loggingIdentifier name];
}

uint64_t __88__AVPlayer_AVPlayerVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 404);
  return result;
}

uint64_t __81__AVPlayer_AVPlayerAdvanceWithOverlap___supportsAdvanceTimeForOverlappedPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 409);
  return result;
}

uint64_t __77__AVPlayer_AVPlayerSupportForMediaPlayer___isConnectedToPhysicalSecondScreen__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 469);
  return result;
}

uint64_t __77__AVPlayer_AVPlayerAudioSessionParticipant___preservesAudioSessionSampleRate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 552);
  return result;
}

uint64_t __72__AVPlayer_AVPlayerAudioSessionParticipant___participatesInAudioSession__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 352);
  return result;
}

uint64_t __59__AVPlayer_FigVideoTargetSupport__shouldWaitForVideoTarget__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 584);
  return result;
}

uint64_t __49__AVPlayer_AVPlayerSpeedRamp__supportsSpeedRamps__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 410);
  return result;
}

uint64_t __38__AVPlayer_isDisplayingClosedCaptions__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 465);
  return result;
}

float __23__AVPlayer_defaultRate__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 500);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)currentItemPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"currentItem" notificationName:@"AVPlayerCurrentItemDidChangeForPublishersNotification"];
}

- (id)closedCaptionsDisplayPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"isDisplayingClosedCaptions" notificationName:@"AVPlayerIsDisplayingClosedCaptionsDidChangeNotification"];
}

uint64_t __34__AVPlayer_allowsExternalPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 407);
  return result;
}

uint64_t __110__AVPlayer__handleSetRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v36[0] = *MEMORY[0x1E4F34458];
  v37[0] = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v36[1] = *MEMORY[0x1E4F34448];
  CMTime v35 = *(CMTime *)(a1 + 40);
  v37[1] = NSDictionaryFromCMTime(&v35);
  v36[2] = *MEMORY[0x1E4F34468];
  v37[2] = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a1 + 64)];
  v36[3] = *MEMORY[0x1E4F34460];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
  v36[4] = *MEMORY[0x1E4F34450];
  if (*(unsigned char *)(a1 + 73)) {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *v7;
  v37[3] = v6;
  v37[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
  if (a2)
  {
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    if (*(void *)(v12 + 104))
    {
      float v14 = *(float *)(a1 + 68);
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v17 = *(void *)(VTable + 16);
      uint64_t result = VTable + 16;
      uint64_t v16 = v17;
      if (v17) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = 0;
      }
      v31 = *(uint64_t (**)(uint64_t, uint64_t, float))(v18 + 104);
      if (v31) {
        return v31(a2, v9, v14);
      }
    }
    else
    {
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      if (*(void *)(v20 + 56))
      {
        float v21 = *(float *)(a1 + 68);
        *(_OWORD *)&v34.value = *(_OWORD *)(a1 + 40);
        v34.epoch = *(void *)(a1 + 56);
        uint64_t v22 = CMBaseObjectGetVTable();
        uint64_t v24 = *(void *)(v22 + 16);
        uint64_t result = v22 + 16;
        uint64_t v23 = v24;
        if (v24) {
          uint64_t v25 = v23;
        }
        else {
          uint64_t v25 = 0;
        }
        v33 = *(uint64_t (**)(uint64_t, CMTime *, float))(v25 + 56);
        if (v33)
        {
          CMTime v35 = v34;
          return v33(a2, &v35, v21);
        }
      }
      else
      {
        float v26 = *(float *)(a1 + 68);
        uint64_t v27 = CMBaseObjectGetVTable();
        uint64_t v29 = *(void *)(v27 + 16);
        uint64_t result = v27 + 16;
        uint64_t v28 = v29;
        if (v29) {
          uint64_t v30 = v28;
        }
        else {
          uint64_t v30 = 0;
        }
        v32 = *(uint64_t (**)(uint64_t, float))(v30 + 40);
        if (v32) {
          return v32(a2, v26);
        }
      }
    }
  }
  else
  {
    LODWORD(v10) = *(_DWORD *)(a1 + 68);
    objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v10), @"AVPlayer_FigPlayerProperty_Rate");
    return [*(id *)(a1 + 32) _setPendingFigPlayerProperty:v9 forKey:@"AVPlayer_FigPlayerProperty_RateOptions"];
  }
  return result;
}

uint64_t __16__AVPlayer_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _layerForegroundStateChanged:a2];
}

void __28__AVPlayer__setCurrentItem___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_stopObservingPropertiesOfCurrentItem:");
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 40), "_startObservingPropertiesOfCurrentItem:");
  }
  uint64_t v2 = *(void **)(a1 + 32);
}

- (AVPlayerWaitingReason)reasonForWaitingToPlay
{
  id v2 = [(AVPlayer *)self _rateState];
  return (AVPlayerWaitingReason)[v2 reasonForWaitingToPlay];
}

void __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  CMTime v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  char v2 = [*(id *)(a1 + 32) _hasCurrentInterstitialEvent];
  uint64_t v3 = [*(id *)(a1 + 32) _nameForLogging];
  if (dword_1EB2D3AA0)
  {
    unsigned int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", @"currentItem", v17, v21);
  if (dword_1EB2D3AA0)
  {
    unsigned int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", @"timeControlStatus", v18, v22);
  [*(id *)(a1 + 32) willChangeValueForKey:@"reasonForWaitingToPlay"];
  block[0] = MEMORY[0x1E4F143A8];
  long long v6 = *(_OWORD *)(a1 + 48);
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  block[1] = 3221225472;
  block[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_424;
  block[3] = &unk_1E57B3658;
  uint64_t v30 = &v34;
  long long v29 = v6;
  int8x16_t v27 = v7;
  char v31 = v2;
  uint64_t v28 = v3;
  av_readwrite_dispatch_queue_write(v8, block);
  if (([*(id *)(a1 + 40) isFailed] & 1) == 0 && *((unsigned char *)v35 + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) _synchronizeWithNewCurrentItem];
    [*(id *)(a1 + 32) _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression];
  }
  if (dword_1EB2D3AA0)
  {
    unsigned int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v10 = v33;
    if (os_log_type_enabled(v9, type)) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = v10 & 0xFFFFFFFE;
    }
    if (v11)
    {
      int v38 = 136315394;
      v39 = "-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:]_block_invoke";
      __int16 v40 = 2114;
      uint64_t v41 = v3;
      LODWORD(v23) = 22;
      uint64_t v19 = &v38;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"currentItem", v19, v23);
  if (dword_1EB2D3AA0)
  {
    unsigned int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v13 = v33;
    if (os_log_type_enabled(v12, type)) {
      unsigned int v14 = v13;
    }
    else {
      unsigned int v14 = v13 & 0xFFFFFFFE;
    }
    if (v14)
    {
      int v38 = 136315394;
      v39 = "-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:]_block_invoke";
      __int16 v40 = 2114;
      uint64_t v41 = v3;
      LODWORD(v24) = 22;
      uint64_t v20 = &v38;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", @"timeControlStatus", v20, v24);
  [*(id *)(a1 + 32) didChangeValueForKey:@"reasonForWaitingToPlay"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerCurrentItemDidChangeForPublishersNotification", *(void *)(a1 + 32), 0);
  if (([*(id *)(a1 + 40) isFailed] & 1) == 0)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(NSObject **)(*(void *)(v15 + 8) + 32);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_425;
    v25[3] = &unk_1E57B1E80;
    v25[4] = v15;
    AVSerializeOnQueueAsyncIfNecessary(v16, v25);
    if (*((unsigned char *)v35 + 24)) {
      [*(id *)(a1 + 32) _updateProxyTimebaseFromNewCurrentItem];
    }
  }
  _Block_object_dispose(&v34, 8);
}

- (BOOL)_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:(id)a3 modificationBlock:(id)a4 error:(id *)a5
{
  uint64_t v9 = objc_alloc_init(AVResult);
  uint64_t v30 = 0;
  uint64_t v26 = 0;
  int8x16_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  uint64_t v24 = __Block_byref_object_dispose__5;
  uint64_t v25 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke;
  block[3] = &unk_1E57B3630;
  block[8] = &v26;
  block[9] = &v20;
  void block[4] = v9;
  void block[5] = self;
  void block[6] = a3;
  void block[7] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v11 = (id)v21[5];
  if (![(AVResult *)v9 isFailed])
  {
    player = self->_player;
    if (*((unsigned char *)v27 + 24))
    {
      KVOChangeSerializer = player->KVOChangeSerializer;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2;
      v18[3] = &unk_1E57B36A8;
      v18[4] = self;
      v18[5] = v9;
      v18[6] = a3;
      v18[7] = a4;
      v18[8] = &v20;
      [(AVBlockScheduler *)KVOChangeSerializer scheduleBlock:v18];
      if ([(AVResult *)v9 isFailed]) {
        goto LABEL_7;
      }
    }
    else
    {
      stateDispatchQueue = player->stateDispatchQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_3;
      v17[3] = &unk_1E57B1E80;
      v17[4] = self;
      AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v17);
    }
    [(AVResult *)v9 markAsCompleted];
  }
LABEL_7:
  [(AVResult *)v9 getStatus:&v30 error:a5];

  BOOL v15 = v30 == 1;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v15;
}

- (id)_synchronizeWithNewCurrentItem
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  unsigned int v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  [(AVPlayer *)self willChangeValueForKey:@"cachedPresentationSizeOfCurrentItem"];
  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(currentItemPropertyUpdateQueue, v6);
  [(AVPlayer *)self didChangeValueForKey:@"cachedPresentationSizeOfCurrentItem"];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_updateProxyTimebaseFromNewCurrentItem
{
  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayer__updateProxyTimebaseFromNewCurrentItem__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

- (void)_startObservingPropertiesOfCurrentItem:(id)a3
{
  id v5 = [(AVPlayer *)self _weakReference];
  long long v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke;
  v9[3] = &unk_1E57B36F8;
  v9[4] = v5;
  self->_player->currentItemSuppressesVideoLayersNotificationToken = (id)[v6 addObserverForName:@"AVPlayerItemSuppressesVideoLayersDidChangeNotification" object:a3 queue:0 usingBlock:v9];
  [(AVPlayer *)self _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression];
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke_2;
  v8[3] = &unk_1E57B36F8;
  v8[4] = v5;
  self->_player->currentItemPreferredPixelBufferAttributesNotificationToken = (id)[v7 addObserverForName:0x1EE597258 object:a3 queue:0 usingBlock:v8];
  [(AVPlayer *)self _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression];
}

- (void)_updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression
{
  figConfigurationQueue = self->_player->figConfigurationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVPlayer__updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  dispatch_sync(figConfigurationQueue, block);
}

void __52__AVPlayer_setAutomaticallyWaitsToMinimizeStalling___block_invoke(uint64_t a1)
{
  char v2 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488), "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) != 0, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40)), "rateStateBySettingAutomaticallyWaitsToMinimizeStalling:", *(unsigned __int8 *)(a1 + 49));
  if (dword_1EB2D3AA0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v4 = v2;

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) = v2;
}

uint64_t __66__AVPlayer__updateAutomaticallyWaitsToMinimizeStallingOnFigPlayer__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) automaticallyWaitsToMinimizeStalling];
  uint64_t v3 = *MEMORY[0x1E4F1CFC8];
  if (v2) {
    uint64_t v4 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v4 = *MEMORY[0x1E4F1CFC8];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F341C0];
  if (*(void *)(v5[1] + 728))
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    unsigned int v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 56);
    if (v13) {
      v13(FigBaseObject, v6, v4);
    }
    uint64_t v14 = FigPlayerGetFigBaseObject();
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v17 = *(void *)(VTable + 8);
    uint64_t result = VTable + 8;
    uint64_t v16 = v17;
    if (v17) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 56);
    if (v19)
    {
      uint64_t v20 = *MEMORY[0x1E4F341A0];
      return v19(v14, v20, v3);
    }
  }
  else
  {
    [v5 _setPendingFigPlayerProperty:v4 forKey:*MEMORY[0x1E4F341C0]];
    unsigned int v10 = *(void **)(a1 + 32);
    uint64_t v11 = *MEMORY[0x1E4F341A0];
    return [v10 _setPendingFigPlayerProperty:v3 forKey:v11];
  }
  return result;
}

- (BOOL)automaticallyWaitsToMinimizeStalling
{
  id v2 = [(AVPlayer *)self _rateState];
  return [v2 automaticallyWaitsToMinimizeStalling];
}

- (float)rate
{
  id v2 = [(AVPlayer *)self _rateState];
  [v2 rate];
  return result;
}

- (AVPlayerTimeControlStatus)timeControlStatus
{
  id v2 = [(AVPlayer *)self _rateState];
  return [v2 timeControlStatus];
}

- (id)_rateState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  unsigned int v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayer__rateState__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_424(uint64_t a1)
{
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      id v2 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 488) rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 176) != 0 hasCurrentInterstitialEvent:*(unsigned __int8 *)(a1 + 80) nameForLogging:*(void *)(a1 + 48)];
      if (dword_1EB2D3AA0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v4 = v2;

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 488) = v2;
    }
  }
  else
  {
    [*(id *)(a1 + 32) markAsFailedWithError:0];
  }
}

id __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0) {
    return (id)[*(id *)(a1 + 32) markAsFailedWithError:v3];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 176);
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  return result;
}

uint64_t __34__AVPlayer__insertItem_afterItem___block_invoke(uint64_t a1, BOOL *a2, uint64_t *a3)
{
  int v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 192) containsObject:*(void *)(a1 + 40)];
  if (v6) {
    *a3 = AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"An AVPlayerItem can occupy only one position in a player's queue at a time." userInfo:0]);
  }
  else {
    *a2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) == 0;
  }
  return v6 ^ 1u;
}

uint64_t __34__AVPlayer__insertItem_afterItem___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 192), "containsObject:");
    if (!result) {
      return result;
    }
    uint64_t v3 = a1[4];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  return objc_msgSend(v4, "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", v5, v3);
}

- (void)_enqueuePlayQueueModification_invokeOnIvarAccessQueue:(id)a3
{
  id v4 = [(NSArray *)self->_player->queueModifications arrayByAddingObject:a3];

  self->_player->queueModifications = (NSArray *)[(NSArray *)v4 copy];
}

- (void)_addItemToLinkedList_invokeOnIvarAccessQueue:(id)a3 afterItem:(id)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVPlayer.m", 5107, @"Invalid parameter not satisfying: %@", @"item != nil");
  }
  [(NSMutableSet *)self->_player->items addObject:a3];
  lastItem = (AVPlayerItem *)a4;
  if (!a4 && (player = self->_player, (lastItem = player->lastItem) == 0)
    || ([a3 _insertAfterItem:lastItem], player = self->_player, lastItem == player->lastItem))
  {
    player->lastItem = (AVPlayerItem *)a3;
    player = self->_player;
  }
  if (!player->currentItem) {
    [(AVPlayer *)self _setCurrentItem:a3];
  }
  id v9 = +[AVPlayerQueueModificationDescription modificationForInsertingItem:a3 afterItem:a4];
  [(AVPlayer *)self _enqueuePlayQueueModification_invokeOnIvarAccessQueue:v9];
}

void __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int v4 = *(_DWORD *)(v3 + 496) + 1;
  *(_DWORD *)(v3 + 496) = v4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488), "rateStateBySettingRate:nameForLogging:", *(void *)(a1 + 40), a2), "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) != 0, *(unsigned __int8 *)(a1 + 60), *(void *)(a1 + 40));
  if (dword_1EB2D3AA0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v7 = v5;

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) = v5;
}

uint64_t __41__AVPlayer__externalPlaybackVideoGravity__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 360) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 467) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __36__AVPlayer_isExternalPlaybackActive__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v1 + 466)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(unsigned char *)(v1 + 469) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

uint64_t __27__AVPlayer_actionAtItemEnd__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 368);
  return result;
}

uint64_t __86__AVPlayer_AVPlayerLegibleFallback__allowsLegibleFallbackForAllAudibleMediaSelections__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 745);
  return result;
}

uint64_t __69__AVPlayer_PlaybackCoordination___clientRequestedPlaybackCoordinator__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 600);
  return result;
}

uint64_t __51__AVPlayer_AVPlayer_PIPSupport___isPIPModePossible__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 464);
  return result;
}

uint64_t __33__AVPlayer__isAirPlayVideoActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 467);
  return result;
}

- (void)setAudiovisualBackgroundPlaybackPolicy:(AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer_setAudiovisualBackgroundPlaybackPolicy___block_invoke;
  block[3] = &unk_1E57B3B20;
  void block[4] = self;
  void block[5] = &v6;
  void block[6] = audiovisualBackgroundPlaybackPolicy;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerAudiovisualBackgroundPlaybackPolicyDidChangeNotification", self, 0);
  }
  _Block_object_dispose(&v6, 8);
}

void __50__AVPlayer__updateProxyTimebaseFromNewCurrentItem__block_invoke(uint64_t a1)
{
  CMTimebaseRef timebaseOut = (CMTimebaseRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentItem"), "_copyProxyTimebase");
  if (!timebaseOut)
  {
    CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    HostTimeClock = CMClockGetHostTimeClock();
    CMTimebaseCreateWithSourceClock(v2, HostTimeClock, &timebaseOut);
    int v4 = timebaseOut;
    CMTimebaseGetTime(&v5, *(CMTimebaseRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 80));
    CMTimebaseSetTime(v4, &v5);
  }
  FigReadOnlyTimebaseSetTargetTimebase();
  if (timebaseOut) {
    CFRelease(timebaseOut);
  }
}

void __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (void *)[*(id *)(a1 + 32) currentItem];
  if (*(void **)(a1 + 40) == v2)
  {
    char v3 = [v2 isNonForcedSubtitleDisplayEnabled];
    uint64_t v4 = *(void *)(a1 + 32);
    CMTime v5 = *(NSObject **)(*(void *)(v4 + 8) + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke_2;
    v6[3] = &unk_1E57B20E8;
    v6[4] = v4;
    char v7 = v3;
    av_readwrite_dispatch_queue_write(v5, v6);
  }
}

void __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) currentItem];
  CFAllocatorRef v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    if (![v2 _isReadyForInspectionOfPresentationSize]) {
      return;
    }
    char v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isNonForcedSubtitleDisplayEnabled];
    long long v12 = *MEMORY[0x1E4F1DB30];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _getCachedPresentationSize:&v12];
    uint64_t v4 = *(void *)(a1 + 32);
    CMTime v5 = *(NSObject **)(*(void *)(v4 + 8) + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_2;
    v9[3] = &unk_1E57B3608;
    v9[4] = v4;
    long long v10 = v12;
    char v11 = v3;
    uint64_t v6 = v9;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CMTime v5 = *(NSObject **)(*(void *)(v7 + 8) + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_3;
    block[3] = &unk_1E57B1E80;
    void block[4] = v7;
    uint64_t v6 = block;
  }
  av_readwrite_dispatch_queue_write(v5, v6);
}

void __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (void *)[*(id *)(a1 + 32) currentItem];
  if (*(void **)(a1 + 40) == v2)
  {
    long long v7 = *MEMORY[0x1E4F1DB30];
    [v2 _getCachedPresentationSize:&v7];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(*(void *)(v3 + 8) + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AVPlayer__noteNewPresentationSizeForPlayerItem___block_invoke_2;
    block[3] = &unk_1E57B36D0;
    void block[4] = v3;
    long long v6 = v7;
    av_readwrite_dispatch_queue_write(v4, block);
  }
}

uint64_t __49__AVPlayer__updatePixelBufferAttributesForLayer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), "setRequestedPixelBufferAttributes:forKey:", objc_msgSend(*(id *)(a1 + 32), "pixelBufferAttributes"), *(void *)(a1 + 48));
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) mediatedPixelBufferAttributes];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v3 _updateDecoderPixelBufferAttributes:v2 onFigPlayer:v4];
}

void __84__AVPlayer__updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) currentItem];
  uint64_t v3 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  if (v2)
  {
    uint64_t v4 = [v2 _preferredPixelBufferAttributes];
    uint64_t v5 = [v2 _suppressesVideoLayers];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) setRequestedPixelBufferAttributes:v4 forKey:@"currentItem"];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) setLayersAreSuppressed:v5];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) removeRequestedPixelBufferAttributesAttributesForKey:@"currentItem"];
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateDecoderPixelBufferAttributes:onFigPlayer:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), "mediatedPixelBufferAttributes"), v3);
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)_updateDecoderPixelBufferAttributes:(id)a3 onFigPlayer:(OpaqueFigPlayer *)a4
{
  if (a4)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v7 = v6 ? v6 : 0;
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, id))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F34228];
      v8(FigBaseObject, v9, a3);
    }
  }
}

- (AVPlayerItem)currentItem
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_currentItem__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (AVPlayerItem *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __85__AVPlayer_AVPlayerAdvanceWithOverlap___setSupportsAdvanceTimeForOverlappedPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 409) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __75__AVPlayer_AVPlayerInterstitialSupport_Internal___setIsInterstitialPlayer___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 556) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __75__AVPlayer__setRateDidChangeNotificationIncludesExtendedDiagnosticPayload___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 616) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 408) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __41__AVPlayer__setSuppressesAudioRendering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 555) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __21__AVPlayer_setMuted___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 395) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 405) = *(unsigned char *)(result + 40);
  return result;
}

+ (id)keyPathsForValuesAffectingVolume
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"status"];
}

uint64_t __59__AVPlayer_usesExternalPlaybackWhileExternalScreenIsActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 408);
  return result;
}

uint64_t __100__AVPlayer_AVPlayerAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 405);
  return result;
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_425(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2_426;
  v3[3] = &unk_1E57B3680;
  v3[4] = v1;
  return [v1 _applyPlayQueueChangesToFigPlayerWithCompletionHandler:v3];
}

- (void)_applyPlayQueueChangesToFigPlayerWithCompletionHandler:(id)a3
{
  player = self->_player;
  if (player->figPlayer)
  {
    uint64_t v14 = 0;
    BOOL v15 = &v14;
    uint64_t v16 = 0x3052000000;
    uint64_t v17 = __Block_byref_object_copy__5;
    uint64_t v18 = __Block_byref_object_dispose__5;
    uint64_t v19 = 0;
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E57B37E8;
    v13[4] = self;
    void v13[5] = &v14;
    [(AVPlayer *)self _applyLinkedListOfItemsToFigPlayerUsingBlock:v13];
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v15[5]);
LABEL_11:
    _Block_object_dispose(&v14, 8);
    return;
  }
  if (player->needsToCreateFigPlayer)
  {
    uint64_t v14 = 0;
    BOOL v15 = &v14;
    uint64_t v16 = 0x3052000000;
    uint64_t v17 = __Block_byref_object_copy__5;
    uint64_t v18 = __Block_byref_object_dispose__5;
    uint64_t v19 = 0;
    ivarAccessQueue = player->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E57B2110;
    void block[4] = self;
    void block[5] = &v14;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
    uint64_t v7 = (void *)v15[5];
    if (v7)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "item"), "asset");
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_3;
      void v11[3] = &unk_1E57B38B0;
      v11[4] = self;
      v11[5] = a3;
      AVPlayerGetFigPlayerTypeForAsset(v8, (uint64_t)v11);
      self->_player->needsToCreateFigPlayer = 0;
    }
    else
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, [MEMORY[0x1E4F1C978] array]);
    }

    goto LABEL_11;
  }
  uint64_t v9 = [MEMORY[0x1E4F1C978] array];
  long long v10 = (void (*)(id, uint64_t))*((void *)a3 + 2);
  v10(a3, v9);
}

id __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 200) firstObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)pause
{
}

- (void)_layerForegroundStateChanged:(id)a3
{
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__AVPlayer_AVPlayerMultitaskSupport___layerForegroundStateChanged___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v4);
}

uint64_t __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) referencedObject];
  return [v1 _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression];
}

void __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 448) = *(void *)(a1 + 40);
}

id __56__AVPlayer_AVPlayerLoggingIdentifier__loggingIdentifier__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 624);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void *__68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result[4] + 8);
  uint64_t v3 = *(void **)(v2 + 248);
  if (v3 || *(unsigned char *)(v2 + 556))
  {
    id result = v3;
    *(void *)(*(void *)(v1[6] + 8) + 40) = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_setRate:(float)a3 rateChangeReason:(int)a4 figPlayerSetRateHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  BOOL v9 = [(AVPlayer *)self _hasCurrentInterstitialEvent];
  id v10 = [(AVPlayer *)self _nameForLogging];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  [(AVPlayer *)self willChangeValueForKey:@"rate"];
  [(AVPlayer *)self willChangeValueForKey:@"timeControlStatus"];
  [(AVPlayer *)self willChangeValueForKey:@"reasonForWaitingToPlay"];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke;
  block[3] = &unk_1E57B3928;
  void block[5] = v10;
  void block[6] = &v20;
  float v18 = a3;
  void block[4] = self;
  BOOL v19 = v9;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    strncpy(__dst, (const char *)[v10 UTF8String], 8uLL);
    kdebug_trace();
  }
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_498;
  v16[3] = &unk_1E57B3950;
  v16[6] = a5;
  v16[7] = &v20;
  v16[8] = &v24;
  v16[4] = self;
  v16[5] = v10;
  dispatch_sync(figConfigurationQueue, v16);
  [(AVPlayer *)self didChangeValueForKey:@"rate"];
  [(AVPlayer *)self didChangeValueForKey:@"timeControlStatus"];
  [(AVPlayer *)self didChangeValueForKey:@"reasonForWaitingToPlay"];
  id v13 = -[AVPlayer _rateDidChangeNotificationPayloadForFigRateChangeReason:rateChangeIdentifier:rateChangeOriginator:](self, "_rateDidChangeNotificationPayloadForFigRateChangeReason:rateChangeIdentifier:rateChangeOriginator:", v6, [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)v21 + 6)], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerRateDidChangeNotification", self, v13);
  char v14 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

- (void)_setActionAtItemEnd:(int64_t)a3 allowingAdvance:(BOOL)a4
{
  if (!a3 && !a4)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    float v18 = NSString;
    BOOL v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = [v18 stringWithFormat:@"AVPlayerActionAtItemEndAdvance is not allowed for a player of class %@", NSStringFromClass(v19)];
LABEL_21:
    uint64_t v23 = v20;
    uint64_t v24 = v16;
    uint64_t v25 = v17;
    goto LABEL_23;
  }
  if (a3 == 3 && !a4)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = NSString;
    uint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v20 = [v21 stringWithFormat:@"AVPlayerActionAtItemEndAdvanceUntilEndOfQueue is not allowed for a player of class %@", NSStringFromClass(v22)];
    goto LABEL_21;
  }
  if (![(AVPlayer *)self figPlayerActionForActionAtItemEnd:a3])
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    uint64_t v28 = NSString;
    char v29 = (objc_class *)objc_opt_class();
    uint64_t v23 = [v28 stringWithFormat:@"%d is not a valid actionAtItemEnd for a player of class %@", a3, NSStringFromClass(v29)];
    uint64_t v24 = v26;
    uint64_t v25 = v27;
LABEL_23:
    objc_exception_throw((id)[v24 exceptionWithName:v25 reason:v23 userInfo:0]);
  }
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
  if (v7)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    int v32 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke_2;
    v30[3] = &unk_1E57B3A60;
    v30[4] = self;
    v30[5] = v31;
    v30[6] = v7;
    dispatch_sync(figConfigurationQueue, v30);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    BOOL v9 = [(AVPlayer *)self figPlayerActionForActionAtItemEnd:a3];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v9 forKey:*MEMORY[0x1E4F34158]];
  }
  id v10 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  if (v10)
  {
    uint64_t v11 = v10;
    long long v12 = [(AVPlayer *)self figPlayerActionForActionAtItemEnd:[(AVPlayer *)self actionAtItemEnd]];
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    BOOL v15 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, __CFString *))(v14 + 64);
    if (v15) {
      v15(v11, v12);
    }
    CFRelease(v11);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (__CFString)figPlayerActionForActionAtItemEnd:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = (__CFString **)MEMORY[0x1E4F33E88];
      goto LABEL_7;
    case 1:
      uint64_t v3 = (__CFString **)MEMORY[0x1E4F33E98];
      goto LABEL_7;
    case 2:
      uint64_t v3 = (__CFString **)MEMORY[0x1E4F33E90];
      goto LABEL_7;
    case 3:
      uint64_t v3 = (__CFString **)MEMORY[0x1E4F33EA0];
LABEL_7:
      id result = *v3;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)_hasCurrentInterstitialEvent
{
  uint64_t v3 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  [(AVPlayer *)self _nameForLogging];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(OpaqueFigPlayerInterstitialCoordinator *))(v5 + 16);
  if (v7)
  {
    uint64_t v8 = (const void *)v7(v3);
    BOOL v6 = v8 != 0;
    if (v8)
    {
      CFRelease(v8);
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (id)_nameForLogging
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  BOOL v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__nameForLogging__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinatorIfCreated
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialCoordinatorIfCreated__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (OpaqueFigPlayerInterstitialCoordinator *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_insertItem:(id)a3 afterItem:(id)a4
{
  v14[24] = *(id *)MEMORY[0x1E4F143B8];
  v14[0] = 0;
  if (dword_1EB2D3AA0)
  {
    int v13 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a3, "_attachToPlayer:", self, v8, v9);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__AVPlayer__insertItem_afterItem___block_invoke;
  void v11[3] = &unk_1E57B37C0;
  v11[4] = self;
  v11[5] = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__AVPlayer__insertItem_afterItem___block_invoke_2;
  v10[3] = &unk_1E57B2138;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = a3;
  if (!-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v11, v10, v14)&& [v14[0] code] == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v14[0], "userInfo"), "objectForKey:", @"AVErrorExceptionKey"));
  }
}

- (id)_weakReference
{
  return self->_player->weakReference;
}

- (id)_stateDispatchQueue
{
  return self->_player->stateDispatchQueue;
}

- (id)_rateDidChangeNotificationPayloadForFigRateChangeReason:(int)a3 rateChangeIdentifier:(id)a4 rateChangeOriginator:(id)a5
{
  if (a3 <= 12)
  {
    if (a3 > 3)
    {
      if (a3 == 4)
      {
        uint64_t v7 = 1;
        uint64_t v8 = @"AVPlayerRateDidChangeReasonPlaybackStalled";
        return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
      }
      if (a3 == 12)
      {
        uint64_t v7 = 1;
        uint64_t v8 = @"AVPlayerRateDidChangeReasonRouteChanged";
        return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
      }
    }
    else
    {
      if (a3 == 1)
      {
        uint64_t v7 = 1;
        uint64_t v8 = @"AVPlayerRateDidChangeReasonPauseAtItemEnd";
        return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
      }
      if (a3 == 2)
      {
        uint64_t v7 = 0;
        uint64_t v8 = @"AVPlayerRateDidChangeReasonSetRateFailed";
        return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
      }
    }
LABEL_23:
    uint64_t v8 = 0;
    uint64_t v7 = 1;
    return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
  }
  if (a3 <= 23)
  {
    if (a3 == 13)
    {
      uint64_t v7 = 0;
      uint64_t v8 = @"AVPlayerRateDidChangeReasonAudioSessionInterrupted";
      return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
    }
    if (a3 == 23)
    {
      uint64_t v7 = 0;
      uint64_t v8 = @"AVPlayerRateDidChangeReasonSetRateCalled";
      return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
    }
    goto LABEL_23;
  }
  if (a3 == 24)
  {
    uint64_t v7 = 1;
    uint64_t v8 = @"AVPlayerRateDidChangeReasonPlaybackResumed";
    return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
  }
  if (a3 == 25)
  {
    uint64_t v7 = 0;
    uint64_t v8 = @"AVPlayerRateDidChangeReasonAppBackgrounded";
    return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
  }
  if (a3 != 33) {
    goto LABEL_23;
  }
  uint64_t v7 = 1;
  uint64_t v8 = @"AVPlayerRateDidChangeReasonCoordinatedPlayback";
  return [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:v8 reasonIsExtendedDiagnostic:v7 rateChangeIdentifier:a4 rateChangeOriginator:a5];
}

- (id)_rateDidChangeNotificationPayloadForAVFRateChangeReason:(id)a3 reasonIsExtendedDiagnostic:(BOOL)a4 rateChangeIdentifier:(id)a5 rateChangeOriginator:(id)a6
{
  if (!a3) {
    return 0;
  }
  BOOL v8 = a4;
  BOOL v11 = [(AVPlayer *)self _rateDidChangeNotificationIncludesExtendedDiagnosticPayload];
  long long v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v13 = v12;
  if (!v8 || v11) {
    [v12 setObject:a3 forKeyedSubscript:@"AVPlayerRateDidChangeReasonKey"];
  }
  if (a5) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14) {
    [v13 setObject:a5 forKeyedSubscript:@"AVPlayerRateDidChangeRateChangeIdentifierKey"];
  }
  if (a6) {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(-[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup"), "participantForIdentifier:", a6), @"AVPlayerRateDidChangeOriginatingParticipantKey");
  }
  return v13;
}

- (BOOL)_rateDidChangeNotificationIncludesExtendedDiagnosticPayload
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayer__rateDidChangeNotificationIncludesExtendedDiagnosticPayload__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__AVPlayer_AVPlayerProtectedContentPrivate__outputObscuredDueToInsufficientExternalProtection__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)prerollOperationDidComplete:(BOOL)a3 notificationPayload:(__CFDictionary *)a4
{
  if (a4)
  {
    BOOL v5 = a3;
    CFTypeID v7 = CFGetTypeID(a4);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E4F34130]);
      if (Value)
      {
        CFNumberRef v9 = Value;
        CFTypeID v10 = CFGetTypeID(Value);
        if (v10 == CFNumberGetTypeID())
        {
          int valuePtr = 0;
          CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
          MEMORY[0x199715030](self->_player->prerollIDMutex);
          player = self->_player;
          if (valuePtr == player->pendingPrerollID && player->prerollCompletionHandler)
          {
            long long v12 = [(AVPlayer *)self _unregisterAndReturnRetainedPrerollCompletionHandler];
            MEMORY[0x199715040](self->_player->prerollIDMutex);
            if (v12)
            {
              v12[2](v12, v5);
            }
          }
          else
          {
            MEMORY[0x199715040](player->prerollIDMutex);
          }
        }
      }
    }
  }
}

- (BOOL)isMuted
{
  uint64_t v6 = 0;
  CFTypeID v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __19__AVPlayer_isMuted__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 406) = *(unsigned char *)(result + 40);
  return result;
}

id __68__AVPlayer_AVPlayerInterstitialSupport_Internal__interstitialPlayer__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  char v3 = *(void **)(v2 + 248);
  if (v3 || *(unsigned char *)(v2 + 556))
  {
    id result = v3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(AVQueuePlayer);
    objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id result = (id)objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    BOOL v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 232);
    if (v5)
    {
      id result = v5;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

- (void)_setInterstitialPlayerOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AVPlayer *)self _items_invokeOnIvarAccessQueue];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * v8) _copyIntegratedTimelineIfCreated];
        [v9 _attachInterstitialPlayer:a3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __57__AVPlayer__applyLinkedListOfItemsToFigPlayerUsingBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 200);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 200) = objc_alloc_init(MEMORY[0x1E4F1C978]);
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_items_invokeOnIvarAccessQueue"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_items_invokeOnIvarAccessQueue
{
  char v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableSet count](self->_player->items, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayer__items_invokeOnIvarAccessQueue__block_invoke;
  v5[3] = &unk_1E57B3900;
  v5[4] = v3;
  [(AVPlayer *)self _enumerateItemsUsingBlock:v5];
  return v3;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  currentItem = self->_player->currentItem;
  do
  {
    if (!currentItem) {
      break;
    }
    uint64_t v5 = [(AVPlayerItem *)currentItem _nextItem];
    char v6 = 0;
    (*((void (**)(id, AVPlayerItem *, char *))a3 + 2))(a3, currentItem, &v6);
    currentItem = (AVPlayerItem *)v5;
  }
  while (!v6);
}

uint64_t __42__AVPlayer__items_invokeOnIvarAccessQueue__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:(id)a3
{
  id v5 = a3;

  self->_player->interstitialPlayer = (AVQueuePlayer *)a3;
  [a3 _setIsInterstitialPlayer:1];
  objc_msgSend(a3, "_setWeakReferenceToPrimaryPlayer:", -[AVPlayer _weakReference](self, "_weakReference"));
  player = self->_player;
  playbackCoordinator = player->playbackCoordinator;
  if (player->clientRequestedPlaybackCoordinator) {
    uint64_t v8 = [a3 playbackCoordinator];
  }
  else {
    uint64_t v8 = [a3 _playbackCoordinatorWithoutTriggeringFullSetup];
  }
  char v9 = (void *)v8;
  [(AVPlayerPlaybackCoordinator *)playbackCoordinator setInterstitialPlaybackCoordinator:v8];
  [v9 setWeakReferenceToPrimaryPlaybackCoordinator:playbackCoordinator];
  playerName = self->_player->playerName;
  [a3 _setPrimaryPlayerNameForInterstitial:playerName];
}

- (void)_setWeakReferenceToPrimaryPlayer:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setWeakReferenceToPrimaryPlayer___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)_setIsInterstitialPlayer:(BOOL)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AVPlayer_AVPlayerInterstitialSupport_Internal___setIsInterstitialPlayer___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)_setPrimaryPlayerNameForInterstitial:(id)a3
{
}

id __74__AVPlayer_AVPlayerLegibleFallback__legibleFallbackMediaSelectionCriteria__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 752);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __74__AVPlayer_AVPlayerAutomaticMediaSelection___cachedMediaSelectionCriteria__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 632) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __39__AVPlayer__pendingFigPlayerProperties__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 208) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVPlayerPlaybackCoordinator)playbackCoordinator
{
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayer_PlaybackCoordination__playbackCoordinator__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v5);
  return (AVPlayerPlaybackCoordinator *)[(AVPlayer *)self _playbackCoordinatorWithoutTriggeringFullSetup];
}

- (void)_itemIsReadyToPlay:(id)a3
{
  if ([(AVPlayer *)self currentItem] == a3
    && [a3 status] == 1
    && self->_player->reevaluateBackgroundPlayback)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__AVPlayer__itemIsReadyToPlay___block_invoke;
    v5[3] = &unk_1E57B1E80;
    v5[4] = self;
    AVEnsureNotOnMainThread(v5);
    self->_player->reevaluateBackgroundPlayback = 0;
  }
}

- (id)_playbackCoordinatorWithoutTriggeringFullSetup
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__AVPlayer_PlaybackCoordination___playbackCoordinatorWithoutTriggeringFullSetup__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __19__AVPlayer_isMuted__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 395);
  return result;
}

- (void)setMultichannelAudioStrategy:(id)a3
{
  uint64_t v4 = [a3 copy];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke_2;
    v9[3] = &unk_1E57B3B20;
    void v9[5] = v10;
    v9[6] = v7;
    v9[4] = self;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v4 forKey:*MEMORY[0x1E4F342F0]];
  }
  [(AVPlayer *)self _canOverlapPlaybackConditionsChanged];
}

void *__61__AVPlayer_AVPlayerAudioSessionParticipant__setAudioSession___block_invoke(void *result)
{
  if (*(void *)(*(void *)(result[4] + 8) + 216) != result[5])
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;

    uint64_t result = (id)v1[5];
    *(void *)(*(void *)(v1[4] + 8) + 216) = result;
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 466) = *(unsigned char *)(result + 40);
  return result;
}

void *__51__AVPlayer_setAudiovisualBackgroundPlaybackPolicy___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(*(void *)(result[4] + 8) + 288) != result[6];
  *(void *)(*(void *)(result[4] + 8) + 288) = result[6];
  return result;
}

uint64_t __22__AVPlayer__addLayer___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = addObjectToArray(*(void **)(*(void *)(*(void *)(a1 + 32) + 8)+ 656), *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = addObjectToArray(*(void **)(*(void *)(*(void *)(a1 + 32) + 8)+ 672), *(void *)(a1 + 48));
  uint64_t result = addObjectToArray(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 664), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = result;
  if (*(void *)(a1 + 64))
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 680), "containsObject:");
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 64) _willManageSublayersAsSwappedLayers];
      if ((result & 1) == 0)
      {
        id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 680);
        uint64_t v4 = *(void *)(a1 + 64);
        return [v3 addObject:v4];
      }
    }
  }
  return result;
}

- (void)_updateConnectionToSecondScreen
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(AVPlayer *)self _avPlayerLayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4)
  {
    if (![(AVPlayer *)self _isConnectedToPhysicalSecondScreen]) {
      return;
    }
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  uint64_t v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 |= [*(id *)(*((void *)&v12 + 1) + 8 * i) _isConnectedToSecondScreen];
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  if ((v6 & 1) != [(AVPlayer *)self _isConnectedToPhysicalSecondScreen])
  {
LABEL_12:
    [(AVPlayer *)self _setCALayerDestinationIsTVOut:v6 & 1];
    [(AVPlayer *)self willChangeValueForKey:@"externalPlaybackActive"];
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__AVPlayer_AVPlayerSupportForMediaPlayer___updateConnectionToSecondScreen__block_invoke;
    void v10[3] = &unk_1E57B20E8;
    v10[4] = self;
    char v11 = v6 & 1;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
    [(AVPlayer *)self didChangeValueForKey:@"externalPlaybackActive"];
  }
}

- (BOOL)_isConnectedToPhysicalSecondScreen
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AVPlayer_AVPlayerSupportForMediaPlayer___isConnectedToPhysicalSecondScreen__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVPlayerStatus)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerStatus v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExternalPlaybackActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayer_isExternalPlaybackActive__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_hasAssociatedAVPlayerLayerInPIPMode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(AVPlayer *)self _avPlayerLayers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) isPIPModeEnabled])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)_isVideoPlaybackAllowedWhileInBackground
{
  return 0;
}

- (void)setAudioSession:(id)a3
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  if (!a3)
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"audioSession != nil"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AVPlayer_AVPlayerAudioSessionParticipant__setAudioSession___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v14 + 24)) {
    [(AVPlayer *)self _updateAudioSessionOnFigPlayer];
  }
  objc_msgSend(-[AVPlayer _interstitialPlayerIfCreated](self, "_interstitialPlayerIfCreated"), "setAudioSession:", a3);
  _Block_object_dispose(&v13, 8);
}

- (id)_updateAudioSessionOnFigPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayer__updateAudioSessionOnFigPlayer__block_invoke;
  v5[3] = &unk_1E57B2160;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(figConfigurationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addLayer:(id)a3
{
  uint64_t v5 = [a3 _videoLayer];
  uint64_t v6 = [a3 _closedCaptionLayer];
  uint64_t v7 = (void *)[a3 _subtitleLayer];
  uint64_t v8 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  layersQ = self->_player->layersQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__AVPlayer__addLayer___block_invoke;
  block[3] = &unk_1E57B3AD0;
  void block[4] = self;
  void block[5] = v5;
  void block[10] = &v22;
  block[11] = &v18;
  void block[6] = v6;
  void block[7] = v7;
  block[8] = a3;
  block[9] = &v26;
  dispatch_sync(layersQ, block);
  if (*((unsigned char *)v27 + 24))
  {
    [(AVPlayer *)self _updatePixelBufferAttributesForLayer:a3];
    if (v8) {
      CFRetain(v8);
    }
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __22__AVPlayer__addLayer___block_invoke_2;
    v16[3] = &unk_1E57B2270;
    v16[5] = a3;
    v16[6] = v8;
    v16[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v16);
  }
  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v11 = self->_player->stateDispatchQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __22__AVPlayer__addLayer___block_invoke_3;
    v15[3] = &unk_1E57B2228;
    v15[4] = self;
    v15[5] = v8;
    AVSerializeOnQueueAsyncIfNecessary(v11, v15);
  }
  if (v7)
  {
    captionRenderingStrategy = self->_player->captionRenderingStrategy;
    if (captionRenderingStrategy)
    {
      if ([(NSString *)captionRenderingStrategy isEqualToString:@"CoreTextSubtitleRenderer"])
      {
        uint64_t v13 = *MEMORY[0x1E4F33EB0];
      }
      else if ([(NSString *)self->_player->captionRenderingStrategy isEqualToString:@"CaptionDisplayService"])
      {
        uint64_t v13 = *MEMORY[0x1E4F33EA8];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    [v7 setCaptionRenderingStrategy:v13];
  }
  if (*((unsigned char *)v19 + 24)) {
    [v7 setPlayer:v8];
  }
  id v14 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v14)
  {
    objc_msgSend((id)objc_msgSend(a3, "_interstitialLayer"), "setPlayer:", v14);
    if ([(NSString *)[(AVPlayer *)self reasonForWaitingToPlay] isEqualToString:@"AVPlayerWaitingDuringInterstitialEventReason"])
    {
      [a3 _setShowInterstitialInstead:1];
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

void __104__AVPlayer__setRate_withVolumeRampDuration_playImmediately_rateChangeReason_affectsCoordinatedPlayback___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _interstitialPlayerIfCreated];
  uint64_t v3 = [*(id *)(a1 + 32) _copyInterstitialCoordinatorIfCreated];
  uint64_t v4 = (const void *)v3;
  if (v3) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v8 = v7 ? v7 : 0;
      long long v9 = *(uint64_t (**)(const void *))(v8 + 16);
      if (v9)
      {
        uint64_t v10 = v9(v4);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [*(id *)(a1 + 32) rate];
          float v13 = v12;
          uint64_t v14 = [v11 restrictions] & 4;
          if (v13 >= 1.0 && v14 != 0) {
            float v13 = 1.0;
          }
          CFRelease(v11);
          uint64_t v16 = *(unsigned __int8 *)(a1 + 68);
          uint64_t v17 = *(unsigned int *)(a1 + 64);
          uint64_t v18 = *(unsigned __int8 *)(a1 + 69);
          long long v19 = *(_OWORD *)(a1 + 40);
          uint64_t v20 = *(void *)(a1 + 56);
          objc_msgSend(v2, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v19, v16, v17, v18, COERCE_DOUBLE(__PAIR64__(DWORD1(v19), LODWORD(v13))));
        }
      }
    }
    goto LABEL_9;
  }
  if (v3) {
LABEL_9:
  }
    CFRelease(v4);
}

- (void)setAllowsExternalPlayback:(BOOL)allowsExternalPlayback
{
  BOOL v3 = allowsExternalPlayback;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlayer_setAllowsExternalPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = allowsExternalPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__AVPlayer_setAllowsExternalPlayback___block_invoke_2;
    v12[3] = &unk_1E57B2228;
    v12[4] = self;
    v12[5] = v7;
    dispatch_sync(figConfigurationQueue, v12);
    CFRelease(v7);
  }
  else
  {
    long long v9 = (uint64_t *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      long long v9 = (uint64_t *)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v10 = *v9;
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34178]];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v10 forKey:*MEMORY[0x1E4F34188]];
  }
  id v11 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v11) {
    [v11 setAllowsExternalPlayback:v3];
  }
}

- (id)_interstitialPlayerIfCreated
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerInterstitialSupport_Internal___interstitialPlayerIfCreated__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updatePixelBufferAttributesForLayer:(id)a3
{
  uint64_t v5 = [a3 _videoLayer];
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  [(AVPixelBufferAttributeMediator *)self->_player->pixelBufferAttributeMediator removeRequestedPixelBufferAttributesAttributesForKey:v5];
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__AVPlayer__updatePixelBufferAttributesForLayer___block_invoke;
  v8[3] = &unk_1E57B3AF8;
  v8[4] = a3;
  void v8[5] = self;
  v8[6] = v5;
  v8[7] = v6;
  dispatch_sync(figConfigurationQueue, v8);
  if (v6) {
    CFRelease(v6);
  }
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_2_426(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) _removeItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_clientRequestedPlaybackCoordinator
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_PlaybackCoordination___clientRequestedPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isPIPModePossible
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AVPlayer_AVPlayer_PIPSupport___isPIPModePossible__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_pendingFigPlayerProperties
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayer__pendingFigPlayerProperties__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_isAirPlayVideoActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayer__isAirPlayVideoActive__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_attachClosedCaptionLayersToFigPlayer
{
  char v3 = [(AVPlayer *)self _copyFigPlayer];
  id v4 = [(AVPlayer *)self _closedCaptionLayers];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, void, id))(v7 + 56);
  if (v8) {
    v8(FigBaseObject, *MEMORY[0x1E4F341F0], v4);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (void)_applyLinkedListOfItemsToFigPlayerUsingBlock:(id)a3
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  uint64_t v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  long long v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  uint64_t v12 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVPlayer__applyLinkedListOfItemsToFigPlayerUsingBlock___block_invoke;
  block[3] = &unk_1E57B3888;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v8[5], v14[5]);

  self->_player->itemsInFigPlayQueue = (NSArray *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __63__AVPlayer_AVPlayerPIPSupport__backgroundPIPAuthorizationToken__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 608) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __47__AVPlayer_FigVideoTargetSupport__videoTargets__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 568);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __76__AVPlayer_AVPlayerAudioSessionParticipant___setParticipatesInAudioSession___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 352) = *(unsigned char *)(result + 40);
  return result;
}

id __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setWeakReferenceToPrimaryPlayer___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 256) = result;
  return result;
}

void __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  id v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  int v3 = [*(id *)(a1 + 32) preventsDisplaySleepDuringVideoPlayback];
  id v4 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v4 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  if (v2)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
    if (v11) {
      v11(FigBaseObject, *MEMORY[0x1E4F34378], v5);
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *MEMORY[0x1E4F34378];
    [v9 _setPendingFigPlayerProperty:v5 forKey:v10];
  }
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__AVPlayer_AVPlayerVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDisplayingClosedCaptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVPlayer_isDisplayingClosedCaptions__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setNeroVideoGravityOnFigPlayer
{
  char v3 = [(AVPlayer *)self _copyFigPlayer];
  if (v3)
  {
    id v4 = v3;
    if (_setNeroVideoGravityOnFigPlayer_sCreatesAVLayerVideoGravityToFigGravityOnce != -1) {
      dispatch_once(&_setNeroVideoGravityOnFigPlayer_sCreatesAVLayerVideoGravityToFigGravityOnce, &__block_literal_global_556);
    }
    if (objc_msgSend((id)_setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity, "objectForKey:", -[AVPlayer _externalPlaybackVideoGravity](self, "_externalPlaybackVideoGravity")))
    {
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      int v8 = 0;
      figConfigurationQueue = self->_player->figConfigurationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke_2;
      block[3] = &unk_1E57B3A60;
      void block[4] = self;
      void block[5] = v7;
      void block[6] = v4;
      dispatch_sync(figConfigurationQueue, block);
      _Block_object_dispose(v7, 8);
    }
    CFRelease(v4);
  }
}

uint64_t __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)_setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "_externalPlaybackVideoGravity"));
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34300], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_externalPlaybackVideoGravity
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayer__externalPlaybackVideoGravity__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)preventsDisplaySleepDuringVideoPlayback
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v8 = preventsDisplaySleepDuringVideoPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__AVPlayer_AVPlayerVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v6);
}

+ (void)registerForScreenConnectionChanges
{
  CMNotificationCenterGetDefaultLocalCenter();
  objc_opt_class();
  FPSupport_GetDisplayVideoRangeNotificationSingleton();
  CMNotificationCenterAddListener();
}

- (AVLoggingIdentifier)loggingIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayer_AVPlayerLoggingIdentifier__loggingIdentifier__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (AVLoggingIdentifier *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setRateDidChangeNotificationIncludesExtendedDiagnosticPayload:(BOOL)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AVPlayer__setRateDidChangeNotificationIncludesExtendedDiagnosticPayload___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

- (void)_attachFigPlayerToSubtitleLayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPlayer *)self _copyFigPlayer];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(AVPlayer *)self _subtitleLayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setPlayer:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (id)_subtitleLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVPlayer__subtitleLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_linkAndSyncAudioSessionWithInterstitialPlayer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__AVPlayer_AVPlayerInterstitialSupport_Internal___linkAndSyncAudioSessionWithInterstitialPlayer___block_invoke;
  v19[3] = &unk_1E57B2098;
  v19[4] = self;
  v19[5] = a3;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v19);
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(AVPlayer *)self videoTargets];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [(AVPlayer *)self _interstitialVideoTargetForPrimaryVideoTarget:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v12) {
              uint64_t v13 = v12;
            }
            else {
              uint64_t v13 = 0;
            }
            uint64_t v14 = *(void (**)(OpaqueFigVideoTarget *, void))(v13 + 80);
            if (v14) {
              v14(v11, 0);
            }
            [a3 addVideoTarget:v11];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }
  }
  [(AVPlayer *)self syncAudioSessionToInterstitialPlayer:a3];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerInterstitialPlayerDidChangeNotification", self, 0);
}

- (NSArray)videoTargets
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayer_FigVideoTargetSupport__videoTargets__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__AVPlayer__updateAudioSessionOnFigPlayer__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _copyFigPlayer];
  if (v2)
  {
    id v3 = (const void *)v2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[*(id *)(a1 + 32) audioSession];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v4)
    {
      [v4 opaqueSessionID];
      uint64_t SInt32 = FigCFNumberCreateSInt32();
      if (SInt32)
      {
        uint64_t v6 = (const void *)SInt32;
        uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v11 = *(void (**)(uint64_t, void, const void *))(v9 + 56);
        if (v11) {
          v11(FigBaseObject, *MEMORY[0x1E4F341B0], v6);
        }
        if (dword_1EB2D3AA0)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CFRelease(v6);
      }
      else
      {
        long long v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    CFRelease(v3);
  }
}

- (void)syncAudioSessionToInterstitialPlayer:(id)a3
{
  if (![(AVPlayer *)self audioSession]) {
    -[AVPlayer setAudioSession:](self, "setAudioSession:", [MEMORY[0x1E4F153E0] sharedInstance]);
  }
  uint64_t v5 = [(AVPlayer *)self audioSession];
  [a3 setAudioSession:v5];
}

- (void)_createAndConfigureFigPlayerWithType:(int64_t)a3 completionHandler:(id)a4
{
  CFTypeRef v29 = 0;
  id v7 = +[AVPlayer _makePlayerName];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F340A0], [(AVPlayer *)self _nameForLogging]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F340B0], v7);
  uint64_t v9 = (const void *)*MEMORY[0x1E4F340B8];
  BOOL v10 = [(AVPlayer *)self _preservesAudioSessionSampleRate];
  uint64_t v11 = (const void *)*MEMORY[0x1E4F1CFD0];
  uint64_t v12 = (const void *)*MEMORY[0x1E4F1CFC8];
  if (v10) {
    uint64_t v13 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v13 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(Mutable, v9, v13);
  uint64_t v14 = (const void *)*MEMORY[0x1E4F340A8];
  if ([(AVPlayer *)self _participatesInAudioSession]) {
    long long v15 = v11;
  }
  else {
    long long v15 = v12;
  }
  CFDictionarySetValue(Mutable, v14, v15);
  long long v16 = (const void *)*MEMORY[0x1E4F34098];
  id v17 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F34098]];
  if (v17)
  {
    CFDictionarySetValue(Mutable, v16, v17);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F34080], v12);
  }
  long long v18 = (const void *)*MEMORY[0x1E4F340C8];
  if ([(AVPlayer *)self _supportsAdvanceTimeForOverlappedPlayback]) {
    long long v19 = v11;
  }
  else {
    long long v19 = v12;
  }
  CFDictionarySetValue(Mutable, v18, v19);
  uint64_t v20 = (const void *)*MEMORY[0x1E4F34090];
  if ([(AVPlayer *)self supportsSpeedRamps]) {
    uint64_t v21 = v11;
  }
  else {
    uint64_t v21 = v12;
  }
  CFDictionarySetValue(Mutable, v20, v21);
  uint64_t v22 = [(AVPlayer *)self audioSession];
  uint64_t v23 = v22;
  if (v22)
  {
    [(AVAudioSession *)v22 opaqueSessionID];
    FigCFDictionarySetInt32();
  }
  if ([(AVPlayer *)self shouldWaitForVideoTarget]) {
    uint64_t v24 = v11;
  }
  else {
    uint64_t v24 = v12;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F340C0], v24);
  int v25 = [(id)objc_opt_class() _createFigPlayerWithType:a3 options:Mutable player:&v29];
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v29)
  {
    CFRetain(v29);
    CFTypeRef v26 = v29;
  }
  else
  {
    CFTypeRef v26 = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke;
  v27[3] = &unk_1E57B3838;
  v27[7] = a4;
  v27[8] = v26;
  int v28 = v25;
  v27[4] = self;
  v27[5] = v7;
  v27[6] = v23;
  AVEnsureNotOnMainThread(v27);
  if (v29) {
    CFRelease(v29);
  }
}

- (AVAudioSession)audioSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  BOOL v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayer_AVPlayerAudioSessionParticipant__audioSession__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (AVAudioSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldWaitForVideoTarget
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayer_FigVideoTargetSupport__shouldWaitForVideoTarget__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)supportsSpeedRamps
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayer_AVPlayerSpeedRamp__supportsSpeedRamps__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_preservesAudioSessionSampleRate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AVPlayer_AVPlayerAudioSessionParticipant___preservesAudioSessionSampleRate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_participatesInAudioSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerAudioSessionParticipant___participatesInAudioSession__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_supportsAdvanceTimeForOverlappedPlayback
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerAdvanceWithOverlap___supportsAdvanceTimeForOverlappedPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)_makePlayerName
{
  uint64_t v2 = getpid();
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.avfoundation.AVPlayer.%d-%d", v2, FigAtomicIncrement32());
}

+ (int)_createFigPlayerWithType:(int64_t)a3 options:(__CFDictionary *)a4 player:(OpaqueFigPlayer *)a5
{
  CFPreferencesGetAppBooleanValue(@"surrogate_player_disabled", @"com.apple.avfoundation", 0);
  CFPreferencesGetAppBooleanValue(@"coordinator_player_disabled", @"com.apple.avfoundation", 0);
  FigSharedPlayerGetDefaultEngineTopology();
  int v6 = FigSharedPlayerCreateWithOptions();
  if (a5) {
    *a5 = 0;
  }
  return v6;
}

__n128 __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke(uint64_t a1)
{
  v71[4] = *MEMORY[0x1E4F143B8];
  uint64_t v69 = 0;
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2 || *(_DWORD *)(a1 + 72))
  {
    uint64_t v3 = 0;
    LOBYTE(v4) = 0;
    BOOL v5 = 0;
    BOOL v6 = 0;
    BOOL v7 = 0;
    int v8 = 0;
    goto LABEL_66;
  }
  CFBooleanRef BOOLean = 0;
  uint64_t v9 = *MEMORY[0x1E4F1CF80];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v12 + 48);
  if (v13)
  {
    int v14 = v13(FigBaseObject, *MEMORY[0x1E4F34298], v9, &BOOLean);
    CFBooleanRef v15 = BOOLean;
    if (v14) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = BOOLean == 0;
    }
    if (v16)
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = CFBooleanGetValue(BOOLean) != 0;
      CFBooleanRef v15 = BOOLean;
    }
    if (v15)
    {
      CFRelease(v15);
      CFBooleanRef BOOLean = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  CFBooleanRef v67 = 0;
  uint64_t v17 = FigPlayerGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v19 + 48);
  if (v20)
  {
    int v21 = v20(v17, *MEMORY[0x1E4F342A0], v9, &v67);
    BOOL v6 = 0;
    CFBooleanRef v22 = v67;
    if (v21 || !v67) {
      goto LABEL_26;
    }
    BOOL v6 = CFBooleanGetValue(v67) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  CFBooleanRef v22 = v67;
LABEL_26:
  if (v22)
  {
    CFRelease(v22);
    CFBooleanRef v67 = 0;
  }
  if (v4)
  {
    BOOL v23 = 1;
  }
  else
  {
    CFBooleanRef v66 = 0;
    uint64_t v24 = FigPlayerGetFigBaseObject();
    uint64_t v25 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v25) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    uint64_t v27 = *(uint64_t (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v26 + 48);
    if (v27)
    {
      int v28 = v27(v24, *MEMORY[0x1E4F342A8], v9, &v66);
      BOOL v23 = 0;
      CFBooleanRef v29 = v66;
      if (!v28 && v66)
      {
        BOOL v23 = CFBooleanGetValue(v66) != 0;
        CFBooleanRef v29 = v66;
      }
      if (v29) {
        CFRelease(v29);
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  uint64_t v30 = FigPlayerGetFigBaseObject();
  uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v31) {
    uint64_t v32 = v31;
  }
  else {
    uint64_t v32 = 0;
  }
  unsigned int v33 = *(void (**)(uint64_t, void, uint64_t, uint64_t *))(v32 + 48);
  if (v33) {
    v33(v30, *MEMORY[0x1E4F342C0], v9, &v69);
  }
  CFBooleanRef v66 = 0;
  uint64_t v34 = FigPlayerGetFigBaseObject();
  uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v35) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = 0;
  }
  char v37 = *(uint64_t (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v36 + 48);
  if (v37)
  {
    int v38 = v37(v34, *MEMORY[0x1E4F34328], v9, &v66);
    CFBooleanRef v39 = v66;
    if (v38 || !v66)
    {
      BOOL v7 = 0;
      if (v38 == -12784) {
        int v8 = 0;
      }
      else {
        int v8 = v38;
      }
    }
    else
    {
      int v8 = 0;
      BOOL v7 = CFBooleanGetValue(v66) != 0;
      CFBooleanRef v39 = v66;
    }
    if (v39) {
      CFRelease(v39);
    }
  }
  else
  {
    BOOL v7 = 0;
    int v8 = -12782;
  }
  uint64_t v40 = *MEMORY[0x1E4F1CFD0];
  uint64_t v41 = *MEMORY[0x1E4F34210];
  v70[0] = *MEMORY[0x1E4F34160];
  v70[1] = v41;
  v71[0] = v40;
  v71[1] = v40;
  uint64_t v42 = *MEMORY[0x1E4F34250];
  v70[2] = *MEMORY[0x1E4F34270];
  v70[3] = v42;
  v71[2] = v40;
  v71[3] = v40;
  v43 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v71, v70, 4), "mutableCopy");
  v44 = v43;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 88)) {
    [v43 setObject:v40 forKey:*MEMORY[0x1E4F34290]];
  }
  uint64_t v45 = *(void *)(a1 + 64);
  uint64_t v46 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v46) {
    uint64_t v47 = v46;
  }
  else {
    uint64_t v47 = 0;
  }
  v48 = *(void (**)(uint64_t, void *, void))(v47 + 112);
  if (v48) {
    v48(v45, v44, 0);
  }

  BOOL v5 = v23;
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = v69;
LABEL_66:
  v55[0] = MEMORY[0x1E4F143A8];
  long long v49 = *(_OWORD *)(a1 + 32);
  long long v50 = *(_OWORD *)(a1 + 48);
  uint64_t v51 = *(void *)(*(void *)(a1 + 32) + 8);
  v55[1] = 3221225472;
  int v52 = *(_DWORD *)(a1 + 72);
  v53 = *(NSObject **)(v51 + 32);
  v55[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2;
  v55[3] = &unk_1E57B3810;
  int v60 = v8;
  int v61 = v52;
  BOOL v62 = v4;
  BOOL v63 = v5;
  BOOL v64 = v6;
  uint64_t v58 = v2;
  uint64_t v59 = v3;
  BOOL v65 = v7;
  long long v56 = v49;
  long long v57 = v50;
  AVSerializeOnQueueAsyncIfNecessary(v53, v55);
  return result;
}

- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  BOOL v5 = block;
  if (!block)
  {
    if (dyld_program_sdk_at_least())
    {
      uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"block != nil"), 0 reason userInfo];
      objc_exception_throw(v17);
    }
    BOOL v5 = &__block_literal_global_546;
  }
  CFBooleanRef v15 = [[AVOccasionalTimebaseObserver alloc] initWithTimebase:self->_player->proxyTimebase times:times queue:queue block:v5];
  return v15;
}

- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  BOOL v5 = block;
  if (!block)
  {
    if (dyld_program_sdk_at_least())
    {
      uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"block != nil"), 0 reason userInfo];
      objc_exception_throw(v18);
    }
    BOOL v5 = &__block_literal_global_543;
  }
  CFBooleanRef v15 = [AVPeriodicTimebaseObserver alloc];
  proxyTimebase = self->_player->proxyTimebase;
  long long v19 = *(_OWORD *)&interval->value;
  CMTimeEpoch epoch = interval->epoch;
  return [(AVPeriodicTimebaseObserver *)v15 initWithTimebase:proxyTimebase interval:&v19 queue:queue block:v5];
}

void __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  int v3 = [*(id *)(a1 + 32) preventsAutomaticBackgroundingDuringVideoPlayback];
  BOOL v4 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    BOOL v4 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  if (v2)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
    if (v11) {
      v11(FigBaseObject, *MEMORY[0x1E4F34370], v5);
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *MEMORY[0x1E4F34370];
    [v9 _setPendingFigPlayerProperty:v5 forKey:v10];
  }
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__AVPlayer_AVPlayerAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_noteNewNonForcedSubtitleDisplayEnabledForPlayerItem:(id)a3
{
  currentItemPropertyUpdateQueue = self->_player->currentItemPropertyUpdateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__AVPlayer__noteNewNonForcedSubtitleDisplayEnabledForPlayerItem___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(currentItemPropertyUpdateQueue, v4);
}

- (void)_setFigPlaybackItemToMakeCurrent:(OpaqueFigPlaybackItem *)a3
{
  self->_player->figPlaybackItemToIdentifyNextCurrentItem = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
    FigKTraceInit();
    if (dyld_program_sdk_at_least())
    {
      sWaitsToMinimizeStallingByDefault = 1;
      sSetRateAtHostTimeThrowsWhenWaitingToMinimizeStalling = 1;
    }
    [a1 registerForScreenConnectionChanges];
  }
}

- (void)play
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    [(AVPlayer *)self defaultRate];
    float v4 = *(float *)&v3;
  }
  else
  {
    float v4 = 1.0;
    if (dword_1EB2D3AA0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  *(float *)&double v3 = v4;
  -[AVPlayer setRate:](self, "setRate:", v3, v6, v7);
}

- (float)defaultRate
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1065353216;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_defaultRate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVPlayer__setNeroVideoGravityOnFigPlayer__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v0, "initWithObjectsAndKeys:", *MEMORY[0x1E4F33FC0], @"AVLayerVideoGravityResize", *MEMORY[0x1E4F33FC8], @"AVLayerVideoGravityResizeAspect", *MEMORY[0x1E4F33FD0], @"AVLayerVideoGravityResizeAspectFill", 0);
  _setNeroVideoGravityOnFigPlayer_sAVLayerVideoGravityToFigGravity = result;
  return result;
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v8 = preventsAutomaticBackgroundingDuringVideoPlayback;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __104__AVPlayer_AVPlayerAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v6);
}

- (NSString)backgroundPIPAuthorizationToken
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayer_AVPlayerPIPSupport__backgroundPIPAuthorizationToken__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addFPListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  id v4 = [(AVPlayer *)self _weakReference];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(AVPlayer *)self _fpNotificationNames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 addListenerWithWeakReference:v4 callback:avplayer_fpNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_player->figPlayer flags:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_fpNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F34048], *MEMORY[0x1E4F34078], *MEMORY[0x1E4F34018], *MEMORY[0x1E4F33FE0], *MEMORY[0x1E4F34070], *MEMORY[0x1E4F34050], *MEMORY[0x1E4F34008], *MEMORY[0x1E4F34058], *MEMORY[0x1E4F33FF8], *MEMORY[0x1E4F34000], *MEMORY[0x1E4F34020], *MEMORY[0x1E4F34038], *MEMORY[0x1E4F34040], *MEMORY[0x1E4F33FF0], *MEMORY[0x1E4F33FE8], *MEMORY[0x1E4F34028], *MEMORY[0x1E4F34060],
               *MEMORY[0x1E4F34030],
               *MEMORY[0x1E4F33FD8],
               *MEMORY[0x1E4F34010],
               *MEMORY[0x1E4F21770],
               *MEMORY[0x1E4F34068],
               0);
}

uint64_t __97__AVPlayer_AVPlayerInterstitialSupport_Internal___linkAndSyncAudioSessionWithInterstitialPlayer___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_avPlayerLayers", 0);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_interstitialLayer"), "setPlayer:", *(void *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)setMuted:(BOOL)muted
{
  BOOL v3 = muted;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__AVPlayer_setMuted___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = muted;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    long long v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __21__AVPlayer_setMuted___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    long long v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      long long v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F342F8]];
  }
}

- (void)_setSuppressesAudioRendering:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__AVPlayer__setSuppressesAudioRendering___block_invoke;
  v13[3] = &unk_1E57B20E8;
  v13[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v13);
  uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v6 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v7 = *v6;
  uint64_t v8 = *MEMORY[0x1E4F343C8];
  if (self->_player->figPlayer)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    int v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 56);
    if (v12) {
      v12(FigBaseObject, v8, v7);
    }
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v7 forKey:*MEMORY[0x1E4F343C8]];
  }
}

- (void)_attachVideoLayersToFigPlayer
{
  BOOL v3 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(uint64_t, void, void))(v6 + 56);
  if (v7 && !v7(FigBaseObject, *MEMORY[0x1E4F343A8], *MEMORY[0x1E4F1CFC8]))
  {
    uint64_t v8 = FigPlayerGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v10 = v9 ? v9 : 0;
    uint64_t v11 = *(unsigned int (**)(uint64_t, void, void))(v10 + 56);
    if (v11 && !v11(v8, *MEMORY[0x1E4F34198], *MEMORY[0x1E4F1CFD0]))
    {
      CFArrayRef v12 = [(AVPlayer *)self _videoLayers];
      uint64_t v13 = FigPlayerGetFigBaseObject();
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v15 = v14 ? v14 : 0;
      BOOL v16 = *(unsigned int (**)(uint64_t, void, const __CFArray *))(v15 + 56);
      if (v16)
      {
        if (!v16(v13, *MEMORY[0x1E4F34408], v12))
        {
          [(AVPlayer *)self _evaluateDisplaySizeOfAllAttachedLayers];
          BOOL v17 = v12 && CFArrayGetCount(v12) > 0;
          self->_player->videoLayersAreAttached = v17;
        }
      }
    }
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

- (id)_videoLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__AVPlayer__videoLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setSupportsAdvanceTimeForOverlappedPlayback:(BOOL)a3
{
  player = self->_player;
  if (!player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set supportsAdvanceTimeForOverlappedPlayback after the AVPlayer has begun preparing for playback." userInfo:0]);
  }
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__AVPlayer_AVPlayerAdvanceWithOverlap___setSupportsAdvanceTimeForOverlappedPlayback___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

- (void)_setParticipatesInAudioSession:(BOOL)a3
{
  player = self->_player;
  if (!player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set participatesInAudioSession after the AVPlayer has begun preparing for playback." userInfo:0]);
  }
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AVPlayer_AVPlayerAudioSessionParticipant___setParticipatesInAudioSession___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  BOOL v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34238]];
  }
}

+ (AVPlayer)playerWithURL:(NSURL *)URL
{
  BOOL v3 = (void *)[objc_alloc((Class)a1) initWithURL:URL];
  return (AVPlayer *)v3;
}

+ (AVPlayer)playerWithPlayerItem:(AVPlayerItem *)item
{
  BOOL v3 = (void *)[objc_alloc((Class)a1) initWithPlayerItem:item];
  return (AVPlayer *)v3;
}

- (AVPlayer)initWithPlayerItem:(AVPlayerItem *)item
{
  uint64_t v5 = [(AVPlayer *)self init];
  BOOL v6 = v5;
  if (item && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = v6;
      BOOL v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"Item must be an instance of AVPlayerItem.", v9, v10, v11, v12, v13, v15[0]), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    [(AVPlayerItem *)item _attachToPlayer:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = (uint64_t)__31__AVPlayer_initWithPlayerItem___block_invoke_2;
    v15[3] = (uint64_t)&unk_1E57B2098;
    v15[4] = (uint64_t)v6;
    v15[5] = (uint64_t)item;
    [(AVPlayer *)v6 _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:&__block_literal_global_5 modificationBlock:v15 error:0];
  }
  return v6;
}

uint64_t __31__AVPlayer_initWithPlayerItem___block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
  return 1;
}

uint64_t __31__AVPlayer_initWithPlayerItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", *(void *)(a1 + 40), 0);
}

- (AVPlayer)initWithURL:(NSURL *)URL
{
  uint64_t v4 = +[AVPlayerItem playerItemWithURL:URL];
  return [(AVPlayer *)self initWithPlayerItem:v4];
}

uint64_t __16__AVPlayer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didFinishSuspension:a2];
}

uint64_t __16__AVPlayer_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _didEnterBackground:a2];
}

uint64_t __16__AVPlayer_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _willEnterForeground:a2];
}

- (AVPlayer)initWithDispatchQueue:(id)a3
{
  uint64_t v4 = [(AVPlayer *)self init];
  uint64_t v5 = v4;
  if (a3 && v4)
  {
    player = v4->_player;
    stateDispatchQueue = player->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      player = v5->_player;
    }
    player->stateDispatchQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)v5->_player->stateDispatchQueue);
  }
  return v5;
}

- (AVPlayer)initWithFigPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t v4 = [(AVPlayer *)self init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_player->figPlayer = (OpaqueFigPlayer *)CFRetain(a3);
      v5->_player->needsToCreateFigPlayer = 0;
      v5->_player->IOwnTheFigPlayer = 0;
      v5->_player->status = 1;
      [(AVPlayer *)v5 _addFPListeners];
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

+ (AVPlayer)playerWithFigPlayer:(OpaqueFigPlayer *)a3
{
  BOOL v3 = (void *)[objc_alloc((Class)a1) initWithFigPlayer:a3];
  return (AVPlayer *)v3;
}

- (void)dealloc
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  player = self->_player;
  if (player)
  {
    player->fullyInitializedAndNotDeallocating = 0;
    uint64_t v4 = self->_player;
    if (v4->didFinishSuspensionNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->didFinishSuspensionNotificationToken);

      uint64_t v4 = self->_player;
    }
    if (v4->didEnterBackgroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->didEnterBackgroundNotificationToken);

      uint64_t v4 = self->_player;
    }
    if (v4->willEnterForegroundNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->willEnterForegroundNotificationToken);

      uint64_t v4 = self->_player;
    }
    if (v4->layerForegroundingChangeToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->layerForegroundingChangeToken);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self->_player->IAPDCallbackToken, @"com.apple.iapd.notify.extendedMode", 0);
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_player->IAPDCallbackToken);
    [(AVPlayer *)self _removeFPListeners];
    [(AVPlayer *)self _removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:self->_player->currentItem];
    [(AVPlayer *)self _removeAllLayers];
    [(AVPlayer *)self _removeListenersFromInterstitialCoordinator:self->_player->interstitialEventCoordinator];
    BOOL v6 = self->_player;
    if (v6->figPlayer)
    {
      if (v6->IOwnTheFigPlayer)
      {
        uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
        if (FigBaseObject)
        {
          uint64_t v8 = FigBaseObject;
          uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v10 = v9 ? v9 : 0;
          uint64_t v11 = *(void (**)(uint64_t))(v10 + 24);
          if (v11) {
            v11(v8);
          }
        }
      }
    }

    uint64_t v12 = self->_player;
    videoTargetsForInterstitialPlayer = v12->videoTargetsForInterstitialPlayer;
    if (videoTargetsForInterstitialPlayer)
    {
      CFRelease(videoTargetsForInterstitialPlayer);
      uint64_t v12 = self->_player;
    }

    BOOL v14 = self->_player;
    proxyTimebase = v14->proxyTimebase;
    if (proxyTimebase)
    {
      CFRelease(proxyTimebase);
      BOOL v14 = self->_player;
    }
    if (v14->currentItemSuppressesVideoLayersNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->currentItemSuppressesVideoLayersNotificationToken);

      BOOL v14 = self->_player;
    }
    if (v14->currentItemPreferredPixelBufferAttributesNotificationToken)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->currentItemPreferredPixelBufferAttributesNotificationToken);

      BOOL v14 = self->_player;
    }

    BOOL v16 = self->_player;
    layersQ = v16->layersQ;
    if (layersQ)
    {
      dispatch_release(layersQ);
      BOOL v16 = self->_player;
    }

    if (dword_1EB2D3AA0)
    {
      int v34 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v19 = self->_player;
    figPlayer = v19->figPlayer;
    if (figPlayer)
    {
      CFRelease(figPlayer);
      long long v19 = self->_player;
    }
    figSourceClock = v19->figSourceClock;
    if (figSourceClock)
    {
      CFRelease(figSourceClock);
      long long v19 = self->_player;
    }

    if (self->_player->prerollCompletionHandler) {
      NSLog(&cfstr_AvplayerPDeall.isa, self);
    }
    FigSimpleMutexDestroy();
    CFBooleanRef v22 = self->_player;
    stateDispatchQueue = v22->stateDispatchQueue;
    if (stateDispatchQueue)
    {
      dispatch_release(stateDispatchQueue);
      CFBooleanRef v22 = self->_player;
    }
    figConfigurationQueue = v22->figConfigurationQueue;
    if (figConfigurationQueue)
    {
      dispatch_release(figConfigurationQueue);
      CFBooleanRef v22 = self->_player;
    }
    layerInteractionQueue = v22->layerInteractionQueue;
    if (layerInteractionQueue)
    {
      dispatch_release(layerInteractionQueue);
      CFBooleanRef v22 = self->_player;
    }
    ivarAccessQueue = v22->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      CFBooleanRef v22 = self->_player;
    }
    currentItemPropertyUpdateQueue = v22->currentItemPropertyUpdateQueue;
    if (currentItemPropertyUpdateQueue)
    {
      dispatch_release(currentItemPropertyUpdateQueue);
      CFBooleanRef v22 = self->_player;
    }
    configurationQueue = v22->configurationQueue;
    if (configurationQueue)
    {
      dispatch_release(configurationQueue);
      CFBooleanRef v22 = self->_player;
    }

    CFBooleanRef v29 = self->_player;
    interstitialEventCoordinator = v29->interstitialEventCoordinator;
    if (interstitialEventCoordinator)
    {
      CFRelease(interstitialEventCoordinator);
      CFBooleanRef v29 = self->_player;
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)AVPlayer;
  [(AVPlayer *)&v32 dealloc];
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"masterClock"])
  {
    return [(AVPlayer *)self masterClock];
  }
  else if ([a3 isEqualToString:@"sourceClock"])
  {
    return [(AVPlayer *)self sourceClock];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVPlayer;
    return [(AVPlayer *)&v6 valueForUndefinedKey:a3];
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 isEqualToString:@"masterClock"])
  {
    [(AVPlayer *)self setMasterClock:a3];
  }
  else if ([a4 isEqualToString:@"sourceClock"])
  {
    [(AVPlayer *)self setSourceClock:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayer;
    [(AVPlayer *)&v7 setValue:a3 forUndefinedKey:a4];
  }
}

- (NSError)error
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __17__AVPlayer_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  BOOL v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __17__AVPlayer_error__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 168);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_changeStatusToFailedWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  int v12 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  [(AVPlayer *)self willChangeValueForKey:@"error"];
  [(AVPlayer *)self willChangeValueForKey:@"rate"];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer__changeStatusToFailedWithError___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = &v13;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v14 + 24)) {
    objc_msgSend(-[AVPlayer _items](self, "_items"), "makeObjectsPerformSelector:withObject:", sel__playerChangeStatusToFailedWithError_, a3);
  }
  [(AVPlayer *)self didChangeValueForKey:@"rate", v8, v9];
  id v7 = [(AVPlayer *)self _rateDidChangeNotificationPayloadForAVFRateChangeReason:@"AVPlayerRateDidChangeReasonStatusChanged" reasonIsExtendedDiagnostic:1 rateChangeIdentifier:0 rateChangeOriginator:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerRateDidChangeNotification", self, v7);
  [(AVPlayer *)self didChangeValueForKey:@"error"];
  _Block_object_dispose(&v13, 8);
}

uint64_t __43__AVPlayer__changeStatusToFailedWithError___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v1 + 160) != 2)
  {
    uint64_t v2 = result;
    *(void *)(v1 + 160) = 2;
    id result = [*(id *)(result + 40) copy];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 168) = result;
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

__n128 __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_2(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 504) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 520) = *(unsigned char *)(a1 + 56);
  return result;
}

__n128 __42__AVPlayer__synchronizeWithNewCurrentItem__block_invoke_3(uint64_t a1)
{
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 504) = *MEMORY[0x1E4F1DB30];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 520) = 0;
  return result;
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_4;
  v3[3] = &unk_1E57B3680;
  v3[4] = v1;
  return [v1 _applyPlayQueueChangesToFigPlayerWithCompletionHandler:v3];
}

uint64_t __109__AVPlayer__runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock_modificationBlock_error___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) _removeItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_cachedNonForcedSubtitleDisplayEnabledForCurrentItem
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayer__cachedNonForcedSubtitleDisplayEnabledForCurrentItem__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__AVPlayer__cachedNonForcedSubtitleDisplayEnabledForCurrentItem__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 520);
  return result;
}

uint64_t __51__AVPlayer__startObservingPropertiesOfCurrentItem___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)[*(id *)(a1 + 32) referencedObject];
  return [v1 _updateCurrentItemPreferredPixelBufferAttributesAndVideoLayerSuppression];
}

- (void)_removePropertyObserversOfCurrentItemCalledOnStateDispatchQueueChecked:(id)a3
{
  self->_player->currentItemSuppressesVideoLayersNotificationToken = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_player->currentItemPreferredPixelBufferAttributesNotificationToken);

  self->_player->currentItemPreferredPixelBufferAttributesNotificationToken = 0;
}

void __31__AVPlayer__itemIsReadyToPlay___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_itemOkayToPlayWhileTransitioningToBackground:", objc_msgSend(*(id *)(a1 + 32), "currentItem"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(v3 + 8) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVPlayer__itemIsReadyToPlay___block_invoke_2;
  v5[3] = &unk_1E57B2228;
  v5[4] = v3;
  void v5[5] = v2;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __31__AVPlayer__itemIsReadyToPlay___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground];
  if ((result & 1) == 0 && !*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 pause];
  }
  return result;
}

- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  v27[16] = *(id *)MEMORY[0x1E4F143B8];
  if (dword_1EB2D3AA0)
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = (void *)[(NSArray *)self->_player->itemsInFigPlayQueue copy];
  uint64_t v7 = v6;
  v27[0] = (id)MEMORY[0x1E4F1CBF0];
  if (!a3 || !AVPlayerFindItemMatchingFigPlaybackItem(v6, a3, v27))
  {
    uint64_t v8 = [(AVPlayer *)self _copyFigPlayer];
    CFTypeRef cf = 0;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    long long v11 = *(void (**)(OpaqueFigPlayer *, void, CFTypeRef *))(v10 + 32);
    if (v11) {
      v11(v8, 0, &cf);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (cf)
    {
      if (!AVPlayerFindItemMatchingFigPlaybackItem(v7, cf, v27)) {
        v27[0] = v7;
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      v27[0] = v7;
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v27[0];
  uint64_t v13 = [v27[0] countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AVPlayer *)self _removeItem:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_advanceToNextItem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3AA0)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__AVPlayer__advanceToNextItem__block_invoke;
  void v7[3] = &unk_1E57B3720;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__AVPlayer__advanceToNextItem__block_invoke_2;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  -[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v7, v6, 0, v4, v5);
}

uint64_t __30__AVPlayer__advanceToNextItem__block_invoke(uint64_t a1, BOOL *a2)
{
  *a2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 176) != 0;
  return 1;
}

uint64_t __30__AVPlayer__advanceToNextItem__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 176);
  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", v2);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Item must be a non-nil instance of AVPlayerItem.", v8, v9, v10, v11, v12, v15), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  [a3 _attachToPlayer:self];
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57B32E8;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v16);
}

void __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  if (*(void *)(v3 + 728))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _makeReadyForEnqueueingWithCompletionHandler:v5];
  }
  else
  {
    uint64_t v6 = *(NSObject **)(v3 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E57B3770;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    void block[5] = v2;
    void block[6] = v8;
    void block[4] = v7;
    av_readwrite_dispatch_queue_write(v6, block);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v9 + 744))
    {
      *(unsigned char *)(v9 + 744) = 0;
      uint64_t v10 = (void *)[*(id *)(a1 + 40) asset];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_4;
      void v11[3] = &unk_1E57B3798;
      v11[4] = *(void *)(a1 + 32);
      AVPlayerGetFigPlayerTypeForAsset(v10, (uint64_t)v11);
    }
  }
}

void __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_2(void *a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_3;
  v4[3] = &unk_1E57B3748;
  uint64_t v2 = a1[6];
  v4[4] = a1[4];
  void v4[5] = v2;
  uint64_t v3 = (void *)[v4 copy];
  [*(id *)(*(void *)(a1[5] + 8) + 296) addObject:v3];
}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makeReadyForEnqueueingWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_5;
  v4[3] = &unk_1E57B3680;
  v4[4] = v2;
  return [v2 _createAndConfigureFigPlayerWithType:a2 completionHandler:v4];
}

uint64_t __46__AVPlayer_prepareItem_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) _removeItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3052000000;
  v100 = __Block_byref_object_copy__5;
  v101 = __Block_byref_object_dispose__5;
  uint64_t v102 = 0;
  uint64_t v102 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2) {
    goto LABEL_59;
  }
  uint64_t v3 = (_DWORD *)(a1 + 80);
  if (*(_DWORD *)(a1 + 80)) {
    goto LABEL_59;
  }
  if (*(_DWORD *)(a1 + 84)) {
    goto LABEL_57;
  }
  block[0] = MEMORY[0x1E4F143A8];
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  block[1] = 3221225472;
  block[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3;
  block[3] = &unk_1E57B2270;
  uint64_t v96 = v2;
  long long v95 = v4;
  av_readwrite_dispatch_queue_write(v5, block);
  [*(id *)(a1 + 32) _addFPListeners];
  CFNumberRef number = 0;
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v8 + 48);
  if (!v9) {
    goto LABEL_11;
  }
  int v10 = v9(FigBaseObject, *MEMORY[0x1E4F343B8], *MEMORY[0x1E4F1CF80], &number);
  CFNumberRef v11 = number;
  if (!v10 && number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, (void *)(a1 + 80));
LABEL_11:
    CFNumberRef v11 = number;
  }
  if (v11) {
    CFRelease(v11);
  }
  if (!*v3)
  {
    int v12 = *(unsigned __int8 *)(a1 + 88);
    if (v12 != [*(id *)(a1 + 32) _isAirPlayVideoActive])
    {
      [*(id *)(a1 + 32) willChangeValueForKey:@"airPlayVideoActive"];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(NSObject **)(*(void *)(v13 + 8) + 56);
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4;
      v91[3] = &unk_1E57B20E8;
      v91[4] = v13;
      char v92 = *(unsigned char *)(a1 + 88);
      av_readwrite_dispatch_queue_write(v14, v91);
      [*(id *)(a1 + 32) didChangeValueForKey:@"airPlayVideoActive"];
    }
    int v15 = *(unsigned __int8 *)(a1 + 89);
    if (v15 != [*(id *)(a1 + 32) isExternalPlaybackActive])
    {
      [*(id *)(a1 + 32) willChangeValueForKey:@"externalPlaybackActive"];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(NSObject **)(*(void *)(v16 + 8) + 56);
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5;
      v89[3] = &unk_1E57B20E8;
      v89[4] = v16;
      char v90 = *(unsigned char *)(a1 + 89);
      av_readwrite_dispatch_queue_write(v17, v89);
      [*(id *)(a1 + 32) didChangeValueForKey:@"externalPlaybackActive"];
    }
    uint64_t v18 = *(void *)(a1 + 32);
    long long v19 = *(NSObject **)(*(void *)(v18 + 8) + 56);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6;
    v87[3] = &unk_1E57B20E8;
    v87[4] = v18;
    char v88 = *(unsigned char *)(a1 + 90);
    av_readwrite_dispatch_queue_write(v19, v87);
    if (*(void *)(a1 + 72))
    {
      [*(id *)(a1 + 32) willChangeValueForKey:@"mxSessionID"];
      uint64_t v20 = *(void *)(a1 + 32);
      long long v21 = *(NSObject **)(*(void *)(v20 + 8) + 56);
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7;
      v86[3] = &unk_1E57B2228;
      uint64_t v22 = *(void *)(a1 + 72);
      v86[4] = v20;
      v86[5] = v22;
      av_readwrite_dispatch_queue_write(v21, v86);
      [*(id *)(a1 + 32) didChangeValueForKey:@"mxSessionID"];
    }
    if ([*(id *)(a1 + 32) _updateAudioSessionOnFigPlayer] != *(void *)(a1 + 48) && dword_1EB2D3AA0)
    {
      int v85 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v24 = *(unsigned __int8 *)(a1 + 91);
    if (v24 != objc_msgSend(*(id *)(a1 + 32), "_isPIPModePossible", v70, v71))
    {
      [*(id *)(a1 + 32) willChangeValueForKey:@"PIPModePossible"];
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(NSObject **)(*(void *)(v25 + 8) + 56);
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_458;
      v82[3] = &unk_1E57B20E8;
      v82[4] = v25;
      char v83 = *(unsigned char *)(a1 + 91);
      av_readwrite_dispatch_queue_write(v26, v82);
      [*(id *)(a1 + 32) didChangeValueForKey:@"PIPModePossible"];
    }
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"avplaybackcoordinator_always", @"com.apple.avfoundation", 0);
    int v28 = [*(id *)(a1 + 32) _clientRequestedPlaybackCoordinator];
    if (AppBooleanValue == 1) {
      int v29 = 1;
    }
    else {
      int v29 = v28;
    }
    if (v29 == 1) {
      [*(id *)(a1 + 32) _ensureFigPlaybackCoordinatorIsConnected];
    }
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = *(NSObject **)(*(void *)(v30 + 8) + 40);
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2_462;
    v81[3] = &unk_1E57B1E80;
    v81[4] = v30;
    dispatch_sync(v31, v81);
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F34420], *MEMORY[0x1E4F342F8], *MEMORY[0x1E4F34158], *MEMORY[0x1E4F34240], *MEMORY[0x1E4F34390], *MEMORY[0x1E4F34358], *MEMORY[0x1E4F342D8], *MEMORY[0x1E4F341C8], *MEMORY[0x1E4F34178], *MEMORY[0x1E4F343F0], *MEMORY[0x1E4F34188], *MEMORY[0x1E4F343F8], *MEMORY[0x1E4F34278], *MEMORY[0x1E4F343E0], *MEMORY[0x1E4F34308], *MEMORY[0x1E4F343D8], *MEMORY[0x1E4F34330],
            *MEMORY[0x1E4F342B8],
            *MEMORY[0x1E4F342E8],
            *MEMORY[0x1E4F342D0],
            *MEMORY[0x1E4F341E0],
            *MEMORY[0x1E4F343A0],
            *MEMORY[0x1E4F341E8],
            *MEMORY[0x1E4F34410],
            *MEMORY[0x1E4F34238],
            *MEMORY[0x1E4F34170],
            *MEMORY[0x1E4F34388],
            *MEMORY[0x1E4F34270],
            *MEMORY[0x1E4F34190],
            *MEMORY[0x1E4F341A8],
            *MEMORY[0x1E4F341B8],
            *MEMORY[0x1E4F34368],
            *MEMORY[0x1E4F34168],
            *MEMORY[0x1E4F342F0],
            *MEMORY[0x1E4F34360],
            *MEMORY[0x1E4F341C0],
            *MEMORY[0x1E4F341A0],
            *MEMORY[0x1E4F343B0],
            0,
            *MEMORY[0x1E4F34188],
            *MEMORY[0x1E4F343F0],
            *MEMORY[0x1E4F34178],
            *MEMORY[0x1E4F341C8],
            *MEMORY[0x1E4F342D8],
            *MEMORY[0x1E4F34358],
            *MEMORY[0x1E4F34390],
            *MEMORY[0x1E4F34240],
            *MEMORY[0x1E4F34158],
            *MEMORY[0x1E4F342F8],
            *MEMORY[0x1E4F34420],
            MEMORY[0x1E4F1CAD0]);
    uint64_t v33 = *(void *)(a1 + 32);
    int v34 = *(NSObject **)(*(void *)(v33 + 8) + 40);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3_470;
    v80[3] = &unk_1E57B2270;
    v80[4] = v32;
    v80[5] = v33;
    v80[6] = *(void *)(a1 + 64);
    dispatch_sync(v34, v80);
    uint64_t v35 = [*(id *)(a1 + 32) _pendingFigPlayerProperties];
    uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
    uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v37) {
      uint64_t v38 = v37;
    }
    else {
      uint64_t v38 = 0;
    }
    CFBooleanRef v39 = *(void (**)(uint64_t, uint64_t, void))(v38 + 112);
    if (v39) {
      v39(v36, v35, 0);
    }
    if ([*(id *)(a1 + 32) _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F34400]])
    {
      uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
      uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v41)
      {
        uint64_t v42 = *(void (**)(uint64_t))(v41 + 8);
        if (v42) {
          v42(v40);
        }
      }
    }
    uint64_t v43 = *(void *)(a1 + 32);
    v44 = *(NSObject **)(*(void *)(v43 + 8) + 40);
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4_471;
    v79[3] = &unk_1E57B2228;
    uint64_t v45 = *(void *)(a1 + 64);
    v79[4] = v43;
    v79[5] = v45;
    dispatch_sync(v44, v79);
    uint64_t v46 = FigPlayerGetFigBaseObject();
    uint64_t v47 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v47) {
      uint64_t v48 = v47;
    }
    else {
      uint64_t v48 = 0;
    }
    long long v49 = *(void (**)(uint64_t, void, void))(v48 + 56);
    if (v49) {
      v49(v46, *MEMORY[0x1E4F343A8], *MEMORY[0x1E4F1CFC8]);
    }
    uint64_t v50 = FigPlayerGetFigBaseObject();
    uint64_t v51 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v51) {
      uint64_t v52 = v51;
    }
    else {
      uint64_t v52 = 0;
    }
    v53 = *(void (**)(uint64_t, void, void))(v52 + 56);
    if (v53) {
      v53(v50, *MEMORY[0x1E4F34198], *MEMORY[0x1E4F1CFD0]);
    }
    if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground] & 1) != 0
      || ([*(id *)(a1 + 32) _hasForegroundLayers] & 1) != 0
      || ([*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground] & 1) != 0
      || [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode])
    {
      [*(id *)(a1 + 32) _hasForegroundLayers];
      [*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground];
      [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground];
      [*(id *)(a1 + 32) _attachVideoLayersToFigPlayer];
    }
    [*(id *)(a1 + 32) _attachClosedCaptionLayersToFigPlayer];
    [*(id *)(a1 + 32) _attachFigPlayerToSubtitleLayers];
    [*(id *)(a1 + 32) _setNeroVideoGravityOnFigPlayer];
    uint64_t v54 = *(void *)(a1 + 32);
    v55 = *(NSObject **)(*(void *)(v54 + 8) + 56);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5_478;
    v78[3] = &unk_1E57B1E80;
    v78[4] = v54;
    av_readwrite_dispatch_queue_write(v55, v78);
    long long v56 = *(void **)(a1 + 32);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6_479;
    v77[3] = &unk_1E57B37E8;
    v77[4] = v56;
    v77[5] = &v97;
    [v56 _applyLinkedListOfItemsToFigPlayerUsingBlock:v77];
  }
  if (!*(void *)(a1 + 64)) {
    goto LABEL_59;
  }
LABEL_57:
  if (*v3 || *(_DWORD *)(a1 + 84)) {
LABEL_59:
  }
    objc_msgSend(*(id *)(a1 + 32), "_changeStatusToFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(*(_DWORD *)(a1 + 80), 0));
  [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
  uint64_t v57 = *(void *)(a1 + 56);
  if (v57) {
    (*(void (**)(uint64_t, uint64_t))(v57 + 16))(v57, v98[5]);
  }
  if ([*(id *)(a1 + 32) status] == 1)
  {
    uint64_t v104 = 0;
    v105 = &v104;
    uint64_t v106 = 0x3052000000;
    v107 = __Block_byref_object_copy__5;
    v108 = __Block_byref_object_dispose__5;
    uint64_t v109 = 0;
    uint64_t v58 = *(void *)(a1 + 32);
    uint64_t v59 = *(NSObject **)(*(void *)(v58 + 8) + 56);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7_481;
    v76[3] = &unk_1E57B2110;
    v76[4] = v58;
    v76[5] = &v104;
    av_readwrite_dispatch_queue_read(v59, v76);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    int v60 = (void *)v105[5];
    uint64_t v61 = [v60 countByEnumeratingWithState:&v72 objects:v103 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v73 != v62) {
            objc_enumerationMutation(v60);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v72 + 1) + 8 * i) + 16))();
        }
        uint64_t v61 = [v60 countByEnumeratingWithState:&v72 objects:v103 count:16];
      }
      while (v61);
    }

    _Block_object_dispose(&v104, 8);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_interstitialPlayerIfCreated"), "_setPrimaryPlayerNameForInterstitial:", *(void *)(a1 + 40));
  BOOL v64 = (const void *)[*(id *)(a1 + 32) _copyInterstitialCoordinatorIfCreated];
  if (v64)
  {
    uint64_t v65 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v65) {
      uint64_t v66 = v65;
    }
    else {
      uint64_t v66 = 0;
    }
    CFBooleanRef v67 = *(void (**)(const void *))(v66 + 56);
    if (v67) {
      v67(v64);
    }
    CFRelease(v64);
  }
  v68 = *(const void **)(a1 + 64);
  if (v68) {
    CFRelease(v68);
  }
  uint64_t v69 = *(const void **)(a1 + 72);
  if (v69) {
    CFRelease(v69);
  }
  _Block_object_dispose(&v97, 8);
}

void __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3(void *a1)
{
  CFTypeRef v2 = (CFTypeRef)a1[6];
  if (v2) {
    CFTypeRef v2 = CFRetain(v2);
  }
  *(void *)(*(void *)(a1[4] + 8) + 728) = v2;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 240) = 1;
  uint64_t v3 = (const void *)a1[5];
  uint64_t v4 = *(void *)(a1[4] + 8);
  uint64_t v5 = *(const void **)(v4 + 280);
  *(void *)(v4 + 280) = v3;
  if (v3) {
    CFRetain(v3);
  }
  if (v5)
  {
    CFRelease(v5);
  }
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 468) = *(unsigned char *)(result + 40);
  return result;
}

id __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 560) = result;
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_458(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 464) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_2_462(uint64_t a1)
{
  CFTypeRef v2 = (void *)[*(id *)(a1 + 32) _pendingFigPlayerPropertyForKey:@"AVPlayer_FigPlayerProperty_Rate"];
  if (v2)
  {
    [v2 floatValue];
    float v4 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) _pendingFigPlayerPropertyForKey:@"AVPlayer_FigPlayerProperty_RateOptions"];
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    if (*(void *)(v7 + 104))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      long long v19 = *(void (**)(uint64_t, uint64_t, float))(v10 + 104);
      if (v19) {
        v19(v8, v5, v4);
      }
    }
    else
    {
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      if (*(void *)(v12 + 56))
      {
        long long v25 = *MEMORY[0x1E4F1F9F8];
        uint64_t v26 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        FigCFDictionaryGetCMTimeIfPresent();
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
        long long v23 = v25;
        uint64_t v24 = v26;
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        long long v21 = *(void (**)(uint64_t, long long *, float))(v15 + 56);
        if (v21)
        {
          long long v27 = v25;
          uint64_t v28 = v26;
          v21(v13, &v27, v4);
        }
      }
      else
      {
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 728);
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v20 = *(void (**)(uint64_t, float))(v18 + 40);
        if (v20) {
          v20(v16, v4);
        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlayerProperty:forKey:", 0, @"AVPlayer_FigPlayerProperty_Rate", v23, v24);
  return [*(id *)(a1 + 32) _setPendingFigPlayerProperty:0 forKey:@"AVPlayer_FigPlayerProperty_RateOptions"];
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_3_470(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFTypeRef v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  float v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(a1 + 40) _pendingFigPlayerPropertyForKey:v8];
        if (v9) {
          [v2 setObject:v9 forKey:v8];
        }
        [*(id *)(a1 + 40) _setPendingFigPlayerProperty:0 forKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v5);
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 728);
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void (**)(uint64_t, void *, void))(v12 + 112);
  if (v13) {
    v13(v10, v2, 0);
  }
  uint64_t v14 = [*(id *)(a1 + 40) _cachedMediaSelectionCriteria];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v18 = v17 ? v17 : 0;
    long long v19 = *(void (**)(uint64_t, void, uint64_t))(v18 + 56);
    if (v19) {
      v19(FigBaseObject, *MEMORY[0x1E4F342E0], v15);
    }
  }
  uint64_t v20 = (void *)[*(id *)(a1 + 40) legibleFallbackMediaSelectionCriteria];
  if (v20)
  {
    uint64_t v21 = [v20 figDictionary];
    uint64_t v22 = FigPlayerGetFigBaseObject();
    uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v24 = v23 ? v23 : 0;
    long long v25 = *(void (**)(uint64_t, void, uint64_t))(v24 + 56);
    if (v25) {
      v25(v22, *MEMORY[0x1E4F342B0], v21);
    }
  }
  if ([*(id *)(a1 + 40) allowsLegibleFallbackForAllAudibleMediaSelections]) {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v27 = FigPlayerGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v31 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v30 = v31;
  if (v31) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = 0;
  }
  uint64_t v33 = *(uint64_t (**)(uint64_t, void, void))(v32 + 56);
  if (v33) {
    return v33(v27, *MEMORY[0x1E4F34180], *v26);
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_4_471(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) mediatedPixelBufferAttributes];
  float v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _updateDecoderPixelBufferAttributes:v2 onFigPlayer:v4];
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_5_478(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 160) = 1;
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_6_479(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (([v8 _addToPlayQueueOfFigPlayerOfPlayer:*(void *)(a1 + 32) afterFigPlaybackItemOfItem:0] & 1) == 0)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:", v8); {
        ++v7;
        }
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __67__AVPlayer__createAndConfigureFigPlayerWithType_completionHandler___block_invoke_7_481(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 296) copy];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 296);
  return [v2 removeAllObjects];
}

- (id)expectedAssetTypes
{
  return self->_player->expectedAssetTypes;
}

- (void)setExpectedAssetTypes:(id)a3
{
  if (!self->_player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayer's expectedAssetTypes can't be after any AVPlayerItems have been enqueued or after the AVPlayer's status changes from AVPlayerStatusUnknown." userInfo:0]);
  }
  id v5 = a3;

  self->_player->expectedAssetTypes = (NSArray *)a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  void v6[5] = self;
  AVEnsureNotOnMainThread(v6);
}

void __34__AVPlayer_setExpectedAssetTypes___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    int v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v6 |= objc_msgSend(+[AVURLAsset _fileUTTypes](AVURLAsset, "_fileUTTypes"), "containsObject:", v9);
        v5 |= objc_msgSend(+[AVURLAsset _streamingUTTypes](AVURLAsset, "_streamingUTTypes"), "containsObject:", v9);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
    LOBYTE(v6) = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  long long v11 = *(NSObject **)(*(void *)(v10 + 8) + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke_2;
  v12[3] = &unk_1E57B3860;
  char v13 = v6 & 1;
  char v14 = v5 & 1;
  v12[4] = v10;
  dispatch_async(v11, v12);
}

uint64_t __34__AVPlayer_setExpectedAssetTypes___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(unsigned __int8 *)(result + 41);
  if (*(unsigned __int8 *)(result + 40) != v1)
  {
    uint64_t v2 = result;
    uint64_t result = *(void *)(result + 32);
    if (*(unsigned char *)(*(void *)(result + 8) + 744))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F324F0];
      if (!v1) {
        uint64_t v3 = (void *)MEMORY[0x1E4F324E8];
      }
      [(id)result _setPendingFigPlayerProperty:*v3 forKey:*MEMORY[0x1E4F34280]];
      *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 744) = 0;
      uint64_t v4 = *(void **)(v2 + 32);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __34__AVPlayer_setExpectedAssetTypes___block_invoke_3;
      v5[3] = &unk_1E57B3680;
      v5[4] = v4;
      return [v4 _createAndConfigureFigPlayerWithType:v1 completionHandler:v5];
    }
  }
  return result;
}

uint64_t __34__AVPlayer_setExpectedAssetTypes___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) _removeItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setAncillaryPerformanceInformationForDisplay:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVPlayer__setAncillaryPerformanceInformationForDisplay___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __58__AVPlayer__setAncillaryPerformanceInformationForDisplay___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 480) = result;
  return result;
}

- (id)_ancillaryPerformanceInformationForDisplay
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayer__ancillaryPerformanceInformationForDisplay__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayer__ancillaryPerformanceInformationForDisplay__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 480);
  return result;
}

uint64_t __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        long long v10 = (void *)[v9 item];
        uint64_t v11 = [v9 modificationType];
        if (v11 == 1)
        {
          [v10 _removeFromPlayQueueOfFigPlayerOfAttachedPlayer];
        }
        else if (!v11 {
               && (objc_msgSend(v10, "_addToPlayQueueOfFigPlayerOfPlayer:afterFigPlaybackItemOfItem:", *(void *)(a1 + 32), objc_msgSend(v9, "afterItem")) & 1) == 0)
        }
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __67__AVPlayer__applyPlayQueueChangesToFigPlayerWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createAndConfigureFigPlayerWithType:a2 completionHandler:*(void *)(a1 + 40)];
}

- (void)_removeItemFromLinkedList_invokeOnIvarAccessQueue:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVPlayer.m", 5279, @"Invalid parameter not satisfying: %@", @"item != nil");
  }
  player = self->_player;
  currentItem = player->currentItem;
  lastItem = player->lastItem;
  if (currentItem == a3) {
    uint64_t v8 = [a3 _nextItem];
  }
  else {
    uint64_t v8 = 0;
  }
  if (lastItem == a3) {
    long long v9 = (AVPlayerItem *)[a3 _previousItem];
  }
  else {
    long long v9 = 0;
  }
  [(NSMutableSet *)self->_player->items removeObject:a3];
  [a3 _removeFromItems];
  if (lastItem == a3) {
    self->_player->lastItem = v9;
  }
  if (currentItem == a3) {
    [(AVPlayer *)self _setCurrentItem:v8];
  }
  id v10 = +[AVPlayerQueueModificationDescription modificationForRemovingItem:a3];
  [(AVPlayer *)self _enqueuePlayQueueModification_invokeOnIvarAccessQueue:v10];
}

- (void)_removeItem:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3AA0)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v6 = a3;
  if (a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __24__AVPlayer__removeItem___block_invoke;
    v8[3] = &unk_1E57B37C0;
    v8[4] = a3;
    void v8[5] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __24__AVPlayer__removeItem___block_invoke_2;
    void v7[3] = &unk_1E57B2098;
    v7[4] = self;
    void v7[5] = a3;
    [(AVPlayer *)self _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:v8 modificationBlock:v7 error:0];
  }
}

uint64_t __24__AVPlayer__removeItem___block_invoke(uint64_t a1, BOOL *a2)
{
  *a2 = *(void *)(a1 + 32) == *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 176);
  return 1;
}

uint64_t __24__AVPlayer__removeItem___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 192) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return objc_msgSend(v3, "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", v4);
  }
  return result;
}

- (void)replaceCurrentItemWithPlayerItem:(AVPlayerItem *)item
{
  v19[22] = *(id *)MEMORY[0x1E4F143B8];
  v19[0] = 0;
  if (item)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Item must be an instance of AVPlayerItem.", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
      objc_exception_throw(v12);
    }
  }
  if (dword_1EB2D3AA0)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVPlayerItem _attachToPlayer:](item, "_attachToPlayer:", self, v13, v14);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke;
  v16[3] = &unk_1E57B38D8;
  v16[4] = item;
  v16[5] = self;
  v16[6] = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke_2;
  v15[3] = &unk_1E57B2098;
  v15[4] = self;
  v15[5] = item;
  if (!-[AVPlayer _runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:](self, "_runOnIvarAccessQueueOperationThatMayChangeCurrentItemWithPreflightBlock:modificationBlock:error:", v16, v15, v19)&& [v19[0] code] == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v19[0], "userInfo"), "objectForKey:", @"AVErrorExceptionKey"));
  }
}

uint64_t __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke(uint64_t a1, unsigned char *a2, uint64_t *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 == *(void *)(v6 + 176))
  {
    *a2 = 0;
    return 1;
  }
  else if (v5 && objc_msgSend(*(id *)(v6 + 192), "containsObject:"))
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 40), *(const char **)(a1 + 48), @"An AVPlayerItem can occupy only one position in a player's queue at a time.", v8, v9, v10, v11, v12, v16), 0 reason userInfo];
    uint64_t v14 = AVErrorForClientProgrammingError(v13);
    uint64_t result = 0;
    *a3 = v14;
  }
  else
  {
    uint64_t result = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t __45__AVPlayer_replaceCurrentItemWithPlayerItem___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 176);
  id v3 = v2;
  id v4 = *(id *)(a1 + 40);
  if (v4 != v2)
  {
    id v6 = v2;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addItemToLinkedList_invokeOnIvarAccessQueue:afterItem:", v4, v2);
      id v3 = v6;
    }
    if (v3) {
      objc_msgSend(*(id *)(a1 + 32), "_removeItemFromLinkedList_invokeOnIvarAccessQueue:", v3);
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (id)_items
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer__items__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __18__AVPlayer__items__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_items_invokeOnIvarAccessQueue"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_removeAllItems
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  while (1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    uint64_t v9 = __Block_byref_object_copy__5;
    uint64_t v10 = __Block_byref_object_dispose__5;
    uint64_t v11 = 0;
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __27__AVPlayer__removeAllItems__block_invoke;
    v5[3] = &unk_1E57B2110;
    v5[4] = self;
    void v5[5] = &v6;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
    if (!v7[5]) {
      break;
    }
    -[AVPlayer _removeItem:](self, "_removeItem:");

    _Block_object_dispose(&v6, 8);
  }
  _Block_object_dispose(&v6, 8);
}

id __27__AVPlayer__removeAllItems__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 184);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (float)_rate
{
  float v10 = 0.0;
  uint64_t v3 = [(AVPlayer *)self _copyFigPlayer];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigPlayer *, float *))(v6 + 48);
    if (v9) {
      v9(v4, &v10);
    }
    CFRelease(v4);
    return v10;
  }
  else
  {
    id v7 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:@"AVPlayer_FigPlayerProperty_Rate"];
    if (v7)
    {
      [v7 floatValue];
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

void __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_498(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  uint64_t v2 = a1[4];
  uint64_t v3 = *(NSObject **)(*(void *)(v2 + 8) + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer__setRate_rateChangeReason_figPlayerSetRateHandler___block_invoke_2;
  block[3] = &unk_1E57B2110;
  void block[4] = v2;
  void block[5] = &v7;
  av_readwrite_dispatch_queue_read(v3, block);
  if (*((_DWORD *)v8 + 6) == *(_DWORD *)(*(void *)(a1[7] + 8) + 24))
  {
    (*(void (**)(void))(a1[6] + 16))();
    char v4 = 1;
  }
  else
  {
    char v4 = dword_1EB2D3AA0;
    if (dword_1EB2D3AA0)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      char v4 = 0;
    }
  }
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v4;
  _Block_object_dispose(&v7, 8);
}

- (void)setRate:(float)a3 withVolumeRampDuration:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v4, 0, 23, 1);
}

- (void)setDefaultRate:(float)defaultRate
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__AVPlayer_setDefaultRate___block_invoke;
  v4[3] = &unk_1E57B39C8;
  v4[4] = self;
  float v5 = defaultRate;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

float __27__AVPlayer_setDefaultRate___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 500) = result;
  return result;
}

- (void)playImmediatelyAtRate:(float)rate
{
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  -[AVPlayer _setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:](self, "_setRate:withVolumeRampDuration:playImmediately:rateChangeReason:affectsCoordinatedPlayback:", &v3, 1, 23, 1);
}

- (void)pauseWithoutAffectingCoordinatedPlayback
{
  long long v2 = *MEMORY[0x1E4F1F9F8];
  uint64_t v3 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVPlayer *)self _setRate:&v2 withVolumeRampDuration:0 playImmediately:23 rateChangeReason:0 affectsCoordinatedPlayback:0.0];
}

- (void)_setUsesLegacyAutomaticWaitingBehavior:(BOOL)a3
{
  player = self->_player;
  if (!player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayer's _usesLegacyAutomaticWaitingBehavior can't be set after any AVPlayerItems have been enqueued or after the AVPlayer's status changes from AVPlayerStatusUnknown." userInfo:0]);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  ivarAccessQueue = player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke;
  block[3] = &unk_1E57B3A18;
  BOOL v9 = a3;
  void block[4] = self;
  void block[5] = &v10;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke_2;
    void v7[3] = &unk_1E57B1E80;
    v7[4] = self;
    dispatch_sync(figConfigurationQueue, v7);
  }
  _Block_object_dispose(&v10, 8);
}

void __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) usesLegacyAutomaticWaitingBehavior];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != v2)
  {
    uint64_t v4 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) rateStateBySettingUsesLegacyAutomaticWaitingBehavior:v3 != 0];
    id v5 = v4;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 488) = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __51__AVPlayer__setUsesLegacyAutomaticWaitingBehavior___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _usesLegacyAutomaticWaitingBehavior];
  char v3 = v2;
  uint64_t v4 = *MEMORY[0x1E4F1CFD0];
  uint64_t v5 = *MEMORY[0x1E4F1CFC8];
  if (v2) {
    uint64_t v6 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v6 = *MEMORY[0x1E4F1CFC8];
  }
  uint64_t result = [*(id *)(a1 + 32) _setPendingFigPlayerProperty:v6 forKey:*MEMORY[0x1E4F341A0]];
  if (v3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (sWaitsToMinimizeStallingByDefault != 1) {
      return result;
    }
    if ([*(id *)(a1 + 32) automaticallyWaitsToMinimizeStalling]) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v5;
    }
  }
  BOOL v9 = *(void **)(a1 + 32);
  uint64_t v10 = *MEMORY[0x1E4F341C0];
  return [v9 _setPendingFigPlayerProperty:v8 forKey:v10];
}

- (BOOL)_usesLegacyAutomaticWaitingBehavior
{
  id v2 = [(AVPlayer *)self _rateState];
  return [v2 usesLegacyAutomaticWaitingBehavior];
}

+ (BOOL)automaticallyNotifiesObserversOfUsesLegacyAutomaticWaitingBehavior
{
  return 0;
}

- (CMTime)currentTime
{
  uint64_t result = [(AVPlayer *)self currentItem];
  if (result)
  {
    return (CMTime *)[(CMTime *)result currentTime];
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->value = *MEMORY[0x1E4F1F9F8];
    retstr->CMTimeEpoch epoch = *(void *)(v5 + 16);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentUnfoldedTime
{
  uint64_t result = [(AVPlayer *)self currentItem];
  if (result)
  {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result currentUnfoldedTime];
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->int64_t var3 = *(void *)(v5 + 16);
  }
  return result;
}

- (void)seekToDate:(NSDate *)date
{
  uint64_t v4 = [(AVPlayer *)self currentItem];
  if (v4)
  {
    [(AVPlayerItem *)v4 seekToDate:date completionHandler:0];
  }
}

- (void)seekToDate:(NSDate *)date completionHandler:(void *)completionHandler
{
  uint64_t v6 = [(AVPlayer *)self currentItem];
  if (v6)
  {
    [(AVPlayerItem *)v6 seekToDate:date completionHandler:completionHandler];
  }
  else
  {
    uint64_t v7 = (void (*)(void *, void))*((void *)completionHandler + 2);
    v7(completionHandler, 0);
  }
}

- (void)seekToTime:(CMTime *)time
{
  uint64_t v4 = [(AVPlayer *)self currentItem];
  if (v4)
  {
    long long v5 = *(_OWORD *)&time->value;
    CMTimeEpoch epoch = time->epoch;
    [(AVPlayerItem *)v4 seekToTime:&v5 completionHandler:0];
  }
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter
{
  uint64_t v8 = [(AVPlayer *)self currentItem];
  if (v8)
  {
    long long v13 = *(_OWORD *)&time->value;
    CMTimeEpoch epoch = time->epoch;
    long long v11 = *(_OWORD *)&toleranceBefore->value;
    CMTimeEpoch v12 = toleranceBefore->epoch;
    long long v9 = *(_OWORD *)&toleranceAfter->value;
    CMTimeEpoch v10 = toleranceAfter->epoch;
    [(AVPlayerItem *)v8 seekToTime:&v13 toleranceBefore:&v11 toleranceAfter:&v9 completionHandler:0];
  }
}

- (void)seekToTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  uint64_t v6 = [(AVPlayer *)self currentItem];
  if (v6)
  {
    long long v12 = *(_OWORD *)&time->value;
    CMTimeEpoch epoch = time->epoch;
    long long v10 = *MEMORY[0x1E4F1FA10];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    long long v8 = v10;
    uint64_t v9 = v11;
    [(AVPlayerItem *)v6 seekToTime:&v12 toleranceBefore:&v10 toleranceAfter:&v8 completionHandler:completionHandler];
  }
  else
  {
    uint64_t v7 = (void (*)(void *, void))*((void *)completionHandler + 2);
    v7(completionHandler, 0);
  }
}

- (void)seekToTime:(CMTime *)time toleranceBefore:(CMTime *)toleranceBefore toleranceAfter:(CMTime *)toleranceAfter completionHandler:(void *)completionHandler
{
  long long v10 = [(AVPlayer *)self currentItem];
  if (v10)
  {
    long long v16 = *(_OWORD *)&time->value;
    CMTimeEpoch epoch = time->epoch;
    long long v14 = *(_OWORD *)&toleranceBefore->value;
    CMTimeEpoch v15 = toleranceBefore->epoch;
    long long v12 = *(_OWORD *)&toleranceAfter->value;
    CMTimeEpoch v13 = toleranceAfter->epoch;
    [(AVPlayerItem *)v10 seekToTime:&v16 toleranceBefore:&v14 toleranceAfter:&v12 completionHandler:completionHandler];
  }
  else
  {
    uint64_t v11 = (void (*)(void *, void))*((void *)completionHandler + 2);
    v11(completionHandler, 0);
  }
}

- (void)setRate:(float)rate time:(CMTime *)itemTime atHostTime:(CMTime *)hostClockTime
{
  CMTime v6 = *itemTime;
  CMTime v5 = *hostClockTime;
  -[AVPlayer setRate:time:atHostTime:options:](self, "setRate:time:atHostTime:options:", &v6, &v5, 0);
}

- (void)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 options:(id)a6
{
  uint64_t v11 = [(AVPlayer *)self _copyFigPlayer];
  if (!v11)
  {
    long long v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    int v18 = @"AVPlayer cannot service a synchronized playback request via setRate:time:atHostTime: until its status is AVPlayerStatusReadyToPlay.";
    goto LABEL_12;
  }
  long long v12 = v11;
  if (!a6)
  {
LABEL_6:
    if (sSetRateAtHostTimeThrowsWhenWaitingToMinimizeStalling != 1
      || ((![(AVPlayer *)self automaticallyWaitsToMinimizeStalling] | a6) & 1) != 0)
    {
      int v15 = 0;
      goto LABEL_9;
    }
    long long v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    int v18 = @"AVPlayer cannot service a synchronized playback request via setRate:time:atHostTime: when automaticallyWaitsToMinimizeStalling is YES";
LABEL_12:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v18 userInfo:0]);
  }
  char v13 = [a6 preferCoordinatedPlaybackBehavior];
  int v14 = [a6 overrideAutowaitRestriction];
  if ((v13 & 1) == 0)
  {
    LODWORD(a6) = v14;
    goto LABEL_6;
  }
  int v15 = 1;
LABEL_9:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__AVPlayer_setRate_time_atHostTime_options___block_invoke;
  v19[3] = &__block_descriptor_88_e29_v20__0__OpaqueFigPlayer__8i16l;
  float v20 = a3;
  long long v21 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  long long v23 = *(_OWORD *)&a5->var0;
  int64_t v24 = a5->var3;
  int v25 = v15;
  [(AVPlayer *)self _setRate:23 rateChangeReason:v19 figPlayerSetRateHandler:COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(a3)))];
  CFRelease(v12);
}

uint64_t __44__AVPlayer_setRate_time_atHostTime_options___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3 = *(float *)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 84);
  long long v13 = *(_OWORD *)(a1 + 36);
  uint64_t v14 = *(void *)(a1 + 52);
  long long v11 = *(_OWORD *)(a1 + 60);
  uint64_t v12 = *(void *)(a1 + 76);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  long long v10 = *(uint64_t (**)(uint64_t, long long *, long long *, uint64_t, float))(v9 + 88);
  if (v10)
  {
    long long v17 = v13;
    uint64_t v18 = v14;
    long long v15 = v11;
    uint64_t v16 = v12;
    return v10(a2, &v17, &v15, v4, v3);
  }
  return result;
}

- (int)_createPrerollID
{
  player = self->_player;
  int v3 = player->nextPrerollIDToGenerate + 1;
  player->nextPrerollIDToGenerate = v3;
  self->_player->int pendingPrerollID = v3;
  uint64_t v4 = self->_player;
  int pendingPrerollID = v4->pendingPrerollID;
  if (pendingPrerollID <= 0)
  {
    v4->int pendingPrerollID = 1;
    return self->_player->pendingPrerollID;
  }
  return pendingPrerollID;
}

- (int)_cancelPendingPrerollAndRegisterPrerollCompletionHandler:(id)a3
{
  MEMORY[0x199715030](self->_player->prerollIDMutex, a2);
  player = self->_player;
  prerollCompletionHandler = (void (**)(void, void))player->prerollCompletionHandler;
  if (prerollCompletionHandler) {
    player->prerollCompletionHandler = 0;
  }
  if (a3)
  {
    int v7 = [(AVPlayer *)self _createPrerollID];
    self->_player->prerollCompletionHandler = (id)[a3 copy];
  }
  else
  {
    int v7 = 0;
  }
  MEMORY[0x199715040](self->_player->prerollIDMutex);
  if (prerollCompletionHandler)
  {
    prerollCompletionHandler[2](prerollCompletionHandler, 0);
  }
  return v7;
}

- (id)_unregisterAndReturnRetainedPrerollCompletionHandler
{
  player = self->_player;
  id prerollCompletionHandler = player->prerollCompletionHandler;
  player->int pendingPrerollID = 0;
  self->_player->id prerollCompletionHandler = 0;
  return prerollCompletionHandler;
}

- (void)prerollAtRate:(float)rate completionHandler:(void *)completionHandler
{
  int v7 = [(AVPlayer *)self _copyFigPlayer];
  if (!v7) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"AVPlayer cannot service a preroll request until its status is AVPlayerStatusReadyToPlay." userInfo:0]);
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(AVPlayer *)self _cancelPendingPrerollAndRegisterPrerollCompletionHandler:completionHandler];
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(OpaqueFigPlayer *, uint64_t, float))(v11 + 64);
  if (!v12 || v12(v8, v9, rate)) {
    [(AVPlayer *)self _cancelPendingPrerollAndRegisterPrerollCompletionHandler:0];
  }
  CFRelease(v8);
}

- (void)cancelPendingPrerolls
{
}

- (CMClockRef)masterClock
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVPlayer_masterClock__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int v3 = (OpaqueCMClock *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __23__AVPlayer_masterClock__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 784);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMasterClock:(CMClockRef)masterClock
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AVPlayer_setMasterClock___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  void block[5] = masterClock;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(AVPlayer *)self _setPendingFigPlayerProperty:masterClock forKey:*MEMORY[0x1E4F342C8]];
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    int v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__AVPlayer_setMasterClock___block_invoke_2;
    v9[3] = &unk_1E57B3A60;
    v9[4] = self;
    void v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
}

void __27__AVPlayer_setMasterClock___block_invoke(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRetain(v2);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(const void **)(v3 + 784);
  if (v4)
  {
    CFRelease(v4);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(void *)(v3 + 784) = *(void *)(a1 + 40);
}

uint64_t __27__AVPlayer_setMasterClock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sourceClock];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F342C8], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)_userVolume
{
  float v17 = 0.5;
  CFTypeRef cf = 0;
  uint64_t v3 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v4 = *MEMORY[0x1E4F343E8];
  if (v3)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, void, CFTypeRef *))(v7 + 48);
    if (!v10 || (v10(FigBaseObject, v4, *MEMORY[0x1E4F1CF80], &cf), (uint64_t v9 = (void *)cf) == 0))
    {
LABEL_12:
      CFRelease(v3);
      return v17;
    }
  }
  else
  {
    id v8 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F343E8]];
    CFTypeRef cf = v8;
    if (!v8)
    {
      long long v13 = [(AVPlayer *)self audioSession];
      if (v13) {
        uint64_t v14 = [(AVAudioSession *)v13 category];
      }
      else {
        uint64_t v14 = 0;
      }
      long long v15 = objc_msgSend(MEMORY[0x1E4F74F68], "sharedAVSystemController", cf);
      if (!v15) {
        return 0.5;
      }
      [v15 getVolume:&v17 forCategory:v14];
      return v17;
    }
    uint64_t v9 = v8;
    CFRetain(v8);
  }
  objc_msgSend(v9, "floatValue", cf);
  float v17 = v11;
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    goto LABEL_12;
  }
  return v17;
}

- (void)_setUserVolume:(float)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__AVPlayer__setUserVolume___block_invoke;
  v14[3] = &unk_1E57B39C8;
  v14[4] = self;
  float v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v14);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  *(float *)&double v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  uint64_t v9 = *MEMORY[0x1E4F343E8];
  if (v6)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    long long v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 56);
    if (v13) {
      v13(FigBaseObject, v9, v8);
    }
    CFRelease(v6);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v8 forKey:*MEMORY[0x1E4F343E8]];
  }
}

float __27__AVPlayer__setUserVolume___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 380) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUserVolume
{
  return 0;
}

- (id)vibrationPattern
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AVPlayer_vibrationPattern__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __28__AVPlayer_vibrationPattern__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 224);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setVibrationPattern:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVPlayer_setVibrationPattern___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v7 = *MEMORY[0x1E4F34400];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    long long v13 = *(void (**)(uint64_t, uint64_t, id))(v11 + 56);
    if (v13) {
      v13(FigBaseObject, v7, a3);
    }
    if (a3)
    {
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v14)
      {
        float v15 = *(void (**)(OpaqueFigPlayer *))(v14 + 8);
        if (v15) {
          v15(v8);
        }
      }
    }
    CFRelease(v8);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:a3 forKey:*MEMORY[0x1E4F34400]];
    player = self->_player;
    if (player->needsToCreateFigPlayer)
    {
      player->needsToCreateFigPlayer = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __32__AVPlayer_setVibrationPattern___block_invoke_2;
      v16[3] = &unk_1E57B3680;
      v16[4] = self;
      [(AVPlayer *)self _createAndConfigureFigPlayerWithType:0 completionHandler:v16];
    }
  }
}

id __32__AVPlayer_setVibrationPattern___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 224) = result;
  return result;
}

uint64_t __32__AVPlayer_setVibrationPattern___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) _removeItem:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfVibrationPattern
{
  return 0;
}

- (float)_playerVolume
{
  CFTypeRef cf = 0;
  id v3 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v4 = *MEMORY[0x1E4F34420];
  if (v3)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    long long v10 = *(void (**)(uint64_t, uint64_t, void, CFTypeRef *))(v7 + 48);
    float v11 = 1.0;
    if (!v10 || (v10(FigBaseObject, v4, *MEMORY[0x1E4F1CF80], &cf), (long long v9 = (void *)cf) == 0))
    {
LABEL_12:
      CFRelease(v3);
      return v11;
    }
  }
  else
  {
    id v8 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F34420]];
    CFTypeRef cf = v8;
    if (!v8) {
      return 1.0;
    }
    long long v9 = v8;
    CFRetain(v8);
  }
  [v9 floatValue];
  float v11 = v12;
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    goto LABEL_12;
  }
  return v11;
}

- (float)volume
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 1065353216;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__AVPlayer_volume__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __18__AVPlayer_volume__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 376);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVolume:(float)volume
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__AVPlayer_setVolume___block_invoke;
  block[3] = &unk_1E57B39C8;
  void block[4] = self;
  float v15 = volume;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  *(float *)&double v6 = volume;
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithFloat:v6];
  [(AVPlayer *)self _setPendingFigPlayerProperty:v7 forKey:*MEMORY[0x1E4F34420]];
  uint64_t v8 = [(AVPlayer *)self _copyFigPlayer];
  if (v8)
  {
    int v9 = v8;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    int v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __22__AVPlayer_setVolume___block_invoke_2;
    void v11[3] = &unk_1E57B3A60;
    v11[4] = self;
    void v11[5] = v12;
    void v11[6] = v9;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v9);
  }
}

float __22__AVPlayer_setVolume___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 376) = result;
  return result;
}

uint64_t __22__AVPlayer_setVolume___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) volume];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 56);
  if (v7) {
    uint64_t result = v7(FigBaseObject, *MEMORY[0x1E4F34420], v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isMuted
{
  if (self->_player->figPlayer)
  {
    CFBooleanRef BOOLean = (CFBooleanRef)*MEMORY[0x1E4F1CFC8];
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v7 = *(unsigned int (**)(uint64_t, void, void, CFBooleanRef *))(v4 + 48);
    if (v7 && !v7(FigBaseObject, *MEMORY[0x1E4F342F8], *MEMORY[0x1E4F1CF80], &BOOLean))
    {
      BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
      if (BOOLean) {
        CFRelease(BOOLean);
      }
      return v8;
    }
    return 0;
  }
  id v5 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F342F8]];
  if (!v5) {
    return 0;
  }
  return [v5 BOOLValue];
}

uint64_t __21__AVPlayer_setMuted___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMuted]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F342F8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingMuted
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"status"];
}

uint64_t __48__AVPlayer__setActionAtItemEnd_allowingAdvance___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "figPlayerActionForActionAtItemEnd:", objc_msgSend(*(id *)(a1 + 32), "actionAtItemEnd"));
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34158], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setActionAtItemEnd:(AVPlayerActionAtItemEnd)actionAtItemEnd
{
}

+ (id)keyPathsForValuesAffectingActionAtItemEnd
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"status"];
}

- (BOOL)isClosedCaptionDisplayEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__AVPlayer_isClosedCaptionDisplayEnabled__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__AVPlayer_isClosedCaptionDisplayEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 396);
  return result;
}

- (void)setClosedCaptionDisplayEnabled:(BOOL)closedCaptionDisplayEnabled
{
  BOOL v3 = closedCaptionDisplayEnabled;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = closedCaptionDisplayEnabled;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34240]];
  }
}

uint64_t __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 396) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __43__AVPlayer_setClosedCaptionDisplayEnabled___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isClosedCaptionDisplayEnabled]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34240], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingClosedCaptionDisplayEnabled
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"status"];
}

- (BOOL)_isDisplayingClosedCaptions
{
  uint64_t v2 = [(AVPlayer *)self _copyFigPlayer];
  if (v2)
  {
    BOOL v3 = v2;
    CFBooleanRef v4 = (CFBooleanRef)*MEMORY[0x1E4F1CFC8];
    CFBooleanRef BOOLean = (CFBooleanRef)*MEMORY[0x1E4F1CFC8];
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    char v9 = *(uint64_t (**)(uint64_t, void, void, CFBooleanRef *))(v7 + 48);
    if (v9 && (v10 = v9(FigBaseObject, *MEMORY[0x1E4F34260], *MEMORY[0x1E4F1CF80], &BOOLean), CFBooleanRef v4 = BOOLean, !v10))
    {
      BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
      CFBooleanRef v4 = BOOLean;
      if (!BOOLean) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL v8 = 0;
      if (!v4)
      {
LABEL_10:
        CFRelease(v3);
        return v8;
      }
    }
    CFRelease(v4);
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)shouldReduceResourceUsage
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayer_shouldReduceResourceUsage__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVPlayer_shouldReduceResourceUsage__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 304);
  return result;
}

- (void)setShouldReduceResourceUsage:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AVPlayer_setShouldReduceResourceUsage___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v15 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__AVPlayer_setShouldReduceResourceUsage___block_invoke_2;
    v13[3] = &unk_1E57B2228;
    v13[4] = self;
    void v13[5] = v7;
    dispatch_sync(figConfigurationQueue, v13);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    BOOL v10 = !v3;
    if (v3)
    {
      float v11 = &unk_1EE5E1758;
    }
    else
    {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
      float v11 = 0;
    }
    if (v10) {
      int v12 = 0;
    }
    else {
      int v12 = &unk_1EE5E1770;
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34390]];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v11 forKey:*MEMORY[0x1E4F34358]];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v12 forKey:*MEMORY[0x1E4F342D8]];
  }
}

uint64_t __41__AVPlayer_setShouldReduceResourceUsage___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 304) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __41__AVPlayer_setShouldReduceResourceUsage___block_invoke_2(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldReduceResourceUsage])
  {
    uint64_t v2 = *MEMORY[0x1E4F1CFD0];
    BOOL v3 = &unk_1EE5E1770;
    CFBooleanRef v4 = &unk_1EE5E1758;
  }
  else
  {
    uint64_t v2 = *MEMORY[0x1E4F1CFC8];
    CFBooleanRef v4 = (void *)[MEMORY[0x1E4F1CA98] null];
    BOOL v3 = (void *)[MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v5 = *MEMORY[0x1E4F34358];
  v14[0] = *MEMORY[0x1E4F34390];
  v14[1] = v5;
  v15[0] = v2;
  v15[1] = v4;
  v14[2] = *MEMORY[0x1E4F342D8];
  v15[2] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v11 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v10 = v11;
  if (v11) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = *(uint64_t (**)(uint64_t, uint64_t, void))(v12 + 112);
  if (v13) {
    return v13(v7, v6, 0);
  }
  return result;
}

- (int64_t)resourceConservationLevelWhilePaused
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayer_resourceConservationLevelWhilePaused__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayer_resourceConservationLevelWhilePaused__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 312);
  return result;
}

- (void)setResourceConservationLevelWhilePaused:(int64_t)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke_2;
    void v10[3] = &unk_1E57B2228;
    v10[4] = self;
    void v10[5] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v9 forKey:*MEMORY[0x1E4F34398]];
  }
}

uint64_t __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 312) = *(void *)(result + 40);
  return result;
}

uint64_t __52__AVPlayer_setResourceConservationLevelWhilePaused___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) resourceConservationLevelWhilePaused];
  uint64_t v2 = [MEMORY[0x1E4F28ED0] numberWithInteger:v1];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F34398];
    return v9(FigBaseObject, v10, v2);
  }
  return result;
}

- (id)playerRole
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__AVPlayer_playerRole__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__AVPlayer_playerRole__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 320);
  return result;
}

- (void)setPlayerRole:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVPlayer_setPlayerRole_synchronously___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if ([a3 isEqualToString:@"Scanning"])
  {
    uint64_t v8 = *MEMORY[0x1E4F34438];
  }
  else if ([a3 isEqualToString:@"PIP"])
  {
    uint64_t v8 = *MEMORY[0x1E4F34430];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v10 = *MEMORY[0x1E4F34348];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    BOOL v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 56);
    if (v15) {
      v15(FigBaseObject, v10, v8);
    }
    if (v4)
    {
      CFTypeRef cf = 0;
      uint64_t v16 = FigPlayerGetFigBaseObject();
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      long long v19 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v18 + 48);
      if (v19)
      {
        v19(v16, *MEMORY[0x1E4F343D0], *MEMORY[0x1E4F1CF80], &cf);
        if (cf) {
          CFRelease(cf);
        }
      }
    }
    CFRelease(v11);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v8 forKey:*MEMORY[0x1E4F34348]];
  }
}

uint64_t __40__AVPlayer_setPlayerRole_synchronously___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 320) = *(void *)(result + 40);
  return result;
}

- (void)setPlayerRole:(id)a3
{
}

uint64_t __38__AVPlayer_setAllowsExternalPlayback___block_invoke_2(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) allowsExternalPlayback];
  uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v1) {
    uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v3 = *v2;
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, uint64_t))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, *MEMORY[0x1E4F34178], v3);
  }
  uint64_t v8 = FigPlayerGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v14)
  {
    uint64_t v15 = *MEMORY[0x1E4F34188];
    return v14(v8, v15, v3);
  }
  return result;
}

uint64_t __63__AVPlayer_setUsesExternalPlaybackWhileExternalScreenIsActive___block_invoke_2(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) usesExternalPlaybackWhileExternalScreenIsActive];
  uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v1) {
    uint64_t v2 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v3 = *v2;
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, uint64_t))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, *MEMORY[0x1E4F343F8], v3);
  }
  uint64_t v8 = FigPlayerGetFigBaseObject();
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v12 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v11 = v12;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v14)
  {
    uint64_t v15 = *MEMORY[0x1E4F343F0];
    return v14(v8, v15, v3);
  }
  return result;
}

- (BOOL)_externalPlaybackActive
{
  uint64_t v3 = [(AVPlayer *)self _copyFigPlayer];
  CFBooleanRef v18 = 0;
  CFBooleanRef BOOLean = 0;
  uint64_t v4 = *MEMORY[0x1E4F342A8];
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F1CF80];
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef *))(v8 + 48);
    if (v11) {
      v11(FigBaseObject, v4, v5, &BOOLean);
    }
    uint64_t v12 = FigPlayerGetFigBaseObject();
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = *(void (**)(uint64_t, void, uint64_t, CFBooleanRef *))(v14 + 48);
    if (v15) {
      v15(v12, *MEMORY[0x1E4F34298], v5, &v18);
    }
  }
  else
  {
    CFBooleanRef v9 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F342A8]];
    CFBooleanRef BOOLean = v9;
    if (v9) {
      CFRetain(v9);
    }
    CFBooleanRef v10 = -[AVPlayer _pendingFigPlayerPropertyForKey:](self, "_pendingFigPlayerPropertyForKey:", *MEMORY[0x1E4F34298], v18);
    CFBooleanRef v18 = v10;
    if (v10) {
      CFRetain(v10);
    }
  }
  if (BOOLean)
  {
    BOOL v16 = CFBooleanGetValue(BOOLean) != 0;
    if (v16) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  if (v18) {
    BOOL v16 = CFBooleanGetValue(v18) != 0;
  }
LABEL_22:
  if (BOOLean) {
    CFRelease(BOOLean);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v16;
}

- (BOOL)_isBufferedAirPlayActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayer__isBufferedAirPlayActive__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayer__isBufferedAirPlayActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 468);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfExternalPlaybackActive
{
  return 0;
}

- (int64_t)externalPlaybackType
{
  if ([(AVPlayer *)self _isAirPlayVideoActive]) {
    return 1;
  }
  if ([(AVPlayer *)self isExternalPlaybackActive]) {
    return 2;
  }
  return 0;
}

- (BOOL)usesDedicatedNotificationQueueForMediaServices
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayer_usesDedicatedNotificationQueueForMediaServices__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVPlayer_usesDedicatedNotificationQueueForMediaServices__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 328);
  return result;
}

- (void)setUsesDedicatedNotificationQueueForMediaServices:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F343E0]];
  }
}

uint64_t __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 328) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __62__AVPlayer_setUsesDedicatedNotificationQueueForMediaServices___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesDedicatedNotificationQueueForMediaServices]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F343E0], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGSize)dimensionsOfReservedVideoMemory
{
  uint64_t v8 = 0;
  char v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_194C75EBF;
  long long v12 = *MEMORY[0x1E4F1DB30];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AVPlayer_dimensionsOfReservedVideoMemory__block_invoke;
  void v7[3] = &unk_1E57B2110;
  v7[4] = self;
  void v7[5] = &v8;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

__n128 __43__AVPlayer_dimensionsOfReservedVideoMemory__block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 336);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (__CFDictionary)_createDictionaryWithDimensionsOfReservedVideoMemory:(CGSize)a3
{
  Mutable = 0;
  if (a3.width != 0.0 && a3.height != 0.0)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    FigCFDictionarySetCGSize();
  }
  return Mutable;
}

- (void)setDimensionsOfReservedVideoMemory:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke;
  block[3] = &unk_1E57B36D0;
  void block[4] = self;
  CGSize v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
  if (v7)
  {
    uint64_t v8 = (__CFDictionary *)v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
  }
  else
  {
    uint64_t v8 = -[AVPlayer _createDictionaryWithDimensionsOfReservedVideoMemory:](self, "_createDictionaryWithDimensionsOfReservedVideoMemory:", width, height);
    [(AVPlayer *)self _setPendingFigPlayerProperty:v8 forKey:*MEMORY[0x1E4F34308]];
    if (!v8) {
      return;
    }
  }
  CFRelease(v8);
}

__n128 __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 336) = result;
  return result;
}

void __47__AVPlayer_setDimensionsOfReservedVideoMemory___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 dimensionsOfReservedVideoMemory];
  double v3 = (const void *)objc_msgSend(v2, "_createDictionaryWithDimensionsOfReservedVideoMemory:");
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, void, const void *))(v6 + 56);
  if (v7) {
    int v8 = v7(FigBaseObject, *MEMORY[0x1E4F34308], v3);
  }
  else {
    int v8 = -12782;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  if (v3)
  {
    CFRelease(v3);
  }
}

- (BOOL)usesAudioOnlyModeForExternalPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayer_usesAudioOnlyModeForExternalPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayer_usesAudioOnlyModeForExternalPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 399);
  return result;
}

- (void)setUsesAudioOnlyModeForExternalPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVPlayer *)self willChangeValueForKey:@"usesAudioOnlyModeForExternalPlayback"];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = v3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    [(AVPlayer *)self didChangeValueForKey:@"usesAudioOnlyModeForExternalPlayback"];
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F343D8]];
    [(AVPlayer *)self didChangeValueForKey:@"usesAudioOnlyModeForExternalPlayback"];
  }
}

uint64_t __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 399) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __52__AVPlayer_setUsesAudioOnlyModeForExternalPlayback___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesAudioOnlyModeForExternalPlayback]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F343D8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfUsesAudioOnlyModeForExternalPlayback
{
  return 0;
}

- (id)outputContext
{
  BOOL v3 = [(AVPlayer *)self _copyFigPlayer];
  CFTypeRef cf = 0;
  uint64_t v4 = *MEMORY[0x1E4F34330];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, void, CFTypeRef *))(v8 + 48);
    if (!v11 || v11(FigBaseObject, v4, *MEMORY[0x1E4F1CF80], &cf)) {
      id v12 = 0;
    }
    else {
      id v12 = +[AVOutputContext outputContextForID:cf];
    }
    CFRelease(v5);
    CFTypeRef v10 = cf;
    if (cf) {
LABEL_12:
    }
      CFRelease(v10);
  }
  else
  {
    id v9 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F34330]];
    if (v9) {
      CFTypeRef v10 = CFRetain(v9);
    }
    else {
      CFTypeRef v10 = 0;
    }
    CFTypeRef cf = v10;
    id v12 = +[AVOutputContext outputContextForID:v10];
    if (v10) {
      goto LABEL_12;
    }
  }
  return v12;
}

- (void)setOutputContext:(id)a3
{
  uint64_t v5 = [a3 contextID];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__AVPlayer_setOutputContext___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
  if (v7)
  {
    uint64_t v8 = v7;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    int v13 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__AVPlayer_setOutputContext___block_invoke_2;
    void v11[3] = &unk_1E57B3A60;
    v11[4] = self;
    void v11[5] = v12;
    void v11[6] = v8;
    dispatch_sync(figConfigurationQueue, v11);
    _Block_object_dispose(v12, 8);
    CFRelease(v8);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v5 forKey:*MEMORY[0x1E4F34330]];
  }
  id v10 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v10) {
    [v10 setOutputContext:a3];
  }
}

void *__29__AVPlayer_setOutputContext___block_invoke(void *result)
{
  int v1 = *(void **)(*(void *)(result[4] + 8) + 232);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    uint64_t result = (id)v2[5];
    *(void *)(*(void *)(v2[4] + 8) + 232) = result;
  }
  return result;
}

void __29__AVPlayer_setOutputContext___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(NSObject **)(*(void *)(v2 + 8) + 56);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__AVPlayer_setOutputContext___block_invoke_3;
  void v11[3] = &unk_1E57B2110;
  v11[4] = v2;
  void v11[5] = &v12;
  av_readwrite_dispatch_queue_read(v3, v11);
  uint64_t v4 = v13[3];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t))(v7 + 56);
  if (v8) {
    int v9 = v8(FigBaseObject, *MEMORY[0x1E4F34330], v4);
  }
  else {
    int v9 = -12782;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  id v10 = (const void *)v13[3];
  if (v10) {
    CFRelease(v10);
  }
  _Block_object_dispose(&v12, 8);
}

CFTypeRef __29__AVPlayer_setOutputContext___block_invoke_3(uint64_t a1)
{
  CFTypeRef result = (CFTypeRef)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 232) contextID];
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_airPlayVideoActive
{
  CFTypeRef cf = 0;
  BOOL v3 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v4 = *MEMORY[0x1E4F34298];
  if (v3)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v10 = *(void (**)(uint64_t, uint64_t, void, CFTypeRef *))(v7 + 48);
    if (v10)
    {
      v10(FigBaseObject, v4, *MEMORY[0x1E4F1CF80], &cf);
      CFBooleanRef v9 = (const __CFBoolean *)cf;
      if (cf) {
        goto LABEL_9;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
LABEL_14:
    CFRelease(v3);
    return (char)v9;
  }
  CFBooleanRef v8 = [(AVPlayer *)self _pendingFigPlayerPropertyForKey:*MEMORY[0x1E4F34298]];
  CFBooleanRef v9 = v8;
  CFTypeRef cf = v8;
  if (!v8) {
    return (char)v9;
  }
  CFRetain(v8);
LABEL_9:
  LOBYTE(v9) = CFBooleanGetValue(v9) != 0;
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    goto LABEL_14;
  }
  return (char)v9;
}

+ (BOOL)automaticallyNotifiesObserversOfAirPlayVideoActive
{
  return 0;
}

- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive
{
  BOOL v3 = usesAirPlayVideoWhileAirPlayScreenIsActive;
  [(AVPlayer *)self willChangeValueForKey:@"usesAirPlayVideoWhileAirPlayScreenIsActive"];
  [(AVPlayer *)self setUsesExternalPlaybackWhileExternalScreenIsActive:v3];
  [(AVPlayer *)self didChangeValueForKey:@"usesAirPlayVideoWhileAirPlayScreenIsActive"];
}

+ (BOOL)automaticallyNotifiesObserversOfUsesAirPlayVideoWhileAirPlayScreenIsActive
{
  return 0;
}

- (void)removeTimeObserver:(id)observer
{
  if (!observer) {
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    CFBooleanRef v8 = @"You did not supply a reference to an object returned by either -addPeriodicTimeObserverForInterval:queue:usingBlock: or -addBoundaryTimeObserverForTimes:queue:usingBlock:";
    goto LABEL_10;
  }
  proxyTimebase = self->_player->proxyTimebase;
  if (proxyTimebase != (OpaqueCMTimebase *)[observer timebase])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    CFBooleanRef v8 = @"An instance of AVPlayer cannot remove a time observer that was added by a different instance of AVPlayer.";
LABEL_10:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
  [observer invalidate];
}

- (void)_removeAllLayers
{
  player = self->_player;
  if (player->figPlayer)
  {
    -[AVPlayer _detachVideoLayersFromFigPlayer:](self, "_detachVideoLayersFromFigPlayer:");
    [(AVPlayer *)self _detachClosedCaptionLayersFromFigPlayer:self->_player->figPlayer];
    [(AVPlayer *)self _detachFigPlayerFromSubtitleLayers];
    player = self->_player;
  }
  [(NSMutableArray *)player->videoLayers removeAllObjects];
  [(NSMutableArray *)self->_player->closedCaptionLayers removeAllObjects];
  [(NSMutableArray *)self->_player->subtitleLayers removeAllObjects];
  [(NSHashTable *)self->_player->avPlayerLayers removeAllObjects];
  playerCaptionLayers = self->_player->playerCaptionLayers;
  [(NSHashTable *)playerCaptionLayers removeAllObjects];
}

- (id)_pixelBufferAttributeMediator
{
  return self->_player->pixelBufferAttributeMediator;
}

- (id)_playerCaptionLayers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  CFBooleanRef v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  layersQ = self->_player->layersQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVPlayer__playerCaptionLayers__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(layersQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __32__AVPlayer__playerCaptionLayers__block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 688) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setOptions:(id)a3 onClosedCaptionLayer:(id)a4
{
  if (a4)
  {
    uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [(AVPlayer *)self _closedCaptionLayers];
      if (v9)
      {
        uint64_t v10 = [v9 indexOfObject:a4];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v11 = v10;
          uint64_t v12 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v12 addEntriesFromDictionary:a3];
          uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
          [v12 setValue:v13 forKey:*MEMORY[0x1E4F33EE0]];
          uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
          uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
          uint64_t v16 = v15 ? v15 : 0;
          uint64_t v17 = *(void (**)(uint64_t, void, void *))(v16 + 56);
          if (v17) {
            v17(FigBaseObject, *MEMORY[0x1E4F34200], v12);
          }
        }
      }
      CFRelease(v8);
    }
  }
}

- (void)_setSeparated:(BOOL)a3 onClosedCaptionLayer:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    BOOL v5 = a3;
    uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [(AVPlayer *)self _closedCaptionLayers];
      if (v9)
      {
        uint64_t v10 = [v9 indexOfObject:a4];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19[0] = *MEMORY[0x1E4F33EF0];
          uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10];
          v19[1] = *MEMORY[0x1E4F33EF8];
          uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1CFD0];
          if (!v5) {
            uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1CFC8];
          }
          uint64_t v13 = *v12;
          v20[0] = v11;
          v20[1] = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
          uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
          uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v16) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          CFBooleanRef v18 = *(void (**)(uint64_t, void, uint64_t))(v17 + 56);
          if (v18) {
            v18(FigBaseObject, *MEMORY[0x1E4F34208], v14);
          }
        }
      }
      CFRelease(v8);
    }
  }
}

- (void)_addPlayerCaptionLayer:(id)a3
{
  BOOL v5 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v17 = 0;
  CFBooleanRef v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v6 = [a3 _closedCaptionLayer];
  uint64_t v7 = (void *)[a3 _subtitleLayer];
  layersQ = self->_player->layersQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVPlayer__addPlayerCaptionLayer___block_invoke;
  block[3] = &unk_1E57B3AA8;
  void block[4] = self;
  void block[5] = v7;
  block[8] = &v13;
  block[9] = &v17;
  void block[6] = v6;
  void block[7] = a3;
  dispatch_sync(layersQ, block);
  if (*((unsigned char *)v14 + 24)) {
    [v7 setPlayer:v5];
  }
  if (*((unsigned char *)v18 + 24))
  {
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__AVPlayer__addPlayerCaptionLayer___block_invoke_2;
    void v11[3] = &unk_1E57B2228;
    v11[4] = self;
    void v11[5] = v5;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v11);
  }
  id v10 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v10)
  {
    objc_msgSend((id)objc_msgSend(a3, "_interstitialLayer"), "setPlayer:", v10);
    if ([(NSString *)[(AVPlayer *)self reasonForWaitingToPlay] isEqualToString:@"AVPlayerWaitingDuringInterstitialEventReason"])
    {
      [a3 _setShowInterstitialInstead:1];
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __35__AVPlayer__addPlayerCaptionLayer___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = addObjectToArray(*(void **)(*(void *)(a1[4] + 8) + 664), a1[5]);
  uint64_t result = addObjectToArray(*(void **)(*(void *)(a1[4] + 8) + 672), a1[6]);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = result;
  if (a1[7])
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 688), "containsObject:");
    if ((result & 1) == 0)
    {
      id v3 = *(void **)(*(void *)(a1[4] + 8) + 688);
      uint64_t v4 = a1[7];
      return [v3 addObject:v4];
    }
  }
  return result;
}

uint64_t __35__AVPlayer__addPlayerCaptionLayer___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return [*(id *)(result + 32) _attachClosedCaptionLayersToFigPlayer];
  }
  return result;
}

- (void)_removePlayerCaptionLayer:(id)a3
{
  BOOL v5 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v17 = 0;
  CFBooleanRef v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v6 = [a3 _closedCaptionLayer];
  uint64_t v7 = (void *)[a3 _subtitleLayer];
  if ([(AVPlayer *)self _interstitialPlayerIfCreated]) {
    uint64_t v8 = (void *)[a3 _interstitialLayer];
  }
  else {
    uint64_t v8 = 0;
  }
  layersQ = self->_player->layersQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlayer__removePlayerCaptionLayer___block_invoke;
  block[3] = &unk_1E57B3AA8;
  void block[4] = self;
  void block[5] = v6;
  block[8] = &v17;
  block[9] = &v13;
  void block[6] = v7;
  void block[7] = a3;
  dispatch_sync(layersQ, block);
  if (*((unsigned char *)v18 + 24))
  {
    if (v5) {
      CFRetain(v5);
    }
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__AVPlayer__removePlayerCaptionLayer___block_invoke_2;
    void v11[3] = &unk_1E57B2228;
    v11[4] = self;
    void v11[5] = v5;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v11);
  }
  if (*((unsigned char *)v14 + 24)) {
    [v7 setPlayer:0];
  }
  if ([(AVPlayer *)self _interstitialPlayerIfCreated]) {
    [v8 setPlayer:0];
  }
  if (v5) {
    CFRelease(v5);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __38__AVPlayer__removePlayerCaptionLayer___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(*(void *)(a1[4] + 8) + 672);
  int v4 = [v3 count];
  [v3 removeObject:v2];
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v4 != [v3 count];
  BOOL v5 = *(void **)(*(void *)(a1[4] + 8) + 664);
  uint64_t v6 = a1[6];
  int v7 = [v5 count];
  [v5 removeObject:v6];
  uint64_t result = [v5 count];
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = v7 != result;
  if (a1[7])
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1[4] + 8) + 688), "containsObject:");
    if (result)
    {
      id v9 = *(void **)(*(void *)(a1[4] + 8) + 688);
      uint64_t v10 = a1[7];
      return [v9 removeObject:v10];
    }
  }
  return result;
}

void __38__AVPlayer__removePlayerCaptionLayer___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _attachClosedCaptionLayersToFigPlayer];
    uint64_t v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

- (__CVBuffer)_copyDisplayedPixelBuffer
{
  return [(AVPlayer *)self _copyDisplayedPixelBuffer:0];
}

- (__CVBuffer)_copyDisplayedPixelBuffer:(id)a3
{
  v15[22] = *MEMORY[0x1E4F143B8];
  [(AVPlayer *)self rate];
  v15[0] = 0;
  if (v5 == 0.0)
  {
    uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
    if (v6)
    {
      int v7 = v6;
      if (a3)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F34478], a3);
      }
      else
      {
        Mutable = 0;
      }
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = *(unsigned int (**)(OpaqueFigPlayer *, __CFDictionary *, void *))(v11 + 152);
      if ((!v12 || v12(v7, Mutable, v15)) && dword_1EB2D3AA0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CFRelease(v7);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
  else if (dword_1EB2D3AA0)
  {
    id v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (__CVBuffer *)v15[0];
}

- (void)_detachFigPlayerFromSubtitleLayers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(AVPlayer *)self _subtitleLayers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setPlayer:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_detachVideoLayersFromFigPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  long long v7 = *(void (**)(uint64_t, void, void))(v6 + 56);
  if (v7) {
    v7(FigBaseObject, *MEMORY[0x1E4F34408], 0);
  }
  self->_player->videoLayersAreAttached = 0;
}

- (void)_detachClosedCaptionLayersFromFigPlayer:(OpaqueFigPlayer *)a3
{
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, void))(v5 + 56);
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F341F0];
    v6(FigBaseObject, v7, 0);
  }
}

- (void)_removeLayer:(id)a3
{
  uint64_t v5 = [a3 _videoLayer];
  uint64_t v6 = [a3 _closedCaptionLayer];
  uint64_t v7 = [a3 _subtitleLayer];
  if ([(AVPlayer *)self _interstitialPlayerIfCreated]) {
    uint64_t v8 = [a3 _interstitialLayer];
  }
  else {
    uint64_t v8 = 0;
  }
  [(AVPlayer *)self _removeLayer:a3 videoLayer:v5 closedCaptionLayer:v6 subtitleLayer:v7 interstitialLayer:v8];
}

- (void)_removeLayer:(id)a3 videoLayer:(id)a4 closedCaptionLayer:(id)a5 subtitleLayer:(id)a6 interstitialLayer:(id)a7
{
  uint64_t v13 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  layersQ = self->_player->layersQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke;
  block[3] = &unk_1E57B3AD0;
  void block[4] = self;
  void block[5] = a4;
  void block[10] = &v26;
  block[11] = &v22;
  void block[6] = a5;
  void block[7] = a6;
  block[8] = a3;
  block[9] = &v30;
  dispatch_sync(layersQ, block);
  if (*((unsigned char *)v31 + 24))
  {
    [(AVPixelBufferAttributeMediator *)self->_player->pixelBufferAttributeMediator removeRequestedPixelBufferAttributesAttributesForKey:a4];
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_2;
    void v20[3] = &unk_1E57B2228;
    v20[4] = self;
    v20[5] = v13;
    dispatch_sync(figConfigurationQueue, v20);
    if (v13) {
      CFRetain(v13);
    }
    stateDispatchQueue = self->_player->stateDispatchQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_3;
    v19[3] = &unk_1E57B2270;
    v19[5] = a3;
    void v19[6] = v13;
    void v19[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v19);
  }
  if (*((unsigned char *)v27 + 24))
  {
    if (v13) {
      CFRetain(v13);
    }
    uint64_t v17 = self->_player->stateDispatchQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_4;
    v18[3] = &unk_1E57B2228;
    v18[4] = self;
    v18[5] = v13;
    AVSerializeOnQueueAsyncIfNecessary(v17, v18);
  }
  if (*((unsigned char *)v23 + 24)) {
    [a6 setPlayer:0];
  }
  if ([(AVPlayer *)self _interstitialPlayerIfCreated]) {
    [a7 setPlayer:0];
  }
  if (v13) {
    CFRelease(v13);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

uint64_t __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 656);
  int v4 = [v3 count];
  [v3 removeObject:v2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v4 != [v3 count];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 672);
  uint64_t v6 = *(void *)(a1 + 48);
  int v7 = [v5 count];
  [v5 removeObject:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v7 != [v5 count];
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 664);
  uint64_t v9 = *(void *)(a1 + 56);
  int v10 = [v8 count];
  [v8 removeObject:v9];
  uint64_t result = [v8 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v10 != result;
  if (*(void *)(a1 + 64))
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 680), "containsObject:");
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 64) _willManageSublayersAsSwappedLayers];
      if ((result & 1) == 0)
      {
        uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 680);
        uint64_t v13 = *(void *)(a1 + 64);
        return [v12 removeObject:v13];
      }
    }
  }
  return result;
}

uint64_t __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) mediatedPixelBufferAttributes];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _updateDecoderPixelBufferAttributes:v2 onFigPlayer:v4];
}

void __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count")
      && (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground] & 1) != 0
       || ([*(id *)(a1 + 32) _hasForegroundLayers] & 1) != 0
       || ([*(id *)(a1 + 32) _isIAPDExtendedModeActive] & 1) != 0
       || ([*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground] & 1) != 0
       || ([*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode] & 1) != 0
       || [*(id *)(a1 + 40) _willManageSublayersAsSwappedLayers]))
    {
      [*(id *)(a1 + 32) _attachVideoLayersToFigPlayer];
    }
    else
    {
      [*(id *)(a1 + 32) _hasForegroundLayers];
      [*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground];
      [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground];
      [*(id *)(a1 + 32) _detachVideoLayersFromFigPlayer:*(void *)(a1 + 48)];
    }
    uint64_t v2 = *(const void **)(a1 + 48);
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void __87__AVPlayer__removeLayer_videoLayer_closedCaptionLayer_subtitleLayer_interstitialLayer___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _attachClosedCaptionLayersToFigPlayer];
    uint64_t v2 = *(const void **)(a1 + 40);
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void __22__AVPlayer__addLayer___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 48)
    && (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground] & 1) != 0
     || ([*(id *)(a1 + 32) _hasForegroundLayers] & 1) != 0
     || ([*(id *)(a1 + 32) _isIAPDExtendedModeActive] & 1) != 0
     || ([*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground] & 1) != 0
     || ([*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode] & 1) != 0
     || [*(id *)(a1 + 40) _willManageSublayersAsSwappedLayers]))
  {
    [*(id *)(a1 + 32) _attachVideoLayersToFigPlayer];
  }
  else
  {
    [*(id *)(a1 + 32) _hasForegroundLayers];
    [*(id *)(a1 + 32) _isVideoPlaybackAllowedWhileInBackground];
    [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground];
  }
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __22__AVPlayer__addLayer___block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return [*(id *)(result + 32) _attachClosedCaptionLayersToFigPlayer];
  }
  return result;
}

- (id)_performanceDictionary
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v36 = 0;
  uint64_t v2 = [(AVPlayer *)self _copyFigPlayer];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, void, void **))(v6 + 48);
    if (v8)
    {
      v8(FigBaseObject, *MEMORY[0x1E4F34318], 0, &v36);
      uint64_t v9 = v36;
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v7 = v9;
    CFRelease(v3);
  }
  else
  {
    id v7 = 0;
  }
  int v10 = (void *)[v7 objectForKey:*MEMORY[0x1E4F33E80]];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v27 = *(void *)v33;
    uint64_t v13 = *MEMORY[0x1E4F34BE0];
    uint64_t v14 = *MEMORY[0x1E4F34BE8];
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = (void *)[v16 objectForKey:v13];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
LABEL_17:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v29 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * v21);
            long long v23 = (void *)[v22 objectForKey:v14];
            if (v23)
            {
              if (![v23 intValue]) {
                break;
              }
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v19) {
                goto LABEL_17;
              }
              goto LABEL_26;
            }
          }
          if (!v22) {
            continue;
          }
          uint64_t v24 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
          [v24 addEntriesFromDictionary:v22];
          return v24;
        }
LABEL_26:
        ;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (void)setExternalPlaybackVideoGravity:(AVLayerVideoGravity)externalPlaybackVideoGravity
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVPlayer_setExternalPlaybackVideoGravity___block_invoke;
  block[3] = &unk_1E57B21B0;
  void block[4] = externalPlaybackVideoGravity;
  void block[5] = self;
  void block[6] = &v6;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    [(AVPlayer *)self _setNeroVideoGravityOnFigPlayer];
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __44__AVPlayer_setExternalPlaybackVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 360)];
  if ((result & 1) == 0)
  {

    uint64_t result = [*(id *)(a1 + 32) copy];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 360) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_addListenersToInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  if (a3)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayer *)self _weakReference];
    uint64_t v7 = *MEMORY[0x1E4F33F48];
    [v5 addListenerWithWeakReference:v6 callback:avplayer_fpInterstitialCoordinatorNotificationCallback name:v7 object:a3 flags:0];
  }
}

- (void)_removeListenersFromInterstitialCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  if (a3)
  {
    id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v6 = [(AVPlayer *)self _weakReference];
    uint64_t v7 = *MEMORY[0x1E4F33F48];
    [v5 removeListenerWithWeakReference:v6 callback:avplayer_fpInterstitialCoordinatorNotificationCallback name:v7 object:a3];
  }
}

- (void)_removeFPListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_player->figPlayer)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVPlayer *)self _weakReference];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVPlayer *)self _fpNotificationNames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 removeListenerWithWeakReference:v4 callback:avplayer_fpNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_player->figPlayer];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_getDisplayVideoRange:(id *)a3 displaySize:(CGSize *)a4 refreshRate:(id *)a5
{
  CFTypeRef cf = 0;
  CGSize v14 = (CGSize)*MEMORY[0x1E4F1DB30];
  uint64_t v8 = [(AVPlayer *)self _copyFigPlayer];
  if (v8)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    long long v12 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v11 + 48);
    if (v12) {
      v12(FigBaseObject, *MEMORY[0x1E4F34248], 0, &cf);
    }
    FPSupport_GetCurrentDisplayModeVideoRangeAndSizeAndFrameRate();
    *a3 = (id)[NSString stringWithUTF8String:FPSupport_GetModeString()];
    *a4 = v14;
    *a5 = (id)[MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
    CFRelease(v8);
    if (cf) {
      CFRelease(cf);
    }
  }
  return v8 != 0;
}

- (BOOL)_shouldLogPerformanceData
{
  return self->_player->logPerformanceData;
}

- (void)_logPerformanceDataForPreviousItem
{
  id v12 = 0;
  uint64_t v2 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, void, id *))(v5 + 48);
  if (v6)
  {
    v6(FigBaseObject, *MEMORY[0x1E4F34320], 0, &v12);
    if (v12)
    {
      uint64_t v7 = [v12 count];
      if (v7 >= 1)
      {
        uint64_t v8 = (void *)[v12 objectAtIndex:v7 - 1];
        if (v8)
        {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "description"), "componentsSeparatedByString:", @"\n");
          uint64_t v10 = [v9 count];
          NSLog(&stru_1EE5969F8.isa);
          if (v10 >= 1)
          {
            for (uint64_t i = 0; i != v10; ++i)
              NSLog(&stru_1EE596A18.isa, [v9 objectAtIndex:i]);
          }
          NSLog(&stru_1EE596A38.isa);
        }
      }
    }
  }
  if (v2) {
    CFRelease(v2);
  }
}

- (id)_copyPerformanceDataForCurrentItem
{
  uint64_t v8 = 0;
  id result = [(AVPlayer *)self _copyFigPlayer];
  if (result)
  {
    id v3 = result;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, void, void, void **))(v6 + 48);
    if (v7) {
      v7(FigBaseObject, *MEMORY[0x1E4F34318], 0, &v8);
    }
    CFRelease(v3);
    return v8;
  }
  return result;
}

- (void)_logPerformanceDataForCurrentItem
{
  id v2 = [(AVPlayer *)self _copyPerformanceDataForCurrentItem];
  if (v2)
  {
    id v6 = v2;
    id v3 = objc_msgSend((id)objc_msgSend(v2, "description"), "componentsSeparatedByString:", @"\n");
    uint64_t v4 = [v3 count];
    NSLog(&stru_1EE5969F8.isa);
    if (v4 >= 1)
    {
      for (uint64_t i = 0; i != v4; ++i)
        NSLog(&stru_1EE596A18.isa, [v3 objectAtIndex:i]);
    }
    NSLog(&stru_1EE596A38.isa);
  }
}

- (void)_setLimitsBandwidthForCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  id v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F342B8]];
  }
}

uint64_t __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 398) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __49__AVPlayer__setLimitsBandwidthForCellularAccess___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _limitsBandwidthForCellularAccess]) {
    id v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F342B8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_limitsBandwidthForCellularAccess
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayer__limitsBandwidthForCellularAccess__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__AVPlayer__limitsBandwidthForCellularAccess__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 398);
  return result;
}

- (void)_setPausesAudioVisualPlaybackInBackground:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  [(AVPlayer *)self setAudiovisualBackgroundPlaybackPolicy:v3];
}

- (BOOL)_pausesAudioVisualPlaybackInBackground
{
  return [(AVPlayer *)self audiovisualBackgroundPlaybackPolicy] == AVPlayerAudiovisualBackgroundPlaybackPolicyPauses;
}

- (AVPlayerAudiovisualBackgroundPlaybackPolicy)audiovisualBackgroundPlaybackPolicy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AVPlayer_audiovisualBackgroundPlaybackPolicy__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  AVPlayerAudiovisualBackgroundPlaybackPolicy v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVPlayer_audiovisualBackgroundPlaybackPolicy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 288);
  return result;
}

+ (void)checkForAvailableHDRModesChanges
{
  uint64_t v3 = [a1 availableHDRModes];
  uint64_t v4 = v3;
  if (previousAvailableHDRModes != v3)
  {
    previousAvailableHDRModes = v3;
    [a1 fireAvailableHDRModesDidChangeNotification];
  }
  if (previousEligibleForHDR != (v4 != 0))
  {
    previousEligibleForHDR = v4 != 0;
    [a1 fireEligibleForHDRPlaybackDidChangeNotification];
  }
}

+ (void)fireAvailableHDRModesDidChangeNotification
{
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = objc_opt_class();
  [v2 postNotificationName:@"AVPlayerAvailableHDRModesDidChangeNotification" object:v3];
}

+ (void)fireEligibleForHDRPlaybackDidChangeNotification
{
  id v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = objc_opt_class();
  [v2 postNotificationName:@"AVPlayerEligibleForHDRPlaybackDidChangeNotification" object:v3];
}

+ (AVPlayerHDRMode)availableHDRModes
{
  AVPlayerHDRMode context = 0;
  AVPlayerHDRMode result = FPSupport_CreateAllVideoRangesSupportedByDisplays();
  if (result)
  {
    CFArrayRef v3 = (const __CFArray *)result;
    v5.length = CFArrayGetCount((CFArrayRef)result);
    v5.location = 0;
    CFArrayApplyFunction(v3, v5, (CFArrayApplierFunction)addToHDRModes, &context);
    CFRelease(v3);
    return context;
  }
  return result;
}

+ (BOOL)eligibleForHDRPlayback
{
  return [a1 availableHDRModes] != 0;
}

- (BOOL)_suppressesAudioRendering
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AVPlayer__suppressesAudioRendering__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVPlayer__suppressesAudioRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 555);
  return result;
}

- (id)_playbackDisplaysForFigPlayer
{
  displaysUsedForPlayback = self->_player->displaysUsedForPlayback;
  if (!displaysUsedForPlayback) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](displaysUsedForPlayback, "count"));
  if ([(NSArray *)self->_player->displaysUsedForPlayback count])
  {
    unint64_t v5 = 0;
    do
      objc_msgSend(v4, "addObject:", objc_msgSend(-[NSArray objectAtIndex:](self->_player->displaysUsedForPlayback, "objectAtIndex:", v5++), "name"));
    while (v5 < [(NSArray *)self->_player->displaysUsedForPlayback count]);
  }
  return v4;
}

- (NSArray)_displaysUsedForPlayback
{
  id v2 = self->_player->displaysUsedForPlayback;
  return v2;
}

- (void)_setDisplaysUsedForPlayback:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];

  self->_player->displaysUsedForPlayback = v4;
}

- (int64_t)_externalProtectionStatusCopiedFromFig
{
  CFTypeRef cf = 0;
  char v3 = [(AVPlayer *)self _copyFigPlayer];
  if (v3
    && ((FigBaseObject = FigPlayerGetFigBaseObject(), (uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v6 = 0)
      : (uint64_t v6 = v5),
        (uint64_t v7 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48)) != 0))
  {
    v7(FigBaseObject, *MEMORY[0x1E4F34288], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v8 = cf;
  }
  else
  {
    CFTypeRef v8 = 0;
  }
  int64_t v9 = [(AVPlayer *)self _extractFPExternalProtectionStatus:v8];
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v3) {
    CFRelease(v3);
  }
  return v9;
}

- (int64_t)_externalProtectionStatus
{
  uint64_t v8 = 0;
  int64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  char v3 = [(AVPlayer *)self _copyFigPlayer];
  if (v3)
  {
    ivarAccessQueue = self->_player->ivarAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__AVPlayer_AVPlayerProtectedContentPrivate___externalProtectionStatus__block_invoke;
    void v7[3] = &unk_1E57B2110;
    v7[4] = self;
    void v7[5] = &v8;
    av_readwrite_dispatch_queue_read(ivarAccessQueue, v7);
    CFRelease(v3);
    int64_t v5 = v9[3];
  }
  else
  {
    int64_t v5 = 0;
    v9[3] = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__AVPlayer_AVPlayerProtectedContentPrivate___externalProtectionStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 472);
  return result;
}

- (void)removeAudioPlaybackRateLimits
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke;
  block[3] = &unk_1E57B1E80;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v4 = [(AVPlayer *)self _copyFigPlayer];
  if (v4)
  {
    int64_t v5 = v4;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke_2;
    void v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = v5;
    dispatch_sync(figConfigurationQueue, v7);
    CFRelease(v5);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:0 forKey:*MEMORY[0x1E4F342E8]];
    [(AVPlayer *)self _setPendingFigPlayerProperty:0 forKey:*MEMORY[0x1E4F342D0]];
  }
}

uint64_t __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 384) = -8388608;
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 388) = 2139095040;
  return result;
}

uint64_t __74__AVPlayer_AVPlayerAudioPlaybackRateLimits__removeAudioPlaybackRateLimits__block_invoke_2(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F342E8];
  v11[0] = [MEMORY[0x1E4F1CA98] null];
  v10[1] = *MEMORY[0x1E4F342D0];
  v11[1] = [MEMORY[0x1E4F1CA98] null];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  int64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void))(v8 + 112);
  if (v9) {
    return v9(v3, v2, 0);
  }
  return result;
}

- (BOOL)isAudioPlaybackEnabledAtAllRates
{
  [(AVPlayer *)self minRateForAudioPlayback];
  if (v3 != -INFINITY) {
    return 0;
  }
  [(AVPlayer *)self maxRateForAudioPlayback];
  return v4 == INFINITY;
}

- (void)setMinRateForAudioPlayback:(float)a3
{
  float v12 = a3;
  float valuePtr = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke;
  block[3] = &unk_1E57B39C8;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  int64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  if (v5)
  {
    CFNumberRef v6 = (CFNumberRef)v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke_2;
    v8[3] = &unk_1E57B3A60;
    v8[4] = self;
    void v8[5] = v9;
    void v8[6] = v6;
    dispatch_sync(figConfigurationQueue, v8);
    _Block_object_dispose(v9, 8);
  }
  else
  {
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
    [(AVPlayer *)self _setPendingFigPlayerProperty:v6 forKey:*MEMORY[0x1E4F342E8]];
  }
  CFRelease(v6);
}

float __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 384) = result;
  return result;
}

uint64_t __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMinRateForAudioPlayback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) minRateForAudioPlayback];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 56);
  if (v7) {
    uint64_t result = v7(FigBaseObject, *MEMORY[0x1E4F342E8], v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)minRateForAudioPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -8388608;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__minRateForAudioPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__minRateForAudioPlayback__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 384);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMaxRateForAudioPlayback:(float)a3
{
  float v12 = a3;
  float valuePtr = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke;
  block[3] = &unk_1E57B39C8;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  if (v5)
  {
    CFNumberRef v6 = (CFNumberRef)v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke_2;
    v8[3] = &unk_1E57B3A60;
    v8[4] = self;
    void v8[5] = v9;
    void v8[6] = v6;
    dispatch_sync(figConfigurationQueue, v8);
    _Block_object_dispose(v9, 8);
  }
  else
  {
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
    [(AVPlayer *)self _setPendingFigPlayerProperty:v6 forKey:*MEMORY[0x1E4F342D0]];
  }
  CFRelease(v6);
}

float __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 388) = result;
  return result;
}

uint64_t __72__AVPlayer_AVPlayerAudioPlaybackRateLimits__setMaxRateForAudioPlayback___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) maxRateForAudioPlayback];
  uint64_t v3 = objc_msgSend(v2, "numberWithFloat:");
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 56);
  if (v7) {
    uint64_t result = v7(FigBaseObject, *MEMORY[0x1E4F342D0], v3);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (float)maxRateForAudioPlayback
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 2139095040;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__maxRateForAudioPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __68__AVPlayer_AVPlayerAudioPlaybackRateLimits__maxRateForAudioPlayback__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 388);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_sniffUIApplicationOnce != -1) {
    dispatch_once(&_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_sniffUIApplicationOnce, &__block_literal_global_880);
  }
  if (_applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_uiApplicationClass)
  {
    int v3 = SBSGetScreenLockStatus();
    if (v3)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = [(AVPlayer *)self _videoLayers];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        uint64_t v8 = *MEMORY[0x1E4F39E60];
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "context"), "options"), "objectForKey:", v8);
            if (v10 && ![v10 isEqualToString:@"LCD"])
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v3) = [(AVPlayer *)self isExternalPlaybackActive];
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

Class __105__AVPlayer_AVPlayerMultitaskSupport___applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uiapplication.isa);
  _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock_uiApplicationClass = (uint64_t)result;
  return result;
}

- (BOOL)_hasAssociatedOnscreenAVPlayerLayer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(AVPlayer *)self _videoLayers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) context])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

+ (BOOL)isIAPDExtendedModeActive
{
  uint64_t state64 = 0;
  int out_token = 0;
  uint32_t v2 = notify_register_check("com.apple.iapd.notify.extendedMode", &out_token);
  BOOL result = 0;
  if (!v2)
  {
    int v4 = 0;
    notify_check(out_token, &v4);
    if (v4) {
      notify_get_state(out_token, &state64);
    }
    notify_cancel(out_token);
    return state64 == 1;
  }
  return result;
}

- (BOOL)_isIAPDExtendedModeActive
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if (AVPlayerInitializeIAPD_onceToken != -1) {
    dispatch_once(&AVPlayerInitializeIAPD_onceToken, &__block_literal_global_1270);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AVPlayerGetCachedIAPDModeActive_block_invoke;
  block[3] = &unk_1E57B3D90;
  void block[4] = &v5;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sAVPlayerIAPDReadWriteQueue, block);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_carplayIsActive
{
  return +[AVExternalDevice currentCarPlayExternalDevice] != 0;
}

- (BOOL)_canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:(int64_t)a3
{
  if (a3 == 1) {
    return objc_msgSend((id)objc_msgSend(-[AVPlayer _playbackCoordinatorWithoutTriggeringFullSetup](self, "_playbackCoordinatorWithoutTriggeringFullSetup", v3, v4), "otherParticipants"), "count") != 0;
  }
  else {
    return a3 == 3;
  }
}

- (int64_t)_itemOkayToPlayWhileTransitioningToBackground:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_CFMZEnabled()
    || !objc_msgSend(-[AVPlayer _videoLayers](self, "_videoLayers"), "count")
    || [(AVPlayer *)self _airPlayVideoActive]
    || [(AVPlayer *)self _CALayerDestinationIsTVOut]
    || [(AVPlayer *)self _hasAssociatedAVPlayerLayerInPIPMode]
    || [(AVPlayer *)self _carplayIsActive]
    || [(AVPlayer *)self _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock])
  {
    [(AVPlayer *)self audiovisualBackgroundPlaybackPolicy];
  }
  else
  {
    BOOL v7 = [(AVPlayer *)self _isIAPDExtendedModeActive];
    AVPlayerAudiovisualBackgroundPlaybackPolicy v8 = [(AVPlayer *)self audiovisualBackgroundPlaybackPolicy];
    if (!v7
      && ![(AVPlayer *)self _canContinuePlaybackInBackgrounBasedOnAudiovisualBackgroundPlaybackPolicy:v8])
    {
      uint64_t v9 = [a3 status];
      if (!v9) {
        return 2;
      }
      if (v9 != 1) {
        return 0;
      }
      long long v10 = (void *)[a3 tracks];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        int64_t v5 = 1;
LABEL_17:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "assetTrack"), "mediaType"), "isEqualToString:", @"vide"))
          {
            if ((objc_msgSend((id)objc_msgSend(a3, "asset"), "_isStreaming") & 1) != 0
              || ([v15 isEnabled] & 1) != 0)
            {
              return 0;
            }
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v12) {
              goto LABEL_17;
            }
            return v5;
          }
        }
      }
    }
  }
  return 1;
}

- (BOOL)_shouldDetachVideoLayersFromFigPlayer
{
  if ([(AVPlayer *)self _hasAssociatedAVPlayerLayerInPIPMode]
    || [(AVPlayer *)self _applicationHasExternallyDisplayedAVPlayerLayerAndIsUnderDeviceLock]|| [(AVPlayer *)self _isIAPDExtendedModeActive])
  {
    return 0;
  }
  if ([(AVApplicationStateMonitor *)self->_player->applicationStateMonitor isHostApplicationInForeground])
  {
    return ![(AVPlayer *)self _hasForegroundLayers];
  }
  return 1;
}

- (id)_acquireBackgroundAssertion
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F96318]);
  uint64_t v3 = [MEMORY[0x1E4F96478] currentProcess];
  v7[0] = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
  id v4 = (id)objc_msgSend(v2, "initWithExplanation:target:attributes:", @"AVPlayer background assertion", v3, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
  uint64_t v6 = 0;
  if ([v4 acquireWithError:&v6]) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)_didEnterBackground:(id)a3
{
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke;
  v4[3] = &unk_1E57B1E80;
  v4[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v4);
}

void __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) setHostApplicationInForeground:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 778) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) _acquireBackgroundAssertion];
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  uint64_t v4 = *(void *)(a1 + 32);
  int64_t v5 = *(NSObject **)(*(void *)(v4 + 8) + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke_2;
  v6[3] = &unk_1E57B2098;
  v6[4] = v4;
  void v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void *__58__AVPlayer_AVPlayerMultitaskSupport___didEnterBackground___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 778) && ([*(id *)(v2 + 544) isHostApplicationInForeground] & 1) == 0) {
    [*(id *)(a1 + 32) _didFinishSuspension:0];
  }
  BOOL result = *(void **)(a1 + 40);
  if (result)
  {
    return (void *)[result invalidate];
  }
  return result;
}

- (void)_detachVideoLayersForSuspension
{
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke;
  v3[3] = &unk_1E57B1E80;
  v3[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v3);
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 778) = 0;
  [*(id *)(a1 + 32) rate];
  if (v3 != 0.0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_2;
    v5[3] = &unk_1E57B1E80;
    v5[4] = *(void *)(a1 + 32);
    AVEnsureNotOnMainThread(v5);
  }
  if ([*(id *)(a1 + 32) _hasAssociatedOnscreenAVPlayerLayer]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 777) = 1;
  }
  if (v2)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayers"), "count"))
    {
      CFRetain(v2);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_4;
      v4[3] = &unk_1E57B2228;
      v4[4] = *(void *)(a1 + 32);
      void v4[5] = v2;
      AVEnsureNotOnMainThread(v4);
    }
    CFRelease(v2);
  }
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_itemOkayToPlayWhileTransitioningToBackground:", objc_msgSend(*(id *)(a1 + 32), "currentItem"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(v3 + 8) + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_3;
  v5[3] = &unk_1E57B2228;
  v5[4] = v3;
  void v5[5] = v2;
  AVSerializeOnQueueAsyncIfNecessary(v4, v5);
}

uint64_t __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground])char v2 = objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers"); {
  else
  }
    char v2 = 0;
  uint64_t result = [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode];
  if ((v2 & 1) == 0 && (result & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4 == 2)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 776) = 1;
    }
    else if (!v4)
    {
      int64_t v5 = *(void **)(a1 + 32);
      long long v6 = *MEMORY[0x1E4F1F9F8];
      uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      uint64_t result = [v5 _setRate:&v6 withVolumeRampDuration:0 playImmediately:25 rateChangeReason:1 affectsCoordinatedPlayback:0.0];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 779) = 1;
  }
  return result;
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldDetachVideoLayersFromFigPlayer])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    long long v2 = *(_OWORD *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
    v5[1] = 3221225472;
    v5[2] = __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_5;
    v5[3] = &unk_1E57B2228;
    long long v6 = v2;
    AVSerializeOnQueueAsyncIfNecessary(v3, v5);
  }
  else
  {
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

void __69__AVPlayer_AVPlayerMultitaskSupport___detachVideoLayersForSuspension__block_invoke_5(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground])char v2 = objc_msgSend(*(id *)(a1 + 32), "_hasForegroundLayers"); {
  else
  }
    char v2 = 0;
  char v3 = [*(id *)(a1 + 32) _hasAssociatedAVPlayerLayerInPIPMode];
  if ((v2 & 1) == 0 && (v3 & 1) == 0) {
    [*(id *)(a1 + 32) _detachVideoLayersFromFigPlayer:*(void *)(a1 + 40)];
  }
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (BOOL)_rateUpdateDuringTransitionDecided
{
  return self->_player->rateUpdateDuringTransitionDecided;
}

- (void)_willEnterForeground:(id)a3
{
  [(AVApplicationStateMonitor *)self->_player->applicationStateMonitor setHostApplicationInForeground:1];
  stateDispatchQueue = self->_player->stateDispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AVPlayer_AVPlayerMultitaskSupport___willEnterForeground___block_invoke;
  v5[3] = &unk_1E57B1E80;
  void v5[4] = self;
  AVSerializeOnQueueAsyncIfNecessary(stateDispatchQueue, v5);
}

uint64_t __59__AVPlayer_AVPlayerMultitaskSupport___willEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 544) isHostApplicationInForeground];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 _ensureVideoLayersAreAttached];
  }
  return result;
}

- (void)_setWantsVolumeChangesWhenPausedOrInactive:(BOOL)a3
{
  char v3 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    char v3 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = *MEMORY[0x1E4F34428];
  if (self->_player->figPlayer)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56);
    if (v11)
    {
      v11(FigBaseObject, v5, v4);
    }
  }
  else
  {
    uint64_t v9 = *v3;
    uint64_t v10 = *MEMORY[0x1E4F34428];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v9 forKey:v10];
  }
}

- (void)_setEQPreset:(int)a3
{
  int valuePtr = a3;
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  uint64_t v5 = *MEMORY[0x1E4F34268];
  if (self->_player->figPlayer)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, CFNumberRef))(v8 + 56);
    if (v9) {
      v9(FigBaseObject, v5, v4);
    }
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v4 forKey:*MEMORY[0x1E4F34268]];
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (void)_setStoppingFadeOutDuration:(float)a3
{
  float valuePtr = a3;
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
  uint64_t v5 = *MEMORY[0x1E4F343C0];
  if (self->_player->figPlayer)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, CFNumberRef))(v8 + 56);
    if (v9) {
      v9(FigBaseObject, v5, v4);
    }
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v4 forKey:*MEMORY[0x1E4F343C0]];
  }
  CFRelease(v4);
}

- (id)_clientName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__AVPlayer_AVPlayerSupportForMediaPlayer___clientName__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVPlayer_AVPlayerSupportForMediaPlayer___clientName__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 432);
  return result;
}

- (void)_setClientName:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    void v10[2] = 0x2020000000;
    int v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke_2;
    void v9[3] = &unk_1E57B3A60;
    v9[4] = self;
    void v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:a3 forKey:*MEMORY[0x1E4F341E0]];
  }
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 432) = *(void *)(result + 40);
  return result;
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___setClientName___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientName];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F341E0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_clientPriority
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayer_AVPlayerSupportForMediaPlayer___clientPriority__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVPlayer_AVPlayerSupportForMediaPlayer___clientPriority__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 456);
  return result;
}

- (void)_setClientPriority:(int64_t)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [(AVPlayer *)self _setPendingFigPlayerProperty:v9 forKey:*MEMORY[0x1E4F341E8]];
  }
}

uint64_t __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 456) = *(void *)(result + 40);
  return result;
}

uint64_t __62__AVPlayer_AVPlayerSupportForMediaPlayer___setClientPriority___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_clientPriority"));
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F341E8], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setCALayerDestinationIsTVOut:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34410]];
  }
}

uint64_t __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 403) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __73__AVPlayer_AVPlayerSupportForMediaPlayer___setCALayerDestinationIsTVOut___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _CALayerDestinationIsTVOut]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34410], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_CALayerDestinationIsTVOut
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_AVPlayerSupportForMediaPlayer___CALayerDestinationIsTVOut__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__AVPlayer_AVPlayerSupportForMediaPlayer___CALayerDestinationIsTVOut__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 403);
  return result;
}

uint64_t __74__AVPlayer_AVPlayerSupportForMediaPlayer___updateConnectionToSecondScreen__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 469) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
}

- (BOOL)_preventsSleepDuringVideoPlayback
{
  return ![(AVPlayer *)self _CALayerDestinationIsTVOut];
}

uint64_t __85__AVPlayer_AVPlayerSupportForMediaPlayer___setDisallowsVideoLayerDisplayCompositing___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _disallowsVideoLayerDisplayCompositing]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34238], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerSupportForMediaPlayer___disallowsVideoLayerDisplayCompositing__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __81__AVPlayer_AVPlayerSupportForMediaPlayer___disallowsVideoLayerDisplayCompositing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 406);
  return result;
}

- (void)_setPreferredLanguageList:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F34350];
  if (self->_player->figPlayer)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    char v9 = *(void (**)(uint64_t, uint64_t, id))(v7 + 56);
    if (v9)
    {
      v9(FigBaseObject, v4, a3);
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F34350];
    [(AVPlayer *)self _setPendingFigPlayerProperty:a3 forKey:v8];
  }
}

- (BOOL)_resumePlayback:(double)a3 error:(id *)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    if (*(void *)(v9 + 104))
    {
      v31[0] = *MEMORY[0x1E4F34448];
      CMTimeMakeWithSeconds(&v29, a3, 1000);
      CFDictionaryRef v11 = NSDictionaryFromCMTime(&v29);
      uint64_t v12 = *MEMORY[0x1E4F34468];
      v32[0] = v11;
      v32[1] = &unk_1EE5E1788;
      uint64_t v13 = *MEMORY[0x1E4F34450];
      v31[1] = v12;
      v31[2] = v13;
      v32[2] = *MEMORY[0x1E4F1CFD0];
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      long long v23 = *(uint64_t (**)(OpaqueFigPlayer *, uint64_t, float))(v16 + 104);
      if (v23)
      {
        int v24 = v23(v7, v14, 1.0);
        if (!v24) {
          goto LABEL_28;
        }
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      if (*(void *)(v18 + 56))
      {
        CMTimeMakeWithSeconds(&v28, a3, 1000);
        uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v19) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
        uint64_t v26 = *(uint64_t (**)(OpaqueFigPlayer *, CMTime *, float))(v20 + 56);
        if (v26)
        {
          CMTime v30 = v28;
          int v24 = v26(v7, &v30, 1.0);
          if (!v24)
          {
LABEL_28:
            BOOL v10 = 1;
LABEL_32:
            CFRelease(v7);
            return v10;
          }
LABEL_30:
          BOOL v10 = 0;
          if (a4) {
            *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v24 userInfo:0];
          }
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
        char v25 = *(uint64_t (**)(OpaqueFigPlayer *, float))(v22 + 40);
        if (v25)
        {
          int v24 = v25(v7, 1.0);
          if (!v24) {
            goto LABEL_28;
          }
          goto LABEL_30;
        }
      }
    }
    int v24 = -12782;
    goto LABEL_30;
  }
  return 0;
}

- (BOOL)allowsPixelBufferPoolSharing
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerPixelBufferPoolSharing__allowsPixelBufferPoolSharing__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AVPlayer_AVPlayerPixelBufferPoolSharing__allowsPixelBufferPoolSharing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 400);
  return result;
}

- (void)setAllowsPixelBufferPoolSharing:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34170]];
  }
}

uint64_t __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 400) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __76__AVPlayer_AVPlayerPixelBufferPoolSharing__setAllowsPixelBufferPoolSharing___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) allowsPixelBufferPoolSharing]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34170], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)disallowsAMRAudio
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__AVPlayer_AVPlayerFormatRestrictions__disallowsAMRAudio__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__AVPlayer_AVPlayerFormatRestrictions__disallowsAMRAudio__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 401);
  return result;
}

- (void)setDisallowsAMRAudio:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34388]];
  }
}

uint64_t __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 401) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __61__AVPlayer_AVPlayerFormatRestrictions__setDisallowsAMRAudio___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) disallowsAMRAudio]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34388], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)disallowsHardwareAcceleratedVideoDecoder
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__AVPlayer_AVPlayerFormatRestrictions__disallowsHardwareAcceleratedVideoDecoder__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __80__AVPlayer_AVPlayerFormatRestrictions__disallowsHardwareAcceleratedVideoDecoder__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 402);
  return result;
}

- (void)setDisallowsHardwareAcceleratedVideoDecoder:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFC8];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFD0];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34270]];
  }
}

uint64_t __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 402) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __84__AVPlayer_AVPlayerFormatRestrictions__setDisallowsHardwareAcceleratedVideoDecoder___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) disallowsHardwareAcceleratedVideoDecoder]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34270], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __91__AVPlayer_AVPlayerAutomaticMediaSelection__setAppliesMediaSelectionCriteriaAutomatically___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "appliesMediaSelectionCriteriaAutomatically"));
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34190], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)appliesMediaSelectionCriteriaAutomatically
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerAutomaticMediaSelection__appliesMediaSelectionCriteriaAutomatically__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __87__AVPlayer_AVPlayerAutomaticMediaSelection__appliesMediaSelectionCriteriaAutomatically__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 397);
  return result;
}

- (void)setMediaSelectionCriteria:(AVPlayerMediaSelectionCriteria *)criteria forMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  if (mediaCharacteristic)
  {
    ivarAccessQueue = self->_player->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke;
    block[3] = &unk_1E57B2138;
    void block[4] = self;
    void block[5] = criteria;
    void block[6] = mediaCharacteristic;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke_2;
    void v7[3] = &unk_1E57B1E80;
    v7[4] = self;
    dispatch_sync(figConfigurationQueue, v7);
  }
}

uint64_t __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1[4] + 8) + 632) mutableCopy];
  if (!v2) {
    id v2 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  char v3 = (void *)a1[5];
  if (v3) {
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(v3, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(a1[6]));
  }
  else {
    [v2 removeObjectForKey:AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(a1[6])];
  }

  uint64_t result = [v2 copy];
  *(void *)(*(void *)(a1[4] + 8) + 632) = result;
  return result;
}

void __94__AVPlayer_AVPlayerAutomaticMediaSelection__setMediaSelectionCriteria_forMediaCharacteristic___block_invoke_2(uint64_t a1)
{
  id v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  uint64_t v3 = [*(id *)(a1 + 32) _cachedMediaSelectionCriteria];
  if (v2)
  {
    uint64_t v4 = v3;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, void, uint64_t))(v7 + 56);
    if (v8) {
      v8(FigBaseObject, *MEMORY[0x1E4F342E0], v4);
    }
    CFRelease(v2);
  }
}

- (AVPlayerMediaSelectionCriteria)mediaSelectionCriteriaForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  uint64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  id v6 = [(AVPlayer *)self _cachedMediaSelectionCriteria];
  if (v5)
  {
    BOOL v14 = 0;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    BOOL v10 = *(void (**)(uint64_t, void, void, void **))(v9 + 48);
    if (v10)
    {
      v10(FigBaseObject, *MEMORY[0x1E4F342E0], *MEMORY[0x1E4F1CF80], &v14);
      CFDictionaryRef v11 = v14;
    }
    else
    {
      CFDictionaryRef v11 = 0;
    }
    id v6 = v11;
  }
  if (!v6)
  {
    int v12 = 0;
    if (!v5) {
      return v12;
    }
    goto LABEL_13;
  }
  int v12 = (AVPlayerMediaSelectionCriteria *)[v6 objectForKey:AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)mediaCharacteristic)];
  if (v12) {
    int v12 = [[AVPlayerMediaSelectionCriteria alloc] initWithFigDictionary:v12];
  }
  if (v5) {
LABEL_13:
  }
    CFRelease(v5);
  return v12;
}

- (id)defaultMediaSelectionCriteriaForMediaCharacteristic:(id)a3
{
  uint64_t v4 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v5 = v4;
  if (!a3)
  {
    if (!v4) {
      return a3;
    }
    goto LABEL_16;
  }
  id v13 = 0;
  if (v4)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t, void, void, id *))(v8 + 48);
    if (v9)
    {
      v9(FigBaseObject, *MEMORY[0x1E4F34218], *MEMORY[0x1E4F1CF80], &v13);
      id v10 = v13;
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;
    if (v13)
    {
      a3 = (id)[v13 objectForKey:AVTranslateAVMediaCharacteristicToFigMediaCharacteristic((uint64_t)a3)];
      if (a3) {
        a3 = [[AVPlayerMediaSelectionCriteria alloc] initWithFigDictionary:a3];
      }
    }
    else
    {
      a3 = 0;
    }
LABEL_16:
    CFRelease(v5);
    return a3;
  }
  return 0;
}

- (NSString)audioOutputDeviceUniqueID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayer_AVPlayerAudioDeviceSupport__audioOutputDeviceUniqueID__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = (NSString *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__AVPlayer_AVPlayerAudioDeviceSupport__audioOutputDeviceUniqueID__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 424);
  return result;
}

- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = audioOutputDeviceUniqueID;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    void v10[2] = 0x2020000000;
    int v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke_2;
    void v9[3] = &unk_1E57B3A60;
    v9[4] = self;
    void v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:audioOutputDeviceUniqueID forKey:*MEMORY[0x1E4F341A8]];
  }
}

uint64_t __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 424) = *(void *)(result + 40);
  return result;
}

uint64_t __69__AVPlayer_AVPlayerAudioDeviceSupport__setAudioOutputDeviceUniqueID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) audioOutputDeviceUniqueID];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F341A8], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSwitchStreamVariants
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AVPlayer_AVPlayerAudioDeviceSupport__autoSwitchStreamVariants__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__AVPlayer_AVPlayerAudioDeviceSupport__autoSwitchStreamVariants__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 392);
  return result;
}

- (void)setAutoSwitchStreamVariants:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F341B8]];
  }
}

uint64_t __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 392) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __68__AVPlayer_AVPlayerAudioDeviceSupport__setAutoSwitchStreamVariants___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) autoSwitchStreamVariants]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F341B8], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)automaticallyNotifiesObserversOfAutoSwitchStreamVariants
{
  return 0;
}

- (BOOL)preparesItemsForPlaybackAsynchronously
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerAudioDeviceSupport__preparesItemsForPlaybackAsynchronously__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayer_AVPlayerAudioDeviceSupport__preparesItemsForPlaybackAsynchronously__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 393);
  return result;
}

- (void)setPreparesItemsForPlaybackAsynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34368]];
  }
}

uint64_t __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 393) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __82__AVPlayer_AVPlayerAudioDeviceSupport__setPreparesItemsForPlaybackAsynchronously___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) preparesItemsForPlaybackAsynchronously]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34368], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)allowsOutOfBandTextTrackRendering
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__AVPlayer_AVPlayerOutOfBandTextTrackRendering__allowsOutOfBandTextTrackRendering__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __82__AVPlayer_AVPlayerOutOfBandTextTrackRendering__allowsOutOfBandTextTrackRendering__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 394);
  return result;
}

- (void)setAllowsOutOfBandTextTrackRendering:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    uint64_t v7 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v7);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      char v9 = (void *)MEMORY[0x1E4F1CFC8];
    }
    [(AVPlayer *)self _setPendingFigPlayerProperty:*v9 forKey:*MEMORY[0x1E4F34168]];
  }
}

uint64_t __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 394) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __86__AVPlayer_AVPlayerOutOfBandTextTrackRendering__setAllowsOutOfBandTextTrackRendering___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) allowsOutOfBandTextTrackRendering]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34168], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __76__AVPlayer_AVPlayerMultichannelAudioStrategy__setMultichannelAudioStrategy___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) multichannelAudioStrategy];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F342F0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)multichannelAudioStrategy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerMultichannelAudioStrategy__multichannelAudioStrategy__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  BOOL v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __72__AVPlayer_AVPlayerMultichannelAudioStrategy__multichannelAudioStrategy__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 448);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionPipelineStrategy:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__AVPlayer_AVPlayerCaptionStrategySelection__setCaptionPipelineStrategy___block_invoke;
  void v14[3] = &unk_1E57B2098;
  v14[4] = self;
  void v14[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v14);
  id v6 = (id)[a3 copy];
  uint64_t v7 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v8 = *MEMORY[0x1E4F341D0];
  if (v7)
  {
    char v9 = v7;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = *(void (**)(uint64_t, uint64_t, id))(v12 + 56);
    if (v13) {
      v13(FigBaseObject, v8, v6);
    }
    CFRelease(v9);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v6 forKey:*MEMORY[0x1E4F341D0]];
  }
}

id __73__AVPlayer_AVPlayerCaptionStrategySelection__setCaptionPipelineStrategy___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 416) = result;
  return result;
}

- (NSString)captionPipelineStrategy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVPlayer_AVPlayerCaptionStrategySelection__captionPipelineStrategy__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  BOOL v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __69__AVPlayer_AVPlayerCaptionStrategySelection__captionPipelineStrategy__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 416);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionRenderingStrategy:(id)a3
{
  id v4 = (id)[a3 copy];
  uint64_t v5 = *MEMORY[0x1E4F341D8];
  if (!self->_player->figPlayer)
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v4 forKey:*MEMORY[0x1E4F341D8]];
LABEL_8:
    self->_player->captionRenderingStrategy = (NSString *)v4;
    return;
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = *(unsigned int (**)(uint64_t, uint64_t, id))(v8 + 56);
  if (v9 && !v9(FigBaseObject, v5, v4)) {
    goto LABEL_8;
  }
}

- (NSString)captionRenderingStrategy
{
  return self->_player->captionRenderingStrategy;
}

- (void)_setPreservesAudioSessionSampleRate:(BOOL)a3
{
  player = self->_player;
  if (!player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set preservesAudioSessionSampleRate after the AVPlayer has begun preparing for playback." userInfo:0]);
  }
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__AVPlayer_AVPlayerAudioSessionParticipant___setPreservesAudioSessionSampleRate___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

uint64_t __81__AVPlayer_AVPlayerAudioSessionParticipant___setPreservesAudioSessionSampleRate___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 552) = *(unsigned char *)(result + 40);
  return result;
}

- (uint64_t)preferredVideoDecoderGPURegistryID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AVPlayer_AVPlayerVideoDecoderGPUSupport__preferredVideoDecoderGPURegistryID__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __78__AVPlayer_AVPlayerVideoDecoderGPUSupport__preferredVideoDecoderGPURegistryID__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 528);
  return result;
}

- (void)setPreferredVideoDecoderGPURegistryID:(uint64_t)preferredVideoDecoderGPURegistryID
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke;
  block[3] = &unk_1E57B2228;
  void block[4] = self;
  void block[5] = preferredVideoDecoderGPURegistryID;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  if (v5)
  {
    SInt64 = v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke_2;
    v8[3] = &unk_1E57B3A60;
    v8[4] = self;
    void v8[5] = v9;
    void v8[6] = SInt64;
    dispatch_sync(figConfigurationQueue, v8);
    _Block_object_dispose(v9, 8);
  }
  else
  {
    SInt64 = (const void *)FigCFNumberCreateSInt64();
    [(AVPlayer *)self _setPendingFigPlayerProperty:SInt64 forKey:*MEMORY[0x1E4F34360]];
    if (!SInt64) {
      return;
    }
  }
  CFRelease(SInt64);
}

uint64_t __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 528) = *(void *)(result + 40);
  return result;
}

void __82__AVPlayer_AVPlayerVideoDecoderGPUSupport__setPreferredVideoDecoderGPURegistryID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredVideoDecoderGPURegistryID];
  SInt64 = (const void *)FigCFNumberCreateSInt64();
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, const void *))(v5 + 56);
  if (v6) {
    int v7 = v6(FigBaseObject, *MEMORY[0x1E4F34360], SInt64);
  }
  else {
    int v7 = -12782;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (SInt64)
  {
    CFRelease(SInt64);
  }
}

- (void)setLoggingIdentifier:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__AVPlayer_AVPlayerLoggingIdentifier__setLoggingIdentifier___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

void *__60__AVPlayer_AVPlayerLoggingIdentifier__setLoggingIdentifier___block_invoke(void *result)
{
  int v1 = *(void **)(*(void *)(result[4] + 8) + 624);
  if (v1 != (void *)result[5])
  {
    uint64_t v2 = result;

    id result = (id)v2[5];
    *(void *)(*(void *)(v2[4] + 8) + 624) = result;
  }
  return result;
}

- (void)_setDisallowsAutoPauseOnRouteRemovalIfNoAudio:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___setDisallowsAutoPauseOnRouteRemovalIfNoAudio___block_invoke;
  v15[3] = &unk_1E57B20E8;
  void v15[4] = self;
  BOOL v16 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v15);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  int v7 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    int v7 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *v7;
  uint64_t v9 = *MEMORY[0x1E4F34230];
  if (v6)
  {
    int v10 = v6;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 56);
    if (v14) {
      v14(FigBaseObject, v9, v8);
    }
    CFRelease(v10);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v8 forKey:*MEMORY[0x1E4F34230]];
  }
}

uint64_t __91__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___setDisallowsAutoPauseOnRouteRemovalIfNoAudio___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 536) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)_disallowsAutoPauseOnRouteRemovalIfNoAudio
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___disallowsAutoPauseOnRouteRemovalIfNoAudio__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __87__AVPlayer_AVPlayerAutoPauseOnRouteRemoval___disallowsAutoPauseOnRouteRemovalIfNoAudio__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 536);
  return result;
}

- (void)_setEnsuresActiveAudioSessionWhenStartingPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(AVPlayer *)self _setPendingFigPlayerProperty:*v6 forKey:*MEMORY[0x1E4F34278]];
  int v7 = [(AVPlayer *)self _copyFigPlayer];
  if (v7)
  {
    uint64_t v8 = v7;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke_2;
    void v10[3] = &unk_1E57B3A60;
    v10[4] = self;
    void v10[5] = v11;
    void v10[6] = v8;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
}

uint64_t __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 537) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __92__AVPlayer_AVPlayerImplicitInterruption___setEnsuresActiveAudioSessionWhenStartingPlayback___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _ensuresActiveAudioSessionWhenStartingPlayback]) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34278], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_ensuresActiveAudioSessionWhenStartingPlayback
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__AVPlayer_AVPlayerImplicitInterruption___ensuresActiveAudioSessionWhenStartingPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__AVPlayer_AVPlayerImplicitInterruption___ensuresActiveAudioSessionWhenStartingPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 537);
  return result;
}

- (NSString)_STSLabel
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  int v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVPlayer_AVPlayerSTSLabel___STSLabel__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__AVPlayer_AVPlayerSTSLabel___STSLabel__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 440);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setSTSLabel:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = self;
  void block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v6)
  {
    int v7 = v6;
    v10[0] = 0;
    v10[1] = v10;
    void v10[2] = 0x2020000000;
    int v11 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke_2;
    void v9[3] = &unk_1E57B3A60;
    v9[4] = self;
    void v9[5] = v10;
    v9[6] = v7;
    dispatch_sync(figConfigurationQueue, v9);
    _Block_object_dispose(v10, 8);
    CFRelease(v7);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:a3 forKey:*MEMORY[0x1E4F343A0]];
  }
}

id __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 440) = result;
  return result;
}

uint64_t __43__AVPlayer_AVPlayerSTSLabel___setSTSLabel___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _STSLabel];
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F343A0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)prefersPlayingSilentlyWhenConflictingWithOtherPlayback
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__AVPlayer_AVPlayerPIPSupport__prefersPlayingSilentlyWhenConflictingWithOtherPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __86__AVPlayer_AVPlayerPIPSupport__prefersPlayingSilentlyWhenConflictingWithOtherPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 554);
  return result;
}

- (void)setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v3) {
    int v7 = &unk_1EE5E17A0;
  }
  else {
    int v7 = &unk_1EE5E1740;
  }
  if (v6)
  {
    uint64_t v8 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke_1058;
    void v10[3] = &unk_1E57B3B20;
    void v10[5] = v11;
    void v10[6] = v8;
    v10[4] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v7 forKey:*MEMORY[0x1E4F34220]];
  }
}

uint64_t __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 554) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __90__AVPlayer_AVPlayerPIPSupport__setPrefersPlayingSilentlyWhenConflictingWithOtherPlayback___block_invoke_1058(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34220], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSilencedDueToConflictWithOtherPlayback
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVPlayer_AVPlayerPIPSupport__isSilencedDueToConflictWithOtherPlayback__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __72__AVPlayer_AVPlayerPIPSupport__isSilencedDueToConflictWithOtherPlayback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 557);
  return result;
}

- (BOOL)_silencesOtherPlaybackDuringPIP
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVPlayer_AVPlayerPIPSupport___silencesOtherPlaybackDuringPIP__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVPlayer_AVPlayerPIPSupport___silencesOtherPlaybackDuringPIP__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8)
                                                                            + 553);
  return result;
}

- (void)_setSilencesOtherPlaybackDuringPIP:(BOOL)a3
{
  BOOL v3 = a3;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v14 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v6 = [(AVPlayer *)self _copyFigPlayer];
  if (v3) {
    int v7 = &unk_1EE5E17B8;
  }
  else {
    int v7 = &unk_1EE5E17A0;
  }
  if (v6)
  {
    uint64_t v8 = v6;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke_1061;
    void v10[3] = &unk_1E57B3B20;
    void v10[5] = v11;
    void v10[6] = v8;
    v10[4] = v7;
    dispatch_sync(figConfigurationQueue, v10);
    _Block_object_dispose(v11, 8);
    CFRelease(v8);
  }
  else
  {
    [(AVPlayer *)self _setPendingFigPlayerProperty:v7 forKey:*MEMORY[0x1E4F34310]];
  }
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 553) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport___setSilencesOtherPlaybackDuringPIP___block_invoke_1061(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34310], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)mxSessionID
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__5;
  int v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVPlayer_AVPlayerPIPSupport__mxSessionID__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  BOOL v3 = (NSNumber *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__AVPlayer_AVPlayerPIPSupport__mxSessionID__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 560);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundPIPAuthorizationToken:(id)a3
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AVPlayer_AVPlayerPIPSupport__setBackgroundPIPAuthorizationToken___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a3;
  void block[6] = &v6;
  void block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v7 + 24)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"AVPlayerBackgroundPIPAuthorizationTokenDidChangeNotification", self, 0);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __67__AVPlayer_AVPlayerPIPSupport__setBackgroundPIPAuthorizationToken___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 608) isEqualToString:*(void *)(a1 + 40)] ^ 1;
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 608) = result;
  return result;
}

- (void)setActiveVideoTargetsForInterstitials:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  uint64_t v6 = 0;
  BOOL v7 = v3 == 0;
  if (v3) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = self;
  }
  char v9 = 0;
  if (!v7) {
    uint64_t v5 = self;
  }
  if (v5 && v8)
  {
    uint64_t v6 = (void *)[(NSArray *)[(AVPlayer *)v5 videoTargets] copy];
    char v9 = (void *)[(NSArray *)[(AVPlayer *)v8 videoTargets] copy];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * v13);
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v15) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = *(void (**)(uint64_t, void))(v16 + 80);
        if (v17) {
          v17(v14, 0);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v9);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * v21);
        uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v23) {
          uint64_t v24 = v23;
        }
        else {
          uint64_t v24 = 0;
        }
        char v25 = *(void (**)(uint64_t, uint64_t))(v24 + 80);
        if (v25) {
          v25(v22, 1);
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }
}

- (OpaqueFigVideoTarget)_interstitialVideoTargetForPrimaryVideoTarget:(OpaqueFigVideoTarget *)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke;
  block[3] = &unk_1E57B3B20;
  void block[4] = self;
  void block[5] = &v12;
  void block[6] = a3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  uint64_t v6 = (void *)v13[3];
  if (!v6)
  {
    FigVideoTargetCreateSharingVideoReceiverFromVideoTarget();
    if (v13[3])
    {
      BOOL v7 = self->_player->ivarAccessQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke_2;
      void v10[3] = &unk_1E57B3A60;
      v10[4] = self;
      void v10[5] = &v12;
      void v10[6] = a3;
      av_readwrite_dispatch_queue_write(v7, v10);
      uint64_t v6 = (void *)v13[3];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  uint64_t v8 = v6;
  _Block_object_dispose(&v12, 8);
  return v8;
}

const void *__81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke(uint64_t a1)
{
  uint64_t result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 576), *(const void **)(a1 + 48));
  if (result) {
    uint64_t result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __81__AVPlayer_FigVideoTargetSupport___interstitialVideoTargetForPrimaryVideoTarget___block_invoke_2(uint64_t a1)
{
}

- (void)_updateVideoTargetOnFigPlayer:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(AVPlayer *)self _copyFigPlayer];
  uint64_t v8 = *MEMORY[0x1E4F34418];
  if (v7)
  {
    char v9 = v7;
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, id))(v12 + 56);
    if (v14) {
      v14(FigBaseObject, v8, a3);
    }
    if (v4)
    {
      CFTypeRef cf = 0;
      uint64_t v15 = FigPlayerGetFigBaseObject();
      uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v16) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      uint64_t v18 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v17 + 48);
      if (v18)
      {
        v18(v15, *MEMORY[0x1E4F343D0], *MEMORY[0x1E4F1CF80], &cf);
        if (cf) {
          CFRelease(cf);
        }
      }
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F34418];
    [(AVPlayer *)self _setPendingFigPlayerProperty:a3 forKey:v13];
  }
}

- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVPlayer_FigVideoTargetSupport__addVideoTarget___block_invoke;
  block[3] = &unk_1E57B3B20;
  void block[4] = self;
  void block[5] = &v12;
  void block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (!*((unsigned char *)v13 + 24)) {
    [(AVPlayer *)self _updateVideoTargetOnFigPlayer:[(AVPlayer *)self videoTargets] synchronously:0];
  }
  id v6 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v6)
  {
    BOOL v7 = [(AVPlayer *)self _interstitialVideoTargetForPrimaryVideoTarget:a3];
    if (v7)
    {
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = *(void (**)(OpaqueFigVideoTarget *, void))(v9 + 80);
      if (v10) {
        v10(v7, 0);
      }
      [v6 addVideoTarget:v7];
      if ([(NSString *)[(AVPlayer *)self reasonForWaitingToPlay] isEqualToString:@"AVPlayerWaitingDuringInterstitialEventReason"])
      {
        [(AVPlayer *)self setActiveVideoTargetsForInterstitials:1];
      }
    }
  }
  _Block_object_dispose(&v12, 8);
}

void __50__AVPlayer_FigVideoTargetSupport__addVideoTarget___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[4] + 8) + 568) containsObject:a1[6]];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v2 = (id)[*(id *)(*(void *)(a1[4] + 8) + 568) arrayByAddingObject:a1[6]];

    *(void *)(*(void *)(a1[4] + 8) + 568) = v2;
  }
}

- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3
{
}

- (void)setShouldWaitForVideoTarget:(BOOL)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figConfigurationQueue = self->_player->figConfigurationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke_2;
  v6[3] = &unk_1E57B1E80;
  v6[4] = self;
  dispatch_sync(figConfigurationQueue, v6);
}

uint64_t __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 584) = *(unsigned char *)(result + 40);
  return result;
}

void __63__AVPlayer_FigVideoTargetSupport__setShouldWaitForVideoTarget___block_invoke_2(uint64_t a1)
{
  id v2 = (const void *)[*(id *)(a1 + 32) _copyFigPlayer];
  int v3 = [*(id *)(a1 + 32) shouldWaitForVideoTarget];
  BOOL v4 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    BOOL v4 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  if (v2)
  {
    uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
    if (v11) {
      v11(FigBaseObject, *MEMORY[0x1E4F343B0], v5);
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *MEMORY[0x1E4F343B0];
    [v9 _setPendingFigPlayerProperty:v5 forKey:v10];
  }
}

- (void)removeVideoTarget:(OpaqueFigVideoTarget *)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke;
  block[3] = &unk_1E57B3B20;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((unsigned char *)v14 + 24)) {
    [(AVPlayer *)self _updateVideoTargetOnFigPlayer:[(AVPlayer *)self videoTargets] synchronously:v4];
  }
  id v8 = [(AVPlayer *)self _interstitialPlayerIfCreated];
  if (v8)
  {
    uint64_t v9 = [(AVPlayer *)self _interstitialVideoTargetForPrimaryVideoTarget:a3];
    if (v9)
    {
      [v8 removeVideoTarget:v9];
      uint64_t v10 = self->_player->ivarAccessQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke_2;
      void v11[3] = &unk_1E57B2228;
      v11[4] = self;
      void v11[5] = a3;
      av_readwrite_dispatch_queue_write(v10, v11);
    }
  }
  _Block_object_dispose(&v13, 8);
}

void __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[4] + 8) + 568) containsObject:a1[6]];
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v2 = (void *)[*(id *)(*(void *)(a1[4] + 8) + 568) mutableCopy];
    [v2 removeObject:a1[6]];

    *(void *)(*(void *)(a1[4] + 8) + 568) = v2;
  }
}

void __76__AVPlayer_FigVideoTargetSupport_Internal__removeVideoTarget_synchronously___block_invoke_2(uint64_t a1)
{
}

- (NSArray)taggedBufferOutputs
{
  int v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__AVPlayer_AVPlayerTaggedBufferOutputSupport__taggedBufferOutputs__block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = self;
  void v6[5] = v3;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v6);
  return v3;
}

uint64_t __66__AVPlayer_AVPlayerTaggedBufferOutputSupport__taggedBufferOutputs__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 648)) {
    return objc_msgSend(*(id *)(result + 40), "addObject:");
  }
  return result;
}

- (void)setVideoOutput:(id)a3 withOwningTaggedBufferOutput:(id)a4
{
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3052000000;
  v25[3] = __Block_byref_object_copy__5;
  v25[4] = __Block_byref_object_dispose__5;
  void v25[5] = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  uint64_t v24 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke;
  block[3] = &unk_1E57B3B68;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = v25;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  configurationQueue = self->_player->configurationQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke_2;
  v17[3] = &unk_1E57B3B90;
  v17[4] = self;
  void v17[5] = a3;
  v17[6] = v25;
  v17[7] = &v19;
  v17[8] = &v26;
  dispatch_sync(configurationQueue, v17);
  if (*((unsigned char *)v27 + 24))
  {
    uint64_t v14 = (__CFString *)v20[5];
    if (!v14)
    {
      uint64_t v14 = @"AVPlayerVideoOutput can only attach to a single AVPlayer at a time";
      v20[5] = @"AVPlayerVideoOutput can only attach to a single AVPlayer at a time";
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v14, v9, v10, v11, v12, v13, v16), 0);
    objc_exception_throw(v15);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);
}

void __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 640);
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 648);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 640) = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 648) = *(id *)(a1 + 48);
}

uint64_t __91__AVPlayer_AVPlayerTaggedBufferOutputSupport__setVideoOutput_withOwningTaggedBufferOutput___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoOutput"), "isEqual:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) & 1) == 0)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "_detachFromPlayer:", *(void *)(a1 + 32)); {

  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoOutput"), "isEqual:", *(void *)(a1 + 40));
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) _attachToPlayer:*(void *)(a1 + 32) exceptionReason:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    char v3 = result ^ 1;
    if (!*(void *)(a1 + 40)) {
      char v3 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  return result;
}

- (void)addTaggedBufferOutput:(id)a3
{
  if ([(AVPlayer *)self videoOutput]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Currently only one video output is supported at a time" userInfo:0]);
  }
  uint64_t v5 = [a3 realOutput];
  [(AVPlayer *)self setVideoOutput:v5 withOwningTaggedBufferOutput:a3];
}

- (void)removeTaggedBufferOutput:(id)a3
{
  if (-[AVPlayerVideoOutput isEqual:](-[AVPlayer videoOutput](self, "videoOutput"), "isEqual:", [a3 realOutput]))
  {
    [(AVPlayer *)self setVideoOutput:0 withOwningTaggedBufferOutput:0];
  }
}

- (AVPlayerVideoOutput)videoOutput
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__AVPlayer_AVPlayerOutputSupport__videoOutput__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (AVPlayerVideoOutput *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __46__AVPlayer_AVPlayerOutputSupport__videoOutput__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 640);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setVideoOutput:(id)a3
{
}

- (id)_weakReferenceToPrimaryPlayer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__AVPlayer_AVPlayerInterstitialSupport_Internal___weakReferenceToPrimaryPlayer__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  char v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __79__AVPlayer_AVPlayerInterstitialSupport_Internal___weakReferenceToPrimaryPlayer__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 256);
  return result;
}

- (void)_setInterstitialEventCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialEventCoordinator___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  void v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __83__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialEventCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(void *)(a1 + 40));
}

- (void)_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  [(AVPlayer *)self _removeListenersFromInterstitialCoordinator:self->_player->interstitialEventCoordinator];
  player = self->_player;
  interstitialEventCoordinator = player->interstitialEventCoordinator;
  player->interstitialEventCoordinator = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (interstitialEventCoordinator) {
    CFRelease(interstitialEventCoordinator);
  }
  [(AVPlayer *)self _addListenersToInterstitialCoordinator:a3];
}

- (void)_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AVPlayer *)self _items_invokeOnIvarAccessQueue];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * v8) _copyIntegratedTimelineIfCreated];
        [v9 _attachCoordinator:a3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialEventCoordinatorEnsuringItIsRemote:(BOOL)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  v13[3] = (uint64_t)v5;
  id v6 = [(AVPlayer *)self interstitialPlayer];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __102__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialEventCoordinatorEnsuringItIsRemote___block_invoke;
  void v10[3] = &unk_1E57B3C08;
  BOOL v11 = a3;
  void v10[5] = v6;
  void v10[6] = &v12;
  v10[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v10);
  uint64_t v8 = (OpaqueFigPlayerInterstitialCoordinator *)v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __102__AVPlayer_AVPlayerInterstitialSupport_Internal___copyInterstitialEventCoordinatorEnsuringItIsRemote___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    if (FigPlayerInterstitialCoordinatorIsRemote())
    {
      CFTypeRef v2 = 0;
    }
    else
    {
      char v3 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v3) {
        CFTypeRef v2 = CFRetain(v3);
      }
      else {
        CFTypeRef v2 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", 0);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        FigPlayerInterstitialRemoteCoordinatorCreate();
        objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
        objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
        if (!v2) {
          return;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 556))
  {
    FigPlayerInterstitialCoordinatorCreate();
    objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinator_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_setInterstitialEventCoordinatorOnItemsIntegratedTimeline_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    if (!v2) {
      return;
    }
    goto LABEL_16;
  }
LABEL_15:
  if (!v2) {
    return;
  }
LABEL_16:
  CFRelease(v2);
}

- (OpaqueFigPlayerInterstitialCoordinator)_copyInterstitialCoordinator
{
  return [(AVPlayer *)self _copyInterstitialEventCoordinatorEnsuringItIsRemote:0];
}

- (void)_setInterstitialPlayer:(id)a3
{
  if (![(AVPlayer *)self _isInterstitialPlayer])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    ivarAccessQueue = self->_player->ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialPlayer___block_invoke;
    block[3] = &unk_1E57B21B0;
    void block[4] = self;
    void block[5] = a3;
    void block[6] = &v8;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    if (*((unsigned char *)v9 + 24))
    {
      id v6 = [(AVPlayer *)self _copyInterstitialEventCoordinatorEnsuringItIsRemote:1];
      if (v6) {
        CFRelease(v6);
      }
    }
    [(AVPlayer *)self _linkAndSyncAudioSessionWithInterstitialPlayer:[(AVPlayer *)self _interstitialPlayerIfCreated]];
    _Block_object_dispose(&v8, 8);
  }
}

uint64_t __73__AVPlayer_AVPlayerInterstitialSupport_Internal___setInterstitialPlayer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setInterstitialPlayerGuts_invokeOnIvarAccessQueue:", *(void *)(a1 + 40));
  uint64_t result = FigPlayerInterstitialCoordinatorIsRemote();
  if (!result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_noteRemoteInterstitialEvents:(id)a3 forItem:(id)a4
{
  uint64_t v5 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  if (v5)
  {
    id v6 = v5;
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      uint64_t v7 = [(AVPlayer *)self _copyInterstitialEventCoordinatorEnsuringItIsRemote:1];
      CFRelease(v6);
      id v6 = v7;
    }
    if (FigPlayerInterstitialCoordinatorIsRemote()) {
      FigPlayerInterstitialRemoteCoordinatorSetEvents();
    }
    CFRelease(v6);
  }
}

- (void)_noteCurrentRemoteInterstitialEvent:(id)a3
{
  id v4 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  if (v4)
  {
    uint64_t v5 = v4;
    if (!FigPlayerInterstitialCoordinatorIsRemote())
    {
      id v6 = [(AVPlayer *)self _copyInterstitialEventCoordinatorEnsuringItIsRemote:1];
      CFRelease(v5);
      uint64_t v5 = v6;
    }
    if (FigPlayerInterstitialCoordinatorIsRemote()) {
      FigPlayerInterstitialRemoteCoordinatorSetCurrentEvent();
    }
    CFRelease(v5);
  }
}

- (int64_t)externalPlaybackInterstitialSchedulingStrategy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__AVPlayer_AVPlayerInterstitialSupport_Internal__externalPlaybackInterstitialSchedulingStrategy__block_invoke;
  v5[3] = &unk_1E57B2110;
  void v5[4] = self;
  void v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __96__AVPlayer_AVPlayerInterstitialSupport_Internal__externalPlaybackInterstitialSchedulingStrategy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 272);
  return result;
}

- (void)_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &self->_player->externalPlaybackInterstitialSchedulingStrategy);
  if (a3)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v6 = v5 ? v5 : 0;
    uint64_t v7 = *(void (**)(OpaqueFigPlayerInterstitialCoordinator *, void, CFNumberRef))(v6 + 56);
    if (v7) {
      v7(a3, *MEMORY[0x1E4F33F18], v4);
    }
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)setExternalPlaybackInterstitialSchedulingStrategy:(int64_t)a3
{
  uint64_t v5 = [(AVPlayer *)self _copyInterstitialCoordinatorIfCreated];
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__AVPlayer_AVPlayerInterstitialSupport_Internal__setExternalPlaybackInterstitialSchedulingStrategy___block_invoke;
  block[3] = &unk_1E57B36D0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t __100__AVPlayer_AVPlayerInterstitialSupport_Internal__setExternalPlaybackInterstitialSchedulingStrategy___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 272) = *(void *)(result + 40);
  if (*(void *)(result + 48)) {
    return objc_msgSend(*(id *)(result + 32), "_setExternalPlaybackInterstitialSchedulingStrategyOnCoordinator_invokeOnIvarAccessQueue:");
  }
  return result;
}

- (void)setAllowsLegibleFallbackForAllAudibleMediaSelections:(BOOL)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke;
  block[3] = &unk_1E57B20E8;
  void block[4] = self;
  BOOL v12 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  if (v5)
  {
    uint64_t v6 = v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke_2;
    v8[3] = &unk_1E57B3B20;
    void v8[5] = v9;
    void v8[6] = v6;
    v8[4] = self;
    dispatch_sync(figConfigurationQueue, v8);
    _Block_object_dispose(v9, 8);
    CFRelease(v6);
  }
}

uint64_t __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 745) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __90__AVPlayer_AVPlayerLegibleFallback__setAllowsLegibleFallbackForAllAudibleMediaSelections___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) allowsLegibleFallbackForAllAudibleMediaSelections]) {
    CFTypeRef v2 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFTypeRef v2 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F34180], *v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setLegibleFallbackMediaSelectionCriteria:(id)a3
{
  ivarAccessQueue = self->_player->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke;
  block[3] = &unk_1E57B2098;
  void block[4] = a3;
  void block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  uint64_t v5 = [(AVPlayer *)self _copyFigPlayer];
  if (v5)
  {
    uint64_t v6 = v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    figConfigurationQueue = self->_player->figConfigurationQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke_2;
    v8[3] = &unk_1E57B3B20;
    void v8[5] = v9;
    void v8[6] = v6;
    v8[4] = self;
    dispatch_sync(figConfigurationQueue, v8);
    _Block_object_dispose(v9, 8);
    CFRelease(v6);
  }
}

void __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 752) = *(void *)(a1 + 32);
}

uint64_t __78__AVPlayer_AVPlayerLegibleFallback__setLegibleFallbackMediaSelectionCriteria___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "legibleFallbackMediaSelectionCriteria"), "figDictionary");
  uint64_t FigBaseObject = FigPlayerGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 56);
  if (v6) {
    uint64_t result = v6(FigBaseObject, *MEMORY[0x1E4F342B0], v2);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDefunct
{
  char v9 = 0;
  uint64_t v2 = [(AVPlayer *)self _copyFigPlayer];
  if (v2)
  {
    int64_t v3 = v2;
    uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    if (*v5 < 5uLL
      || (uint64_t v6 = (uint64_t (*)(OpaqueFigPlayer *, char *))v5[11]) == 0
      || (int v7 = v6(v3, &v9), !v9) && v7)
    {
      char v9 = 1;
    }
    CFRelease(v3);
    LOBYTE(v2) = v9 == 1;
  }
  return (char)v2;
}

- (void)setSupportsSpeedRamps:(BOOL)a3
{
  player = self->_player;
  if (!player->needsToCreateFigPlayer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set supportsSpeedRamps after the AVPlayer has begun preparing for playback." userInfo:0]);
  }
  ivarAccessQueue = player->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVPlayer_AVPlayerSpeedRamp__setSupportsSpeedRamps___block_invoke;
  v5[3] = &unk_1E57B20E8;
  void v5[4] = self;
  BOOL v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
}

uint64_t __53__AVPlayer_AVPlayerSpeedRamp__setSupportsSpeedRamps___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 410) = *(unsigned char *)(result + 40);
  return result;
}

@end